import 'dart:async';

import 'package:pomodoist/data/repositories/settings/language_repository.dart';
import 'package:pomodoist/data/services/local/preferences_service.dart';
import 'package:pomodoist/domain/models/settings/app_language.dart';
import 'package:pomodoist/utils/result.dart';

/// [language] is the current snapshot; [watch] delivers later updates. The
/// owner calls [dispose] to close the source stream.
class LocalLanguageRepository implements LanguageRepository {
  LocalLanguageRepository(this._preferences, {AppLanguage? linked}) {
    ready = _load(linked);
  }
  final PreferencesService _preferences;
  @override
  late final Future<Result<void>> ready;
  final _languages = StreamController<AppLanguage>.broadcast(sync: true);
  AppLanguage _language = AppLanguage.zh;
  @override
  AppLanguage get language => _language;
  @override
  Stream<AppLanguage> watch() => _languages.stream;
  bool _edited = false;
  bool _disposed = false;
  Future<Result<void>> _load(AppLanguage? linked) => Result.capture(() async {
    final values = (await _preferences.read([
      appLanguagePreferenceKey,
      appLanguageChineseMigrationKey,
    ])).getOrThrow();
    if (_disposed || _edited) return;
    final migrated = values[appLanguageChineseMigrationKey] == true;
    final stored = AppLanguage.fromStorageValue(
      values[appLanguagePreferenceKey] as String?,
    );
    _language = linked ?? (migrated ? stored : AppLanguage.zh);
    _languages.add(_language);
    if (!migrated || linked != null) {
      (await _preferences.write({
        appLanguagePreferenceKey: _language.storageValue,
        appLanguageChineseMigrationKey: true,
      })).getOrThrow();
    }
  });
  @override
  Future<Result<void>> setLanguage(AppLanguage value) async {
    if (_disposed) return const Result.ok(null);
    _edited = true;
    _language = value;
    _languages.add(value);
    return _preferences.write({
      appLanguagePreferenceKey: value.storageValue,
      appLanguageChineseMigrationKey: true,
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _languages.close();
  }
}
