import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nocia/infrastructure/auth/firebase_auth_exception_handler.dart';
import 'package:provider/provider.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';

class SendResetPasswordButton extends StatelessWidget {
  const SendResetPasswordButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue, Colors.blueAccent]
            )
        ),
        child: Text(
          '送信',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      onTap: () async{
        try {
          await context.read<AuthNotifier>().sendPasswordResetEmail();
          context.read<AuthNotifier>().setEmailAddress("");
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "パスワード再設定メールを送信しました",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white,
              fontSize: 16.0
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
      },
    );
  }
}