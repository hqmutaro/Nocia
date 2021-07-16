import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'package:nocia/application/user/user_notifier.dart';
import 'package:nocia/application/user/user_state.dart';
import 'application/auth/auth_application.dart';

import 'package:nocia/infrastructure/auth/google_auth_repository.dart';
import 'infrastructure/auth/firebase_auth_repository.dart';

import 'package:nocia/presentation/app.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:nocia/presentation/notifier/auth/auth_values_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  runApp(
    MultiProvider(
      providers: [
        StateNotifierProvider<UserNotifier, UserState>(create: (_) => UserNotifier(
            authRepository: FirebaseAuthRepository(firebaseAuth: FirebaseAuth.instance)
        )),
        StateNotifierProvider<AuthNotifier, AuthValuesState>(
            create: (_) => AuthNotifier(
                app: AuthApplication(
                    repository: FirebaseAuthRepository(firebaseAuth: FirebaseAuth.instance),
                    googleService: GoogleAuthService(googleSignIn: GoogleSignIn())
                )
            )
        )
      ],
      child: App(),
    )
  );
}