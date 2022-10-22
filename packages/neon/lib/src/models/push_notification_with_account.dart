import 'package:json_annotation/json_annotation.dart';
import 'package:nextcloud/nextcloud.dart';

part 'push_notification_with_account.g.dart';

@JsonSerializable()
class PushNotificationWithAccountID {
  PushNotificationWithAccountID({
    required this.notification,
    required this.accountID,
  });

  factory PushNotificationWithAccountID.fromJson(final Map<String, dynamic> json) =>
      _$PushNotificationWithAccountIDFromJson(json);
  Map<String, dynamic> toJson() => _$PushNotificationWithAccountIDToJson(this);

  final NotificationsPushNotification notification;

  final String accountID;
}
