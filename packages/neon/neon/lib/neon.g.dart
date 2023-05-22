// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      serverURL: json['serverURL'] as String,
      loginName: json['loginName'] as String,
      username: json['username'] as String,
      password: json['password'] as String?,
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'serverURL': instance.serverURL,
      'loginName': instance.loginName,
      'username': instance.username,
      'password': instance.password,
      'userAgent': instance.userAgent,
    };

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) => PushNotification(
      accountID: json['accountID'] as String,
      priority: json['priority'] as String,
      type: json['type'] as String,
      subject: NextcloudNotificationsNotificationDecryptedSubject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) => <String, dynamic>{
      'accountID': instance.accountID,
      'priority': instance.priority,
      'type': instance.type,
      'subject': instance.subject,
    };
