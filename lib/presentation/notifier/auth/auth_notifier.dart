import 'package:nocia/application/auth/auth_application.dart';
import 'package:nocia/presentation/notifier/auth/auth_values_state.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthNotifier extends StateNotifier<AuthValuesState> {
  final AuthApplication _app;

  AuthNotifier({required AuthApplication app})  : _app = app, super(const AuthValuesState());

  Future<void> registerWithEmailAndPassword() async {
    await _app.registerWithEmailAndPassword(state.email, state.password);
  }

  Future<void> signInWithEmailAndPassword() async {
    await _app.signInWithEmailAndPassword(state.email, state.password);
  }

  void setEmailAddress(String value) {
    state = state.copyWith(email: value);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }
}