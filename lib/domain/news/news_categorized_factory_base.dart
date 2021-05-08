import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/news_categorized.dart';
import 'package:nocia/domain/news/rss_category.dart';

abstract class NewsCategorizedFactoryBase {
  NewsCategorized create({required List<News> newsList, required RssCategory rssCategory});
}