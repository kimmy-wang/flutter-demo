import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class FlutterDemoState {
  final int counter;
  final bool darkMode;

  FlutterDemoState({
    this.counter = 0,
    this.darkMode = false,
  });

  FlutterDemoState copyWith({
    int counter,
    bool darkMode,
  }) =>
      FlutterDemoState(
        counter: counter ?? this.counter,
        darkMode: darkMode ?? this.darkMode,
      );

  static FlutterDemoState fromJson(dynamic json) => json == null
      ? FlutterDemoState()
      : _$FlutterDemoStateFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$FlutterDemoStateToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }
}

var initialState = FlutterDemoState();
