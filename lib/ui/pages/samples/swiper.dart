import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  final String headerTitle;

  const Swiper({Key key, this.headerTitle}) : super(key: key);

  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Swiper"),
      ),
      body: Container(
        child: Text("Swiper"),
      ),
    );
  }

}
