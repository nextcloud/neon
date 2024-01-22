import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:test_api/src/backend/invoker.dart';

void main() {
  presets(
    'server',
    'provisioning_api',
    (preset) {
      late DockerContainer container;
      late NextcloudClient client;
      setUpAll(() async {
        container = await DockerContainer.create(preset);
        client = await TestNextcloudClient.create(
          container,
          username: 'admin',
          passwordConfirmationWorkaround: true,
        );
      });
      tearDownAll(() async {
        if (Invoker.current!.liveTest.errors.isNotEmpty) {
          print(await container.allLogs());
        }
        container.destroy();
      });

      group('Users', () {
        test('Get current user', () async {
          final response = await client.provisioningApi.users.getCurrentUser();
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.id, 'admin');
          expect(response.body.ocs.data.displayName, 'admin');
          expect(response.body.ocs.data.displaynameScope, 'v2-federated');
          expect(response.body.ocs.data.language, 'en');
        });

        test('Get user by username', () async {
          final response = await client.provisioningApi.users.getUser(userId: 'user1');
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.id, 'user1');
          expect(response.body.ocs.data.displayname, 'User One');
          expect(response.body.ocs.data.displaynameScope, null);
          expect(response.body.ocs.data.language, 'en');
        });

        test('Edit user', () async {
          final response = await client.provisioningApi.users.editUser(
            userId: 'admin',
            key: 'address',
            value: 'Berlin',
          );
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          final userResponse = await client.provisioningApi.users.getCurrentUser();
          expect(userResponse.body.ocs.data.address, 'Berlin');
        });

        test('Edit user multi value', () async {
          final response = await client.provisioningApi.users.editUserMultiValue(
            userId: 'admin',
            key: 'admin@example.com',
            value: 'test@example.com',
            collectionName: 'additional_mail',
          );
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          final userResponse = await client.provisioningApi.users.getCurrentUser();
          expect(userResponse.body.ocs.data.additionalMail, ['test@example.com']);
        });
      });

      group('Apps', () {
        test('Get', () async {
          final response = await client.provisioningApi.apps.getApps();
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());
          expect(response.body.ocs.data.apps, isNotEmpty);

          for (final id in response.body.ocs.data.apps) {
            final app = await client.provisioningApi.apps.getAppInfo(app: id);
            expect(response.statusCode, 200);
            expect(() => response.headers, isA<void>());
            expect(app.body.ocs.data.id, isNotEmpty);
          }
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
