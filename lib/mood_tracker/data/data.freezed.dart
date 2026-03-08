// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoodEntry {

 DateTime get date; Mood get mood; String get note;
/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoodEntryCopyWith<MoodEntry> get copyWith => _$MoodEntryCopyWithImpl<MoodEntry>(this as MoodEntry, _$identity);

  /// Serializes this MoodEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoodEntry&&(identical(other.date, date) || other.date == date)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,mood,note);

@override
String toString() {
  return 'MoodEntry(date: $date, mood: $mood, note: $note)';
}


}

/// @nodoc
abstract mixin class $MoodEntryCopyWith<$Res>  {
  factory $MoodEntryCopyWith(MoodEntry value, $Res Function(MoodEntry) _then) = _$MoodEntryCopyWithImpl;
@useResult
$Res call({
 DateTime date, Mood mood, String note
});




}
/// @nodoc
class _$MoodEntryCopyWithImpl<$Res>
    implements $MoodEntryCopyWith<$Res> {
  _$MoodEntryCopyWithImpl(this._self, this._then);

  final MoodEntry _self;
  final $Res Function(MoodEntry) _then;

/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? mood = null,Object? note = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as Mood,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MoodEntry].
extension MoodEntryPatterns on MoodEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoodEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoodEntry value)  $default,){
final _that = this;
switch (_that) {
case _MoodEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoodEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  Mood mood,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
return $default(_that.date,_that.mood,_that.note);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  Mood mood,  String note)  $default,) {final _that = this;
switch (_that) {
case _MoodEntry():
return $default(_that.date,_that.mood,_that.note);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  Mood mood,  String note)?  $default,) {final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
return $default(_that.date,_that.mood,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoodEntry implements MoodEntry {
  const _MoodEntry({required this.date, required this.mood, this.note = ''});
  factory _MoodEntry.fromJson(Map<String, dynamic> json) => _$MoodEntryFromJson(json);

@override final  DateTime date;
@override final  Mood mood;
@override@JsonKey() final  String note;

/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoodEntryCopyWith<_MoodEntry> get copyWith => __$MoodEntryCopyWithImpl<_MoodEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoodEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoodEntry&&(identical(other.date, date) || other.date == date)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,mood,note);

@override
String toString() {
  return 'MoodEntry(date: $date, mood: $mood, note: $note)';
}


}

/// @nodoc
abstract mixin class _$MoodEntryCopyWith<$Res> implements $MoodEntryCopyWith<$Res> {
  factory _$MoodEntryCopyWith(_MoodEntry value, $Res Function(_MoodEntry) _then) = __$MoodEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, Mood mood, String note
});




}
/// @nodoc
class __$MoodEntryCopyWithImpl<$Res>
    implements _$MoodEntryCopyWith<$Res> {
  __$MoodEntryCopyWithImpl(this._self, this._then);

  final _MoodEntry _self;
  final $Res Function(_MoodEntry) _then;

/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? mood = null,Object? note = null,}) {
  return _then(_MoodEntry(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as Mood,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
