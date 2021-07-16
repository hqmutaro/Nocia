// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_day.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension DayMatch on Day {
  T match<T>(
      {required T Function() monday,
      required T Function() tuesday,
      required T Function() wednesday,
      required T Function() thursday,
      required T Function() friday,
      required T Function() saturday}) {
    final v = this;
    if (v == Day.Monday) {
      return monday();
    }

    if (v == Day.Tuesday) {
      return tuesday();
    }

    if (v == Day.Wednesday) {
      return wednesday();
    }

    if (v == Day.Thursday) {
      return thursday();
    }

    if (v == Day.Friday) {
      return friday();
    }

    if (v == Day.Saturday) {
      return saturday();
    }

    throw Exception('Day.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? monday,
      T Function()? tuesday,
      T Function()? wednesday,
      T Function()? thursday,
      T Function()? friday,
      T Function()? saturday}) {
    final v = this;
    if (v == Day.Monday && monday != null) {
      return monday();
    }

    if (v == Day.Tuesday && tuesday != null) {
      return tuesday();
    }

    if (v == Day.Wednesday && wednesday != null) {
      return wednesday();
    }

    if (v == Day.Thursday && thursday != null) {
      return thursday();
    }

    if (v == Day.Friday && friday != null) {
      return friday();
    }

    if (v == Day.Saturday && saturday != null) {
      return saturday();
    }

    return any();
  }
}
