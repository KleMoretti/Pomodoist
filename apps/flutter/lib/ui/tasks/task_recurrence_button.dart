import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:pomodoist/ui/core/localization/app_l10n.dart';
import 'package:pomodoist/ui/core/themes/app_theme.dart';
import 'package:pomodoist/ui/core/widgets/app_date_time_picker.dart';
import 'package:pomodoist/domain/models/tasks/task_models.dart';
import 'package:pomodoist/ui/tasks/view_models/task_recurrence_view_model.dart';

class TaskRecurrenceButton extends ConsumerWidget {
  const TaskRecurrenceButton({required this.task, super.key});

  final TaskItem task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(recurrenceTaskProvider(task.id));
    final recurrence = (source.value ?? task).schedule?.recurrence;
    final l10n = context.l10n;
    final label = recurrence == null
        ? l10n.recurrenceTitle
        : switch (recurrence.unit) {
            TaskRecurrenceUnit.day => l10n.recurrenceEveryDays(
              recurrence.interval,
            ),
            TaskRecurrenceUnit.week => l10n.recurrenceEveryWeeks(
              recurrence.interval,
            ),
            TaskRecurrenceUnit.month => l10n.recurrenceEveryMonths(
              recurrence.interval,
            ),
          };
    return ShadButton.outline(
      key: const Key('task-detail-recurrence-button'),
      leading: const Icon(LucideIcons.repeat, size: 16),
      onPressed: () => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => _RecurrenceDialog(task: source.value ?? task),
      ),
      child: Text(label),
    );
  }
}

class _RecurrenceDialog extends ConsumerStatefulWidget {
  const _RecurrenceDialog({required this.task});

  final TaskItem task;

  @override
  ConsumerState<_RecurrenceDialog> createState() => _RecurrenceDialogState();
}

class _RecurrenceDialogState extends ConsumerState<_RecurrenceDialog> {
  late final TextEditingController _interval;
  late TaskRecurrenceUnit _unit;
  late DateTime _start;
  late final DateTime _initialStart;
  DateTime? _end;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final rule = widget.task.schedule?.recurrence;
    _interval = TextEditingController(text: '${rule?.interval ?? 1}');
    _unit = rule?.unit ?? TaskRecurrenceUnit.day;
    _start =
        rule?.startDate ??
        widget.task.schedule?.displayDate ??
        DateUtils.dateOnly(ref.read(recurrenceClockProvider).now().toLocal());
    _initialStart = _start;
    _end = rule?.endDate;
  }

  @override
  void dispose() {
    _interval.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: !_saving,
      child: ShadDialog(
        title: Text(l10n.recurrenceTitle),
        actions: [
          ShadButton.ghost(
            enabled: !_saving,
            onPressed: _saving ? null : () => Navigator.of(context).pop(),
            child: Text(l10n.commonCancel),
          ),
          ShadButton(
            key: const Key('task-recurrence-save-button'),
            enabled: !_saving,
            onPressed: _saving ? null : _save,
            child: Text(l10n.commonSave),
          ),
        ],
        child: SizedBox(
          width: 400,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.6,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l10n.recurrenceDescription),
                  const SizedBox(height: 16),
                  ShadInput(
                    key: const Key('task-recurrence-interval-input'),
                    controller: _interval,
                    enabled: !_saving,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    top: Text(l10n.recurrenceIntervalLabel),
                    onSubmitted: (_) => _save(),
                  ),
                  const SizedBox(height: 12),
                  ShadTabs<TaskRecurrenceUnit>(
                    key: const Key('task-recurrence-unit-select'),
                    value: _unit,
                    onChanged: (unit) => setState(() => _unit = unit),
                    tabs: [
                      ShadTab(
                        value: TaskRecurrenceUnit.day,
                        enabled: !_saving,
                        child: Text(l10n.recurrenceUnitDay),
                      ),
                      ShadTab(
                        value: TaskRecurrenceUnit.week,
                        enabled: !_saving,
                        child: Text(l10n.recurrenceUnitWeek),
                      ),
                      ShadTab(
                        value: TaskRecurrenceUnit.month,
                        enabled: !_saving,
                        child: Text(l10n.recurrenceUnitMonth),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _dateField(l10n.recurrenceStartDate, _start, isStart: true),
                  const SizedBox(height: 12),
                  ShadCheckbox(
                    value: _end == null,
                    enabled: !_saving,
                    label: Text(l10n.recurrenceNoEnd),
                    onChanged: (noEnd) =>
                        setState(() => _end = noEnd ? null : _start),
                  ),
                  if (_end != null) ...[
                    const SizedBox(height: 12),
                    _dateField(l10n.recurrenceEndDate, _end!, isStart: false),
                  ],
                  if (widget.task.schedule?.recurrence != null) ...[
                    const SizedBox(height: 16),
                    ShadButton.ghost(
                      key: const Key('task-recurrence-clear-button'),
                      enabled: !_saving,
                      onPressed: _saving ? null : () => _persist(null),
                      child: Text(l10n.recurrenceStop),
                    ),
                  ],
                  if (_error != null) ...[
                    const SizedBox(height: 12),
                    Semantics(
                      liveRegion: true,
                      child: Text(
                        _error!,
                        style: TextStyle(color: context.appColors.error),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateField(String label, DateTime value, {required bool isStart}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        AppDateTimePicker(
          builder: (context, picker) => ShadButton.outline(
            focusNode: picker.focusNode,
            enabled: !_saving,
            leading: const Icon(LucideIcons.calendar, size: 16),
            onPressed: _saving
                ? null
                : () async {
                    final picked = await picker.pickDate(
                      initialDate: value,
                      firstDate: DateTime(value.year - 5),
                      lastDate: DateTime(value.year + 10),
                      helpText: label,
                    );
                    if (picked == null || !mounted) return;
                    setState(() {
                      if (isStart) {
                        _start = picked;
                      } else {
                        _end = picked;
                      }
                      _error = null;
                    });
                  },
            child: Text(
              MaterialLocalizations.of(context).formatMediumDate(value),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _save() async {
    if (_saving) return;
    final interval = int.tryParse(_interval.text);
    if (interval == null || interval < 1 || interval > 999) {
      setState(() => _error = context.l10n.recurrenceInvalidInterval);
      return;
    }
    if (_end != null && _end!.isBefore(_start)) {
      setState(() => _error = context.l10n.recurrenceInvalidDateRange);
      return;
    }
    await _persist(
      TaskRecurrence(
        interval: interval,
        unit: _unit,
        seriesId:
            widget.task.schedule?.recurrence?.seriesId ??
            'rec-${DateTime.now().toUtc().microsecondsSinceEpoch}',
        startDate: _start,
        endDate: _end,
      ),
    );
  }

  Future<void> _persist(TaskRecurrence? recurrence) async {
    if (_saving) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref
          .read(taskRepositoryProvider)
          .updateTaskRecurrence(
            widget.task.id,
            recurrence: recurrence,
            startDate:
                recurrence != null &&
                    (widget.task.schedule?.recurrence == null ||
                        _start != _initialStart)
                ? _start
                : null,
          );
      if (!mounted) return;
      setState(() => _saving = false);
      Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        setState(() {
          _saving = false;
          _error = context.l10n.recurrenceSaveFailed;
        });
      }
    }
  }
}
