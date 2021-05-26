import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nocia/application/user/user_notifier.dart';
import 'package:nocia/application/user/user_state.dart';
import 'package:nocia/presentation/auth/auth_check.dart';
import 'package:nocia/presentation/news/page.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_state.dart';
import 'package:nocia/presentation/timetable/page.dart';
import 'package:nocia/presentation/timetable/widgets/timetable_app_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final Map<Widget, Widget?> _page = {
    NewsPage(): null,
    TimetablePage(): TimetableAppBar()
  };

  @override
  Widget build(BuildContext context) {
    var currentPage = context.select<CounterState, int>((state) => state.page);
    var user = context.select<UserState, User?>((state) => state.user);
    if (user == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        actions: [_page.values.elementAt(currentPage) ?? Container()],
        leading: Builder(
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
        )
      ),
      body: _page.keys.elementAt(currentPage),
      bottomNavigationBar: _bottomNavigationBar(context, currentPage),
      drawer: Drawer(
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
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context, int index) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int currentIndex) => context.read<CounterNotifier>().setPage(currentIndex),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.article_rounded),
            label: "ニュース"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_rounded),
            label: "時間割"
        )
      ],
    );
  }
}