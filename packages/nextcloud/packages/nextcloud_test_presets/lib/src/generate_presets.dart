import 'dart:convert';
import 'dart:io' show Directory, File, Link;

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud_test_presets/src/models/models.dart';

/// Generates the test presets.
Future<void> generatePresets() async {
  const appIDs = [
    'cookbook',
    'drop_account',
    'groupfolders',
    'news',
    'notes',
    'spreed',
    'tables',
    'terms_of_service',
    'uppush',
  ];
  final releaseFallbacks = <String, Map<Version, String>>{};

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
        final String? url;
        if (a == app) {
          url = release.url;
        } else {
          url = a.findLatestCompatibleRelease(serverRelease)?.url ??
              a.findLatestCompatibleRelease(serverRelease, allowUnstable: true)?.url ??
              releaseFallbacks[a.id]?[serverRelease.version];
          if (url == null) {
            throw Exception('Unable to find compatible release for ${a.id} on ${serverRelease.version}');
          }
        }

        final checksum = await _getUrlChecksum(httpClient, url);

        buffer
          ..writeln('${a.id.toUpperCase()}_URL=$url')
          ..writeln('${a.id.toUpperCase()}_CHECKSUM=sha256:$checksum');
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
      final url = app.findLatestCompatibleRelease(serverRelease)?.url ??
          app.findLatestCompatibleRelease(serverRelease, allowUnstable: true)?.url ??
          releaseFallbacks[app.id]?[serverRelease.version];
      if (url == null) {
        throw Exception('Unable to find compatible release for ${app.id} on ${serverRelease.version}');
      }

      final checksum = await _getUrlChecksum(httpClient, url);

      buffer
        ..writeln('${app.id.toUpperCase()}_URL=$url')
        ..writeln('${app.id.toUpperCase()}_CHECKSUM=sha256:$checksum');
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

final _urlChecksums = <String, String>{};

Future<String> _getUrlChecksum(http.Client httpClient, String url) async {
  if (_urlChecksums[url] == null) {
    final request = http.Request('GET', Uri.parse(url));

    final streamedResponse = await httpClient.send(request);
    if (streamedResponse.statusCode != 200) {
      throw Exception('Unable to get app, status code: ${streamedResponse.statusCode}');
    }

    final checksum = await sha256.bind(streamedResponse.stream).first;
    _urlChecksums[url] = checksum.toString();
  }

  return _urlChecksums[url]!;
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

        final version = Version.parse(name.substring(0, name.length - 11));
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
        app: id,
        version: version,
        url: download,
        minimumServerVersion: minimumServerVersionRequirement,
        maximumServerVersion: maximumServerVersionRequirement,
      );

      if (!releases.containsKey(normalizedVersion)) {
        releases[normalizedVersion] = appRelease;
      } else if (
          // Always prefer a stable release if the current one is unstable, regardless of the version numbers.
          (releases[normalizedVersion]!.version.isPreRelease && !appRelease.version.isPreRelease) ||
              // If both are stable or unstable, just take the higher version.
              // The first condition is necessary to prevent that an unstable release with a higher version will override a stable release with a lower version.
              (releases[normalizedVersion]!.version.isPreRelease == appRelease.version.isPreRelease &&
                  appRelease.version > releases[normalizedVersion]!.version)) {
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
