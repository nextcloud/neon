import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:process_run/cmd_run.dart';
import 'package:test/test.dart';

const String nextcloudVersion = '25.0.2';
const String defaultUsername = 'user1';
const String defaultPassword = 'user1';

class DockerImage {
  DockerImage({
    required this.name,
  });

  final String name;
}

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

  Future destroy() => runExecutableArguments(
        'docker',
        [
          'kill',
          id,
        ],
      );

  Future<String> collectLogs() async {
    final apacheLogs = (await runExecutableArguments(
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

    return '$apacheLogs\n\n$nextcloudLogs';
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
  final String? username = defaultUsername,
  final String? password = defaultPassword,
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
    } catch (_) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  return client;
}

Future<DockerContainer> getDockerContainer(final DockerImage image) async {
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
        '-p',
        '$port:80',
        '--add-host',
        'host.docker.internal:host-gateway',
        image.name,
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

Future<DockerImage> getDockerImage({
  final List<TestNextcloudUser>? users,
  final List<String>? apps,
}) async {
  final hash = sha1
      .convert(
        utf8.encode(
          <String>[
            if (users != null)
              for (final user in users) user.toString(),
            if (apps != null) ...apps,
          ].join(),
        ),
      )
      .toString();

  final dockerImageName = 'nextcloud-neon-$hash';

  final inputStream = StreamController<List<int>>();
  final process = runExecutableArguments(
    'docker',
    [
      'build',
      '-t',
      dockerImageName,
      '-f',
      '-',
      './test',
    ],
    stdout: stdout,
    stderr: stderr,
    stdin: inputStream.stream,
  );
  inputStream.add(
    utf8.encode(
      TestDockerHelper.generateInstructions(
        nextcloudVersion,
        users: users,
        apps: apps,
      ),
    ),
  );
  await inputStream.close();

  final result = await process;
  if (result.exitCode != 0) {
    throw Exception('Failed to build docker image');
  }

  return DockerImage(
    name: dockerImageName,
  );
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

class TestDockerHelper {
  static String generateInstructions(
    final String nextcloudVersion, {
    final List<TestNextcloudUser>? users,
    final List<String>? apps,
  }) {
    users?.sort((final a, final b) => a.username.compareTo(b.username));
    apps?.sort();

    final instructions = <String>[
      generateFromNextcloudImageInstruction(nextcloudVersion),
      'WORKDIR /usr/src/nextcloud',
      'RUN chown -R www-data:www-data .',
      'USER www-data',
      'RUN ./occ maintenance:install --admin-pass admin --admin-email admin@example.com',
      'RUN ./occ app:disable password_policy',
      'RUN ./occ config:system:set allow_local_remote_servers --value=true',
      generateCreateTestUserInstruction(),
      if (apps != null) ...[
        for (final app in apps) ...[
          generateInstallAppInstruction(app),
        ],
      ],
      if (users != null) ...[
        for (final user in users) ...[
          generateCreateUserInstruction(user),
        ],
      ],
      'RUN ./occ app:enable password_policy',
      'COPY --chown=www-data:www-data overlay /usr/src/nextcloud/',
      '',
    ];

    return instructions.join('\n');
  }

  static String generateFromNextcloudImageInstruction(
    final String nextcloudVersion,
  ) =>
      'FROM nextcloud:$nextcloudVersion';

  static String generateCreateTestUserInstruction() => generateCreateUserInstruction(
        TestNextcloudUser(
          defaultUsername,
          defaultPassword,
          displayName: 'User One',
        ),
      );

  static String generateCreateUserInstruction(final TestNextcloudUser user) =>
      'RUN OC_PASS="${user.password}" ./occ user:add --password-from-env ${user.displayName != null ? '--display-name="${user.displayName}"' : ''} ${user.username}';

  static String generateInstallAppInstruction(
    final String appName,
  ) =>
      'RUN ./occ app:install $appName';
}

int randomPort() => 1024 + Random().nextInt(65535 - 1024);

void expectDateInReasonableTimeRange(final DateTime actual, final DateTime expected) {
  const duration = Duration(seconds: 10);
  expect(actual.isAfter(expected.subtract(duration)), isTrue);
  expect(actual.isBefore(expected.add(duration)), isTrue);
}
