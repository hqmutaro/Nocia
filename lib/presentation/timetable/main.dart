import 'package:flutter/material.dart';
import 'package:nocia/infrastructure/dto/week_timetable.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_notifier.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_state.dart';
import 'package:nocia/presentation/timetable/widgets/load_cell.dart';
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
            return _initTable();
          }

          var weekTimetable = context.select<TimetableState, WeekTimetable?>((state) => state.weekTimetable);
          if (weekTimetable == null) {
            return _initTable();
          }

          return SingleChildScrollView(
            child: Table(
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
                      LectureCell(lecture: weekTimetable.monday[time], day: Day.Monday, time: time + 1),
                      LectureCell(lecture: weekTimetable.tuesday[time], day: Day.Tuesday, time: time + 1),
                      LectureCell(lecture: weekTimetable.wednesday[time], day: Day.Wednesday, time: time + 1),
                      LectureCell(lecture: weekTimetable.thursday[time], day: Day.Tuesday, time: time + 1),
                      LectureCell(lecture: weekTimetable.friday[time], day: Day.Friday, time: time + 1),
                      LectureCell(lecture: weekTimetable.saturday[time], day: Day.Saturday, time: time + 1),
                    ]
                ))
            ),
          );
        }
    );
  }

  Table _initTable() => Table(
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
          ] + List.generate(6, (index) => LoadCell())
      ))
  );
}