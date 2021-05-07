import 'package:nocia/domain/news/news_id.dart';
import 'package:nocia/domain/news/rss_category.dart';
import 'package:webfeed/domain/rss_item.dart';

class News {
  final NewsId id;
  final RssCategory _rssType;
  final List<RssItem> _items;

  News({
    required this.id,
    required RssCategory rssType,
    required List<RssItem> items
  })  : _rssType = rssType,
        _items = items;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is News && other.id == id);

  @override
  int get hashCode => id.hashCode;

  RssCategory get type => _rssType;

  List<RssItem> get items => _items;
}