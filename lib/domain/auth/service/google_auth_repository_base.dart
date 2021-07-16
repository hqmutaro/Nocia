import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthServiceBase {
  Future<UserCredential> handleSignIn();
}