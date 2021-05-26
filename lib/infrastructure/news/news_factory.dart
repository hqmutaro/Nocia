import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/news_factory_base.dart';
import 'package:nocia/domain/news/value/news_id.dart';
import 'package:nocia/domain/news/service/rss_category.dart';
import 'package:uuid/uuid.dart';
import 'package:webfeed/domain/rss_item.dart';

class NewsFactory implements NewsFactoryBase {
  const NewsFactory();

  @override
  News create({required RssItem item}) {
    return News(
        id: NewsId(Uuid().v4()),
        item: item
    );
  }
}