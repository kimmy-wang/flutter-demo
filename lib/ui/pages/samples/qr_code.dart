import 'package:flutter/material.dart';

class QrCode extends StatefulWidget {
  final String headerTitle;

  const QrCode({Key key, this.headerTitle}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "QrCode"),
      ),
      body: Container(
        child: Text("QrCode"),
      ),
    );
  }

}
