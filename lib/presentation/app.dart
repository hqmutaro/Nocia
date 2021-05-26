import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nocia/presentation/home/page.dart';
import 'package:nocia/presentation/notifier/home/counter_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_state.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}