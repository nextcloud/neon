// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nextcloud_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextcloudNotification _$NextcloudNotificationFromJson(Map<String, dynamic> json) => NextcloudNotification(
      accountID: json['accountID'] as String,
      priority: json['priority'] as String,
      type: json['type'] as String,
      subject: _fromJsonSubject(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NextcloudNotificationToJson(NextcloudNotification instance) => <String, dynamic>{
      'accountID': instance.accountID,
      'priority': instance.priority,
      'type': instance.type,
      'subject': _toJsonSubject(instance.subject),
    };
