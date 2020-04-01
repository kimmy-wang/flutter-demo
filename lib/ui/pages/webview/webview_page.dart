import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  final String headerTitle;

  const WebViewPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "WebViewPage"),
      ),
      body: Center(
        child: Text("WebViewPage"),
      )
    );
  }
}
