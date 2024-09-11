import 'dart:convert';

import 'package:nextcloud/settings.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() async {
  await presets('server', 'settings', username: 'admin', (tester) {
    group('Logs', () {
      test('Download', () async {
        final response = await tester.client.settings.logSettings.download();
        final logs = utf8.decode(response.body);
        expect(logs, isNotEmpty);
      });
    });
  });
}
