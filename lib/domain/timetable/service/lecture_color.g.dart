// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_color.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension LectureColorMatch on LectureColor {
  T match<T>(
      {required T Function() white,
      required T Function() yellow,
      required T Function() blue,
      required T Function() red,
      required T Function() green,
      required T Function() cyan,
      required T Function() brown,
      required T Function() pink}) {
    final v = this;
    if (v == LectureColor.White) {
      return white();
    }

    if (v == LectureColor.Yellow) {
      return yellow();
    }

    if (v == LectureColor.Blue) {
      return blue();
    }

    if (v == LectureColor.Red) {
      return red();
    }

    if (v == LectureColor.Green) {
      return green();
    }

    if (v == LectureColor.Cyan) {
      return cyan();
    }

    if (v == LectureColor.Brown) {
      return brown();
    }

    if (v == LectureColor.Pink) {
      return pink();
    }

    throw Exception('LectureColor.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? white,
      T Function()? yellow,
      T Function()? blue,
      T Function()? red,
      T Function()? green,
      T Function()? cyan,
      T Function()? brown,
      T Function()? pink}) {
    final v = this;
    if (v == LectureColor.White && white != null) {
      return white();
    }

    if (v == LectureColor.Yellow && yellow != null) {
      return yellow();
    }

    if (v == LectureColor.Blue && blue != null) {
      return blue();
    }

    if (v == LectureColor.Red && red != null) {
      return red();
    }

    if (v == LectureColor.Green && green != null) {
      return green();
    }

    if (v == LectureColor.Cyan && cyan != null) {
      return cyan();
    }

    if (v == LectureColor.Brown && brown != null) {
      return brown();
    }

    if (v == LectureColor.Pink && pink != null) {
      return pink();
    }

    return any();
  }
}
