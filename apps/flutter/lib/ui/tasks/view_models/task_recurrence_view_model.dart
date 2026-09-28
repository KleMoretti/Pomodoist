import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pomodoist/config/providers.dart';
import 'package:pomodoist/data/repositories/tasks/task_repository.dart';
import 'package:pomodoist/domain/models/tasks/task_models.dart';

final recurrenceTaskProvider = StreamProvider.autoDispose
    .family<TaskItem?, String>(
      (ref, id) => ref.watch(taskRepositoryProvider).watchRecurrenceTask(id),
    );

final recurrenceClockProvider = Provider((ref) => ref.watch(clockProvider));

final recurrenceTaskActionsProvider = Provider<TaskRecurrenceActions>((ref) {
  return TaskRecurrenceActions(ref.watch(taskRepositoryProvider));
});

final class TaskRecurrenceActions {
  const TaskRecurrenceActions(this._repository);

  final TaskRepository _repository;

  Future<void> update(
    String id, {
    required TaskRecurrence? recurrence,
    DateTime? startDate,
  }) {
    return _repository.updateTaskRecurrence(
      id,
      recurrence: recurrence,
      startDate: startDate,
    );
  }
}
