// coverage:ignore-file

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:crypton/crypton.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

/// Generates the push token hash which is just sha512
String generatePushTokenHash(final String pushToken) => sha512.convert(utf8.encode(pushToken)).toString();

@JsonSerializable()
// ignore: public_member_api_docs
class NotificationsDecryptedSubject {
  // ignore: public_member_api_docs
  NotificationsDecryptedSubject({
    this.nid,
    this.app,
    this.subject,
    this.type,
    this.id,
    this.delete,
    this.deleteAll,
  });

  // ignore: public_member_api_docs
  factory NotificationsDecryptedSubject.fromJson(final Map<String, dynamic> json) =>
      _$NotificationsDecryptedSubjectFromJson(json);

  /// ID if the notification
  final int? nid;

  /// App that sent the notification
  final String? app;

  /// Subject of the notification
  final String? subject;

  /// Type of the notification
  final String? type;

  /// ID of the notification
  final String? id;

  /// Delete the notification
  final bool? delete;

  /// Delete all notifications
  @JsonKey(name: 'delete-all')
  final bool? deleteAll;

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() => _$NotificationsDecryptedSubjectToJson(this);
}

/// Decrypts the subject of a push notification
NotificationsDecryptedSubject decryptPushNotificationSubject(
  final RSAPrivateKey privateKey,
  final String subject,
) =>
    NotificationsDecryptedSubject.fromJson(
      json.decode(privateKey.decrypt(subject)) as Map<String, dynamic>,
    );
