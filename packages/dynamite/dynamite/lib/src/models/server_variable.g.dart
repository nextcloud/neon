// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerVariable _$ServerVariableFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['default', 'enum', 'description'],
  );
  return ServerVariable(
    default_: json['default'] as String,
    enum_: (json['enum'] as List<dynamic>?)?.map((e) => e as String).toList(),
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$ServerVariableToJson(ServerVariable instance) {
  final val = <String, dynamic>{
    'default': instance.default_,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enum', instance.enum_);
  writeNotNull('description', instance.description);
  return val;
}
