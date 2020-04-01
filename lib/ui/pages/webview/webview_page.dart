import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_demo/ui/store/actions.dart' as Actions;
import 'package:flutter_demo/ui/store/state.dart';

class WebviewPage extends StatefulWidget {
  final String headerTitle;

  const WebviewPage({Key key, this.headerTitle}) : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerTitle ?? "Webview"),
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
          return () => store.dispatch(Actions.Actions.ChangeMode);
        },
        builder: (context, callback) {
          return StoreConnector<FlutterDemoState, bool>(
            converter: (store) => store.state.darkMode,
            builder: (context, darkMode) => FloatingActionButton(
              onPressed: callback,
              tooltip: 'ChangeMode',
              child: Icon(darkMode ? Icons.brightness_4 : Icons.brightness_7),
            ),
          );
        },
      ),
    );
  }
}
