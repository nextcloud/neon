import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nextcloud/nextcloud.dart';

part 'push_notification.g.dart';

@JsonSerializable()
@immutable
class PushNotification {
  const PushNotification({
    required this.accountID,
    required this.priority,
    required this.type,
    required this.subject,
  });

  factory PushNotification.fromJson(final Map<String, dynamic> json) => _$PushNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);

  final String accountID;

  final String priority;

  final String type;

  final NotificationsNotificationDecryptedSubject subject;
}
