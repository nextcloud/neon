import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group(
    'provisioning_api',
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

      group('Users', () {
        test('Get current user', () async {
          final user = await client.provisioningApi.users.getCurrentUser();
          expect(user.ocs.data.id, 'admin');
          expect(user.ocs.data.displayName, 'admin');
          expect(user.ocs.data.displaynameScope, 'v2-federated');
          expect(user.ocs.data.language, 'en');
        });

        test('Get user by username', () async {
          final user = await client.provisioningApi.users.getUser(userId: 'user1');
          expect(user.ocs.data.id, 'user1');
          expect(user.ocs.data.displayname, 'User One');
          expect(user.ocs.data.displaynameScope, null);
          expect(user.ocs.data.language, 'en');
        });
      });

      group('Apps', () {
        test('Get apps', () async {
          final response = await client.provisioningApi.apps.getApps();
          expect(response.ocs.data.apps, hasLength(40));

          for (final id in response.ocs.data.apps) {
            final app = await client.provisioningApi.apps.getAppInfo(app: id);
            expect(app.ocs.data.id, isNotEmpty);
          }
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
