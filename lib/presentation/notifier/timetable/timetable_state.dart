import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable_state.freezed.dart';

@freezed
abstract class TimetableState with _$TimetableState {
  const factory TimetableState({
    Map<String, List<Map<String, dynamic>?>>? timetable,
    String ? uuid,
    String? name,
    String? room,
    String? color
  }) = _TimetableState;
}