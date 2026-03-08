import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_tracker/mood_tracker/_index.dart';

part 'mood_tracker_state.dart';
part 'mood_tracker_cubit.freezed.dart';

class MoodTrackerCubit extends Cubit<MoodTrackerState> {
  MoodTrackerCubit({
    required MoodTrackerService moodTrackerService,
  }) : _moodTrackerService = moodTrackerService,
       super(const MoodTrackerState.initial());

  final MoodTrackerService _moodTrackerService;

  Future<void> init() async {
    await _loadEntries();
  }

  Future<void> addMoodEntry(MoodEntry moodEntry) async {
    await _moodTrackerService.addMoodEntry(moodEntry);
    await _loadEntries();
  }

  Future<void> removeMoodEntry(MoodEntry moodEntry) async {
    await _moodTrackerService.deleteMoodEntry(moodEntry);
    await _loadEntries();
  }

  Future<void> clearAll() async {
    await _moodTrackerService.clearAll();
    await _loadEntries();
  }

  Future<void> _loadEntries() async {
    final entries = await _moodTrackerService.getMoodEntries();
    emit(MoodTrackerState.loaded(entries: entries));
  }
}
