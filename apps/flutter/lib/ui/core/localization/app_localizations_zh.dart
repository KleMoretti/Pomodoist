// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get settingsSectionGeneral => '常规';

  @override
  String get settingsSectionAppearance => '外观';

  @override
  String get settingsSectionTasksFocus => '任务与专注';

  @override
  String get settingsSectionIntegrations => '服务与数据';

  @override
  String get settingsSectionAccount => '账户与 Pro';

  @override
  String get settingsThemeColorsTab => '颜色';

  @override
  String get settingsThemeBackgroundsTab => '背景';

  @override
  String get settingsRefreshAccount => '刷新账户';

  @override
  String get settingsSubscriptionActions => '管理订阅';

  @override
  String get settingsSubscriptionError => '暂时无法获取订阅状态，已开通的权益不受影响。';

  @override
  String get settingsVersionError => '暂时无法获取版本信息。';

  @override
  String get appTitle => 'pomodoist';

  @override
  String get commonAdd => '添加';

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '保存';

  @override
  String get commonDelete => '删除';

  @override
  String get commonUndo => '撤销';

  @override
  String get commonOpen => '打开';

  @override
  String get commonBack => '返回';

  @override
  String get commonClose => '关闭';

  @override
  String get commonCreate => '创建';

  @override
  String get commonClear => '清除';

  @override
  String get commonStop => '停止';

  @override
  String get skip => '跳过';

  @override
  String get onboardingLanguageTitle => '选择语言';

  @override
  String get onboardingLanguageSubtitle => '选择你习惯使用的语言。';

  @override
  String get onboardingTimerTitle => '选择计时器样式';

  @override
  String get onboardingTimerSubtitle => '选择你喜欢的番茄钟显示方式。';

  @override
  String get onboardingPaywallTitle => '解锁 Pomodoist';

  @override
  String get onboardingPaywallSubtitle => '终身优惠每周开放 24 小时。';

  @override
  String get onboardingAccountTitle => '创建账户';

  @override
  String get onboardingAccountSubtitle => '登录后可在设备间同步任务、专注历史和设置。';

  @override
  String get startupPreparingTasks => '正在准备你的任务';

  @override
  String get operationTakingLonger => '处理时间有些长，请再等一会儿。';

  @override
  String get onboardingContinue => '继续';

  @override
  String get onboardingMaybeLater => '稍后再说';

  @override
  String get onboardingFinish => '完成';

  @override
  String get billingTitle => 'Pomodoist Pro';

  @override
  String get billingSubtitle => '用自然语言口述任务，Pomodoist 会把你的语音变成任务。任务历史会永久保存。';

  @override
  String get billingSubtitleHighlight => '自然语言';

  @override
  String get billingCancelAnytime => '可随时取消。';

  @override
  String get billingMonthlyTitle => '按月订阅';

  @override
  String get billingAnnualTitle => '按年订阅';

  @override
  String billingPricePerMonth(String price) {
    return '$price/月';
  }

  @override
  String billingPricePerYear(String price) {
    return '$price/年';
  }

  @override
  String billingMonthlyIntroSubtitle(String price) {
    return '前 3 个月，之后为 $price。';
  }

  @override
  String billingAnnualIntroSubtitle(String price) {
    return '之后为 $price。';
  }

  @override
  String get billingLifetimeTitle => '终身使用';

  @override
  String get billingLifetimeSubtitle => '一次付费，永久使用。';

  @override
  String get billingBestValue => '最划算';

  @override
  String get billingChoose => '选择';

  @override
  String get billingActive => 'Pomodoist Pro 已在此设备上激活。';

  @override
  String get billingActiveShort => '已激活';

  @override
  String get billingRestore => '恢复购买';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get termsOfUse => '使用条款';

  @override
  String get support => '支持';

  @override
  String get billingManageLink => '通过 Link 管理';

  @override
  String get billingExternalBrowserTitle => '付款将在浏览器中打开';

  @override
  String get billingExternalBrowserMessage =>
      'Pomodoist 将在 Safari 或默认浏览器中打开 Stripe Checkout。请允许打开浏览器窗口以继续。';

  @override
  String get billingAppleOnly => '可在 iPhone、iPad 和 Mac 上购买。';

  @override
  String get billingStoreUnavailable => 'App Store 当前不可用。';

  @override
  String get billingStoreConnectionFailed => '请关闭 VPN 后重试。';

  @override
  String billingPurchaseError(String error) {
    return '购买错误：$error';
  }

  @override
  String get billingStripeAuthenticationRequired => '请登录 Pomodoist 后重试。';

  @override
  String get billingStripeDisabled => '付款功能尚未开放。请稍后重试。';

  @override
  String get billingStripeAlreadyEntitled => '你已开通 Pomodoist Pro，请刷新账户状态。';

  @override
  String get billingStripeOfferExpired => '此优惠已过期。请选择其他可用方案。';

  @override
  String get billingStripeManagedPaymentsUnavailable =>
      'Stripe 付款暂时不可用。请稍后重试或联系支持。';

  @override
  String get billingStripeCheckoutFailed => '无法开始付款。请检查网络连接后重试。';

  @override
  String get purchaseSuccessTitle => 'Pro 已激活';

  @override
  String get purchaseSuccessMessage => '感谢支持 Pomodoist。所有 Pro 功能现在都可以使用。';

  @override
  String get purchaseSuccessContinue => '继续';

  @override
  String get purchaseProcessingTitle => '付款处理中';

  @override
  String get purchaseProcessingMessage => '正在确认付款。如权益未及时生效，请稍后刷新账户状态。';

  @override
  String get purchaseOpenApp => '打开 Pomodoist';

  @override
  String launchOfferEndsIn(String time) {
    return '$time 后终身优惠结束';
  }

  @override
  String get accountApple => 'Apple';

  @override
  String get accountGoogle => 'Google';

  @override
  String get accountEmail => '邮箱';

  @override
  String get loginTitle => '登录 Pomodoist';

  @override
  String get accountChecking => '正在获取账户信息';

  @override
  String get oauthConsentTitle => '连接智能体';

  @override
  String get oauthConsentLoading => '正在检查连接请求';

  @override
  String get oauthConsentInvalidAuthorization => '连接请求无效或不完整，请重新发起。';

  @override
  String get oauthConsentLoadError => '无法加载连接请求。';

  @override
  String get oauthConsentActionError => '无法完成请求，请重试。';

  @override
  String get oauthConsentRedirectError => '返回地址缺失或不安全，已取消授权。';

  @override
  String get oauthConsentClientFallback => '智能体';

  @override
  String oauthConsentClientRequest(String clientName) {
    return '$clientName 请求访问你的 Pomodoist 数据';
  }

  @override
  String get oauthConsentRedirectOrigin => '返回地址';

  @override
  String get oauthConsentCapabilitiesTitle => '此智能体可以';

  @override
  String get oauthConsentManagePlanning => '读取和管理任务、项目、自定义标签与看板。';

  @override
  String get oauthConsentReadInsights => '读取已完成的专注历史、效率报告与成就。';

  @override
  String get oauthConsentUnavailableTitle => '此智能体不能';

  @override
  String get oauthConsentUnavailable => '访问你的账户或账单、Google 日历或正在运行的专注计时器。';

  @override
  String get oauthConsentUnsupportedScopes => '此请求包含不支持的访问权限，无法授权。';

  @override
  String get oauthConsentApprove => '允许';

  @override
  String get oauthConsentDeny => '拒绝';

  @override
  String get oauthConsentApproving => '正在授权…';

  @override
  String get oauthConsentDenying => '正在拒绝请求…';

  @override
  String get oauthConsentRedirecting => '正在返回智能体…';

  @override
  String get loginCreateAccountPrompt => '还没有账户？';

  @override
  String get loginCreateAccountAction => '创建账户';

  @override
  String get registerTitle => '创建账户';

  @override
  String get registerSubtitle => '在设备间同步任务、专注历史和设置。';

  @override
  String get registerPassword => '密码';

  @override
  String get registerSubmit => '创建账户';

  @override
  String get registerSignInPrompt => '已有账户？';

  @override
  String get registerSignInAction => '登录';

  @override
  String get registerCheckEmailTitle => '查看你的邮箱';

  @override
  String get registerCheckEmailMessage =>
      '如果此邮箱需要验证，你将收到一封包含验证链接的邮件。如果已有账户，请登录或重置密码。';

  @override
  String registerError(Object error) {
    return '无法创建账户：$error';
  }

  @override
  String get authEmailSignInTitle => '使用邮箱登录';

  @override
  String get authWelcomeTitle => '登录 Pomodoist';

  @override
  String get authWelcomeDescription => '随时查看任务和专注记录，多台设备同步更新。';

  @override
  String get authSignInWithLink => '通过邮件链接登录';

  @override
  String get authForgotPassword => '忘记密码？';

  @override
  String get authBackToSignIn => '返回登录';

  @override
  String get authNoAccount => '还没有账户？';

  @override
  String get authHaveAccount => '已有账户？';

  @override
  String get authShowPassword => '显示密码';

  @override
  String get authHidePassword => '隐藏密码';

  @override
  String get authResetTitle => '重置密码';

  @override
  String get authResetDescription => '输入账户邮箱。我们会发送更改密码的链接。';

  @override
  String get authResetEmailSentTitle => '查看你的邮箱';

  @override
  String get authResetEmailSent => '如果此邮箱对应的账户存在，你将收到密码重置链接。';

  @override
  String get authResetSendAgain => '重新发送';

  @override
  String get authResetEditEmail => '更改邮箱';

  @override
  String get authNewPasswordTitle => '设置新密码';

  @override
  String get authNewPasswordDescription => '建议使用未在其他账户上用过的密码。';

  @override
  String get authNewPassword => '新密码';

  @override
  String get authConfirmPassword => '再次输入密码';

  @override
  String get authSavePassword => '保存密码';

  @override
  String get authPasswordMismatch => '两次输入的密码不一致。';

  @override
  String get authPasswordUnchanged => '新密码不能与当前密码相同。';

  @override
  String get authPasswordUpdatedTitle => '密码已更新';

  @override
  String get authPasswordUpdatedMessage => '新密码已保存。你可以继续使用 Pomodoist。';

  @override
  String get authResetLinkExpired => '此密码重置链接无效或已过期。请申请新链接。';

  @override
  String get authUnexpectedReset => '无法发送密码重置邮件。请重试。';

  @override
  String get authUnexpectedPasswordUpdate => '无法保存新密码。请重试。';

  @override
  String get authCheckingResetLink => '正在检查密码重置链接…';

  @override
  String get authSignInAction => '登录';

  @override
  String get authSendLink => '发送链接';

  @override
  String get authMagicLinkSent => '如果此邮箱已有账户，你将收到登录链接。请检查收件箱和垃圾邮件文件夹。';

  @override
  String get authAccountCreated => '账户已创建。';

  @override
  String get authSignedIn => '已登录。';

  @override
  String get authEmailRequired => '请输入邮箱。';

  @override
  String get authEmailInvalid => '请检查邮箱地址，例如 name@example.com。';

  @override
  String get authPasswordRequired => '请输入密码。';

  @override
  String get authInvalidCredentials => '邮箱或密码不正确。请检查邮箱地址、重置密码或创建账户。';

  @override
  String get authEmailUnconfirmed => '请使用我们发送的链接确认邮箱，然后重新登录。';

  @override
  String get authWeakPassword => '此密码太容易被猜到。请使用更长、更难预测的密码。';

  @override
  String get authAccountMayExist => '此邮箱可能已有关联账户。请登录或重置密码。';

  @override
  String get authRateLimited => '操作过于频繁，请稍等几分钟再试。';

  @override
  String get authEmailRateLimited => '邮件发送过于频繁，请稍等几分钟再试。';

  @override
  String get authOffline => '无法连接账户服务。请检查网络连接后重试。';

  @override
  String get authTimeout => '账户服务响应时间过长。请重试。';

  @override
  String get authServiceUnavailable => '账户服务暂时不可用。请稍后重试。';

  @override
  String get authCaptchaRequired => '请完成安全验证以继续。';

  @override
  String get authCaptchaExpired => '安全验证已过期。请重新完成验证。';

  @override
  String get authCaptchaFailed => '安全验证失败。请重新验证。';

  @override
  String get authCaptchaCancelled => '安全验证已取消。请重新开始以继续。';

  @override
  String get authCaptchaUnavailable => '安全验证暂时不可用。请检查网络后重试。';

  @override
  String get authCaptchaOpenFailed => 'Pomodoist 无法在浏览器中打开安全验证。请检查默认浏览器后重试。';

  @override
  String get authProviderFallback => '此服务商';

  @override
  String authProviderUnavailable(String provider) {
    return '暂时无法使用 $provider 登录。请重试或使用其他方式。';
  }

  @override
  String authProviderUnavailableHere(String provider) {
    return '此处无法使用 $provider 登录。请使用其他登录方式。';
  }

  @override
  String get authSignUpDisabled => '暂时无法使用邮箱创建账户。请使用其他登录方式。';

  @override
  String get authAccountRestricted => '此账户暂时无法登录。如有疑问，请联系支持。';

  @override
  String get authLinkExpired => '此登录链接无效或已过期。请申请新链接。';

  @override
  String get authUnexpectedSignIn => '无法登录。请重试。';

  @override
  String get authUnexpectedSignUp => '无法创建账户。请重试。';

  @override
  String get authUnexpectedMagicLink => '无法发送登录链接。请重试。';

  @override
  String get authResendConfirmation => '重新发送验证邮件';

  @override
  String get authConfirmationSendFailed => '无法发送验证邮件。请稍后重试。';

  @override
  String get authRetryVerification => '重新验证';

  @override
  String get captchaSecurityLabel => '安全验证';

  @override
  String get captchaChallengeTitle => 'Pomodoist 安全验证';

  @override
  String get captchaChallengePrompt => '请完成人机验证，继续使用 Pomodoist。';

  @override
  String get captchaChallengeInvalid => '此安全验证链接无效。请返回 Pomodoist 后重试。';

  @override
  String get captchaChallengeHandoffHelp =>
      '如果 Pomodoist 未打开，请使用下方按钮。如果尚未安装应用，请关闭此页面并返回开始操作的设备。';

  @override
  String get captchaReturnToApp => '返回 Pomodoist';

  @override
  String get navSearch => '搜索';

  @override
  String get navInbox => '收件箱';

  @override
  String get navPriorityMatrix => '优先级矩阵';

  @override
  String get navCalendar => '日历';

  @override
  String get calendarSubtitle => '规划一天，也为生活留出空间。';

  @override
  String get calendarDay => '日';

  @override
  String get calendarWeek => '周';

  @override
  String get calendarMonth => '月';

  @override
  String get calendarRoutine => '日程';

  @override
  String get calendarOverview => '当日概览';

  @override
  String get calendarOpenMonth => '打开月视图';

  @override
  String get calendarUnscheduled => '未安排时间';

  @override
  String get calendarAllProjects => '所有项目';

  @override
  String get calendarRoutineDefault => '我平常的一天';

  @override
  String get calendarRoutineDescription => '任务按开始时间分组。请根据自己的日程调整时间段。';

  @override
  String get calendarEditRoutine => '设置时间段';

  @override
  String get calendarRoutineTitle => '你的每日安排';

  @override
  String get calendarRoutineName => '日程名称';

  @override
  String get calendarPeriodName => '时间段名称';

  @override
  String get calendarAddPeriod => '添加时间段';

  @override
  String get calendarRemovePeriod => '删除时间段';

  @override
  String get calendarPeriodStart => '从';

  @override
  String get calendarPeriodEnd => '至';

  @override
  String get calendarRoutineInvalid => '请为日程和时间段命名。结束时间必须晚于开始时间，时间段不能重叠。';

  @override
  String get calendarOutsideRoutine => '日程时间段之外';

  @override
  String get calendarFreeTime => '空闲时间';

  @override
  String get calendarMorning => '早晨';

  @override
  String get calendarAfternoon => '下午';

  @override
  String get calendarEvening => '晚上';

  @override
  String get calendarNewPeriod => '新时间段';

  @override
  String get calendarResize => '调整任务时长';

  @override
  String get calendarPreviousPeriod => '上一时间段';

  @override
  String get calendarNextPeriod => '下一时间段';

  @override
  String get calendarSaveFailed => '无法保存日历设置';

  @override
  String get calendarNoActiveFocus => '没有进行中的专注会话';

  @override
  String get calendarCurrentTask => '当前任务';

  @override
  String get navTimeline => '时间轴';

  @override
  String get navKanban => '看板';

  @override
  String get kanbanTitle => '看板';

  @override
  String get kanbanSubtitle => '按进度整理任务，清楚掌握每件事的状态。';

  @override
  String get kanbanDefaultBacklog => '待整理';

  @override
  String get kanbanDefaultTodo => '待办';

  @override
  String get kanbanDefaultInProgress => '进行中';

  @override
  String get kanbanDefaultDone => '已完成';

  @override
  String get kanbanSearchTooltip => '搜索看板';

  @override
  String get kanbanSearchHint => '搜索任务或项目';

  @override
  String get kanbanHideDone => '隐藏已完成';

  @override
  String get kanbanShowDone => '显示已完成';

  @override
  String get kanbanProjectsTitle => '看板显示的项目';

  @override
  String kanbanAddToStatus(String status) {
    return '添加到“$status”';
  }

  @override
  String get kanbanTaskField => '任务';

  @override
  String get kanbanProjectField => '项目';

  @override
  String get kanbanChooseProject => '请选择项目。';

  @override
  String get kanbanTaskActions => '任务操作';

  @override
  String get kanbanDragTask => '拖动任务';

  @override
  String kanbanMoveTo(String status) {
    return '移至“$status”';
  }

  @override
  String get kanbanRestoreBeforeFocus => '请先将任务恢复为未完成，再开始专注。';

  @override
  String kanbanCouldNotStartFocus(Object error) {
    return '无法开始专注：$error';
  }

  @override
  String kanbanCouldNotLoad(Object error) {
    return '无法加载看板：$error';
  }

  @override
  String get commonRetry => '重试';

  @override
  String get commonContinueWaiting => '继续等待';

  @override
  String kanbanTasksCount(int count) {
    return '$count 个任务';
  }

  @override
  String kanbanSubtasksProgress(int completed, int total) {
    return '子任务 $completed/$total';
  }

  @override
  String kanbanFocusIntervalsProgress(int completed, int total) {
    return '已专注 $completed/$total 轮';
  }

  @override
  String get kanbanActive => '进行中';

  @override
  String kanbanPriority(int priority) {
    return '优先级 $priority';
  }

  @override
  String kanbanMoveAnnouncement(String status) {
    return '已移至“$status”';
  }

  @override
  String kanbanFocusStartedAnnouncement(String task) {
    return '已开始专注：“$task”';
  }

  @override
  String get kanbanNoTasks => '暂无任务';

  @override
  String get navToday => '今天';

  @override
  String get navUpcoming => '后续计划';

  @override
  String get navBrowse => '概览';

  @override
  String get navIntegrations => '关联服务';

  @override
  String get navReports => '统计';

  @override
  String get navFocus => '专注';

  @override
  String get navProjects => '项目';

  @override
  String get navSettings => '设置';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsAboutTitle => '关于';

  @override
  String get settingsFocusCompletionCelebrationTitle => '专注完成动效';

  @override
  String get settingsFocusCompletionCelebrationSubtitle =>
      '完成全部专注和最后一次休息后，显示全屏庆祝动画。';

  @override
  String get settingsVersionLabel => '版本';

  @override
  String get settingsPlanLabel => '方案';

  @override
  String get settingsPlanFree => '免费';

  @override
  String get settingsPlanPro => 'Pomodoist Pro';

  @override
  String get settingsShortcutsTitle => '键盘快捷键';

  @override
  String get settingsShortcutsSubtitle => '设置使用键盘操作 Pomodoist 的快捷键。';

  @override
  String get settingsShortcutsToggleSidebar => '显示或隐藏侧边栏';

  @override
  String get settingsShortcutsGlobalQuickAdd => '全局快速添加';

  @override
  String get settingsShortcutsGlobalQuickAddSubtitle =>
      '无需切换到 Pomodoist，即可唤起快速添加。';

  @override
  String get settingsShortcutsRecordTitle => '按下快捷键';

  @override
  String get settingsShortcutsRecordPrompt =>
      '按下包含 Command、Control 或 Alt 的组合键。按 Esc 取消。';

  @override
  String get settingsShortcutsInvalid => '组合键需要包含 Command、Control 或 Alt。';

  @override
  String get settingsShortcutsConflict => '此快捷键已被使用。';

  @override
  String get settingsShortcutsGlobalError => '无法使用这个全局快捷键，仍保留原来的设置。';

  @override
  String get settingsShortcutsResetAll => '全部重置';

  @override
  String get settingsShortcutsResetDone => '键盘快捷键已重置。';

  @override
  String get csvImportTitle => '从 CSV 导入任务';

  @override
  String get csvImportSubtitle => '先预览导入内容，确认后再创建任务、项目、标签和看板状态。';

  @override
  String get csvImportSelectFile => '选择 CSV 文件';

  @override
  String get csvImportHumanGuideButton => '导入说明';

  @override
  String get csvImportAgentGuideButton => 'AI 导入规范';

  @override
  String get csvImportHumanGuideTitle => '如何准备 CSV 文件';

  @override
  String get csvImportAgentGuideTitle => '智能体 CSV 规范';

  @override
  String get csvImportCopy => '复制';

  @override
  String get csvImportCopied => '已复制到剪贴板。';

  @override
  String get csvImportPreviewTitle => '检查导入内容';

  @override
  String get csvImportPreviewTasks => '任务';

  @override
  String get csvImportPreviewSubtasks => '子任务';

  @override
  String get csvImportPreviewNewProjects => '新项目';

  @override
  String get csvImportPreviewNewLabels => '新标签';

  @override
  String get csvImportPreviewNewStatuses => '新增看板状态';

  @override
  String get csvImportNone => '无';

  @override
  String get csvImportDuplicateWarning => '再次导入同一文件会创建重复任务。';

  @override
  String get csvImportConfirm => '导入';

  @override
  String get csvImportSuccess => '已导入任务';

  @override
  String get csvImportErrorTitle => 'CSV 导入失败';

  @override
  String get csvImportUnexpectedError => '无法导入该文件。';

  @override
  String get csvImportHumanGuide =>
      '1. 将文件保存为 UTF-8 编码的 CSV。使用逗号（推荐）或分号作为分隔符。\n\n2. content 列为必填。还可使用：key, description, project, labels, priority, due_date, start_at, end_at, time_zone, recurrence, recurrence_interval, deadline, estimate, kanban_status, parent_key。\n\n3. 每行创建一个未完成任务。多个标签用 | 分隔。优先级为 1–4，空值表示 4。项目留空时放入收件箱，状态留空时设为待整理。缺少的项目、标签和未完成状态会自动创建。\n\n4. 全天任务使用 YYYY-MM-DD 格式的 due_date。定时任务需填写带 UTC 偏移的 RFC3339 格式 start_at 和 end_at，并提供 IANA time_zone，例如 Asia/Shanghai。\n\n5. 创建子任务时，为父行设置唯一 key，并在子行的 parent_key 中填写该值。父行可以出现在文件后面。子任务必须与父任务使用同一项目。\n\n6. Pomodoist 会验证整个文件并在导入前显示预览。只要有一行无效，就不会保存任何内容。再次导入会创建重复任务。';

  @override
  String get settingsConnectedAgentsTitle => '已连接的智能体';

  @override
  String get settingsConnectedAgentsLoading => '正在加载已连接的智能体…';

  @override
  String get settingsConnectedAgentsEmpty => '尚未连接智能体。';

  @override
  String get settingsConnectedAgentsLoadError => '无法加载已连接的智能体。';

  @override
  String get settingsConnectedAgentsUnknownClient => '智能体';

  @override
  String settingsConnectedAgentsConnectedOn(String date) {
    return '连接日期：$date';
  }

  @override
  String get settingsConnectedAgentsRevoke => '撤销授权';

  @override
  String get settingsConnectedAgentsRevokeConfirmTitle => '撤销智能体授权？';

  @override
  String settingsConnectedAgentsRevokeConfirmMessage(String clientName) {
    return '撤销 $clientName 对 Pomodoist 的访问权限？';
  }

  @override
  String get settingsConnectedAgentsRevokeError => '无法撤销访问权限，请重试。';

  @override
  String get settingsLanguageTitle => '语言';

  @override
  String get settingsLanguageSubtitle => '选择应用语言。';

  @override
  String get settingsLanguageSystem => '跟随系统';

  @override
  String get settingsVoiceTranscriptionTitle => '语音转文字';

  @override
  String get settingsVoiceTranscriptionSubtitle => '选择录音转文字的处理方式。';

  @override
  String get settingsVoiceTranscriptionSystem => '系统识别（Apple）';

  @override
  String get settingsVoiceTranscriptionCloud => '云端识别';

  @override
  String get settingsVoiceTranscriptionCloudDescription =>
      '录音将上传至 Pomodoist 进行识别，需要联网。';

  @override
  String get settingsVoiceTranscriptionCloudRequiresSignIn =>
      '登录后可使用云端识别，当前将使用系统识别。';

  @override
  String get settingsThemeTitle => '主题';

  @override
  String get settingsThemeSubtitle => '选择应用外观。';

  @override
  String get settingsThemeSystem => '跟随系统';

  @override
  String get settingsThemeLight => '浅色';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsTimerVisualTitle => '番茄钟样式';

  @override
  String get settingsTimerVisualSubtitle => '选择专注页面的计时进度样式。';

  @override
  String get settingsTimerVisualBar => '进度条';

  @override
  String get settingsTimerVisualCircle => '圆环';

  @override
  String get settingsReturnRemindersTitle => '每日提醒';

  @override
  String get settingsReturnRemindersSubtitle => '当天尚未完成任务或专注时，晚上提醒一次。';

  @override
  String get settingsDefaultTimedBlockTitle => '默认任务时长';

  @override
  String get settingsDefaultTimedBlockSubtitle => '添加任务时若只填写开始时间，将按此时长安排结束时间。';

  @override
  String get settingsDefaultTimedBlockCustomLabel => '自定义时长';

  @override
  String get settingsDefaultTimedBlockError => '请输入 1 到 480 分钟。';

  @override
  String get settingsTaskTimeDisplayTitle => '任务时间显示';

  @override
  String get settingsTaskTimeDisplaySubtitle => '选择任务的开始和结束时间如何显示。';

  @override
  String get settingsTaskTimeDisplaySmart => '智能';

  @override
  String get settingsTaskTimeDisplayRange => '开始和结束时间';

  @override
  String get settingsTaskTimeDisplayStartOnly => '仅开始时间';

  @override
  String get taskTimeStatusFuture => '即将开始';

  @override
  String get taskTimeStatusFocused => '正在专注';

  @override
  String get taskTimeStatusCurrent => '进行中';

  @override
  String get taskTimeStatusOverdue => '已逾期';

  @override
  String get taskTimeStatusCompleted => '已完成';

  @override
  String get menuTooltip => '菜单';

  @override
  String get localUser => '本地用户';

  @override
  String get addTask => '添加任务';

  @override
  String get quickAddHint => '整理读书笔记 明天 09:00 #学习 2p';

  @override
  String couldNotAddTask(Object error) {
    return '无法添加任务：$error';
  }

  @override
  String get taskCreateFailed => '无法创建任务。请重试。';

  @override
  String couldNotAddProject(Object error) {
    return '无法添加项目：$error';
  }

  @override
  String tasksCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已添加 $count 个任务',
    );
    return '$_temp0';
  }

  @override
  String get voiceQuickAdd => '语音添加任务';

  @override
  String get voiceTitle => '语音添加';

  @override
  String get voiceRecord => '开始录音';

  @override
  String get voiceAgain => '重新录音';

  @override
  String get voiceStop => '结束录音';

  @override
  String voiceAddCount(int count) {
    return '添加 $count 个任务';
  }

  @override
  String voiceTaskLabel(int index) {
    return '任务 $index';
  }

  @override
  String get voiceRemoveTask => '移除';

  @override
  String get voiceInstruction => '点击录音，说出你要做的事。';

  @override
  String get voiceStatusIdle => '将使用内置麦克风录音';

  @override
  String get voiceStatusRequestingPermission => '正在申请麦克风权限';

  @override
  String get voiceStatusRecording => '正在录音';

  @override
  String get voiceStatusTranscribing => '正在将录音转为文字';

  @override
  String get voiceStatusCanceled => '已取消录音';

  @override
  String get voiceStatusUnsupported => '当前设备暂不支持语音输入';

  @override
  String get voiceStatusError => '无法识别语音';

  @override
  String get voiceStatusAnalyzing => '正在整理任务';

  @override
  String get voiceStatusReview => '确认任务内容后再添加';

  @override
  String get voiceStepRecord => '录音';

  @override
  String get voiceStepText => '识别文字';

  @override
  String get voiceStepAnalyze => '整理任务';

  @override
  String get voiceStepReview => '确认内容';

  @override
  String get voiceAnalyzing => '正在从录音中整理出任务';

  @override
  String get voiceFallbackError => '暂时无法处理这段录音。草稿已保留，你可以手动编辑。';

  @override
  String get voiceMicrophoneUnavailable => '麦克风当前不可用。请结束正在进行的通话或语音聊天，然后重试。';

  @override
  String get voiceSmartMode => '智能模式';

  @override
  String get voiceRetryTranscription => '重新识别';

  @override
  String get voiceRecordingSaved => '录音已保存在本机，可以直接重试，无需重新录音。';

  @override
  String get voiceAllowAccess => '允许访问';

  @override
  String get voiceOpenMicrophoneSettings => '打开麦克风设置';

  @override
  String get voiceOpenSpeechSettings => '打开语音识别设置';

  @override
  String get voiceEnableDictation => '启用听写';

  @override
  String get voiceUseCloudTranscription => '改用云端识别';

  @override
  String get voiceMicrophoneDenied => '请在系统设置中允许访问麦克风。';

  @override
  String get voiceSpeechDenied => '请在系统设置中允许语音识别。';

  @override
  String get voiceAccessRestricted => '管理员或“屏幕使用时间”限制了访问。';

  @override
  String get voiceDictationDisabled => '请在“系统设置 → 键盘 → 听写”中启用听写并选择语言，然后重试。';

  @override
  String get voiceServiceUnavailable =>
      '语音识别暂不可用。请检查网络连接。在 Mac 上，还请检查“系统设置 → 键盘 → 听写”和所选语言。';

  @override
  String get voiceCloudServiceUnavailable => '云端识别失败。请检查网络后，重新识别已保存的录音。';

  @override
  String get voiceLocaleUnsupported => '此设备的系统语音识别不支持所选语言。';

  @override
  String get voiceNetworkUnavailable => '识别此语言需要互联网连接。请联网后重试。';

  @override
  String get voiceSettingsFailed =>
      '无法打开设置。请手动打开系统设置，检查麦克风和语音识别权限。在 Mac 上，还请检查“键盘 → 听写”。';

  @override
  String get voiceRetryAnalysis => '重新整理任务';

  @override
  String get screenInboxSubtitle => '先记下来，稍后再安排。';

  @override
  String get priorityMatrixSubtitle => '拖动任务调整优先级。同一优先级内按日期排序。';

  @override
  String get priorityMatrixP1Title => '立即处理';

  @override
  String get priorityMatrixP2Title => '安排时间';

  @override
  String get priorityMatrixP3Title => '交给他人';

  @override
  String get priorityMatrixP4Title => '暂不处理';

  @override
  String get priorityMatrixAxisUrgent => '紧急';

  @override
  String get priorityMatrixAxisNotUrgent => '不紧急';

  @override
  String get priorityMatrixAxisImportant => '重要';

  @override
  String get priorityMatrixAxisNotImportant => '不重要';

  @override
  String get timelineSubtitle => '把任务安排到合适的时间，规划好每一天。';

  @override
  String get timelineAllDay => '全天';

  @override
  String get timelineBeforeHours => '早于显示时段';

  @override
  String get timelineAfterHours => '晚于显示时段';

  @override
  String get timelineVisibleHours => '显示时段';

  @override
  String get timelineStartHour => '开始时间';

  @override
  String get timelineEndHour => '结束时间';

  @override
  String get timelineZoomOut => '缩小';

  @override
  String get timelineZoomIn => '放大';

  @override
  String timelineAddTimedHint(String time) {
    return '安排在 $time 的任务';
  }

  @override
  String get timelineAddAllDayHint => '全天任务';

  @override
  String get timelineNoAllDayTasks => '没有全天任务';

  @override
  String get timelineNoTimedTasks => '暂无已安排时间的任务';

  @override
  String get timelinePreviousDay => '前一天';

  @override
  String get timelineNextDay => '后一天';

  @override
  String get timelinePickDate => '选择日期';

  @override
  String get upcomingPreviousPeriod => '上一段日期';

  @override
  String get upcomingNextPeriod => '下一段日期';

  @override
  String get upcomingOpenDatePicker => '打开日期选择器';

  @override
  String upcomingTaskCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个任务',
      one: '1 个任务',
      zero: '没有任务',
    );
    return '$_temp0';
  }

  @override
  String screenTodayFocusSummary(int planned, int completed, String focus) {
    return '计划专注 $planned 轮 · 已完成 $completed 轮 · 已专注 $focus';
  }

  @override
  String get screenUpcomingSubtitle => '查看今天之后的任务安排。';

  @override
  String screenUpcomingSelectedSubtitle(String date) {
    return '$date 的任务安排。';
  }

  @override
  String get noTasksHere => '暂无任务';

  @override
  String get noUpcomingTasks => '暂无已安排日期的任务';

  @override
  String get noTasksForDay => '这一天还没有安排任务';

  @override
  String failedToLoadTasks(Object error) {
    return '无法加载任务：$error';
  }

  @override
  String get searchTasks => '搜索任务';

  @override
  String get searchStartTyping => '输入关键词，查找任务';

  @override
  String get searchNoMatches => '没有找到相关任务';

  @override
  String failedToSearchTasks(Object error) {
    return '无法搜索任务：$error';
  }

  @override
  String get previousMonth => '上个月';

  @override
  String get nextMonth => '下个月';

  @override
  String get clearDateFilter => '清除日期筛选';

  @override
  String get weekMon => '一';

  @override
  String get weekTue => '二';

  @override
  String get weekWed => '三';

  @override
  String get weekThu => '四';

  @override
  String get weekFri => '五';

  @override
  String get weekSat => '六';

  @override
  String get weekSun => '日';

  @override
  String get browseTitle => '概览';

  @override
  String get unifiedAccount => '账户信息';

  @override
  String accountUnavailable(Object error) {
    return '账户不可用：$error';
  }

  @override
  String get signOut => '退出登录';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get deleteAccountConfirmation =>
      '这将永久删除你的账户、云端数据，以及本地任务、项目和专注历史记录。此操作无法撤销。应用商店订阅不会自动取消。如果你使用了“通过 Apple 登录”，还需在 Apple 账户设置中单独撤销 Pomodoist 的访问权限。';

  @override
  String get manageSignInWithApple => '管理“通过 Apple 登录”';

  @override
  String get deleteAccountFinalConfirmation => '确定永久删除账户吗？删除后无法恢复。';

  @override
  String deleteAccountError(Object error) {
    return '无法删除账户：$error';
  }

  @override
  String get accountDeleted => '账户已删除。';

  @override
  String get accountDeletedLocalCleanupError =>
      '你的账户已删除，但无法清除本地数据。再次使用此设备前，请先清除应用数据。';

  @override
  String get browseSevenDays => '7 天';

  @override
  String get browseOpenNow => '待完成任务';

  @override
  String get browseQueueLoading => '正在读取待同步的更改…';

  @override
  String get browseQueueUnavailable => '暂时无法读取待同步的更改。';

  @override
  String get browseQueueExplanation => '这里显示尚未上传的本地更改。没有待上传内容，并不表示所有设备都已同步完成。';

  @override
  String get productivityTitle => '效率概览';

  @override
  String get achievementsTitle => '成就';

  @override
  String get allTimeLabel => '累计';

  @override
  String get lastSevenDaysLabel => '最近 7 天';

  @override
  String get noWeeklyStatsLabel => '暂无专注或任务数据';

  @override
  String get completedFocuses => '已完成轮次';

  @override
  String get completedTasks => '已完成任务';

  @override
  String get unlocked => '已解锁';

  @override
  String get locked => '未解锁';

  @override
  String get progressLabel => '进度';

  @override
  String get focusAchievements => '专注成就';

  @override
  String get taskAchievements => '任务成就';

  @override
  String get comboAchievements => '综合成就';

  @override
  String get focusIntervals => '专注轮次';

  @override
  String get focusTime => '专注时长';

  @override
  String get openTasks => '未完成任务';

  @override
  String get plannedIntervals => '计划轮次';

  @override
  String get labelsTitle => '标签';

  @override
  String get newProject => '新项目';

  @override
  String get newLabel => '新标签';

  @override
  String get syncReadyQueue => '待同步更改';

  @override
  String pendingLocalCommands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项更改待同步',
    );
    return '$_temp0';
  }

  @override
  String failedToLoadProjects(Object error) {
    return '无法加载项目：$error';
  }

  @override
  String failedToLoadLabels(Object error) {
    return '无法加载标签：$error';
  }

  @override
  String get addProject => '添加项目';

  @override
  String get projectName => '项目名称';

  @override
  String get addLabel => '添加标签';

  @override
  String get labelName => '标签名称';

  @override
  String couldNotAddLabel(Object error) {
    return '无法添加标签：$error';
  }

  @override
  String projectsUnavailable(Object error) {
    return '项目不可用：$error';
  }

  @override
  String get projectsUnavailableShort => '暂时无法加载项目';

  @override
  String get noProjects => '没有项目';

  @override
  String get searchProjects => '搜索项目';

  @override
  String get searchLabels => '搜索标签';

  @override
  String get archivedProjectsOnly => '仅显示已归档项目';

  @override
  String projectsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个项目',
    );
    return '$_temp0';
  }

  @override
  String get noLabels => '没有标签';

  @override
  String labelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个标签',
    );
    return '$_temp0';
  }

  @override
  String get renameProject => '重命名项目';

  @override
  String get deleteProject => '删除项目';

  @override
  String get deleteLabel => '删除标签';

  @override
  String deleteProjectConfirmation(String name) {
    return '删除“$name”？项目中的任务会移至收件箱。';
  }

  @override
  String deleteLabelConfirmation(String name) {
    return '删除“$name”？';
  }

  @override
  String couldNotDeleteProject(Object error) {
    return '无法删除项目：$error';
  }

  @override
  String couldNotDeleteLabel(Object error) {
    return '无法删除标签：$error';
  }

  @override
  String projectsCountCompact(int count) {
    return '项目：$count';
  }

  @override
  String get collapseProjects => '折叠项目';

  @override
  String get expandProjects => '展开项目';

  @override
  String get projectFallbackTitle => '项目';

  @override
  String get projectSubtitle => '查看和整理这个项目中的任务。';

  @override
  String get reportsTitle => '统计';

  @override
  String get reportsFocusedDay => '今日专注';

  @override
  String get reportsThisWeek => '本周专注';

  @override
  String get reportsNextAchievement => '下一个成就';

  @override
  String get viewAllAchievements => '查看所有成就';

  @override
  String viewAllAchievementsCount(int count) {
    return '查看全部 $count 个';
  }

  @override
  String get allAchievementsUnlocked => '所有成就均已解锁';

  @override
  String get noAchievementsYet => '暂无成就';

  @override
  String failedToLoadAchievements(Object error) {
    return '无法加载成就：$error';
  }

  @override
  String get backToReports => '返回统计';

  @override
  String reportsIntervalProgressSemantics(int completed, int target) {
    return '已完成 $completed 轮专注，目标 $target 轮';
  }

  @override
  String reportsIntervalCountSemantics(int completed) {
    return '已完成 $completed 轮专注，尚未设置目标';
  }

  @override
  String reportsWeeklyChartSemantics(String summary) {
    return '过去 7 天的专注时间：$summary';
  }

  @override
  String failedToLoadReports(Object error) {
    return '无法加载报告：$error';
  }

  @override
  String get taskNotFound => '未找到任务';

  @override
  String get taskTitleHint => '任务标题';

  @override
  String get taskComment => '备注';

  @override
  String get taskCommentHint => '补充说明、想法或相关链接';

  @override
  String get subtasks => '子任务';

  @override
  String get addSubtask => '添加子任务';

  @override
  String get addSubtaskHint => '添加子任务';

  @override
  String get noSubtasks => '还没有子任务。';

  @override
  String get makeParentTask => '取消缩进，设为顶级任务';

  @override
  String couldNotMoveTask(Object error) {
    return '无法移动任务：$error';
  }

  @override
  String get scheduleTitle => '安排时间';

  @override
  String get allDay => '全天';

  @override
  String get timedBlock => '设置起止时间';

  @override
  String get recurrenceStartDate => '开始日期';

  @override
  String get recurrenceEndDate => '结束日期（含当天）';

  @override
  String get recurrenceNoEnd => '不设结束日期';

  @override
  String get recurrenceStop => '停止重复';

  @override
  String get recurrenceInvalidDateRange => '结束日期不能早于开始日期。';

  @override
  String get recurrenceSaveFailed => '保存重复设置失败，请重试。';

  @override
  String get recurrenceDescription =>
      '按设定的日期和频率重复。未打开应用时错过的任务不会补建；停止重复后，已生成的任务仍会保留。';

  @override
  String get recurrenceTitle => '重复';

  @override
  String get recurrenceNeedsSchedule => '请先添加日期或时间，再设置重复。';

  @override
  String get recurrenceIntervalLabel => '每隔';

  @override
  String get recurrenceUnitDay => '天';

  @override
  String get recurrenceUnitWeek => '周';

  @override
  String get recurrenceUnitMonth => '月';

  @override
  String get recurrenceInvalidInterval => '请输入 1 到 999 之间的整数。';

  @override
  String recurrenceEveryDays(int interval) {
    String _temp0 = intl.Intl.pluralLogic(
      interval,
      locale: localeName,
      other: '每 $interval 天',
      one: '每天',
    );
    return '$_temp0';
  }

  @override
  String recurrenceEveryWeeks(int interval) {
    String _temp0 = intl.Intl.pluralLogic(
      interval,
      locale: localeName,
      other: '每 $interval 周',
      one: '每周',
    );
    return '$_temp0';
  }

  @override
  String recurrenceEveryMonths(int interval) {
    String _temp0 = intl.Intl.pluralLogic(
      interval,
      locale: localeName,
      other: '每 $interval 月',
      one: '每月',
    );
    return '$_temp0';
  }

  @override
  String get noDate => '未安排日期';

  @override
  String get calendarNotLinked => '日历未关联';

  @override
  String get calendarLinked => '已关联 Google 日历';

  @override
  String focusProgress(int completed, int total) {
    return '已专注 $completed/$total 轮';
  }

  @override
  String get startFocus => '开始专注';

  @override
  String get focusStarted => '已开始专注';

  @override
  String get taskReopened => '已恢复为未完成';

  @override
  String get taskCompleted => '任务已完成';

  @override
  String get taskDeleted => '任务已删除';

  @override
  String get recurringDeleteTitle => '删除重复任务？';

  @override
  String get recurringDeleteMessage => '这是一个重复任务，要删除哪些次数？';

  @override
  String get recurringDeleteThis => '仅删除本次任务';

  @override
  String get recurringDeleteThisAndFollowing => '删除本次及后续任务';

  @override
  String get markOpen => '标记为未完成';

  @override
  String get markComplete => '标记为完成';

  @override
  String get focusHistory => '专注记录';

  @override
  String failedToLoadTask(Object error) {
    return '无法加载任务：$error';
  }

  @override
  String get noFocusIntervals => '还没有专注记录。';

  @override
  String get today => '今天';

  @override
  String get tomorrow => '明天';

  @override
  String get yesterday => '昨天';

  @override
  String get clearDate => '清除日期';

  @override
  String priority(int priority) {
    return '优先级 $priority';
  }

  @override
  String get focusTitle => '专注';

  @override
  String get focusRoundsUnit => '轮';

  @override
  String get focusPresetClassic => '经典番茄钟';

  @override
  String get focusPresetDeepWork => '深度专注';

  @override
  String get focusPresetShortSprint => '短时冲刺';

  @override
  String get focusPresetFlow => '心流';

  @override
  String focusLoadError(Object error) {
    return '无法加载专注状态：$error';
  }

  @override
  String get focusViewFull => '详细';

  @override
  String get focusViewMinimal => '极简';

  @override
  String get focusSwitchToFullView => '切换到详细模式';

  @override
  String get focusSwitchToMinimalView => '切换到极简模式';

  @override
  String get focusActionFailed => '操作失败，请重试。';

  @override
  String get noActiveSession => '当前没有正在进行的专注';

  @override
  String get focusIdleSubtitle => '可以直接开始专注，也可以从任务列表中选择一项任务开始。';

  @override
  String get noPreset => '未选择方案';

  @override
  String get preparingFocus => '正在准备专注';

  @override
  String get moreFocusOptions => '更多专注选项';

  @override
  String get moreFocusActions => '更多专注操作';

  @override
  String get preset => '专注方案';

  @override
  String get newPreset => '新建方案';

  @override
  String get customize => '自定义';

  @override
  String get customizePreset => '编辑专注方案';

  @override
  String get startInterval => '开始当前阶段';

  @override
  String get intervalStarted => '当前阶段已开始';

  @override
  String get intervalCompleted => '当前阶段已结束';

  @override
  String get focusStopped => '专注已停止';

  @override
  String get focusCompletionTitle => '专注完成！';

  @override
  String get focusCompletionLinkedSubtitle => '这个任务计划的专注轮次已全部完成。';

  @override
  String get focusCompletionStandaloneSubtitle => '本次计划的专注轮次已全部完成。';

  @override
  String get focusCompletionQuestion => '要将这个任务标记为已完成吗？';

  @override
  String get focusCompletionCompleteTask => '完成任务';

  @override
  String get focusCompletionKeepOpen => '暂不完成任务';

  @override
  String get focusCompletionDone => '完成';

  @override
  String get focusCompletionNextTask => '接下来安排的任务';

  @override
  String focusCompletionTaskError(Object error) {
    return '无法完成任务：$error';
  }

  @override
  String get completeInterval => '结束当前阶段';

  @override
  String get logDistraction => '记录一次分心';

  @override
  String get workInterval => '专注时段';

  @override
  String get work => '专注';

  @override
  String get shortBreak => '短休息';

  @override
  String get breakLabel => '休息';

  @override
  String get longBreak => '长休息';

  @override
  String readyLabel(String label) {
    return '准备开始：$label';
  }

  @override
  String get readyShort => '准备开始';

  @override
  String focusTimerTotal(String duration) {
    return '共 $duration';
  }

  @override
  String focusSessionProgress(int current, int total) {
    return '第 $current/$total 轮';
  }

  @override
  String focusRhythmPreviewSummary(int count) {
    return '本次安排，共 $count 个阶段';
  }

  @override
  String focusRhythmSummary(
    int current,
    int total,
    String phase,
    String status,
  ) {
    return '第 $current/$total 个阶段：$phase，$status';
  }

  @override
  String focusTimerSummary(
    String phase,
    String status,
    String remaining,
    String total,
  ) {
    return '$phase，$status，剩余 $remaining，总计 $total';
  }

  @override
  String get focusStatusRunning => '进行中';

  @override
  String get focusStatusPaused => '已暂停';

  @override
  String focusWorkProgress(int completed, int total) {
    return '已专注 $completed/$total 轮';
  }

  @override
  String intervalNumber(int number) {
    return '第 $number 个阶段';
  }

  @override
  String focusIntervalSummary(int completed, int total, int number) {
    return '已专注 $completed/$total 轮 · 第 $number 个阶段';
  }

  @override
  String get pause => '暂停';

  @override
  String get resume => '继续';

  @override
  String get presetForNextIntervals => '后续阶段使用的方案';

  @override
  String usePreset(String name) {
    return '使用 $name';
  }

  @override
  String minutesWork(int minutes) {
    return '专注 $minutes 分钟';
  }

  @override
  String minutesShort(int minutes) {
    return '短休息 $minutes 分钟';
  }

  @override
  String minutesLong(int minutes) {
    return '长休息 $minutes 分钟';
  }

  @override
  String longEvery(int count) {
    return '每 $count 轮专注后长休息';
  }

  @override
  String get autoBreaks => '自动开始休息';

  @override
  String get autoWork => '自动开始专注';

  @override
  String get noPause => '不可暂停';

  @override
  String get focusPauseUnavailable => '当前方案不允许暂停';

  @override
  String get strict => '严格';

  @override
  String get flexible => '灵活';

  @override
  String get name => '名称';

  @override
  String get workField => '专注时长';

  @override
  String get shortField => '短休息时长';

  @override
  String get longField => '长休息时长';

  @override
  String get every => '长休息间隔';

  @override
  String get minutesSuffix => '分钟';

  @override
  String get makeDefault => '设为默认';

  @override
  String get autoStartBreaks => '自动开始休息';

  @override
  String get autoStartWork => '自动开始专注';

  @override
  String get allowPause => '允许暂停';

  @override
  String get strictMode => '严格模式';

  @override
  String get nameRequired => '请输入名称';

  @override
  String get nameMustBeUnique => '这个名称已被使用，请换一个';

  @override
  String get googleCalendarTitle => 'Google 日历';

  @override
  String get googleCalendarConnectedSubtitle => '已开启与 Pomodoist 日历的双向同步。';

  @override
  String get googleCalendarDisconnectedSubtitle => '连接 Google 账户以同步计划任务。';

  @override
  String get googleCalendarConnectedOnAnotherDeviceSubtitle =>
      'Google 日历由另一台设备负责同步，任务数据仍会同步到本机。';

  @override
  String get syncNow => '立即同步';

  @override
  String get useThisDevice => '使用此设备';

  @override
  String get connect => '连接';

  @override
  String get disconnect => '断开连接';

  @override
  String failedToLoadIntegration(Object error) {
    return '无法加载关联服务：$error';
  }

  @override
  String googleCalendarFailed(String message) {
    return 'Google 日历同步失败：$message';
  }

  @override
  String get googleAuthRequired => 'Google 日历授权已失效，请重新登录后点击“立即同步”。';

  @override
  String get googleSignInNotConfigured => '此版本尚未配置 Google 登录，请联系应用维护者。';

  @override
  String get googleCallbackNotConfigured => '此版本尚未配置 Google 登录回调，请联系应用维护者。';

  @override
  String get googleWebButtonFirst => '请先点击 Google 登录按钮，登录后再点击“连接”。';

  @override
  String get googleAccessDenied => 'Google 拒绝了授权。如果应用仍在测试中，请联系维护者将你的账户加入测试名单。';

  @override
  String get status => '状态';

  @override
  String get account => '账户';

  @override
  String get calendar => '日历';

  @override
  String get calendarId => '日历 ID';

  @override
  String get lastSync => '上次同步';

  @override
  String get notConnected => '未连接';

  @override
  String get notCreated => '未创建';

  @override
  String get never => '尚未同步';

  @override
  String durationMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String durationHoursMinutes(int hours, int minutes) {
    return '$hours 小时 $minutes 分钟';
  }

  @override
  String get projectIcon => '项目图标';

  @override
  String projectIconOption(int number) {
    return '图标 $number';
  }

  @override
  String get projectColor => '项目颜色';

  @override
  String projectColorOption(int number) {
    return '颜色 $number';
  }

  @override
  String get addProjectToFavorites => '将项目添加到收藏';

  @override
  String get removeProjectFromFavorites => '从收藏中移除项目';

  @override
  String get timelineProjectsMenu => '管理时间轴项目';

  @override
  String get timelineShowProject => '在时间轴中显示项目';

  @override
  String get timelineHideProject => '隐藏临时显示的项目';

  @override
  String get timelineCollapseProject => '收起子项目';

  @override
  String get timelineExpandProject => '展开子项目';

  @override
  String get timelineCurrentTime => '当前时间';

  @override
  String couldNotUpdateProject(Object error) {
    return '无法更新项目：$error';
  }

  @override
  String get commonDone => '完成';

  @override
  String get taskSelect => '选择';

  @override
  String taskSelectedCount(int count) {
    return '已选择 $count 项';
  }

  @override
  String get taskSelectAll => '全选';

  @override
  String get taskDeselectAll => '取消全选';

  @override
  String get taskDue => '安排日期';

  @override
  String get taskProject => '项目';

  @override
  String get taskLabels => '标签';

  @override
  String get taskPriority => '优先级';

  @override
  String get taskMore => '更多';

  @override
  String get taskSchedule => '安排时间';

  @override
  String get taskMove => '移动';

  @override
  String get taskDuplicate => '复制';

  @override
  String get taskDuplicateTitle => '复制任务';

  @override
  String get taskDuplicateSelectedOnly => '仅复制所选任务';

  @override
  String get taskDuplicateWithSubtasks => '连同子任务一起复制';

  @override
  String get taskWeekend => '本周末';

  @override
  String get taskNextWeek => '下周';

  @override
  String get taskEnterDue => '输入日期或时间';

  @override
  String get taskInvalidDue => '请输入有效的日期或时间';

  @override
  String get taskClearDue => '清除安排日期';

  @override
  String get taskDeleteSelectedTitle => '删除所选任务？';

  @override
  String get taskDeleteSelectedMessage => '你可以在 7 秒内撤销此操作。';

  @override
  String get taskCompleteSelected => '完成所选任务';

  @override
  String get taskReopenSelected => '将所选任务恢复为未完成';

  @override
  String taskActionFailedCount(int count) {
    return '有 $count 项任务无法更新';
  }

  @override
  String get voiceCollapse => '收起语音面板';

  @override
  String get voiceExpand => '展开语音面板';

  @override
  String get voiceMovePanel => '移动语音面板';

  @override
  String get themeClassic => '经典';

  @override
  String get themeOcean => '海洋';

  @override
  String get themeForest => '森林';

  @override
  String get themeCustomize => '自定义';

  @override
  String get themeEditorTitle => '编辑主题';

  @override
  String get themeLivePreview => '更改会立即显示在整个应用中。取消将恢复之前的主题。';

  @override
  String get themeSaveError => '无法保存主题。你的更改仍保留在编辑器中，请重试。';

  @override
  String get themeLoadError => '无法加载你的主题。';

  @override
  String get themeColorsSurfaces => '背景与面板';

  @override
  String get themeColorsText => '文字';

  @override
  String get themeColorsAccent => '强调色';

  @override
  String get themeColorsStatus => '状态颜色';

  @override
  String get themeInvalidHex => '请输入六位 HEX 颜色，例如 #2563EB。';

  @override
  String get themeLowContrast => '对比度较低：部分文字可能难以阅读。';

  @override
  String get themePreviewTask => '规划你的一天';

  @override
  String get themePreviewSecondary => '每天专注一点。';

  @override
  String get themeColorCanvas => '背景';

  @override
  String get themeColorSurface => '面板背景';

  @override
  String get themeColorSurfaceTint => '次级面板背景';

  @override
  String get themeColorSurfaceHover => '鼠标悬停背景';

  @override
  String get themeColorPrimaryText => '主要文字';

  @override
  String get themeColorSecondaryText => '次要文字';

  @override
  String get themeColorMutedText => '辅助文字';

  @override
  String get themeColorBorder => '边框';

  @override
  String get themeColorAccent => '重点文字与图标';

  @override
  String get themeColorAccentFill => '重点按钮背景';

  @override
  String get themeColorAccentTint => '浅色强调背景';

  @override
  String get themeColorWarning => '警告';

  @override
  String get themeColorInfo => '信息';

  @override
  String get themeColorSuccess => '成功';

  @override
  String get themeColorError => '错误';

  @override
  String get themeColorOverdue => '逾期';

  @override
  String get themeColorOnAccent => '重点按钮文字';

  @override
  String get themeColorOnError => '错误提示文字';

  @override
  String todayTaskSummary(int tasks, int planned, String time) {
    return '$tasks 个任务 · 计划专注 $planned 轮 · 已专注 $time';
  }

  @override
  String get todayFocusingOn => '正在专注';

  @override
  String get openFocus => '进入专注';

  @override
  String todayCompletedTasks(int count) {
    return '今日已完成 · $count';
  }

  @override
  String get sidebarDaily => '日常';

  @override
  String get sidebarViews => '视图';

  @override
  String get quickAddResetDetails => '恢复默认设置';

  @override
  String get quickAddChangeTime => '更改时间';

  @override
  String get quickAddProjectNameUnsupported => '暂时无法将这个项目名称填入输入框。';

  @override
  String get themeSepia => '复古棕';

  @override
  String get themeGraphite => '石墨';

  @override
  String get themeCustom => '自定义';

  @override
  String get themeResetToClassic => '重置为经典';

  @override
  String get themeBackgroundKindTitle => '背景';

  @override
  String get themeBackgroundColor => '颜色';

  @override
  String get themeBackgroundPhoto => '照片';

  @override
  String get themeBackgroundGlass => 'macOS 毛玻璃';

  @override
  String get themeBackgroundGlassHint =>
      '覆盖主界面和快速添加窗口。模糊程度由 macOS 决定，可用滑块调整背景色的浓淡。';

  @override
  String get themeBackgroundGlassUnavailable => '仅在 macOS 应用中可用。此平台将使用纯色背景。';

  @override
  String get themeBackgroundTitle => '背景图片';

  @override
  String get themeBackgroundMainOnly => '仅主界面';

  @override
  String get themeBackgroundWholeApp => '整个应用';

  @override
  String get themeBackgroundSeparate => '分区域设置';

  @override
  String get themeBackgroundMain => '主界面';

  @override
  String get themeBackgroundSidebar => '侧边栏';

  @override
  String get themeBackgroundQuickAdd => '快速添加';

  @override
  String get themeBackgroundChoose => '选择照片';

  @override
  String get themeBackgroundReplace => '替换照片';

  @override
  String get themeBackgroundRemove => '移除照片';

  @override
  String get themeBackgroundDim => '遮罩浓度';

  @override
  String get themeBackgroundBlur => '模糊';

  @override
  String get themeBackgroundEmpty => '无照片';

  @override
  String get themeBackgroundImageError => '无法打开此图片。请选择其他照片。';

  @override
  String get themeBackgroundTooLarge => '请选择不超过 50 MB 的图片。';

  @override
  String get themeBackgroundLoading => '正在准备图片…';

  @override
  String get settingsTaskListStyle => '任务列表样式';

  @override
  String get settingsTaskListStyleDescription => '选择任务列表的显示样式。';

  @override
  String get settingsTaskListModern => '现代';

  @override
  String get settingsTaskListClassic => '经典';

  @override
  String get settingsTaskRowSpacing => '任务间距';

  @override
  String get settingsTaskRowSpacingCompact => '紧凑';

  @override
  String get settingsTaskRowSpacingComfortable => '适中';

  @override
  String get settingsTaskRowSpacingSpacious => '宽松';

  @override
  String get settingsSaveError => '无法保存设置。请重试。';

  @override
  String get focusCompletionCompleteAndNext => '完成任务，开始下一项';

  @override
  String get focusCompletionStartNext => '专注下一项任务';

  @override
  String get focusCompletionRetry => '重试';

  @override
  String get searchAllProjects => '所有项目';

  @override
  String get searchStatusOpen => '未完成';

  @override
  String get searchStatusCompleted => '已完成';

  @override
  String get searchStatusAll => '所有状态';

  @override
  String get searchClearFilters => '清除筛选';

  @override
  String get searchEmptyDescription => '按标题或描述查找任务，再按项目或状态筛选。';

  @override
  String get searchNoMatchesDescription => '换个关键词或清除筛选试试，也可以用当前输入新建任务。';

  @override
  String get searchCreateTask => '用当前输入新建任务';

  @override
  String get taskListLoadError => '无法加载任务。请重试。';

  @override
  String get inboxEmptyTitle => '收件箱里暂无任务';

  @override
  String get inboxEmptyDescription => '在这里记录想法，稍后再决定何时处理。';

  @override
  String get todayEmptyTitle => '今天还没有安排';

  @override
  String get todayEmptyDescription => '添加一项任务，开始今天的计划。';

  @override
  String get todayEmptyCompletedTitle => '今天的任务都完成了';

  @override
  String get todayEmptyCompletedDescription => '已完成的任务可以在下方查看。也可以继续添加新任务。';

  @override
  String get projectEmptyTitle => '此项目还没有任务';

  @override
  String get projectEmptyDescription => '添加第一个任务，让项目开始推进。';

  @override
  String get commandSearchPlaceholder => '搜索任务、项目和操作';

  @override
  String get commandSearchTasks => '任务';

  @override
  String get commandSearchActions => '操作';

  @override
  String get commandSearchDictateTask => '语音添加任务';

  @override
  String get commandSearchAllResults => '查看所有结果';

  @override
  String get commandSearchHint => '↑ ↓ 选择 · Enter 打开 · Esc 关闭';

  @override
  String get commandSearchNoMatches => '没有匹配的任务或项目。';

  @override
  String get overdueTitle => '已逾期';

  @override
  String overdueTaskCount(int count) {
    return '$count 个逾期任务';
  }

  @override
  String get overdueReview => '查看并处理';

  @override
  String get overdueEmpty => '没有逾期任务';

  @override
  String get taskFocusSwitchTitle => '切换专注任务？';

  @override
  String taskFocusSwitchMessage(String task) {
    return '切换后会停止当前专注。确定开始专注“$task”吗？';
  }

  @override
  String get taskFocusSwitchConfirm => '切换';

  @override
  String get labelIcon => '标签图标';

  @override
  String get labelUpdateFailed => '无法更新标签，请重试。';

  @override
  String get labelNotFound => '未找到标签';

  @override
  String get labelTasksSubtitle => '所有项目中带有此标签的任务';

  @override
  String labelIconOption(String icon) {
    String _temp0 = intl.Intl.selectLogic(icon, {
      'tag': '标签',
      'bookmark': '书签',
      'flag': '旗帜',
      'bolt': '螺栓',
      'lightbulb': '灯泡',
      'clock': '时钟',
      'bell': '铃铛',
      'pin': '图钉',
      'phone': '电话',
      'mail': '邮件',
      'link': '链接',
      'wrench': '扳手',
      'other': '标签',
    });
    return '$_temp0';
  }

  @override
  String get addSubproject => '创建子项目';

  @override
  String get moveProject => '移动项目';

  @override
  String get projectTopLevel => '顶层';

  @override
  String get projectMoveUp => '上移';

  @override
  String get projectMoveDown => '下移';

  @override
  String projectParentName(String name) {
    return '父项目：$name';
  }

  @override
  String deleteProjectWithChildrenConfirmation(String name) {
    return '删除“$name”？其子项目将上移一级。只有此项目中的任务会移至 Inbox。';
  }

  @override
  String get accountNickname => '昵称';

  @override
  String get accountChangeNickname => '修改昵称';

  @override
  String get accountNicknameSaveError => '无法保存昵称，请重试。';

  @override
  String get notificationTaskStarting => '任务开始';

  @override
  String get notificationReturnTitle => '你的番茄想你了';

  @override
  String get notificationReturnBody => '完成一次专注或勾选一个任务，今天就没有白过。';

  @override
  String get notificationFocusChannel => '专注';

  @override
  String get notificationFocusDescription => '专注时段完成通知';

  @override
  String get notificationReturnChannel => '回归提醒';

  @override
  String get notificationReturnDescription => '温和提醒你回到 Pomodoist';

  @override
  String get notificationTaskChannel => '任务开始';

  @override
  String get notificationTaskDescription => '任务开始通知';

  @override
  String get notificationOpenApp => '打开 Pomodoist';

  @override
  String get notificationFocusCompleted => '专注时段已完成';

  @override
  String get notificationLongBreakCompleted => '长休息已结束';

  @override
  String get notificationBreakCompleted => '休息已结束';

  @override
  String get updateTitle => 'Pomodoist 更新';

  @override
  String get updateAction => '更新';

  @override
  String get updateCheck => '检查更新';

  @override
  String get updateSettings => '更新';

  @override
  String get updateReceiveRc => '接收候选版本（RC）';

  @override
  String get updateStableChannel => '渠道：稳定版本';

  @override
  String get updateRcChannel => '渠道：稳定版本和 RC';

  @override
  String get updateRcHelp => 'RC 版本可能存在错误，不包含 Alpha 和 Beta 版本。';

  @override
  String get updateRestart => '应用将重新启动，你的数据会保留。';

  @override
  String get updateNotes => '更新说明';

  @override
  String get updateOwnerManaged => '此版本由其所有者更新，以保留服务器配置。请向其索取最新版本。';

  @override
  String get updateUnsupported => '自动更新适用于官方 Linux AppImage。其他版本请通过软件包管理器更新。';

  @override
  String updateVersion(String value) {
    return '版本 $value';
  }

  @override
  String get updatePhaseIdle => '你可以随时检查更新。';

  @override
  String get updatePhaseChecking => '正在检查版本…';

  @override
  String get updatePhaseAvailable => '有新版本可用';

  @override
  String get updatePhaseDownloading => '正在下载更新…';

  @override
  String get updatePhaseVerifying => '正在验证完整性…';

  @override
  String get updatePhaseInstalling => '正在准备安装和重启…';

  @override
  String get updatePhaseUpToDate => '你已安装最新兼容版本。';

  @override
  String get updatePhaseFailed => '无法完成更新';

  @override
  String achievementFocusSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '完成 $count 次工作专注',
      one: '完成 1 次工作专注',
    );
    return '$_temp0';
  }

  @override
  String achievementTaskSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '完成 $count 个任务',
      one: '完成 1 个任务',
    );
    return '$_temp0';
  }

  @override
  String get achievementDayNotWastedSubtitle => '一天内完成一次专注和一个任务';

  @override
  String get achievementFocusPlusCheckSubtitle => '一天内完成 3 次专注和 3 个任务';

  @override
  String get achievementNoFussSubtitle => '一天内不中止地完成 5 次专注';

  @override
  String get achievementCleanEntrySubtitle => '在关联专注结束后完成任务';

  @override
  String get achievementTomatoClosedSubtitle => '在工作专注当天完成对应任务';

  @override
  String achievementTitle(String id) {
    String _temp0 = intl.Intl.selectLogic(id, {
      'focus_1': '第一颗番茄',
      'focus_5': '热身',
      'focus_10': '找到专注',
      'focus_25': '番茄班次',
      'focus_50': '模式开启',
      'focus_100': '红带',
      'focus_250': '深深扎根',
      'focus_500': '计时器权威',
      'focus_1000': '第一千颗番茄',
      'focus_5000': '专注农夫',
      'focus_10000': '注意力种植园',
      'focus_50000': '番茄帝国',
      'focus_100000': '红色超级大脑',
      'focus_1000000': '番茄奇点',
      'task_1': '第一个勾',
      'task_5': '清单动摇了',
      'task_10': '开心的复选框',
      'task_25': '清理积压',
      'task_50': '勾选大师',
      'task_100': '收尾能手',
      'task_250': '清单尽在掌握',
      'task_500': '办公室完胜',
      'task_1000': '一千个勾',
      'task_5000': '胜利档案员',
      'task_10000': '勾选机器',
      'task_50000': '问题解决局',
      'task_100000': '清单主宰',
      'task_1000000': '最后一个勾',
      'combo_day_not_wasted': '今天没白过',
      'combo_focus_plus_check': '专注 + 勾选',
      'combo_no_fuss': '从容不迫',
      'combo_clean_entry': '顺利完成',
      'combo_tomato_closed_question': '番茄解决了',
      'other': '成就',
    });
    return '$_temp0';
  }

  @override
  String get focusPresetDeepWork => '深度工作';

  @override
  String get focusPresetShortSprint => '短时冲刺';

  @override
  String csvImportIssueRow(int row, String message) {
    return '第 $row 行：$message';
  }

  @override
  String csvImportIssueMessage(String code, String value) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'fileTooLarge': 'CSV 文件超过 16 MiB。',
      'invalidUtf8': 'CSV 必须使用有效的 UTF-8 编码。',
      'missingHeader': '缺少 CSV 表头。',
      'malformed': 'CSV 格式不正确。',
      'unknownHeader': '未知表头“$value”。',
      'duplicateHeader': '表头“$value”重复。',
      'contentHeaderRequired': '必须包含 content 表头。',
      'tooManyTasks': 'CSV 最多包含 1000 个任务。',
      'tooManyFields': '此行字段数多于表头。',
      'contentRequired': 'content 为必填项。',
      'invalidPriority': 'priority 必须是 1 到 4 的整数。',
      'invalidDate': '$value 必须使用 YYYY-MM-DD 格式。',
      'mixedSchedule': '不能同时指定到期日期和定时日程。',
      'timedFieldsRequired': '定时日程需要 start_at、end_at 和 time_zone。',
      'invalidTimestamp': '$value 必须是带有明确 UTC 偏移的 RFC3339 时间。',
      'invalidTimeZone': 'time_zone 必须是有效的 IANA 名称。',
      'endBeforeStart': 'end_at 必须晚于 start_at。',
      'invalidRecurrence': 'recurrence 必须是 day、week 或 month。',
      'invalidInteger': '$value 必须是 1 到 999 的整数。',
      'intervalWithoutRecurrence': 'recurrence_interval 需要 recurrence。',
      'recurrenceWithoutSchedule': 'recurrence 需要日程。',
      'doneTask': '无法导入已完成的任务。',
      'invalidKey': '$value 格式不正确。',
      'empty': 'CSV 中没有任务。',
      'duplicateKey': '键“$value”重复。',
      'parentCycle': 'parent_key 引用形成循环。',
      'missingParent': 'parent_key“$value”不存在。',
      'childProject': '子任务必须与父任务属于同一项目。',
      'other': '无法导入该文件。',
    });
    return '$_temp0';
  }
}
