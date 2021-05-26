import 'package:flutter/material.dart';

@immutable
class LectureName {
  final String value;

  LectureName(this.value);

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is LectureName && value == other.value);

  @override
  int get hashCode => super.hashCode;
}