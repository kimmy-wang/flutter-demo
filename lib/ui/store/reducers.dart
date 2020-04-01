import 'package:flutter_demo/ui/store/actions.dart';
import 'package:flutter_demo/ui/store/state.dart';

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
FlutterDemoState counterReducer(FlutterDemoState state, dynamic action) {
  if (action == Actions.Increment) {
    return state.copyWith(counter: state.counter + 1);
  } else if (action == Actions.ChangeMode) {
    return state.copyWith(darkMode: !state.darkMode);
  }

  return state;
}