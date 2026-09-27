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

  String billingOfferDays(int count) => _isChinese
      ? '$count 天'
      : '$count ${count == 1 ? 'day' : 'days'}';

  String billingOfferMonths(int count) => _isChinese
      ? '$count 个月'
      : '$count ${count == 1 ? 'month' : 'months'}';

  String billingOfferYears(int count) => _isChinese
      ? '$count 年'
      : '$count ${count == 1 ? 'year' : 'years'}';

  String billingTrialFree(String duration) => _isChinese
      ? '免费试用 $duration'
      : 'Free for $duration';

  String get billingReturnFailed => _isChinese
      ? '无法验证回归优惠。请重试以检查折扣。'
      : 'Could not verify your return offer. Retry to check the discount.';

  String billingReturnPending(String date) => _isChinese
      ? '你的优惠已保留至 $date。如果取消了购买，可在此时间之后重试。'
      : 'Your discount is reserved until $date. If the purchase was cancelled, '
          'you can retry after that time.';

  String billingTrialRenewal(String price) => _isChinese
      ? '之后为 $price。除非取消，否则将自动续订。'
      : 'Then $price. Renews automatically unless cancelled.';

  String billingReturnSubtitle(String duration, String price) => _isChinese
      ? '优惠持续 $duration，之后为 $price。除非取消，否则将自动续订。'
      : 'For $duration, then $price. Renews automatically unless cancelled.';

  String get billingReturnBadge => _isChinese ? '重返 Pro' : 'Return to Pro';

  String get billingTryFree => _isChinese ? '免费试用' : 'Try free';
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
