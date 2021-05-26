import 'package:flutter/material.dart';

class TimetableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: (){
        print("aa");
      }
    );
  }
}