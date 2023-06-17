// ignore_for_file: public_member_api_docs

part of '../nextcloud.dart';

/// Generates the push token hash which is just sha512
String generatePushTokenHash(final String pushToken) => sha512.convert(utf8.encode(pushToken)).toString();

/// Decrypts the subject of a push notification
NextcloudNotificationsNotificationDecryptedSubject decryptPushNotificationSubject(
  final RSAPrivateKey privateKey,
  final String subject,
) =>
    NextcloudNotificationsNotificationDecryptedSubject.fromJson(
      json.decode(privateKey.decrypt(subject)) as Map<String, dynamic>,
    );

/// See https://github.com/nextcloud/news/blob/4a107b3d53c4fe651ac704251b99e04a53cd587f/lib/Db/ListType.php
enum NewsListType {
  feed(0),
  folder(1),
  starred(2),
  allItems(3),
  shared(4),
  explore(5),
  unread(6);

  const NewsListType(this.code);

  final int code;
}

enum ShareType {
  user(0),
  group(1),
  usergroup(2),
  link(3),
  email(4),
  // 5 was contact, is no longer used
  remote(6),
  circle(7),
  guest(8),
  remoteGroup(9),
  room(10),
  // 11 is userroom, but it's only used internally
  deck(12),
  deckUser(13);

  const ShareType(this.code);
  final int code;
}
