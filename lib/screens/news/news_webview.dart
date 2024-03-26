import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
   NewsWebView(this.URl);
  final String URl;

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.URl),
      );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: WebViewWidget(
          controller: controller),
      
    ),);
  }
}
