import 'package:nocia/domain/timetable/lecture.dart';
import 'package:nocia/domain/timetable/value/lecture_id.dart';

abstract class LectureRepositoryBase {
  Future<void> init();
  Future<void> save(Lecture lecture);
  Future<Map<String, dynamic>> find(LectureId id);
  Future<void> delete(LectureId id);
  Future<void> update(LectureId id, {String? name, String? room});
  Future<List<Map<String, dynamic>>> findAll();
}