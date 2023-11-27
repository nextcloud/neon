import 'package:nextcloud/dashboard.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  group(
    'dashboard',
    () {
      late DockerContainer container;
      late NextcloudClient client;
      setUp(() async {
        container = await DockerContainer.create();
        client = await TestNextcloudClient.create(container);
      });
      tearDown(() => container.destroy());

      test('Get widgets', () async {
        final response = await client.dashboard.dashboardApi.getWidgets();
        expect(response.body.ocs.data.keys, equals(['activity', 'notes', 'recommendations', 'spreed', 'user_status']));
      });

      group('Get widget items', () {
        test('v1', () async {
          final response = await client.dashboard.dashboardApi.getWidgetItems();
          final items = response.body.ocs.data;
          expect(items.keys, equals(['recommendations', 'spreed']));
          expect(items['recommendations'], hasLength(7));
          expect(items['spreed'], hasLength(0));
        });

        test('v2', () async {
          final response = await client.dashboard.dashboardApi.getWidgetItemsV2();
          expect(response.body.ocs.data.keys, equals(['recommendations']));
          final items = response.body.ocs.data['recommendations']!.items;
          expect(items, hasLength(7));
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
