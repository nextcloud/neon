import 'package:dynamite/src/models/discriminator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schema.g.dart';

@JsonSerializable()
class Schema {
  Schema({
    this.ref,
    this.oneOf,
    this.anyOf,
    this.allOf,
    this.description,
    this.deprecated,
    this.type,
    this.format,
    this.default_,
    this.enum_,
    this.properties,
    this.required,
    this.items,
    this.additionalProperties,
    this.contentMediaType,
    this.contentSchema,
    this.discriminator,
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

  final bool? additionalProperties;

  final String? contentMediaType;

  final Schema? contentSchema;

  final Discriminator? discriminator;

  bool get isJsonString => type == 'string' && contentMediaType == 'application/json' && contentSchema != null;
}
