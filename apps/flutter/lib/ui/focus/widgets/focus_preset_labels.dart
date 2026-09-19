import 'package:pomodoist/data/services/local/database/app_database.dart'
    show defaultPresetId, deepWorkPresetId, shortSprintPresetId, flowPresetId;
import 'package:pomodoist/ui/core/localization/app_localizations.dart';
import 'package:pomodoist/domain/models/focus/focus_models.dart';

/// Translate only untouched built-in names, never user-authored names.
String focusPresetLabel(AppLocalizations l10n, FocusPresetItem preset) {
  return switch ((preset.id, preset.name)) {
    (defaultPresetId, 'Classic') => l10n.focusPresetClassic,
    (deepWorkPresetId, 'Deep Work') => l10n.focusPresetDeepWork,
    (shortSprintPresetId, 'Short Sprint') => l10n.focusPresetShortSprint,
    (flowPresetId, 'Flow') => l10n.focusPresetFlow,
    _ => preset.name,
  };
}
