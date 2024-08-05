import 'dart:async';

import 'package:crypton/crypton.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:nextcloud/src/utils/date_time.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  presets('server', 'notifications', username: 'admin', (tester) {
    Future<void> sendTestNotification() async {
      await tester.client.notifications.api.generateNotification(
        userId: 'admin',
        $body: notifications.ApiGenerateNotificationRequestApplicationJson(
          (b) => b
            ..shortMessage = '123'
            ..longMessage = '456',
        ),
      );
    }

    group('API', () {
      test('Send admin notification', () async {
        await sendTestNotification();
      });
    });

    group('Endpoint', () {
      setUp(() async {
        await tester.client.notifications.endpoint.deleteAllNotifications();
      });

      test('List notifications', () async {
        await sendTestNotification();

        final startTime = DateTime.timestamp();
        final response = await tester.client.notifications.endpoint.listNotifications();
        expect(response.body.ocs.data, hasLength(1));
        expect(response.body.ocs.data[0].notificationId, isPositive);
        expect(response.body.ocs.data[0].app, 'admin_notifications');
        expect(response.body.ocs.data[0].user, 'admin');
        expect(
          DateTime.parse(response.body.ocs.data[0].datetime).secondsSinceEpoch,
          closeTo(startTime.secondsSinceEpoch, 10),
        );
        expect(response.body.ocs.data[0].objectType, 'admin_notifications');
        expect(response.body.ocs.data[0].objectId, isNotNull);
        expect(response.body.ocs.data[0].subject, '123');
        expect(response.body.ocs.data[0].message, '456');
        expect(response.body.ocs.data[0].link, '');
        expect(response.body.ocs.data[0].subjectRich, '');
        expect(response.body.ocs.data[0].subjectRichParameters, isEmpty);
        expect(response.body.ocs.data[0].messageRich, '');
        expect(response.body.ocs.data[0].messageRichParameters, isEmpty);
        expect(response.body.ocs.data[0].icon, isNotEmpty);
        expect(response.body.ocs.data[0].actions, hasLength(0));
      });

      test('Get notification', () async {
        await sendTestNotification();
        final listResponse = await tester.client.notifications.endpoint.listNotifications();
        expect(listResponse.body.ocs.data, hasLength(1));

        final startTime = DateTime.timestamp();
        final response = await tester.client.notifications.endpoint.getNotification(
          id: listResponse.body.ocs.data.first.notificationId,
        );
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.notificationId, isPositive);
        expect(response.body.ocs.data.app, 'admin_notifications');
        expect(response.body.ocs.data.user, 'admin');
        expect(
          DateTime.parse(response.body.ocs.data.datetime).secondsSinceEpoch,
          closeTo(startTime.secondsSinceEpoch, 10),
        );
        expect(response.body.ocs.data.objectType, 'admin_notifications');
        expect(response.body.ocs.data.objectId, isNotNull);
        expect(response.body.ocs.data.subject, '123');
        expect(response.body.ocs.data.message, '456');
        expect(response.body.ocs.data.link, '');
        expect(response.body.ocs.data.subjectRich, '');
        expect(response.body.ocs.data.subjectRichParameters, isEmpty);
        expect(response.body.ocs.data.messageRich, '');
        expect(response.body.ocs.data.messageRichParameters, isEmpty);
        expect(response.body.ocs.data.icon, isNotEmpty);
        expect(response.body.ocs.data.actions, hasLength(0));
      });

      test('Delete notification', () async {
        await sendTestNotification();
        final listResponse = await tester.client.notifications.endpoint.listNotifications();
        expect(listResponse.body.ocs.data, hasLength(1));
        await tester.client.notifications.endpoint.deleteNotification(
          id: listResponse.body.ocs.data.first.notificationId,
        );

        final response = await tester.client.notifications.endpoint.listNotifications();
        expect(response.body.ocs.data, hasLength(0));
      });

      test('Delete all notifications', () async {
        await sendTestNotification();
        await sendTestNotification();
        await tester.client.notifications.endpoint.deleteAllNotifications();

        final response = await tester.client.notifications.endpoint.listNotifications();
        expect(response.body.ocs.data, hasLength(0));
      });
    });

    group('Push', () {
      // The key size has to be 2048, other sizes are not accepted by Nextcloud (at the moment at least)
      // ignore: avoid_redundant_argument_values
      RSAKeypair generateKeypair() => RSAKeypair.fromRandom(keySize: 2048);

      test('Register and remove push device', () async {
        const pushToken = '789';
        final keypair = generateKeypair();

        final subscription = (await tester.client.notifications.push.registerDevice(
          $body: notifications.PushRegisterDeviceRequestApplicationJson(
            (b) => b
              ..pushTokenHash = notifications.generatePushTokenHash(pushToken)
              ..devicePublicKey = keypair.publicKey.toFormattedPEM()
              ..proxyServer = 'https://example.com/',
          ),
        ))
            .body
            .ocs
            .data;
        expect(subscription.publicKey, hasLength(451));
        RSAPublicKey.fromPEM(subscription.publicKey);
        expect(subscription.deviceIdentifier, isNotEmpty);
        expect(subscription.signature, isNotEmpty);

        await tester.client.notifications.push.removeDevice();
      });
    });
  });
}
