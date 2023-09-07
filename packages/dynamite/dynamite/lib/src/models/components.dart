import 'package:collection/collection.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/models/security_scheme.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'components.g.dart';

@JsonSerializable()
@immutable
class Components {
  const Components({
    this.securitySchemes,
    this.schemas,
  });

  factory Components.fromJson(final Map<String, dynamic> json) => _$ComponentsFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentsToJson(this);

  final Map<String, SecurityScheme>? securitySchemes;

  final Map<String, Schema>? schemas;

  @override
  bool operator ==(final Object other) =>
      other is Components &&
      const MapEquality().equals(securitySchemes, other.securitySchemes) &&
      const MapEquality().equals(schemas, other.schemas);

  @override
  int get hashCode => const MapEquality().hash(securitySchemes) + const MapEquality().hash(schemas);
}
