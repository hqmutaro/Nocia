import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:nocia/domain/auth/service/google_auth_repository_base.dart';
import 'package:nocia/domain/news/rss_repository_base.dart';
import 'package:nocia/domain/timetable/lecture_repository_base.dart';
import 'package:nocia/domain/timetable/timetable_repository_base.dart';
import 'package:nocia/infrastructure/auth/firebase_auth_repository.dart';
import 'package:nocia/infrastructure/auth/google_auth_repository.dart';
import 'package:nocia/infrastructure/news/rss_repository.dart';
import 'package:nocia/infrastructure/timetable/lecture_repository.dart';
import 'package:nocia/infrastructure/timetable/timetable_repository.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  firebaseAuthRepository();
  googleAuthRepository();
  rssRepository();
  lectureRepository();
  timetableRepository();
}

void firebaseAuthRepository() => getIt.registerLazySingleton<FirebaseAuthRepositoryBase>(() =>
    FirebaseAuthRepository(firebaseAuth: FirebaseAuth.instance));

void googleAuthRepository() => getIt.registerLazySingleton<GoogleAuthServiceBase>(() =>
    GoogleAuthService(googleSignIn: GoogleSignIn()));

void rssRepository() => getIt.registerLazySingleton<RssRepositoryBase>(() => RssRepository());

void lectureRepository() => getIt.registerLazySingleton<LectureRepositoryBase>(() =>
    LectureRepository(firebaseAuth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

void timetableRepository() => getIt.registerLazySingleton<TimetableRepositoryBase>(() =>
    TimetableRepository(firebaseAuth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));