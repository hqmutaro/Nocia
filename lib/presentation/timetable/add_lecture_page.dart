import 'package:flutter/material.dart';

class AddLecturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Center(
        child: IconButton(icon: Icon(Icons.ac_unit), onPressed: ()=> Navigator.pop(context)),
      )
    );
  }
}