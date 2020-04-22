import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

import 'package:flutter_demo/common/model/app_state.dart';
import 'package:flutter_demo/ui/pages/tab_navigator.dart';
import 'package:flutter_demo/ui/store/reducers/app_state_reducer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AmapService.init(
    iosKey: 'c3b60c1f305f5b18aab83056c6971709',
    androidKey: 'b515edaa8a1230aa4d2aa9447a7f66d7',
  );
  // Create Persistor
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  // Load initial state
  final initialStateFromStorage = await persistor.load();
  final store = Store<AppState>(appReducer,
      initialState: initialStateFromStorage ?? initialState,
      middleware: [
        persistor.createMiddleware(),
        LoggingMiddleware.printer(),
        thunkMiddleware,
      ]);
  runApp(FlutterDemoApp(
    title: 'Flutter Demo',
    store: store,
  ));
}

class FlutterDemoApp extends StatefulWidget {
  final Store<AppState> store;
  final String title;

  FlutterDemoApp({Key key, this.store, this.title}) : super(key: key);

  @override
  _FlutterDemoAppState createState() => _FlutterDemoAppState();
}

class _FlutterDemoAppState extends State<FlutterDemoApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, ThemeMode>(
        converter: (store) => store.state.darkMode,
        builder: (context, darkMode) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: darkMode,
            title: widget.title,
            home: TabNavigator(),
          );
        },
      ),
    );
  }
}
