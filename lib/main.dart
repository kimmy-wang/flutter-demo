import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:flutter_demo/common/model/app_state.dart';
import 'package:flutter_demo/ui/pages/tab_navigator.dart';
import 'package:flutter_demo/ui/store/reducers/app_state_reducer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

class FlutterDemoApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  FlutterDemoApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, bool>(
        converter: (store) => store.state.darkMode,
        builder: (context, darkMode) => MaterialApp(
          theme: darkMode ? ThemeData.dark() : ThemeData.light(),
          title: title,
          home: TabNavigator(),
        ),
      ),
    );
  }
}
