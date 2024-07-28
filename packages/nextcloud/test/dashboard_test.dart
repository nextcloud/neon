import 'package:nextcloud/dashboard.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  final targetFactory = TestTargetFactory.instance;

  presets(
    targetFactory,
    'server',
    'dashboard',
    (preset) {
      late TestTargetInstance target;
      late NextcloudClient client;
      setUpAll(() async {
        target = await targetFactory.spawn(preset);
        client = await target.createClient();
      });
      tearDownAll(() async {
        await target.destroy();
      });

      test('Get widgets', () async {
        final response = await client.dashboard.dashboardApi.getWidgets();
        expect(response.statusCode, 200);
      });

      group('Get widget items', () {
        test('v1', () async {
          final response = await client.dashboard.dashboardApi.getWidgetItems();
          expect(response.statusCode, 200);
        });

        test('v2', () async {
          final response = await client.dashboard.dashboardApi.getWidgetItemsV2();
          expect(response.statusCode, 200);
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
