import 'package:nextcloud/dashboard.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() async {
  await presets('server', 'dashboard', (tester) {
    test('Get widgets', () async {
      final response = await tester.client.dashboard.dashboardApi.getWidgets();
      expect(response.statusCode, 200);
    });

    group('Get widget items', () {
      test('v1', () async {
        final response = await tester.client.dashboard.dashboardApi.getWidgetItems();
        expect(response.statusCode, 200);
      });

      test('v2', () async {
        final response = await tester.client.dashboard.dashboardApi.getWidgetItemsV2();
        expect(response.statusCode, 200);
      });
    });
  });
}
