import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart' as google;
import 'package:nocia/presentation/auth/widgets/email_field.dart';
import 'package:nocia/presentation/auth/widgets/reset_password_button.dart';
import 'package:nocia/presentation/auth/widgets/signin_button.dart';
import 'package:nocia/presentation/auth/widgets/password_field.dart';
import 'package:nocia/presentation/auth/widgets/signup_button.dart';

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
                          onPressed: () {

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