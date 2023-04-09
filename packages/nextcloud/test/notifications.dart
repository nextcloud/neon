import 'dart:async';

import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

Future main() async {
  await run(await getDockerImage());
}

Future run(final DockerImage image) async {
  group('notifications', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(
        container,
        username: 'admin',
        password: 'admin',
      );
    });
    tearDown(() => container.destroy());

    Future sendTestNotification() async {
      await client.notifications.sendAdminNotification(
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
      final response = await client.notifications.listNotifications();
      expect(response.ocs.data, hasLength(1));
      expect(response.ocs.data[0].notificationId, 1);
      expect(response.ocs.data[0].app, 'admin_notifications');
      expect(response.ocs.data[0].user, 'admin');
      expectDateInReasonableTimeRange(DateTime.parse(response.ocs.data[0].datetime), startTime);
      expect(response.ocs.data[0].objectType, 'admin_notifications');
      expect(response.ocs.data[0].objectId, isNotNull);
      expect(response.ocs.data[0].subject, '123');
      expect(response.ocs.data[0].message, '456');
      expect(response.ocs.data[0].link, '');
      expect(response.ocs.data[0].subjectRich, '');
      expect(response.ocs.data[0].subjectRichParameters.asList, isEmpty);
      expect(response.ocs.data[0].messageRich, '');
      expect(response.ocs.data[0].messageRichParameters.asList, isEmpty);
      expect(response.ocs.data[0].icon, isNotEmpty);
      expect(response.ocs.data[0].actions, hasLength(0));
    });

    test('Get notification', () async {
      await sendTestNotification();

      final startTime = DateTime.now().toUtc();
      final response = await client.notifications.getNotification(id: 1);
      expect(response.ocs.data.notificationId, 1);
      expect(response.ocs.data.app, 'admin_notifications');
      expect(response.ocs.data.user, 'admin');
      expectDateInReasonableTimeRange(DateTime.parse(response.ocs.data.datetime), startTime);
      expect(response.ocs.data.objectType, 'admin_notifications');
      expect(response.ocs.data.objectId, isNotNull);
      expect(response.ocs.data.subject, '123');
      expect(response.ocs.data.message, '456');
      expect(response.ocs.data.link, '');
      expect(response.ocs.data.subjectRich, '');
      expect(response.ocs.data.subjectRichParameters.asList, isEmpty);
      expect(response.ocs.data.messageRich, '');
      expect(response.ocs.data.messageRichParameters.asList, isEmpty);
      expect(response.ocs.data.icon, isNotEmpty);
      expect(response.ocs.data.actions, hasLength(0));
    });

    test('Delete notification', () async {
      await sendTestNotification();
      await client.notifications.deleteNotification(id: 1);

      final response = await client.notifications.listNotifications();
      expect(response.ocs.data, hasLength(0));
    });

    test('Delete all notifications', () async {
      await sendTestNotification();
      await sendTestNotification();
      await client.notifications.deleteAllNotifications();

      final response = await client.notifications.listNotifications();
      expect(response.ocs.data, hasLength(0));
    });
  });

  group('push notifications', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(
        container,
        username: 'admin',
        // We need to use app passwords in order to register push devices
        useAppPassword: true,
      );
    });
    tearDown(() => container.destroy());

    // The key size has to be 2048, other sizes are not accepted by Nextcloud (at the moment at least)
    // ignore: avoid_redundant_argument_values
    RSAKeypair generateKeypair() => RSAKeypair.fromRandom(keySize: 2048);

    test('Register and remove push device', () async {
      const pushToken = '789';
      final keypair = generateKeypair();

      final subscription = (await client.notifications.registerDevice(
        pushTokenHash: generatePushTokenHash(pushToken),
        devicePublicKey: keypair.publicKey.toFormattedPEM(),
        proxyServer: 'https://example.com/',
      ))
          .ocs
          .data;
      expect(subscription.publicKey, hasLength(451));
      RSAPublicKey.fromPEM(subscription.publicKey);
      expect(subscription.deviceIdentifier, isNotEmpty);
      expect(subscription.signature, isNotEmpty);
      expect(subscription.message, isNull);

      await client.notifications.removeDevice();
    });
  });
}
