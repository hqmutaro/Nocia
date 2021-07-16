import 'package:nocia/domain/timetable/lecture_repository_base.dart';
import 'package:nocia/domain/timetable/timetable_repository_base.dart';

import '../injector.config.dart';

class Init {
  final TimetableRepositoryBase _timetableRepository = getIt<TimetableRepositoryBase>();
  final LectureRepositoryBase _lectureRepository = getIt<LectureRepositoryBase>();

  Future<void> initTimetable() async {
    await _timetableRepository.init();
    await _lectureRepository.init();
  }
}