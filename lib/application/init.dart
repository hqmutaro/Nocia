import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nocia/domain/timetable/lecture_repository_base.dart';
import 'package:nocia/domain/timetable/timetable_repository_base.dart';
import 'package:nocia/infrastructure/timetable/lecture_repository.dart';
import 'package:nocia/infrastructure/timetable/timetable_repository.dart';

class Init {
  final TimetableRepositoryBase _timetableRepository = TimetableRepository(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance
  );
  final LectureRepositoryBase _lectureRepository = LectureRepository(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance
  );

  Future<void> initTimetable() async {
    await _timetableRepository.init();
    await _lectureRepository.init();
  }
}