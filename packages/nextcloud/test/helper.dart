import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:nextcloud/nextcloud.dart';
import 'package:process_run/cmd_run.dart';
import 'package:test/test.dart';

class DockerContainer {
  DockerContainer({
    required this.id,
    required this.port,
  });

  final String id;

  final int port;

  Future runOccCommand(final List<String> args) async {
    final result = await runExecutableArguments(
      'docker',
      [
        'exec',
        id,
        'php',
        '-f',
        'occ',
        ...args,
      ],
      stdout: stdout,
      stderr: stderr,
    );
    if (result.exitCode != 0) {
      throw Exception('Failed to run occ command');
    }
  }

  void destroy() => unawaited(
        runExecutableArguments(
          'docker',
          [
            'kill',
            id,
          ],
        ),
      );

  Future<String> collectLogs() async {
    final serverLogs = (await runExecutableArguments(
      'docker',
      [
        'logs',
        id,
      ],
      stdoutEncoding: utf8,
    ))
        .stdout as String;
    final nextcloudLogs = (await runExecutableArguments(
      'docker',
      [
        'exec',
        id,
        'cat',
        'data/nextcloud.log',
      ],
      stdoutEncoding: utf8,
    ))
        .stdout as String;

    return '$serverLogs\n\n$nextcloudLogs';
  }
}

class TestNextcloudClient extends NextcloudClient {
  TestNextcloudClient(
    super.baseURL, {
    super.loginName,
    super.username,
    super.password,
    super.language,
    super.appType,
    super.userAgentOverride,
    super.cookieJar,
  });
}

Future<TestNextcloudClient> getTestClient(
  final DockerContainer container, {
  final String? username = 'user1',
  final String? password = 'user1',
  final bool useAppPassword = false,
  final AppType appType = AppType.unknown,
  final String? userAgentOverride,
}) async {
  // ignore: prefer_asserts_with_message
  assert(!useAppPassword || (username != null && password != null));

  var clientPassword = password;
  if (useAppPassword) {
    final inputStream = StreamController<List<int>>();
    final process = runExecutableArguments(
      'docker',
      [
        'exec',
        '-i',
        container.id,
        'php',
        '-f',
        'occ',
        'user:add-app-password',
        username!,
      ],
      stdin: inputStream.stream,
    );
    inputStream.add(utf8.encode(password!));
    await inputStream.close();

    final result = await process;
    if (result.exitCode != 0) {
      throw Exception('Failed to run generate app password command\n${result.stderr}\n${result.stdout}');
    }
    clientPassword = (result.stdout as String).split('\n')[1];
  }

  final client = TestNextcloudClient(
    'http://localhost:${container.port}',
    loginName: username,
    username: username,
    password: clientPassword,
    appType: appType,
    userAgentOverride: userAgentOverride,
    cookieJar: CookieJar(),
  );

  while (true) {
    // Test will timeout after 30s
    try {
      await client.core.getStatus();
      break;
    } catch (_) {}
  }

  return client;
}

Future<DockerContainer> getDockerContainer(final DockerImage image, {final bool useApache = false}) async {
  late ProcessResult result;
  late int port;
  while (true) {
    port = randomPort();
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
        image,
        if (!useApache) ...[
          'php',
          '-S',
          '0.0.0.0:80',
        ],
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

  return DockerContainer(
    id: result.stdout.toString().replaceAll('\n', ''),
    port: port,
  );
}

typedef DockerImage = String;

Future<DockerImage> getDockerImage() async {
  const dockerImageName = 'nextcloud-neon-dev';

  final inputStream = StreamController<List<int>>();
  final process = runExecutableArguments(
    'docker',
    [
      'build',
      '-t',
      dockerImageName,
      '-f',
      '-',
      '../../tool',
    ],
    stdin: inputStream.stream,
  );
  inputStream.add(utf8.encode(File('../../tool/Dockerfile.dev').readAsStringSync()));
  await inputStream.close();

  final result = await process;
  if (result.exitCode != 0) {
    throw Exception('Failed to build docker image');
  }

  return dockerImageName;
}

class TestNextcloudUser {
  TestNextcloudUser(
    this.username,
    this.password, {
    this.displayName,
  });

  final String username;
  final String password;
  final String? displayName;
}

int randomPort() => 1024 + Random().nextInt(65535 - 1024);

void expectDateInReasonableTimeRange(final DateTime actual, final DateTime expected) {
  const duration = Duration(seconds: 10);
  expect(actual.isAfter(expected.subtract(duration)), isTrue);
  expect(actual.isBefore(expected.add(duration)), isTrue);
}
