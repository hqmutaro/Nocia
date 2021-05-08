import 'package:nocia/domain/news/news_id.dart';
import 'package:webfeed/domain/rss_item.dart';

class News {
  final NewsId id;
  final RssItem _item;

  News({
    required this.id,
    required RssItem item
  })  : _item = item;

  @override
  bool operator ==(Object other) =>
      identical(other, this) || (other is News && other.id == id);

  @override
  int get hashCode => id.hashCode;

  RssItem get item => _item;
}