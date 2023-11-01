import 'package:nextcloud/uppush.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group(
    'uppush',
    () {
      late DockerContainer container;
      late TestNextcloudClient client;
      setUp(() async {
        container = await getDockerContainer();
        client = await getTestClient(
          container,
          username: 'admin',
        );
      });
      tearDown(() => container.destroy());

      test('Is installed', () async {
        final response = await client.uppush.check();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.success, isTrue);
      });

      test('Set keepalive', () async {
        final response = await client.uppush.setKeepalive(keepalive: 10);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.success, isTrue);
      });

      test('Create device', () async {
        final response = await client.uppush.createDevice(deviceName: 'Test');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.success, isTrue);
        expect(response.body.deviceId, isNotEmpty);
      });

      test('Delete device', () async {
        final deviceId = (await client.uppush.createDevice(deviceName: 'Test')).body.deviceId;

        final response = await client.uppush.deleteDevice(deviceId: deviceId);
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.success, isTrue);
      });

      test('Create app', () async {
        final deviceId = (await client.uppush.createDevice(deviceName: 'Test')).body.deviceId;

        final response = await client.uppush.createApp(deviceId: deviceId, appName: 'Test');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.success, isTrue);
        expect(response.body.token, isNotEmpty);
      });

      test('UnifiedPush discovery', () async {
        final response = await client.uppush.unifiedpushDiscovery(token: 'example');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.unifiedpush.version, 1);
      });

      test('Matrix gateway discovery', () async {
        final response = await client.uppush.gatewayMatrixDiscovery();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.unifiedpush.gateway, 'matrix');
      });

      // Deleting an app, sending a notification (also via matrix gateway) or listening for notifications is not possible because redis is not set up
    },
    retry: retryCount,
    timeout: timeout,
  );
}
