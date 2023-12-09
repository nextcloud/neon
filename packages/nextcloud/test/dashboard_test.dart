import 'package:nextcloud/dashboard.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:test_api/src/backend/invoker.dart';
import 'package:version/version.dart';

void main() {
  presets(
    'server',
    'dashboard',
    (final preset) {
      late DockerContainer container;
      late NextcloudClient client;
      setUp(() async {
        container = await DockerContainer.create(preset);
        client = await TestNextcloudClient.create(container);
      });
      tearDown(() async {
        if (Invoker.current!.liveTest.errors.isNotEmpty) {
          print(await container.allLogs());
        }
        container.destroy();
      });

      test('Get widgets', () async {
        final response = await client.dashboard.dashboardApi.getWidgets();
        expect(
          response.body.ocs.data.keys,
          equals(['activity', 'notes', 'recommendations', 'spreed', 'user_status']),
        );
      });

      group('Get widget items', () {
        test('v1', () async {
          final response = await client.dashboard.dashboardApi.getWidgetItems();
          final items = response.body.ocs.data;
          expect(items.keys, equals(['recommendations', 'spreed']));
          expect(items['recommendations'], hasLength(7));
          expect(items['spreed'], hasLength(0));
        });

        test(
          'v2',
          () async {
            final response = await client.dashboard.dashboardApi.getWidgetItemsV2();
            expect(response.body.ocs.data.keys, equals(['recommendations']));
            final items = response.body.ocs.data['recommendations']!.items;
            expect(items, hasLength(7));
          },
          skip: preset.version.toVersion() < Version(27, 1, 0),
        );
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
