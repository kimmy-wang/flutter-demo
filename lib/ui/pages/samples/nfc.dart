import 'package:flutter/material.dart';

class Nfc extends StatefulWidget {
  final String headerTitle;

  const Nfc({Key key, this.headerTitle}) : super(key: key);

  @override
  _NfcState createState() => _NfcState();
}

class _NfcState extends State<Nfc> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Nfc"),
      ),
      body: Container(
        child: Text("Nfc"),
      ),
    );
  }

}
