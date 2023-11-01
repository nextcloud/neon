import 'dart:convert';

import 'package:nextcloud/settings.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group(
    'settings',
    () {
      late DockerContainer container;
      late TestNextcloudClient client;
      setUp(() async {
        container = await getDockerContainer();
        client = await getTestClient(
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
