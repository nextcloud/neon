// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'description'],
  );
  return Tag(
    name: json['name'] as String,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
