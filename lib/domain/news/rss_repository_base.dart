import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

abstract class RssRepositoryBase {
  Future<RssFeed> feed(String url);
  Future<List<RssItem>?> fetch(String url);
}