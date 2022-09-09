import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:crypton/crypton.dart';
import 'package:nextcloud/src/clients/common/api.dart';
import 'package:nextcloud/src/clients/generated/notifications/api.dart';
import 'package:nextcloud/src/http_client_response_extension.dart';

// ignore: public_member_api_docs
class NextcloudNotificationsClient extends DefaultApi {
  // ignore: public_member_api_docs
  NextcloudNotificationsClient(
    final String baseURL,
    final Authentication authentication,
    final ApiClient Function(ApiClient) addCommonSettings,
  ) : super(
          addCommonSettings(
            ApiClient(
              basePath: '$baseURL/ocs/v1.php/apps/notifications',
              authentication: authentication,
            ),
          ),
        );

  @override
  @Deprecated('Use registerDeviceAtServer instead')
  Future<NotificationsPushServerRegistration?> registerDevice(
    final String pushTokenHash,
    final String devicePublicKey,
    final String proxyServer,
  ) =>
      throw Exception('Use registerDeviceAtServer instead');

  /// Registers a device at the Nextcloud server
  Future<NotificationsPushServerRegistration?> registerDeviceAtServer(
    final String pushToken,
    final RSAPublicKey devicePublicKey,
    final String proxyServer,
  ) {
    _validateProxyServerURL(proxyServer);
    return super.registerDevice(
      generatePushTokenHash(pushToken),
      devicePublicKey.toFormattedPEM(),
      proxyServer,
    );
  }

  /// Registers a device at the push proxy server
  Future registerDeviceAtPushProxy(
    final String pushToken,
    final NotificationsPushServerSubscription subscription,
    final String proxyServer,
  ) async {
    _validateProxyServerURL(proxyServer);
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
        await response.body,
      );
    }
  }

  void _validateProxyServerURL(final String proxyServer) {
    if (!proxyServer.endsWith('/')) {
      throw Exception('proxyServer URL has to end with a /');
    }
  }
}

/// Generates the push token hash which is just sha512
String generatePushTokenHash(final String pushToken) => sha512.convert(utf8.encode(pushToken)).toString();

/// Decrypts the subject of a push notification
NotificationsPushNotificationDecryptedSubject decryptPushNotificationSubject(
  final RSAPrivateKey privateKey,
  final String subject,
) =>
    NotificationsPushNotificationDecryptedSubject.fromJson(
      json.decode(privateKey.decrypt(subject)) as Map<String, dynamic>,
    )!;
