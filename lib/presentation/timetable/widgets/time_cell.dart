import 'package:flutter/material.dart';

class TimeCell extends StatelessWidget {
  final String _time;

  const TimeCell(String time) : _time = time;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.only(top: (_time == "") ? 0 : 50),
          child: Center(
              child: Text(
                  _time,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  )
              )
          ),
        )
    );
  }
}