import 'package:flutter/material.dart';

import 'package:flutter_demo/common/mock/settings.dart';
import 'package:flutter_demo/ui/widgets/settings_group.dart';

class SettingsPage extends StatefulWidget {
  final String headerTitle;

  const SettingsPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Settings"),
      ),
      body: ListView.separated(
        itemCount: settings.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(left: 6, right: 6),
          child: Column(
            children: <Widget>[
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  settings[index]["title"],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SettingsGroup(settingsGroup: settings[index]["list"])
            ],
          ),
        ),
        separatorBuilder: (context, index) => Container(
          height: 20,
        ),
      ),
    );
  }
}
