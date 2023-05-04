import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/models/security_scheme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'components.g.dart';

@JsonSerializable()
class Components {
  Components({
    this.securitySchemes,
    this.schemas,
  });

  factory Components.fromJson(final Map<String, dynamic> json) => _$ComponentsFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentsToJson(this);

  final Map<String, SecurityScheme>? securitySchemes;

  final Map<String, Schema>? schemas;
}
