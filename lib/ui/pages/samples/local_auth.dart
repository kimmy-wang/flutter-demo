import 'package:flutter/material.dart';

class LocalAuth extends StatefulWidget {
  final String headerTitle;

  const LocalAuth({Key key, this.headerTitle}) : super(key: key);

  @override
  _LocalAuthState createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "LocalAuth"),
      ),
      body: Container(
        child: Text("LocalAuth"),
      ),
    );
  }

}
