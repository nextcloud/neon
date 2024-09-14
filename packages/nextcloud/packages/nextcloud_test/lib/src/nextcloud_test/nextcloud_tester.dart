import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart' as http;
import 'package:interceptor_http_client/interceptor_http_client.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud_test/src/nextcloud_test.dart';
import 'package:nextcloud_test_api/client.dart';

/// The shared base http client.
///
/// Both the nextcloud communication and the communication to the test manager
/// are handled through this client.
@internal
final http.Client httpClient = http.Client();

/// Class that manages the creation of nextcloud api clients and the test environment.
final class NextcloudTester {
  /// Creates a new Nextcloud tester for the given [preset] with the initial [username].
  NextcloudTester({
    required NextcloudTestApiClient testClient,
    required Preset preset,
    required String username,
  })  : _preset = preset,
        _username = username,
        _testClient = testClient;

  Preset _preset;

  final String _username;

  final NextcloudTestApiClient _testClient;

  late Uri _hostURL;

  /// URL where the target is available from itself.
  late Uri targetURL;

  /// The Nextcloud api client for the default user.
  ///
  /// Use [createClient] to create a separate one.
  late NextcloudClient client;

  /// The app version tested.
  Version get version => _preset.version;

  /// Creates a new [NextcloudClient] for a given [username].
  ///
  /// It is expected that the password of the user matches its [username].
  Future<NextcloudClient> createClient({String username = 'user1'}) async {
    final appPassword = await _testClient.createAppPassword(
      preset: _preset,
      username: username,
    );

    final interceptedClient = InterceptorHttpClient(
      baseClient: httpClient,
      interceptors: BuiltList([
        CookieStoreInterceptor(
          cookieStore: CookieStore(),
        ),
        const FixtureInterceptor(appendFixture: appendFixture),
      ]),
    );

    return NextcloudClient(
      _hostURL,
      loginName: username,
      password: username,
      appPassword: appPassword,
      httpClient: interceptedClient,
    );
  }

  /// Initializes the tester creating the target and default client.
  Future<void> init(String platform) async {
    _preset = _preset.rebuild((b) {
      b.platform = platform;
    });

    final response = await _testClient.setup(
      preset: _preset,
    );
    _hostURL = response.hostURL;
    targetURL = response.targetURL;

    client = await createClient(username: _username);
  }

  /// Closes the tester.
  Future<void> close() async {
    await _testClient.tearDown(
      preset: _preset,
    );
  }
}
