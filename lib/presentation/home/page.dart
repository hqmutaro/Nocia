import 'package:flutter/cupertino.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_state.dart';

import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<CounterNotifier, CounterState>(
      create: (_) => CounterNotifier(),
      child: Home(),
    );
  }
}