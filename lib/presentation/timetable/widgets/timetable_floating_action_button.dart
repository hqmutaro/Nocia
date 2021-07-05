import 'package:flutter/material.dart';
import 'package:nocia/presentation/timetable/add_lecture_page.dart';

class TimetableFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => AddLecturePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeUpwardsPageTransitionsBuilder()
                .buildTransitions(
                MaterialPageRoute(builder: (context) => AddLecturePage()),
                context,
                animation,
                secondaryAnimation,
                child
            );
          },
        ));
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Icon(Icons.add),
      ),
      elevation: 4.0,
    );
  }
}