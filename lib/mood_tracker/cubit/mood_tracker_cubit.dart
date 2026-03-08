import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_tracker_state.dart';
part 'mood_tracker_cubit.freezed.dart';

class MoodTrackerCubit extends Cubit<MoodTrackerState> {
  MoodTrackerCubit() : super(const MoodTrackerState.initial());
}
