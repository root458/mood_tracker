import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

@GenerateAdapters([AdapterSpec<MoodEntry>(), AdapterSpec<Mood>()])
part 'data.g.dart';
part 'data.freezed.dart';

enum Mood {
  happy,
  sad,
  neutral,
}

@freezed
abstract class MoodEntry with _$MoodEntry {
  const factory MoodEntry({
    required DateTime date,
    required Mood mood,
    @Default('') String note,
  }) = _MoodEntry;

  factory MoodEntry.fromJson(Map<String, dynamic> json) =>
      _$MoodEntryFromJson(json);
}
