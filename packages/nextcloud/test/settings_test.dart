import 'dart:convert';

import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/settings.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  group(
    'settings',
    () {
      late DockerContainer container;
      late NextcloudClient client;
      setUp(() async {
        container = await DockerContainer.create();
        client = await TestNextcloudClient.create(
          container,
          username: 'admin',
        );
      });
      tearDown(() => container.destroy());

      group('Logs', () {
        test('Download', () async {
          final response = await client.settings.logSettings.download();
          final logs = utf8.decode(response.body);
          expect(logs, await container.nextcloudLogs());
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
