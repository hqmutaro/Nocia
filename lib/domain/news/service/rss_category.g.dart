// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_category.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension RssCategoryMatch on RssCategory {
  T match<T>(
      {required T Function() activity,
      required T Function() examination,
      required T Function() notification}) {
    final v = this;
    if (v == RssCategory.Activity) {
      return activity();
    }

    if (v == RssCategory.Examination) {
      return examination();
    }

    if (v == RssCategory.Notification) {
      return notification();
    }

    throw Exception('RssCategory.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? activity,
      T Function()? examination,
      T Function()? notification}) {
    final v = this;
    if (v == RssCategory.Activity && activity != null) {
      return activity();
    }

    if (v == RssCategory.Examination && examination != null) {
      return examination();
    }

    if (v == RssCategory.Notification && notification != null) {
      return notification();
    }

    return any();
  }
}
