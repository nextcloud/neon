// ignore_for_file: public_member_api_docs

part of '../nextcloud.dart';

extension HttpClientResponseBody on HttpClientResponse {
  Future<Uint8List> get bodyBytes async =>
      Uint8List.fromList((await toList()).reduce((final value, final element) => [...value, ...element]));

  Future<String> get body async => utf8.decode(await bodyBytes);
}

extension UserDetailsDisplayName on ProvisioningApiUserDetails {
  /// This is used to work around an API change that wasn't made for every endpoint
  /// See https://github.com/nextcloud/server/commit/5086335643b6181284ee50f57b95525002842992
  String? getDisplayName() => displayname ?? displayName;
}

extension NextcloudNotificationsPushProxy on NotificationsClient {
  /// Registers a device at the push proxy server
  Future registerDeviceAtPushProxy(
    final String pushToken,
    final NotificationsPushServerSubscription subscription,
    final String proxyServer,
  ) async {
    final request = await HttpClient().postUrl(Uri.parse('${proxyServer}devices'))
      ..followRedirects = false
      ..persistentConnection = true;

    request.headers.add(HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded');

    request.add(
      utf8.encode(
        Uri(
          queryParameters: {
            'pushToken': pushToken,
            'deviceIdentifier': subscription.deviceIdentifier,
            'deviceIdentifierSignature': subscription.signature,
            'userPublicKey': subscription.publicKey,
          },
        ).query,
      ),
    );

    final response = await request.close();

    if (response.statusCode != 200) {
      // coverage:ignore-start
      throw ApiException(
        response.statusCode,
        {}, // TODO
        await response.bodyBytes,
      );
      // coverage:ignore-end
    }
  }

  /// Generates the push token hash which is just sha512
  String generatePushTokenHash(final String pushToken) => sha512.convert(utf8.encode(pushToken)).toString();
}

/// Decrypts the subject of a push notification
NotificationsPushNotificationDecryptedSubject decryptPushNotificationSubject(
  final RSAPrivateKey privateKey,
  final String subject,
) =>
    NotificationsPushNotificationDecryptedSubject.fromJson(
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
