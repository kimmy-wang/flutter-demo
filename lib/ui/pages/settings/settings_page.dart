import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_demo/ui/store/actions.dart' as Actions;
import 'package:flutter_demo/ui/store/state.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<FlutterDemoState, String>(
              converter: (store) => store.state.counter.toString(),
              builder: (context, count) {
                return Text(
                  count,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new StoreConnector<FlutterDemoState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Actions.Actions.Increment);
        },
        builder: (context, callback) {
          return new FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
      ),
    );
  }

}
