import 'package:flutter/material.dart';
import 'package:nocia/domain/news/news.dart';
import 'package:nocia/presentation/news/widgets/news_card.dart';

class NewsListPage extends StatelessWidget {
  final List<News> _newsList;

  NewsListPage({required List<News> newsList})  : _newsList = newsList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: _newsList.map((news) => NewsCard(news: news)).toList()
      ),
    );
  }
}