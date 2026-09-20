import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

import '../../../app/app_l10n.dart';
import '../../../app/providers.dart';
import '../../../app/theme/app_motion.dart';
import '../../../app/theme/app_theme.dart';
import '../../../app/widgets/action_feedback.dart';
import '../../tasks/domain/task_focus_estimate.dart';
import '../../tasks/domain/task_models.dart';
import '../../tasks/presentation/task_focus_launcher.dart';
import '../domain/focus_models.dart';
import 'focus_preset_labels.dart';
import 'focus_view_mode.dart';

bool _focusSetupOpen = false;

/// All task entry points share the same setup and session-switch guard.
Future<bool> showFocusStartDialog(
  BuildContext context,
  WidgetRef ref, {
  TaskItem? task,
  FocusPresetItem? preset,
}) async {
  if (_focusSetupOpen) return false;
  _focusSetupOpen = true;
  try {
    final active = await ref.read(focusRepositoryProvider).watchActiveRun().first;
    if (!context.mounted) return false;
    if (task != null && active?.taskId == task.id) return true;
    final presets = await ref.read(focusPresetsProvider.future);
    if (!context.mounted) return false;
    final selected = preset ?? selectedFocusPresetOrDefault(
      presets, ref.read(lastFocusPresetIdProvider),
    );
    if (selected == null) throw StateError('No focus preset available');
    return await showDialog<bool>(
      context: context,
      animationStyle: AnimationStyle(
        duration: AppMotion.duration(context, AppMotion.popup),
        reverseDuration: AppMotion.duration(context, AppMotion.popup),
        curve: AppMotion.curve,
      ),
      builder: (_) => _FocusStartDialog(
        task: task, preset: selected, presets: presets,
      ),
    ) ?? false;
  } catch (_) {
    if (context.mounted) {
      showActionFeedback(context, message: context.l10n.focusActionFailed,
        icon: LucideIcons.circleAlert, sound: ActionFeedbackSound.none,
        haptic: AppHapticCue.none);
    }
    return false;
  } finally {
    _focusSetupOpen = false;
  }
}

class _FocusStartDialog extends ConsumerStatefulWidget {
  const _FocusStartDialog({required this.task, required this.preset, required this.presets});
  final TaskItem? task;
  final FocusPresetItem preset;
  final List<FocusPresetItem> presets;

  @override
  ConsumerState<_FocusStartDialog> createState() => _FocusStartDialogState();
}

class _FocusStartDialogState extends ConsumerState<_FocusStartDialog> {
  final _form = GlobalKey<FormState>();
  late TaskItem? _task = widget.task;
  late FocusPresetItem _preset = widget.preset;
  late final _rounds = TextEditingController(text: _defaultRounds().toString());
  bool _busy = false;
  bool _roundsEdited = false;
  String? _error;

  int _defaultRounds() => (_task == null ? _preset.intervalsBeforeLongBreak
      : targetFocusIntervalsForTask(_task!, _preset) ?? _preset.intervalsBeforeLongBreak).clamp(1, 999);

  @override
  void dispose() {
    _rounds.dispose();
    super.dispose();
  }

  Future<void> _chooseTask() async {
    final result = await showDialog<_TaskChoice>(context: context,
      builder: (_) => const _FocusTaskPicker());
    if (!mounted || result == null) return;
    setState(() {
      _task = result.task;
      if (!_roundsEdited) _rounds.text = _defaultRounds().toString();
      _error = null;
    });
  }

  Future<void> _start() async {
    if (_busy || !_form.currentState!.validate()) return;
    setState(() { _busy = true; _error = null; });
    try {
      final opened = await ref.read(taskFocusLauncherProvider).open(
        _task, preset: _preset, targetWorkIntervals: int.parse(_rounds.text),
        confirmSwitch: () async => mounted && await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(context.l10n.taskFocusSwitchTitle),
            content: Text(context.l10n.focusReplaceSession),
            actions: [
              TextButton(onPressed: () => Navigator.pop(dialogContext, false),
                child: Text(context.l10n.commonCancel)),
              FilledButton(onPressed: () => Navigator.pop(dialogContext, true),
                child: Text(context.l10n.taskFocusSwitchConfirm)),
            ],
          ),
        ) == true,
      );
      if (!mounted) return;
      if (opened) {
        // Saving a convenience preference must not turn a successful start
        // into an error or invite a second session.
        unawaited(ref.read(lastFocusPresetIdProvider.notifier)
          .setPresetId(_preset.id).catchError((Object _) {}));
        Navigator.pop(context, true);
      }
    } catch (_) {
      if (mounted) setState(() => _error = context.l10n.focusActionFailed);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: !_busy,
      child: AlertDialog(
        title: Text(l10n.focusSetupTitle),
        content: SizedBox(width: 440, child: SingleChildScrollView(
          child: Form(key: _form, child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.focusTaskLabel, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              if (widget.task != null)
                Text(_task!.content)
              else
                OutlinedButton.icon(onPressed: _busy ? null : _chooseTask,
                  icon: const Icon(LucideIcons.listTodo, size: 18),
                  label: Text(_task?.content ?? l10n.focusNoTask,
                    maxLines: 2, overflow: TextOverflow.ellipsis)),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _preset.id, isExpanded: true,
                decoration: InputDecoration(labelText: l10n.focusPresetLabel),
                items: [for (final preset in widget.presets) DropdownMenuItem(
                  value: preset.id, child: Text(focusPresetLabel(l10n, preset), overflow: TextOverflow.ellipsis))],
                onChanged: _busy ? null : (id) => setState(() {
                  _preset = widget.presets.firstWhere((item) => item.id == id);
                  if (!_roundsEdited) _rounds.text = _defaultRounds().toString();
                }),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _rounds, enabled: !_busy,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)],
                decoration: InputDecoration(labelText: l10n.focusTargetRounds,
                  suffixText: l10n.focusRoundsUnit),
                onChanged: (_) => _roundsEdited = true,
                validator: (value) {
                  final rounds = int.tryParse(value ?? '');
                  return rounds == null || rounds < 1 || rounds > 999 ? l10n.focusRoundsInvalid : null;
                },
                onFieldSubmitted: (_) => _start(),
              ),
              const SizedBox(height: 8),
              Text(l10n.focusRoundsHelp, style: Theme.of(context).textTheme.bodySmall),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!, style: TextStyle(color: context.appColors.error)),
              ],
            ],
          )),
        )),
        actions: [
          TextButton(onPressed: _busy ? null : () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
          FilledButton(onPressed: _busy ? null : _start, child: Text(l10n.startFocus)),
        ],
      ),
    );
  }
}

class _TaskChoice {
  const _TaskChoice(this.task);
  final TaskItem? task;
}

class _FocusTaskPicker extends ConsumerStatefulWidget {
  const _FocusTaskPicker();
  @override
  ConsumerState<_FocusTaskPicker> createState() => _FocusTaskPickerState();
}

class _FocusTaskPickerState extends ConsumerState<_FocusTaskPicker> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final source = ref.watch(tasksByQueryProvider(const TaskQuery.all()));
    final tasks = (source.value ?? const <TaskItem>[]).where((task) =>
      !task.isCompleted && !task.isDeleted && task.content.toLowerCase().contains(_query)).toList();
    return AlertDialog(
      title: Text(l10n.focusChooseTask),
      content: SizedBox(width: 440, height: 360, child: Column(children: [
        TextField(autofocus: true,
          decoration: InputDecoration(labelText: l10n.focusSearchTasks, prefixIcon: const Icon(LucideIcons.search)),
          onChanged: (value) => setState(() => _query = value.trim().toLowerCase())),
        ListTile(title: Text(l10n.focusNoTask),
          onTap: () => Navigator.pop(context, const _TaskChoice(null))),
        Expanded(child: source.isLoading ? const Center(child: CircularProgressIndicator())
          : source.hasError ? Center(child: TextButton(
            onPressed: () => ref.invalidate(tasksByQueryProvider(const TaskQuery.all())), child: Text(l10n.commonRetry)))
          : tasks.isEmpty ? Center(child: Text(l10n.focusNoMatchingTasks))
          : ListView.builder(itemCount: tasks.length, itemBuilder: (_, index) => ListTile(
            title: Text(tasks[index].content, maxLines: 2, overflow: TextOverflow.ellipsis),
            onTap: () => Navigator.pop(context, _TaskChoice(tasks[index]))))),
      ])),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.commonCancel))],
    );
  }
}
