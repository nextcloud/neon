import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:nextcloud_test/src/nextcloud_test.dart';
import 'package:nextcloud_test_api/client.dart';
import 'package:test/test.dart';
// ignore: implementation_imports
import 'package:test_api/src/backend/invoker.dart';

/// Signature for callback to [presets].
typedef NextcloudTesterCallback = void Function(NextcloudTester tester);

final _testClient = NextcloudTestApiClient.localhost(
  httpClient: httpClient,
);

/// All tests for apps that depend on the server version must be wrapped with this method and pass along the preset.
@isTestGroup
Future<void> presets(
  String presetGroup,
  String app,
  NextcloudTesterCallback body, {
  String username = defaultTestUsername,
  String? testOn,
  Timeout? timeout,
  Object? skip,
  Object? tags,
  Map<String, dynamic>? onPlatform,
  int? retry,
}) async {
  final response = await _testClient.getPresets(group: presetGroup);
  final presets = response.presets;

  if (presets.isEmpty) {
    throw Exception('Unknown preset type "$presetGroup"');
  }

  group(
    presetGroup,
    () {
      void innerBody() {
        for (final version in presets) {
          group('${version.major}.${version.minor}', () {
            final preset = Preset((b) {
              b
                ..groupName = presetGroup
                ..appName = app
                ..version = version;
            });

            final tester = NextcloudTester(
              preset: preset,
              username: username,
              testClient: _testClient,
            );

            setUpAll(() async {
              final platform = jsonEncode(
                Invoker.current!.liveTest.suite.platform.serialize(),
              );

              await tester.init(platform);
            });

            tearDownAll(() async {
              await tester.close();
            });

            tearDown(() async {
              await validateFixture(_testClient, preset);
            });

            body(tester);
          });
        }
      }

      if (app != presetGroup) {
        group(app, innerBody);
      } else {
        innerBody();
      }
    },
    testOn: testOn,
    timeout: timeout,
    skip: skip,
    tags: tags,
    onPlatform: onPlatform,
    retry: retry,
  );
}
