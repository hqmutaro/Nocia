import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nocia/application/user/user_state.dart';
import 'package:provider/provider.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.select<UserState, User?>((state) => state.user);
    if (user == null) return Container();
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
            icon: user.photoURL == null ? Icon(
              Icons.account_circle,
              size: 32,
            ) : CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              backgroundColor: Colors.transparent,
              radius:16,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }
        );
      },
    );
  }
}