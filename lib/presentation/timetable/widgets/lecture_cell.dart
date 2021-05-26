import 'package:flutter/material.dart';
import 'package:nocia/domain/timetable/day_timetable.dart';
import 'package:nocia/domain/timetable/lecture.dart';

class LectureCell extends StatelessWidget {
  Map<String, dynamic>? _lecture;
  final Day _day;
  final int _time;

  LectureCell({
    required Map<String, dynamic>? lecture,
    required Day day,
    required int time
  })  : _lecture = lecture,
        _day = day,
        _time = time;

  @override
  Widget build(BuildContext context) {
    if (_lecture!["id"] == "init") {
      return Padding(
          padding: EdgeInsets.all(1),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFF1F1F1),
              ),
              height: 100,
            ),
          )
      );
    }
    return Container();
  }
}