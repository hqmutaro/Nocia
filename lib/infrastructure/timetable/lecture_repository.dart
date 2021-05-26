import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nocia/domain/timetable/lecture.dart';
import 'package:nocia/domain/timetable/lecture_repository_base.dart';
import 'package:nocia/domain/timetable/value/lecture_id.dart';
import 'package:nocia/domain/timetable/value/lecture_name.dart';
import 'package:nocia/domain/timetable/value/room_name.dart';
import 'package:nocia/infrastructure/dto/lecture_dto.dart';

class LectureRepository implements LectureRepositoryBase {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  LectureRepository({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore
  }) :  _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  @override
  Future<void> init() async {
    var id = LectureId("init");
    var name = LectureName("init");
    var room = RoomName("init");
    var lecture = Lecture(id: id, name: name, room: room);
    await save(lecture);
  }

  @override
  Future<void> save(Lecture lecture) async {
    var dto = LectureDTO.encode(lecture);
    await _firestore.collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("lectures").doc(lecture.id.uuid)
        .set(dto);
  }

  @override
  Future<Map<String, dynamic>> find(LectureId id) async {
    var snapshot = await _firestore.collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("lectures").doc(id.uuid)
        .get();
    return snapshot.data()!;
  }

  @override
  Future<void> delete(LectureId id) async {
    await _firestore.collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("lectures").doc(id.uuid)
        .delete();
  }

  @override
  Future<void> update(LectureId id, {String? name, String? room}) async {
    var map = <String, String>{};
    if (name != null) map.addAll({"name": name});
    if (room != null) map.addAll({"room": room});
    await _firestore.collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("lectures").doc(id.uuid)
        .update(map);
  }

  @override
  Future<List<Map<String, dynamic>>> findAll() async {
    var snapshot = await _firestore.collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection("lectures")
        .get();
    var map = snapshot.docs.map((e) => e.data()).toList();
    return map;
  }
}