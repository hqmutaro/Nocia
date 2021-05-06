// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsStateTearOff {
  const _$NewsStateTearOff();

  _NewsState call({List<News> newsList = const <News>[]}) {
    return _NewsState(
      newsList: newsList,
    );
  }
}

/// @nodoc
const $NewsState = _$NewsStateTearOff();

/// @nodoc
mixin _$NewsState {
  List<News> get newsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res>;
  $Res call({List<News> newsList});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;

  @override
  $Res call({
    Object? newsList = freezed,
  }) {
    return _then(_value.copyWith(
      newsList: newsList == freezed
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc
abstract class _$NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$NewsStateCopyWith(
          _NewsState value, $Res Function(_NewsState) then) =
      __$NewsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<News> newsList});
}

/// @nodoc
class __$NewsStateCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements _$NewsStateCopyWith<$Res> {
  __$NewsStateCopyWithImpl(_NewsState _value, $Res Function(_NewsState) _then)
      : super(_value, (v) => _then(v as _NewsState));

  @override
  _NewsState get _value => super._value as _NewsState;

  @override
  $Res call({
    Object? newsList = freezed,
  }) {
    return _then(_NewsState(
      newsList: newsList == freezed
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc

class _$_NewsState implements _NewsState {
  const _$_NewsState({this.newsList = const <News>[]});

  @JsonKey(defaultValue: const <News>[])
  @override
  final List<News> newsList;

  @override
  String toString() {
    return 'NewsState(newsList: $newsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewsState &&
            (identical(other.newsList, newsList) ||
                const DeepCollectionEquality()
                    .equals(other.newsList, newsList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newsList);

  @JsonKey(ignore: true)
  @override
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      __$NewsStateCopyWithImpl<_NewsState>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState({List<News> newsList}) = _$_NewsState;

  @override
  List<News> get newsList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
