import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nocia/application/auth/auth_application.dart';
import 'package:nocia/infrastructure/auth/firebase_auth_repository.dart';
import 'package:nocia/presentation/auth/main.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:nocia/presentation/notifier/auth/auth_values_state.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AuthNotifier, AuthValuesState>(
      create: (_) => AuthNotifier(
        app: AuthApplication(
            repository: FirebaseAuthRepository(firebaseAuth: FirebaseAuth.instance)
        )
      ),
      child: Auth(),
    );
  }
}