import 'dart:async';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:cookie_store/cookie_store.dart';
import 'package:meta/meta.dart';
import 'package:neon_http_client/neon_http_client.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/src/fixtures.dart';
import 'package:nextcloud_test/src/models/models.dart';
import 'package:nextcloud_test/src/proxy_http_client.dart';
import 'package:nextcloud_test/src/test_target/docker_container.dart';
import 'package:nextcloud_test/src/test_target/local.dart';
import 'package:version/version.dart';

/// Factory for creating [TestTargetInstance]s.
@internal
abstract class TestTargetFactory<T extends TestTargetInstance> {
  /// The instance of the [TestTargetFactory].
  static final TestTargetFactory instance = TestTargetFactory._create();

  /// Creates a new [TestTargetFactory].
  static TestTargetFactory _create() {
    final dir = Platform.environment['DIR'];
    final url = Platform.environment['URL'];

    if (url != null || dir != null) {
      // Fail hard if the variables are not properly set to avoid a fallback to docker.
      return LocalFactory(
        dir: dir!,
        url: Uri.parse(url!),
      );
    }

    return DockerContainerFactory();
  }

  /// Spawns a new [T].
  FutureOr<T> spawn(Preset preset);

  /// Returns the available presets for the factory.
  late BuiltListMultimap<String, Version> presets = getPresets();

  /// Generates the presets.
  ///
  /// Use the cached version [presets] instead.
  @protected
  BuiltListMultimap<String, Version> getPresets();
}

/// Instance of a test target.
@internal
abstract class TestTargetInstance {
  /// Destroys the instance.
  FutureOr<void> destroy();

  /// URL where the target is available from the host side.
  Uri get hostURL;

  /// URL where the target is available from itself.
  Uri get targetURL;

  /// Creates an app password for [username] on the instance.
  Future<String> createAppPassword(String username);

  /// Creates a new [NextcloudClient] for a given [username].
  ///
  /// It is expected that the password of the user matches the its [username].
  Future<NextcloudClient> createClient({
    String? username = 'user1',
  }) async {
    String? appPassword;
    if (username != null) {
      appPassword = await createAppPassword(username);
    }

    final httpClient = NeonHttpClient(
      baseURL: hostURL,
      cookieStore: CookieStore(),
      client: getProxyHttpClient(
        onRequest: appendFixture,
      ),
    );

    return NextcloudClient(
      hostURL,
      loginName: username,
      password: username,
      appPassword: appPassword,
      httpClient: httpClient,
    );
  }
}
