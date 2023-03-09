import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Detail extends StatefulWidget {
  final String blogUrl;
  Detail({required this.blogUrl});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("NewsViews"),
      ),
      body: Container(
        child: WebViewWidget(
          controller: WebViewController()
            ..loadRequest(Uri.parse(widget.blogUrl)),
        ),
      ),
    );
  }
}
