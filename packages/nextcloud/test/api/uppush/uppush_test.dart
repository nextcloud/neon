import 'package:nextcloud/uppush.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() async {
  await presets('uppush', 'uppush', username: 'admin', (tester) {
    test('Is installed', () async {
      final response = await tester.client.uppush.check();
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.success, isTrue);
    });

    test('Set keepalive', () async {
      final response = await tester.client.uppush.setKeepalive(keepalive: 10);
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.success, isTrue);
    });

    test('Create device', () async {
      final response = await tester.client.uppush.createDevice(deviceName: 'Test');
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.success, isTrue);
      expect(response.body.deviceId, isNotEmpty);
    });

    test('Delete device', () async {
      final deviceId = (await tester.client.uppush.createDevice(deviceName: 'Test')).body.deviceId;

      final response = await tester.client.uppush.deleteDevice(deviceId: deviceId);
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.success, isTrue);
    });

    test('Create app', () async {
      final deviceId = (await tester.client.uppush.createDevice(deviceName: 'Test')).body.deviceId;

      final response = await tester.client.uppush.createApp(deviceId: deviceId, appName: 'Test');
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.success, isTrue);
      expect(response.body.token, isNotEmpty);
    });

    test('UnifiedPush discovery', () async {
      final response = await tester.client.uppush.unifiedpushDiscovery(token: 'example');
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.unifiedpush.version, 1);
    });

    test('Matrix gateway discovery', () async {
      final response = await tester.client.uppush.gatewayMatrixDiscovery();
      expect(response.statusCode, 200);
      expect(() => response.headers, isA<void>());

      expect(response.body.unifiedpush.gateway, 'matrix');
    });

    // Deleting an app, sending a notification (also via matrix gateway) or listening for notifications is not possible because redis is not set up
  });
}
