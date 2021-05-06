const String activityName = "学校の活動";
const String examinationName = "受験をお考えの方";
const String notificationName = "学生・保護者の方へ";

const int activityId = 0;
const int examinationId = 1;
const int notificationId = 2;

enum RssType {
  Activity,
  Examination,
  Notification
}

String toTypeName(RssType type) {
  switch (type) {
    case RssType.Activity:
      return activityName;
    case RssType.Examination:
      return examinationName;
    case RssType.Notification:
      return notificationName;
    default:
      throw Exception("Type Not Found");
  }
}

RssType toType(int id) {
  switch (id) {
    case activityId:
      return RssType.Activity;
    case examinationId:
      return RssType.Examination;
    case notificationId:
      return RssType.Notification;
    default:
      throw Exception("ID Not Found");
  }
}