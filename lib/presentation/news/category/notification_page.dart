import 'package:flutter/material.dart';
import 'package:nocia/infrastructure/dto/news_categorized.dart';
import 'package:nocia/presentation/news/widgets/news_list.dart';

class NotificationPage extends StatelessWidget {
  final List<NewsCategorized> _newsList;

  NotificationPage({required newsList})  : _newsList = newsList;

  @override
  Widget build(BuildContext context) {
    return NewsList(newsCategorizedList: _newsList);
  }
}