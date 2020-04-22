import 'package:flutter/material.dart';

import 'package:flutter_demo/common/mock/bottom_tabs.dart';

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
  final ThemeMode darkMode;

  DarkModeAction({this.darkMode = ThemeMode.system});

  @override
  String toString() {
    return 'DarkModeAction{darkMode: $darkMode}';
  }
}

class BottomTabAction {
  final List<Map<String, dynamic>> bottomTabs;

  BottomTabAction({this.bottomTabs = tabs});

  @override
  String toString() {
    return 'BottomTabAction{bottomTabs: $bottomTabs}';
  }
}
