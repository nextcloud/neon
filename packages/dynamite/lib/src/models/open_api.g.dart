// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenAPI _$OpenAPIFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['openapi', 'info', 'servers', 'security', 'tags', 'components', 'paths'],
  );
  return OpenAPI(
    version: json['openapi'] as String,
    info: Info.fromJson(json['info'] as Map<String, dynamic>),
    servers: (json['servers'] as List<dynamic>?)?.map((e) => Server.fromJson(e as Map<String, dynamic>)).toList(),
    security: (json['security'] as List<dynamic>?)
        ?.map((e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
            ))
        .toList(),
    tags: (json['tags'] as List<dynamic>?)?.map((e) => Tag.fromJson(e as Map<String, dynamic>)).toList(),
    components: json['components'] == null ? null : Components.fromJson(json['components'] as Map<String, dynamic>),
    paths: (json['paths'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, PathItem.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$OpenAPIToJson(OpenAPI instance) {
  final val = <String, dynamic>{
    'openapi': instance.version,
    'info': instance.info.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('servers', instance.servers?.map((e) => e.toJson()).toList());
  writeNotNull('security', instance.security);
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('components', instance.components?.toJson());
  writeNotNull('paths', instance.paths?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}
