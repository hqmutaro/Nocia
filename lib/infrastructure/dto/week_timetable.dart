import 'package:nocia/domain/timetable/day_timetable.dart';

class WeekTimetable {
  final List<Map<String, dynamic>?> _monday;
  final List<Map<String, dynamic>?> _tuesday;
  final List<Map<String, dynamic>?> _wednesday;
  final List<Map<String, dynamic>?> _thursday;
  final List<Map<String, dynamic>?> _friday;
  final List<Map<String, dynamic>?> _saturday;

  WeekTimetable({
    required List<Map<String, dynamic>?> monday,
    required List<Map<String, dynamic>?> tuesday,
    required List<Map<String, dynamic>?> wednesday,
    required List<Map<String, dynamic>?> thursday,
    required List<Map<String, dynamic>?> friday,
    required List<Map<String, dynamic>?> saturday
  })  : _monday = monday,
        _tuesday = tuesday,
        _wednesday = wednesday,
        _thursday = thursday,
        _friday = friday,
        _saturday = saturday;

  List<Map<String, dynamic>?> get monday => _monday;

  List<Map<String, dynamic>?> get tuesday => _tuesday;

  List<Map<String, dynamic>?> get wednesday => _wednesday;

  List<Map<String, dynamic>?> get thursday => _thursday;

  List<Map<String, dynamic>?> get friday => _friday;

  List<Map<String, dynamic>?> get saturday => _saturday;
}