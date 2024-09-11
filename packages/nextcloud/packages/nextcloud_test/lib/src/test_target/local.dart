import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:nextcloud_test/src/models/models.dart';
import 'package:nextcloud_test/src/test_target/test_target.dart';
import 'package:version/version.dart';

/// Factory for running tests against a local instance.
final class LocalFactory extends TestTargetFactory<LocalInstance> {
  /// Creates a new test factory for a local server.
  LocalFactory({
    required String dir,
    required Uri url,
  })  : _dir = dir,
        _instance = LocalInstance(url: url, dir: dir);

  final String _dir;

  final LocalInstance _instance;

  @override
  LocalInstance spawn(Preset preset) => _instance;

  @override
  BuiltListMultimap<String, Version> getPresets() {
    final presets = ListMultimapBuilder<String, Version>();
    final regex = RegExp('  - (.*): (.*)');

    var result = Process.runSync(
      'php',
      [
        '-f',
        './occ',
        'app:list',
        '--enabled',
      ],
      stdoutEncoding: utf8,
      workingDirectory: _dir,
    );
    if (result.exitCode != 0) {
      throw Exception('Failed to list apps\n${result.stderr}\n${result.stdout}');
    }

    for (final line in (result.stdout as String).split('\n')) {
      final matches = regex.allMatches(line);

      if (matches.isNotEmpty) {
        final match = matches.single;

        presets.add(match.group(1)!, Version.parse(match.group(2)!));
      }
    }

    result = Process.runSync(
      'php',
      [
        '-f',
        './occ',
        'status',
      ],
      stdoutEncoding: utf8,
      workingDirectory: _dir,
    );
    if (result.exitCode != 0) {
      throw Exception('Failed to get status\n${result.stderr}\n${result.stdout}');
    }

    for (final line in (result.stdout as String).split('\n')) {
      final matches = regex.allMatches(line);

      if (matches.isNotEmpty) {
        final match = matches.single;
        if (match.group(1)! != 'version') {
          continue;
        }

        presets.add('server', Version.parse(match.group(2)!));
        break;
      }
    }

    return presets.build();
  }
}

/// Test target representing a local instance.
final class LocalInstance extends TestTargetInstance {
  /// Creates a new test instance for a local server.
  LocalInstance({
    required Uri url,
    required String dir,
  })  : hostURL = url,
        targetURL = url,
        _dir = dir;

  final String _dir;

  @override
  void destroy() {}

  @override
  final Uri hostURL;

  @override
  final Uri targetURL;

  @override
  Future<String> createAppPassword(String username) async {
    final process = await Process.start(
      'php',
      [
        '-f',
        'occ',
        'user:add-app-password',
        username,
      ],
      workingDirectory: _dir,
    );

    process.stdin.add(utf8.encode(username));
    await process.stdin.close();
    final stdout = await utf8.decodeStream(process.stdout);

    if (await process.exitCode != 0) {
      final stderr = await utf8.decodeStream(process.stderr);

      throw Exception('Failed to run generate app password command\n$stderr\n$stdout');
    }

    return stdout.split('\n')[1];
  }
}
