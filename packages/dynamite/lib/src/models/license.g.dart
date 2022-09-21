// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

License _$LicenseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'identifier', 'url'],
  );
  return License(
    name: json['name'] as String,
    identifier: json['identifier'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$LicenseToJson(License instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('url', instance.url);
  return val;
}
