import 'dart:async';

import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:nextcloud_test/src/models/models.dart';
import 'package:version/version.dart';

/// Class that manages the creation of nextcloud api clients and the test environment.
final class NextcloudTester {
  /// Creates a new Nextcloud tester for the given [appName] and [version].
  NextcloudTester({
    required String appName,
    required Version version,
    String username = defaultTestUsername,
  })  : _preset = (name: appName, version: version),
        _username = username;

  final Preset _preset;

  final String _username;

  /// The app version tested.
  Version get version => _preset.version;

  /// URL where the target is available from itself.
  Uri get targetURL {
    final target = _target;
    if (target == null) {
      throw StateError('The tester has not been initialized');
    }

    return target.targetURL;
  }

  /// Creates a new [NextcloudClient] for a given [username].
  ///
  /// It is expected that the password of the user matches its [username].
  FutureOr<NextcloudClient> createClient({String? username = 'user1'}) {
    final target = _target;
    if (target == null) {
      throw StateError('The tester has not been initialized');
    }

    return target.createClient(username: username);
  }

  /// The Nextcloud api client for the default user.
  ///
  /// Use [createClient] to create a separate one.
  NextcloudClient get client {
    final client = _client;
    if (client == null) {
      throw StateError('The tester has not been initialized');
    }

    return client;
  }

  late NextcloudClient? _client;
  late TestTargetInstance? _target;

  /// Initializes the tester creating the target and default client.
  Future<void> init() async {
    _target = await TestTargetFactory.instance.spawn(_preset);
    _client = await _target!.createClient(username: _username);
  }

  /// Closes the tester.
  Future<void> close() async {
    client.close();
    await _target!.destroy();
  }
}
