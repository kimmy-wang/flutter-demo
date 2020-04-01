import 'package:flutter/material.dart';

class About extends StatefulWidget {
  final String headerTitle;

  const About({Key key, this.headerTitle}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "About"),
      ),
      body: Container(
        child: Text("About"),
      ),
    );
  }

}
