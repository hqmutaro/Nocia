import 'package:nocia/domain/timetable/lecture.dart';
import 'package:nocia/domain/timetable/lecture_factory_base.dart';
import 'package:nocia/domain/timetable/service/lecture_color.dart';
import 'package:nocia/domain/timetable/value/lecture_id.dart';
import 'package:nocia/domain/timetable/value/lecture_name.dart';
import 'package:nocia/domain/timetable/value/room_name.dart';
import 'package:uuid/uuid.dart';

class LectureFactory implements LectureFactoryBase {
  @override
  Lecture create({
    required LectureName name,
    required RoomName room,
    required LectureColor color
  }) {
    return Lecture(
      id: LectureId(Uuid().v4()),
      name: name,
      room: room,
      color: color
    );
  }
}