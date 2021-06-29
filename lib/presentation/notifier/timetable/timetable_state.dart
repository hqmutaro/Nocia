import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nocia/infrastructure/dto/week_timetable.dart';

part 'timetable_state.freezed.dart';

@freezed
abstract class TimetableState with _$TimetableState {
  const factory TimetableState({
    WeekTimetable? weekTimetable,
    String? name,
    String? room,
  }) = _TimetableState;
}