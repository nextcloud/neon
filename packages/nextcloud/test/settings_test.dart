import 'dart:convert';

import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/settings.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  presets(
    'server',
    'settings',
    (preset) {
      late DockerContainer container;
      late NextcloudClient client;
      setUpAll(() async {
        container = await DockerContainer.create(preset);
        client = await TestNextcloudClient.create(
          container,
          username: 'admin',
        );
      });
      tearDownAll(() async {
        await container.destroy();
      });

      group('Logs', () {
        test('Download', () async {
          final response = await client.settings.logSettings.download();
          final logs = utf8.decode(response.body);
          expect(logs, isNotEmpty);
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}
