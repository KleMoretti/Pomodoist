import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pomodoist/config/providers.dart';
import 'package:pomodoist/domain/models/tasks/task_models.dart';

final recurrenceTaskProvider = StreamProvider.autoDispose
    .family<TaskItem?, String>(
      (ref, id) => ref.watch(taskRepositoryProvider).watchRecurrenceTask(id),
    );

final recurrenceClockProvider = Provider((ref) => ref.watch(clockProvider));
