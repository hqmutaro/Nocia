import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocia/domain/news/service/rss_category.dart';
import 'package:nocia/infrastructure/dto/news_categorized.dart';
import 'package:nocia/presentation/news/widgets/news_list_page.dart';
import 'package:nocia/presentation/notifier/news/news_notifier.dart';
import 'package:nocia/presentation/notifier/news/news_state.dart';
import 'package:provider/provider.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<NewsNotifier>().loadNews(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        var newsCategorizedList = context.select<NewsState, List<NewsCategorized>>((state) => state.newsCategorizedList);
        return TabBarView(
          children: [
            NewsListPage(newsList: newsCategorizedList
                .where((element) => element.rssCategory == RssCategory.Activity)
                .map((e) => e.newsList)
                .first),
            NewsListPage(newsList: newsCategorizedList
                .where((element) => element.rssCategory == RssCategory.Examination)
                .map((e) => e.newsList)
                .first),
            NewsListPage(newsList: newsCategorizedList
                .where((element) => element.rssCategory == RssCategory.Notification)
                .map((e) => e.newsList)
                .first),
          ]
        );
      }
    );
  }
}