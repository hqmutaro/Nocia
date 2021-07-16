import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nocia/application/init.dart';
import 'package:nocia/application/timetable/timetable_application.dart';
import 'package:nocia/application/user/user_notifier.dart';
import 'package:nocia/infrastructure/auth/firebase_auth_exception_handler.dart';
import 'package:nocia/infrastructure/timetable/lecture_factory.dart';
import 'package:nocia/infrastructure/timetable/lecture_repository.dart';
import 'package:nocia/infrastructure/timetable/timetable_repository.dart';
import 'package:provider/provider.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';

import '../auth_check.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton();

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
          '新規登録',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      onTap: () async{
        UserCredential? user;
        try {
          user = await context.read<AuthNotifier>().registerWithEmailAndPassword();
          context.read<AuthNotifier>()
            ..setPassword("")
            ..setEmailAddress("");
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
        finally {
          if (user != null) {
            if (user.additionalUserInfo!.isNewUser) await Init().initTimetable();
          }
        }
      },
    );
  }
}