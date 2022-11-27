// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      r'$ref',
      'oneOf',
      'anyOf',
      'allOf',
      'description',
      'deprecated',
      'type',
      'format',
      'default',
      'enum',
      'properties',
      'required',
      'items',
      'additionalProperties',
      'contentMediaType',
      'contentSchema'
    ],
  );
  return Schema(
    ref: json[r'$ref'] as String?,
    oneOf: (json['oneOf'] as List<dynamic>?)?.map((e) => Schema.fromJson(e as Map<String, dynamic>)).toList(),
    anyOf: (json['anyOf'] as List<dynamic>?)?.map((e) => Schema.fromJson(e as Map<String, dynamic>)).toList(),
    allOf: (json['allOf'] as List<dynamic>?)?.map((e) => Schema.fromJson(e as Map<String, dynamic>)).toList(),
    description: json['description'] as String?,
    deprecated: json['deprecated'] as bool?,
    type: json['type'] as String?,
    format: json['format'] as String?,
    default_: json['default'],
    enum_: json['enum'] as List<dynamic>?,
    properties: (json['properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Schema.fromJson(e as Map<String, dynamic>)),
    ),
    required: (json['required'] as List<dynamic>?)?.map((e) => e as String).toList(),
    items: json['items'] == null ? null : Schema.fromJson(json['items'] as Map<String, dynamic>),
    additionalProperties: json['additionalProperties'] as bool?,
    contentMediaType: json['contentMediaType'] as String?,
    contentSchema:
        json['contentSchema'] == null ? null : Schema.fromJson(json['contentSchema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SchemaToJson(Schema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$ref', instance.ref);
  writeNotNull('oneOf', instance.oneOf?.map((e) => e.toJson()).toList());
  writeNotNull('anyOf', instance.anyOf?.map((e) => e.toJson()).toList());
  writeNotNull('allOf', instance.allOf?.map((e) => e.toJson()).toList());
  writeNotNull('description', instance.description);
  writeNotNull('deprecated', instance.deprecated);
  writeNotNull('type', instance.type);
  writeNotNull('format', instance.format);
  writeNotNull('default', instance.default_);
  writeNotNull('enum', instance.enum_);
  writeNotNull('properties', instance.properties?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('required', instance.required);
  writeNotNull('items', instance.items?.toJson());
  writeNotNull('additionalProperties', instance.additionalProperties);
  writeNotNull('contentMediaType', instance.contentMediaType);
  writeNotNull('contentSchema', instance.contentSchema?.toJson());
  return val;
}
