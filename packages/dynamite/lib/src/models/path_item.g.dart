// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PathItem _$PathItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'description',
      'parameters',
      'get',
      'put',
      'post',
      'delete',
      'options',
      'head',
      'patch',
      'trace'
    ],
  );
  return PathItem(
    description: json['description'] as String?,
    parameters:
        (json['parameters'] as List<dynamic>?)?.map((e) => Parameter.fromJson(e as Map<String, dynamic>)).toList(),
    get: json['get'] == null ? null : Operation.fromJson(json['get'] as Map<String, dynamic>),
    put: json['put'] == null ? null : Operation.fromJson(json['put'] as Map<String, dynamic>),
    post: json['post'] == null ? null : Operation.fromJson(json['post'] as Map<String, dynamic>),
    delete: json['delete'] == null ? null : Operation.fromJson(json['delete'] as Map<String, dynamic>),
    options: json['options'] == null ? null : Operation.fromJson(json['options'] as Map<String, dynamic>),
    head: json['head'] == null ? null : Operation.fromJson(json['head'] as Map<String, dynamic>),
    patch: json['patch'] == null ? null : Operation.fromJson(json['patch'] as Map<String, dynamic>),
    trace: json['trace'] == null ? null : Operation.fromJson(json['trace'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PathItemToJson(PathItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters?.map((e) => e.toJson()).toList());
  writeNotNull('get', instance.get?.toJson());
  writeNotNull('put', instance.put?.toJson());
  writeNotNull('post', instance.post?.toJson());
  writeNotNull('delete', instance.delete?.toJson());
  writeNotNull('options', instance.options?.toJson());
  writeNotNull('head', instance.head?.toJson());
  writeNotNull('patch', instance.patch?.toJson());
  writeNotNull('trace', instance.trace?.toJson());
  return val;
}
