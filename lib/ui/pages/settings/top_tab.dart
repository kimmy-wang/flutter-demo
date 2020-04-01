import 'package:flutter/material.dart';

class TopTab extends StatefulWidget {
  final String headerTitle;

  const TopTab({Key key, this.headerTitle}) : super(key: key);

  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "TopTab"),
      ),
      body: Container(
        child: Text("TopTab"),
      ),
    );
  }

}
