import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const appLanguagePreferenceKey = 'app.language';
const appLanguageChineseMigrationKey = 'app.language.chineseDefault.v1';

enum AppLanguage {
  system(null, 'System default'),
  en(Locale('en'), 'English'),
  ru(Locale('ru'), 'Русский'),
  de(Locale('de'), 'Deutsch'),
  es(Locale('es'), 'Español'),
  fr(Locale('fr'), 'Français'),
  ar(Locale('ar'), 'العربية'),
  zh(Locale('zh'), '简体中文');

  const AppLanguage(this.locale, this.nativeName);

  final Locale? locale;
  final String nativeName;

  String get storageValue => name;

  static AppLanguage fromStorageValue(String? value) {
    return AppLanguage.values.firstWhere(
      (language) => language.storageValue == value,
      orElse: () => AppLanguage.zh,
    );
  }
}

final appLanguageProvider =
    NotifierProvider<AppLanguageController, AppLanguage>(
      AppLanguageController.new,
    );

class AppLanguageController extends Notifier<AppLanguage> {
  Future<void>? _load;
  Future<void> _writes = Future<void>.value();
  bool _hasLocalSelection = false;

  Future<void> get ready => _load ?? Future<void>.value();

  @override
  AppLanguage build() {
    _load ??= _loadStoredLanguage();
    return AppLanguage.zh;
  }

  Future<void> setLanguage(AppLanguage language) async {
    _hasLocalSelection = true;
    if (state != language) {
      state = language;
    }
    await _persist(language);
  }

  Future<void> _persist(AppLanguage language) {
    return _writes = _writes.catchError((Object _) {}).then((_) async {
      final prefs = await SharedPreferences.getInstance();
      if (!await prefs.setString(appLanguagePreferenceKey, language.storageValue)) {
        throw StateError('Could not save language');
      }
      if (!await prefs.setBool(appLanguageChineseMigrationKey, true)) {
        throw StateError('Could not save language migration');
      }
    });
  }

  Future<void> _loadStoredLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!ref.mounted || _hasLocalSelection) return;
      final migrated = prefs.getBool(appLanguageChineseMigrationKey) ?? false;
      final stored = migrated
          ? AppLanguage.fromStorageValue(prefs.getString(appLanguagePreferenceKey))
          : AppLanguage.zh;
      if (!migrated) await _persist(stored);
      if (ref.mounted && !_hasLocalSelection) state = stored;
    } catch (_) {
      // Keep Chinese for this session; retry an unfinished migration next launch.
    }
  }
}
