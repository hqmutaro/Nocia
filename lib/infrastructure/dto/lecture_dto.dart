import 'package:nocia/domain/timetable/lecture.dart';
import 'package:nocia/domain/timetable/service/lecture_color.dart';

class LectureDTO {
  static Lecture decode(Map<String, dynamic> map) {
    return Lecture(
        id: map["id"],
        name: map["name"],
        room: map["room"],
        color: map["color"]
    );
  }

  static Map<String, dynamic> encode(Lecture lecture) {
    return {
      "id": lecture.id.uuid,
      "name": lecture.name.value,
      "room": lecture.room.value,
      "color": getLectureColorStr(lecture.color)
    };
  }
}