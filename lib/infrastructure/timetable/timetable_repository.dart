import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nocia/domain/timetable/service/timetable_day.dart';
import 'package:nocia/domain/timetable/timetable_repository_base.dart';
import 'package:nocia/domain/timetable/value/lecture_id.dart';

class TimetableRepository implements TimetableRepositoryBase {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  TimetableRepository({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore
  }) :  _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetch() async {
    var snapshot;
    try {
      snapshot = await _firestore.collection("users").doc(_firebaseAuth.currentUser!.uid)
          .collection("timetable").get(GetOptions(source: Source.cache));
    }
    catch (e) {
      snapshot = await _firestore.collection("users").doc(_firebaseAuth.currentUser!.uid)
          .collection("timetable").get(GetOptions(source: Source.server));
    }

    return snapshot.docs;
  }

  Future<void> init() async {
    Day.values.map((Day day) async =>
    await _firestore.collection("users").doc(_firebaseAuth.currentUser!.uid)
        .collection("timetable").doc(dayToEN(day))
        .set({
      "1" : "init",
      "2" : "init",
      "3" : "init",
      "4" : "init",
      "5" : "init",
      "6" : "init"
    })
    ).toList();
  }

  @override
  Future<void> save(Day day, int time, LectureId id) async {
    await _firestore.collection("users").doc(_firebaseAuth.currentUser!.uid)
        .collection("timetable").doc(dayToEN(day))
        .set({time.toString() : id.uuid});
  }

  @override
  Future<void> update(Day day, int time, LectureId id) async {
    await _firestore.collection("users").doc(_firebaseAuth.currentUser!.uid)
        .collection("timetable").doc(dayToEN(day))
        .update({time.toString() : id.uuid});
  }

  @override
  Future<void> delete(Day day, int time) async {
    await _firestore.collection("users").doc(_firebaseAuth.currentUser!.uid)
        .collection("timetable").doc(dayToEN(day))
        .delete();
  }
}