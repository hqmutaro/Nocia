import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nocia/application/user/user_notifier.dart';
import 'package:nocia/application/user/user_state.dart';
import 'package:nocia/presentation/auth/auth_check.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.select<UserState, User?>((state) => state.user);
    if (user == null) return Container();
    return Drawer(
      elevation: 20.0,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.displayName ?? ""),
            accountEmail: Text(user.email!),
            currentAccountPicture: user.photoURL == null ? Icon(
              Icons.account_circle,
              size: 32,
            ) : CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              backgroundColor: Colors.transparent,
              radius:16,
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            title: Text("サインアウト"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () async {
              await context.read<AuthNotifier>().signOut();
              context.read<UserNotifier>().fetchUser();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthCheck()), (_) => false
              );
            },
          ),
        ],
      ),
    );
  }
}