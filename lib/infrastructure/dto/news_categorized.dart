import 'package:nocia/domain/news/service/rss_category.dart';

import '../../domain/news/news.dart';

class NewsCategorized {
  final List<News> _newsList;
  final RssCategory _rssCategory;

  NewsCategorized({
    required List<News> newsList,
    required RssCategory rssCategory
  }) :  _newsList = newsList,
        _rssCategory = rssCategory;

  List<News> get newsList => _newsList;

  RssCategory get rssCategory => _rssCategory;
}