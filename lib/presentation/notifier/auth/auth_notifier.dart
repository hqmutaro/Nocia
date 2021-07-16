import 'package:firebase_auth/firebase_auth.dart';
import 'package:nocia/application/auth/auth_application.dart';
import 'package:nocia/presentation/notifier/auth/auth_values_state.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthNotifier extends StateNotifier<AuthValuesState> {
  final AuthApplication _app;

  AuthNotifier({required AuthApplication app})  : _app = app, super(const AuthValuesState());

  Future<UserCredential> registerWithEmailAndPassword() async {
    return await _app.registerWithEmailAndPassword(state.email, state.password);
  }

  Future<UserCredential> signInWithEmailAndPassword() async {
    return await _app.signInWithEmailAndPassword(state.email, state.password);
  }
  
  Future<void> sendPasswordResetEmail() async {
    await _app.sendPasswordResetEmail(state.email);
  }

  Future<UserCredential> handleSignInByGoogle() async => await _app.handleSignInByGoogle();

  void setEmailAddress(String value) {
    state = state.copyWith(email: value);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> signOut() async => await _app.signOut();
}