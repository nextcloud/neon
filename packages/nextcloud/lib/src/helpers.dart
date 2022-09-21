part of '../nextcloud.dart';

// ignore: public_member_api_docs
extension HttpClientResponseBody on HttpClientResponse {
  // ignore: public_member_api_docs
  Future<Uint8List> get bodyBytes async =>
      Uint8List.fromList((await toList()).reduce((final value, final element) => [...value, ...element]));

  // ignore: public_member_api_docs
  Future<String> get body async => utf8.decode(await bodyBytes);
}

// ignore: public_member_api_docs
extension UserDetailsDisplayName on ProvisioningApiUserDetails {
  /// This is used to work around an API change that wasn't made for every endpoint
  /// See https://github.com/nextcloud/server/commit/5086335643b6181284ee50f57b95525002842992
  String? getDisplayName() => displayname ?? displayName;
}

// ignore: public_member_api_docs
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
            'deviceIdentifier': subscription.deviceIdentifier!,
            'deviceIdentifierSignature': subscription.signature!,
            'userPublicKey': subscription.publicKey!,
          },
        ).query,
      ),
    );

    final response = await request.close();

    if (response.statusCode != 200) {
      throw ApiException(
        response.statusCode,
        {}, // TODO
        await response.bodyBytes,
      );
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
