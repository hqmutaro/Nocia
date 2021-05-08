import 'package:nocia/domain/news/rss_category.dart';

import 'news.dart';

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