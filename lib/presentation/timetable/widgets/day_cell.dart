import 'package:flutter/material.dart';

class DayCell extends StatelessWidget {
  final String _day;

  const DayCell(String day) : _day = day;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
              _day,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
          )
      ),
      height: 40,
      width: 40,
    );
  }
}