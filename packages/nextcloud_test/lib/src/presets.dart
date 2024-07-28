import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:nextcloud_test/src/models/models.dart';
import 'package:test/test.dart';

/// Signature for callback to [presets].
typedef NextcloudTesterCallback = void Function(NextcloudTester tester);

/// All tests for apps that depend on the server version must be wrapped with this method and pass along the preset.
void presets(
  String presetGroup,
  String app,
  NextcloudTesterCallback body, {
  String username = defaultTestUsername,
  int? retry,
  Timeout? timeout,
}) {
  final presets = TestTargetFactory.instance.presets;
  if (!presets.containsKey(presetGroup)) {
    throw Exception('Unknown preset type "$presetGroup"');
  }

  void innerBody() {
    for (final presetVersion in presets[presetGroup]) {
      group('${presetVersion.major}.${presetVersion.minor}', () {
        final tester = NextcloudTester(
          appName: presetGroup,
          version: presetVersion,
          username: username,
        );

        setUpAll(() async {
          await tester.init();
        });

        tearDownAll(() async {
          await tester.close();
        });

        tearDown(() {
          validateFixture(tester);
        });

        body(tester);
      });
    }
  }

  group(
    presetGroup,
    () {
      if (app != presetGroup) {
        group(app, innerBody);
      } else {
        innerBody();
      }
    },
    retry: retry,
    timeout: timeout,
  );
}
