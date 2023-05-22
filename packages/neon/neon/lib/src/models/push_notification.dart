part of '../../neon.dart';

@JsonSerializable()
class PushNotification {
  PushNotification({
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

  final NextcloudNotificationsNotificationDecryptedSubject subject;
}
