import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nocia/domain/news/news.dart';

part 'news_state.freezed.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    @Default(<News>[]) List<News> newsList
  }) = _NewsState;
}