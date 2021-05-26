import 'package:nocia/domain/timetable/value/lecture_id.dart';
import 'package:nocia/domain/timetable/value/lecture_name.dart';
import 'package:nocia/domain/timetable/value/room_name.dart';

class Lecture {
  final LectureId id;
  final LectureName _name;
  final RoomName _room;

  Lecture({
    required this.id,
    required LectureName name,
    required RoomName room
  })  : _name = name,
        _room = room;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is Lecture && other.id == id);

  @override
  int get hashCode => super.hashCode;

  LectureName get name => _name;

  RoomName get room => _room;
}