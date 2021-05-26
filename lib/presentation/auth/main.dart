import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart' as google;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nocia/application/user/user_notifier.dart';
import 'package:nocia/infrastructure/auth/firebase_auth_exception_handler.dart';
import 'package:nocia/presentation/auth/auth_check.dart';
import 'package:nocia/presentation/auth/widgets/email_field.dart';
import 'package:nocia/presentation/auth/widgets/reset_password_button.dart';
import 'package:nocia/presentation/auth/widgets/signin_button.dart';
import 'package:nocia/presentation/auth/widgets/password_field.dart';
import 'package:nocia/presentation/auth/widgets/signup_button.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4, child: Container(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 50),
                      Column(
                        children: [
                          EmailField(),
                          PasswordField()
                        ]
                      ),
                      SizedBox(height: 20),
                      SignUpButton(),
                      SizedBox(height: 20),
                      SignInButton(),
                      ResetPasswordButton(),
                      _divider(),
                      google.SignInButton(
                          Buttons.Google,
                          text: "Googleでログイン",
                          onPressed: () async{
                            try {
                              await context.read<AuthNotifier>().handleSignInByGoogle();
                              context.read<UserNotifier>().fetchUser();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => AuthCheck()), (_) => false
                              );
                            }
                            on FirebaseAuthException catch(e) {
                              var handle = FirebaseAuthExceptionHandler.handleException(e);
                              var message = FirebaseAuthExceptionHandler.exceptionMessage(handle);
                              Fluttertoast.showToast(
                                  msg: message,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          }
                      ),
                      SizedBox(height: height * .055),
                    ]
                  )
                )
              )
            ]
          )
        )
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(thickness: 1),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(thickness: 1),
            ),
          ),
          SizedBox(width: 20),
        ]
      )
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'd',
          children: [
            TextSpan(
              text: 'Nocia',
              style: TextStyle(color: Colors.blueAccent, fontSize: 30),
            ),
          ]
      ),
    );
  }
}