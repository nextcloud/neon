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
    this.pattern,
    this.minLength,
    this.maxLength,
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

  @JsonKey(
    fromJson: _parseAdditionalProperties,
  )
  final Schema? additionalProperties;

  final String? contentMediaType;

  final Schema? contentSchema;

  final Discriminator? discriminator;

  final String? pattern;

  final int? minLength;

  final int? maxLength;

  bool get isContentString => type == 'string' && (contentMediaType?.isNotEmpty ?? false) && contentSchema != null;
}

class EmptySchema extends Schema {}

Schema? _parseAdditionalProperties(final dynamic data) {
  if (data == null) {
    return null;
  }

  if (data is bool) {
    return data ? EmptySchema() : null;
  }

  if (data is Map<String, dynamic>) {
    return Schema.fromJson(data);
  }

  throw Exception('Can not parse additionalProperties from $data');
}
