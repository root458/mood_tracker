part of 'mood_tracker_cubit.dart';

@freezed
class MoodTrackerState with _$MoodTrackerState {
  const factory MoodTrackerState.initial() = _Initial;
  const factory MoodTrackerState.loaded({
    @Default([]) List<MoodEntry> entries,
  }) = _Loaded;
}
