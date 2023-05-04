// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Server _$ServerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['url', 'variables'],
  );
  return Server(
    url: json['url'] as String,
    variables: (json['variables'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, ServerVariable.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ServerToJson(Server instance) {
  final val = <String, dynamic>{
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('variables', instance.variables?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}
