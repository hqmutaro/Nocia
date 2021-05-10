import 'package:flutter/material.dart';
import 'package:nocia/presentation/news/page.dart';
import 'package:nocia/presentation/notifier/home/counter_notifier.dart';
import 'package:nocia/presentation/notifier/home/counter_state.dart';
import 'package:nocia/presentation/timetable/page.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final List<Widget> _page = [
    NewsPage(),
    TimetablePage()
  ];

  @override
  Widget build(BuildContext context) {
    var currentPage = context.select<CounterState, int>((state) => state.page);
    return Scaffold(
      body: _page[currentPage],
      bottomNavigationBar: _bottomNavigationBar(context, currentPage),
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