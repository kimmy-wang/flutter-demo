import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  final String headerTitle;

  const TablePage({Key key, this.headerTitle}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "TablePage"),
      ),
      body: Container(
        child: Text("TablePage"),
      ),
    );
  }

}
