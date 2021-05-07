import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/news_factory_base.dart';
import 'package:nocia/domain/news/news_id.dart';
import 'package:nocia/domain/news/rss_category.dart';
import 'package:uuid/uuid.dart';
import 'package:webfeed/domain/rss_item.dart';

class NewsFactory implements NewsFactoryBase {
  const NewsFactory();

  @override
  News create({required RssCategory type, required List<RssItem> items}) {
    return News(
        id: NewsId(Uuid().v4()),
        rssType: type,
        items: items
    );
  }
}