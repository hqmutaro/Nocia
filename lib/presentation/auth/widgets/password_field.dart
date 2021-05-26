import 'package:flutter/material.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatelessWidget {
  const PasswordField();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "パスワード",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  )
              ),
              SizedBox(height: 10),
              TextField(
                  onChanged: (String value) {
                    context.read<AuthNotifier>().setPassword(value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true
                  )
              )
            ]
        )
    );
  }
}