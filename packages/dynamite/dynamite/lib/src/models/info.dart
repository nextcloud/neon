import 'package:dynamite/src/models/license.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'info.g.dart';

@JsonSerializable()
@immutable
class Info {
  const Info({
    required this.title,
    required this.version,
    required this.license,
    this.description,
  });

  factory Info.fromJson(final Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);

  // Ignored in the comparison as it doesn't affect the generated code
  final String title;

  final String version;

  final License license;

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  @override
  bool operator ==(final Object other) => other is Info && version == other.version && license == other.license;

  @override
  int get hashCode => version.hashCode + license.hashCode;
}
