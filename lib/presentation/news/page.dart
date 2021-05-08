import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nocia/application/news/news_application.dart';
import 'package:nocia/infrastructure/news/news_categorized_factory.dart';
import 'package:nocia/infrastructure/news/news_factory.dart';
import 'package:nocia/infrastructure/news/rss_repository.dart';
import 'package:nocia/presentation/news/main.dart';
import 'package:nocia/presentation/notifier/news/news_notifier.dart';
import 'package:nocia/presentation/notifier/news/news_state.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<NewsNotifier, NewsState>(
      create: (_) => NewsNotifier(
          app: NewsApplication(
            rssRepository: RssRepository(),
            newsFactory: NewsFactory(),
            newsCategorizedFactory: NewsCategorizedFactory()
          )
      ),
      child: News(),
    );
  }
}