import 'package:flutter/material.dart';

class SamplesPage extends StatefulWidget {
  @override
  _SamplesPageState createState() => _SamplesPageState();
}

class _SamplesPageState extends State<SamplesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Samples"),
      ),
      body: Center(
        child: Text("SamplesPage"),
      ),
    );
  }

}
