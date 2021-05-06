import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/type.dart';
import 'package:webfeed/domain/rss_item.dart';

abstract class NewsFactoryBase {
  News create({required RssType type, required List<RssItem> items});
}