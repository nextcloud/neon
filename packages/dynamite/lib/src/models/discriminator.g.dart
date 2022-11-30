// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discriminator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discriminator _$DiscriminatorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['propertyName', 'mapping'],
  );
  return Discriminator(
    propertyName: json['propertyName'] as String,
    mapping: (json['mapping'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DiscriminatorToJson(Discriminator instance) {
  final val = <String, dynamic>{
    'propertyName': instance.propertyName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mapping', instance.mapping);
  return val;
}
