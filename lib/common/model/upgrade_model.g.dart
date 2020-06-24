// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeModel _$UpgradeModelFromJson(Map<String, dynamic> json) {
  return UpgradeModel(
    testflight: json['testflight'] as bool,
    version: json['version'] as String,
    build: json['build'] as int,
    title: json['title'] as String,
    url: json['url'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$UpgradeModelToJson(UpgradeModel instance) =>
    <String, dynamic>{
      'testflight': instance.testflight,
      'version': instance.version,
      'build': instance.build,
      'title': instance.title,
      'url': instance.url,
      'description': instance.description,
    };
