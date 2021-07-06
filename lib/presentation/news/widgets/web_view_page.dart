import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:nocia/domain/news/service/rss_category.dart';

class WebViewPage extends StatelessWidget {
  final String _url;

  WebViewPage({required String url})  : _url = url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebviewScaffold(
        url: isPDF(_url) ? _url : "http://www.okinawa-ct.ac.jp/sp/" + _url.substring(27),// spをつけるとモバイルページに遷移する
        appBar: AppBar(
          title: Text(""),
        ), // AppBar
      ),
    );
  }
}