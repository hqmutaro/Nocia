import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:nocia/application/news/news_application.dart';
import 'package:nocia/domain/news/rss_repository_base.dart';
import 'package:nocia/infrastructure/news/news_factory.dart';
import 'package:nocia/infrastructure/news/rss_repository.dart';
import 'package:nocia/main.dart';
import 'package:nocia/presentation/news/main.dart';
import 'package:nocia/presentation/notifier/news/news_notifier.dart';
import 'package:nocia/presentation/notifier/news/news_state.dart';

import '../../injector.config.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<NewsNotifier, NewsState>(
      create: (_) => NewsNotifier(
          app: NewsApplication(
            rssRepository: getIt<RssRepositoryBase>(),
            newsFactory: NewsFactory()
          )
      ),
      child: News(),
    );
  }
}