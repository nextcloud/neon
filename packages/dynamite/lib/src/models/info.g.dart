// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['title', 'version', 'description', 'license'],
  );
  return Info(
    title: json['title'] as String,
    version: json['version'] as String,
    description: json['description'] as String?,
    license: License.fromJson(json['license'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'version': instance.version,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['license'] = instance.license.toJson();
  return val;
}
