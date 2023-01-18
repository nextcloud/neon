import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

Future main() async {
  await run(await getDockerImage());
}

Future run(final DockerImage image) async {
  group('core', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(container);
    });
    tearDown(() => container.destroy());

    test('Is supported', () async {
      final response = await client.core.isSupported();
      expect(response, isTrue);
    });

    test('Get status', () async {
      final status = await client.core.getStatus();
      expect(status.installed, true);
      expect(status.maintenance, false);
      expect(status.needsDbUpgrade, false);
      expect(status.version, startsWith('25.0.3'));
      expect(status.versionstring, '25.0.3');
      expect(status.edition, '');
      expect(status.productname, 'Nextcloud');
      expect(status.extendedSupport, false);
    });

    test('Get capabilities', () async {
      final capabilities = await client.core.getCapabilities();
      expect(capabilities.ocs.data.version.major.toString(), '25');
      expect(capabilities.ocs.data.version.string, '25.0.3');
      expect(capabilities.ocs.data.capabilities.theming!.name, 'Nextcloud');
      expect(capabilities.ocs.data.capabilities.theming!.url, 'https://nextcloud.com');
      expect(capabilities.ocs.data.capabilities.theming!.slogan, 'a safe home for all your data');
      expect(capabilities.ocs.data.capabilities.theming!.color, '#0082c9');
      expect(capabilities.ocs.data.capabilities.theming!.colorText, '#ffffff');
      expect(capabilities.ocs.data.capabilities.theming!.logo, isNotEmpty);
      expect(capabilities.ocs.data.capabilities.theming!.background, isNotEmpty);
      expect(capabilities.ocs.data.capabilities.theming!.backgroundPlain, false);
      expect(capabilities.ocs.data.capabilities.theming!.backgroundDefault, true);
      expect(capabilities.ocs.data.capabilities.theming!.logoheader, isNotEmpty);
      expect(capabilities.ocs.data.capabilities.theming!.favicon, isNotEmpty);
    });

    test('Get navigation apps', () async {
      final navigationApps = await client.core.getNavigationApps();
      expect(navigationApps.ocs.data, hasLength(6));
      expect(navigationApps.ocs.data[0].id, 'dashboard');
      expect(navigationApps.ocs.data[1].id, 'files');
      expect(navigationApps.ocs.data[2].id, 'photos');
      expect(navigationApps.ocs.data[3].id, 'activity');
      expect(navigationApps.ocs.data[4].id, 'notes');
      expect(navigationApps.ocs.data[5].id, 'news');
    });

    test('Autocomplete', () async {
      final response = await client.core.autocomplete(
        search: '',
        itemType: 'call',
        itemId: 'new',
        shareTypes: [
          ShareType.user.code,
          ShareType.group.code,
        ],
      );
      expect(response.ocs.data, hasLength(3));

      expect(response.ocs.data[0].id, 'admin');
      expect(response.ocs.data[0].label, 'admin');
      expect(response.ocs.data[0].icon, 'icon-user');
      expect(response.ocs.data[0].source, 'users');
      expect(response.ocs.data[0].status.string, isNull);
      expect(response.ocs.data[0].subline, '');
      expect(response.ocs.data[0].shareWithDisplayNameUnique, 'admin@example.com');

      expect(response.ocs.data[1].id, 'user2');
      expect(response.ocs.data[1].label, 'User Two');
      expect(response.ocs.data[1].icon, 'icon-user');
      expect(response.ocs.data[1].source, 'users');
      expect(response.ocs.data[1].status.string, isNull);
      expect(response.ocs.data[1].subline, '');
      expect(response.ocs.data[1].shareWithDisplayNameUnique, 'user2');

      expect(response.ocs.data[2].id, 'admin');
      expect(response.ocs.data[2].label, 'admin');
      expect(response.ocs.data[2].icon, '');
      expect(response.ocs.data[2].source, 'groups');
      expect(response.ocs.data[2].status.string, isEmpty);
      expect(response.ocs.data[2].subline, '');
      expect(response.ocs.data[2].shareWithDisplayNameUnique, '');
    });
  });
}
