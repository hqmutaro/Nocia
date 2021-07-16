import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:nocia/domain/auth/value/email_address.dart';
import 'package:nocia/domain/auth/value/password.dart';

@Injectable(as: FirebaseAuthRepositoryBase)
class FirebaseAuthRepository implements FirebaseAuthRepositoryBase {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository({required FirebaseAuth firebaseAuth})  : _firebaseAuth = firebaseAuth;

  @override
  User? getSignedInUser() =>  _firebaseAuth.currentUser;

  @override
  Future<UserCredential> registerWithEmailAndPassword({
    required EmailAddress email,
    required Password password
  }) async {
    final String emailValue = email.value;
    final String passwordValue = password.value;
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailValue,
        password: passwordValue
    );
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required EmailAddress email,
    required Password password
  }) async {
    final emailValue = email.value;
    final passwordValue = password.value;
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: emailValue,
        password: passwordValue
    );
  }

  @override
  Future<void> sendPasswordResetEmail({required EmailAddress email}) async {
    final emailValue = email.value;
    await _firebaseAuth.sendPasswordResetEmail(email: emailValue);
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _firebaseAuth.signOut()
    ]);
  }
}