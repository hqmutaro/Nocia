import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/news_categorized.dart';
import 'package:nocia/domain/news/news_categorized_factory_base.dart';
import 'package:nocia/domain/news/news_factory_base.dart';
import 'package:nocia/domain/news/news_id.dart';
import 'package:nocia/domain/news/rss_category.dart';
import 'package:uuid/uuid.dart';
import 'package:webfeed/domain/rss_item.dart';

class NewsCategorizedFactory implements NewsCategorizedFactoryBase {
  const NewsCategorizedFactory();

  @override
  NewsCategorized create({required List<News> newsList, required RssCategory rssCategory}) {
    return NewsCategorized(
        newsList: newsList,
        rssCategory: rssCategory
    );
  }
}