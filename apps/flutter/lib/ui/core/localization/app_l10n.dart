import 'package:flutter/widgets.dart';
import 'package:pomodoist/ui/core/localization/app_localizations.dart';
import 'package:pomodoist/ui/core/localization/app_localizations_en.dart';

import 'package:pomodoist/domain/models/settings/app_shortcut.dart';

/// Localized labels introduced by the local mobile/focus surfaces.
///
/// The checked-in generated localization files predate these selectively
/// adopted upstream keys. Keeping the additions as an extension lets the
/// current source compile until the pinned Flutter SDK regenerates the
/// outputs, while preserving the Chinese default in this branch.
extension AppL10nUpstreamAdditions on AppLocalizations {
  bool get _isChinese => localeName.startsWith('zh');

  String get calendarRhythm => _isChinese ? '节奏' : 'Rhythm';

  String get calendarCollapseMonth => _isChinese ? '收起月份' : 'Collapse month';

  String get calendarExpandMonth => _isChinese ? '显示月份' : 'Show month';

  String get focusSessionDisplay => _isChinese ? '会话显示' : 'Session display';

  String get focusSessionCompact => _isChinese ? '紧凑' : 'Compact';

  String get focusSessionIcons => _isChinese ? '图标' : 'Icons';

  String focusNextInterval(String phase, String duration) =>
      _isChinese ? '下一阶段：$phase · $duration' : 'Next: $phase · $duration';

  String get settingsBottomNavigation => _isChinese ? '底部导航' : 'Bottom navigation';

  String get settingsBottomNavigationDescription => _isChinese
      ? '选择最多五个栏目、排列顺序和导航样式。设置保存在本设备上。'
      : 'Choose up to five sections, their order, and the navigation style. Saved on this device.';

  String get settingsBottomNavigationSoft => _isChinese ? '柔和强调' : 'Soft accent';

  String get settingsBottomNavigationLabels => _isChinese ? '显示文字' : 'With labels';

  String get settingsBottomNavigationPreview => _isChinese ? '预览' : 'Preview';

  String get settingsBottomNavigationEmpty => _isChinese
      ? '底部面板已隐藏。所有栏目和这些设置仍可从顶部菜单访问。'
      : 'The bottom panel is hidden. All sections and these settings remain available from the top menu.';

  String settingsBottomNavigationCount(int count, int max) => _isChinese
      ? '已选 $count/$max 个栏目'
      : '$count of $max sections';

  String get settingsBottomNavigationEarlier => _isChinese ? '上移' : 'Move earlier';

  String get settingsBottomNavigationLater => _isChinese ? '下移' : 'Move later';

  String get settingsBottomNavigationAdd => _isChinese ? '添加栏目' : 'Add a section';

  String get settingsBottomNavigationClear => _isChinese ? '全部移除' : 'Remove all';

  String get settingsBottomNavigationDefaults => _isChinese ? '使用默认设置' : 'Use defaults';

  String get settingsBottomNavigationLoadError => _isChinese
      ? '无法加载导航设置，请重试。'
      : 'Could not load navigation settings. Please try again.';

  String get settingsBottomNavigationEdit => _isChinese ? '自定义' : 'Customize';

  String get settingsBottomNavigationRemove => _isChinese ? '移除' : 'Remove';
}

extension AppL10nContext on BuildContext {
  AppLocalizations get l10n =>
      Localizations.of<AppLocalizations>(this, AppLocalizations) ??
      AppLocalizationsEn();
}

String appShortcutLabel(AppLocalizations l10n, AppShortcutCommand command) =>
    switch (command) {
      AppShortcutCommand.toggleSidebar => l10n.settingsShortcutsToggleSidebar,
      AppShortcutCommand.quickAdd => l10n.addTask,
      AppShortcutCommand.browse => l10n.navBrowse,
      AppShortcutCommand.search => l10n.navSearch,
      AppShortcutCommand.today => l10n.navToday,
      AppShortcutCommand.upcoming => l10n.navUpcoming,
      AppShortcutCommand.focus => l10n.navFocus,
      AppShortcutCommand.inbox => l10n.navInbox,
      AppShortcutCommand.priorityMatrix => l10n.navPriorityMatrix,
      AppShortcutCommand.calendar => l10n.navCalendar,
      AppShortcutCommand.timeline => l10n.navTimeline,
      AppShortcutCommand.kanban => l10n.navKanban,
      AppShortcutCommand.reports => l10n.navReports,
      AppShortcutCommand.settings => l10n.navSettings,
    };
