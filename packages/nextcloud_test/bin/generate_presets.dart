import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/src/app.dart';
import 'package:nextcloud_test/src/extended_version.dart';
import 'package:universal_io/io.dart';

final versionPattern = RegExp(r'^[0-9]+\.[0-9]+\.[0-9]+$');

Future<void> main() async {
  const appIDs = [
    'news',
    'notes',
    'spreed',
    'uppush',
  ];

  final httpClient = HttpClient();

  final serverVersions = await _getServerVersions(httpClient);
  final apps = await _getApps(appIDs, httpClient);

  for (final app in apps) {
    final appPresetsDir = Directory('docker/presets/${app.id}');
    if (appPresetsDir.existsSync()) {
      appPresetsDir.deleteSync(recursive: true);
    }
    appPresetsDir.createSync();

    for (final release in app.releases) {
      final serverVersion = release.findLatestServerVersion(serverVersions);

      final buffer = StringBuffer()..writeln('SERVER_VERSION=$serverVersion');

      for (final a in apps) {
        if (a == app) {
          buffer.writeln('${a.id.toUpperCase()}_URL=${release.url}');
        } else {
          buffer.writeln('${a.id.toUpperCase()}_URL=${a.findLatestRelease(serverVersion).url}');
        }
      }

      File('${appPresetsDir.path}/${release.version}').writeAsStringSync(buffer.toString());
    }
  }

  final serverPresetsDir = Directory('docker/presets/server');
  if (serverPresetsDir.existsSync()) {
    serverPresetsDir.deleteSync(recursive: true);
  }
  serverPresetsDir.createSync();

  for (final serverVersion in serverVersions) {
    final buffer = StringBuffer()..writeln('SERVER_VERSION=$serverVersion');

    for (final app in apps) {
      buffer.writeln('${app.id.toUpperCase()}_URL=${app.findLatestRelease(serverVersion).url}');
    }

    File('${serverPresetsDir.path}/$serverVersion').writeAsStringSync(buffer.toString());
  }

  final latestPresetLink = Link('docker/presets/latest');
  if (latestPresetLink.existsSync()) {
    latestPresetLink.updateSync('server/${serverVersions.first}');
  } else {
    latestPresetLink.createSync('server/${serverVersions.first}');
  }

  httpClient.close(force: true);
}

Future<List<ExtendedVersion>> _getServerVersions(final HttpClient httpClient) async {
  final versions = <ExtendedVersion>[];
  String? next = 'https://hub.docker.com/v2/repositories/library/nextcloud/tags?page_size=1000';

  while (next != null) {
    final request = await httpClient.openUrl('GET', Uri.parse(next));

    final response = await request.close();
    if (response.statusCode != 200) {
      throw Exception('Unable to get server versions, status code: ${response.statusCode}');
    }

    final data = (await response.json)! as Map<String, dynamic>;
    next = data['next'] as String?;

    final results = data['results'] as List;
    for (final result in results) {
      final tag = result as Map<String, dynamic>;

      final name = tag['name'] as String;
      if (!versionPattern.hasMatch(name)) {
        continue;
      }
      final version = ExtendedVersion.parse(name);

      if (version < coreMinVersion || version.major > core.maxMajor) {
        continue;
      }

      versions.add(version);
    }
  }

  return versions;
}

Future<List<App>> _getApps(final List<String> appIDs, final HttpClient httpClient) async {
  final apps = <App>[];

  final request = await httpClient.openUrl('GET', Uri.parse('https://apps.nextcloud.com/api/v1/apps.json'));

  final response = await request.close();
  if (response.statusCode != 200) {
    throw Exception('Unable to get apps, status code: ${response.statusCode}');
  }

  final appsItems = (await response.json)! as List;
  for (final appItem in appsItems) {
    final app = appItem as Map<String, dynamic>;
    final id = app['id'] as String;

    if (!appIDs.contains(id)) {
      continue;
    }

    final releases = <AppRelease>[];

    final releasesItems = app['releases'] as List;
    for (final releaseItem in releasesItems) {
      final release = releaseItem as Map<String, dynamic>;

      final versionString = release['version'] as String;
      if (!versionPattern.hasMatch(versionString)) {
        continue;
      }
      final version = ExtendedVersion.parse(versionString);

      final rawPlatformVersionSpec = release['rawPlatformVersionSpec'] as String;
      final minimumServerVersionRequirement =
          ExtendedVersion.parse(rawPlatformVersionSpec.split(' ')[0].replaceFirst('>=', ''));
      final maximumServerVersionRequirement =
          ExtendedVersion.parse(rawPlatformVersionSpec.split(' ')[1].replaceFirst('<=', ''));

      if (maximumServerVersionRequirement < coreMinVersion) {
        continue;
      }
      if (minimumServerVersionRequirement.major > core.maxMajor) {
        continue;
      }

      final download = release['download'] as String;

      releases.add(
        (
          version: version,
          url: download,
          minimumServerVersion: minimumServerVersionRequirement,
          maximumServerVersion: maximumServerVersionRequirement,
        ),
      );
    }

    apps.add((id: id, releases: releases));
  }

  apps.sort((final a, final b) => a.id.compareTo(b.id));
  return apps;
}
