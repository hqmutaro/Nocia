const String activityName = "学校の活動";
const String examinationName = "受験をお考えの方";
const String notificationName = "学生・保護者の方へ";

const int activityId = 0;
const int examinationId = 1;
const int notificationId = 2;

enum RssCategory {
  Activity,
  Examination,
  Notification
}

String toCategoryName(RssCategory type) {
  switch (type) {
    case RssCategory.Activity:
      return activityName;
    case RssCategory.Examination:
      return examinationName;
    case RssCategory.Notification:
      return notificationName;
    default:
      throw Exception("The Category Not Found");
  }
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