import 'package:dynamite/src/models/license.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  Info({
    required this.title,
    required this.version,
    required this.license,
    this.description,
  });

  factory Info.fromJson(final Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);

  final String title;

  final String version;

  final License license;

  final String? description;
}
