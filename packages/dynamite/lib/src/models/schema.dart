import 'package:json_annotation/json_annotation.dart';

part 'schema.g.dart';

@JsonSerializable()
class Schema {
  Schema({
    required this.ref,
    required this.oneOf,
    required this.anyOf,
    required this.allOf,
    required this.description,
    required this.deprecated,
    required this.type,
    required this.format,
    required this.default_,
    required this.enum_,
    required this.properties,
    required this.required,
    required this.items,
  });

  factory Schema.fromJson(final Map<String, dynamic> json) => _$SchemaFromJson(json);
  Map<String, dynamic> toJson() => _$SchemaToJson(this);

  @JsonKey(name: r'$ref')
  final String? ref;

  final List<Schema>? oneOf;

  final List<Schema>? anyOf;

  final List<Schema>? allOf;

  List<Schema>? get ofs => oneOf ?? anyOf ?? allOf;

  final String? description;

  final bool? deprecated;

  final String? type;

  final String? format;

  @JsonKey(name: 'default')
  final dynamic default_;

  @JsonKey(name: 'enum')
  final List<dynamic>? enum_;

  final Map<String, Schema>? properties;

  final List<String>? required;

  final Schema? items;
}
