// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState().copyWith(
    counter: json['counter'] as int,
    darkMode: json['darkMode'] as bool,
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) =>
    <String, dynamic>{
      'counter': instance.counter,
      'darkMode': instance.darkMode,
    };
