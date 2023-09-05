import 'package:collection/collection.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/discriminator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'schema.g.dart';

@JsonSerializable()
@immutable
class Schema {
  const Schema({
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
    this.nullable,
  });

  factory Schema.fromJson(final Map<String, dynamic> json) => _$SchemaFromJson(json);
  Map<String, dynamic> toJson() => _$SchemaToJson(this);

  @JsonKey(name: r'$ref')
  final String? ref;

  final List<Schema>? oneOf;

  final List<Schema>? anyOf;

  final List<Schema>? allOf;

  List<Schema>? get ofs => oneOf ?? anyOf ?? allOf;

  // Ignored in the comparison as it doesn't affect the generated code
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

  final bool? nullable;

  bool get isContentString => type == 'string' && (contentMediaType?.isNotEmpty ?? false) && contentSchema != null;

  Iterable<String> get formattedDescription => descriptionToDocs(description);

  @override
  bool operator ==(final Object other) =>
      other is Schema &&
      ref == other.ref &&
      const ListEquality().equals(oneOf, other.oneOf) &&
      const ListEquality().equals(anyOf, other.anyOf) &&
      const ListEquality().equals(allOf, other.allOf) &&
      deprecated == other.deprecated &&
      type == other.type &&
      format == other.format &&
      default_ == other.default_ &&
      const ListEquality().equals(enum_, other.enum_) &&
      const MapEquality().equals(properties, other.properties) &&
      const ListEquality().equals(required, other.required) &&
      items == other.items &&
      additionalProperties == other.additionalProperties &&
      contentMediaType == other.contentMediaType &&
      contentSchema == other.contentSchema &&
      discriminator == other.discriminator &&
      pattern == other.pattern &&
      minLength == other.minLength &&
      maxLength == other.maxLength &&
      nullable == other.nullable;

  @override
  int get hashCode =>
      ref.hashCode +
      const ListEquality().hash(oneOf) +
      const ListEquality().hash(anyOf) +
      const ListEquality().hash(allOf) +
      deprecated.hashCode +
      type.hashCode +
      format.hashCode +
      default_.hashCode +
      const ListEquality().hash(enum_) +
      const MapEquality().hash(properties) +
      const ListEquality().hash(required) +
      items.hashCode +
      additionalProperties.hashCode +
      contentMediaType.hashCode +
      contentSchema.hashCode +
      discriminator.hashCode +
      pattern.hashCode +
      minLength.hashCode +
      maxLength.hashCode +
      nullable.hashCode;
}

class EmptySchema extends Schema {
  const EmptySchema();
}

Schema? _parseAdditionalProperties(final dynamic data) {
  if (data == null) {
    return null;
  }

  if (data is bool) {
    return data ? const EmptySchema() : null;
  }

  if (data is Map<String, dynamic>) {
    return Schema.fromJson(data);
  }

  throw Exception('Can not parse additionalProperties from $data');
}
