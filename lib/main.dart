import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:flutter_demo/ui/store/reducers.dart';
import 'package:flutter_demo/ui/store/state.dart';
import 'package:flutter_demo/ui/pages/tab_navigator.dart';

void main() {
  final store = new Store<FlutterDemoState>(counterReducer,
      initialState: initialState,
      middleware: [
        LoggingMiddleware.printer(),
        thunkMiddleware,
      ]);
  runApp(new FlutterDemoApp(
    title: 'Flutter Demo',
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }
}

class FlutterDemoApp extends StatelessWidget {
  final Store<FlutterDemoState> store;
  final String title;

  FlutterDemoApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<FlutterDemoState>(
      store: store,
      child: StoreConnector<FlutterDemoState, bool>(
        converter: (store) => store.state.darkMode,
        builder: (context, darkMode) {
          return new MaterialApp(
            theme: darkMode ? ThemeData.dark() : ThemeData.light(),
            title: title,
            home: TabNavigator(),
          );
        },
      ),
    );
  }
}
