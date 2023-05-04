// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'in', 'description', 'required', 'schema'],
  );
  return Parameter(
    name: json['name'] as String,
    in_: json['in'] as String,
    description: json['description'] as String?,
    required: json['required'] as bool?,
    schema: json['schema'] == null ? null : Schema.fromJson(json['schema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ParameterToJson(Parameter instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'in': instance.in_,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('required', instance.required);
  writeNotNull('schema', instance.schema?.toJson());
  return val;
}
