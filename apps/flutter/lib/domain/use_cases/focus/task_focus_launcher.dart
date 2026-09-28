import 'package:pomodoist/data/repositories/focus/focus_repository.dart';

import 'package:pomodoist/domain/models/focus/focus_models.dart';
import 'package:pomodoist/domain/models/tasks/task_focus_estimate.dart';
import 'package:pomodoist/domain/models/tasks/task_models.dart';

/// One shared guard because all task rows control the same Focus session.
class TaskFocusLauncher {
  TaskFocusLauncher(this.repository);

  final FocusRepository repository;
  bool _starting = false;

  Future<bool> open(
    TaskItem? task, {
    required FocusPresetItem? preset,
    int? targetWorkIntervals,
    required Future<bool> Function() confirmSwitch,
  }) async {
    if (targetWorkIntervals != null &&
        (targetWorkIntervals < 1 || targetWorkIntervals > 999)) {
      throw ArgumentError.value(
        targetWorkIntervals,
        'targetWorkIntervals',
        'must be between 1 and 999',
      );
    }
    if (_starting || task?.isCompleted == true || task?.isDeleted == true) {
      return false;
    }
    _starting = true;
    try {
      var active = await repository.watchActiveRun().first;
      while (active != null && active.taskId != task?.id) {
        if (!await confirmSwitch()) return false;
        final latest = await repository.watchActiveRun().first;
        if (latest?.id == active.id) break;
        // A different session appeared while the confirmation was open.
        active = latest;
      }
      // A null task is an intentional unlinked focus target. It must not
      // match the absence of an active run and short-circuit the start.
      if (task != null && active?.taskId == task.id) return true;
      final estimate = targetWorkIntervals ??
          (task == null ? null : targetFocusIntervalsForTask(task, preset));
      final result = await repository.startRun(
        StartFocusRunInput(
          taskId: task?.id,
          projectId: task?.projectId,
          presetId: preset?.id,
          targetWorkIntervals: estimate == null
              ? null
              : estimate < 1
              ? 1
              : estimate,
        ),
      );
      result.getOrThrow();
      return true;
    } finally {
      _starting = false;
    }
  }
}
