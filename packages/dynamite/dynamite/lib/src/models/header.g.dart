// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Header _$HeaderFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['description', 'required', 'schema'],
  );
  return Header(
    description: json['description'] as String?,
    required: json['required'] as bool?,
    schema: json['schema'] == null ? null : Schema.fromJson(json['schema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HeaderToJson(Header instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('required', instance.required);
  writeNotNull('schema', instance.schema?.toJson());
  return val;
}
