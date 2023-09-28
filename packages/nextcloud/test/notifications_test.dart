import 'dart:async';

import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group('notifications', () {
    late DockerImage image;
    setUpAll(() async => image = await getDockerImage());

    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(
        container,
        username: 'admin',
      );
    });
    tearDown(() => container.destroy());

    Future<void> sendTestNotification() async {
      await client.notifications.api.generateNotification(
        userId: 'admin',
        shortMessage: '123',
        longMessage: '456',
      );
    }

    test('Send admin notification', () async {
      await sendTestNotification();
    });

    test('List notifications', () async {
      await sendTestNotification();

      final startTime = DateTime.now().toUtc();
      final response = (await client.notifications.endpoint.listNotifications()).body;
      expect(response.ocs.data, hasLength(2));
      expect(response.ocs.data[0].notificationId, 2);
      expect(response.ocs.data[0].app, 'admin_notifications');
      expect(response.ocs.data[0].user, 'admin');
      expectDateInReasonableTimeRange(DateTime.parse(response.ocs.data[0].datetime), startTime);
      expect(response.ocs.data[0].objectType, 'admin_notifications');
      expect(response.ocs.data[0].objectId, isNotNull);
      expect(response.ocs.data[0].subject, '123');
      expect(response.ocs.data[0].message, '456');
      expect(response.ocs.data[0].link, '');
      expect(response.ocs.data[0].subjectRich, '');
      expect(response.ocs.data[0].subjectRichParameters, isEmpty);
      expect(response.ocs.data[0].messageRich, '');
      expect(response.ocs.data[0].messageRichParameters, isEmpty);
      expect(response.ocs.data[0].icon, isNotEmpty);
      expect(response.ocs.data[0].actions, hasLength(0));
    });

    test('Get notification', () async {
      await sendTestNotification();

      final startTime = DateTime.now().toUtc();
      final response = await client.notifications.endpoint.getNotification(id: 2);
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.ocs.data.notificationId, 2);
      expect(response.body.ocs.data.app, 'admin_notifications');
      expect(response.body.ocs.data.user, 'admin');
      expectDateInReasonableTimeRange(DateTime.parse(response.body.ocs.data.datetime), startTime);
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
      await client.notifications.endpoint.deleteNotification(id: 2);

      final response = (await client.notifications.endpoint.listNotifications()).body;
      expect(response.ocs.data, hasLength(1));
    });

    test('Delete all notifications', () async {
      await sendTestNotification();
      await sendTestNotification();
      await client.notifications.endpoint.deleteAllNotifications();

      final response = (await client.notifications.endpoint.listNotifications()).body;
      expect(response.ocs.data, hasLength(0));
    });
  });

  group(
    'push notifications',
    () {
      late DockerImage image;
      setUpAll(() async => image = await getDockerImage());

      late DockerContainer container;
      late TestNextcloudClient client;
      setUp(() async {
        container = await getDockerContainer(image);
        client = await getTestClient(
          container,
          username: 'admin',
        );
      });
      tearDown(() => container.destroy());

      // The key size has to be 2048, other sizes are not accepted by Nextcloud (at the moment at least)
      // ignore: avoid_redundant_argument_values
      RSAKeypair generateKeypair() => RSAKeypair.fromRandom(keySize: 2048);

      test('Register and remove push device', () async {
        const pushToken = '789';
        final keypair = generateKeypair();

        final subscription = (await client.notifications.push.registerDevice(
          pushTokenHash: generatePushTokenHash(pushToken),
          devicePublicKey: keypair.publicKey.toFormattedPEM(),
          proxyServer: 'https://example.com/',
        ))
            .body
            .ocs
            .data;
        expect(subscription.publicKey, hasLength(451));
        RSAPublicKey.fromPEM(subscription.publicKey);
        expect(subscription.deviceIdentifier, isNotEmpty);
        expect(subscription.signature, isNotEmpty);

        await client.notifications.push.removeDevice();
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
