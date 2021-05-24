// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_values_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthValuesStateTearOff {
  const _$AuthValuesStateTearOff();

  _AuthValues call({String email = "", String password = ""}) {
    return _AuthValues(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $AuthValuesState = _$AuthValuesStateTearOff();

/// @nodoc
mixin _$AuthValuesState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthValuesStateCopyWith<AuthValuesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthValuesStateCopyWith<$Res> {
  factory $AuthValuesStateCopyWith(
          AuthValuesState value, $Res Function(AuthValuesState) then) =
      _$AuthValuesStateCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$AuthValuesStateCopyWithImpl<$Res>
    implements $AuthValuesStateCopyWith<$Res> {
  _$AuthValuesStateCopyWithImpl(this._value, this._then);

  final AuthValuesState _value;
  // ignore: unused_field
  final $Res Function(AuthValuesState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthValuesCopyWith<$Res>
    implements $AuthValuesStateCopyWith<$Res> {
  factory _$AuthValuesCopyWith(
          _AuthValues value, $Res Function(_AuthValues) then) =
      __$AuthValuesCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$AuthValuesCopyWithImpl<$Res>
    extends _$AuthValuesStateCopyWithImpl<$Res>
    implements _$AuthValuesCopyWith<$Res> {
  __$AuthValuesCopyWithImpl(
      _AuthValues _value, $Res Function(_AuthValues) _then)
      : super(_value, (v) => _then(v as _AuthValues));

  @override
  _AuthValues get _value => super._value as _AuthValues;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_AuthValues(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthValues implements _AuthValues {
  const _$_AuthValues({this.email = "", this.password = ""});

  @JsonKey(defaultValue: "")
  @override
  final String email;
  @JsonKey(defaultValue: "")
  @override
  final String password;

  @override
  String toString() {
    return 'AuthValuesState(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthValues &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$AuthValuesCopyWith<_AuthValues> get copyWith =>
      __$AuthValuesCopyWithImpl<_AuthValues>(this, _$identity);
}

abstract class _AuthValues implements AuthValuesState {
  const factory _AuthValues({String email, String password}) = _$_AuthValues;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthValuesCopyWith<_AuthValues> get copyWith =>
      throw _privateConstructorUsedError;
}
