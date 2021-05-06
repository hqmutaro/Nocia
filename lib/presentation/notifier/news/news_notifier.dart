import 'package:nocia/application/news/news_application.dart';
import 'package:nocia/domain/news/type.dart';
import 'package:nocia/presentation/notifier/news/news_state.dart';
import 'package:state_notifier/state_notifier.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsApplication _app;

  NewsNotifier({required NewsApplication app,}) :  _app = app, super(const NewsState(newsList: []));

  Future<void> loadNews() async{
    var newsList = await Future.wait([
      _app.fetchRss(RssType.Activity),
      _app.fetchRss(RssType.Examination),
      _app.fetchRss(RssType.Notification)
    ]);
    state = state.copyWith(newsList: newsList);
  }
}