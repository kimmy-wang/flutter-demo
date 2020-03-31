import 'package:flutter/material.dart';

class SamplesPage extends StatefulWidget {
  final String headerTitle;

  const SamplesPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _SamplesPageState createState() => _SamplesPageState();
}

class _SamplesPageState extends State<SamplesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Samples"),
      ),
      body: Center(
        child: Text("SamplesPage"),
      ),
    );
  }

}
