import 'package:flutter/material.dart';

ThemeData nociaTheme() =>
    ThemeData(
      scaffoldBackgroundColor: themeColor,
      cardColor: themeAccentColor,
      appBarTheme: AppBarTheme(
        color: themeColor
      ),
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white)
      ),
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
        backgroundColor: themeColor,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.white
      )
    );

Color get themeAccentColor => Color.fromRGBO(64, 75, 96, .9);
Color get themeColor => Color.fromRGBO(58, 66, 86, 1.0);