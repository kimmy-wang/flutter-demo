import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  final String headerTitle;

  const MapPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "MapPage"),
      ),
      body: Container(
        child: Text("MapPage"),
      ),
    );
  }

}
