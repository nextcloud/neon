import 'package:meta/meta.dart';
import 'package:nextcloud_test/src/fixtures.dart';
import 'package:nextcloud_test/src/models/models.dart';
import 'package:nextcloud_test/src/test_target/test_target.dart';
import 'package:test/test.dart';

/// Signature for callback to [presets].
typedef NextcloudTesterCallback = void Function(NextcloudTester tester);

/// The default username used in nextcloud tests.
const String defaultTestUsername = 'user1';

/// All tests for apps that depend on the server version must be wrapped with this method and pass along the preset.
@isTestGroup
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
