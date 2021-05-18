import 'package:flutter/material.dart';
import 'package:nocia/presentation/auth/reset_password_page.dart';

class ResetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerRight,
            child: Text(
                'パスワードを忘れましたか？',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                )
            )
        ),
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPasswordPage())
          );
        }
    );
  }
}