import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nocia/infrastructure/dto/news_categorized.dart';

part 'news_state.freezed.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    @Default(<NewsCategorized>[]) List<NewsCategorized> newsCategorizedList
  }) = _NewsState;
}