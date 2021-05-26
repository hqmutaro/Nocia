import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nocia/domain/timetable/day_timetable.dart';
import 'package:nocia/domain/timetable/value/lecture_id.dart';

abstract class TimetableRepositoryBase {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>?>>> fetch();
  Future<void> init();
  Future<void> save(Day day, int time, LectureId id);
  Future<void> update(Day day, int time, LectureId id);
  Future<void> delete(Day day, int time);
}