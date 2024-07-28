import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:nextcloud_test/src/presets.dart';
import 'package:nextcloud_test/src/test_target/test_target.dart';
import 'package:process_run/process_run.dart';
import 'package:version/version.dart';

/// Factory for running tests against a local instance.
class LocalFactory extends TestTargetFactory<LocalInstance> {
  @override
  LocalInstance spawn(Preset? preset) => LocalInstance();

  @override
  BuiltListMultimap<String, Version> getPresets() {
    final presets = ListMultimapBuilder<String, Version>();
    final regex = RegExp('  - (.*): (.*)');

    final dir = Platform.environment['DIR']!;

    var result = runExecutableArgumentsSync(
      'php',
      [
        '-f',
        './occ',
        'app:list',
        '--enabled',
      ],
      workingDirectory: dir,
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

    result = runExecutableArgumentsSync(
      'php',
      [
        '-f',
        './occ',
        'status',
      ],
      workingDirectory: dir,
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
class LocalInstance extends TestTargetInstance {
  @override
  void destroy() {}

  @override
  Uri hostURL = Uri.parse(Platform.environment['URL']!);

  @override
  late Uri targetURL = hostURL;

  @override
  Future<String> createAppPassword(String username) async {
    final dir = Platform.environment['DIR']!;

    final inputStream = StreamController<List<int>>();
    final process = runExecutableArguments(
      'php',
      [
        '-f',
        'occ',
        'user:add-app-password',
        username,
      ],
      stdin: inputStream.stream,
      workingDirectory: dir,
    );
    inputStream.add(utf8.encode(username));
    await inputStream.close();

    final result = await process;
    if (result.exitCode != 0) {
      throw Exception('Failed to run generate app password command\n${result.stderr}\n${result.stdout}');
    }

    return (result.stdout as String).split('\n')[1];
  }
}
