import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:nocia/application/timetable/timetable_application.dart';
import 'package:nocia/domain/timetable/lecture_repository_base.dart';
import 'package:nocia/domain/timetable/timetable_repository_base.dart';

import 'package:nocia/infrastructure/timetable/lecture_factory.dart';
import 'package:nocia/infrastructure/timetable/lecture_repository.dart';
import 'package:nocia/infrastructure/timetable/timetable_repository.dart';
import 'package:nocia/main.dart';

import 'package:nocia/presentation/notifier/timetable/timetable_notifier.dart';
import 'package:nocia/presentation/notifier/timetable/timetable_state.dart';
import 'package:nocia/presentation/timetable/main.dart';

import '../../injector.config.dart';

class TimetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TimetableNotifier, TimetableState>(
      create: (_) => TimetableNotifier(
          app: TimetableApplication(
            timetableRepository: getIt<TimetableRepositoryBase>(),
            lectureRepository: getIt<LectureRepositoryBase>(),
            lectureFactory: LectureFactory()
          )
      ),
      child: Timetable(),
    );
  }
}