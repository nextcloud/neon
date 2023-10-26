import 'package:nextcloud/dashboard.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group(
    'dashboard',
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

      test('Get widgets', () async {
        final response = await client.dashboard.dashboardApi.getWidgets();
        expect(response.body.ocs.data.keys, equals(['activity', 'notes', 'recommendations', 'user_status']));
      });

      group('Get widget items', () {
        test('v1', () async {
          final response = await client.dashboard.dashboardApi.getWidgetItems();
          expect(response.body.ocs.data.keys, equals(['recommendations']));
          final items = response.body.ocs.data['recommendations']!;
          expect(items, hasLength(7));
        });

        test('v2', () async {
          final response = await client.dashboard.dashboardApi.getWidgetItemsV2();
          expect(response.body.ocs.data.keys, equals(['recommendations']));
          final items = response.body.ocs.data['recommendations']!.items;
          expect(items, hasLength(7));
        });
      });
    },
    tags: 'integration',
  );
}
