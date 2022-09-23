// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['description', 'content'],
  );
  return Response(
    description: json['description'] as String,
    content: (json['content'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, MediaType.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) {
  final val = <String, dynamic>{
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}
