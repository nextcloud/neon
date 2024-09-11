import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud_test/src/models/models.dart';
import 'package:nextcloud_test/src/test_target/test_target.dart';
import 'package:path/path.dart' as p;
import 'package:version/version.dart';

int _randomPort() => 1024 + Random().nextInt(65535 - 1024);

/// Factory for spawning docker containers as test targets.
@internal
final class DockerContainerFactory extends TestTargetFactory<DockerContainerInstance> {
  /// Creates a new docker container and returns its representation.
  @override
  Future<DockerContainerInstance> spawn(Preset preset) async {
    final dockerImageName = 'ghcr.io/nextcloud/neon/dev:${preset.name}-${preset.version.major}.${preset.version.minor}';

    var result = await Process.run(
      'docker',
      [
        'images',
        '-q',
        dockerImageName,
      ],
      stdoutEncoding: utf8,
    );
    if (result.exitCode != 0) {
      throw Exception('Querying docker image failed: ${result.stderr}');
    }

    if (result.stdout.toString().isEmpty) {
      throw Exception('Missing docker image $dockerImageName. Please build it using ./tool/build-dev-container.sh');
    }

    late int port;
    while (true) {
      port = _randomPort();
      result = await Process.run(
        'docker',
        [
          'run',
          '--rm',
          '-d',
          '--add-host',
          'host.docker.internal:host-gateway',
          '-p',
          '$port:80',
          dockerImageName,
        ],
        stdoutEncoding: utf8,
      );

      // 125 means the docker run command itself has failed which indicated the port is already used
      if (result.exitCode != 125) {
        break;
      }
    }

    if (result.exitCode != 0) {
      throw Exception('Failed to run docker container: ${result.stderr}');
    }

    return DockerContainerInstance(
      id: result.stdout.toString().replaceAll('\n', ''),
      port: port,
    );
  }

  @override
  BuiltListMultimap<String, Version> getPresets() {
    final files = Glob('packages/nextcloud_test_presets/docker/presets/**/*').listSync();

    return BuiltListMultimap<String, Version>.build((b) {
      for (final file in files) {
        b.add(
          p.split(file.dirname).last,
          Version.parse(file.basename),
        );
      }
    });
  }
}

/// Test target representing a docker container.
@internal
final class DockerContainerInstance extends TestTargetInstance {
  /// Creates a new Docker container instance.
  DockerContainerInstance({
    required this.id,
    required this.port,
  });

  /// ID of the docker container.
  final String id;

  /// Assigned port of docker container.
  final int port;

  /// Removes the docker container from the system.
  @override
  Future<void> destroy() async {
    await Process.run(
      'docker',
      [
        'kill',
        id,
      ],
    );
  }

  @override
  late Uri hostURL = Uri(
    scheme: 'http',
    host: 'localhost',
    port: port,
  );

  @override
  Uri targetURL = Uri(
    scheme: 'http',
    host: 'localhost',
  );

  @override
  Future<String> createAppPassword(String username) async {
    final process = await Process.start(
      'docker',
      [
        'exec',
        '-i',
        id,
        'php',
        '-f',
        'occ',
        'user:add-app-password',
        username,
      ],
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
