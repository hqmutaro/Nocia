import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nocia/application/auth/auth_application.dart';
import 'package:nocia/infrastructure/auth/firebase_auth_repository.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:nocia/presentation/notifier/auth/auth_values_state.dart';
import 'package:nocia/presentation/notifier/home/counter_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_state.dart';
import 'package:provider/provider.dart';

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