// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timetable_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimetableStateTearOff {
  const _$TimetableStateTearOff();

  _TimetableState call({WeekTimetable? weekTimetable}) {
    return _TimetableState(
      weekTimetable: weekTimetable,
    );
  }
}

/// @nodoc
const $TimetableState = _$TimetableStateTearOff();

/// @nodoc
mixin _$TimetableState {
  WeekTimetable? get weekTimetable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimetableStateCopyWith<TimetableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableStateCopyWith<$Res> {
  factory $TimetableStateCopyWith(
          TimetableState value, $Res Function(TimetableState) then) =
      _$TimetableStateCopyWithImpl<$Res>;
  $Res call({WeekTimetable? weekTimetable});
}

/// @nodoc
class _$TimetableStateCopyWithImpl<$Res>
    implements $TimetableStateCopyWith<$Res> {
  _$TimetableStateCopyWithImpl(this._value, this._then);

  final TimetableState _value;
  // ignore: unused_field
  final $Res Function(TimetableState) _then;

  @override
  $Res call({
    Object? weekTimetable = freezed,
  }) {
    return _then(_value.copyWith(
      weekTimetable: weekTimetable == freezed
          ? _value.weekTimetable
          : weekTimetable // ignore: cast_nullable_to_non_nullable
              as WeekTimetable?,
    ));
  }
}

/// @nodoc
abstract class _$TimetableStateCopyWith<$Res>
    implements $TimetableStateCopyWith<$Res> {
  factory _$TimetableStateCopyWith(
          _TimetableState value, $Res Function(_TimetableState) then) =
      __$TimetableStateCopyWithImpl<$Res>;
  @override
  $Res call({WeekTimetable? weekTimetable});
}

/// @nodoc
class __$TimetableStateCopyWithImpl<$Res>
    extends _$TimetableStateCopyWithImpl<$Res>
    implements _$TimetableStateCopyWith<$Res> {
  __$TimetableStateCopyWithImpl(
      _TimetableState _value, $Res Function(_TimetableState) _then)
      : super(_value, (v) => _then(v as _TimetableState));

  @override
  _TimetableState get _value => super._value as _TimetableState;

  @override
  $Res call({
    Object? weekTimetable = freezed,
  }) {
    return _then(_TimetableState(
      weekTimetable: weekTimetable == freezed
          ? _value.weekTimetable
          : weekTimetable // ignore: cast_nullable_to_non_nullable
              as WeekTimetable?,
    ));
  }
}

/// @nodoc

class _$_TimetableState implements _TimetableState {
  const _$_TimetableState({this.weekTimetable});

  @override
  final WeekTimetable? weekTimetable;

  @override
  String toString() {
    return 'TimetableState(weekTimetable: $weekTimetable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimetableState &&
            (identical(other.weekTimetable, weekTimetable) ||
                const DeepCollectionEquality()
                    .equals(other.weekTimetable, weekTimetable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weekTimetable);

  @JsonKey(ignore: true)
  @override
  _$TimetableStateCopyWith<_TimetableState> get copyWith =>
      __$TimetableStateCopyWithImpl<_TimetableState>(this, _$identity);
}

abstract class _TimetableState implements TimetableState {
  const factory _TimetableState({WeekTimetable? weekTimetable}) =
      _$_TimetableState;

  @override
  WeekTimetable? get weekTimetable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimetableStateCopyWith<_TimetableState> get copyWith =>
      throw _privateConstructorUsedError;
}
