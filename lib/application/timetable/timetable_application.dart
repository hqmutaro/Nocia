import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nocia/domain/timetable/service/lecture_color.dart';
import 'package:nocia/domain/timetable/service/timetable_day.dart';
import 'package:nocia/domain/timetable/lecture_factory_base.dart';
import 'package:nocia/domain/timetable/lecture_repository_base.dart';
import 'package:nocia/domain/timetable/timetable_repository_base.dart';
import 'package:nocia/domain/timetable/value/lecture_id.dart';
import 'package:nocia/domain/timetable/value/lecture_name.dart';
import 'package:nocia/domain/timetable/value/room_name.dart';

class TimetableApplication {
  final TimetableRepositoryBase _timetableRepository;
  final LectureRepositoryBase _lectureRepository;
  final LectureFactoryBase _lectureFactory;

  TimetableApplication({
    required TimetableRepositoryBase timetableRepository,
    required LectureRepositoryBase lectureRepository,
    required LectureFactoryBase lectureFactory
  })  : _timetableRepository = timetableRepository,
        _lectureRepository = lectureRepository,
        _lectureFactory = lectureFactory;

  Future<void> initTimetable(Day day, int time) async {
    var id = LectureId("init"); // initialized
    await _timetableRepository.save(day, time, id);
  }

  Future<Map<String, List<Map<String, dynamic>?>>> fetchTimetable() async {
    var docs = await _timetableRepository.fetch();

    var dayTimetables = <String, List<Map<String, dynamic>?>>{};
    await Future.wait(docs.map((snapshot) async => dayTimetables[snapshot.id] = await _factoryDayTimetable(snapshot)).toList());

    return dayTimetables;
  }

  // DayTimetableは使わなくなった
  Future<List<Map<String, dynamic>?>> _factoryDayTimetable(QueryDocumentSnapshot<Map<String, dynamic>?> doc) async {
    Map<String, dynamic> data = doc.data()!;
    final List<Map<String, dynamic>> lectures = await Future.wait(
        List.generate(6, (i) {
          return _lectureRepository.find(LectureId(data[(i + 1).toString()]));
        }).toList()
    );
    return lectures;
}

  Future<void> updateTimetable(Day day, int time, String uuid) async {
    final id = LectureId(uuid);
    await _timetableRepository.update(day, time, id);
  }

  Future<void> deleteTimetable(Day day, int time) async {
    await _timetableRepository.delete(day, time);
  }

  Future<void> saveLecture(String lectureNameStr, String roomNameStr, String colorStr) async {
    final lectureName = LectureName(lectureNameStr);
    final roomName = RoomName(roomNameStr);
    final color = getLectureColor(colorStr);
    final lecture = _lectureFactory.create(
        name: lectureName,
        room: roomName,
        color: color
    );
    await _lectureRepository.save(lecture);
  }

  Future<List<Map<String, dynamic>>> findAllLecture() async =>
      await _lectureRepository.findAll();

  Future<Map<String, dynamic>?> findLectureById(String uuid) async {
    final id = LectureId(uuid);
    return await _lectureRepository.find(id);
  }

  Future<void> deleteLectureById(String uuid) async {
    final id = LectureId(uuid);
    return await _lectureRepository.delete(id);
  }

  Future<void> updateLecture(String uuid, {String? name, String? room, String? color}) async {
    final id = LectureId(uuid);
    await _lectureRepository.update(id, name: name, room: room, color: color);
  }
}