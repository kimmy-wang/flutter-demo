// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlutterDemoState _$FlutterDemoStateFromJson(Map<String, dynamic> json) {
  return FlutterDemoState().copyWith(
    counter: json['counter'] as int,
    darkMode: json['darkMode'] as bool,
  );
}

Map<String, dynamic> _$FlutterDemoStateToJson(FlutterDemoState instance) =>
    <String, dynamic>{
      'counter': instance.counter,
      'darkMode': instance.darkMode,
    };
