import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group(
    'core',
    () {
      late DockerImage image;
      setUpAll(() async => image = await getDockerImage());

      late DockerContainer container;
      late TestNextcloudClient client;
      setUp(() async {
        container = await getDockerContainer(image);
        client = await getTestClient(container);
      });
      tearDown(() => container.destroy());

      test('Is supported from capabilities', () async {
        final response = await client.core.ocs.getCapabilities();

        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        final (supported, _) = client.core.isSupported(response.body.ocs.data);
        expect(supported, isTrue);
      });

      test('Is supported from status', () async {
        final response = await client.core.getStatus();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.isSupported, isTrue);
      });

      test('Get status', () async {
        final response = await client.core.getStatus();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.installed, isTrue);
        expect(response.body.maintenance, isFalse);
        expect(response.body.needsDbUpgrade, isFalse);
        expect(response.body.version, startsWith('$coreSupportedVersion.'));
        expect(response.body.versionstring, startsWith('$coreSupportedVersion.'));
        expect(response.body.edition, '');
        expect(response.body.productname, 'Nextcloud');
        expect(response.body.extendedSupport, isFalse);
      });

      test('Get capabilities', () async {
        final response = await client.core.ocs.getCapabilities();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.version.major, coreSupportedVersion);
        expect(response.body.ocs.data.version.string, startsWith('$coreSupportedVersion.'));
        expect(response.body.ocs.data.capabilities.commentsCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.davCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.filesCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.filesSharingCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.filesTrashbinCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.filesVersionsCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.notesCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.notificationsCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.provisioningApiCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.sharebymailCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.themingPublicCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.userStatusCapabilities, isNotNull);
        expect(response.body.ocs.data.capabilities.weatherStatusCapabilities, isNotNull);
      });

      test('Get navigation apps', () async {
        final response = await client.core.navigation.getAppsNavigation();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());
        expect(response.body.ocs.data, hasLength(6));

        expect(response.body.ocs.data[0].id, 'dashboard');
        expect(response.body.ocs.data[1].id, 'files');
        expect(response.body.ocs.data[2].id, 'photos');
        expect(response.body.ocs.data[3].id, 'activity');
        expect(response.body.ocs.data[4].id, 'notes');
        expect(response.body.ocs.data[5].id, 'news');
      });

      test(
        'Autocomplete',
        () async {
          final response = await client.core.autoComplete.$get(
            search: '',
            itemType: 'call',
            itemId: 'new',
            shareTypes: [
              ShareType.user.index,
              ShareType.group.index,
            ],
          );
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());
          expect(response.body.ocs.data, hasLength(3));

          expect(response.body.ocs.data[0].id, 'admin');
          expect(response.body.ocs.data[0].label, 'admin');
          expect(response.body.ocs.data[0].icon, 'icon-user');
          expect(response.body.ocs.data[0].source, 'users');
          expect(response.body.ocs.data[0].status, isEmpty);
          expect(response.body.ocs.data[0].subline, '');
          expect(response.body.ocs.data[0].shareWithDisplayNameUnique, 'admin@example.com');

          expect(response.body.ocs.data[1].id, 'user2');
          expect(response.body.ocs.data[1].label, 'User Two');
          expect(response.body.ocs.data[1].icon, 'icon-user');
          expect(response.body.ocs.data[1].source, 'users');
          expect(response.body.ocs.data[1].status, isEmpty);
          expect(response.body.ocs.data[1].subline, '');
          expect(response.body.ocs.data[1].shareWithDisplayNameUnique, 'user2');

          expect(response.body.ocs.data[2].id, 'admin');
          expect(response.body.ocs.data[2].label, 'admin');
          expect(response.body.ocs.data[2].icon, '');
          expect(response.body.ocs.data[2].source, 'groups');
          expect(response.body.ocs.data[2].status, isEmpty);
          expect(response.body.ocs.data[2].subline, '');
          expect(response.body.ocs.data[2].shareWithDisplayNameUnique, '');
        },
        skip: true, // TODO: This test only works on 28+ due to a bug fix with the status
      );

      test('Get preview', () async {
        final response = await client.core.preview.getPreview(file: 'Nextcloud.png');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body, isNotEmpty);
      });

      test('Get avatar', () async {
        final response = await client.core.avatar.getAvatar(userId: 'admin', size: 32);
        expect(response.body, isNotEmpty);
      });

      test('Get dark avatar', () async {
        final response = await client.core.avatar.getAvatarDark(userId: 'admin', size: 32);
        expect(response.body, isNotEmpty);
      });

      test('Delete app password', () async {
        await client.core.appPassword.deleteAppPassword();
        expect(
          () => client.core.appPassword.deleteAppPassword(),
          throwsA(predicate((final e) => (e! as DynamiteApiException).statusCode == 401)),
        );
      });

      test('Unified search providers', () async {
        final response = await client.core.unifiedSearch.getProviders();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data, hasLength(13));
      });

      test('Unified search', () async {
        final response = await client.core.unifiedSearch.search(
          providerId: 'settings',
          term: 'Personal info',
        );

        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.name, 'Settings');
        expect(response.body.ocs.data.isPaginated, isFalse);
        expect(response.body.ocs.data.entries, hasLength(1));
        expect(response.body.ocs.data.entries.single.thumbnailUrl, isEmpty);
        expect(response.body.ocs.data.entries.single.title, 'Personal info');
        expect(response.body.ocs.data.entries.single.subline, isEmpty);
        expect(response.body.ocs.data.entries.single.resourceUrl, isNotEmpty);
        expect(response.body.ocs.data.entries.single.icon, 'icon-settings-dark');
        expect(response.body.ocs.data.entries.single.rounded, isFalse);
        expect(response.body.ocs.data.entries.single.attributes, isEmpty);
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
