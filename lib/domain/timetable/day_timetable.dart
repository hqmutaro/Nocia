import 'package:nocia/domain/timetable/lecture.dart';

class DayTimetable {
  final Map<String, dynamic>? _first;
  final Map<String, dynamic>? _second;
  final Map<String, dynamic>? _third;
  final Map<String, dynamic>? _fourth;
  final Map<String, dynamic>? _fifth;
  final Map<String, dynamic>? _sixth;

  DayTimetable({
    required Map<String, dynamic>? first,
    required Map<String, dynamic>? second,
    required Map<String, dynamic>? third,
    required Map<String, dynamic>? fourth,
    required Map<String, dynamic>? fifth,
    required Map<String, dynamic>? sixth
  })  : _first = first,
        _second = second,
        _third = third,
        _fourth = fourth,
        _fifth = fifth,
        _sixth = sixth;

  Map<String, dynamic>? get first => _first;

  Map<String, dynamic>? get second => _second;

  Map<String, dynamic>? get third => _third;

  Map<String, dynamic>? get fourth => _fourth;

  Map<String, dynamic>? get fifth => _fifth;

  Map<String, dynamic>? get sixth => _sixth;
}

enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday
}

String dayToJA(Day day) {
  switch (day) {
    case Day.Monday:
      return "月";
    case Day.Tuesday:
      return "火";
    case Day.Wednesday:
      return "水";
    case Day.Thursday:
      return "木";
    case Day.Friday:
      return "金";
    case Day.Saturday:
      return "土";
  }
}

String dayToEN(Day day) {
  switch (day) {
    case Day.Monday:
      return "monday";
    case Day.Tuesday:
      return "tuesday";
    case Day.Wednesday:
      return "wednesday";
    case Day.Thursday:
      return "thursday";
    case Day.Friday:
      return "friday";
    case Day.Saturday:
      return "saturday";
  }
}