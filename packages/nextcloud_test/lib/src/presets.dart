import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';
import 'package:version/version.dart';

/// Combination of preset `name` and preset `version`.
typedef Preset = ({String name, Version version});

final Map<String, List<Version>> _presets = () {
  final presets = <String, List<Version>>{};

  final filter = Platform.environment['PRESETS'];

  final presetGroups = Directory('../nextcloud_test/docker/presets')
      .listSync(followLinks: false)
      .whereType<Directory>()
      .map((final d) => PathUri.parse(d.path).name);

  for (final presetGroup in presetGroups) {
    final versions = <Version?, Version>{};

    final presetVersions = Directory('../nextcloud_test/docker/presets/$presetGroup')
        .listSync(followLinks: false)
        .whereType<File>()
        .map((final f) => Version.parse(PathUri.parse(f.path).name));

    for (final presetVersion in presetVersions) {
      final normalizedVersion = switch (filter) {
        'major' => Version(presetVersion.major, 0, 0),
        'minor' => Version(presetVersion.major, presetVersion.minor, 0),
        'patch' => presetVersion,
        'latest' || null || '' => null,
        _ => throw Exception('Unknown presets filter "$filter"'),
      };

      if (!versions.containsKey(normalizedVersion)) {
        versions[normalizedVersion] = presetVersion;
      } else if (presetVersion > versions[normalizedVersion]) {
        versions[normalizedVersion] = presetVersion;
      }
    }

    presets[presetGroup] = versions.values.toList();
  }

  return presets;
}();

/// All tests for apps that depend on the server version must be wrapped with this method and pass along the preset.
void presets(final String presetGroup, final dynamic Function(Preset preset) body) {
  if (!_presets.containsKey(presetGroup)) {
    throw Exception('Unknown preset type "$presetGroup"');
  }

  group(presetGroup, () {
    for (final presetVersion in _presets[presetGroup]!) {
      group(
        presetVersion,
        () => body(
          (
            name: presetGroup,
            version: presetVersion,
          ),
        ),
      );
    }
  });
}
