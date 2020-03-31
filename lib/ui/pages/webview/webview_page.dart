import 'package:flutter/material.dart';

class WebviewPage extends StatefulWidget {
  final String headerTitle;

  const WebviewPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Webview"),
      ),
      body: Center(
        child: Text("WebviewPage"),
      ),
    );
  }

}
