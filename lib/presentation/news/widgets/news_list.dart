import 'package:flutter/material.dart';
import 'package:nocia/domain/news/news.dart';
import 'package:nocia/domain/news/news_categorized.dart';
import 'package:nocia/presentation/news/widgets/news_categorized_list.dart';

class NewsList extends StatelessWidget {
  final List<NewsCategorized> _newsCategorizedList;

  NewsList({required List<NewsCategorized> newsCategorizedList})  : _newsCategorizedList = newsCategorizedList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _newsCategorizedList.map((NewsCategorized newsCategorized) =>
          NewsCategorizedList(newsCategorized: newsCategorized)).toList()
    );
  }
}