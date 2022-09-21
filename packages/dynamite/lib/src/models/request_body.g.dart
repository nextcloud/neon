// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestBody _$RequestBodyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['description', 'content', 'required'],
  );
  return RequestBody(
    description: json['description'] as String?,
    content: (json['content'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, MediaType.fromJson(e as Map<String, dynamic>)),
    ),
    required: json['required'] as bool?,
  );
}

Map<String, dynamic> _$RequestBodyToJson(RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('content', instance.content?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('required', instance.required);
  return val;
}
