import 'package:flutter/material.dart';
import 'package:nocia/domain/timetable/service/lecture_color.dart';
import 'package:nocia/domain/timetable/service/timetable_day.dart';
import 'package:nocia/domain/timetable/lecture.dart';
import 'package:nocia/presentation/timetable/widgets/load_cell.dart';

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
    return Padding(
        padding: EdgeInsets.all(1),
        child: GestureDetector(
          child: Card(
            child: Container(
              child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          _lecture!["id"] == "init" ? "" : _lecture!["name"],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Container(
                            child: Center(
                              child: Text(
                                _lecture!["id"] == "init" ? "" : _lecture!["room"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: _lecture!["color"] == "white" && _lecture!["id"] != "init" ?
                              Color(0xFFCBC8C8) : getColor(getLectureColor(_lecture!["color"])),
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              border: Border()
                            ),
                            height: 20,
                            width: 50,
                        )
                      )
                    ],
                  )
              ),
              height: 100,
              color: getColor(getLectureColor(_lecture!["color"])),
            ),
          ),
          onTap: () {
            print("test");
          },
        )
    );
  }
}