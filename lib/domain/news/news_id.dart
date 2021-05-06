import 'package:flutter/material.dart';

@immutable
class NewsId {
  final String uuid;

  NewsId(this.uuid);

  @override
  bool operator ==(Object other) =>
    identical(other, this) || (other is NewsId && uuid == other.uuid);

  @override
  int get hashCode => uuid.hashCode;
}