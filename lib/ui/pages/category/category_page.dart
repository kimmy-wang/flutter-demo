import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String headerTitle;

  const CategoryPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Category"),
      ),
      body: Center(
        child: Text("CategoryPage"),
      ),
    );
  }

}
