import 'package:flutter/material.dart';
import 'package:nocia/presentation/notifier/news/news_notifier.dart';
import 'package:nocia/presentation/notifier/news/news_state.dart';
import 'package:provider/provider.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<NewsNotifier>().loadNews(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var newsList = context.select<NewsState, List>((state) => state.newsList);
          return Center(
            child: Text("News List Loaded.")
          );
          // TODO: RSSを表示するWidgetを構築
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}