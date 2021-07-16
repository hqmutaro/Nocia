import 'package:firebase_auth/firebase_auth.dart';
import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:nocia/domain/auth/service/google_auth_repository_base.dart';
import 'package:nocia/domain/auth/value/email_address.dart';
import 'package:nocia/domain/auth/value/password.dart';

class AuthApplication {
  final FirebaseAuthRepositoryBase _authRepository;
  final GoogleAuthServiceBase _googleService;

  AuthApplication({
    required FirebaseAuthRepositoryBase repository,
    required GoogleAuthServiceBase googleService
  })  : _authRepository = repository,
        _googleService = googleService;

  Future<UserCredential> registerWithEmailAndPassword(String emailStr, String passwordStr) async {
    final EmailAddress emailAddress = EmailAddress(emailStr);
    final Password password = Password(passwordStr);
    return await _authRepository.registerWithEmailAndPassword(email: emailAddress, password: password);
  }

  Future<UserCredential> signInWithEmailAndPassword(String emailStr, String passwordStr) async {
    final EmailAddress emailAddress = EmailAddress(emailStr);
    final Password password = Password(passwordStr);
    return await _authRepository.signInWithEmailAndPassword(email: emailAddress, password: password);
  }

  Future<void> sendPasswordResetEmail(String emailStr) async {
    final EmailAddress emailAddress = EmailAddress(emailStr);
    await _authRepository.sendPasswordResetEmail(email: emailAddress);
  }

  Future<UserCredential> handleSignInByGoogle() async => await _googleService.handleSignIn();

  Future<void> signOut() async => await _authRepository.signOut();
}