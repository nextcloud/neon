// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['operationId', 'tags', 'parameters', 'requestBody', 'responses'],
  );
  return Operation(
    operationId: json['operationId'] as String?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    parameters:
        (json['parameters'] as List<dynamic>?)?.map((e) => Parameter.fromJson(e as Map<String, dynamic>)).toList(),
    requestBody: json['requestBody'] == null ? null : RequestBody.fromJson(json['requestBody'] as Map<String, dynamic>),
    responses: (json['responses'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Response.fromJson(e as Map<String, dynamic>)),
    ),
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
  writeNotNull('tags', instance.tags);
  writeNotNull('parameters', instance.parameters?.map((e) => e.toJson()).toList());
  writeNotNull('requestBody', instance.requestBody?.toJson());
  writeNotNull('responses', instance.responses?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}
