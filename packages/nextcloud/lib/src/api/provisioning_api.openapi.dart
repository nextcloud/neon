// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:dynamite_runtime/utils.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'provisioning_api.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  AppConfigClient get appConfig => AppConfigClient(this);

  AppsClient get apps => AppsClient(this);

  GroupsClient get groups => GroupsClient(this);

  PreferencesClient get preferences => PreferencesClient(this);

  UsersClient get users => UsersClient(this);
}

class AppConfigClient {
  AppConfigClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps returned
  ///
  /// See:
  ///  * [getAppsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigGetAppsResponseApplicationJson, void>> getApps({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppsRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps returned
  ///
  /// See:
  ///  * [getApps] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigGetAppsResponseApplicationJson, void> getAppsRaw({final bool oCSAPIRequest = true}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppConfigGetAppsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigGetAppsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the config keys of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Keys returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getKeysRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigGetKeysResponseApplicationJson, void>> getKeys({
    required final String app,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getKeysRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the config keys of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Keys returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getKeys] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigGetKeysResponseApplicationJson, void> getKeysRaw({
    required final String app,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppConfigGetKeysResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigGetKeysResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a the config value of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [defaultValue] Default returned value if the value is empty. Defaults to `''`.
  ///   * [app] ID of the app.
  ///   * [key] Key.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getValueRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigGetValueResponseApplicationJson, void>> getValue({
    required final String app,
    required final String key,
    final String defaultValue = '',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getValueRaw(
      app: app,
      key: key,
      defaultValue: defaultValue,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a the config value of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [defaultValue] Default returned value if the value is empty. Defaults to `''`.
  ///   * [app] ID of the app.
  ///   * [key] Key.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value returned
  ///   * 403: App is not allowed
  ///
  /// See:
  ///  * [getValue] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigGetValueResponseApplicationJson, void> getValueRaw({
    required final String app,
    required final String key,
    final String defaultValue = '',
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    pathParameters['key'] = key;
    if (defaultValue != '') {
      queryParameters['defaultValue'] = defaultValue;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppConfigGetValueResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigGetValueResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update the config value of an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [value] New value for the key.
  ///   * [app] ID of the app.
  ///   * [key] Key to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value updated successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [setValueRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigSetValueResponseApplicationJson, void>> setValue({
    required final String value,
    required final String app,
    required final String key,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setValueRaw(
      value: value,
      app: app,
      key: key,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the config value of an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [value] New value for the key.
  ///   * [app] ID of the app.
  ///   * [key] Key to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Value updated successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [setValue] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigSetValueResponseApplicationJson, void> setValueRaw({
    required final String value,
    required final String app,
    required final String key,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['value'] = value;
    pathParameters['app'] = app;
    pathParameters['key'] = key;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppConfigSetValueResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigSetValueResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete a config key of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [key] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Key deleted successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [deleteKeyRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppConfigDeleteKeyResponseApplicationJson, void>> deleteKey({
    required final String app,
    required final String key,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteKeyRaw(
      app: app,
      key: key,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a config key of an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [key] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Key deleted successfully
  ///   * 403: App or key is not allowed
  ///
  /// See:
  ///  * [deleteKey] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppConfigDeleteKeyResponseApplicationJson, void> deleteKeyRaw({
    required final String app,
    required final String key,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    pathParameters['key'] = key;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppConfigDeleteKeyResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppConfigDeleteKeyResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class AppsClient {
  AppsClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of installed apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filter] Filter for enabled or disabled apps.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Installed apps returned
  ///
  /// See:
  ///  * [getAppsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsGetAppsResponseApplicationJson, void>> getApps({
    final String? filter,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppsRaw(
      filter: filter,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of installed apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filter] Filter for enabled or disabled apps.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Installed apps returned
  ///
  /// See:
  ///  * [getApps] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsGetAppsResponseApplicationJson, void> getAppsRaw({
    final String? filter,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    if (filter != null) {
      queryParameters['filter'] = filter;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/apps').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppsGetAppsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsGetAppsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the app info for an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App info returned
  ///
  /// See:
  ///  * [getAppInfoRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsGetAppInfoResponseApplicationJson, void>> getAppInfo({
    required final String app,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppInfoRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the app info for an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App info returned
  ///
  /// See:
  ///  * [getAppInfo] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsGetAppInfoResponseApplicationJson, void> getAppInfoRaw({
    required final String app,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/apps/{app}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppsGetAppInfoResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsGetAppInfoResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Enable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App enabled successfully
  ///
  /// See:
  ///  * [enableRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsEnableResponseApplicationJson, void>> enable({
    required final String app,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = enableRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Enable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App enabled successfully
  ///
  /// See:
  ///  * [enable] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsEnableResponseApplicationJson, void> enableRaw({
    required final String app,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/apps/{app}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppsEnableResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsEnableResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Disable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App disabled successfully
  ///
  /// See:
  ///  * [disableRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppsDisableResponseApplicationJson, void>> disable({
    required final String app,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = disableRaw(
      app: app,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Disable an app.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App disabled successfully
  ///
  /// See:
  ///  * [disable] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppsDisableResponseApplicationJson, void> disableRaw({
    required final String app,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/apps/{app}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<AppsDisableResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppsDisableResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class GroupsClient {
  GroupsClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of groups.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups returned
  ///
  /// See:
  ///  * [getGroupsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupsResponseApplicationJson, void>> getGroups({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getGroupsRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of groups.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups returned
  ///
  /// See:
  ///  * [getGroups] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupsResponseApplicationJson, void> getGroupsRaw({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsGetGroupsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a new group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [displayname] Display name of the group. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group created successfully
  ///
  /// See:
  ///  * [addGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsAddGroupResponseApplicationJson, void>> addGroup({
    required final String groupid,
    final String displayname = '',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = addGroupRaw(
      groupid: groupid,
      displayname: displayname,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a new group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [displayname] Display name of the group. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group created successfully
  ///
  /// See:
  ///  * [addGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsAddGroupResponseApplicationJson, void> addGroupRaw({
    required final String groupid,
    final String displayname = '',
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['groupid'] = groupid;
    if (displayname != '') {
      queryParameters['displayname'] = displayname;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsAddGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsAddGroupResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of groups details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups details returned
  ///
  /// See:
  ///  * [getGroupsDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupsDetailsResponseApplicationJson, void>> getGroupsDetails({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getGroupsDetailsRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of groups details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Groups details returned
  ///
  /// See:
  ///  * [getGroupsDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupsDetailsResponseApplicationJson, void> getGroupsDetailsRaw({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups/details').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsGetGroupsDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupsDetailsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of users in the specified group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User IDs returned
  ///   * 404: Group not found
  ///   * 403: Missing permissions to get users in the group
  ///
  /// See:
  ///  * [getGroupUsersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupUsersResponseApplicationJson, void>> getGroupUsers({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getGroupUsersRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users in the specified group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User IDs returned
  ///   * 404: Group not found
  ///   * 403: Missing permissions to get users in the group
  ///
  /// See:
  ///  * [getGroupUsers] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupUsersResponseApplicationJson, void> getGroupUsersRaw({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    checkPattern(groupId, RegExp(r'^.+$'), 'groupId'); // coverage:ignore-line
    pathParameters['groupId'] = groupId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups/{groupId}/users').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsGetGroupUsersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupUsersResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of users details in the specified group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users details returned
  ///
  /// See:
  ///  * [getGroupUsersDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetGroupUsersDetailsResponseApplicationJson, void>> getGroupUsersDetails({
    required final String groupId,
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getGroupUsersDetailsRaw(
      groupId: groupId,
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users details in the specified group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users details returned
  ///
  /// See:
  ///  * [getGroupUsersDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetGroupUsersDetailsResponseApplicationJson, void> getGroupUsersDetailsRaw({
    required final String groupId,
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    checkPattern(groupId, RegExp(r'^.+$'), 'groupId'); // coverage:ignore-line
    pathParameters['groupId'] = groupId;
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups/{groupId}/users/details').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsGetGroupUsersDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the list of user IDs that are a subadmin of the group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Sub admins returned
  ///
  /// See:
  ///  * [getSubAdminsOfGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsGetSubAdminsOfGroupResponseApplicationJson, void>> getSubAdminsOfGroup({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getSubAdminsOfGroupRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the list of user IDs that are a subadmin of the group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Sub admins returned
  ///
  /// See:
  ///  * [getSubAdminsOfGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsGetSubAdminsOfGroupResponseApplicationJson, void> getSubAdminsOfGroupRaw({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    checkPattern(groupId, RegExp(r'^.+$'), 'groupId'); // coverage:ignore-line
    pathParameters['groupId'] = groupId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups/{groupId}/subadmins').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsGetSubAdminsOfGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of users in the specified group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users returned
  ///
  /// See:
  ///  * [getGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  @Deprecated('')
  Future<DynamiteResponse<GroupsGetGroupResponseApplicationJson, void>> getGroup({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getGroupRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users in the specified group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group users returned
  ///
  /// See:
  ///  * [getGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  @Deprecated('')
  DynamiteRawResponse<GroupsGetGroupResponseApplicationJson, void> getGroupRaw({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    checkPattern(groupId, RegExp(r'^.+$'), 'groupId'); // coverage:ignore-line
    pathParameters['groupId'] = groupId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups/{groupId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsGetGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsGetGroupResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key to update, only 'displayname'.
  ///   * [value] New value for the key.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group updated successfully
  ///
  /// See:
  ///  * [updateGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsUpdateGroupResponseApplicationJson, void>> updateGroup({
    required final String key,
    required final String value,
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = updateGroupRaw(
      key: key,
      value: value,
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key to update, only 'displayname'.
  ///   * [value] New value for the key.
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group updated successfully
  ///
  /// See:
  ///  * [updateGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsUpdateGroupResponseApplicationJson, void> updateGroupRaw({
    required final String key,
    required final String value,
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['key'] = key;
    queryParameters['value'] = value;
    checkPattern(groupId, RegExp(r'^.+$'), 'groupId'); // coverage:ignore-line
    pathParameters['groupId'] = groupId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups/{groupId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsUpdateGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsUpdateGroupResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group deleted successfully
  ///
  /// See:
  ///  * [deleteGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<GroupsDeleteGroupResponseApplicationJson, void>> deleteGroup({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteGroupRaw(
      groupId: groupId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupId] ID of the group.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Group deleted successfully
  ///
  /// See:
  ///  * [deleteGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<GroupsDeleteGroupResponseApplicationJson, void> deleteGroupRaw({
    required final String groupId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    checkPattern(groupId, RegExp(r'^.+$'), 'groupId'); // coverage:ignore-line
    pathParameters['groupId'] = groupId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/groups/{groupId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GroupsDeleteGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GroupsDeleteGroupResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class PreferencesClient {
  PreferencesClient(this._rootClient);

  final Client _rootClient;

  /// Update a preference value of an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configValue] New value.
  ///   * [appId] ID of the app.
  ///   * [configKey] Key of the preference.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setPreferenceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesSetPreferenceResponseApplicationJson, void>> setPreference({
    required final String configValue,
    required final String appId,
    required final String configKey,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setPreferenceRaw(
      configValue: configValue,
      appId: appId,
      configKey: configKey,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update a preference value of an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configValue] New value.
  ///   * [appId] ID of the app.
  ///   * [configKey] Key of the preference.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setPreference] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesSetPreferenceResponseApplicationJson, void> setPreferenceRaw({
    required final String configValue,
    required final String appId,
    required final String configKey,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['configValue'] = configValue;
    pathParameters['appId'] = appId;
    pathParameters['configKey'] = configKey;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}/{configKey}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<PreferencesSetPreferenceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesSetPreferenceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete a preference for an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [appId] ID of the app.
  ///   * [configKey] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deletePreferenceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesDeletePreferenceResponseApplicationJson, void>> deletePreference({
    required final String appId,
    required final String configKey,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deletePreferenceRaw(
      appId: appId,
      configKey: configKey,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a preference for an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [appId] ID of the app.
  ///   * [configKey] Key to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preference deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deletePreference] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesDeletePreferenceResponseApplicationJson, void> deletePreferenceRaw({
    required final String appId,
    required final String configKey,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['appId'] = appId;
    pathParameters['configKey'] = configKey;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}/{configKey}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<PreferencesDeletePreferenceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesDeletePreferenceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update multiple preference values of an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configs] Key-value pairs of the preferences.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setMultiplePreferencesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesSetMultiplePreferencesResponseApplicationJson, void>> setMultiplePreferences({
    required final ContentString<BuiltMap<String, String>> configs,
    required final String appId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setMultiplePreferencesRaw(
      configs: configs,
      appId: appId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update multiple preference values of an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configs] Key-value pairs of the preferences.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences updated successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [setMultiplePreferences] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesSetMultiplePreferencesResponseApplicationJson, void> setMultiplePreferencesRaw({
    required final ContentString<BuiltMap<String, String>> configs,
    required final String appId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['configs'] = _jsonSerializers.serialize(
      configs,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [FullType(String), FullType(String)]),
      ]),
    );
    pathParameters['appId'] = appId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<PreferencesSetMultiplePreferencesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete multiple preferences for an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configKeys] Keys to delete.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deleteMultiplePreferenceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PreferencesDeleteMultiplePreferenceResponseApplicationJson, void>> deleteMultiplePreference({
    required final List<String> configKeys,
    required final String appId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteMultiplePreferenceRaw(
      configKeys: configKeys,
      appId: appId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete multiple preferences for an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [configKeys] Keys to delete.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preferences deleted successfully
  ///   * 400: Preference invalid
  ///
  /// See:
  ///  * [deleteMultiplePreference] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PreferencesDeleteMultiplePreferenceResponseApplicationJson, void> deleteMultiplePreferenceRaw({
    required final List<String> configKeys,
    required final String appId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['configKeys[]'] = configKeys.map((final e) => e);
    pathParameters['appId'] = appId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<PreferencesDeleteMultiplePreferenceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class UsersClient {
  UsersClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of users.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///
  /// See:
  ///  * [getUsersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUsersResponseApplicationJson, void>> getUsers({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUsersRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///
  /// See:
  ///  * [getUsers] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUsersResponseApplicationJson, void> getUsersRaw({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetUsersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUsersResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a new user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userid] ID of the user.
  ///   * [password] Password of the user. Defaults to `''`.
  ///   * [displayName] Display name of the user. Defaults to `''`.
  ///   * [email] Email of the user. Defaults to `''`.
  ///   * [groups] Groups of the user. Defaults to `[]`.
  ///   * [subadmin] Groups where the user is subadmin. Defaults to `[]`.
  ///   * [quota] Quota of the user. Defaults to `''`.
  ///   * [language] Language of the user. Defaults to `''`.
  ///   * [manager] Manager of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added successfully
  ///   * 403: Missing permissions to make user subadmin
  ///
  /// See:
  ///  * [addUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersAddUserResponseApplicationJson, void>> addUser({
    required final String userid,
    final String password = '',
    final String displayName = '',
    final String email = '',
    final List<String> groups = const <String>[],
    final List<String> subadmin = const <String>[],
    final String quota = '',
    final String language = '',
    final String? manager,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = addUserRaw(
      userid: userid,
      password: password,
      displayName: displayName,
      email: email,
      groups: groups,
      subadmin: subadmin,
      quota: quota,
      language: language,
      manager: manager,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a new user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userid] ID of the user.
  ///   * [password] Password of the user. Defaults to `''`.
  ///   * [displayName] Display name of the user. Defaults to `''`.
  ///   * [email] Email of the user. Defaults to `''`.
  ///   * [groups] Groups of the user. Defaults to `[]`.
  ///   * [subadmin] Groups where the user is subadmin. Defaults to `[]`.
  ///   * [quota] Quota of the user. Defaults to `''`.
  ///   * [language] Language of the user. Defaults to `''`.
  ///   * [manager] Manager of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added successfully
  ///   * 403: Missing permissions to make user subadmin
  ///
  /// See:
  ///  * [addUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersAddUserResponseApplicationJson, void> addUserRaw({
    required final String userid,
    final String password = '',
    final String displayName = '',
    final String email = '',
    final List<String> groups = const <String>[],
    final List<String> subadmin = const <String>[],
    final String quota = '',
    final String language = '',
    final String? manager,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['userid'] = userid;
    if (password != '') {
      queryParameters['password'] = password;
    }
    if (displayName != '') {
      queryParameters['displayName'] = displayName;
    }
    if (email != '') {
      queryParameters['email'] = email;
    }
    if (groups != const <String>[]) {
      queryParameters['groups[]'] = groups.map((final e) => e);
    }
    if (subadmin != const <String>[]) {
      queryParameters['subadmin[]'] = subadmin.map((final e) => e);
    }
    if (quota != '') {
      queryParameters['quota'] = quota;
    }
    if (language != '') {
      queryParameters['language'] = language;
    }
    if (manager != null) {
      queryParameters['manager'] = manager;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersAddUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersAddUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of users and their details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users details returned
  ///
  /// See:
  ///  * [getUsersDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUsersDetailsResponseApplicationJson, void>> getUsersDetails({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUsersDetailsRaw(
      search: search,
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of users and their details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [limit] Limit the amount of groups returned.
  ///   * [offset] Offset for searching for groups. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users details returned
  ///
  /// See:
  ///  * [getUsersDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUsersDetailsResponseApplicationJson, void> getUsersDetailsRaw({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/details').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetUsersDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUsersDetailsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the list of disabled users and their details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Limit the amount of users returned.
  ///   * [offset] Offset. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Disabled users details returned
  ///
  /// See:
  ///  * [getDisabledUsersDetailsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetDisabledUsersDetailsResponseApplicationJson, void>> getDisabledUsersDetails({
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getDisabledUsersDetailsRaw(
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the list of disabled users and their details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Limit the amount of users returned.
  ///   * [offset] Offset. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Disabled users details returned
  ///
  /// See:
  ///  * [getDisabledUsersDetails] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetDisabledUsersDetailsResponseApplicationJson, void> getDisabledUsersDetailsRaw({
    final int? limit,
    final int offset = 0,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/disabled').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetDisabledUsersDetailsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Search users by their phone numbers.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [location] Location of the phone number (for country code).
  ///   * [search] Phone numbers to search for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///   * 400: Invalid location
  ///
  /// See:
  ///  * [searchByPhoneNumbersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersSearchByPhoneNumbersResponseApplicationJson, void>> searchByPhoneNumbers({
    required final String location,
    required final ContentString<BuiltMap<String, BuiltList<String>>> search,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = searchByPhoneNumbersRaw(
      location: location,
      search: search,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Search users by their phone numbers.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [location] Location of the phone number (for country code).
  ///   * [search] Phone numbers to search for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users returned
  ///   * 400: Invalid location
  ///
  /// See:
  ///  * [searchByPhoneNumbers] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersSearchByPhoneNumbersResponseApplicationJson, void> searchByPhoneNumbersRaw({
    required final String location,
    required final ContentString<BuiltMap<String, BuiltList<String>>> search,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['location'] = location;
    queryParameters['search'] = _jsonSerializers.serialize(
      search,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
      ]),
    );
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/search/by-phone').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersSearchByPhoneNumbersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersSearchByPhoneNumbersResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the details of a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User returned
  ///
  /// See:
  ///  * [getUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUserResponseApplicationJson, void>> getUser({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the details of a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User returned
  ///
  /// See:
  ///  * [getUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUserResponseApplicationJson, void> getUserRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update a value of the user's details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User value edited successfully
  ///
  /// See:
  ///  * [editUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersEditUserResponseApplicationJson, void>> editUser({
    required final String key,
    required final String value,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = editUserRaw(
      key: key,
      value: value,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update a value of the user's details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User value edited successfully
  ///
  /// See:
  ///  * [editUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersEditUserResponseApplicationJson, void> editUserRaw({
    required final String key,
    required final String value,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['key'] = key;
    queryParameters['value'] = value;
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersEditUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersEditUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User deleted successfully
  ///
  /// See:
  ///  * [deleteUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersDeleteUserResponseApplicationJson, void>> deleteUser({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User deleted successfully
  ///
  /// See:
  ///  * [deleteUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersDeleteUserResponseApplicationJson, void> deleteUserRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersDeleteUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersDeleteUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the details of the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Current user returned
  ///
  /// See:
  ///  * [getCurrentUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetCurrentUserResponseApplicationJson, void>> getCurrentUser({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getCurrentUserRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the details of the current user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Current user returned
  ///
  /// See:
  ///  * [getCurrentUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetCurrentUserResponseApplicationJson, void> getCurrentUserRaw({
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/user').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetCurrentUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetCurrentUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of fields that are editable for the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Editable fields returned
  ///
  /// See:
  ///  * [getEditableFieldsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetEditableFieldsResponseApplicationJson, void>> getEditableFields({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getEditableFieldsRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of fields that are editable for the current user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Editable fields returned
  ///
  /// See:
  ///  * [getEditableFields] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetEditableFieldsResponseApplicationJson, void> getEditableFieldsRaw({
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/user/fields').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetEditableFieldsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetEditableFieldsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of fields that are editable for a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Editable fields for user returned
  ///
  /// See:
  ///  * [getEditableFieldsForUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetEditableFieldsForUserResponseApplicationJson, void>> getEditableFieldsForUser({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getEditableFieldsForUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of fields that are editable for a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Editable fields for user returned
  ///
  /// See:
  ///  * [getEditableFieldsForUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetEditableFieldsForUserResponseApplicationJson, void> getEditableFieldsForUserRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/user/fields/{userId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetEditableFieldsForUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetEditableFieldsForUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update multiple values of the user's details.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [collectionName] Collection to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User values edited successfully
  ///
  /// See:
  ///  * [editUserMultiValueRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersEditUserMultiValueResponseApplicationJson, void>> editUserMultiValue({
    required final String key,
    required final String value,
    required final String userId,
    required final String collectionName,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = editUserMultiValueRaw(
      key: key,
      value: value,
      userId: userId,
      collectionName: collectionName,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update multiple values of the user's details.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [key] Key that will be updated.
  ///   * [value] New value for the key.
  ///   * [userId] ID of the user.
  ///   * [collectionName] Collection to update.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User values edited successfully
  ///
  /// See:
  ///  * [editUserMultiValue] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersEditUserMultiValueResponseApplicationJson, void> editUserMultiValueRaw({
    required final String key,
    required final String value,
    required final String userId,
    required final String collectionName,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['key'] = key;
    queryParameters['value'] = value;
    pathParameters['userId'] = userId;
    checkPattern(
      collectionName,
      RegExp(r'^(?!enable$|disable$)[a-zA-Z0-9_]*$'),
      'collectionName',
    ); // coverage:ignore-line
    pathParameters['collectionName'] = collectionName;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/{collectionName}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersEditUserMultiValueResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersEditUserMultiValueResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Wipe all devices of a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Wiped all user devices successfully
  ///
  /// See:
  ///  * [wipeUserDevicesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersWipeUserDevicesResponseApplicationJson, void>> wipeUserDevices({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = wipeUserDevicesRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Wipe all devices of a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Wiped all user devices successfully
  ///
  /// See:
  ///  * [wipeUserDevices] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersWipeUserDevicesResponseApplicationJson, void> wipeUserDevicesRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/wipe').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersWipeUserDevicesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersWipeUserDevicesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Enable a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User enabled successfully
  ///
  /// See:
  ///  * [enableUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersEnableUserResponseApplicationJson, void>> enableUser({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = enableUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Enable a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User enabled successfully
  ///
  /// See:
  ///  * [enableUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersEnableUserResponseApplicationJson, void> enableUserRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/enable').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersEnableUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersEnableUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Disable a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User disabled successfully
  ///
  /// See:
  ///  * [disableUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersDisableUserResponseApplicationJson, void>> disableUser({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = disableUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Disable a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User disabled successfully
  ///
  /// See:
  ///  * [disableUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersDisableUserResponseApplicationJson, void> disableUserRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/disable').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersDisableUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersDisableUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a list of groups the user belongs to.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users groups returned
  ///
  /// See:
  ///  * [getUsersGroupsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUsersGroupsResponseApplicationJson, void>> getUsersGroups({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUsersGroupsRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of groups the user belongs to.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Users groups returned
  ///
  /// See:
  ///  * [getUsersGroups] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUsersGroupsResponseApplicationJson, void> getUsersGroupsRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/groups').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetUsersGroupsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUsersGroupsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Add a user to a group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group. Defaults to `''`.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added to group successfully
  ///
  /// See:
  ///  * [addToGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersAddToGroupResponseApplicationJson, void>> addToGroup({
    required final String userId,
    final String groupid = '',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = addToGroupRaw(
      userId: userId,
      groupid: groupid,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Add a user to a group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group. Defaults to `''`.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added to group successfully
  ///
  /// See:
  ///  * [addToGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersAddToGroupResponseApplicationJson, void> addToGroupRaw({
    required final String userId,
    final String groupid = '',
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    if (groupid != '') {
      queryParameters['groupid'] = groupid;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/groups').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersAddToGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersAddToGroupResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Remove a user from a group.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed from group successfully
  ///
  /// See:
  ///  * [removeFromGroupRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersRemoveFromGroupResponseApplicationJson, void>> removeFromGroup({
    required final String groupid,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = removeFromGroupRaw(
      groupid: groupid,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a user from a group.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed from group successfully
  ///
  /// See:
  ///  * [removeFromGroup] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersRemoveFromGroupResponseApplicationJson, void> removeFromGroupRaw({
    required final String groupid,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['groupid'] = groupid;
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/groups').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersRemoveFromGroupResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersRemoveFromGroupResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the groups a user is a subadmin of.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User subadmin groups returned
  ///
  /// See:
  ///  * [getUserSubAdminGroupsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersGetUserSubAdminGroupsResponseApplicationJson, void>> getUserSubAdminGroups({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUserSubAdminGroupsRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the groups a user is a subadmin of.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User subadmin groups returned
  ///
  /// See:
  ///  * [getUserSubAdminGroups] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersGetUserSubAdminGroupsResponseApplicationJson, void> getUserSubAdminGroupsRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/subadmins').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersGetUserSubAdminGroupsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Make a user a subadmin of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added as group subadmin successfully
  ///
  /// See:
  ///  * [addSubAdminRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersAddSubAdminResponseApplicationJson, void>> addSubAdmin({
    required final String groupid,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = addSubAdminRaw(
      groupid: groupid,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Make a user a subadmin of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User added as group subadmin successfully
  ///
  /// See:
  ///  * [addSubAdmin] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersAddSubAdminResponseApplicationJson, void> addSubAdminRaw({
    required final String groupid,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['groupid'] = groupid;
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/subadmins').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersAddSubAdminResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersAddSubAdminResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Remove a user from the subadmins of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed as group subadmin successfully
  ///
  /// See:
  ///  * [removeSubAdminRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersRemoveSubAdminResponseApplicationJson, void>> removeSubAdmin({
    required final String groupid,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = removeSubAdminRaw(
      groupid: groupid,
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a user from the subadmins of a group.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [groupid] ID of the group.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User removed as group subadmin successfully
  ///
  /// See:
  ///  * [removeSubAdmin] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersRemoveSubAdminResponseApplicationJson, void> removeSubAdminRaw({
    required final String groupid,
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    queryParameters['groupid'] = groupid;
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/subadmins').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersRemoveSubAdminResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersRemoveSubAdminResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Resend the welcome message.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Resent welcome message successfully
  ///
  /// See:
  ///  * [resendWelcomeMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UsersResendWelcomeMessageResponseApplicationJson, void>> resendWelcomeMessage({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = resendWelcomeMessageRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Resend the welcome message.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID if the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Resent welcome message successfully
  ///
  /// See:
  ///  * [resendWelcomeMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UsersResendWelcomeMessageResponseApplicationJson, void> resendWelcomeMessageRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/users/{userId}/welcome').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UsersResendWelcomeMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UsersResendWelcomeMessageResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([final void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OCSMeta> get serializer => const _$OCSMetaSerializer();
}

class _$OCSMetaSerializer implements StructuredSerializer<OCSMeta> {
  const _$OCSMetaSerializer();

  @override
  Iterable<Type> get types => const [OCSMeta, _$OCSMeta];

  @override
  String get wireName => 'OCSMeta';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OCSMeta object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  OCSMeta deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetAppsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
}

abstract class AppConfigGetAppsResponseApplicationJson_Ocs_Data
    implements
        AppConfigGetAppsResponseApplicationJson_Ocs_DataInterface,
        Built<AppConfigGetAppsResponseApplicationJson_Ocs_Data,
            AppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder> {
  factory AppConfigGetAppsResponseApplicationJson_Ocs_Data([
    final void Function(AppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppConfigGetAppsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppConfigGetAppsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetAppsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetAppsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$AppConfigGetAppsResponseApplicationJson_Ocs_DataSerializer();
}

class _$AppConfigGetAppsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<AppConfigGetAppsResponseApplicationJson_Ocs_Data> {
  const _$AppConfigGetAppsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetAppsResponseApplicationJson_Ocs_Data, _$AppConfigGetAppsResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'AppConfigGetAppsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetAppsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  AppConfigGetAppsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetAppsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppConfigGetAppsResponseApplicationJson_Ocs_Data get data;
}

abstract class AppConfigGetAppsResponseApplicationJson_Ocs
    implements
        AppConfigGetAppsResponseApplicationJson_OcsInterface,
        Built<AppConfigGetAppsResponseApplicationJson_Ocs, AppConfigGetAppsResponseApplicationJson_OcsBuilder> {
  factory AppConfigGetAppsResponseApplicationJson_Ocs([
    final void Function(AppConfigGetAppsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigGetAppsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigGetAppsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetAppsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetAppsResponseApplicationJson_Ocs> get serializer =>
      const _$AppConfigGetAppsResponseApplicationJson_OcsSerializer();
}

class _$AppConfigGetAppsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppConfigGetAppsResponseApplicationJson_Ocs> {
  const _$AppConfigGetAppsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetAppsResponseApplicationJson_Ocs, _$AppConfigGetAppsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppConfigGetAppsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetAppsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(AppConfigGetAppsResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  AppConfigGetAppsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetAppsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(AppConfigGetAppsResponseApplicationJson_Ocs_Data),
            )! as AppConfigGetAppsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetAppsResponseApplicationJsonInterface {
  AppConfigGetAppsResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigGetAppsResponseApplicationJson
    implements
        AppConfigGetAppsResponseApplicationJsonInterface,
        Built<AppConfigGetAppsResponseApplicationJson, AppConfigGetAppsResponseApplicationJsonBuilder> {
  factory AppConfigGetAppsResponseApplicationJson([
    final void Function(AppConfigGetAppsResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigGetAppsResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigGetAppsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetAppsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetAppsResponseApplicationJson> get serializer =>
      const _$AppConfigGetAppsResponseApplicationJsonSerializer();
}

class _$AppConfigGetAppsResponseApplicationJsonSerializer
    implements StructuredSerializer<AppConfigGetAppsResponseApplicationJson> {
  const _$AppConfigGetAppsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetAppsResponseApplicationJson, _$AppConfigGetAppsResponseApplicationJson];

  @override
  String get wireName => 'AppConfigGetAppsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetAppsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppConfigGetAppsResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppConfigGetAppsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetAppsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppConfigGetAppsResponseApplicationJson_Ocs))!
                as AppConfigGetAppsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetKeysResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
}

abstract class AppConfigGetKeysResponseApplicationJson_Ocs_Data
    implements
        AppConfigGetKeysResponseApplicationJson_Ocs_DataInterface,
        Built<AppConfigGetKeysResponseApplicationJson_Ocs_Data,
            AppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder> {
  factory AppConfigGetKeysResponseApplicationJson_Ocs_Data([
    final void Function(AppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppConfigGetKeysResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppConfigGetKeysResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetKeysResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetKeysResponseApplicationJson_Ocs_Data> get serializer =>
      const _$AppConfigGetKeysResponseApplicationJson_Ocs_DataSerializer();
}

class _$AppConfigGetKeysResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<AppConfigGetKeysResponseApplicationJson_Ocs_Data> {
  const _$AppConfigGetKeysResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetKeysResponseApplicationJson_Ocs_Data, _$AppConfigGetKeysResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'AppConfigGetKeysResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetKeysResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  AppConfigGetKeysResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetKeysResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppConfigGetKeysResponseApplicationJson_Ocs_Data get data;
}

abstract class AppConfigGetKeysResponseApplicationJson_Ocs
    implements
        AppConfigGetKeysResponseApplicationJson_OcsInterface,
        Built<AppConfigGetKeysResponseApplicationJson_Ocs, AppConfigGetKeysResponseApplicationJson_OcsBuilder> {
  factory AppConfigGetKeysResponseApplicationJson_Ocs([
    final void Function(AppConfigGetKeysResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigGetKeysResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigGetKeysResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetKeysResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetKeysResponseApplicationJson_Ocs> get serializer =>
      const _$AppConfigGetKeysResponseApplicationJson_OcsSerializer();
}

class _$AppConfigGetKeysResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppConfigGetKeysResponseApplicationJson_Ocs> {
  const _$AppConfigGetKeysResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetKeysResponseApplicationJson_Ocs, _$AppConfigGetKeysResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppConfigGetKeysResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetKeysResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(AppConfigGetKeysResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  AppConfigGetKeysResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetKeysResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(AppConfigGetKeysResponseApplicationJson_Ocs_Data),
            )! as AppConfigGetKeysResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetKeysResponseApplicationJsonInterface {
  AppConfigGetKeysResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigGetKeysResponseApplicationJson
    implements
        AppConfigGetKeysResponseApplicationJsonInterface,
        Built<AppConfigGetKeysResponseApplicationJson, AppConfigGetKeysResponseApplicationJsonBuilder> {
  factory AppConfigGetKeysResponseApplicationJson([
    final void Function(AppConfigGetKeysResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigGetKeysResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigGetKeysResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetKeysResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetKeysResponseApplicationJson> get serializer =>
      const _$AppConfigGetKeysResponseApplicationJsonSerializer();
}

class _$AppConfigGetKeysResponseApplicationJsonSerializer
    implements StructuredSerializer<AppConfigGetKeysResponseApplicationJson> {
  const _$AppConfigGetKeysResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetKeysResponseApplicationJson, _$AppConfigGetKeysResponseApplicationJson];

  @override
  String get wireName => 'AppConfigGetKeysResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetKeysResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppConfigGetKeysResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppConfigGetKeysResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetKeysResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppConfigGetKeysResponseApplicationJson_Ocs))!
                as AppConfigGetKeysResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetValueResponseApplicationJson_Ocs_DataInterface {
  String get data;
}

abstract class AppConfigGetValueResponseApplicationJson_Ocs_Data
    implements
        AppConfigGetValueResponseApplicationJson_Ocs_DataInterface,
        Built<AppConfigGetValueResponseApplicationJson_Ocs_Data,
            AppConfigGetValueResponseApplicationJson_Ocs_DataBuilder> {
  factory AppConfigGetValueResponseApplicationJson_Ocs_Data([
    final void Function(AppConfigGetValueResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppConfigGetValueResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppConfigGetValueResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetValueResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetValueResponseApplicationJson_Ocs_Data> get serializer =>
      const _$AppConfigGetValueResponseApplicationJson_Ocs_DataSerializer();
}

class _$AppConfigGetValueResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<AppConfigGetValueResponseApplicationJson_Ocs_Data> {
  const _$AppConfigGetValueResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetValueResponseApplicationJson_Ocs_Data, _$AppConfigGetValueResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'AppConfigGetValueResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetValueResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  AppConfigGetValueResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetValueResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetValueResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppConfigGetValueResponseApplicationJson_Ocs_Data get data;
}

abstract class AppConfigGetValueResponseApplicationJson_Ocs
    implements
        AppConfigGetValueResponseApplicationJson_OcsInterface,
        Built<AppConfigGetValueResponseApplicationJson_Ocs, AppConfigGetValueResponseApplicationJson_OcsBuilder> {
  factory AppConfigGetValueResponseApplicationJson_Ocs([
    final void Function(AppConfigGetValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigGetValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigGetValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetValueResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetValueResponseApplicationJson_Ocs> get serializer =>
      const _$AppConfigGetValueResponseApplicationJson_OcsSerializer();
}

class _$AppConfigGetValueResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppConfigGetValueResponseApplicationJson_Ocs> {
  const _$AppConfigGetValueResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetValueResponseApplicationJson_Ocs, _$AppConfigGetValueResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppConfigGetValueResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetValueResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(AppConfigGetValueResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  AppConfigGetValueResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetValueResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(AppConfigGetValueResponseApplicationJson_Ocs_Data),
            )! as AppConfigGetValueResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigGetValueResponseApplicationJsonInterface {
  AppConfigGetValueResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigGetValueResponseApplicationJson
    implements
        AppConfigGetValueResponseApplicationJsonInterface,
        Built<AppConfigGetValueResponseApplicationJson, AppConfigGetValueResponseApplicationJsonBuilder> {
  factory AppConfigGetValueResponseApplicationJson([
    final void Function(AppConfigGetValueResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigGetValueResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigGetValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigGetValueResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigGetValueResponseApplicationJson> get serializer =>
      const _$AppConfigGetValueResponseApplicationJsonSerializer();
}

class _$AppConfigGetValueResponseApplicationJsonSerializer
    implements StructuredSerializer<AppConfigGetValueResponseApplicationJson> {
  const _$AppConfigGetValueResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigGetValueResponseApplicationJson, _$AppConfigGetValueResponseApplicationJson];

  @override
  String get wireName => 'AppConfigGetValueResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigGetValueResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppConfigGetValueResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppConfigGetValueResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigGetValueResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(AppConfigGetValueResponseApplicationJson_Ocs),
            )! as AppConfigGetValueResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigSetValueResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppConfigSetValueResponseApplicationJson_Ocs
    implements
        AppConfigSetValueResponseApplicationJson_OcsInterface,
        Built<AppConfigSetValueResponseApplicationJson_Ocs, AppConfigSetValueResponseApplicationJson_OcsBuilder> {
  factory AppConfigSetValueResponseApplicationJson_Ocs([
    final void Function(AppConfigSetValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigSetValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigSetValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigSetValueResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigSetValueResponseApplicationJson_Ocs> get serializer =>
      const _$AppConfigSetValueResponseApplicationJson_OcsSerializer();
}

class _$AppConfigSetValueResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppConfigSetValueResponseApplicationJson_Ocs> {
  const _$AppConfigSetValueResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigSetValueResponseApplicationJson_Ocs, _$AppConfigSetValueResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppConfigSetValueResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigSetValueResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  AppConfigSetValueResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigSetValueResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigSetValueResponseApplicationJsonInterface {
  AppConfigSetValueResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigSetValueResponseApplicationJson
    implements
        AppConfigSetValueResponseApplicationJsonInterface,
        Built<AppConfigSetValueResponseApplicationJson, AppConfigSetValueResponseApplicationJsonBuilder> {
  factory AppConfigSetValueResponseApplicationJson([
    final void Function(AppConfigSetValueResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigSetValueResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigSetValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigSetValueResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigSetValueResponseApplicationJson> get serializer =>
      const _$AppConfigSetValueResponseApplicationJsonSerializer();
}

class _$AppConfigSetValueResponseApplicationJsonSerializer
    implements StructuredSerializer<AppConfigSetValueResponseApplicationJson> {
  const _$AppConfigSetValueResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigSetValueResponseApplicationJson, _$AppConfigSetValueResponseApplicationJson];

  @override
  String get wireName => 'AppConfigSetValueResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigSetValueResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppConfigSetValueResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppConfigSetValueResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigSetValueResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(AppConfigSetValueResponseApplicationJson_Ocs),
            )! as AppConfigSetValueResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigDeleteKeyResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppConfigDeleteKeyResponseApplicationJson_Ocs
    implements
        AppConfigDeleteKeyResponseApplicationJson_OcsInterface,
        Built<AppConfigDeleteKeyResponseApplicationJson_Ocs, AppConfigDeleteKeyResponseApplicationJson_OcsBuilder> {
  factory AppConfigDeleteKeyResponseApplicationJson_Ocs([
    final void Function(AppConfigDeleteKeyResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppConfigDeleteKeyResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppConfigDeleteKeyResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigDeleteKeyResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigDeleteKeyResponseApplicationJson_Ocs> get serializer =>
      const _$AppConfigDeleteKeyResponseApplicationJson_OcsSerializer();
}

class _$AppConfigDeleteKeyResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppConfigDeleteKeyResponseApplicationJson_Ocs> {
  const _$AppConfigDeleteKeyResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigDeleteKeyResponseApplicationJson_Ocs, _$AppConfigDeleteKeyResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppConfigDeleteKeyResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigDeleteKeyResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  AppConfigDeleteKeyResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigDeleteKeyResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppConfigDeleteKeyResponseApplicationJsonInterface {
  AppConfigDeleteKeyResponseApplicationJson_Ocs get ocs;
}

abstract class AppConfigDeleteKeyResponseApplicationJson
    implements
        AppConfigDeleteKeyResponseApplicationJsonInterface,
        Built<AppConfigDeleteKeyResponseApplicationJson, AppConfigDeleteKeyResponseApplicationJsonBuilder> {
  factory AppConfigDeleteKeyResponseApplicationJson([
    final void Function(AppConfigDeleteKeyResponseApplicationJsonBuilder)? b,
  ]) = _$AppConfigDeleteKeyResponseApplicationJson;

  // coverage:ignore-start
  const AppConfigDeleteKeyResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppConfigDeleteKeyResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppConfigDeleteKeyResponseApplicationJson> get serializer =>
      const _$AppConfigDeleteKeyResponseApplicationJsonSerializer();
}

class _$AppConfigDeleteKeyResponseApplicationJsonSerializer
    implements StructuredSerializer<AppConfigDeleteKeyResponseApplicationJson> {
  const _$AppConfigDeleteKeyResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [AppConfigDeleteKeyResponseApplicationJson, _$AppConfigDeleteKeyResponseApplicationJson];

  @override
  String get wireName => 'AppConfigDeleteKeyResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppConfigDeleteKeyResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppConfigDeleteKeyResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppConfigDeleteKeyResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppConfigDeleteKeyResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(AppConfigDeleteKeyResponseApplicationJson_Ocs),
            )! as AppConfigDeleteKeyResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsGetAppsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get apps;
}

abstract class AppsGetAppsResponseApplicationJson_Ocs_Data
    implements
        AppsGetAppsResponseApplicationJson_Ocs_DataInterface,
        Built<AppsGetAppsResponseApplicationJson_Ocs_Data, AppsGetAppsResponseApplicationJson_Ocs_DataBuilder> {
  factory AppsGetAppsResponseApplicationJson_Ocs_Data([
    final void Function(AppsGetAppsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppsGetAppsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppsGetAppsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsGetAppsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$AppsGetAppsResponseApplicationJson_Ocs_DataSerializer();
}

class _$AppsGetAppsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<AppsGetAppsResponseApplicationJson_Ocs_Data> {
  const _$AppsGetAppsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [AppsGetAppsResponseApplicationJson_Ocs_Data, _$AppsGetAppsResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'AppsGetAppsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsGetAppsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'apps',
      serializers.serialize(object.apps, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  AppsGetAppsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsGetAppsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'apps':
          result.apps.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsGetAppsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppsGetAppsResponseApplicationJson_Ocs_Data get data;
}

abstract class AppsGetAppsResponseApplicationJson_Ocs
    implements
        AppsGetAppsResponseApplicationJson_OcsInterface,
        Built<AppsGetAppsResponseApplicationJson_Ocs, AppsGetAppsResponseApplicationJson_OcsBuilder> {
  factory AppsGetAppsResponseApplicationJson_Ocs([
    final void Function(AppsGetAppsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppsGetAppsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsGetAppsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsGetAppsResponseApplicationJson_Ocs> get serializer =>
      const _$AppsGetAppsResponseApplicationJson_OcsSerializer();
}

class _$AppsGetAppsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppsGetAppsResponseApplicationJson_Ocs> {
  const _$AppsGetAppsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [AppsGetAppsResponseApplicationJson_Ocs, _$AppsGetAppsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppsGetAppsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsGetAppsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(AppsGetAppsResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  AppsGetAppsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsGetAppsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppsGetAppsResponseApplicationJson_Ocs_Data))!
                as AppsGetAppsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsGetAppsResponseApplicationJsonInterface {
  AppsGetAppsResponseApplicationJson_Ocs get ocs;
}

abstract class AppsGetAppsResponseApplicationJson
    implements
        AppsGetAppsResponseApplicationJsonInterface,
        Built<AppsGetAppsResponseApplicationJson, AppsGetAppsResponseApplicationJsonBuilder> {
  factory AppsGetAppsResponseApplicationJson([final void Function(AppsGetAppsResponseApplicationJsonBuilder)? b]) =
      _$AppsGetAppsResponseApplicationJson;

  // coverage:ignore-start
  const AppsGetAppsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsGetAppsResponseApplicationJson> get serializer =>
      const _$AppsGetAppsResponseApplicationJsonSerializer();
}

class _$AppsGetAppsResponseApplicationJsonSerializer
    implements StructuredSerializer<AppsGetAppsResponseApplicationJson> {
  const _$AppsGetAppsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [AppsGetAppsResponseApplicationJson, _$AppsGetAppsResponseApplicationJson];

  @override
  String get wireName => 'AppsGetAppsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsGetAppsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppsGetAppsResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppsGetAppsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsGetAppsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppsGetAppsResponseApplicationJson_Ocs))!
                as AppsGetAppsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppInfoInterface {
  bool? get active;
  JsonObject? get activity;
  JsonObject? get author;
  @BuiltValueField(wireName: 'background-jobs')
  JsonObject? get backgroundJobs;
  JsonObject? get bugs;
  JsonObject? get category;
  JsonObject? get collaboration;
  JsonObject? get commands;
  @BuiltValueField(wireName: 'default_enable')
  JsonObject? get defaultEnable;
  JsonObject? get dependencies;
  String get description;
  JsonObject? get discussion;
  JsonObject? get documentation;
  JsonObject? get groups;
  String get id;
  JsonObject? get info;
  bool? get internal;
  int? get level;
  JsonObject? get licence;
  String get name;
  JsonObject? get namespace;
  JsonObject? get navigations;
  JsonObject? get preview;
  bool? get previewAsIcon;
  JsonObject? get public;
  JsonObject? get remote;
  bool? get removable;
  @BuiltValueField(wireName: 'repair-steps')
  JsonObject? get repairSteps;
  JsonObject? get repository;
  JsonObject? get sabre;
  JsonObject? get screenshot;
  JsonObject? get settings;
  String get summary;
  JsonObject? get trash;
  @BuiltValueField(wireName: 'two-factor-providers')
  JsonObject? get twoFactorProviders;
  JsonObject? get types;
  String get version;
  JsonObject? get versions;
  JsonObject? get website;
}

abstract class AppInfo implements AppInfoInterface, Built<AppInfo, AppInfoBuilder> {
  factory AppInfo([final void Function(AppInfoBuilder)? b]) = _$AppInfo;

  // coverage:ignore-start
  const AppInfo._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppInfo.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppInfo> get serializer => const _$AppInfoSerializer();
}

class _$AppInfoSerializer implements StructuredSerializer<AppInfo> {
  const _$AppInfoSerializer();

  @override
  Iterable<Type> get types => const [AppInfo, _$AppInfo];

  @override
  String get wireName => 'AppInfo';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppInfo object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'description',
      serializers.serialize(object.description, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.activity;
    if (value != null) {
      result
        ..add('activity')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.backgroundJobs;
    if (value != null) {
      result
        ..add('background-jobs')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.bugs;
    if (value != null) {
      result
        ..add('bugs')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.collaboration;
    if (value != null) {
      result
        ..add('collaboration')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.commands;
    if (value != null) {
      result
        ..add('commands')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.defaultEnable;
    if (value != null) {
      result
        ..add('default_enable')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.dependencies;
    if (value != null) {
      result
        ..add('dependencies')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.discussion;
    if (value != null) {
      result
        ..add('discussion')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.documentation;
    if (value != null) {
      result
        ..add('documentation')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.groups;
    if (value != null) {
      result
        ..add('groups')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.internal;
    if (value != null) {
      result
        ..add('internal')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.licence;
    if (value != null) {
      result
        ..add('licence')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.namespace;
    if (value != null) {
      result
        ..add('namespace')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.navigations;
    if (value != null) {
      result
        ..add('navigations')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.preview;
    if (value != null) {
      result
        ..add('preview')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.previewAsIcon;
    if (value != null) {
      result
        ..add('previewAsIcon')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.public;
    if (value != null) {
      result
        ..add('public')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.remote;
    if (value != null) {
      result
        ..add('remote')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.removable;
    if (value != null) {
      result
        ..add('removable')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.repairSteps;
    if (value != null) {
      result
        ..add('repair-steps')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.repository;
    if (value != null) {
      result
        ..add('repository')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.sabre;
    if (value != null) {
      result
        ..add('sabre')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.screenshot;
    if (value != null) {
      result
        ..add('screenshot')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.settings;
    if (value != null) {
      result
        ..add('settings')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.trash;
    if (value != null) {
      result
        ..add('trash')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.twoFactorProviders;
    if (value != null) {
      result
        ..add('two-factor-providers')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.types;
    if (value != null) {
      result
        ..add('types')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.versions;
    if (value != null) {
      result
        ..add('versions')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    return result;
  }

  @override
  AppInfo deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'active':
          result.active = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'activity':
          result.activity = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'author':
          result.author = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'background-jobs':
          result.backgroundJobs =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'bugs':
          result.bugs = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'category':
          result.category = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'collaboration':
          result.collaboration =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'commands':
          result.commands = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'default_enable':
          result.defaultEnable =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'dependencies':
          result.dependencies =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'discussion':
          result.discussion = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'documentation':
          result.documentation =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'groups':
          result.groups = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'info':
          result.info = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'internal':
          result.internal = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'level':
          result.level = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'licence':
          result.licence = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'namespace':
          result.namespace = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'navigations':
          result.navigations = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'preview':
          result.preview = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'previewAsIcon':
          result.previewAsIcon = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'public':
          result.public = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'remote':
          result.remote = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'removable':
          result.removable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'repair-steps':
          result.repairSteps = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'repository':
          result.repository = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'sabre':
          result.sabre = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'screenshot':
          result.screenshot = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'settings':
          result.settings = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'summary':
          result.summary = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'trash':
          result.trash = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'two-factor-providers':
          result.twoFactorProviders =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'types':
          result.types = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'versions':
          result.versions = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'website':
          result.website = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsGetAppInfoResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppInfo get data;
}

abstract class AppsGetAppInfoResponseApplicationJson_Ocs
    implements
        AppsGetAppInfoResponseApplicationJson_OcsInterface,
        Built<AppsGetAppInfoResponseApplicationJson_Ocs, AppsGetAppInfoResponseApplicationJson_OcsBuilder> {
  factory AppsGetAppInfoResponseApplicationJson_Ocs([
    final void Function(AppsGetAppInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppsGetAppInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsGetAppInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppInfoResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsGetAppInfoResponseApplicationJson_Ocs> get serializer =>
      const _$AppsGetAppInfoResponseApplicationJson_OcsSerializer();
}

class _$AppsGetAppInfoResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppsGetAppInfoResponseApplicationJson_Ocs> {
  const _$AppsGetAppInfoResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [AppsGetAppInfoResponseApplicationJson_Ocs, _$AppsGetAppInfoResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppsGetAppInfoResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsGetAppInfoResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(AppInfo)),
    ];
    return result;
  }

  @override
  AppsGetAppInfoResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsGetAppInfoResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppInfo))! as AppInfo,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsGetAppInfoResponseApplicationJsonInterface {
  AppsGetAppInfoResponseApplicationJson_Ocs get ocs;
}

abstract class AppsGetAppInfoResponseApplicationJson
    implements
        AppsGetAppInfoResponseApplicationJsonInterface,
        Built<AppsGetAppInfoResponseApplicationJson, AppsGetAppInfoResponseApplicationJsonBuilder> {
  factory AppsGetAppInfoResponseApplicationJson([
    final void Function(AppsGetAppInfoResponseApplicationJsonBuilder)? b,
  ]) = _$AppsGetAppInfoResponseApplicationJson;

  // coverage:ignore-start
  const AppsGetAppInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsGetAppInfoResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsGetAppInfoResponseApplicationJson> get serializer =>
      const _$AppsGetAppInfoResponseApplicationJsonSerializer();
}

class _$AppsGetAppInfoResponseApplicationJsonSerializer
    implements StructuredSerializer<AppsGetAppInfoResponseApplicationJson> {
  const _$AppsGetAppInfoResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [AppsGetAppInfoResponseApplicationJson, _$AppsGetAppInfoResponseApplicationJson];

  @override
  String get wireName => 'AppsGetAppInfoResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsGetAppInfoResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppsGetAppInfoResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppsGetAppInfoResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsGetAppInfoResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppsGetAppInfoResponseApplicationJson_Ocs))!
                as AppsGetAppInfoResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsEnableResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppsEnableResponseApplicationJson_Ocs
    implements
        AppsEnableResponseApplicationJson_OcsInterface,
        Built<AppsEnableResponseApplicationJson_Ocs, AppsEnableResponseApplicationJson_OcsBuilder> {
  factory AppsEnableResponseApplicationJson_Ocs([
    final void Function(AppsEnableResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppsEnableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsEnableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsEnableResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsEnableResponseApplicationJson_Ocs> get serializer =>
      const _$AppsEnableResponseApplicationJson_OcsSerializer();
}

class _$AppsEnableResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppsEnableResponseApplicationJson_Ocs> {
  const _$AppsEnableResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [AppsEnableResponseApplicationJson_Ocs, _$AppsEnableResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppsEnableResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsEnableResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  AppsEnableResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsEnableResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsEnableResponseApplicationJsonInterface {
  AppsEnableResponseApplicationJson_Ocs get ocs;
}

abstract class AppsEnableResponseApplicationJson
    implements
        AppsEnableResponseApplicationJsonInterface,
        Built<AppsEnableResponseApplicationJson, AppsEnableResponseApplicationJsonBuilder> {
  factory AppsEnableResponseApplicationJson([final void Function(AppsEnableResponseApplicationJsonBuilder)? b]) =
      _$AppsEnableResponseApplicationJson;

  // coverage:ignore-start
  const AppsEnableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsEnableResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsEnableResponseApplicationJson> get serializer =>
      const _$AppsEnableResponseApplicationJsonSerializer();
}

class _$AppsEnableResponseApplicationJsonSerializer implements StructuredSerializer<AppsEnableResponseApplicationJson> {
  const _$AppsEnableResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [AppsEnableResponseApplicationJson, _$AppsEnableResponseApplicationJson];

  @override
  String get wireName => 'AppsEnableResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsEnableResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppsEnableResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppsEnableResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsEnableResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppsEnableResponseApplicationJson_Ocs))!
                as AppsEnableResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsDisableResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppsDisableResponseApplicationJson_Ocs
    implements
        AppsDisableResponseApplicationJson_OcsInterface,
        Built<AppsDisableResponseApplicationJson_Ocs, AppsDisableResponseApplicationJson_OcsBuilder> {
  factory AppsDisableResponseApplicationJson_Ocs([
    final void Function(AppsDisableResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppsDisableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppsDisableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsDisableResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsDisableResponseApplicationJson_Ocs> get serializer =>
      const _$AppsDisableResponseApplicationJson_OcsSerializer();
}

class _$AppsDisableResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppsDisableResponseApplicationJson_Ocs> {
  const _$AppsDisableResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [AppsDisableResponseApplicationJson_Ocs, _$AppsDisableResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AppsDisableResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsDisableResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  AppsDisableResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsDisableResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AppsDisableResponseApplicationJsonInterface {
  AppsDisableResponseApplicationJson_Ocs get ocs;
}

abstract class AppsDisableResponseApplicationJson
    implements
        AppsDisableResponseApplicationJsonInterface,
        Built<AppsDisableResponseApplicationJson, AppsDisableResponseApplicationJsonBuilder> {
  factory AppsDisableResponseApplicationJson([final void Function(AppsDisableResponseApplicationJsonBuilder)? b]) =
      _$AppsDisableResponseApplicationJson;

  // coverage:ignore-start
  const AppsDisableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppsDisableResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AppsDisableResponseApplicationJson> get serializer =>
      const _$AppsDisableResponseApplicationJsonSerializer();
}

class _$AppsDisableResponseApplicationJsonSerializer
    implements StructuredSerializer<AppsDisableResponseApplicationJson> {
  const _$AppsDisableResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [AppsDisableResponseApplicationJson, _$AppsDisableResponseApplicationJson];

  @override
  String get wireName => 'AppsDisableResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppsDisableResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AppsDisableResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AppsDisableResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppsDisableResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(AppsDisableResponseApplicationJson_Ocs))!
                as AppsDisableResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
}

abstract class GroupsGetGroupsResponseApplicationJson_Ocs_Data
    implements
        GroupsGetGroupsResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupsResponseApplicationJson_Ocs_Data, GroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupsResponseApplicationJson_Ocs_Data([
    final void Function(GroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$GroupsGetGroupsResponseApplicationJson_Ocs_DataSerializer();
}

class _$GroupsGetGroupsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<GroupsGetGroupsResponseApplicationJson_Ocs_Data> {
  const _$GroupsGetGroupsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupsResponseApplicationJson_Ocs_Data, _$GroupsGetGroupsResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'GroupsGetGroupsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  GroupsGetGroupsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupsResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupsResponseApplicationJson_Ocs
    implements
        GroupsGetGroupsResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupsResponseApplicationJson_Ocs, GroupsGetGroupsResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupsResponseApplicationJson_Ocs([
    final void Function(GroupsGetGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupsResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsGetGroupsResponseApplicationJson_OcsSerializer();
}

class _$GroupsGetGroupsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsGetGroupsResponseApplicationJson_Ocs> {
  const _$GroupsGetGroupsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupsResponseApplicationJson_Ocs, _$GroupsGetGroupsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'GroupsGetGroupsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(GroupsGetGroupsResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  GroupsGetGroupsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupsResponseApplicationJson_Ocs_Data),
            )! as GroupsGetGroupsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupsResponseApplicationJsonInterface {
  GroupsGetGroupsResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupsResponseApplicationJson
    implements
        GroupsGetGroupsResponseApplicationJsonInterface,
        Built<GroupsGetGroupsResponseApplicationJson, GroupsGetGroupsResponseApplicationJsonBuilder> {
  factory GroupsGetGroupsResponseApplicationJson([
    final void Function(GroupsGetGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupsResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupsResponseApplicationJson> get serializer =>
      const _$GroupsGetGroupsResponseApplicationJsonSerializer();
}

class _$GroupsGetGroupsResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsGetGroupsResponseApplicationJson> {
  const _$GroupsGetGroupsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [GroupsGetGroupsResponseApplicationJson, _$GroupsGetGroupsResponseApplicationJson];

  @override
  String get wireName => 'GroupsGetGroupsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(GroupsGetGroupsResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  GroupsGetGroupsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(GroupsGetGroupsResponseApplicationJson_Ocs))!
                as GroupsGetGroupsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsAddGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class GroupsAddGroupResponseApplicationJson_Ocs
    implements
        GroupsAddGroupResponseApplicationJson_OcsInterface,
        Built<GroupsAddGroupResponseApplicationJson_Ocs, GroupsAddGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsAddGroupResponseApplicationJson_Ocs([
    final void Function(GroupsAddGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsAddGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsAddGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsAddGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsAddGroupResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsAddGroupResponseApplicationJson_OcsSerializer();
}

class _$GroupsAddGroupResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsAddGroupResponseApplicationJson_Ocs> {
  const _$GroupsAddGroupResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsAddGroupResponseApplicationJson_Ocs, _$GroupsAddGroupResponseApplicationJson_Ocs];

  @override
  String get wireName => 'GroupsAddGroupResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsAddGroupResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  GroupsAddGroupResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsAddGroupResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsAddGroupResponseApplicationJsonInterface {
  GroupsAddGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsAddGroupResponseApplicationJson
    implements
        GroupsAddGroupResponseApplicationJsonInterface,
        Built<GroupsAddGroupResponseApplicationJson, GroupsAddGroupResponseApplicationJsonBuilder> {
  factory GroupsAddGroupResponseApplicationJson([
    final void Function(GroupsAddGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsAddGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsAddGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsAddGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsAddGroupResponseApplicationJson> get serializer =>
      const _$GroupsAddGroupResponseApplicationJsonSerializer();
}

class _$GroupsAddGroupResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsAddGroupResponseApplicationJson> {
  const _$GroupsAddGroupResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [GroupsAddGroupResponseApplicationJson, _$GroupsAddGroupResponseApplicationJson];

  @override
  String get wireName => 'GroupsAddGroupResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsAddGroupResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(GroupsAddGroupResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  GroupsAddGroupResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsAddGroupResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(GroupsAddGroupResponseApplicationJson_Ocs))!
                as GroupsAddGroupResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupDetails_UsercountInterface {
  bool? get $bool;
  int? get $int;
}

abstract class GroupDetails_Usercount
    implements GroupDetails_UsercountInterface, Built<GroupDetails_Usercount, GroupDetails_UsercountBuilder> {
  factory GroupDetails_Usercount([final void Function(GroupDetails_UsercountBuilder)? b]) = _$GroupDetails_Usercount;

  // coverage:ignore-start
  const GroupDetails_Usercount._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupDetails_Usercount.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupDetails_Usercount> get serializer => _$GroupDetails_UsercountSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final GroupDetails_UsercountBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$bool, b._$int].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$bool', '$int' for ${b._data}");
    }
  }
}

class _$GroupDetails_UsercountSerializer implements PrimitiveSerializer<GroupDetails_Usercount> {
  @override
  final Iterable<Type> types = const [GroupDetails_Usercount, _$GroupDetails_Usercount];

  @override
  final String wireName = 'GroupDetails_Usercount';

  @override
  Object serialize(
    final Serializers serializers,
    final GroupDetails_Usercount object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  GroupDetails_Usercount deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupDetails_UsercountBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(bool))! as bool;
      result.$bool = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupDetails_DisabledInterface {
  bool? get $bool;
  int? get $int;
}

abstract class GroupDetails_Disabled
    implements GroupDetails_DisabledInterface, Built<GroupDetails_Disabled, GroupDetails_DisabledBuilder> {
  factory GroupDetails_Disabled([final void Function(GroupDetails_DisabledBuilder)? b]) = _$GroupDetails_Disabled;

  // coverage:ignore-start
  const GroupDetails_Disabled._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupDetails_Disabled.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupDetails_Disabled> get serializer => _$GroupDetails_DisabledSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final GroupDetails_DisabledBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$bool, b._$int].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$bool', '$int' for ${b._data}");
    }
  }
}

class _$GroupDetails_DisabledSerializer implements PrimitiveSerializer<GroupDetails_Disabled> {
  @override
  final Iterable<Type> types = const [GroupDetails_Disabled, _$GroupDetails_Disabled];

  @override
  final String wireName = 'GroupDetails_Disabled';

  @override
  Object serialize(
    final Serializers serializers,
    final GroupDetails_Disabled object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  GroupDetails_Disabled deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupDetails_DisabledBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(bool))! as bool;
      result.$bool = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupDetailsInterface {
  String get id;
  String get displayname;
  GroupDetails_Usercount get usercount;
  GroupDetails_Disabled get disabled;
  bool get canAdd;
  bool get canRemove;
}

abstract class GroupDetails implements GroupDetailsInterface, Built<GroupDetails, GroupDetailsBuilder> {
  factory GroupDetails([final void Function(GroupDetailsBuilder)? b]) = _$GroupDetails;

  // coverage:ignore-start
  const GroupDetails._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupDetails.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupDetails> get serializer => const _$GroupDetailsSerializer();
}

class _$GroupDetailsSerializer implements StructuredSerializer<GroupDetails> {
  const _$GroupDetailsSerializer();

  @override
  Iterable<Type> get types => const [GroupDetails, _$GroupDetails];

  @override
  String get wireName => 'GroupDetails';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupDetails object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'displayname',
      serializers.serialize(object.displayname, specifiedType: const FullType(String)),
      'usercount',
      serializers.serialize(object.usercount, specifiedType: const FullType(GroupDetails_Usercount)),
      'disabled',
      serializers.serialize(object.disabled, specifiedType: const FullType(GroupDetails_Disabled)),
      'canAdd',
      serializers.serialize(object.canAdd, specifiedType: const FullType(bool)),
      'canRemove',
      serializers.serialize(object.canRemove, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  GroupDetails deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'displayname':
          result.displayname = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'usercount':
          result.usercount.replace(
            serializers.deserialize(value, specifiedType: const FullType(GroupDetails_Usercount))!
                as GroupDetails_Usercount,
          );
        case 'disabled':
          result.disabled.replace(
            serializers.deserialize(value, specifiedType: const FullType(GroupDetails_Disabled))!
                as GroupDetails_Disabled,
          );
        case 'canAdd':
          result.canAdd = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'canRemove':
          result.canRemove = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<GroupDetails> get groups;
}

abstract class GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data
    implements
        GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data,
            GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data([
    final void Function(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataSerializer();
}

class _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data> {
  const _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data,
        _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(GroupDetails)])),
    ];
    return result;
  }

  @override
  GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(GroupDetails)]))!
                as BuiltList<GroupDetails>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupsDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupsDetailsResponseApplicationJson_Ocs
    implements
        GroupsGetGroupsDetailsResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupsDetailsResponseApplicationJson_Ocs,
            GroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs([
    final void Function(GroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupsDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsDetailsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupsDetailsResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsGetGroupsDetailsResponseApplicationJson_OcsSerializer();
}

class _$GroupsGetGroupsDetailsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsGetGroupsDetailsResponseApplicationJson_Ocs> {
  const _$GroupsGetGroupsDetailsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupsDetailsResponseApplicationJson_Ocs, _$GroupsGetGroupsDetailsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'GroupsGetGroupsDetailsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupsDetailsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  GroupsGetGroupsDetailsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data),
            )! as GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupsDetailsResponseApplicationJsonInterface {
  GroupsGetGroupsDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupsDetailsResponseApplicationJson
    implements
        GroupsGetGroupsDetailsResponseApplicationJsonInterface,
        Built<GroupsGetGroupsDetailsResponseApplicationJson, GroupsGetGroupsDetailsResponseApplicationJsonBuilder> {
  factory GroupsGetGroupsDetailsResponseApplicationJson([
    final void Function(GroupsGetGroupsDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupsDetailsResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupsDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupsDetailsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupsDetailsResponseApplicationJson> get serializer =>
      const _$GroupsGetGroupsDetailsResponseApplicationJsonSerializer();
}

class _$GroupsGetGroupsDetailsResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsGetGroupsDetailsResponseApplicationJson> {
  const _$GroupsGetGroupsDetailsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupsDetailsResponseApplicationJson, _$GroupsGetGroupsDetailsResponseApplicationJson];

  @override
  String get wireName => 'GroupsGetGroupsDetailsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupsDetailsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  GroupsGetGroupsDetailsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupsDetailsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs),
            )! as GroupsGetGroupsDetailsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
}

abstract class GroupsGetGroupUsersResponseApplicationJson_Ocs_Data
    implements
        GroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupUsersResponseApplicationJson_Ocs_Data,
            GroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs_Data([
    final void Function(GroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupUsersResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupUsersResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersResponseApplicationJson_Ocs_Data> get serializer =>
      const _$GroupsGetGroupUsersResponseApplicationJson_Ocs_DataSerializer();
}

class _$GroupsGetGroupUsersResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<GroupsGetGroupUsersResponseApplicationJson_Ocs_Data> {
  const _$GroupsGetGroupUsersResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        GroupsGetGroupUsersResponseApplicationJson_Ocs_Data,
        _$GroupsGetGroupUsersResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'GroupsGetGroupUsersResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  GroupsGetGroupUsersResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupUsersResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupUsersResponseApplicationJson_Ocs
    implements
        GroupsGetGroupUsersResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupUsersResponseApplicationJson_Ocs, GroupsGetGroupUsersResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs([
    final void Function(GroupsGetGroupUsersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupUsersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupUsersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsGetGroupUsersResponseApplicationJson_OcsSerializer();
}

class _$GroupsGetGroupUsersResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsGetGroupUsersResponseApplicationJson_Ocs> {
  const _$GroupsGetGroupUsersResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupUsersResponseApplicationJson_Ocs, _$GroupsGetGroupUsersResponseApplicationJson_Ocs];

  @override
  String get wireName => 'GroupsGetGroupUsersResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  GroupsGetGroupUsersResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs_Data),
            )! as GroupsGetGroupUsersResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersResponseApplicationJsonInterface {
  GroupsGetGroupUsersResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupUsersResponseApplicationJson
    implements
        GroupsGetGroupUsersResponseApplicationJsonInterface,
        Built<GroupsGetGroupUsersResponseApplicationJson, GroupsGetGroupUsersResponseApplicationJsonBuilder> {
  factory GroupsGetGroupUsersResponseApplicationJson([
    final void Function(GroupsGetGroupUsersResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupUsersResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupUsersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersResponseApplicationJson> get serializer =>
      const _$GroupsGetGroupUsersResponseApplicationJsonSerializer();
}

class _$GroupsGetGroupUsersResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsGetGroupUsersResponseApplicationJson> {
  const _$GroupsGetGroupUsersResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupUsersResponseApplicationJson, _$GroupsGetGroupUsersResponseApplicationJson];

  @override
  String get wireName => 'GroupsGetGroupUsersResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  GroupsGetGroupUsersResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs),
            )! as GroupsGetGroupUsersResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetails_BackendCapabilitiesInterface {
  bool get setDisplayName;
  bool get setPassword;
}

abstract class UserDetails_BackendCapabilities
    implements
        UserDetails_BackendCapabilitiesInterface,
        Built<UserDetails_BackendCapabilities, UserDetails_BackendCapabilitiesBuilder> {
  factory UserDetails_BackendCapabilities([final void Function(UserDetails_BackendCapabilitiesBuilder)? b]) =
      _$UserDetails_BackendCapabilities;

  // coverage:ignore-start
  const UserDetails_BackendCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetails_BackendCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetails_BackendCapabilities> get serializer =>
      const _$UserDetails_BackendCapabilitiesSerializer();
}

class _$UserDetails_BackendCapabilitiesSerializer implements StructuredSerializer<UserDetails_BackendCapabilities> {
  const _$UserDetails_BackendCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [UserDetails_BackendCapabilities, _$UserDetails_BackendCapabilities];

  @override
  String get wireName => 'UserDetails_BackendCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserDetails_BackendCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'setDisplayName',
      serializers.serialize(object.setDisplayName, specifiedType: const FullType(bool)),
      'setPassword',
      serializers.serialize(object.setPassword, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  UserDetails_BackendCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetails_BackendCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'setDisplayName':
          result.setDisplayName = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'setPassword':
          result.setPassword = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetailsQuota_FreeInterface {
  double? get $double;
  int? get $int;
}

abstract class UserDetailsQuota_Free
    implements UserDetailsQuota_FreeInterface, Built<UserDetailsQuota_Free, UserDetailsQuota_FreeBuilder> {
  factory UserDetailsQuota_Free([final void Function(UserDetailsQuota_FreeBuilder)? b]) = _$UserDetailsQuota_Free;

  // coverage:ignore-start
  const UserDetailsQuota_Free._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetailsQuota_Free.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetailsQuota_Free> get serializer => _$UserDetailsQuota_FreeSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UserDetailsQuota_FreeBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$double, b._$int].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$double', '$int' for ${b._data}");
    }
  }
}

class _$UserDetailsQuota_FreeSerializer implements PrimitiveSerializer<UserDetailsQuota_Free> {
  @override
  final Iterable<Type> types = const [UserDetailsQuota_Free, _$UserDetailsQuota_Free];

  @override
  final String wireName = 'UserDetailsQuota_Free';

  @override
  Object serialize(
    final Serializers serializers,
    final UserDetailsQuota_Free object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserDetailsQuota_Free deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsQuota_FreeBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetailsQuota_QuotaInterface {
  double? get $double;
  int? get $int;
  String? get string;
}

abstract class UserDetailsQuota_Quota
    implements UserDetailsQuota_QuotaInterface, Built<UserDetailsQuota_Quota, UserDetailsQuota_QuotaBuilder> {
  factory UserDetailsQuota_Quota([final void Function(UserDetailsQuota_QuotaBuilder)? b]) = _$UserDetailsQuota_Quota;

  // coverage:ignore-start
  const UserDetailsQuota_Quota._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetailsQuota_Quota.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetailsQuota_Quota> get serializer => _$UserDetailsQuota_QuotaSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UserDetailsQuota_QuotaBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$double, b._$int, b._string].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$double', '$int', 'string' for ${b._data}");
    }
  }
}

class _$UserDetailsQuota_QuotaSerializer implements PrimitiveSerializer<UserDetailsQuota_Quota> {
  @override
  final Iterable<Type> types = const [UserDetailsQuota_Quota, _$UserDetailsQuota_Quota];

  @override
  final String wireName = 'UserDetailsQuota_Quota';

  @override
  Object serialize(
    final Serializers serializers,
    final UserDetailsQuota_Quota object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserDetailsQuota_Quota deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsQuota_QuotaBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetailsQuota_RelativeInterface {
  double? get $double;
  int? get $int;
}

abstract class UserDetailsQuota_Relative
    implements UserDetailsQuota_RelativeInterface, Built<UserDetailsQuota_Relative, UserDetailsQuota_RelativeBuilder> {
  factory UserDetailsQuota_Relative([final void Function(UserDetailsQuota_RelativeBuilder)? b]) =
      _$UserDetailsQuota_Relative;

  // coverage:ignore-start
  const UserDetailsQuota_Relative._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetailsQuota_Relative.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetailsQuota_Relative> get serializer => _$UserDetailsQuota_RelativeSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UserDetailsQuota_RelativeBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$double, b._$int].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$double', '$int' for ${b._data}");
    }
  }
}

class _$UserDetailsQuota_RelativeSerializer implements PrimitiveSerializer<UserDetailsQuota_Relative> {
  @override
  final Iterable<Type> types = const [UserDetailsQuota_Relative, _$UserDetailsQuota_Relative];

  @override
  final String wireName = 'UserDetailsQuota_Relative';

  @override
  Object serialize(
    final Serializers serializers,
    final UserDetailsQuota_Relative object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserDetailsQuota_Relative deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsQuota_RelativeBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetailsQuota_TotalInterface {
  double? get $double;
  int? get $int;
}

abstract class UserDetailsQuota_Total
    implements UserDetailsQuota_TotalInterface, Built<UserDetailsQuota_Total, UserDetailsQuota_TotalBuilder> {
  factory UserDetailsQuota_Total([final void Function(UserDetailsQuota_TotalBuilder)? b]) = _$UserDetailsQuota_Total;

  // coverage:ignore-start
  const UserDetailsQuota_Total._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetailsQuota_Total.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetailsQuota_Total> get serializer => _$UserDetailsQuota_TotalSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UserDetailsQuota_TotalBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$double, b._$int].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$double', '$int' for ${b._data}");
    }
  }
}

class _$UserDetailsQuota_TotalSerializer implements PrimitiveSerializer<UserDetailsQuota_Total> {
  @override
  final Iterable<Type> types = const [UserDetailsQuota_Total, _$UserDetailsQuota_Total];

  @override
  final String wireName = 'UserDetailsQuota_Total';

  @override
  Object serialize(
    final Serializers serializers,
    final UserDetailsQuota_Total object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserDetailsQuota_Total deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsQuota_TotalBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetailsQuota_UsedInterface {
  double? get $double;
  int? get $int;
}

abstract class UserDetailsQuota_Used
    implements UserDetailsQuota_UsedInterface, Built<UserDetailsQuota_Used, UserDetailsQuota_UsedBuilder> {
  factory UserDetailsQuota_Used([final void Function(UserDetailsQuota_UsedBuilder)? b]) = _$UserDetailsQuota_Used;

  // coverage:ignore-start
  const UserDetailsQuota_Used._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetailsQuota_Used.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetailsQuota_Used> get serializer => _$UserDetailsQuota_UsedSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UserDetailsQuota_UsedBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$double, b._$int].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$double', '$int' for ${b._data}");
    }
  }
}

class _$UserDetailsQuota_UsedSerializer implements PrimitiveSerializer<UserDetailsQuota_Used> {
  @override
  final Iterable<Type> types = const [UserDetailsQuota_Used, _$UserDetailsQuota_Used];

  @override
  final String wireName = 'UserDetailsQuota_Used';

  @override
  Object serialize(
    final Serializers serializers,
    final UserDetailsQuota_Used object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserDetailsQuota_Used deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsQuota_UsedBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetailsQuotaInterface {
  UserDetailsQuota_Free? get free;
  UserDetailsQuota_Quota? get quota;
  UserDetailsQuota_Relative? get relative;
  UserDetailsQuota_Total? get total;
  UserDetailsQuota_Used? get used;
}

abstract class UserDetailsQuota implements UserDetailsQuotaInterface, Built<UserDetailsQuota, UserDetailsQuotaBuilder> {
  factory UserDetailsQuota([final void Function(UserDetailsQuotaBuilder)? b]) = _$UserDetailsQuota;

  // coverage:ignore-start
  const UserDetailsQuota._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetailsQuota.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetailsQuota> get serializer => const _$UserDetailsQuotaSerializer();
}

class _$UserDetailsQuotaSerializer implements StructuredSerializer<UserDetailsQuota> {
  const _$UserDetailsQuotaSerializer();

  @override
  Iterable<Type> get types => const [UserDetailsQuota, _$UserDetailsQuota];

  @override
  String get wireName => 'UserDetailsQuota';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserDetailsQuota object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.free;
    if (value != null) {
      result
        ..add('free')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(UserDetailsQuota_Free)),
        );
    }

    value = object.quota;
    if (value != null) {
      result
        ..add('quota')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(UserDetailsQuota_Quota)),
        );
    }

    value = object.relative;
    if (value != null) {
      result
        ..add('relative')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(UserDetailsQuota_Relative)),
        );
    }

    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(UserDetailsQuota_Total)),
        );
    }

    value = object.used;
    if (value != null) {
      result
        ..add('used')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(UserDetailsQuota_Used)),
        );
    }

    return result;
  }

  @override
  UserDetailsQuota deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsQuotaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'free':
          result.free.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetailsQuota_Free))!
                as UserDetailsQuota_Free,
          );
        case 'quota':
          result.quota.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetailsQuota_Quota))!
                as UserDetailsQuota_Quota,
          );
        case 'relative':
          result.relative.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetailsQuota_Relative))!
                as UserDetailsQuota_Relative,
          );
        case 'total':
          result.total.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetailsQuota_Total))!
                as UserDetailsQuota_Total,
          );
        case 'used':
          result.used.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetailsQuota_Used))!
                as UserDetailsQuota_Used,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserDetailsInterface {
  @BuiltValueField(wireName: 'additional_mail')
  BuiltList<String> get additionalMail;
  @BuiltValueField(wireName: 'additional_mailScope')
  BuiltList<String>? get additionalMailScope;
  String get address;
  String? get addressScope;
  String? get avatarScope;
  String get backend;
  UserDetails_BackendCapabilities get backendCapabilities;
  String get biography;
  String? get biographyScope;
  @BuiltValueField(wireName: 'display-name')
  String get displayName;
  String get displayname;
  String? get displaynameScope;
  String? get email;
  String? get emailScope;
  bool? get enabled;
  String get fediverse;
  String? get fediverseScope;
  BuiltList<String> get groups;
  String get headline;
  String? get headlineScope;
  String get id;
  String get language;
  int get lastLogin;
  String get locale;
  String get manager;
  @BuiltValueField(wireName: 'notify_email')
  String? get notifyEmail;
  String get organisation;
  String? get organisationScope;
  String get phone;
  String? get phoneScope;
  @BuiltValueField(wireName: 'profile_enabled')
  String get profileEnabled;
  @BuiltValueField(wireName: 'profile_enabledScope')
  String? get profileEnabledScope;
  UserDetailsQuota get quota;
  String get role;
  String? get roleScope;
  String? get storageLocation;
  BuiltList<String> get subadmin;
  String get twitter;
  String? get twitterScope;
  String get website;
  String? get websiteScope;
}

abstract class UserDetails implements UserDetailsInterface, Built<UserDetails, UserDetailsBuilder> {
  factory UserDetails([final void Function(UserDetailsBuilder)? b]) = _$UserDetails;

  // coverage:ignore-start
  const UserDetails._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserDetails.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDetails> get serializer => const _$UserDetailsSerializer();
}

class _$UserDetailsSerializer implements StructuredSerializer<UserDetails> {
  const _$UserDetailsSerializer();

  @override
  Iterable<Type> get types => const [UserDetails, _$UserDetails];

  @override
  String get wireName => 'UserDetails';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserDetails object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'additional_mail',
      serializers.serialize(object.additionalMail, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'address',
      serializers.serialize(object.address, specifiedType: const FullType(String)),
      'backend',
      serializers.serialize(object.backend, specifiedType: const FullType(String)),
      'backendCapabilities',
      serializers.serialize(object.backendCapabilities, specifiedType: const FullType(UserDetails_BackendCapabilities)),
      'biography',
      serializers.serialize(object.biography, specifiedType: const FullType(String)),
      'display-name',
      serializers.serialize(object.displayName, specifiedType: const FullType(String)),
      'displayname',
      serializers.serialize(object.displayname, specifiedType: const FullType(String)),
      'fediverse',
      serializers.serialize(object.fediverse, specifiedType: const FullType(String)),
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'headline',
      serializers.serialize(object.headline, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'language',
      serializers.serialize(object.language, specifiedType: const FullType(String)),
      'lastLogin',
      serializers.serialize(object.lastLogin, specifiedType: const FullType(int)),
      'locale',
      serializers.serialize(object.locale, specifiedType: const FullType(String)),
      'manager',
      serializers.serialize(object.manager, specifiedType: const FullType(String)),
      'organisation',
      serializers.serialize(object.organisation, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone, specifiedType: const FullType(String)),
      'profile_enabled',
      serializers.serialize(object.profileEnabled, specifiedType: const FullType(String)),
      'quota',
      serializers.serialize(object.quota, specifiedType: const FullType(UserDetailsQuota)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'subadmin',
      serializers.serialize(object.subadmin, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'twitter',
      serializers.serialize(object.twitter, specifiedType: const FullType(String)),
      'website',
      serializers.serialize(object.website, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.additionalMailScope;
    if (value != null) {
      result
        ..add('additional_mailScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    value = object.addressScope;
    if (value != null) {
      result
        ..add('addressScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.avatarScope;
    if (value != null) {
      result
        ..add('avatarScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.biographyScope;
    if (value != null) {
      result
        ..add('biographyScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.displaynameScope;
    if (value != null) {
      result
        ..add('displaynameScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.emailScope;
    if (value != null) {
      result
        ..add('emailScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.fediverseScope;
    if (value != null) {
      result
        ..add('fediverseScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.headlineScope;
    if (value != null) {
      result
        ..add('headlineScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.notifyEmail;
    if (value != null) {
      result
        ..add('notify_email')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.organisationScope;
    if (value != null) {
      result
        ..add('organisationScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.phoneScope;
    if (value != null) {
      result
        ..add('phoneScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.profileEnabledScope;
    if (value != null) {
      result
        ..add('profile_enabledScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.roleScope;
    if (value != null) {
      result
        ..add('roleScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.storageLocation;
    if (value != null) {
      result
        ..add('storageLocation')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.twitterScope;
    if (value != null) {
      result
        ..add('twitterScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.websiteScope;
    if (value != null) {
      result
        ..add('websiteScope')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  UserDetails deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'additional_mail':
          result.additionalMail.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'additional_mailScope':
          result.additionalMailScope.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'addressScope':
          result.addressScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'avatarScope':
          result.avatarScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'backend':
          result.backend = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'backendCapabilities':
          result.backendCapabilities.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetails_BackendCapabilities))!
                as UserDetails_BackendCapabilities,
          );
        case 'biography':
          result.biography = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'biographyScope':
          result.biographyScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'display-name':
          result.displayName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'displayname':
          result.displayname = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'displaynameScope':
          result.displaynameScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'email':
          result.email = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'emailScope':
          result.emailScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'fediverse':
          result.fediverse = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'fediverseScope':
          result.fediverseScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'headline':
          result.headline = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'headlineScope':
          result.headlineScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'language':
          result.language = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'lastLogin':
          result.lastLogin = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'locale':
          result.locale = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'manager':
          result.manager = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'notify_email':
          result.notifyEmail = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'organisation':
          result.organisation = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'organisationScope':
          result.organisationScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'phone':
          result.phone = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'phoneScope':
          result.phoneScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'profile_enabled':
          result.profileEnabled = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'profile_enabledScope':
          result.profileEnabledScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'quota':
          result.quota.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetailsQuota))! as UserDetailsQuota,
          );
        case 'role':
          result.role = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'roleScope':
          result.roleScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'storageLocation':
          result.storageLocation = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'subadmin':
          result.subadmin.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'twitter':
          result.twitter = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'twitterScope':
          result.twitterScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'website':
          result.website = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'websiteScope':
          result.websiteScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    final void Function(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      const _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer();
}

class _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer
    implements StructuredSerializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1> {
  const _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer();

  @override
  Iterable<Type> get types => const [
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
        _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
      ];

  @override
  String get wireName => 'GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersInterface {
  UserDetails? get userDetails;
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
      get groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users
    implements
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersInterface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users,
            GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users([
    final void Function(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users> get serializer =>
      _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._userDetails, b._groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1]
        .singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError(
        "Need exactly one of 'userDetails', 'groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1' for ${b._data}",
      );
    }
  }
}

class _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer
    implements PrimitiveSerializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users> {
  @override
  final Iterable<Type> types = const [
    GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users,
    _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users,
  ];

  @override
  final String wireName = 'GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users';

  @override
  Object serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(UserDetails))! as UserDetails;
      result.userDetails.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1;
      result.groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data,
            GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data([
    final void Function(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataSerializer();
}

class _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data> {
  const _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data,
        _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'users',
      serializers.serialize(
        object.users,
        specifiedType: const FullType(
          BuiltMap,
          [FullType(String), FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
      ),
    ];
    return result;
  }

  @override
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users),
              ]),
            )! as BuiltMap<String, GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs
    implements
        GroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs,
            GroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs([
    final void Function(GroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsGetGroupUsersDetailsResponseApplicationJson_OcsSerializer();
}

class _$GroupsGetGroupUsersDetailsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs> {
  const _$GroupsGetGroupUsersDetailsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs,
        _$GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data),
            )! as GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupUsersDetailsResponseApplicationJsonInterface {
  GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupUsersDetailsResponseApplicationJson
    implements
        GroupsGetGroupUsersDetailsResponseApplicationJsonInterface,
        Built<GroupsGetGroupUsersDetailsResponseApplicationJson,
            GroupsGetGroupUsersDetailsResponseApplicationJsonBuilder> {
  factory GroupsGetGroupUsersDetailsResponseApplicationJson([
    final void Function(GroupsGetGroupUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupUsersDetailsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupUsersDetailsResponseApplicationJson> get serializer =>
      const _$GroupsGetGroupUsersDetailsResponseApplicationJsonSerializer();
}

class _$GroupsGetGroupUsersDetailsResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsGetGroupUsersDetailsResponseApplicationJson> {
  const _$GroupsGetGroupUsersDetailsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupUsersDetailsResponseApplicationJson, _$GroupsGetGroupUsersDetailsResponseApplicationJson];

  @override
  String get wireName => 'GroupsGetGroupUsersDetailsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupUsersDetailsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  GroupsGetGroupUsersDetailsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupUsersDetailsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs),
            )! as GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs
    implements
        GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterface,
        Built<GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs,
            GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs([
    final void Function(GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsSerializer();
}

class _$GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs> {
  const _$GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs,
        _$GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetSubAdminsOfGroupResponseApplicationJsonInterface {
  GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetSubAdminsOfGroupResponseApplicationJson
    implements
        GroupsGetSubAdminsOfGroupResponseApplicationJsonInterface,
        Built<GroupsGetSubAdminsOfGroupResponseApplicationJson,
            GroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder> {
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson([
    final void Function(GroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetSubAdminsOfGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetSubAdminsOfGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetSubAdminsOfGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetSubAdminsOfGroupResponseApplicationJson> get serializer =>
      const _$GroupsGetSubAdminsOfGroupResponseApplicationJsonSerializer();
}

class _$GroupsGetSubAdminsOfGroupResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsGetSubAdminsOfGroupResponseApplicationJson> {
  const _$GroupsGetSubAdminsOfGroupResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetSubAdminsOfGroupResponseApplicationJson, _$GroupsGetSubAdminsOfGroupResponseApplicationJson];

  @override
  String get wireName => 'GroupsGetSubAdminsOfGroupResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetSubAdminsOfGroupResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  GroupsGetSubAdminsOfGroupResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs),
            )! as GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
}

abstract class GroupsGetGroupResponseApplicationJson_Ocs_Data
    implements
        GroupsGetGroupResponseApplicationJson_Ocs_DataInterface,
        Built<GroupsGetGroupResponseApplicationJson_Ocs_Data, GroupsGetGroupResponseApplicationJson_Ocs_DataBuilder> {
  factory GroupsGetGroupResponseApplicationJson_Ocs_Data([
    final void Function(GroupsGetGroupResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$GroupsGetGroupResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const GroupsGetGroupResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupResponseApplicationJson_Ocs_Data> get serializer =>
      const _$GroupsGetGroupResponseApplicationJson_Ocs_DataSerializer();
}

class _$GroupsGetGroupResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<GroupsGetGroupResponseApplicationJson_Ocs_Data> {
  const _$GroupsGetGroupResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupResponseApplicationJson_Ocs_Data, _$GroupsGetGroupResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'GroupsGetGroupResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  GroupsGetGroupResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  GroupsGetGroupResponseApplicationJson_Ocs_Data get data;
}

abstract class GroupsGetGroupResponseApplicationJson_Ocs
    implements
        GroupsGetGroupResponseApplicationJson_OcsInterface,
        Built<GroupsGetGroupResponseApplicationJson_Ocs, GroupsGetGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsGetGroupResponseApplicationJson_Ocs([
    final void Function(GroupsGetGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsGetGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsGetGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsGetGroupResponseApplicationJson_OcsSerializer();
}

class _$GroupsGetGroupResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsGetGroupResponseApplicationJson_Ocs> {
  const _$GroupsGetGroupResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsGetGroupResponseApplicationJson_Ocs, _$GroupsGetGroupResponseApplicationJson_Ocs];

  @override
  String get wireName => 'GroupsGetGroupResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(GroupsGetGroupResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  GroupsGetGroupResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsGetGroupResponseApplicationJson_Ocs_Data),
            )! as GroupsGetGroupResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsGetGroupResponseApplicationJsonInterface {
  GroupsGetGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsGetGroupResponseApplicationJson
    implements
        GroupsGetGroupResponseApplicationJsonInterface,
        Built<GroupsGetGroupResponseApplicationJson, GroupsGetGroupResponseApplicationJsonBuilder> {
  factory GroupsGetGroupResponseApplicationJson([
    final void Function(GroupsGetGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsGetGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsGetGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsGetGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsGetGroupResponseApplicationJson> get serializer =>
      const _$GroupsGetGroupResponseApplicationJsonSerializer();
}

class _$GroupsGetGroupResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsGetGroupResponseApplicationJson> {
  const _$GroupsGetGroupResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [GroupsGetGroupResponseApplicationJson, _$GroupsGetGroupResponseApplicationJson];

  @override
  String get wireName => 'GroupsGetGroupResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsGetGroupResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(GroupsGetGroupResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  GroupsGetGroupResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsGetGroupResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(GroupsGetGroupResponseApplicationJson_Ocs))!
                as GroupsGetGroupResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsUpdateGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class GroupsUpdateGroupResponseApplicationJson_Ocs
    implements
        GroupsUpdateGroupResponseApplicationJson_OcsInterface,
        Built<GroupsUpdateGroupResponseApplicationJson_Ocs, GroupsUpdateGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsUpdateGroupResponseApplicationJson_Ocs([
    final void Function(GroupsUpdateGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsUpdateGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsUpdateGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsUpdateGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsUpdateGroupResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsUpdateGroupResponseApplicationJson_OcsSerializer();
}

class _$GroupsUpdateGroupResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsUpdateGroupResponseApplicationJson_Ocs> {
  const _$GroupsUpdateGroupResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsUpdateGroupResponseApplicationJson_Ocs, _$GroupsUpdateGroupResponseApplicationJson_Ocs];

  @override
  String get wireName => 'GroupsUpdateGroupResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsUpdateGroupResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  GroupsUpdateGroupResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsUpdateGroupResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsUpdateGroupResponseApplicationJsonInterface {
  GroupsUpdateGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsUpdateGroupResponseApplicationJson
    implements
        GroupsUpdateGroupResponseApplicationJsonInterface,
        Built<GroupsUpdateGroupResponseApplicationJson, GroupsUpdateGroupResponseApplicationJsonBuilder> {
  factory GroupsUpdateGroupResponseApplicationJson([
    final void Function(GroupsUpdateGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsUpdateGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsUpdateGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsUpdateGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsUpdateGroupResponseApplicationJson> get serializer =>
      const _$GroupsUpdateGroupResponseApplicationJsonSerializer();
}

class _$GroupsUpdateGroupResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsUpdateGroupResponseApplicationJson> {
  const _$GroupsUpdateGroupResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsUpdateGroupResponseApplicationJson, _$GroupsUpdateGroupResponseApplicationJson];

  @override
  String get wireName => 'GroupsUpdateGroupResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsUpdateGroupResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(GroupsUpdateGroupResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  GroupsUpdateGroupResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsUpdateGroupResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsUpdateGroupResponseApplicationJson_Ocs),
            )! as GroupsUpdateGroupResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsDeleteGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class GroupsDeleteGroupResponseApplicationJson_Ocs
    implements
        GroupsDeleteGroupResponseApplicationJson_OcsInterface,
        Built<GroupsDeleteGroupResponseApplicationJson_Ocs, GroupsDeleteGroupResponseApplicationJson_OcsBuilder> {
  factory GroupsDeleteGroupResponseApplicationJson_Ocs([
    final void Function(GroupsDeleteGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$GroupsDeleteGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const GroupsDeleteGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsDeleteGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsDeleteGroupResponseApplicationJson_Ocs> get serializer =>
      const _$GroupsDeleteGroupResponseApplicationJson_OcsSerializer();
}

class _$GroupsDeleteGroupResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<GroupsDeleteGroupResponseApplicationJson_Ocs> {
  const _$GroupsDeleteGroupResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsDeleteGroupResponseApplicationJson_Ocs, _$GroupsDeleteGroupResponseApplicationJson_Ocs];

  @override
  String get wireName => 'GroupsDeleteGroupResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsDeleteGroupResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  GroupsDeleteGroupResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsDeleteGroupResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GroupsDeleteGroupResponseApplicationJsonInterface {
  GroupsDeleteGroupResponseApplicationJson_Ocs get ocs;
}

abstract class GroupsDeleteGroupResponseApplicationJson
    implements
        GroupsDeleteGroupResponseApplicationJsonInterface,
        Built<GroupsDeleteGroupResponseApplicationJson, GroupsDeleteGroupResponseApplicationJsonBuilder> {
  factory GroupsDeleteGroupResponseApplicationJson([
    final void Function(GroupsDeleteGroupResponseApplicationJsonBuilder)? b,
  ]) = _$GroupsDeleteGroupResponseApplicationJson;

  // coverage:ignore-start
  const GroupsDeleteGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GroupsDeleteGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GroupsDeleteGroupResponseApplicationJson> get serializer =>
      const _$GroupsDeleteGroupResponseApplicationJsonSerializer();
}

class _$GroupsDeleteGroupResponseApplicationJsonSerializer
    implements StructuredSerializer<GroupsDeleteGroupResponseApplicationJson> {
  const _$GroupsDeleteGroupResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [GroupsDeleteGroupResponseApplicationJson, _$GroupsDeleteGroupResponseApplicationJson];

  @override
  String get wireName => 'GroupsDeleteGroupResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GroupsDeleteGroupResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(GroupsDeleteGroupResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  GroupsDeleteGroupResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GroupsDeleteGroupResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GroupsDeleteGroupResponseApplicationJson_Ocs),
            )! as GroupsDeleteGroupResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesSetPreferenceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesSetPreferenceResponseApplicationJson_Ocs
    implements
        PreferencesSetPreferenceResponseApplicationJson_OcsInterface,
        Built<PreferencesSetPreferenceResponseApplicationJson_Ocs,
            PreferencesSetPreferenceResponseApplicationJson_OcsBuilder> {
  factory PreferencesSetPreferenceResponseApplicationJson_Ocs([
    final void Function(PreferencesSetPreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesSetPreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesSetPreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetPreferenceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesSetPreferenceResponseApplicationJson_Ocs> get serializer =>
      const _$PreferencesSetPreferenceResponseApplicationJson_OcsSerializer();
}

class _$PreferencesSetPreferenceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<PreferencesSetPreferenceResponseApplicationJson_Ocs> {
  const _$PreferencesSetPreferenceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        PreferencesSetPreferenceResponseApplicationJson_Ocs,
        _$PreferencesSetPreferenceResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'PreferencesSetPreferenceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesSetPreferenceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  PreferencesSetPreferenceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesSetPreferenceResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesSetPreferenceResponseApplicationJsonInterface {
  PreferencesSetPreferenceResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesSetPreferenceResponseApplicationJson
    implements
        PreferencesSetPreferenceResponseApplicationJsonInterface,
        Built<PreferencesSetPreferenceResponseApplicationJson, PreferencesSetPreferenceResponseApplicationJsonBuilder> {
  factory PreferencesSetPreferenceResponseApplicationJson([
    final void Function(PreferencesSetPreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesSetPreferenceResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesSetPreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetPreferenceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesSetPreferenceResponseApplicationJson> get serializer =>
      const _$PreferencesSetPreferenceResponseApplicationJsonSerializer();
}

class _$PreferencesSetPreferenceResponseApplicationJsonSerializer
    implements StructuredSerializer<PreferencesSetPreferenceResponseApplicationJson> {
  const _$PreferencesSetPreferenceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [PreferencesSetPreferenceResponseApplicationJson, _$PreferencesSetPreferenceResponseApplicationJson];

  @override
  String get wireName => 'PreferencesSetPreferenceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesSetPreferenceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(PreferencesSetPreferenceResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  PreferencesSetPreferenceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesSetPreferenceResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(PreferencesSetPreferenceResponseApplicationJson_Ocs),
            )! as PreferencesSetPreferenceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesDeletePreferenceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesDeletePreferenceResponseApplicationJson_Ocs
    implements
        PreferencesDeletePreferenceResponseApplicationJson_OcsInterface,
        Built<PreferencesDeletePreferenceResponseApplicationJson_Ocs,
            PreferencesDeletePreferenceResponseApplicationJson_OcsBuilder> {
  factory PreferencesDeletePreferenceResponseApplicationJson_Ocs([
    final void Function(PreferencesDeletePreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesDeletePreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesDeletePreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeletePreferenceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesDeletePreferenceResponseApplicationJson_Ocs> get serializer =>
      const _$PreferencesDeletePreferenceResponseApplicationJson_OcsSerializer();
}

class _$PreferencesDeletePreferenceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<PreferencesDeletePreferenceResponseApplicationJson_Ocs> {
  const _$PreferencesDeletePreferenceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        PreferencesDeletePreferenceResponseApplicationJson_Ocs,
        _$PreferencesDeletePreferenceResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'PreferencesDeletePreferenceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesDeletePreferenceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  PreferencesDeletePreferenceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesDeletePreferenceResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesDeletePreferenceResponseApplicationJsonInterface {
  PreferencesDeletePreferenceResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesDeletePreferenceResponseApplicationJson
    implements
        PreferencesDeletePreferenceResponseApplicationJsonInterface,
        Built<PreferencesDeletePreferenceResponseApplicationJson,
            PreferencesDeletePreferenceResponseApplicationJsonBuilder> {
  factory PreferencesDeletePreferenceResponseApplicationJson([
    final void Function(PreferencesDeletePreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesDeletePreferenceResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesDeletePreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeletePreferenceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesDeletePreferenceResponseApplicationJson> get serializer =>
      const _$PreferencesDeletePreferenceResponseApplicationJsonSerializer();
}

class _$PreferencesDeletePreferenceResponseApplicationJsonSerializer
    implements StructuredSerializer<PreferencesDeletePreferenceResponseApplicationJson> {
  const _$PreferencesDeletePreferenceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [PreferencesDeletePreferenceResponseApplicationJson, _$PreferencesDeletePreferenceResponseApplicationJson];

  @override
  String get wireName => 'PreferencesDeletePreferenceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesDeletePreferenceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(PreferencesDeletePreferenceResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  PreferencesDeletePreferenceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesDeletePreferenceResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(PreferencesDeletePreferenceResponseApplicationJson_Ocs),
            )! as PreferencesDeletePreferenceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs
    implements
        PreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterface,
        Built<PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs,
            PreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder> {
  factory PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs([
    final void Function(PreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs> get serializer =>
      const _$PreferencesSetMultiplePreferencesResponseApplicationJson_OcsSerializer();
}

class _$PreferencesSetMultiplePreferencesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs> {
  const _$PreferencesSetMultiplePreferencesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs,
        _$PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesSetMultiplePreferencesResponseApplicationJsonInterface {
  PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesSetMultiplePreferencesResponseApplicationJson
    implements
        PreferencesSetMultiplePreferencesResponseApplicationJsonInterface,
        Built<PreferencesSetMultiplePreferencesResponseApplicationJson,
            PreferencesSetMultiplePreferencesResponseApplicationJsonBuilder> {
  factory PreferencesSetMultiplePreferencesResponseApplicationJson([
    final void Function(PreferencesSetMultiplePreferencesResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesSetMultiplePreferencesResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesSetMultiplePreferencesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesSetMultiplePreferencesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesSetMultiplePreferencesResponseApplicationJson> get serializer =>
      const _$PreferencesSetMultiplePreferencesResponseApplicationJsonSerializer();
}

class _$PreferencesSetMultiplePreferencesResponseApplicationJsonSerializer
    implements StructuredSerializer<PreferencesSetMultiplePreferencesResponseApplicationJson> {
  const _$PreferencesSetMultiplePreferencesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        PreferencesSetMultiplePreferencesResponseApplicationJson,
        _$PreferencesSetMultiplePreferencesResponseApplicationJson,
      ];

  @override
  String get wireName => 'PreferencesSetMultiplePreferencesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesSetMultiplePreferencesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  PreferencesSetMultiplePreferencesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesSetMultiplePreferencesResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs),
            )! as PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs
    implements
        PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterface,
        Built<PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs,
            PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder> {
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs([
    final void Function(PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs> get serializer =>
      const _$PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsSerializer();
}

class _$PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs> {
  const _$PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs,
        _$PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PreferencesDeleteMultiplePreferenceResponseApplicationJsonInterface {
  PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs get ocs;
}

abstract class PreferencesDeleteMultiplePreferenceResponseApplicationJson
    implements
        PreferencesDeleteMultiplePreferenceResponseApplicationJsonInterface,
        Built<PreferencesDeleteMultiplePreferenceResponseApplicationJson,
            PreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder> {
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson([
    final void Function(PreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$PreferencesDeleteMultiplePreferenceResponseApplicationJson;

  // coverage:ignore-start
  const PreferencesDeleteMultiplePreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PreferencesDeleteMultiplePreferenceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PreferencesDeleteMultiplePreferenceResponseApplicationJson> get serializer =>
      const _$PreferencesDeleteMultiplePreferenceResponseApplicationJsonSerializer();
}

class _$PreferencesDeleteMultiplePreferenceResponseApplicationJsonSerializer
    implements StructuredSerializer<PreferencesDeleteMultiplePreferenceResponseApplicationJson> {
  const _$PreferencesDeleteMultiplePreferenceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        PreferencesDeleteMultiplePreferenceResponseApplicationJson,
        _$PreferencesDeleteMultiplePreferenceResponseApplicationJson,
      ];

  @override
  String get wireName => 'PreferencesDeleteMultiplePreferenceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PreferencesDeleteMultiplePreferenceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  PreferencesDeleteMultiplePreferenceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs),
            )! as PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
}

abstract class UsersGetUsersResponseApplicationJson_Ocs_Data
    implements
        UsersGetUsersResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetUsersResponseApplicationJson_Ocs_Data, UsersGetUsersResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetUsersResponseApplicationJson_Ocs_Data([
    final void Function(UsersGetUsersResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetUsersResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetUsersResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersResponseApplicationJson_Ocs_Data> get serializer =>
      const _$UsersGetUsersResponseApplicationJson_Ocs_DataSerializer();
}

class _$UsersGetUsersResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<UsersGetUsersResponseApplicationJson_Ocs_Data> {
  const _$UsersGetUsersResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUsersResponseApplicationJson_Ocs_Data, _$UsersGetUsersResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'UsersGetUsersResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  UsersGetUsersResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetUsersResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetUsersResponseApplicationJson_Ocs
    implements
        UsersGetUsersResponseApplicationJson_OcsInterface,
        Built<UsersGetUsersResponseApplicationJson_Ocs, UsersGetUsersResponseApplicationJson_OcsBuilder> {
  factory UsersGetUsersResponseApplicationJson_Ocs([
    final void Function(UsersGetUsersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUsersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUsersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetUsersResponseApplicationJson_OcsSerializer();
}

class _$UsersGetUsersResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetUsersResponseApplicationJson_Ocs> {
  const _$UsersGetUsersResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUsersResponseApplicationJson_Ocs, _$UsersGetUsersResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersGetUsersResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UsersGetUsersResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  UsersGetUsersResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetUsersResponseApplicationJson_Ocs_Data),
            )! as UsersGetUsersResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersResponseApplicationJsonInterface {
  UsersGetUsersResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUsersResponseApplicationJson
    implements
        UsersGetUsersResponseApplicationJsonInterface,
        Built<UsersGetUsersResponseApplicationJson, UsersGetUsersResponseApplicationJsonBuilder> {
  factory UsersGetUsersResponseApplicationJson([final void Function(UsersGetUsersResponseApplicationJsonBuilder)? b]) =
      _$UsersGetUsersResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUsersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersResponseApplicationJson> get serializer =>
      const _$UsersGetUsersResponseApplicationJsonSerializer();
}

class _$UsersGetUsersResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetUsersResponseApplicationJson> {
  const _$UsersGetUsersResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [UsersGetUsersResponseApplicationJson, _$UsersGetUsersResponseApplicationJson];

  @override
  String get wireName => 'UsersGetUsersResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersGetUsersResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersGetUsersResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersGetUsersResponseApplicationJson_Ocs))!
                as UsersGetUsersResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersAddUserResponseApplicationJson_Ocs_DataInterface {
  String get id;
}

abstract class UsersAddUserResponseApplicationJson_Ocs_Data
    implements
        UsersAddUserResponseApplicationJson_Ocs_DataInterface,
        Built<UsersAddUserResponseApplicationJson_Ocs_Data, UsersAddUserResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersAddUserResponseApplicationJson_Ocs_Data([
    final void Function(UsersAddUserResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersAddUserResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersAddUserResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddUserResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersAddUserResponseApplicationJson_Ocs_Data> get serializer =>
      const _$UsersAddUserResponseApplicationJson_Ocs_DataSerializer();
}

class _$UsersAddUserResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<UsersAddUserResponseApplicationJson_Ocs_Data> {
  const _$UsersAddUserResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersAddUserResponseApplicationJson_Ocs_Data, _$UsersAddUserResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'UsersAddUserResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersAddUserResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  UsersAddUserResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersAddUserResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersAddUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersAddUserResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersAddUserResponseApplicationJson_Ocs
    implements
        UsersAddUserResponseApplicationJson_OcsInterface,
        Built<UsersAddUserResponseApplicationJson_Ocs, UsersAddUserResponseApplicationJson_OcsBuilder> {
  factory UsersAddUserResponseApplicationJson_Ocs([
    final void Function(UsersAddUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersAddUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersAddUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersAddUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersAddUserResponseApplicationJson_OcsSerializer();
}

class _$UsersAddUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersAddUserResponseApplicationJson_Ocs> {
  const _$UsersAddUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersAddUserResponseApplicationJson_Ocs, _$UsersAddUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersAddUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersAddUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UsersAddUserResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  UsersAddUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersAddUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersAddUserResponseApplicationJson_Ocs_Data),
            )! as UsersAddUserResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersAddUserResponseApplicationJsonInterface {
  UsersAddUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersAddUserResponseApplicationJson
    implements
        UsersAddUserResponseApplicationJsonInterface,
        Built<UsersAddUserResponseApplicationJson, UsersAddUserResponseApplicationJsonBuilder> {
  factory UsersAddUserResponseApplicationJson([final void Function(UsersAddUserResponseApplicationJsonBuilder)? b]) =
      _$UsersAddUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersAddUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersAddUserResponseApplicationJson> get serializer =>
      const _$UsersAddUserResponseApplicationJsonSerializer();
}

class _$UsersAddUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersAddUserResponseApplicationJson> {
  const _$UsersAddUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [UsersAddUserResponseApplicationJson, _$UsersAddUserResponseApplicationJson];

  @override
  String get wireName => 'UsersAddUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersAddUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersAddUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersAddUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersAddUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersAddUserResponseApplicationJson_Ocs))!
                as UsersAddUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
}

abstract class UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    final void Function(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      const _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer();
}

class _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer
    implements StructuredSerializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1> {
  const _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer();

  @override
  Iterable<Type> get types => const [
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
        _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
      ];

  @override
  String get wireName => 'UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersInterface {
  UserDetails? get userDetails;
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
      get usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1;
}

abstract class UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users
    implements
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersInterface,
        Built<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users,
            UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder> {
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users([
    final void Function(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users> get serializer =>
      _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._userDetails, b._usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1]
        .singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError(
        "Need exactly one of 'userDetails', 'usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1' for ${b._data}",
      );
    }
  }
}

class _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer
    implements PrimitiveSerializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users> {
  @override
  final Iterable<Type> types = const [
    UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users,
    _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users,
  ];

  @override
  final String wireName = 'UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users';

  @override
  Object serialize(
    final Serializers serializers,
    final UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(UserDetails))! as UserDetails;
      result.userDetails.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1;
      result.usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
}

abstract class UsersGetUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        UsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data,
            UsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data([
    final void Function(UsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$UsersGetUsersDetailsResponseApplicationJson_Ocs_DataSerializer();
}

class _$UsersGetUsersDetailsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<UsersGetUsersDetailsResponseApplicationJson_Ocs_Data> {
  const _$UsersGetUsersDetailsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data,
        _$UsersGetUsersDetailsResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'UsersGetUsersDetailsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersDetailsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'users',
      serializers.serialize(
        object.users,
        specifiedType: const FullType(
          BuiltMap,
          [FullType(String), FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
      ),
    ];
    return result;
  }

  @override
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users),
              ]),
            )! as BuiltMap<String, UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetUsersDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetUsersDetailsResponseApplicationJson_Ocs
    implements
        UsersGetUsersDetailsResponseApplicationJson_OcsInterface,
        Built<UsersGetUsersDetailsResponseApplicationJson_Ocs, UsersGetUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs([
    final void Function(UsersGetUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetUsersDetailsResponseApplicationJson_OcsSerializer();
}

class _$UsersGetUsersDetailsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetUsersDetailsResponseApplicationJson_Ocs> {
  const _$UsersGetUsersDetailsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUsersDetailsResponseApplicationJson_Ocs, _$UsersGetUsersDetailsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersGetUsersDetailsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersDetailsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  UsersGetUsersDetailsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersDetailsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data),
            )! as UsersGetUsersDetailsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersDetailsResponseApplicationJsonInterface {
  UsersGetUsersDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUsersDetailsResponseApplicationJson
    implements
        UsersGetUsersDetailsResponseApplicationJsonInterface,
        Built<UsersGetUsersDetailsResponseApplicationJson, UsersGetUsersDetailsResponseApplicationJsonBuilder> {
  factory UsersGetUsersDetailsResponseApplicationJson([
    final void Function(UsersGetUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersDetailsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersDetailsResponseApplicationJson> get serializer =>
      const _$UsersGetUsersDetailsResponseApplicationJsonSerializer();
}

class _$UsersGetUsersDetailsResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetUsersDetailsResponseApplicationJson> {
  const _$UsersGetUsersDetailsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUsersDetailsResponseApplicationJson, _$UsersGetUsersDetailsResponseApplicationJson];

  @override
  String get wireName => 'UsersGetUsersDetailsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersDetailsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersGetUsersDetailsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersDetailsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs),
            )! as UsersGetUsersDetailsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    final void Function(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      const _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer();
}

class _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer
    implements StructuredSerializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1> {
  const _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Serializer();

  @override
  Iterable<Type> get types => const [
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
        _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
      ];

  @override
  String get wireName => 'UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersInterface {
  UserDetails? get userDetails;
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
      get usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users
    implements
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersInterface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users,
            UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users([
    final void Function(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users> get serializer =>
      _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._userDetails, b._usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1]
        .singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError(
        "Need exactly one of 'userDetails', 'usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1' for ${b._data}",
      );
    }
  }
}

class _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer
    implements PrimitiveSerializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users> {
  @override
  final Iterable<Type> types = const [
    UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users,
    _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users,
  ];

  @override
  final String wireName = 'UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users';

  @override
  Object serialize(
    final Serializers serializers,
    final UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(UserDetails))! as UserDetails;
      result.userDetails.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1;
      result.usersGetDisabledUsersDetailsResponseApplicationJsonOcsDataUsers1.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data,
            UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data([
    final void Function(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataSerializer();
}

class _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data> {
  const _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data,
        _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'users',
      serializers.serialize(
        object.users,
        specifiedType: const FullType(
          BuiltMap,
          [FullType(String), FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
      ),
    ];
    return result;
  }

  @override
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users),
              ]),
            )! as BuiltMap<String, UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetDisabledUsersDetailsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs
    implements
        UsersGetDisabledUsersDetailsResponseApplicationJson_OcsInterface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs,
            UsersGetDisabledUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs([
    final void Function(UsersGetDisabledUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetDisabledUsersDetailsResponseApplicationJson_OcsSerializer();
}

class _$UsersGetDisabledUsersDetailsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs> {
  const _$UsersGetDisabledUsersDetailsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs,
        _$UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetDisabledUsersDetailsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data),
            )! as UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetDisabledUsersDetailsResponseApplicationJsonInterface {
  UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetDisabledUsersDetailsResponseApplicationJson
    implements
        UsersGetDisabledUsersDetailsResponseApplicationJsonInterface,
        Built<UsersGetDisabledUsersDetailsResponseApplicationJson,
            UsersGetDisabledUsersDetailsResponseApplicationJsonBuilder> {
  factory UsersGetDisabledUsersDetailsResponseApplicationJson([
    final void Function(UsersGetDisabledUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetDisabledUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetDisabledUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetDisabledUsersDetailsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetDisabledUsersDetailsResponseApplicationJson> get serializer =>
      const _$UsersGetDisabledUsersDetailsResponseApplicationJsonSerializer();
}

class _$UsersGetDisabledUsersDetailsResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetDisabledUsersDetailsResponseApplicationJson> {
  const _$UsersGetDisabledUsersDetailsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetDisabledUsersDetailsResponseApplicationJson,
        _$UsersGetDisabledUsersDetailsResponseApplicationJson,
      ];

  @override
  String get wireName => 'UsersGetDisabledUsersDetailsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetDisabledUsersDetailsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UsersGetDisabledUsersDetailsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetDisabledUsersDetailsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs),
            )! as UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersSearchByPhoneNumbersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, String> get data;
}

abstract class UsersSearchByPhoneNumbersResponseApplicationJson_Ocs
    implements
        UsersSearchByPhoneNumbersResponseApplicationJson_OcsInterface,
        Built<UsersSearchByPhoneNumbersResponseApplicationJson_Ocs,
            UsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder> {
  factory UsersSearchByPhoneNumbersResponseApplicationJson_Ocs([
    final void Function(UsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersSearchByPhoneNumbersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersSearchByPhoneNumbersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersSearchByPhoneNumbersResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersSearchByPhoneNumbersResponseApplicationJson_Ocs> get serializer =>
      const _$UsersSearchByPhoneNumbersResponseApplicationJson_OcsSerializer();
}

class _$UsersSearchByPhoneNumbersResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersSearchByPhoneNumbersResponseApplicationJson_Ocs> {
  const _$UsersSearchByPhoneNumbersResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UsersSearchByPhoneNumbersResponseApplicationJson_Ocs,
        _$UsersSearchByPhoneNumbersResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UsersSearchByPhoneNumbersResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersSearchByPhoneNumbersResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)])),
    ];
    return result;
  }

  @override
  UsersSearchByPhoneNumbersResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
            )! as BuiltMap<String, String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersSearchByPhoneNumbersResponseApplicationJsonInterface {
  UsersSearchByPhoneNumbersResponseApplicationJson_Ocs get ocs;
}

abstract class UsersSearchByPhoneNumbersResponseApplicationJson
    implements
        UsersSearchByPhoneNumbersResponseApplicationJsonInterface,
        Built<UsersSearchByPhoneNumbersResponseApplicationJson,
            UsersSearchByPhoneNumbersResponseApplicationJsonBuilder> {
  factory UsersSearchByPhoneNumbersResponseApplicationJson([
    final void Function(UsersSearchByPhoneNumbersResponseApplicationJsonBuilder)? b,
  ]) = _$UsersSearchByPhoneNumbersResponseApplicationJson;

  // coverage:ignore-start
  const UsersSearchByPhoneNumbersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersSearchByPhoneNumbersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersSearchByPhoneNumbersResponseApplicationJson> get serializer =>
      const _$UsersSearchByPhoneNumbersResponseApplicationJsonSerializer();
}

class _$UsersSearchByPhoneNumbersResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersSearchByPhoneNumbersResponseApplicationJson> {
  const _$UsersSearchByPhoneNumbersResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersSearchByPhoneNumbersResponseApplicationJson, _$UsersSearchByPhoneNumbersResponseApplicationJson];

  @override
  String get wireName => 'UsersSearchByPhoneNumbersResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersSearchByPhoneNumbersResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UsersSearchByPhoneNumbersResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UsersSearchByPhoneNumbersResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersSearchByPhoneNumbersResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersSearchByPhoneNumbersResponseApplicationJson_Ocs),
            )! as UsersSearchByPhoneNumbersResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UserDetails get data;
}

abstract class UsersGetUserResponseApplicationJson_Ocs
    implements
        UsersGetUserResponseApplicationJson_OcsInterface,
        Built<UsersGetUserResponseApplicationJson_Ocs, UsersGetUserResponseApplicationJson_OcsBuilder> {
  factory UsersGetUserResponseApplicationJson_Ocs([
    final void Function(UsersGetUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetUserResponseApplicationJson_OcsSerializer();
}

class _$UsersGetUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetUserResponseApplicationJson_Ocs> {
  const _$UsersGetUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUserResponseApplicationJson_Ocs, _$UsersGetUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersGetUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserDetails)),
    ];
    return result;
  }

  @override
  UsersGetUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetails))! as UserDetails,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUserResponseApplicationJsonInterface {
  UsersGetUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUserResponseApplicationJson
    implements
        UsersGetUserResponseApplicationJsonInterface,
        Built<UsersGetUserResponseApplicationJson, UsersGetUserResponseApplicationJsonBuilder> {
  factory UsersGetUserResponseApplicationJson([final void Function(UsersGetUserResponseApplicationJsonBuilder)? b]) =
      _$UsersGetUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUserResponseApplicationJson> get serializer =>
      const _$UsersGetUserResponseApplicationJsonSerializer();
}

class _$UsersGetUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetUserResponseApplicationJson> {
  const _$UsersGetUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [UsersGetUserResponseApplicationJson, _$UsersGetUserResponseApplicationJson];

  @override
  String get wireName => 'UsersGetUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersGetUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersGetUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersGetUserResponseApplicationJson_Ocs))!
                as UsersGetUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersEditUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersEditUserResponseApplicationJson_Ocs
    implements
        UsersEditUserResponseApplicationJson_OcsInterface,
        Built<UsersEditUserResponseApplicationJson_Ocs, UsersEditUserResponseApplicationJson_OcsBuilder> {
  factory UsersEditUserResponseApplicationJson_Ocs([
    final void Function(UsersEditUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersEditUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersEditUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersEditUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersEditUserResponseApplicationJson_OcsSerializer();
}

class _$UsersEditUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersEditUserResponseApplicationJson_Ocs> {
  const _$UsersEditUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersEditUserResponseApplicationJson_Ocs, _$UsersEditUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersEditUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersEditUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersEditUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersEditUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersEditUserResponseApplicationJsonInterface {
  UsersEditUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersEditUserResponseApplicationJson
    implements
        UsersEditUserResponseApplicationJsonInterface,
        Built<UsersEditUserResponseApplicationJson, UsersEditUserResponseApplicationJsonBuilder> {
  factory UsersEditUserResponseApplicationJson([final void Function(UsersEditUserResponseApplicationJsonBuilder)? b]) =
      _$UsersEditUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersEditUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersEditUserResponseApplicationJson> get serializer =>
      const _$UsersEditUserResponseApplicationJsonSerializer();
}

class _$UsersEditUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersEditUserResponseApplicationJson> {
  const _$UsersEditUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [UsersEditUserResponseApplicationJson, _$UsersEditUserResponseApplicationJson];

  @override
  String get wireName => 'UsersEditUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersEditUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersEditUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersEditUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersEditUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersEditUserResponseApplicationJson_Ocs))!
                as UsersEditUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersDeleteUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersDeleteUserResponseApplicationJson_Ocs
    implements
        UsersDeleteUserResponseApplicationJson_OcsInterface,
        Built<UsersDeleteUserResponseApplicationJson_Ocs, UsersDeleteUserResponseApplicationJson_OcsBuilder> {
  factory UsersDeleteUserResponseApplicationJson_Ocs([
    final void Function(UsersDeleteUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersDeleteUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersDeleteUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDeleteUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersDeleteUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersDeleteUserResponseApplicationJson_OcsSerializer();
}

class _$UsersDeleteUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersDeleteUserResponseApplicationJson_Ocs> {
  const _$UsersDeleteUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersDeleteUserResponseApplicationJson_Ocs, _$UsersDeleteUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersDeleteUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersDeleteUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersDeleteUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersDeleteUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersDeleteUserResponseApplicationJsonInterface {
  UsersDeleteUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersDeleteUserResponseApplicationJson
    implements
        UsersDeleteUserResponseApplicationJsonInterface,
        Built<UsersDeleteUserResponseApplicationJson, UsersDeleteUserResponseApplicationJsonBuilder> {
  factory UsersDeleteUserResponseApplicationJson([
    final void Function(UsersDeleteUserResponseApplicationJsonBuilder)? b,
  ]) = _$UsersDeleteUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersDeleteUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDeleteUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersDeleteUserResponseApplicationJson> get serializer =>
      const _$UsersDeleteUserResponseApplicationJsonSerializer();
}

class _$UsersDeleteUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersDeleteUserResponseApplicationJson> {
  const _$UsersDeleteUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [UsersDeleteUserResponseApplicationJson, _$UsersDeleteUserResponseApplicationJson];

  @override
  String get wireName => 'UsersDeleteUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersDeleteUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersDeleteUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersDeleteUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersDeleteUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersDeleteUserResponseApplicationJson_Ocs))!
                as UsersDeleteUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetCurrentUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UserDetails get data;
}

abstract class UsersGetCurrentUserResponseApplicationJson_Ocs
    implements
        UsersGetCurrentUserResponseApplicationJson_OcsInterface,
        Built<UsersGetCurrentUserResponseApplicationJson_Ocs, UsersGetCurrentUserResponseApplicationJson_OcsBuilder> {
  factory UsersGetCurrentUserResponseApplicationJson_Ocs([
    final void Function(UsersGetCurrentUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetCurrentUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetCurrentUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetCurrentUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetCurrentUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetCurrentUserResponseApplicationJson_OcsSerializer();
}

class _$UsersGetCurrentUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetCurrentUserResponseApplicationJson_Ocs> {
  const _$UsersGetCurrentUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetCurrentUserResponseApplicationJson_Ocs, _$UsersGetCurrentUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersGetCurrentUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetCurrentUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserDetails)),
    ];
    return result;
  }

  @override
  UsersGetCurrentUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetCurrentUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserDetails))! as UserDetails,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetCurrentUserResponseApplicationJsonInterface {
  UsersGetCurrentUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetCurrentUserResponseApplicationJson
    implements
        UsersGetCurrentUserResponseApplicationJsonInterface,
        Built<UsersGetCurrentUserResponseApplicationJson, UsersGetCurrentUserResponseApplicationJsonBuilder> {
  factory UsersGetCurrentUserResponseApplicationJson([
    final void Function(UsersGetCurrentUserResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetCurrentUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetCurrentUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetCurrentUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetCurrentUserResponseApplicationJson> get serializer =>
      const _$UsersGetCurrentUserResponseApplicationJsonSerializer();
}

class _$UsersGetCurrentUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetCurrentUserResponseApplicationJson> {
  const _$UsersGetCurrentUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetCurrentUserResponseApplicationJson, _$UsersGetCurrentUserResponseApplicationJson];

  @override
  String get wireName => 'UsersGetCurrentUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetCurrentUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersGetCurrentUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersGetCurrentUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetCurrentUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetCurrentUserResponseApplicationJson_Ocs),
            )! as UsersGetCurrentUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetEditableFieldsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class UsersGetEditableFieldsResponseApplicationJson_Ocs
    implements
        UsersGetEditableFieldsResponseApplicationJson_OcsInterface,
        Built<UsersGetEditableFieldsResponseApplicationJson_Ocs,
            UsersGetEditableFieldsResponseApplicationJson_OcsBuilder> {
  factory UsersGetEditableFieldsResponseApplicationJson_Ocs([
    final void Function(UsersGetEditableFieldsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetEditableFieldsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetEditableFieldsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetEditableFieldsResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetEditableFieldsResponseApplicationJson_OcsSerializer();
}

class _$UsersGetEditableFieldsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetEditableFieldsResponseApplicationJson_Ocs> {
  const _$UsersGetEditableFieldsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetEditableFieldsResponseApplicationJson_Ocs, _$UsersGetEditableFieldsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersGetEditableFieldsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetEditableFieldsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  UsersGetEditableFieldsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetEditableFieldsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetEditableFieldsResponseApplicationJsonInterface {
  UsersGetEditableFieldsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetEditableFieldsResponseApplicationJson
    implements
        UsersGetEditableFieldsResponseApplicationJsonInterface,
        Built<UsersGetEditableFieldsResponseApplicationJson, UsersGetEditableFieldsResponseApplicationJsonBuilder> {
  factory UsersGetEditableFieldsResponseApplicationJson([
    final void Function(UsersGetEditableFieldsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetEditableFieldsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetEditableFieldsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetEditableFieldsResponseApplicationJson> get serializer =>
      const _$UsersGetEditableFieldsResponseApplicationJsonSerializer();
}

class _$UsersGetEditableFieldsResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetEditableFieldsResponseApplicationJson> {
  const _$UsersGetEditableFieldsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetEditableFieldsResponseApplicationJson, _$UsersGetEditableFieldsResponseApplicationJson];

  @override
  String get wireName => 'UsersGetEditableFieldsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetEditableFieldsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UsersGetEditableFieldsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UsersGetEditableFieldsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetEditableFieldsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetEditableFieldsResponseApplicationJson_Ocs),
            )! as UsersGetEditableFieldsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetEditableFieldsForUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class UsersGetEditableFieldsForUserResponseApplicationJson_Ocs
    implements
        UsersGetEditableFieldsForUserResponseApplicationJson_OcsInterface,
        Built<UsersGetEditableFieldsForUserResponseApplicationJson_Ocs,
            UsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder> {
  factory UsersGetEditableFieldsForUserResponseApplicationJson_Ocs([
    final void Function(UsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetEditableFieldsForUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetEditableFieldsForUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsForUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetEditableFieldsForUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetEditableFieldsForUserResponseApplicationJson_OcsSerializer();
}

class _$UsersGetEditableFieldsForUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetEditableFieldsForUserResponseApplicationJson_Ocs> {
  const _$UsersGetEditableFieldsForUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetEditableFieldsForUserResponseApplicationJson_Ocs,
        _$UsersGetEditableFieldsForUserResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UsersGetEditableFieldsForUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetEditableFieldsForUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  UsersGetEditableFieldsForUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetEditableFieldsForUserResponseApplicationJsonInterface {
  UsersGetEditableFieldsForUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetEditableFieldsForUserResponseApplicationJson
    implements
        UsersGetEditableFieldsForUserResponseApplicationJsonInterface,
        Built<UsersGetEditableFieldsForUserResponseApplicationJson,
            UsersGetEditableFieldsForUserResponseApplicationJsonBuilder> {
  factory UsersGetEditableFieldsForUserResponseApplicationJson([
    final void Function(UsersGetEditableFieldsForUserResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetEditableFieldsForUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetEditableFieldsForUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetEditableFieldsForUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetEditableFieldsForUserResponseApplicationJson> get serializer =>
      const _$UsersGetEditableFieldsForUserResponseApplicationJsonSerializer();
}

class _$UsersGetEditableFieldsForUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetEditableFieldsForUserResponseApplicationJson> {
  const _$UsersGetEditableFieldsForUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetEditableFieldsForUserResponseApplicationJson,
        _$UsersGetEditableFieldsForUserResponseApplicationJson,
      ];

  @override
  String get wireName => 'UsersGetEditableFieldsForUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetEditableFieldsForUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UsersGetEditableFieldsForUserResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UsersGetEditableFieldsForUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetEditableFieldsForUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetEditableFieldsForUserResponseApplicationJson_Ocs),
            )! as UsersGetEditableFieldsForUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersEditUserMultiValueResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersEditUserMultiValueResponseApplicationJson_Ocs
    implements
        UsersEditUserMultiValueResponseApplicationJson_OcsInterface,
        Built<UsersEditUserMultiValueResponseApplicationJson_Ocs,
            UsersEditUserMultiValueResponseApplicationJson_OcsBuilder> {
  factory UsersEditUserMultiValueResponseApplicationJson_Ocs([
    final void Function(UsersEditUserMultiValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersEditUserMultiValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersEditUserMultiValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserMultiValueResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersEditUserMultiValueResponseApplicationJson_Ocs> get serializer =>
      const _$UsersEditUserMultiValueResponseApplicationJson_OcsSerializer();
}

class _$UsersEditUserMultiValueResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersEditUserMultiValueResponseApplicationJson_Ocs> {
  const _$UsersEditUserMultiValueResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersEditUserMultiValueResponseApplicationJson_Ocs, _$UsersEditUserMultiValueResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersEditUserMultiValueResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersEditUserMultiValueResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersEditUserMultiValueResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersEditUserMultiValueResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersEditUserMultiValueResponseApplicationJsonInterface {
  UsersEditUserMultiValueResponseApplicationJson_Ocs get ocs;
}

abstract class UsersEditUserMultiValueResponseApplicationJson
    implements
        UsersEditUserMultiValueResponseApplicationJsonInterface,
        Built<UsersEditUserMultiValueResponseApplicationJson, UsersEditUserMultiValueResponseApplicationJsonBuilder> {
  factory UsersEditUserMultiValueResponseApplicationJson([
    final void Function(UsersEditUserMultiValueResponseApplicationJsonBuilder)? b,
  ]) = _$UsersEditUserMultiValueResponseApplicationJson;

  // coverage:ignore-start
  const UsersEditUserMultiValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEditUserMultiValueResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersEditUserMultiValueResponseApplicationJson> get serializer =>
      const _$UsersEditUserMultiValueResponseApplicationJsonSerializer();
}

class _$UsersEditUserMultiValueResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersEditUserMultiValueResponseApplicationJson> {
  const _$UsersEditUserMultiValueResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersEditUserMultiValueResponseApplicationJson, _$UsersEditUserMultiValueResponseApplicationJson];

  @override
  String get wireName => 'UsersEditUserMultiValueResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersEditUserMultiValueResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UsersEditUserMultiValueResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UsersEditUserMultiValueResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersEditUserMultiValueResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersEditUserMultiValueResponseApplicationJson_Ocs),
            )! as UsersEditUserMultiValueResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersWipeUserDevicesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersWipeUserDevicesResponseApplicationJson_Ocs
    implements
        UsersWipeUserDevicesResponseApplicationJson_OcsInterface,
        Built<UsersWipeUserDevicesResponseApplicationJson_Ocs, UsersWipeUserDevicesResponseApplicationJson_OcsBuilder> {
  factory UsersWipeUserDevicesResponseApplicationJson_Ocs([
    final void Function(UsersWipeUserDevicesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersWipeUserDevicesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersWipeUserDevicesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersWipeUserDevicesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersWipeUserDevicesResponseApplicationJson_Ocs> get serializer =>
      const _$UsersWipeUserDevicesResponseApplicationJson_OcsSerializer();
}

class _$UsersWipeUserDevicesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersWipeUserDevicesResponseApplicationJson_Ocs> {
  const _$UsersWipeUserDevicesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersWipeUserDevicesResponseApplicationJson_Ocs, _$UsersWipeUserDevicesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersWipeUserDevicesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersWipeUserDevicesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersWipeUserDevicesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersWipeUserDevicesResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersWipeUserDevicesResponseApplicationJsonInterface {
  UsersWipeUserDevicesResponseApplicationJson_Ocs get ocs;
}

abstract class UsersWipeUserDevicesResponseApplicationJson
    implements
        UsersWipeUserDevicesResponseApplicationJsonInterface,
        Built<UsersWipeUserDevicesResponseApplicationJson, UsersWipeUserDevicesResponseApplicationJsonBuilder> {
  factory UsersWipeUserDevicesResponseApplicationJson([
    final void Function(UsersWipeUserDevicesResponseApplicationJsonBuilder)? b,
  ]) = _$UsersWipeUserDevicesResponseApplicationJson;

  // coverage:ignore-start
  const UsersWipeUserDevicesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersWipeUserDevicesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersWipeUserDevicesResponseApplicationJson> get serializer =>
      const _$UsersWipeUserDevicesResponseApplicationJsonSerializer();
}

class _$UsersWipeUserDevicesResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersWipeUserDevicesResponseApplicationJson> {
  const _$UsersWipeUserDevicesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersWipeUserDevicesResponseApplicationJson, _$UsersWipeUserDevicesResponseApplicationJson];

  @override
  String get wireName => 'UsersWipeUserDevicesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersWipeUserDevicesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersWipeUserDevicesResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersWipeUserDevicesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersWipeUserDevicesResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersWipeUserDevicesResponseApplicationJson_Ocs),
            )! as UsersWipeUserDevicesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersEnableUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersEnableUserResponseApplicationJson_Ocs
    implements
        UsersEnableUserResponseApplicationJson_OcsInterface,
        Built<UsersEnableUserResponseApplicationJson_Ocs, UsersEnableUserResponseApplicationJson_OcsBuilder> {
  factory UsersEnableUserResponseApplicationJson_Ocs([
    final void Function(UsersEnableUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersEnableUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersEnableUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEnableUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersEnableUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersEnableUserResponseApplicationJson_OcsSerializer();
}

class _$UsersEnableUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersEnableUserResponseApplicationJson_Ocs> {
  const _$UsersEnableUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersEnableUserResponseApplicationJson_Ocs, _$UsersEnableUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersEnableUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersEnableUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersEnableUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersEnableUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersEnableUserResponseApplicationJsonInterface {
  UsersEnableUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersEnableUserResponseApplicationJson
    implements
        UsersEnableUserResponseApplicationJsonInterface,
        Built<UsersEnableUserResponseApplicationJson, UsersEnableUserResponseApplicationJsonBuilder> {
  factory UsersEnableUserResponseApplicationJson([
    final void Function(UsersEnableUserResponseApplicationJsonBuilder)? b,
  ]) = _$UsersEnableUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersEnableUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersEnableUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersEnableUserResponseApplicationJson> get serializer =>
      const _$UsersEnableUserResponseApplicationJsonSerializer();
}

class _$UsersEnableUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersEnableUserResponseApplicationJson> {
  const _$UsersEnableUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [UsersEnableUserResponseApplicationJson, _$UsersEnableUserResponseApplicationJson];

  @override
  String get wireName => 'UsersEnableUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersEnableUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersEnableUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersEnableUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersEnableUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersEnableUserResponseApplicationJson_Ocs))!
                as UsersEnableUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersDisableUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersDisableUserResponseApplicationJson_Ocs
    implements
        UsersDisableUserResponseApplicationJson_OcsInterface,
        Built<UsersDisableUserResponseApplicationJson_Ocs, UsersDisableUserResponseApplicationJson_OcsBuilder> {
  factory UsersDisableUserResponseApplicationJson_Ocs([
    final void Function(UsersDisableUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersDisableUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersDisableUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDisableUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersDisableUserResponseApplicationJson_Ocs> get serializer =>
      const _$UsersDisableUserResponseApplicationJson_OcsSerializer();
}

class _$UsersDisableUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersDisableUserResponseApplicationJson_Ocs> {
  const _$UsersDisableUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersDisableUserResponseApplicationJson_Ocs, _$UsersDisableUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersDisableUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersDisableUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersDisableUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersDisableUserResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersDisableUserResponseApplicationJsonInterface {
  UsersDisableUserResponseApplicationJson_Ocs get ocs;
}

abstract class UsersDisableUserResponseApplicationJson
    implements
        UsersDisableUserResponseApplicationJsonInterface,
        Built<UsersDisableUserResponseApplicationJson, UsersDisableUserResponseApplicationJsonBuilder> {
  factory UsersDisableUserResponseApplicationJson([
    final void Function(UsersDisableUserResponseApplicationJsonBuilder)? b,
  ]) = _$UsersDisableUserResponseApplicationJson;

  // coverage:ignore-start
  const UsersDisableUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersDisableUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersDisableUserResponseApplicationJson> get serializer =>
      const _$UsersDisableUserResponseApplicationJsonSerializer();
}

class _$UsersDisableUserResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersDisableUserResponseApplicationJson> {
  const _$UsersDisableUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersDisableUserResponseApplicationJson, _$UsersDisableUserResponseApplicationJson];

  @override
  String get wireName => 'UsersDisableUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersDisableUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersDisableUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersDisableUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersDisableUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersDisableUserResponseApplicationJson_Ocs))!
                as UsersDisableUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
}

abstract class UsersGetUsersGroupsResponseApplicationJson_Ocs_Data
    implements
        UsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterface,
        Built<UsersGetUsersGroupsResponseApplicationJson_Ocs_Data,
            UsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder> {
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs_Data([
    final void Function(UsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UsersGetUsersGroupsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UsersGetUsersGroupsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersGroupsResponseApplicationJson_Ocs_Data> get serializer =>
      const _$UsersGetUsersGroupsResponseApplicationJson_Ocs_DataSerializer();
}

class _$UsersGetUsersGroupsResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<UsersGetUsersGroupsResponseApplicationJson_Ocs_Data> {
  const _$UsersGetUsersGroupsResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetUsersGroupsResponseApplicationJson_Ocs_Data,
        _$UsersGetUsersGroupsResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'UsersGetUsersGroupsResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersGroupsResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  UsersGetUsersGroupsResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersGroupsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UsersGetUsersGroupsResponseApplicationJson_Ocs_Data get data;
}

abstract class UsersGetUsersGroupsResponseApplicationJson_Ocs
    implements
        UsersGetUsersGroupsResponseApplicationJson_OcsInterface,
        Built<UsersGetUsersGroupsResponseApplicationJson_Ocs, UsersGetUsersGroupsResponseApplicationJson_OcsBuilder> {
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs([
    final void Function(UsersGetUsersGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUsersGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUsersGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersGroupsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersGroupsResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetUsersGroupsResponseApplicationJson_OcsSerializer();
}

class _$UsersGetUsersGroupsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetUsersGroupsResponseApplicationJson_Ocs> {
  const _$UsersGetUsersGroupsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUsersGroupsResponseApplicationJson_Ocs, _$UsersGetUsersGroupsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersGetUsersGroupsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersGroupsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  UsersGetUsersGroupsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersGroupsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs_Data),
            )! as UsersGetUsersGroupsResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUsersGroupsResponseApplicationJsonInterface {
  UsersGetUsersGroupsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUsersGroupsResponseApplicationJson
    implements
        UsersGetUsersGroupsResponseApplicationJsonInterface,
        Built<UsersGetUsersGroupsResponseApplicationJson, UsersGetUsersGroupsResponseApplicationJsonBuilder> {
  factory UsersGetUsersGroupsResponseApplicationJson([
    final void Function(UsersGetUsersGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetUsersGroupsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUsersGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUsersGroupsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUsersGroupsResponseApplicationJson> get serializer =>
      const _$UsersGetUsersGroupsResponseApplicationJsonSerializer();
}

class _$UsersGetUsersGroupsResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetUsersGroupsResponseApplicationJson> {
  const _$UsersGetUsersGroupsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUsersGroupsResponseApplicationJson, _$UsersGetUsersGroupsResponseApplicationJson];

  @override
  String get wireName => 'UsersGetUsersGroupsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUsersGroupsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersGetUsersGroupsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUsersGroupsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs),
            )! as UsersGetUsersGroupsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersAddToGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersAddToGroupResponseApplicationJson_Ocs
    implements
        UsersAddToGroupResponseApplicationJson_OcsInterface,
        Built<UsersAddToGroupResponseApplicationJson_Ocs, UsersAddToGroupResponseApplicationJson_OcsBuilder> {
  factory UsersAddToGroupResponseApplicationJson_Ocs([
    final void Function(UsersAddToGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersAddToGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersAddToGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddToGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersAddToGroupResponseApplicationJson_Ocs> get serializer =>
      const _$UsersAddToGroupResponseApplicationJson_OcsSerializer();
}

class _$UsersAddToGroupResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersAddToGroupResponseApplicationJson_Ocs> {
  const _$UsersAddToGroupResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersAddToGroupResponseApplicationJson_Ocs, _$UsersAddToGroupResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersAddToGroupResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersAddToGroupResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersAddToGroupResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersAddToGroupResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersAddToGroupResponseApplicationJsonInterface {
  UsersAddToGroupResponseApplicationJson_Ocs get ocs;
}

abstract class UsersAddToGroupResponseApplicationJson
    implements
        UsersAddToGroupResponseApplicationJsonInterface,
        Built<UsersAddToGroupResponseApplicationJson, UsersAddToGroupResponseApplicationJsonBuilder> {
  factory UsersAddToGroupResponseApplicationJson([
    final void Function(UsersAddToGroupResponseApplicationJsonBuilder)? b,
  ]) = _$UsersAddToGroupResponseApplicationJson;

  // coverage:ignore-start
  const UsersAddToGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddToGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersAddToGroupResponseApplicationJson> get serializer =>
      const _$UsersAddToGroupResponseApplicationJsonSerializer();
}

class _$UsersAddToGroupResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersAddToGroupResponseApplicationJson> {
  const _$UsersAddToGroupResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [UsersAddToGroupResponseApplicationJson, _$UsersAddToGroupResponseApplicationJson];

  @override
  String get wireName => 'UsersAddToGroupResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersAddToGroupResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersAddToGroupResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersAddToGroupResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersAddToGroupResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersAddToGroupResponseApplicationJson_Ocs))!
                as UsersAddToGroupResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersRemoveFromGroupResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersRemoveFromGroupResponseApplicationJson_Ocs
    implements
        UsersRemoveFromGroupResponseApplicationJson_OcsInterface,
        Built<UsersRemoveFromGroupResponseApplicationJson_Ocs, UsersRemoveFromGroupResponseApplicationJson_OcsBuilder> {
  factory UsersRemoveFromGroupResponseApplicationJson_Ocs([
    final void Function(UsersRemoveFromGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersRemoveFromGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersRemoveFromGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveFromGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersRemoveFromGroupResponseApplicationJson_Ocs> get serializer =>
      const _$UsersRemoveFromGroupResponseApplicationJson_OcsSerializer();
}

class _$UsersRemoveFromGroupResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersRemoveFromGroupResponseApplicationJson_Ocs> {
  const _$UsersRemoveFromGroupResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersRemoveFromGroupResponseApplicationJson_Ocs, _$UsersRemoveFromGroupResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersRemoveFromGroupResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersRemoveFromGroupResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersRemoveFromGroupResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersRemoveFromGroupResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersRemoveFromGroupResponseApplicationJsonInterface {
  UsersRemoveFromGroupResponseApplicationJson_Ocs get ocs;
}

abstract class UsersRemoveFromGroupResponseApplicationJson
    implements
        UsersRemoveFromGroupResponseApplicationJsonInterface,
        Built<UsersRemoveFromGroupResponseApplicationJson, UsersRemoveFromGroupResponseApplicationJsonBuilder> {
  factory UsersRemoveFromGroupResponseApplicationJson([
    final void Function(UsersRemoveFromGroupResponseApplicationJsonBuilder)? b,
  ]) = _$UsersRemoveFromGroupResponseApplicationJson;

  // coverage:ignore-start
  const UsersRemoveFromGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveFromGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersRemoveFromGroupResponseApplicationJson> get serializer =>
      const _$UsersRemoveFromGroupResponseApplicationJsonSerializer();
}

class _$UsersRemoveFromGroupResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersRemoveFromGroupResponseApplicationJson> {
  const _$UsersRemoveFromGroupResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersRemoveFromGroupResponseApplicationJson, _$UsersRemoveFromGroupResponseApplicationJson];

  @override
  String get wireName => 'UsersRemoveFromGroupResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersRemoveFromGroupResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersRemoveFromGroupResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersRemoveFromGroupResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersRemoveFromGroupResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersRemoveFromGroupResponseApplicationJson_Ocs),
            )! as UsersRemoveFromGroupResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs
    implements
        UsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterface,
        Built<UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs,
            UsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder> {
  factory UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs([
    final void Function(UsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs> get serializer =>
      const _$UsersGetUserSubAdminGroupsResponseApplicationJson_OcsSerializer();
}

class _$UsersGetUserSubAdminGroupsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs> {
  const _$UsersGetUserSubAdminGroupsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs,
        _$UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersGetUserSubAdminGroupsResponseApplicationJsonInterface {
  UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs get ocs;
}

abstract class UsersGetUserSubAdminGroupsResponseApplicationJson
    implements
        UsersGetUserSubAdminGroupsResponseApplicationJsonInterface,
        Built<UsersGetUserSubAdminGroupsResponseApplicationJson,
            UsersGetUserSubAdminGroupsResponseApplicationJsonBuilder> {
  factory UsersGetUserSubAdminGroupsResponseApplicationJson([
    final void Function(UsersGetUserSubAdminGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$UsersGetUserSubAdminGroupsResponseApplicationJson;

  // coverage:ignore-start
  const UsersGetUserSubAdminGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersGetUserSubAdminGroupsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersGetUserSubAdminGroupsResponseApplicationJson> get serializer =>
      const _$UsersGetUserSubAdminGroupsResponseApplicationJsonSerializer();
}

class _$UsersGetUserSubAdminGroupsResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersGetUserSubAdminGroupsResponseApplicationJson> {
  const _$UsersGetUserSubAdminGroupsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersGetUserSubAdminGroupsResponseApplicationJson, _$UsersGetUserSubAdminGroupsResponseApplicationJson];

  @override
  String get wireName => 'UsersGetUserSubAdminGroupsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersGetUserSubAdminGroupsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UsersGetUserSubAdminGroupsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersGetUserSubAdminGroupsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs),
            )! as UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersAddSubAdminResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersAddSubAdminResponseApplicationJson_Ocs
    implements
        UsersAddSubAdminResponseApplicationJson_OcsInterface,
        Built<UsersAddSubAdminResponseApplicationJson_Ocs, UsersAddSubAdminResponseApplicationJson_OcsBuilder> {
  factory UsersAddSubAdminResponseApplicationJson_Ocs([
    final void Function(UsersAddSubAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersAddSubAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersAddSubAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddSubAdminResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersAddSubAdminResponseApplicationJson_Ocs> get serializer =>
      const _$UsersAddSubAdminResponseApplicationJson_OcsSerializer();
}

class _$UsersAddSubAdminResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersAddSubAdminResponseApplicationJson_Ocs> {
  const _$UsersAddSubAdminResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersAddSubAdminResponseApplicationJson_Ocs, _$UsersAddSubAdminResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersAddSubAdminResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersAddSubAdminResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersAddSubAdminResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersAddSubAdminResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersAddSubAdminResponseApplicationJsonInterface {
  UsersAddSubAdminResponseApplicationJson_Ocs get ocs;
}

abstract class UsersAddSubAdminResponseApplicationJson
    implements
        UsersAddSubAdminResponseApplicationJsonInterface,
        Built<UsersAddSubAdminResponseApplicationJson, UsersAddSubAdminResponseApplicationJsonBuilder> {
  factory UsersAddSubAdminResponseApplicationJson([
    final void Function(UsersAddSubAdminResponseApplicationJsonBuilder)? b,
  ]) = _$UsersAddSubAdminResponseApplicationJson;

  // coverage:ignore-start
  const UsersAddSubAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersAddSubAdminResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersAddSubAdminResponseApplicationJson> get serializer =>
      const _$UsersAddSubAdminResponseApplicationJsonSerializer();
}

class _$UsersAddSubAdminResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersAddSubAdminResponseApplicationJson> {
  const _$UsersAddSubAdminResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersAddSubAdminResponseApplicationJson, _$UsersAddSubAdminResponseApplicationJson];

  @override
  String get wireName => 'UsersAddSubAdminResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersAddSubAdminResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersAddSubAdminResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersAddSubAdminResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersAddSubAdminResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(UsersAddSubAdminResponseApplicationJson_Ocs))!
                as UsersAddSubAdminResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersRemoveSubAdminResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersRemoveSubAdminResponseApplicationJson_Ocs
    implements
        UsersRemoveSubAdminResponseApplicationJson_OcsInterface,
        Built<UsersRemoveSubAdminResponseApplicationJson_Ocs, UsersRemoveSubAdminResponseApplicationJson_OcsBuilder> {
  factory UsersRemoveSubAdminResponseApplicationJson_Ocs([
    final void Function(UsersRemoveSubAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersRemoveSubAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersRemoveSubAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveSubAdminResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersRemoveSubAdminResponseApplicationJson_Ocs> get serializer =>
      const _$UsersRemoveSubAdminResponseApplicationJson_OcsSerializer();
}

class _$UsersRemoveSubAdminResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersRemoveSubAdminResponseApplicationJson_Ocs> {
  const _$UsersRemoveSubAdminResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersRemoveSubAdminResponseApplicationJson_Ocs, _$UsersRemoveSubAdminResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UsersRemoveSubAdminResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersRemoveSubAdminResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersRemoveSubAdminResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersRemoveSubAdminResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersRemoveSubAdminResponseApplicationJsonInterface {
  UsersRemoveSubAdminResponseApplicationJson_Ocs get ocs;
}

abstract class UsersRemoveSubAdminResponseApplicationJson
    implements
        UsersRemoveSubAdminResponseApplicationJsonInterface,
        Built<UsersRemoveSubAdminResponseApplicationJson, UsersRemoveSubAdminResponseApplicationJsonBuilder> {
  factory UsersRemoveSubAdminResponseApplicationJson([
    final void Function(UsersRemoveSubAdminResponseApplicationJsonBuilder)? b,
  ]) = _$UsersRemoveSubAdminResponseApplicationJson;

  // coverage:ignore-start
  const UsersRemoveSubAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersRemoveSubAdminResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersRemoveSubAdminResponseApplicationJson> get serializer =>
      const _$UsersRemoveSubAdminResponseApplicationJsonSerializer();
}

class _$UsersRemoveSubAdminResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersRemoveSubAdminResponseApplicationJson> {
  const _$UsersRemoveSubAdminResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersRemoveSubAdminResponseApplicationJson, _$UsersRemoveSubAdminResponseApplicationJson];

  @override
  String get wireName => 'UsersRemoveSubAdminResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersRemoveSubAdminResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UsersRemoveSubAdminResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UsersRemoveSubAdminResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersRemoveSubAdminResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersRemoveSubAdminResponseApplicationJson_Ocs),
            )! as UsersRemoveSubAdminResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersResendWelcomeMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UsersResendWelcomeMessageResponseApplicationJson_Ocs
    implements
        UsersResendWelcomeMessageResponseApplicationJson_OcsInterface,
        Built<UsersResendWelcomeMessageResponseApplicationJson_Ocs,
            UsersResendWelcomeMessageResponseApplicationJson_OcsBuilder> {
  factory UsersResendWelcomeMessageResponseApplicationJson_Ocs([
    final void Function(UsersResendWelcomeMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UsersResendWelcomeMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UsersResendWelcomeMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersResendWelcomeMessageResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersResendWelcomeMessageResponseApplicationJson_Ocs> get serializer =>
      const _$UsersResendWelcomeMessageResponseApplicationJson_OcsSerializer();
}

class _$UsersResendWelcomeMessageResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UsersResendWelcomeMessageResponseApplicationJson_Ocs> {
  const _$UsersResendWelcomeMessageResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UsersResendWelcomeMessageResponseApplicationJson_Ocs,
        _$UsersResendWelcomeMessageResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UsersResendWelcomeMessageResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersResendWelcomeMessageResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UsersResendWelcomeMessageResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersResendWelcomeMessageResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UsersResendWelcomeMessageResponseApplicationJsonInterface {
  UsersResendWelcomeMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UsersResendWelcomeMessageResponseApplicationJson
    implements
        UsersResendWelcomeMessageResponseApplicationJsonInterface,
        Built<UsersResendWelcomeMessageResponseApplicationJson,
            UsersResendWelcomeMessageResponseApplicationJsonBuilder> {
  factory UsersResendWelcomeMessageResponseApplicationJson([
    final void Function(UsersResendWelcomeMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UsersResendWelcomeMessageResponseApplicationJson;

  // coverage:ignore-start
  const UsersResendWelcomeMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UsersResendWelcomeMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UsersResendWelcomeMessageResponseApplicationJson> get serializer =>
      const _$UsersResendWelcomeMessageResponseApplicationJsonSerializer();
}

class _$UsersResendWelcomeMessageResponseApplicationJsonSerializer
    implements StructuredSerializer<UsersResendWelcomeMessageResponseApplicationJson> {
  const _$UsersResendWelcomeMessageResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UsersResendWelcomeMessageResponseApplicationJson, _$UsersResendWelcomeMessageResponseApplicationJson];

  @override
  String get wireName => 'UsersResendWelcomeMessageResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UsersResendWelcomeMessageResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UsersResendWelcomeMessageResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UsersResendWelcomeMessageResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UsersResendWelcomeMessageResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UsersResendWelcomeMessageResponseApplicationJson_Ocs),
            )! as UsersResendWelcomeMessageResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_ProvisioningApiInterface {
  String get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool get accountPropertyScopesPublishedEnabled;
}

abstract class Capabilities_ProvisioningApi
    implements
        Capabilities_ProvisioningApiInterface,
        Built<Capabilities_ProvisioningApi, Capabilities_ProvisioningApiBuilder> {
  factory Capabilities_ProvisioningApi([final void Function(Capabilities_ProvisioningApiBuilder)? b]) =
      _$Capabilities_ProvisioningApi;

  // coverage:ignore-start
  const Capabilities_ProvisioningApi._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_ProvisioningApi.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_ProvisioningApi> get serializer => const _$Capabilities_ProvisioningApiSerializer();
}

class _$Capabilities_ProvisioningApiSerializer implements StructuredSerializer<Capabilities_ProvisioningApi> {
  const _$Capabilities_ProvisioningApiSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_ProvisioningApi, _$Capabilities_ProvisioningApi];

  @override
  String get wireName => 'Capabilities_ProvisioningApi';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_ProvisioningApi object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
      'AccountPropertyScopesVersion',
      serializers.serialize(object.accountPropertyScopesVersion, specifiedType: const FullType(int)),
      'AccountPropertyScopesFederatedEnabled',
      serializers.serialize(object.accountPropertyScopesFederatedEnabled, specifiedType: const FullType(bool)),
      'AccountPropertyScopesPublishedEnabled',
      serializers.serialize(object.accountPropertyScopesPublishedEnabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_ProvisioningApi deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_ProvisioningApiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'AccountPropertyScopesVersion':
          result.accountPropertyScopesVersion =
              serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'AccountPropertyScopesFederatedEnabled':
          result.accountPropertyScopesFederatedEnabled =
              serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'AccountPropertyScopesPublishedEnabled':
          result.accountPropertyScopesPublishedEnabled =
              serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  @BuiltValueField(wireName: 'provisioning_api')
  Capabilities_ProvisioningApi get provisioningApi;
}

abstract class Capabilities implements CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([final void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities> get serializer => const _$CapabilitiesSerializer();
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  const _$CapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities, _$Capabilities];

  @override
  String get wireName => 'Capabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'provisioning_api',
      serializers.serialize(object.provisioningApi, specifiedType: const FullType(Capabilities_ProvisioningApi)),
    ];
    return result;
  }

  @override
  Capabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'provisioning_api':
          result.provisioningApi.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_ProvisioningApi))!
                as Capabilities_ProvisioningApi,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(AppConfigGetAppsResponseApplicationJson),
        AppConfigGetAppsResponseApplicationJson.new,
      )
      ..add(AppConfigGetAppsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetAppsResponseApplicationJson_Ocs),
        AppConfigGetAppsResponseApplicationJson_Ocs.new,
      )
      ..add(AppConfigGetAppsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetAppsResponseApplicationJson_Ocs_Data),
        AppConfigGetAppsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(AppConfigGetAppsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(AppConfigGetKeysResponseApplicationJson),
        AppConfigGetKeysResponseApplicationJson.new,
      )
      ..add(AppConfigGetKeysResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetKeysResponseApplicationJson_Ocs),
        AppConfigGetKeysResponseApplicationJson_Ocs.new,
      )
      ..add(AppConfigGetKeysResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetKeysResponseApplicationJson_Ocs_Data),
        AppConfigGetKeysResponseApplicationJson_Ocs_Data.new,
      )
      ..add(AppConfigGetKeysResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetValueResponseApplicationJson),
        AppConfigGetValueResponseApplicationJson.new,
      )
      ..add(AppConfigGetValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetValueResponseApplicationJson_Ocs),
        AppConfigGetValueResponseApplicationJson_Ocs.new,
      )
      ..add(AppConfigGetValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigGetValueResponseApplicationJson_Ocs_Data),
        AppConfigGetValueResponseApplicationJson_Ocs_Data.new,
      )
      ..add(AppConfigGetValueResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigSetValueResponseApplicationJson),
        AppConfigSetValueResponseApplicationJson.new,
      )
      ..add(AppConfigSetValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigSetValueResponseApplicationJson_Ocs),
        AppConfigSetValueResponseApplicationJson_Ocs.new,
      )
      ..add(AppConfigSetValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigDeleteKeyResponseApplicationJson),
        AppConfigDeleteKeyResponseApplicationJson.new,
      )
      ..add(AppConfigDeleteKeyResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppConfigDeleteKeyResponseApplicationJson_Ocs),
        AppConfigDeleteKeyResponseApplicationJson_Ocs.new,
      )
      ..add(AppConfigDeleteKeyResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(AppsGetAppsResponseApplicationJson), AppsGetAppsResponseApplicationJson.new)
      ..add(AppsGetAppsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppsResponseApplicationJson_Ocs),
        AppsGetAppsResponseApplicationJson_Ocs.new,
      )
      ..add(AppsGetAppsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppsResponseApplicationJson_Ocs_Data),
        AppsGetAppsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(AppsGetAppsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppInfoResponseApplicationJson),
        AppsGetAppInfoResponseApplicationJson.new,
      )
      ..add(AppsGetAppInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsGetAppInfoResponseApplicationJson_Ocs),
        AppsGetAppInfoResponseApplicationJson_Ocs.new,
      )
      ..add(AppsGetAppInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(AppInfo), AppInfo.new)
      ..add(AppInfo.serializer)
      ..addBuilderFactory(const FullType(AppsEnableResponseApplicationJson), AppsEnableResponseApplicationJson.new)
      ..add(AppsEnableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsEnableResponseApplicationJson_Ocs),
        AppsEnableResponseApplicationJson_Ocs.new,
      )
      ..add(AppsEnableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(AppsDisableResponseApplicationJson), AppsDisableResponseApplicationJson.new)
      ..add(AppsDisableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppsDisableResponseApplicationJson_Ocs),
        AppsDisableResponseApplicationJson_Ocs.new,
      )
      ..add(AppsDisableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsResponseApplicationJson),
        GroupsGetGroupsResponseApplicationJson.new,
      )
      ..add(GroupsGetGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsResponseApplicationJson_Ocs),
        GroupsGetGroupsResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsGetGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsResponseApplicationJson_Ocs_Data),
        GroupsGetGroupsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(GroupsGetGroupsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(GroupsAddGroupResponseApplicationJson),
        GroupsAddGroupResponseApplicationJson.new,
      )
      ..add(GroupsAddGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsAddGroupResponseApplicationJson_Ocs),
        GroupsAddGroupResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsAddGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsDetailsResponseApplicationJson),
        GroupsGetGroupsDetailsResponseApplicationJson.new,
      )
      ..add(GroupsGetGroupsDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs),
        GroupsGetGroupsDetailsResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsGetGroupsDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data),
        GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(GroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(GroupDetails), GroupDetails.new)
      ..add(GroupDetails.serializer)
      ..addBuilderFactory(const FullType(GroupDetails_Usercount), GroupDetails_Usercount.new)
      ..add(GroupDetails_Usercount.serializer)
      ..addBuilderFactory(const FullType(GroupDetails_Disabled), GroupDetails_Disabled.new)
      ..add(GroupDetails_Disabled.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(GroupDetails)]), ListBuilder<GroupDetails>.new)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersResponseApplicationJson),
        GroupsGetGroupUsersResponseApplicationJson.new,
      )
      ..add(GroupsGetGroupUsersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs),
        GroupsGetGroupUsersResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsGetGroupUsersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersResponseApplicationJson_Ocs_Data),
        GroupsGetGroupUsersResponseApplicationJson_Ocs_Data.new,
      )
      ..add(GroupsGetGroupUsersResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson),
        GroupsGetGroupUsersDetailsResponseApplicationJson.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs),
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data),
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users),
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users.serializer)
      ..addBuilderFactory(const FullType(UserDetails), UserDetails.new)
      ..add(UserDetails.serializer)
      ..addBuilderFactory(const FullType(UserDetails_BackendCapabilities), UserDetails_BackendCapabilities.new)
      ..add(UserDetails_BackendCapabilities.serializer)
      ..addBuilderFactory(const FullType(UserDetailsQuota), UserDetailsQuota.new)
      ..add(UserDetailsQuota.serializer)
      ..addBuilderFactory(const FullType(UserDetailsQuota_Free), UserDetailsQuota_Free.new)
      ..add(UserDetailsQuota_Free.serializer)
      ..addBuilderFactory(const FullType(UserDetailsQuota_Quota), UserDetailsQuota_Quota.new)
      ..add(UserDetailsQuota_Quota.serializer)
      ..addBuilderFactory(const FullType(UserDetailsQuota_Relative), UserDetailsQuota_Relative.new)
      ..add(UserDetailsQuota_Relative.serializer)
      ..addBuilderFactory(const FullType(UserDetailsQuota_Total), UserDetailsQuota_Total.new)
      ..add(UserDetailsQuota_Total.serializer)
      ..addBuilderFactory(const FullType(UserDetailsQuota_Used), UserDetailsQuota_Used.new)
      ..add(UserDetailsQuota_Used.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.new,
      )
      ..add(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
        MapBuilder<String, GroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson),
        GroupsGetSubAdminsOfGroupResponseApplicationJson.new,
      )
      ..add(GroupsGetSubAdminsOfGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs),
        GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupResponseApplicationJson),
        GroupsGetGroupResponseApplicationJson.new,
      )
      ..add(GroupsGetGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupResponseApplicationJson_Ocs),
        GroupsGetGroupResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsGetGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsGetGroupResponseApplicationJson_Ocs_Data),
        GroupsGetGroupResponseApplicationJson_Ocs_Data.new,
      )
      ..add(GroupsGetGroupResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(GroupsUpdateGroupResponseApplicationJson),
        GroupsUpdateGroupResponseApplicationJson.new,
      )
      ..add(GroupsUpdateGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsUpdateGroupResponseApplicationJson_Ocs),
        GroupsUpdateGroupResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsUpdateGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(GroupsDeleteGroupResponseApplicationJson),
        GroupsDeleteGroupResponseApplicationJson.new,
      )
      ..add(GroupsDeleteGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GroupsDeleteGroupResponseApplicationJson_Ocs),
        GroupsDeleteGroupResponseApplicationJson_Ocs.new,
      )
      ..add(GroupsDeleteGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetPreferenceResponseApplicationJson),
        PreferencesSetPreferenceResponseApplicationJson.new,
      )
      ..add(PreferencesSetPreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetPreferenceResponseApplicationJson_Ocs),
        PreferencesSetPreferenceResponseApplicationJson_Ocs.new,
      )
      ..add(PreferencesSetPreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeletePreferenceResponseApplicationJson),
        PreferencesDeletePreferenceResponseApplicationJson.new,
      )
      ..add(PreferencesDeletePreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeletePreferenceResponseApplicationJson_Ocs),
        PreferencesDeletePreferenceResponseApplicationJson_Ocs.new,
      )
      ..add(PreferencesDeletePreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(String)]),
        MapBuilder<String, String>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(String)]),
        ]),
        ContentString<BuiltMap<String, String>>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson),
        PreferencesSetMultiplePreferencesResponseApplicationJson.new,
      )
      ..add(PreferencesSetMultiplePreferencesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs),
        PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.new,
      )
      ..add(PreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson),
        PreferencesDeleteMultiplePreferenceResponseApplicationJson.new,
      )
      ..add(PreferencesDeleteMultiplePreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs),
        PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.new,
      )
      ..add(PreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersResponseApplicationJson),
        UsersGetUsersResponseApplicationJson.new,
      )
      ..add(UsersGetUsersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersResponseApplicationJson_Ocs),
        UsersGetUsersResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetUsersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersResponseApplicationJson_Ocs_Data),
        UsersGetUsersResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UsersGetUsersResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(UsersAddUserResponseApplicationJson), UsersAddUserResponseApplicationJson.new)
      ..add(UsersAddUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddUserResponseApplicationJson_Ocs),
        UsersAddUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersAddUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddUserResponseApplicationJson_Ocs_Data),
        UsersAddUserResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UsersAddUserResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson),
        UsersGetUsersDetailsResponseApplicationJson.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs),
        UsersGetUsersDetailsResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data),
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users),
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.new,
      )
      ..add(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
        MapBuilder<String, UsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson),
        UsersGetDisabledUsersDetailsResponseApplicationJson.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs),
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data),
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users),
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1.new,
      )
      ..add(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
        MapBuilder<String, UsersGetDisabledUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
        MapBuilder<String, BuiltList<String>>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [
            FullType(String),
            FullType(BuiltList, [FullType(String)]),
          ]),
        ]),
        ContentString<BuiltMap<String, BuiltList<String>>>.new,
      )
      ..addBuilderFactory(
        const FullType(UsersSearchByPhoneNumbersResponseApplicationJson),
        UsersSearchByPhoneNumbersResponseApplicationJson.new,
      )
      ..add(UsersSearchByPhoneNumbersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersSearchByPhoneNumbersResponseApplicationJson_Ocs),
        UsersSearchByPhoneNumbersResponseApplicationJson_Ocs.new,
      )
      ..add(UsersSearchByPhoneNumbersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UsersGetUserResponseApplicationJson), UsersGetUserResponseApplicationJson.new)
      ..add(UsersGetUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUserResponseApplicationJson_Ocs),
        UsersGetUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserResponseApplicationJson),
        UsersEditUserResponseApplicationJson.new,
      )
      ..add(UsersEditUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserResponseApplicationJson_Ocs),
        UsersEditUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersEditUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersDeleteUserResponseApplicationJson),
        UsersDeleteUserResponseApplicationJson.new,
      )
      ..add(UsersDeleteUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersDeleteUserResponseApplicationJson_Ocs),
        UsersDeleteUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersDeleteUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetCurrentUserResponseApplicationJson),
        UsersGetCurrentUserResponseApplicationJson.new,
      )
      ..add(UsersGetCurrentUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetCurrentUserResponseApplicationJson_Ocs),
        UsersGetCurrentUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetCurrentUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsResponseApplicationJson),
        UsersGetEditableFieldsResponseApplicationJson.new,
      )
      ..add(UsersGetEditableFieldsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsResponseApplicationJson_Ocs),
        UsersGetEditableFieldsResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetEditableFieldsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsForUserResponseApplicationJson),
        UsersGetEditableFieldsForUserResponseApplicationJson.new,
      )
      ..add(UsersGetEditableFieldsForUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetEditableFieldsForUserResponseApplicationJson_Ocs),
        UsersGetEditableFieldsForUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetEditableFieldsForUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserMultiValueResponseApplicationJson),
        UsersEditUserMultiValueResponseApplicationJson.new,
      )
      ..add(UsersEditUserMultiValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersEditUserMultiValueResponseApplicationJson_Ocs),
        UsersEditUserMultiValueResponseApplicationJson_Ocs.new,
      )
      ..add(UsersEditUserMultiValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersWipeUserDevicesResponseApplicationJson),
        UsersWipeUserDevicesResponseApplicationJson.new,
      )
      ..add(UsersWipeUserDevicesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersWipeUserDevicesResponseApplicationJson_Ocs),
        UsersWipeUserDevicesResponseApplicationJson_Ocs.new,
      )
      ..add(UsersWipeUserDevicesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersEnableUserResponseApplicationJson),
        UsersEnableUserResponseApplicationJson.new,
      )
      ..add(UsersEnableUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersEnableUserResponseApplicationJson_Ocs),
        UsersEnableUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersEnableUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersDisableUserResponseApplicationJson),
        UsersDisableUserResponseApplicationJson.new,
      )
      ..add(UsersDisableUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersDisableUserResponseApplicationJson_Ocs),
        UsersDisableUserResponseApplicationJson_Ocs.new,
      )
      ..add(UsersDisableUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersGroupsResponseApplicationJson),
        UsersGetUsersGroupsResponseApplicationJson.new,
      )
      ..add(UsersGetUsersGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs),
        UsersGetUsersGroupsResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetUsersGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUsersGroupsResponseApplicationJson_Ocs_Data),
        UsersGetUsersGroupsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UsersGetUsersGroupsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddToGroupResponseApplicationJson),
        UsersAddToGroupResponseApplicationJson.new,
      )
      ..add(UsersAddToGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddToGroupResponseApplicationJson_Ocs),
        UsersAddToGroupResponseApplicationJson_Ocs.new,
      )
      ..add(UsersAddToGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveFromGroupResponseApplicationJson),
        UsersRemoveFromGroupResponseApplicationJson.new,
      )
      ..add(UsersRemoveFromGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveFromGroupResponseApplicationJson_Ocs),
        UsersRemoveFromGroupResponseApplicationJson_Ocs.new,
      )
      ..add(UsersRemoveFromGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson),
        UsersGetUserSubAdminGroupsResponseApplicationJson.new,
      )
      ..add(UsersGetUserSubAdminGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs),
        UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.new,
      )
      ..add(UsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddSubAdminResponseApplicationJson),
        UsersAddSubAdminResponseApplicationJson.new,
      )
      ..add(UsersAddSubAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersAddSubAdminResponseApplicationJson_Ocs),
        UsersAddSubAdminResponseApplicationJson_Ocs.new,
      )
      ..add(UsersAddSubAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveSubAdminResponseApplicationJson),
        UsersRemoveSubAdminResponseApplicationJson.new,
      )
      ..add(UsersRemoveSubAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersRemoveSubAdminResponseApplicationJson_Ocs),
        UsersRemoveSubAdminResponseApplicationJson_Ocs.new,
      )
      ..add(UsersRemoveSubAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UsersResendWelcomeMessageResponseApplicationJson),
        UsersResendWelcomeMessageResponseApplicationJson.new,
      )
      ..add(UsersResendWelcomeMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UsersResendWelcomeMessageResponseApplicationJson_Ocs),
        UsersResendWelcomeMessageResponseApplicationJson_Ocs.new,
      )
      ..add(UsersResendWelcomeMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_ProvisioningApi), Capabilities_ProvisioningApi.new)
      ..add(Capabilities_ProvisioningApi.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
