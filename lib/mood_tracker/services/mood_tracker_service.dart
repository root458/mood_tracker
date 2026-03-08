import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mood_tracker/mood_tracker/data/data.dart';
import 'package:mood_tracker/mood_tracker/data/hive_registrar.g.dart';

abstract class MoodTrackerService {
  Future<void> init();

  Future<void> addMoodEntry(MoodEntry moodEntry);

  Future<void> deleteMoodEntry(MoodEntry moodEntry);

  Future<List<MoodEntry>> getMoodEntries();

  Future<void> clearAll();
}

class MoodTrackerServiceImpl implements MoodTrackerService {

  MoodTrackerServiceImpl();

  static const _hiveDBKey = 'mood_tracker';

  @override
  Future<void> init() async {
    await Hive.initFlutter(_hiveDBKey);
    Hive.registerAdapters();

    if (!Hive.isBoxOpen(_hiveDBKey)) {
      await Hive.openBox<dynamic>(_hiveDBKey);
    }
  }

  @override
  Future<void> addMoodEntry(MoodEntry moodEntry) async {
    final entries = await getMoodEntries();
    entries.add(moodEntry);
    final box = Hive.box<dynamic>(_hiveDBKey);
    await box.put('mood_entries', entries);
  }

  @override
  Future<void> deleteMoodEntry(MoodEntry moodEntry) async {
    final entries = await getMoodEntries();
    entries.remove(moodEntry);
    final box = Hive.box<dynamic>(_hiveDBKey);
    await box.put('mood_entries', entries);
  }

  @override
  Future<List<MoodEntry>> getMoodEntries() async {
    final box = Hive.box<dynamic>(_hiveDBKey);
    final data = box.get('mood_entries', defaultValue: <dynamic>[]);
    return List.castFrom<dynamic, MoodEntry>(data as List);
  }

  @override
  Future<void> clearAll() async {
    final box = Hive.box<dynamic>(_hiveDBKey);
    await box.clear();
  }
}
