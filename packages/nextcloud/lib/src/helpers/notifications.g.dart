// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsDecryptedSubject _$NotificationsDecryptedSubjectFromJson(Map<String, dynamic> json) =>
    NotificationsDecryptedSubject(
      nid: json['nid'] as int?,
      app: json['app'] as String?,
      subject: json['subject'] as String?,
      type: json['type'] as String?,
      id: json['id'] as String?,
      delete: json['delete'] as bool?,
      deleteAll: json['delete-all'] as bool?,
    );

Map<String, dynamic> _$NotificationsDecryptedSubjectToJson(NotificationsDecryptedSubject instance) => <String, dynamic>{
      'nid': instance.nid,
      'app': instance.app,
      'subject': instance.subject,
      'type': instance.type,
      'id': instance.id,
      'delete': instance.delete,
      'delete-all': instance.deleteAll,
    };
