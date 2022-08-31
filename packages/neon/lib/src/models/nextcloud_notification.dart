import 'package:json_annotation/json_annotation.dart';
import 'package:nextcloud/nextcloud.dart';

part 'nextcloud_notification.g.dart';

@JsonSerializable()
class NextcloudNotification {
  NextcloudNotification({
    required this.accountID,
    required this.priority,
    required this.type,
    required this.subject,
  });

  factory NextcloudNotification.fromJson(final Map<String, dynamic> json) => _$NextcloudNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NextcloudNotificationToJson(this);

  final String accountID;
  final String priority;
  final String type;

  @JsonKey(
    fromJson: _fromJsonSubject,
    toJson: _toJsonSubject,
  )
  final NotificationsPushNotificationDecryptedSubject subject;
}

NotificationsPushNotificationDecryptedSubject _fromJsonSubject(final Map<String, dynamic> data) =>
    NotificationsPushNotificationDecryptedSubject.fromJson(data)!;

Map<String, dynamic>? _toJsonSubject(final NotificationsPushNotificationDecryptedSubject subject) => subject.toJson();
