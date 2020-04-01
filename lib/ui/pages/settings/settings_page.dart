import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/widgets/settings_item.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_demo/common/model/app_state.dart';
import 'package:flutter_demo/common/mock/settings.dart';
import 'package:flutter_demo/ui/store/actions/actions.dart';

class SettingsPage extends StatefulWidget {
  final String headerTitle;

  const SettingsPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Settings"),
      ),
      body: Container(
        margin: EdgeInsets.all(6),
        child: ListView.separated(
          itemCount: settings.length,
          itemBuilder: (context, index) => SettingsItem(
            title: settings[index]["title"],
            navigation: (settings[index]["navigation"] as Function),
          ),
          separatorBuilder: (context, index) => Container(
            height: 10,
          ),
        ),
      ),
      floatingActionButton: new StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(DarkModeAction());
        },
        builder: (context, callback) {
          return StoreConnector<AppState, bool>(
            converter: (store) => store.state.darkMode,
            builder: (context, darkMode) => FloatingActionButton(
              onPressed: callback,
              tooltip: 'ChangeMode',
              child: Icon(darkMode ? Icons.brightness_7 : Icons.brightness_4),
            ),
          );
        },
      ),
    );
  }

}
