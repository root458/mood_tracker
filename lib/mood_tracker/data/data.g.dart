// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class MoodEntryAdapter extends TypeAdapter<MoodEntry> {
  @override
  final typeId = 0;

  @override
  MoodEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodEntry(
      date: fields[0] as DateTime,
      mood: fields[1] as Mood,
      note: fields[2] == null ? '' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoodEntry obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.mood)
      ..writeByte(2)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoodAdapter extends TypeAdapter<Mood> {
  @override
  final typeId = 1;

  @override
  Mood read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Mood.happy;
      case 1:
        return Mood.sad;
      case 2:
        return Mood.neutral;
      default:
        return Mood.happy;
    }
  }

  @override
  void write(BinaryWriter writer, Mood obj) {
    switch (obj) {
      case Mood.happy:
        writer.writeByte(0);
      case Mood.sad:
        writer.writeByte(1);
      case Mood.neutral:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoodEntry _$MoodEntryFromJson(Map<String, dynamic> json) => _MoodEntry(
  date: DateTime.parse(json['date'] as String),
  mood: $enumDecode(_$MoodEnumMap, json['mood']),
  note: json['note'] as String? ?? '',
);

Map<String, dynamic> _$MoodEntryToJson(_MoodEntry instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'mood': _$MoodEnumMap[instance.mood]!,
      'note': instance.note,
    };

const _$MoodEnumMap = {
  Mood.happy: 'happy',
  Mood.neutral: 'neutral',
  Mood.sad: 'sad',
};
