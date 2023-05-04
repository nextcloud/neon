// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_scheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityScheme _$SecuritySchemeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['type', 'description', 'scheme'],
  );
  return SecurityScheme(
    type: json['type'] as String,
    description: json['description'] as String?,
    scheme: json['scheme'] as String?,
  );
}

Map<String, dynamic> _$SecuritySchemeToJson(SecurityScheme instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('scheme', instance.scheme);
  return val;
}
