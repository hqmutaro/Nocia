import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/news_factory_base.dart';
import 'package:nocia/domain/news/rss_repository_base.dart';
import 'package:nocia/domain/news/type.dart';
import 'package:webfeed/domain/rss_item.dart';

class NewsApplication{
  final String _baseUrl = "https://www.okinawa-ct.ac.jp/rss/RssFeed.jsp?select=";
  final String _activityUrl = "%B3%D8%B9%BB%A4%CE%B3%E8%C6%B0";
  final String _examinationUrl = "%BC%F5%B8%B3%A4%F2%A4%AA%B9%CD%A4%A8%A4%CE%CA%FD%A4%D8";
  final String _notificationUrl =  "%B3%D8%C0%B8%A1%A6%CA%DD%B8%EE%BC%D4%A4%CE%CA%FD%A4%D8";

  final RssRepositoryBase _rssRepository;
  final NewsFactoryBase _newsFactory;

  NewsApplication({
    required RssRepositoryBase rssRepository,
    required NewsFactoryBase newsFactory
  })  : _rssRepository = rssRepository,
        _newsFactory = newsFactory;

  Future<News> fetchRss(RssType type) async{
    String url;
    switch (type) {
      case RssType.Activity:
        url = _baseUrl + _activityUrl;
        break;
      case RssType.Examination:
        url = _baseUrl + _examinationUrl;
        break;
      case RssType.Notification:
        url = _baseUrl + _notificationUrl;
        break;
    }
    var items = await _rssRepository.fetch(url);
    if (items == null) items = <RssItem>[];
    return _newsFactory.create(type: type, items: items);
  }
}