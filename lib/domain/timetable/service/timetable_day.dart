import 'package:match/match.dart';
part 'timetable_day.g.dart';

@match
enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday
}

String dayToJA(Day day) => day.match(
    monday: () => "月",
    tuesday: () => "火",
    wednesday: () => "水",
    thursday: () => "木",
    friday: () => "金",
    saturday: () => "土"
);

String dayToEN(Day day) => day.match(
    monday: () => "monday",
    tuesday: () => "tuesday",
    wednesday: () => "wednesday",
    thursday: () => "thursday",
    friday: () => "friday",
    saturday: () => "saturday"
);