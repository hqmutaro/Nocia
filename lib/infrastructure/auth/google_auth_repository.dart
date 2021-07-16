import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nocia/domain/auth/firebase_auth_repository_base.dart';
import 'package:nocia/domain/auth/service/google_auth_repository_base.dart';

class GoogleAuthService implements GoogleAuthServiceBase {
  final GoogleSignIn _googleSignIn;
  //final FirebaseAuthRepositoryBase _repository;

  GoogleAuthService({
    required GoogleSignIn googleSignIn,
    //required FirebaseAuthRepositoryBase repository
  })  : _googleSignIn = googleSignIn;
        //_repository = repository;

  Future<UserCredential> handleSignIn() async{
    final GoogleSignInAccount googleUser = (await _googleSignIn.signIn())!;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}