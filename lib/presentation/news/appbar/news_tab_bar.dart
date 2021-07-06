import 'package:flutter/material.dart';
import 'package:nocia/domain/news/service/rss_category.dart';

class NewsTabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(child: Text(activityName)),
        Tab(child: Text(examinationName)),
        Tab(child: Text(notificationName)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}