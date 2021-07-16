import 'package:flutter/material.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_notifier.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_state.dart';
import 'package:nocia/presentation/timetable/widgets/load_cell.dart';
import 'package:provider/provider.dart';

import 'package:nocia/presentation/timetable/widgets/lecture_cell.dart';
import 'package:nocia/presentation/timetable/widgets/time_cell.dart';
import 'widgets/day_cell.dart';

import 'package:nocia/domain/timetable/service/timetable_day.dart';

class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<TimetableNotifier>().fetchTimetable(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          var timetable = context.select<TimetableState, Map<String, List<Map<String, dynamic>?>>?>((state) => state.timetable);
          return SingleChildScrollView(
            child: Table(
                columnWidths: {0: FlexColumnWidth(.6)},
                children: [_buildDayCell()] + List.generate(6, (time) => _buildLectureCell(timetable, time))
            ),
          );
        }
    );
  }
}

TableRow _buildDayCell() =>
  TableRow(children: <Widget>[TimeCell("")] + Day.values.map((day) => DayCell(dayToJA(day))).toList());

TableRow _buildLectureCell(Map<String, List<Map<String, dynamic>?>>? timetable, int time) =>
    TableRow(
        children: <Widget>[TimeCell((time + 1).toString())]
            + Day.values.map((day) =>
            (timetable == null) || (timetable[dayToEN(day)] == null) ?
            LoadCell() :
            LectureCell(lecture: timetable[dayToEN(day)]![time], day: day, time: time + 1)).toList()
    );