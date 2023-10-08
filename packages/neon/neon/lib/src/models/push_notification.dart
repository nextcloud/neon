import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/notifications.dart' show DecryptedSubject;

part 'push_notification.g.dart';

@JsonSerializable()
@immutable
@internal
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

  final DecryptedSubject subject;
}
