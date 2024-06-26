import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:crypton/crypton.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/notifications.dart';

part 'push_notification.g.dart';

/// Data for a push notification.
@internal
abstract class PushNotification implements Built<PushNotification, PushNotificationBuilder> {
  factory PushNotification([void Function(PushNotificationBuilder)? updates]) = _$PushNotification;

  const PushNotification._();

  /// Creates a new PushNotification object from the given [json] data containing an encrypted [subject].
  ///
  /// Use [PushNotification.fromJson] when the [subject] is not encrypted.
  factory PushNotification.fromEncrypted(
    Map<String, dynamic> json,
    String accountID,
    RSAPrivateKey privateKey,
  ) {
    final subject = DecryptedSubject.fromEncrypted(privateKey, json['subject'] as String);

    return PushNotification(
      (b) => b
        ..accountID = accountID
        ..priority = json['priority'] as String
        ..type = json['type'] as String
        ..subject.replace(subject),
    );
  }

  /// Creates a new PushNotification object from the given [json] data.
  ///
  /// Use [PushNotification.fromEncrypted] when you the [subject] is still encrypted.
  factory PushNotification.fromJson(Map<String, dynamic> json) => _serializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  Map<String, dynamic> toJson() => _serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<PushNotification> get serializer => _$pushNotificationSerializer;

  /// The account associated to this notification.
  String get accountID;

  /// The priority of the notification.
  String get priority;

  /// The type of the notification.
  String get type;

  /// The subject of this notification.
  DecryptedSubject get subject;
}

@SerializersFor([
  PushNotification,
  DecryptedSubject,
])
final Serializers _serializers = (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
