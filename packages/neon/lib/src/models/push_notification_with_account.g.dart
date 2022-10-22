// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_with_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationWithAccountID _$PushNotificationWithAccountIDFromJson(Map<String, dynamic> json) =>
    PushNotificationWithAccountID(
      notification: NotificationsPushNotification.fromJson(json['notification'] as Map<String, dynamic>),
      accountID: json['accountID'] as String,
    );

Map<String, dynamic> _$PushNotificationWithAccountIDToJson(PushNotificationWithAccountID instance) => <String, dynamic>{
      'notification': instance.notification,
      'accountID': instance.accountID,
    };
