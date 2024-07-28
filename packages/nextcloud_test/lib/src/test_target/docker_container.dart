import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:nextcloud_test/src/presets.dart';
import 'package:nextcloud_test/src/test_target/test_target.dart';
import 'package:path/path.dart' as p;
import 'package:process_run/process_run.dart';
import 'package:version/version.dart';

int _randomPort() => 1024 + Random().nextInt(65535 - 1024);

/// Factory for spawning docker containers as test targets.
class DockerContainerFactory extends TestTargetFactory<DockerContainerInstance> {
  /// Creates a new docker container and returns its representation.
  @override
  Future<DockerContainerInstance> spawn(Preset? preset) async {
    final dockerImageName =
        'ghcr.io/nextcloud/neon/dev:${preset!.name}-${preset.version.major}.${preset.version.minor}';

    var result = await runExecutableArguments(
      'docker',
      [
        'images',
        '-q',
        dockerImageName,
      ],
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
      result = await runExecutableArguments(
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
    final files = Glob('../nextcloud_test/docker/presets/**/*').listSync();

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
class DockerContainerInstance extends TestTargetInstance {
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
  Future<void> destroy() => runExecutableArguments(
        'docker',
        [
          'kill',
          id,
        ],
      );

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
    final inputStream = StreamController<List<int>>();
    final process = runExecutableArguments(
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
      stdin: inputStream.stream,
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
