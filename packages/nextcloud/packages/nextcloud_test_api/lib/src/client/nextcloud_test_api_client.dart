import 'dart:convert' show jsonDecode, jsonEncode;
import 'dart:io' show ContentType, HttpHeaders, HttpStatus;

import 'package:http/http.dart' as http;
import 'package:nextcloud_test_api/api.dart';
import 'package:nextcloud_test_api/client.dart';
import 'package:nextcloud_test_api/src/models/models.dart';
import 'package:path/path.dart' as p;

/// {@template nextcloud_test_api_malformed_response}
/// An exception thrown when there is a problem decoded the response body.
/// {@endtemplate}
class NextcloudTestApiMalformedResponse implements Exception {
  /// {@macro nextcloud_test_api_malformed_response}
  const NextcloudTestApiMalformedResponse({required this.error});

  /// The associated error.
  final Object error;

  @override
  String toString() {
    return 'NextcloudTestApiMalformedResponse: $error';
  }
}

/// {@template nextcloud_test_api_request_failure}
/// An exception thrown when an http request failure occurs.
/// {@endtemplate}
class NextcloudTestApiRequestFailure implements Exception {
  /// {@macro nextcloud_test_api_request_failure}
  const NextcloudTestApiRequestFailure({
    required this.statusCode,
    required this.body,
  });

  /// The associated http status code.
  final int statusCode;

  /// The associated response body.
  final Object body;

  @override
  String toString() {
    return 'NextcloudTestApiRequestFailure: statusCode: $statusCode, body $body';
  }
}

/// {@template nextcloud_test_api_client}
/// A Dart API client for the Nextcloud Test API.
/// {@endtemplate}
class NextcloudTestApiClient {
  /// Create an instance of [NextcloudTestApiClient] that integrates
  /// with a local instance of the API (http://localhost).
  ///
  /// {@macro nextcloud_test_api_client}
  NextcloudTestApiClient.localhost({
    int port = 8080,
    http.Client? httpClient,
  }) : this._(
          baseUrl: 'http://localhost:$port',
          httpClient: httpClient,
        );

  /// {@macro nextcloud_test_api_client}
  NextcloudTestApiClient._({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient ?? http.Client();

  final String _baseUrl;
  final http.Client _httpClient;

  /// GET `/api/v1/presets/<group>`
  /// Requests the presets for a test group.
  ///
  /// Supported parameters:
  /// * [group] - The test group for which the presets are requested.
  Future<GetPresetsResponse> getPresets({
    required String group,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/v1/presets/$group');
    final response = await _httpClient.get(
      uri,
      headers: _getRequestHeaders(),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw NextcloudTestApiRequestFailure(
        body: response.body,
        statusCode: response.statusCode,
      );
    }

    return GetPresetsResponse.fromJson(
      response.json() as Map<String, dynamic>,
    );
  }

  /// GET `/api/v1/fixtures?fixtureID=<fixturePath>`
  /// Requests a test fixture.
  ///
  /// Supported parameters:
  /// * [fixturePath] - The path of the fixture.
  Future<ValidateFixtureResponse> validateFixture({
    required List<String> fixturePath,
  }) async {
    // All fixture paths are sent as posix paths.
    // The server will decode the path and re join it according to the running platform.
    final fixtureID = p.posix.joinAll(fixturePath);
    final uri = Uri.parse('$_baseUrl/api/v1/fixtures?fixtureID=${Uri.encodeQueryComponent(fixtureID)}');
    final response = await _httpClient.get(
      uri,
      headers: _getRequestHeaders(),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.notFound:
        return ValidateFixtureResponse.fromJson(
          response.json() as Map<String, dynamic>,
        );

      default:
        throw NextcloudTestApiRequestFailure(
          body: response.body,
          statusCode: response.statusCode,
        );
    }
  }

  /// POST `/api/v1/setup`
  /// Requests to setup a test target.
  ///
  /// Supported parameters:
  /// * [preset] - The preset to setup.
  Future<SetupResponse> setup({
    required Preset preset,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/v1/setup');
    final response = await _httpClient.post(
      uri,
      headers: _getRequestHeaders(),
      body: jsonEncode(preset),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return SetupResponse.fromJson(
          response.json() as Map<String, dynamic>,
        );

      default:
        throw NextcloudTestApiRequestFailure(
          body: response.body,
          statusCode: response.statusCode,
        );
    }
  }

  /// POST `/api/v1/teardown`
  /// Requests to destroy a test target.
  ///
  /// Supported parameters:
  /// * [preset] - The preset to tear down.
  Future<void> tearDown({
    required Preset preset,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/v1/teardown');
    final response = await _httpClient.post(
      uri,
      headers: _getRequestHeaders(),
      body: jsonEncode(preset),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return;

      default:
        throw NextcloudTestApiRequestFailure(
          body: response.body,
          statusCode: response.statusCode,
        );
    }
  }

  /// POST `/api/v1/create_app_password?username=<username>`
  /// Requests the app password for a given user.
  ///
  /// Supported parameters:
  /// * [preset] - The running preset.
  /// * [username] - The name of the user to create a password for.
  Future<String?> createAppPassword({
    required Preset preset,
    required String username,
  }) async {
    final uri = Uri.parse('$_baseUrl/api/v1/create_app_password?username=${Uri.encodeQueryComponent(username)}');
    final response = await _httpClient.post(
      uri,
      headers: _getRequestHeaders(),
      body: jsonEncode(preset),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return CreateAppPasswordResponse.fromJson(
          response.json() as Map<String, dynamic>,
        ).appPassword;

      case HttpStatus.noContent:
        return null;

      default:
        throw NextcloudTestApiRequestFailure(
          body: response.body,
          statusCode: response.statusCode,
        );
    }
  }

  static Map<String, String> _getRequestHeaders() {
    return <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.value,
      HttpHeaders.acceptHeader: ContentType.json.value,
    };
  }
}

extension on http.Response {
  Object json() {
    try {
      return jsonDecode(body) as Object;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        NextcloudTestApiMalformedResponse(error: error),
        stackTrace,
      );
    }
  }
}
