import 'package:flutter/material.dart';
import 'package:nocia/presentation/auth/widgets/email_field.dart';
import 'package:nocia/presentation/auth/widgets/send_reset_password_button.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            )
        ),
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
                                EmailField(),
                                SendResetPasswordButton()
                              ]
                          )
                      )
                  )
                ]
            )
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
              text: 'パスワード再設定メールを送信',
              style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ]
      ),
    );
  }
}