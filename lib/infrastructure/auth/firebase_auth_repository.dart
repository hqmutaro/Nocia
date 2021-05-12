import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:nocia/domain/auth/value/email_address.dart';
import 'package:nocia/domain/auth/value/password.dart';

class FirebaseAuthRepository implements FirebaseAuthRepositoryBase {
  @override
  Future<void> getSignedInUser() {
    // TODO: implement getSignedInUser
    throw UnimplementedError();
  }

  @override
  Future<void> registerWithEmailAndPassword({required EMailAddress email, required Password password}) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword({required EMailAddress email, required Password password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}