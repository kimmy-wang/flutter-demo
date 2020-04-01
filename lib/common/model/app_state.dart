import 'package:json_annotation/json_annotation.dart';

part 'app_state.g.dart';

@JsonSerializable()
class AppState {
  final int counter;
  final bool darkMode;

  AppState({
    this.counter = 0,
    this.darkMode = false,
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
