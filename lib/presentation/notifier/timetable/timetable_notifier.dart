import 'package:nocia/application/timetable/timetable_application.dart';
import 'package:nocia/domain/timetable/day_timetable.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_state.dart';
import 'package:state_notifier/state_notifier.dart';

class TimetableNotifier extends StateNotifier<TimetableState> {
  final TimetableApplication _app;

  TimetableNotifier({required TimetableApplication app})
      : _app = app,
        super(const TimetableState(weekTimetable: null));

  Future<void> initTimetable(Day day, int time) async =>
      _app.initTimetable(day, time);

  Future<void> fetchTimetable() async {
    var weekTimetable = await _app.fetchTimetable();
    state = state.copyWith(weekTimetable: weekTimetable);
  }

  Future<void> updateTimetable(Day day, int time, String uuid) async =>
      _app.updateTimetable(day, time, uuid);

  Future<void> deleteTimetable(Day day, int time) async {
    await _app.deleteTimetable(day, time);
    await _app.initTimetable(day, time);
  }

  Future<void> saveLecture(String lectureNameStr, String roomNameStr) async =>
      _app.saveLecture(lectureNameStr, roomNameStr);

  Future<Map<String, dynamic>?> findLectureById(String uuid) async =>
      _app.findLectureById(uuid);

  Future<void> deleteLectureById(String uuid) async =>
      _app.deleteLectureById(uuid);

  Future<void> updateLecture(String uuid, {String? name, String? room}) async =>
      _app.updateLecture(uuid, name: name, room: room);
}