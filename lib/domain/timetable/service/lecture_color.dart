import 'package:flutter/material.dart';
import 'package:match/match.dart';
part 'lecture_color.g.dart';

@match
enum LectureColor {
  White,
  Yellow,
  Blue,
  Red,
  Green,
  Cyan,
  Brown,
  Pink
}

Color getColor(LectureColor color) => color.match(
    white: () => Colors.white,
    yellow: () => Colors.yellow,
    blue: () => Colors.blueAccent,
    red: () => Colors.redAccent,
    green: () => Colors.lightGreenAccent,
    cyan: () => Colors.cyanAccent,
    brown: () => Colors.brown,
    pink: () => Colors.pinkAccent
);

LectureColor getLectureColor(String color) => color.match({
    eq("white"): () => LectureColor.White,
    eq("yellow"): () => LectureColor.Yellow,
    eq("blue"): () => LectureColor.Blue,
    eq("red"): () => LectureColor.Red,
    eq("green"): () => LectureColor.Green,
    eq("cyan"): () => LectureColor.Cyan,
    eq("brown"): () => LectureColor.Brown,
    eq("pink"): () => LectureColor.Pink,
});

String getLectureColorStr(LectureColor color) => color.match(
    white: () => "white",
    yellow: () => "yellow",
    blue: () => "blue",
    red: () => "red",
    green: () => "green",
    cyan: () => "cyan",
    brown: () => "brown",
    pink: () => "pink"
);