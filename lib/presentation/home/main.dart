import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nocia/application/user/user_notifier.dart';
import 'package:nocia/application/user/user_state.dart';
import 'package:nocia/domain/news/service/rss_category.dart';
import 'package:nocia/presentation/auth/auth_check.dart';
import 'package:nocia/presentation/home/appbar/menu_drawer.dart';
import 'package:nocia/presentation/home/appbar/menu_icon.dart';
import 'package:nocia/presentation/news/appbar/news_tab_bar.dart';
import 'package:nocia/presentation/news/page.dart';
import 'package:nocia/presentation/notifier/auth/auth_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_state.dart';
import 'package:nocia/presentation/timetable/page.dart';
import 'package:nocia/presentation/timetable/widgets/timetable_app_bar.dart';
import 'package:nocia/presentation/timetable/widgets/timetable_floating_action_button.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final Map<Widget, Widget?> _page = {
    NewsPage(): null,
    TimetablePage(): TimetableAppBar()
  };
  static const int NEWS = 0;
  static const int TIMETABLE = 1;

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
        leading: MenuIcon(),
        bottom: (currentPage == NEWS) ? NewsTabBar() : null,
      ),
      body: _page.keys.elementAt(currentPage),
      bottomNavigationBar: _bottomNavigationBar(context, currentPage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: (currentPage == TIMETABLE) ? TimetableFloatingActionButton() : null,
      drawer: MenuDrawer()
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