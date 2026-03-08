import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

class MockMoodTrackerService extends Mock implements MoodTrackerService {}

void main() {
  group('MoodTrackerCubit', () {
    late MoodTrackerService mockMoodTrackerService;
    late MoodEntry mockEntry;

    setUp(() {
      mockMoodTrackerService = MockMoodTrackerService();
      mockEntry = MoodEntry(
        date: DateTime(2023),
        mood: Mood.happy,
        note: 'Test note',
      );

      when(() => mockMoodTrackerService.getMoodEntries()).thenAnswer(
        (_) async => [mockEntry],
      );
      when(() => mockMoodTrackerService.init()).thenAnswer((_) async {});
      when(
        () => mockMoodTrackerService.addMoodEntry(any()),
      ).thenAnswer((_) async {});
      when(
        () => mockMoodTrackerService.deleteMoodEntry(any()),
      ).thenAnswer((_) async {});
      when(() => mockMoodTrackerService.clearAll()).thenAnswer((_) async {});
    });

    setUpAll(() {
      registerFallbackValue(
        MoodEntry(
          date: DateTime(2023),
          mood: Mood.happy,
        ),
      );
    });

    test('initial state is MoodTrackerState.initial', () {
      expect(
        MoodTrackerCubit(moodTrackerService: mockMoodTrackerService).state,
        equals(const MoodTrackerState.initial()),
      );
    });

    blocTest<MoodTrackerCubit, MoodTrackerState>(
      'emits [loaded] when init is called',
      build: () => MoodTrackerCubit(moodTrackerService: mockMoodTrackerService),
      act: (cubit) => cubit.init(),
      expect: () => [
        MoodTrackerState.loaded(entries: [mockEntry]),
      ],
      verify: (_) {
        verify(() => mockMoodTrackerService.init()).called(1);
        verify(() => mockMoodTrackerService.getMoodEntries()).called(1);
      },
    );

    blocTest<MoodTrackerCubit, MoodTrackerState>(
      'emits [loaded] when addMoodEntry is called',
      build: () => MoodTrackerCubit(moodTrackerService: mockMoodTrackerService),
      act: (cubit) => cubit.addMoodEntry(mockEntry),
      expect: () => [
        MoodTrackerState.loaded(entries: [mockEntry]),
      ],
      verify: (_) {
        verify(() => mockMoodTrackerService.addMoodEntry(mockEntry)).called(1);
        verify(() => mockMoodTrackerService.getMoodEntries()).called(1);
      },
    );

    blocTest<MoodTrackerCubit, MoodTrackerState>(
      'emits [loaded] when removeMoodEntry is called',
      build: () => MoodTrackerCubit(moodTrackerService: mockMoodTrackerService),
      act: (cubit) => cubit.removeMoodEntry(mockEntry),
      expect: () => [
        MoodTrackerState.loaded(entries: [mockEntry]),
      ],
      verify: (_) {
        verify(
          () => mockMoodTrackerService.deleteMoodEntry(mockEntry),
        ).called(1);
        verify(() => mockMoodTrackerService.getMoodEntries()).called(1);
      },
    );

    blocTest<MoodTrackerCubit, MoodTrackerState>(
      'emits [loaded] when clearAll is called',
      build: () => MoodTrackerCubit(moodTrackerService: mockMoodTrackerService),
      act: (cubit) => cubit.clearAll(),
      expect: () => [
        MoodTrackerState.loaded(entries: [mockEntry]),
      ],
      verify: (_) {
        verify(() => mockMoodTrackerService.clearAll()).called(1);
        verify(() => mockMoodTrackerService.getMoodEntries()).called(1);
      },
    );
  });
}
