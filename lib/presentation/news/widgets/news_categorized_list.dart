import 'package:flutter/material.dart';
import 'package:nocia/infrastructure/dto/news_categorized.dart';

class NewsCategorizedList extends StatelessWidget {
  final NewsCategorized _newsCategorized;

  NewsCategorizedList({required NewsCategorized newsCategorized}) : _newsCategorized = newsCategorized;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _newsCategorized.newsList.map((news) => Container(
        child: Center(child: Text(news.item.title!),),
      )).toList(),
    );
  }
}