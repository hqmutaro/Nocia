import 'package:nocia/domain/timetable/day_timetable.dart';

class WeekTimetable {
  final DayTimetable _monday;
  final DayTimetable _tuesday;
  final DayTimetable _wednesday;
  final DayTimetable _thursday;
  final DayTimetable _friday;
  final DayTimetable _saturday;

  WeekTimetable({
    required DayTimetable monday,
    required DayTimetable tuesday,
    required DayTimetable wednesday,
    required DayTimetable thursday,
    required DayTimetable friday,
    required DayTimetable saturday
  })  : _monday = monday,
        _tuesday = tuesday,
        _wednesday = wednesday,
        _thursday = thursday,
        _friday = friday,
        _saturday = saturday;

  DayTimetable get monday => _monday;

  DayTimetable get tuesday => _tuesday;

  DayTimetable get wednesday => _wednesday;

  DayTimetable get thursday => _thursday;

  DayTimetable get friday => _friday;

  DayTimetable get saturday => _saturday;
}