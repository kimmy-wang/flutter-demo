import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  final String headerTitle;

  const Gallery({Key key, this.headerTitle}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Gallery"),
      ),
      body: Container(
        child: Text("Gallery"),
      ),
    );
  }

}
