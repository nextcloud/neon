// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Components _$ComponentsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['securitySchemes', 'schemas'],
  );
  return Components(
    securitySchemes: (json['securitySchemes'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, SecurityScheme.fromJson(e as Map<String, dynamic>)),
    ),
    schemas: (json['schemas'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Schema.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ComponentsToJson(Components instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('securitySchemes', instance.securitySchemes?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('schemas', instance.schemas?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}
