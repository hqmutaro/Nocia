import 'package:nocia/domain/news/rss_repository_base.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:http/http.dart' as http;

class RssRepository extends RssRepositoryBase {
  @override
  Future<RssFeed> feed(String url) async{
    var response = await http.read(Uri.parse(url));
    return RssFeed.parse(response);
  }

  @override
  Future<List<RssItem>?> fetch(String url) async{
    return (await feed(url)).items;
  }
}