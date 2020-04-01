import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  final String headerTitle;

  const Video({Key key, this.headerTitle}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Video"),
      ),
      body: Container(
        child: Text("Video"),
      ),
    );
  }

}
