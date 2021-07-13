import 'package:match/match.dart';
part 'rss_category.g.dart';

const String activityName = "学校の活動";
const String examinationName = "受験をお考えの方";
const String notificationName = "学生・保護者の方へ";

const int activityId = 0;
const int examinationId = 1;
const int notificationId = 2;

@match
enum RssCategory {
  Activity,
  Examination,
  Notification
}

String toCategoryName(RssCategory type) {
  return type.match(
      activity: () => activityName,
      examination: () => examinationName,
      notification: () => notificationName
  );
}

RssCategory toCategory(int id) {
  switch (id) {
    case activityId:
      return RssCategory.Activity;
    case examinationId:
      return RssCategory.Examination;
    case notificationId:
      return RssCategory.Notification;
    default:
      throw Exception("ID Not Found");
  }
}

bool isPDF(String url) => url.substring(28, 37) == "UserFiles";