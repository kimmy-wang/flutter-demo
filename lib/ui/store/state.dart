
class FlutterDemoState {
  int counter = 0;
  bool darkMode = false;

  @override
  String toString() {
    return "{ counter = $counter, darkMode = $darkMode }";
  }
}

var initialState = FlutterDemoState();
