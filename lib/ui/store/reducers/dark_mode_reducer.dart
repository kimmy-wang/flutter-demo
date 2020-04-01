import 'package:redux/redux.dart';

import 'package:flutter_demo/ui/store/actions/actions.dart';

final darkModeReducer = combineReducers<bool>([
  TypedReducer<bool, DarkModeAction>(_setLoaded),
]);

bool _setLoaded(bool darkMode, action) {
  return !darkMode;
}