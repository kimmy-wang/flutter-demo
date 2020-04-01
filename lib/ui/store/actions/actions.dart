
// One simple action: Increment
class IncreaseAction {
  final int count;

  IncreaseAction({this.count = 1});

  @override
  String toString() {
    return 'IncreaseAction{count: $count}';
  }
}

class DecreaseAction {
  final int count;

  DecreaseAction({this.count = 1});

  @override
  String toString() {
    return 'DecreaseAction{count: $count}';
  }
}

class DarkModeAction {
  final bool darkMode;

  DarkModeAction({this.darkMode = false});

  @override
  String toString() {
    return 'DarkModeAction{darkMode: $darkMode}';
  }
}
