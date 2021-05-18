import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_values_state.freezed.dart';

@freezed
abstract class AuthValuesState with _$AuthValuesState {
  const factory AuthValuesState({
    @Default("") String email,
    @Default("") String password
  }) = _AuthValues;
}