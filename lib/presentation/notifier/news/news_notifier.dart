import 'package:nocia/application/news/news_application.dart';
import 'package:nocia/domain/news/rss_category.dart';
import 'package:nocia/presentation/notifier/news/news_state.dart';
import 'package:state_notifier/state_notifier.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsApplication _app;

  NewsNotifier({required NewsApplication app}) :  _app = app, super(const NewsState(newsCategorizedList: []));

  Future<void> loadNews() async{
    var newsCategorizedList = await Future.wait([
      _app.fetchRss(RssCategory.Activity),
      _app.fetchRss(RssCategory.Examination),
      _app.fetchRss(RssCategory.Notification)
    ]);
    state = state.copyWith(newsCategorizedList: newsCategorizedList);
  }
}