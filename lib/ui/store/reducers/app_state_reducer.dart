import 'package:flutter_demo/common/model/app_state.dart';
import 'package:flutter_demo/ui/store/reducers/counter_reducer.dart';
import 'package:flutter_demo/ui/store/reducers/dark_mode_reducer.dart';

// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return AppState(
    counter: counterReducer(state.counter, action),
    darkMode: darkModeReducer(state.darkMode, action),
  );
}