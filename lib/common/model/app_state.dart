import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_state.g.dart';

@JsonSerializable()
class AppState {
  final int counter;
  final ThemeMode darkMode;

  AppState({
    this.counter = 0,
    this.darkMode = ThemeMode.system,
  });

  AppState copyWith({
    int counter,
    bool darkMode,
  }) =>
      AppState(
        counter: counter ?? this.counter,
        darkMode: darkMode ?? this.darkMode,
      );

  static AppState fromJson(dynamic json) => json == null
      ? AppState()
      : _$AppStateFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }
}

var initialState = AppState();
