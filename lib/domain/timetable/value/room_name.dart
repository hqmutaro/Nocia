import 'package:flutter/material.dart';

@immutable
class RoomName {
  final String value;

  RoomName(this.value);

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is RoomName && value == other.value);

  @override
  int get hashCode => super.hashCode;
}