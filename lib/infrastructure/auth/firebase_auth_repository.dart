import 'package:firebase_auth/firebase_auth.dart';
import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:nocia/domain/auth/value/email_address.dart';
import 'package:nocia/domain/auth/value/password.dart';

class FirebaseAuthRepository implements FirebaseAuthRepositoryBase {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository({required FirebaseAuth firebaseAuth})  : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> getSignedInUser() async =>  _firebaseAuth.currentUser;

  @override
  Future<void> registerWithEmailAndPassword({
    required EMailAddress email,
    required Password password
  }) async {
    final emailValue = email.value;
    final passwordValue = password.value;
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailValue,
        password: passwordValue
    );
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required EMailAddress email,
    required Password password
  }) async {
    final emailValue = email.value;
    final passwordValue = password.value;
    await _firebaseAuth.signInWithEmailAndPassword(
        email: emailValue,
        password: passwordValue
    );
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _firebaseAuth.signOut()
    ]);
  }
}