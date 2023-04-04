// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'operationId',
      'summary',
      'description',
      'deprecated',
      'tags',
      'parameters',
      'requestBody',
      'responses',
      'security'
    ],
  );
  return Operation(
    operationId: json['operationId'] as String?,
    summary: json['summary'] as String?,
    description: json['description'] as String?,
    deprecated: json['deprecated'] as bool?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    parameters:
        (json['parameters'] as List<dynamic>?)?.map((e) => Parameter.fromJson(e as Map<String, dynamic>)).toList(),
    requestBody: json['requestBody'] == null ? null : RequestBody.fromJson(json['requestBody'] as Map<String, dynamic>),
    responses: (json['responses'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Response.fromJson(e as Map<String, dynamic>)),
    ),
    security: (json['security'] as List<dynamic>?)
        ?.map((e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
            ))
        .toList(),
  );
}

Map<String, dynamic> _$OperationToJson(Operation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('operationId', instance.operationId);
  writeNotNull('summary', instance.summary);
  writeNotNull('description', instance.description);
  writeNotNull('deprecated', instance.deprecated);
  writeNotNull('tags', instance.tags);
  writeNotNull('parameters', instance.parameters?.map((e) => e.toJson()).toList());
  writeNotNull('requestBody', instance.requestBody?.toJson());
  writeNotNull('responses', instance.responses?.map((k, e) => MapEntry(k, e.toJson())));
  writeNotNull('security', instance.security);
  return val;
}
