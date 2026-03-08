import 'package:flutter_test/flutter_test.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

void main() {
  group('MoodEntry', () {
    test('supports value equality', () {
      final date = DateTime(2023);
      expect(
        MoodEntry(date: date, mood: Mood.happy, note: 'Great day'),
        equals(MoodEntry(date: date, mood: Mood.happy, note: 'Great day')),
      );
    });

    test('props are correct', () {
      final date = DateTime(2023);
      final entry = MoodEntry(date: date, mood: Mood.happy, note: 'Great day');
      expect(entry.date, equals(date));
      expect(entry.mood, equals(Mood.happy));
      expect(entry.note, equals('Great day'));
    });

    test('can be serialized and deserialized to JSON', () {
      final date = DateTime(2023);
      final entry = MoodEntry(date: date, mood: Mood.happy, note: 'Great day');
      final json = entry.toJson();

      expect(json, isA<Map<String, dynamic>>());

      final deserialized = MoodEntry.fromJson(json);
      expect(deserialized, equals(entry));
    });

    test('uses default note when not provided', () {
      final date = DateTime(2023);
      final entry = MoodEntry(date: date, mood: Mood.happy);
      expect(entry.note, equals(''));
    });
  });
}
