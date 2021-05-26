import 'package:flutter/material.dart';

@immutable
class LectureId {
  final String uuid;

  LectureId(this.uuid);

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is LectureId && uuid == other.uuid);

  @override
  int get hashCode => uuid.hashCode;
}