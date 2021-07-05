import 'package:flutter/material.dart';

class LoadCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(1),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xA3F1F1F1),
            ),
            height: 100,
          ),
        )
    );
  }
}