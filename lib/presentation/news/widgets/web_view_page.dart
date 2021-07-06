import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {
  final String _url;

  WebViewPage({required String url})  : _url = url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebviewScaffold(
        url: _url,
        appBar: AppBar(
          title: Text(""),
        ), // AppBar
      ),
    );
  }
}