import 'package:flutter/material.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (String value) {
                context.read<AuthNotifier>().setEmailAddress(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Eメール',
                  hintText: 'メールアドレスを入力してください'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (String value) {
                context.read<AuthNotifier>().setPassword(value);
              },
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'パスワード',
                  hintText: 'パスワードを入力してください'
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await context.read<AuthNotifier>().signInWithEmailAndPassword();
            },
            child: Text(
              'パスワードを忘れました',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'ログイン',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () async{
                await context.read<AuthNotifier>().registerWithEmailAndPassword();
              },
              child: Text(
                '新規登録',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
            ),
          ),
        ],
      )
    );
  }
}