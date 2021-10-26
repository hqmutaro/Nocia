import 'package:flutter/material.dart';
import 'package:nocia/domain/news/news.dart';
import "package:intl/intl.dart";
import 'package:nocia/domain/news/service/rss_category.dart';
import 'package:nocia/presentation/news/widgets/web_view_page.dart';

class NewsCard extends StatelessWidget {
  final News _news;

  NewsCard({required News news})  : _news = news;

  @override
  Widget build(BuildContext context) {
    var url = _news.item.link!;
    var formatter = DateFormat("yyyy年 MM月 dd日");
    var date = formatter.format(_news.item.pubDate!);
    return GestureDetector(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: isPDF(url) ?
              IconTheme(
                  data: IconThemeData(color: Colors.red, ),
                  child: Icon(Icons.picture_as_pdf)
              ) :
              IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.article)
              ),
              title: Text(_news.item.title!),
              subtitle: Text(date),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebViewPage(url: url),
            )
        );
      },
    );
  }
}