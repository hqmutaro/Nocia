import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nocia/domain/news/news.dart' as model;
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
        var newsList = context.select<NewsState, List<model.News>>((state) => state.newsList);
        return Center(
            child: Text("News List Loaded.")
        );
        // TODO: RSSを表示するWidgetを構築
      },
    );
  }
}