import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:yaml/yaml.dart';

void main() {
  const desktopWorkflows = {
    '../../.github/workflows/linux-appimage-release.yml': 'build-test-publish',
    '../../.github/workflows/windows-exe-preview.yml': 'build-test',
  };
  for (final entry in desktopWorkflows.entries) {
    test('${entry.key} prepares stable and RC versions before pub get', () {
      final steps = _job(entry.key, entry.value)['steps'] as YamlList;
      final versionIndex = steps.indexWhere(
        (step) => step['name'] == 'Prepare application version',
      );
      expect(versionIndex, greaterThanOrEqualTo(0));
      final pubGetIndex = steps.indexWhere(
        (step) => _resolvesDependencies(step['run'] as String? ?? ''),
      );
      expect(pubGetIndex, greaterThanOrEqualTo(0));
      expect(versionIndex, lessThan(pubGetIndex));
      // The Flutter build and .dart_tool paths are symlinks into the ignored
      // repository-root build directory, so a fresh checkout has to recreate
      // them before pub get; make linux-pub-get and the Windows entry scripts
      // both link first.
      final linkIndex = steps.indexWhere(
        (step) => _linksFlutterBuild(step),
      );
      expect(
        linkIndex,
        inInclusiveRange(0, pubGetIndex),
        reason: 'link step not before pub get in ${entry.key}: $steps',
      );
      final script = steps[versionIndex]['run'] as String;
      final tagAware = entry.key.contains('linux-appimage');
      for (final (tag, newline) in [
        ('v1.0.3', '\n'),
        ('v1.0.3-rc.1', '\n'),
        ('main', '\n'),
        ('v1.0.3-rc.1', '\r\n'),
        ('main', '\r\n'),
      ]) {
        final temp = Directory.systemTemp.createTempSync('desktop-version-');
        try {
          final pubspec = File('${temp.path}/apps/flutter/pubspec.yaml')
            ..createSync(recursive: true)
            ..writeAsStringSync(
              'name: pomodoist${newline}version: 0.9.0+91$newline',
            );
          final result = _bash(script, temp, {
            'GITHUB_REF_TYPE': tag == 'main' ? 'branch' : 'tag',
            'GITHUB_REF_NAME': tag,
          });
          expect(result.exitCode, 0, reason: '${result.stderr}');
          final expected = tagAware
              ? (tag == 'main' ? '0.9.0' : tag.substring(1))
              : '0.9.0';
          final expectedNewline = tagAware && tag != 'main' ? '\n' : newline;
          expect(
            pubspec.readAsStringSync(),
            'name: pomodoist${expectedNewline}version: $expected+91$expectedNewline',
          );
          expect(
            File('${temp.path}/env').readAsLinesSync(),
            contains('POMODOIST_VERSION=$expected'),
          );
          expect(
            File('${temp.path}/output').readAsLinesSync(),
            contains('version=$expected'),
          );
        } finally {
          temp.deleteSync(recursive: true);
        }
      }
      if (tagAware) {
        for (final tag in [
          '1.0.3',
          'v1.0',
          'v1.0.3-beta.1',
          'v1.0.3-rc.',
          'v1.0.3-rc.01',
          'v01.0.3',
          'v1.0.3+4',
          'v1.0.3-rc.1/extra',
        ]) {
          final temp = Directory.systemTemp.createTempSync('desktop-invalid-');
          try {
            final pubspec = File('${temp.path}/apps/flutter/pubspec.yaml')
              ..createSync(recursive: true)
              ..writeAsStringSync('version: 0.9.0+91\n');
            final result = _bash(script, temp, {
              'GITHUB_REF_TYPE': 'tag',
              'GITHUB_REF_NAME': tag,
            });
            expect(result.exitCode, isNot(0), reason: tag);
            expect(pubspec.readAsStringSync(), 'version: 0.9.0+91\n');
          } finally {
            temp.deleteSync(recursive: true);
          }
        }
      }
    });
  }

  test('desktop release publication matches the fork delivery policy', () {
    final linuxPublish = ( _job(
      '../../.github/workflows/linux-appimage-release.yml',
      'build-test-publish',
    )['steps'] as YamlList).cast<YamlMap>().singleWhere(
      (step) => step['name'] == 'Upload AppImage and publish complete desktop release',
    );
    final linuxScript = linuxPublish['run'] as String;
    expect(linuxPublish['if'], "github.ref_type == 'tag' && matrix.flavor == 'production'");
    expect(linuxScript, contains('required_assets=('));
    expect(linuxScript, contains('Pomodoist-x86_64.AppImage'));
    expect(linuxScript, contains('Pomodoist-Setup.exe'));
    expect(linuxScript, contains('--field draft=false'));

    final windows = _job('../../.github/workflows/windows-exe-preview.yml', 'publish');
    final windowsPublish = (windows['steps'] as YamlList).cast<YamlMap>().singleWhere(
      (step) => step['name'] == 'Publish manual GitHub pre-release',
    );
    final windowsScript = windowsPublish['run'] as String;
    expect(windowsScript, contains('chinese-preview-'));
    expect(windowsScript, contains('gh release create'));
    expect(windowsScript, contains('--prerelease'));
    expect(windowsScript, contains('Pomodoist-Setup.exe'));
    expect(windowsScript, isNot(contains('required_assets=(')));

    final android = _job(
      '../../.github/workflows/android-release.yml',
      'signed-apk-and-bundle',
    );
    expect(
      (android['steps'] as YamlList).cast<YamlMap>().where(
        (step) => (step['run'] as String? ?? '').contains('gh release'),
      ),
      isEmpty,
    );
  });

  test('Linux trusts the resolved SDK and checkout before running Flutter', () {
    final steps =
        _job(
              '../../.github/workflows/linux-appimage-release.yml',
              'build-test-publish',
            )['steps']
            as YamlList;
    final trustIndex = steps.indexWhere(
      (step) =>
          step['name'] ==
          'Trust Flutter SDK and checkout in the Linux container',
    );
    expect(
      trustIndex,
      greaterThan(
        steps.indexWhere(
          (step) => (step['uses'] as String? ?? '').startsWith(
            'subosito/flutter-action@',
          ),
        ),
      ),
    );
    expect(
      trustIndex,
      lessThan(
        steps.indexWhere(
          (step) => _resolvesDependencies(step['run'] as String? ?? ''),
        ),
      ),
    );
    final temp = Directory.systemTemp.createTempSync('flutter-sdk-');
    try {
      final sdk = Directory('${temp.path}/sdk with spaces')..createSync();
      Directory('${sdk.path}/bin').createSync();
      final flutter = File('${sdk.path}/bin/flutter')
        ..writeAsStringSync('#!/bin/sh\nexit 0\n');
      Process.runSync('chmod', ['+x', flutter.path]);
      final bin = Directory('${temp.path}/bin')..createSync();
      Link('${bin.path}/flutter').createSync(flutter.path);
      final config = '${temp.path}/gitconfig';
      final result = _bash(steps[trustIndex]['run'] as String, temp, {
        'PATH': '${bin.path}:${Platform.environment['PATH']}',
        'GIT_CONFIG_GLOBAL': config,
        'GITHUB_WORKSPACE': temp.path,
      });
      expect(result.exitCode, 0, reason: '${result.stderr}');
      final trusted = Process.runSync('git', [
        'config',
        '--file',
        config,
        '--get-all',
        'safe.directory',
      ]);
      expect(trusted.stdout.toString().trim().split('\n'), [
        sdk.resolveSymbolicLinksSync(),
        temp.path,
      ]);
    } finally {
      temp.deleteSync(recursive: true);
    }
  });

  for (final path in [
    '../../.github/workflows/android-release.yml',
    '../../.github/workflows/linux-appimage-release.yml',
    '../../.github/workflows/validate.yml',
    '../../.github/workflows/windows-exe-preview.yml',
  ]) {
    test('$path is valid YAML', () {
      final document = loadYaml(File(path).readAsStringSync());

      expect(document, isA<YamlMap>());
      expect((document as YamlMap)['jobs'], isA<YamlMap>());
    });
  }

  test('desktop release workflows keep tag and Chinese preview delivery separate', () {
    final linux = File(
      '../../.github/workflows/linux-appimage-release.yml',
    ).readAsStringSync();
    expect(linux, contains("- 'v*.*.*'"));
    expect(linux, contains(r'group: desktop-release-${{ github.ref }}'));
    expect(linux, contains('required_assets=('));
    expect(linux, contains('Pomodoist-x86_64.AppImage'));
    expect(linux, contains('Pomodoist-Setup.exe'));

    final windows = File(
      '../../.github/workflows/windows-exe-preview.yml',
    ).readAsStringSync();
    expect(windows, contains('workflow_dispatch:'));
    expect(windows, contains("- 'chinese'"));
    expect(windows, isNot(contains("- 'v*.*.*'")));
    expect(windows, contains('chinese-preview-'));
    expect(windows, isNot(contains('Pomodoist-Android.apk')));
  });

  test('desktop release workflows do not depend on SignPath', () {
    for (final path in [
      '../../.github/workflows/linux-appimage-release.yml',
      '../../.github/workflows/windows-exe-preview.yml',
    ]) {
      expect(
        File(path).readAsStringSync().toLowerCase(),
        isNot(contains('signpath')),
        reason: path,
      );
    }
  });

  test('desktop workflows verify artifacts without launching them', () {
    final linux = File(
      '../../.github/workflows/linux-appimage-release.yml',
    ).readAsStringSync();
    final windows = File(
      '../../.github/workflows/windows-exe-preview.yml',
    ).readAsStringSync();
    expect(linux, contains('sha256sum --check'));
    expect(linux, isNot(contains('--appimage-extract')));
    expect(linux, isNot(contains('APP_RUN')));
    expect(windows, contains('Get-FileHash'));
    expect(windows, contains('FileVersionInfo'));
    expect(windows, isNot(contains('smoke.ps1')));
  });

  test('Linux CI uses the validated local AppImage build contract', () {
    final document =
        loadYaml(
              File(
                '../../.github/workflows/linux-appimage-release.yml',
              ).readAsStringSync(),
            )
            as YamlMap;
    final jobs = document['jobs'] as YamlMap;
    final build = jobs['build-test-publish'] as YamlMap;
    final steps = build['steps'] as YamlList;
    final buildStep = steps.cast<YamlMap>().singleWhere(
      (step) => step['name'] == 'Build production AppImage',
    );
    final command = buildStep['run'] as String;

    expect(command, contains('make linux-appimage'));
    expect(
      command,
      contains('LINUX_CONFIG="\$RUNNER_TEMP/linux-production.json"'),
    );
    expect(command, contains('POMODOIST_RELEASE="\$GITHUB_SHA"'));
  });

  test('Windows EXE build isolates production build from publishing', () {
    final document =
        loadYaml(
              File(
                '../../.github/workflows/windows-exe-preview.yml',
              ).readAsStringSync(),
            )
            as YamlMap;
    final jobs = document['jobs'] as YamlMap;

    expect(
      jobs.keys,
      containsAll(<String>['validate-ref', 'build-test', 'publish']),
    );

    final validateRef = jobs['validate-ref'] as YamlMap;
    expect((validateRef['permissions'] as YamlMap)['contents'], 'read');

    final build = jobs['build-test'] as YamlMap;
    expect(build['needs'], 'validate-ref');
    expect(build['environment'], 'windows-preview');
    expect((build['permissions'] as YamlMap)['contents'], 'read');
    expect(build.containsKey('env'), isFalse);

    final buildSteps = build['steps'] as YamlList;
    final installInnoStep = buildSteps.cast<YamlMap>().singleWhere(
      (step) => step['name'] == 'Install Inno Setup 6.7.1',
    );
    final installInnoScript = installInnoStep['run'] as String;
    expect(installInnoScript, isNot(contains('VersionInfo.ProductVersion')));
    expect(installInnoScript, contains('Get-FileHash'));
    expect(
      installInnoScript,
      contains(
        'EB6F4410C8DB367A5F74127E8025AD2CCACC0AFABBE783959D237DF3050F97FB',
      ),
    );

    final publish = jobs['publish'] as YamlMap;
    expect(publish['needs'], 'build-test');
    expect(publish['environment'], 'windows-preview');
    expect((publish['permissions'] as YamlMap)['contents'], 'write');
  });

  test('Android release builds signed artifacts and gates the tag', () {
    final document =
        loadYaml(
              File(
                '../../.github/workflows/android-release.yml',
              ).readAsStringSync(),
            )
            as YamlMap;
    expect((document['permissions'] as YamlMap)['contents'], 'read');
    expect(
      (document['concurrency'] as YamlMap)['group'],
      r'android-release-${{ github.ref }}',
    );

    final jobs = document['jobs'] as YamlMap;
    final job = jobs['signed-apk-and-bundle'] as YamlMap;

    final steps = (job['steps'] as YamlList).cast<YamlMap>();
    final gate = steps.singleWhere(
      (step) => step['name'] == 'Require a reviewed main commit and valid version',
    );
    final gateScript = gate['run'] as String;
    expect(gateScript, contains('git merge-base --is-ancestor'));
    expect(gateScript, contains(r'^v[0-9]+\.[0-9]+\.[0-9]+'));
    final build = steps.singleWhere(
      (step) => step['name'] == 'Build and verify production APK and AAB',
    );
    expect(build['run'], contains('bash tool/android/build_release.sh'));
    expect(build['run'], contains('ANDROID_SIGNING_CERT_SHA256'));

    final bundle = (job['steps'] as YamlList).cast<YamlMap>().singleWhere(
      (step) => step['name'] == 'Save signed release artifacts',
    );
    final artifact = bundle['with'] as YamlMap;
    expect(artifact['name'], r'pomodoist-android-${{ github.sha }}');
    expect(artifact['path'], 'apps/flutter/build/android/release/');
    expect(artifact['retention-days'], 30);
  });

  test('Chinese Windows preview stays local and manual', () {
    final workflow = File(
      '../../.github/workflows/windows-exe-preview.yml',
    ).readAsStringSync();
    expect(workflow, contains("- 'chinese'"));
    expect(workflow, contains('POMODOIST_ENVIRONMENT=local'));
    expect(workflow, contains('No local subscription requirements or purchase offers'));
    expect(workflow, isNot(contains('POMODOIST_REGISTRATION_URL')));
  });
}

YamlMap _job(String path, String name) =>
    (loadYaml(File(path).readAsStringSync())['jobs'] as YamlMap)[name]
        as YamlMap;

/// Matches every step that resolves Dart dependencies, whether it calls
/// Flutter directly or goes through a Make target that wraps pub get.
bool _resolvesDependencies(String run) =>
    run.contains('flutter pub get') ||
    run.contains('linux-pub-get') ||
    run.contains('pub_get_with_retry');

/// The Flutter project keeps build/ and .dart_tool as symlinks into the
/// ignored repository-root build directory, so every entry point has to
/// recreate them before Flutter runs.
bool _linksFlutterBuild(YamlMap step) {
  final run = step['run'] as String? ?? '';
  if (run.contains('flutter-build-link') ||
      run.contains('linux-pub-get') ||
      run.contains('link-build.sh')) {
    return true;
  }
  final uses = step['uses'] as String? ?? '';
  if (uses.contains('link-build.ps1')) {
    return true;
  }
  // The Windows workflow runs its linking script through `shell: powershell`.
  return run.contains('link-build.ps1');
}

ProcessResult _bash(
  String script,
  Directory directory,
  Map<String, String> env,
) => Process.runSync(
  'bash',
  ['-euo', 'pipefail', '-c', script],
  workingDirectory: directory.path,
  environment: {
    ...env,
    'GITHUB_ENV': '${directory.path}/env',
    'GITHUB_OUTPUT': '${directory.path}/output',
  },
);

// Execute the real publication scripts; generation is tested in Python.
// ignore: unused_element
const _fakeGh = r'''
python3() {
  echo generate-notes >> gh.log
  echo 'Generated release notes'
}
gh() {
  [[ "$GH_REPO" == example/pomodoist ]] || return 128
  printf '%s\n' "$*" >> gh.log
  case "$1 $2" in
    'release view') [[ -f release-exists ]] ;;
    'release create') touch release-exists ;;
    'release upload')
      [[ "${LEGACY_GH:-false}" != true ]] || return 22
      shift 3
      for asset in "$@"; do
        [[ "$asset" == --clobber ]] || basename "$asset" >> assets
      done
      ;;
    'api --method')
      if [[ "$3" == POST && "$4" == */releases ]]; then
        touch release-exists
        echo 123
      elif [[ "$3" == POST && "$4" == https://uploads.github.com/* ]]; then
        echo "${4##*name=}" >> assets
      elif [[ "$3" == DELETE ]]; then
        sed -i.bak "/^${4##*/}$/d" assets
      fi
      ;;
    api*)
      # GitHub's by-tag endpoint excludes draft releases.
      if [[ "$2" == */releases/tags/* ]]; then
        return 22
      elif [[ "$2" == */assets ]]; then
        if [[ "$*" == *'| .id'* ]]; then
          name=$(printf '%s' "${@: -1}" | sed -n 's/.*== "\(.*\)").*/\1/p')
          [[ ! -f assets ]] || grep -Fx "$name" assets || true
        else
          cat assets
        fi
      else
        [[ ! -f release-exists ]] || echo 123
      fi
      ;;
    *) return 64 ;;
  esac
}
''';
