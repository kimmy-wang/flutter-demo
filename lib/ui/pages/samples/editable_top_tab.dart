import 'package:flutter/material.dart';

class EditableTopTab extends StatefulWidget {
  final String headerTitle;

  const EditableTopTab({Key key, this.headerTitle}) : super(key: key);

  @override
  _EditableTopTabState createState() => _EditableTopTabState();
}

class _EditableTopTabState extends State<EditableTopTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "EditableTopTab"),
      ),
      body: Container(
        child: Text("EditableTopTab"),
      ),
    );
  }

}
