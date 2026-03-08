import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MoodTrackerService', () {
    late MoodTrackerService moodTrackerService;

    setUpAll(() async {
      // Mock path_provider for Hive.initFlutter
      final tempDir = await Directory.systemTemp.createTemp();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/path_provider'),
            (methodCall) async {
              if (methodCall.method == 'getApplicationDocumentsDirectory') {
                return tempDir.path;
              }
              return null;
            },
          );

      moodTrackerService = MoodTrackerServiceImpl();
      await moodTrackerService.init();
    });

    tearDown(() async {
      await moodTrackerService.clearAll();
    });

    tearDownAll(() async {
      await Hive.deleteFromDisk();
    });

    test('init opens the box', () async {
      final box = Hive.box<dynamic>('mood_tracker');
      expect(box.isOpen, isTrue);
    });

    test('addMoodEntry adds an entry to the box', () async {
      final entry = MoodEntry(date: DateTime(2023), mood: Mood.happy);
      await moodTrackerService.addMoodEntry(entry);

      final entries = await moodTrackerService.getMoodEntries();
      expect(entries, contains(entry));
    });

    test('deleteMoodEntry removes an entry from the box', () async {
      final entry = MoodEntry(date: DateTime(2023), mood: Mood.happy);
      await moodTrackerService.addMoodEntry(entry);

      await moodTrackerService.deleteMoodEntry(entry);

      final entries = await moodTrackerService.getMoodEntries();
      expect(entries, isNot(contains(entry)));
    });

    test('getMoodEntries returns all entries in the box', () async {
      final entry1 = MoodEntry(date: DateTime(2023), mood: Mood.happy);
      final entry2 = MoodEntry(date: DateTime(2024), mood: Mood.sad);

      await moodTrackerService.addMoodEntry(entry1);
      await moodTrackerService.addMoodEntry(entry2);

      final entries = await moodTrackerService.getMoodEntries();
      expect(entries, containsAll([entry1, entry2]));
      expect(entries.length, equals(2));
    });

    test('clearAll removes all entries from the box', () async {
      final entry = MoodEntry(date: DateTime(2023), mood: Mood.happy);
      await moodTrackerService.addMoodEntry(entry);

      await moodTrackerService.clearAll();

      final entries = await moodTrackerService.getMoodEntries();
      expect(entries, isEmpty);
    });
  });
}
