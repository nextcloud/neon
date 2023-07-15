@Retry(3)
library uppush_test;

import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group('uppush', () {
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

    test('Is installed', () async {
      final response = await client.uppush.check();
      expect(response.success, isTrue);
    });

    test('Set keepalive', () async {
      final response = await client.uppush.setKeepalive(keepalive: 10);
      expect(response.success, isTrue);
    });

    test('Create device', () async {
      final response = await client.uppush.createDevice(deviceName: 'Test');
      expect(response.success, isTrue);
      expect(response.deviceId, isNotEmpty);
    });

    test('Delete device', () async {
      final deviceId = (await client.uppush.createDevice(deviceName: 'Test')).deviceId;

      final response = await client.uppush.deleteDevice(deviceId: deviceId);
      expect(response.success, isTrue);
    });

    test('Create app', () async {
      final deviceId = (await client.uppush.createDevice(deviceName: 'Test')).deviceId;

      final response = await client.uppush.createApp(deviceId: deviceId, appName: 'Test');
      expect(response.success, isTrue);
      expect(response.token, isNotEmpty);
    });

    test('UnifiedPush discovery', () async {
      final response = await client.uppush.unifiedpushDiscovery(token: 'example');
      expect(response.unifiedpush.version, 1);
    });

    test('Matrix gateway discovery', () async {
      final response = await client.uppush.gatewayMatrixDiscovery();
      expect(response.unifiedpush.gateway, 'matrix');
    });

    // Deleting an app, sending a notification (also via matrix gateway) or listening for notifications is not possible because redis is not set up
  });
}
