import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:version/version.dart';

/// Combination of preset `name` and preset `version`.
typedef Preset = ({String name, Version version});

/// All tests for apps that depend on the server version must be wrapped with this method and pass along the preset.
void presets(
  TestTargetFactory targetFactory,
  String presetGroup,
  String app,
  dynamic Function(Preset preset) body, {
  int? retry,
  Timeout? timeout,
}) {
  final presets = targetFactory.getPresets();
  if (!presets.containsKey(presetGroup)) {
    throw Exception('Unknown preset type "$presetGroup"');
  }

  void innerBody() {
    for (final presetVersion in presets[presetGroup]!) {
      group('${presetVersion.major}.${presetVersion.minor}', () {
        final preset = (name: presetGroup, version: presetVersion);

        tearDown(() {
          validateFixture(preset);
        });

        body(preset);
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
