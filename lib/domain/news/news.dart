import 'package:nocia/domain/news/news_id.dart';
import 'package:nocia/domain/news/type.dart';
import 'package:webfeed/domain/rss_item.dart';

class News {
  final NewsId id;
  final RssType _rssType;
  final List<RssItem> _items;

  News({
    required this.id,
    required RssType rssType,
    required List<RssItem> items
  })  : _rssType = rssType,
        _items = items;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is News && other.id == id);

  @override
  int get hashCode => id.hashCode;

  RssType get type => _rssType;

  List<RssItem> get items => _items;
}