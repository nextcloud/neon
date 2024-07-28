import 'dart:convert';

import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/settings.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  final targetFactory = TestTargetFactory.instance;

  presets(
    targetFactory,
    'server',
    'settings',
    (preset) {
      late TestTargetInstance target;
      late NextcloudClient client;
      setUpAll(() async {
        target = await targetFactory.spawn(preset);
        client = await target.createClient(
          username: 'admin',
        );
      });
      tearDownAll(() async {
        await target.destroy();
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
