import 'package:nocia/application/timetable/timetable_application.dart';
import 'package:nocia/domain/timetable/service/timetable_day.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_state.dart';
import 'package:state_notifier/state_notifier.dart';

class TimetableNotifier extends StateNotifier<TimetableState> {
  final TimetableApplication _app;

  TimetableNotifier({required TimetableApplication app})
      : _app = app, super(const TimetableState(
            timetable: null,
            uuid: null,
            name: null,
            room: null,
            color: null));

  Future<void> initTimetable(Day day, int time) async =>
      _app.initTimetable(day, time);

  Future<void> fetchTimetable() async {
    var timetable = await _app.fetchTimetable();
    state = state.copyWith(timetable: timetable);
  }

  Future<void> updateTimetable(Day day, int time, String uuid) async =>
      _app.updateTimetable(day, time, uuid);

  Future<void> deleteTimetable(Day day, int time) async {
    await _app.deleteTimetable(day, time);
    await _app.initTimetable(day, time);
  }

  Future<void> saveLecture() async {
    var lectureName = state.name;
    var lectureRoom = state.room;
    var lectureColor = state.color;
    if ((lectureName == null) || (lectureRoom == null) || (lectureColor == null)) {
      throw NullThrownError();
    }
    await _app.saveLecture(lectureName, lectureRoom, lectureColor);
  }

  Future<Map<String, dynamic>?> findLectureById() async {
    var uuid = state.uuid;
    if (uuid == null) throw NullThrownError();
    return await _app.findLectureById(uuid);
  }

  Future<void> deleteLectureById() async {
    var uuid = state.uuid;
    if (uuid == null) throw NullThrownError();
    await _app.deleteLectureById(uuid);
  }

  Future<void> updateLecture() async {
    var uuid = state.uuid;
    var name = state.name;
    var room = state.room;
    var color = state.color;
    if (uuid == null) throw NullThrownError();
    await _app.updateLecture(uuid, name: name, room: room, color: color);
  }

  void setLectureName(String name) => state = state.copyWith(name: name);

  void setLectureRoom(String room) => state = state.copyWith(room: room);

  void setLectureColor(String color) => state = state.copyWith(color: color);
}