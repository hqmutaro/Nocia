import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:nocia/domain/auth/value/email_address.dart';
import 'package:nocia/domain/auth/value/password.dart';

class AuthApplication {
  final FirebaseAuthRepositoryBase _authRepository;

  AuthApplication({required FirebaseAuthRepositoryBase repository}) : _authRepository = repository;

  Future<void> registerWithEmailAndPassword(String emailStr, String passwordStr) async{
    final EmailAddress emailAddress = EmailAddress(emailStr);
    final Password password = Password(passwordStr);
    await _authRepository.registerWithEmailAndPassword(email: emailAddress, password: password);
  }

  Future<void> signInWithEmailAndPassword(String emailStr, String passwordStr) async{
    final EmailAddress emailAddress = EmailAddress(emailStr);
    final Password password = Password(passwordStr);
    await _authRepository.signInWithEmailAndPassword(email: emailAddress, password: password);
  }
}