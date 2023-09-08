import 'dart:convert';

import 'package:test/test.dart';

import 'helper.dart';

Future<void> main() async {
  await run(await getDockerImage());
}

Future<void> run(final DockerImage image) async {
  group('settings', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(
        container,
        username: 'admin',
      );
    });
    tearDown(() => container.destroy());

    test('Download log file', () async {
      final response = utf8.decode((await client.settings.logSettings.download()).data);
      expect(response, await container.nextcloudLogs());
    });
  });
}
