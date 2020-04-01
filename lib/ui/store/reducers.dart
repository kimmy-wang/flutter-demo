import 'package:flutter_demo/ui/store/actions.dart';
import 'package:flutter_demo/ui/store/state.dart';

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
FlutterDemoState counterReducer(FlutterDemoState state, dynamic action) {
  if (action == Actions.Increment) {
    state.counter += 1;
    return state;
  } else if (action == Actions.ChangeMode) {
    state.darkMode = !state.darkMode;
    return state;
  }

  return state;
}