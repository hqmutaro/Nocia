import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nocia/domain/news/service/rss_category.dart';

class WebViewPage extends StatelessWidget {
  final String _url;

  WebViewPage({required String url})  : _url = url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(isPDF(_url) ? _url : "http://www.okinawa-ct.ac.jp/sp/" + _url.substring(29))),
      ),
    );
  }
}