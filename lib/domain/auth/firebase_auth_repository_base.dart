import 'package:firebase_auth/firebase_auth.dart';
import 'package:nocia/domain/auth/value/email_address.dart';
import 'package:nocia/domain/auth/value/password.dart';

abstract class FirebaseAuthRepositoryBase {
  Future<void> registerWithEmailAndPassword({required EmailAddress email, required Password password});
  Future<void> signInWithEmailAndPassword({required EmailAddress email, required Password password});
  Future<User?> getSignedInUser();
  Future<void> signOut();
}