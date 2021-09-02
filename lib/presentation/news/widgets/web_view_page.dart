import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nocia/domain/news/service/rss_category.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class WebViewPage extends StatelessWidget {
  final String _url;
  final InAppWebViewGroupOptions _options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useOnDownloadStart: true,
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      javaScriptEnabled: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      loadWithOverviewMode: true,
      useWideViewPort: false,
      builtInZoomControls: false,
      domStorageEnabled: true,
      supportMultipleWindows: true,
    ),
  );

  WebViewPage({required String url})  : _url = url;

  @override
  Widget build(BuildContext context) {
    var pdfUrl = "http://www.okinawa-ct.ac.jp/" + _url.substring(28);
    var pageUrl = "http://www.okinawa-ct.ac.jp/sp/" + _url.substring(28);
    print(pdfUrl);
    return Scaffold(
      appBar: AppBar(),
      body: isPDF(_url)
          ? PDF(pageFling: true).fromUrl(pdfUrl)
          : InAppWebView(
          initialOptions: _options,
          initialUrlRequest: URLRequest(url: Uri.parse(pageUrl)
          )
      )
    );
  }
}