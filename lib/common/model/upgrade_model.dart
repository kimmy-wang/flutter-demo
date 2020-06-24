import 'package:json_annotation/json_annotation.dart';

part 'upgrade_model.g.dart';

@JsonSerializable()
class UpgradeModel {
  bool testflight;
  String version;
  int build;
  String title;
  String url;
  String description;

  UpgradeModel({
    this.testflight,
    this.version,
    this.build,
    this.title,
    this.url,
    this.description,
  });

  factory UpgradeModel.fromJson(Map<String, dynamic> json) =>
      _$UpgradeModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeModelToJson(this);
}
