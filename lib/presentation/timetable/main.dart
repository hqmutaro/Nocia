import 'package:flutter/material.dart';
import 'package:nocia/infrastructure/dto/week_timetable.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_notifier.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_state.dart';
import 'package:provider/provider.dart';

import 'package:nocia/presentation/timetable/widgets/lecture_cell.dart';
import 'package:nocia/presentation/timetable/widgets/time_cell.dart';
import 'widgets/day_cell.dart';

import 'package:nocia/domain/timetable/day_timetable.dart';

class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<TimetableNotifier>().fetchTimetable(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          var weekTimetable = context.select<TimetableState, WeekTimetable?>((state) => state.weekTimetable);
          if (weekTimetable == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Table(
              columnWidths: {0: FlexColumnWidth(.6)},
              children: [
                TableRow(
                    children: <Widget>[
                      TimeCell("")
                    ] + Day.values.map((day) => DayCell(dayToJA(day))).toList()
                ),
              ] + List.generate(6, (time) => TableRow(
                  children: <Widget>[
                    TimeCell((time + 1).toString()),
                    LectureCell(lecture: weekTimetable.monday.first, day: Day.Monday, time: time + 1),
                    LectureCell(lecture: weekTimetable.tuesday.second, day: Day.Tuesday, time: time + 1),
                    LectureCell(lecture: weekTimetable.wednesday.third, day: Day.Wednesday, time: time + 1),
                    LectureCell(lecture: weekTimetable.thursday.fourth, day: Day.Tuesday, time: time + 1),
                    LectureCell(lecture: weekTimetable.friday.fifth, day: Day.Friday, time: time + 1),
                    LectureCell(lecture: weekTimetable.saturday.sixth, day: Day.Saturday, time: time + 1),
                  ]
              ))
          );
        }
    );
  }
}