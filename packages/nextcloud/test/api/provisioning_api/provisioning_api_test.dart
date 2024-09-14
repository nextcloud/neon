import 'package:built_value/json_object.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() async {
  await presets('server', 'provisioning_api', username: 'admin', (tester) {
    group('Users', () {
      test('Get current user', () async {
        final response = await tester.client.provisioningApi.users.getCurrentUser();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.id, 'admin');
        expect(response.body.ocs.data.displayName, 'admin');
        expect(response.body.ocs.data.displaynameScope, UserDetailsScope.v2Federated);
        expect(response.body.ocs.data.language, 'en');
      });

      test('Get user by username', () async {
        final response = await tester.client.provisioningApi.users.getUser(userId: 'user1');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.id, 'user1');
        expect(response.body.ocs.data.displayname, 'User One');
        expect(response.body.ocs.data.displaynameScope, null);
        expect(response.body.ocs.data.language, 'en');
      });
    });

    group('Apps', () {
      test('Get', () async {
        final response = await tester.client.provisioningApi.apps.getApps();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());
        expect(response.body.ocs.data.apps, isNotEmpty);

        for (final id in response.body.ocs.data.apps) {
          final app = await tester.client.provisioningApi.apps.getAppInfo(app: id);
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());
          expect((app.body.ocs.data['id']! as StringJsonObject).value, isNotEmpty);
        }
      });
    });
  });
}
