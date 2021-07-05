import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nocia/application/user/user_state.dart';
import 'package:nocia/presentation/auth/main.dart';
import 'package:nocia/presentation/home/page.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = context.select<UserState, User?>((state) => state.user);
    if (user == null) {
      return Auth(); // 要認証
    }
    return DefaultTabController(length: 3, child: HomePage()); // 認証済み
  }
}