@Retry(3)
library core_test;

import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group('core', () {
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
      final (supported, _) = client.core.isSupported((await client.core.ocs.getCapabilities()).ocs.data);
      expect(supported, isTrue);
    });

    test('Is supported from status', () async {
      final status = await client.core.getStatus();
      expect(status.isSupported, isTrue);
    });

    test('Get status', () async {
      final status = await client.core.getStatus();
      expect(status.installed, true);
      expect(status.maintenance, false);
      expect(status.needsDbUpgrade, false);
      expect(status.version, startsWith('$coreSupportedVersion.'));
      expect(status.versionstring, startsWith('$coreSupportedVersion.'));
      expect(status.edition, '');
      expect(status.productname, 'Nextcloud');
      expect(status.extendedSupport, false);
    });

    test('Get capabilities', () async {
      final capabilities = await client.core.ocs.getCapabilities();
      expect(capabilities.ocs.data.version.major, coreSupportedVersion);
      expect(capabilities.ocs.data.version.string, startsWith('$coreSupportedVersion.'));
      expect(capabilities.ocs.data.capabilities.commentsCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.davCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.filesCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.filesSharingCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.filesTrashbinCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.filesVersionsCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.notesCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.notificationsCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.provisioningApiCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.sharebymailCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.themingPublicCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.userStatusCapabilities, isNotNull);
      expect(capabilities.ocs.data.capabilities.weatherStatusCapabilities, isNotNull);
    });

    test('Get navigation apps', () async {
      final navigationApps = await client.core.navigation.getAppsNavigation();
      expect(navigationApps.ocs.data, hasLength(6));
      expect(navigationApps.ocs.data[0].id, 'dashboard');
      expect(navigationApps.ocs.data[1].id, 'files');
      expect(navigationApps.ocs.data[2].id, 'photos');
      expect(navigationApps.ocs.data[3].id, 'activity');
      expect(navigationApps.ocs.data[4].id, 'notes');
      expect(navigationApps.ocs.data[5].id, 'news');
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
        expect(response.ocs.data, hasLength(3));

        expect(response.ocs.data[0].id, 'admin');
        expect(response.ocs.data[0].label, 'admin');
        expect(response.ocs.data[0].icon, 'icon-user');
        expect(response.ocs.data[0].source, 'users');
        expect(response.ocs.data[0].status, isEmpty);
        expect(response.ocs.data[0].subline, '');
        expect(response.ocs.data[0].shareWithDisplayNameUnique, 'admin@example.com');

        expect(response.ocs.data[1].id, 'user2');
        expect(response.ocs.data[1].label, 'User Two');
        expect(response.ocs.data[1].icon, 'icon-user');
        expect(response.ocs.data[1].source, 'users');
        expect(response.ocs.data[1].status, isEmpty);
        expect(response.ocs.data[1].subline, '');
        expect(response.ocs.data[1].shareWithDisplayNameUnique, 'user2');

        expect(response.ocs.data[2].id, 'admin');
        expect(response.ocs.data[2].label, 'admin');
        expect(response.ocs.data[2].icon, '');
        expect(response.ocs.data[2].source, 'groups');
        expect(response.ocs.data[2].status, isEmpty);
        expect(response.ocs.data[2].subline, '');
        expect(response.ocs.data[2].shareWithDisplayNameUnique, '');
      },
      skip: true, // TODO: This test only works on 28+ due to a bug fix with the status
    );

    test('Get preview', () async {
      final response = await client.core.preview.getPreview(file: 'Nextcloud.png');
      expect(response, isNotEmpty);
    });

    test('Get avatar', () async {
      final response = await client.core.avatar.getAvatar(userId: 'admin', size: 32);
      expect(response.data, isNotEmpty);
    });

    test('Get dark avatar', () async {
      final response = await client.core.avatar.getAvatarDark(userId: 'admin', size: 32);
      expect(response.data, isNotEmpty);
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
      expect(response.ocs.data, hasLength(13));
    });

    test('Unified search', () async {
      final response = await client.core.unifiedSearch.search(
        providerId: 'settings',
        term: 'Personal info',
      );
      expect(response.ocs.data.name, 'Settings');
      expect(response.ocs.data.isPaginated, isFalse);
      expect(response.ocs.data.entries, hasLength(1));
      expect(response.ocs.data.entries.single.thumbnailUrl, isEmpty);
      expect(response.ocs.data.entries.single.title, 'Personal info');
      expect(response.ocs.data.entries.single.subline, isEmpty);
      expect(response.ocs.data.entries.single.resourceUrl, isNotEmpty);
      expect(response.ocs.data.entries.single.icon, 'icon-settings-dark');
      expect(response.ocs.data.entries.single.rounded, isFalse);
      expect(response.ocs.data.entries.single.attributes, isEmpty);
    });
  });
}
