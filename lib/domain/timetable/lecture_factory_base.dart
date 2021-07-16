import 'package:nocia/domain/timetable/lecture.dart';
import 'package:nocia/domain/timetable/service/lecture_color.dart';
import 'package:nocia/domain/timetable/value/lecture_name.dart';
import 'package:nocia/domain/timetable/value/room_name.dart';

abstract class LectureFactoryBase {
  Lecture create({
    required LectureName name,
    required RoomName room,
    required LectureColor color
  });
}