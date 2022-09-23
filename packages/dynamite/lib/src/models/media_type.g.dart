// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaType _$MediaTypeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['schema'],
  );
  return MediaType(
    schema: json['schema'] == null ? null : Schema.fromJson(json['schema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MediaTypeToJson(MediaType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('schema', instance.schema?.toJson());
  return val;
}
