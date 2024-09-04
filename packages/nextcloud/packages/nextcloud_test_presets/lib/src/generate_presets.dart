import 'dart:convert';
import 'dart:io' show Directory, File, Link;

import 'package:http/http.dart' as http;
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud_test_presets/src/models/models.dart';

/// Generates the test presets.
Future<void> generatePresets() async {
  const appIDs = [
    'cookbook',
    'news',
    'notes',
    'spreed',
    'tables',
    'uppush',
    'drop_account',
  ];

  final httpClient = http.Client();

  final serverReleases = await _getServerReleases(httpClient);
  serverReleases.sort((a, b) => b.compareTo(a));
  final apps = await _getApps(appIDs, httpClient);

  for (final app in apps) {
    final appPresetsDir = Directory('docker/presets/${app.id}');
    if (appPresetsDir.existsSync()) {
      appPresetsDir.deleteSync(recursive: true);
    }
    appPresetsDir.createSync();

    for (final release in app.releases) {
      final serverRelease = release.findLatestServerRelease(serverReleases);
      if (serverRelease == null) {
        continue;
      }

      final buffer = StringBuffer()..writeln('SERVER_VERSION=${serverRelease.dockerImageTag}');

      for (final a in apps) {
        buffer
          ..write(a.id.toUpperCase())
          ..write('_URL=');
        if (a == app) {
          buffer.writeln(release.url);
        } else {
          final release = a.findLatestCompatibleRelease(serverRelease) ??
              a.findLatestCompatibleRelease(serverRelease, allowUnstable: true) ??
              a.findLatestRelease();
          buffer.writeln(release.url);
        }
      }

      File('${appPresetsDir.path}/${release.presetVersion}').writeAsStringSync(buffer.toString());
    }
  }

  final serverPresetsDir = Directory('docker/presets/server');
  if (serverPresetsDir.existsSync()) {
    serverPresetsDir.deleteSync(recursive: true);
  }
  serverPresetsDir.createSync();

  for (final serverRelease in serverReleases) {
    final buffer = StringBuffer()..writeln('SERVER_VERSION=${serverRelease.dockerImageTag}');

    for (final app in apps) {
      final release = app.findLatestCompatibleRelease(serverRelease) ??
          app.findLatestCompatibleRelease(serverRelease, allowUnstable: true) ??
          app.findLatestRelease();
      buffer.writeln('${app.id.toUpperCase()}_URL=${release.url}');
    }

    File('${serverPresetsDir.path}/${serverRelease.presetVersion}').writeAsStringSync(buffer.toString());
  }

  final latestPresetLink = Link('docker/presets/latest');
  if (latestPresetLink.existsSync()) {
    latestPresetLink.updateSync('server/${serverReleases.first.presetVersion}');
  } else {
    latestPresetLink.createSync('server/${serverReleases.first.presetVersion}');
  }

  httpClient.close();
}

Future<List<ServerRelease>> _getServerReleases(http.Client httpClient) async {
  final versions = <Version, ServerRelease>{};
  String? next = 'https://hub.docker.com/v2/repositories/library/nextcloud/tags?page_size=1000';

  while (next != null) {
    final request = http.Request('GET', Uri.parse(next));

    final streamedResponse = await httpClient.send(request);
    if (streamedResponse.statusCode != 200) {
      throw Exception('Unable to get server versions, status code: ${streamedResponse.statusCode}');
    }

    final response = await http.Response.fromStream(streamedResponse);

    final data = json.decode(response.body) as Map<String, dynamic>;
    next = data['next'] as String?;

    final results = data['results'] as List;
    for (final result in results) {
      try {
        final tag = result as Map<String, dynamic>;

        final name = tag['name'] as String;
        if (!name.endsWith('-fpm-alpine')) {
          continue;
        }

        final version = Version.parse(name);
        final normalizedVersion = Version(version.major, version.minor, 0);

        if (version < core.minVersion) {
          continue;
        }

        final release = ServerRelease(
          version: version,
          dockerImageDigest: tag['digest'] as String,
        );

        if (!versions.containsKey(normalizedVersion)) {
          versions[normalizedVersion] = release;
        } else if (version > versions[normalizedVersion]) {
          versions[normalizedVersion] = release;
        }
      } catch (_) {}
    }
  }

  return versions.values.toList();
}

Future<List<App>> _getApps(List<String> appIDs, http.Client httpClient) async {
  final apps = <App>[];

  final request = http.Request('GET', Uri.parse('https://apps.nextcloud.com/api/v1/apps.json'));

  final streamedResponse = await httpClient.send(request);
  if (streamedResponse.statusCode != 200) {
    throw Exception('Unable to get apps, status code: ${streamedResponse.statusCode}');
  }

  final response = await http.Response.fromStream(streamedResponse);

  final appsItems = json.decode(response.body) as List;
  for (final appItem in appsItems) {
    final app = appItem as Map<String, dynamic>;
    final id = app['id'] as String;

    if (!appIDs.contains(id)) {
      continue;
    }

    final releases = <Version, AppRelease>{};

    final releasesItems = app['releases'] as List;
    for (final releaseItem in releasesItems) {
      final release = releaseItem as Map<String, dynamic>;

      final version = Version.parse(release['version'] as String);
      final normalizedVersion = Version(version.major, version.minor, 0);

      final rawPlatformVersionSpec = release['rawPlatformVersionSpec'] as String;
      final minimumServerVersionRequirement =
          Version.parse(rawPlatformVersionSpec.split(' ')[0].replaceFirst('>=', ''));
      final maximumServerVersionRequirement =
          Version.parse(rawPlatformVersionSpec.split(' ')[1].replaceFirst('<=', ''));

      if (maximumServerVersionRequirement < core.minVersion) {
        continue;
      }

      final download = release['download'] as String;

      final appRelease = AppRelease(
        version: version,
        url: download,
        minimumServerVersion: minimumServerVersionRequirement,
        maximumServerVersion: maximumServerVersionRequirement,
      );

      if (!releases.containsKey(normalizedVersion)) {
        releases[normalizedVersion] = appRelease;
      } else if (appRelease.version > releases[normalizedVersion]!.version) {
        releases[normalizedVersion] = appRelease;
      }
    }

    apps.add(
      App(
        id: id,
        releases: releases.values.toList(),
      ),
    );
  }

  apps.sort((a, b) => a.id.compareTo(b.id));
  return apps;
}
