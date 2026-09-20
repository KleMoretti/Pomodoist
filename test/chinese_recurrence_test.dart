import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pomodoist/app/app_language.dart';
import 'package:pomodoist/core/db/app_database.dart';
import 'package:pomodoist/core/sync/sync_queue_repository.dart';
import 'package:pomodoist/features/tasks/data/task_repository_impl.dart';
import 'package:pomodoist/features/tasks/domain/task_models.dart';
import 'package:pomodoist/features/focus/domain/focus_models.dart'
    show FocusPresetItem;
import 'package:pomodoist/features/focus/presentation/focus_preset_labels.dart';
import 'package:pomodoist/l10n/app_localizations_zh.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('localizing built-in plans never renames user-authored plans', () {
    FocusPresetItem plan(String id, String name) => FocusPresetItem(
      id: id,
      userId: 'local',
      name: name,
      workSeconds: 1500,
      shortBreakSeconds: 300,
      longBreakSeconds: 900,
      intervalsBeforeLongBreak: 4,
      autoStartBreaks: false,
      autoStartWork: false,
      allowPause: true,
      strictMode: false,
      isDefault: false,
      createdAt: DateTime(2026),
      updatedAt: DateTime(2026),
    );
    final chinese = AppLocalizationsZh();
    expect(
      focusPresetLabel(chinese, plan(defaultPresetId, 'Classic')),
      '经典番茄钟',
    );
    expect(
      focusPresetLabel(chinese, plan(defaultPresetId, 'My plan')),
      'My plan',
    );
    expect(focusPresetLabel(chinese, plan('user-plan', 'Classic')), 'Classic');
  });

  test(
    'Chinese migration runs once and preserves subsequent selections',
    () async {
      SharedPreferences.setMockInitialValues({appLanguagePreferenceKey: 'en'});
      final first = ProviderContainer();
      expect(first.read(appLanguageProvider), AppLanguage.zh);
      await first.read(appLanguageProvider.notifier).ready;
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(appLanguagePreferenceKey), 'zh');
      await first
          .read(appLanguageProvider.notifier)
          .setLanguage(AppLanguage.en);
      first.dispose();
      final restarted = ProviderContainer();
      addTearDown(restarted.dispose);
      await restarted.read(appLanguageProvider.notifier).ready;
      expect(restarted.read(appLanguageProvider), AppLanguage.en);
    },
  );

  test('a choice made during loading wins over migration', () async {
    SharedPreferences.setMockInitialValues({});
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final controller = container.read(appLanguageProvider.notifier);
    await controller.setLanguage(AppLanguage.system);
    await controller.ready;
    expect(container.read(appLanguageProvider), AppLanguage.system);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(appLanguagePreferenceKey), 'system');
    expect(prefs.getBool(appLanguageChineseMigrationKey), isTrue);
  });

  test(
    'recurrence range round-trips, includes end day and reads old rules',
    () {
      final rule = TaskRecurrence(
        interval: 1,
        unit: TaskRecurrenceUnit.day,
        seriesId: 'range',
        startDate: DateTime(2026, 9, 20),
        endDate: DateTime(2026, 9, 21),
      );
      final schedule = TaskSchedule.timed(
        start: DateTime(2026, 9, 20, 9),
        end: DateTime(2026, 9, 20, 10),
        recurrence: rule,
      );
      final parsed = TaskSchedule.fromJsonString(schedule.toJsonString())!;
      expect(parsed.recurrence, rule);
      final next = parsed.nextOccurrenceAfter(DateTime(2026, 9, 20, 12))!;
      expect(next.start!.toLocal(), DateTime(2026, 9, 21, 9));
      expect(next.duration, const Duration(hours: 1));
      expect(next.nextOccurrence(), isNull);
      expect(parsed.nextOccurrenceAfter(DateTime(2026, 10, 1)), isNull);
      final legacy = TaskRecurrence.fromJson({
        'interval': 1,
        'unit': 'week',
        'seriesId': 'old',
      })!;
      expect(legacy.startDate, isNull);
      expect(legacy.endDate, isNull);
      expect(
        TaskSchedule.allDay(
          DateTime(2026, 9, 20),
          recurrence: legacy,
        ).nextOccurrence()!.date,
        DateTime(2026, 9, 27),
      );
    },
  );

  test('materialization stops at the end date without duplicates', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await db.ensureSeedData();
    final repo = DriftTaskRepository(db, DriftSyncQueueRepository(db));
    final id = await repo.createTask(
      CreateTaskInput(
        content: 'Daily',
        schedule: TaskSchedule.allDay(
          DateTime(2026, 9, 20),
          recurrence: TaskRecurrence(
            interval: 1,
            unit: TaskRecurrenceUnit.day,
            seriesId: 'bounded',
            startDate: DateTime(2026, 9, 20),
            endDate: DateTime(2026, 9, 21),
          ),
        ),
      ),
    );
    await repo.materializeDueRecurringTasks(now: DateTime(2026, 9, 20, 12));
    await repo.materializeDueRecurringTasks(now: DateTime(2026, 9, 20, 12));
    expect((await repo.watchTasks(const TaskQuery.all()).first), hasLength(2));
    final current = (await repo.watchRecurrenceTask(id).first)!;
    expect(current.schedule!.displayDate, DateTime(2026, 9, 21));
    await repo.materializeDueRecurringTasks(now: DateTime(2026, 9, 22));
    final tasks = await repo.watchTasks(const TaskQuery.all()).first;
    expect(tasks, hasLength(2));
    expect(tasks.every((task) => task.schedule!.recurrence == null), isTrue);
  });

  test('stopping from an earlier copy stops the active series', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await db.ensureSeedData();
    final repo = DriftTaskRepository(db, DriftSyncQueueRepository(db));
    final id = await repo.createTask(
      CreateTaskInput(
        content: 'Daily',
        schedule: TaskSchedule.allDay(
          DateTime(2026, 9, 20),
          recurrence: const TaskRecurrence(
            interval: 1,
            unit: TaskRecurrenceUnit.day,
            seriesId: 'stoppable',
          ),
        ),
      ),
    );
    await repo.materializeDueRecurringTasks(now: DateTime(2026, 9, 20, 12));
    await repo.updateTaskRecurrence(id, recurrence: null);
    await repo.materializeDueRecurringTasks(now: DateTime(2026, 9, 23));
    final tasks = await repo.watchTasks(const TaskQuery.all()).first;
    expect(tasks, hasLength(2));
    expect(tasks.every((task) => task.schedule!.recurrence == null), isTrue);
  });
}
