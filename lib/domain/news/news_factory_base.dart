import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/rss_category.dart';
import 'package:webfeed/domain/rss_item.dart';

abstract class NewsFactoryBase {
  News create({required RssCategory type, required List<RssItem> items});
}