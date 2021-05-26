import 'package:nocia/domain/timetable/lecture.dart';

class LectureDTO {
  static Lecture decode(Map<String, dynamic> map) {
    return Lecture(
        id: map["id"],
        name: map["name"],
        room: map["room"]
    );
  }

  static Map<String, dynamic> encode(Lecture lecture) {
    return {
      "id": lecture.id.uuid,
      "name": lecture.name.value,
      "room": lecture.room.value
    };
  }
}