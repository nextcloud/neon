// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'uppush.openapi.g.dart';

class UppushClient extends DynamiteClient {
  UppushClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  UppushClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  /// Check if the UnifiedPush provider is present.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [checkRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushCheckResponseApplicationJson, void>> check() async {
    final rawResponse = checkRaw();

    return rawResponse.future;
  }

  /// Check if the UnifiedPush provider is present.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [check] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushCheckResponseApplicationJson, void> checkRaw() {
    const path = '/index.php/apps/uppush';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushCheckResponseApplicationJson, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushCheckResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Set keepalive interval.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [keepalive] Keep alive value in seconds
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [setKeepaliveRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushSetKeepaliveResponseApplicationJson, void>> setKeepalive({
    required final int keepalive,
  }) async {
    final rawResponse = setKeepaliveRaw(
      keepalive: keepalive,
    );

    return rawResponse.future;
  }

  /// Set keepalive interval.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [keepalive] Keep alive value in seconds
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [setKeepalive] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushSetKeepaliveResponseApplicationJson, void> setKeepaliveRaw({required final int keepalive}) {
    const path = '/index.php/apps/uppush/keepalive';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    queryParameters['keepalive'] = keepalive.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushSetKeepaliveResponseApplicationJson, void>(
      response: doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushSetKeepaliveResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Request to create a new deviceId.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [deviceName] Name of the device
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createDeviceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushCreateDeviceResponseApplicationJson, void>> createDevice({
    required final String deviceName,
  }) async {
    final rawResponse = createDeviceRaw(
      deviceName: deviceName,
    );

    return rawResponse.future;
  }

  /// Request to create a new deviceId.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [deviceName] Name of the device
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createDevice] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushCreateDeviceResponseApplicationJson, void> createDeviceRaw({
    required final String deviceName,
  }) {
    const path = '/index.php/apps/uppush/device';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    queryParameters['deviceName'] = deviceName;
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushCreateDeviceResponseApplicationJson, void>(
      response: doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushCreateDeviceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Request to get push messages.
  ///
  /// This is a public page since it has to be handle by the non-connected app (NextPush app and not Nextcloud-app).
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 401: Missing permissions to sync device
  ///
  /// See:
  ///  * [syncDeviceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushSyncDeviceResponseApplicationJson, void>> syncDevice({
    required final String deviceId,
  }) async {
    final rawResponse = syncDeviceRaw(
      deviceId: deviceId,
    );

    return rawResponse.future;
  }

  /// Request to get push messages.
  ///
  /// This is a public page since it has to be handle by the non-connected app (NextPush app and not Nextcloud-app).
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 401: Missing permissions to sync device
  ///
  /// See:
  ///  * [syncDevice] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushSyncDeviceResponseApplicationJson, void> syncDeviceRaw({required final String deviceId}) {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushSyncDeviceResponseApplicationJson, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {401},
      ),
      bodyType: const FullType(UppushSyncDeviceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete a device.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Device deleted successfully
  ///
  /// See:
  ///  * [deleteDeviceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushDeleteDeviceResponseApplicationJson, void>> deleteDevice({
    required final String deviceId,
  }) async {
    final rawResponse = deleteDeviceRaw(
      deviceId: deviceId,
    );

    return rawResponse.future;
  }

  /// Delete a device.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Device deleted successfully
  ///
  /// See:
  ///  * [deleteDevice] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushDeleteDeviceResponseApplicationJson, void> deleteDeviceRaw({
    required final String deviceId,
  }) {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushDeleteDeviceResponseApplicationJson, void>(
      response: doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushDeleteDeviceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create an authorization token for a new 3rd party service.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [deviceId] ID of the device
  ///   * [appName] Name of the app
  ///
  /// Status codes:
  ///   * 200: App created successfully
  ///
  /// See:
  ///  * [createAppRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushCreateAppResponseApplicationJson, void>> createApp({
    required final String deviceId,
    required final String appName,
  }) async {
    final rawResponse = createAppRaw(
      deviceId: deviceId,
      appName: appName,
    );

    return rawResponse.future;
  }

  /// Create an authorization token for a new 3rd party service.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [deviceId] ID of the device
  ///   * [appName] Name of the app
  ///
  /// Status codes:
  ///   * 200: App created successfully
  ///
  /// See:
  ///  * [createApp] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushCreateAppResponseApplicationJson, void> createAppRaw({
    required final String deviceId,
    required final String appName,
  }) {
    const path = '/index.php/apps/uppush/app';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    queryParameters['deviceId'] = deviceId;
    queryParameters['appName'] = appName;
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushCreateAppResponseApplicationJson, void>(
      response: doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushCreateAppResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete an authorization token.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: App deleted successfully
  ///
  /// See:
  ///  * [deleteAppRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushDeleteAppResponseApplicationJson, void>> deleteApp({
    required final String token,
  }) async {
    final rawResponse = deleteAppRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Delete an authorization token.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: App deleted successfully
  ///
  /// See:
  ///  * [deleteApp] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushDeleteAppResponseApplicationJson, void> deleteAppRaw({required final String token}) {
    var path = '/index.php/apps/uppush/app/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushDeleteAppResponseApplicationJson, void>(
      response: doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushDeleteAppResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Unifiedpush discovery Following specifications.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unifiedpushDiscoveryRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushUnifiedpushDiscoveryResponseApplicationJson, void>> unifiedpushDiscovery({
    required final String token,
  }) async {
    final rawResponse = unifiedpushDiscoveryRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Unifiedpush discovery Following specifications.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unifiedpushDiscovery] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushUnifiedpushDiscoveryResponseApplicationJson, void> unifiedpushDiscoveryRaw({
    required final String token,
  }) {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushUnifiedpushDiscoveryResponseApplicationJson, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushUnifiedpushDiscoveryResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Receive notifications from 3rd parties.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 201: Notification pushed successfully
  ///
  /// See:
  ///  * [pushRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushPushResponseApplicationJson, void>> push({required final String token}) async {
    final rawResponse = pushRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Receive notifications from 3rd parties.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 201: Notification pushed successfully
  ///
  /// See:
  ///  * [push] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushPushResponseApplicationJson, void> pushRaw({required final String token}) {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushPushResponseApplicationJson, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {201},
      ),
      bodyType: const FullType(UppushPushResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Matrix Gateway discovery.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [gatewayMatrixDiscoveryRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushGatewayMatrixDiscoveryResponseApplicationJson, void>> gatewayMatrixDiscovery() async {
    final rawResponse = gatewayMatrixDiscoveryRaw();

    return rawResponse.future;
  }

  /// Matrix Gateway discovery.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [gatewayMatrixDiscovery] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushGatewayMatrixDiscoveryResponseApplicationJson, void> gatewayMatrixDiscoveryRaw() {
    const path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushGatewayMatrixDiscoveryResponseApplicationJson, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushGatewayMatrixDiscoveryResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Matrix Gateway.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [gatewayMatrixRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UppushGatewayMatrixResponseApplicationJson, void>> gatewayMatrix() async {
    final rawResponse = gatewayMatrixRaw();

    return rawResponse.future;
  }

  /// Matrix Gateway.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [gatewayMatrix] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UppushGatewayMatrixResponseApplicationJson, void> gatewayMatrixRaw() {
    const path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<UppushGatewayMatrixResponseApplicationJson, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UppushGatewayMatrixResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class UppushCheckResponseApplicationJsonInterface {
  bool get success;
  UppushCheckResponseApplicationJsonInterface rebuild(
    final void Function(UppushCheckResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushCheckResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushCheckResponseApplicationJson
    implements
        UppushCheckResponseApplicationJsonInterface,
        Built<UppushCheckResponseApplicationJson, UppushCheckResponseApplicationJsonBuilder> {
  factory UppushCheckResponseApplicationJson([final void Function(UppushCheckResponseApplicationJsonBuilder)? b]) =
      _$UppushCheckResponseApplicationJson;

  // coverage:ignore-start
  const UppushCheckResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushCheckResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushCheckResponseApplicationJson> get serializer =>
      _$uppushCheckResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushSetKeepaliveResponseApplicationJsonInterface {
  bool get success;
  UppushSetKeepaliveResponseApplicationJsonInterface rebuild(
    final void Function(UppushSetKeepaliveResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushSetKeepaliveResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushSetKeepaliveResponseApplicationJson
    implements
        UppushSetKeepaliveResponseApplicationJsonInterface,
        Built<UppushSetKeepaliveResponseApplicationJson, UppushSetKeepaliveResponseApplicationJsonBuilder> {
  factory UppushSetKeepaliveResponseApplicationJson([
    final void Function(UppushSetKeepaliveResponseApplicationJsonBuilder)? b,
  ]) = _$UppushSetKeepaliveResponseApplicationJson;

  // coverage:ignore-start
  const UppushSetKeepaliveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushSetKeepaliveResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushSetKeepaliveResponseApplicationJson> get serializer =>
      _$uppushSetKeepaliveResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushCreateDeviceResponseApplicationJsonInterface {
  bool get success;
  String get deviceId;
  UppushCreateDeviceResponseApplicationJsonInterface rebuild(
    final void Function(UppushCreateDeviceResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushCreateDeviceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushCreateDeviceResponseApplicationJson
    implements
        UppushCreateDeviceResponseApplicationJsonInterface,
        Built<UppushCreateDeviceResponseApplicationJson, UppushCreateDeviceResponseApplicationJsonBuilder> {
  factory UppushCreateDeviceResponseApplicationJson([
    final void Function(UppushCreateDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$UppushCreateDeviceResponseApplicationJson;

  // coverage:ignore-start
  const UppushCreateDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushCreateDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushCreateDeviceResponseApplicationJson> get serializer =>
      _$uppushCreateDeviceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushSyncDeviceResponseApplicationJsonInterface {
  bool get success;
  UppushSyncDeviceResponseApplicationJsonInterface rebuild(
    final void Function(UppushSyncDeviceResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushSyncDeviceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushSyncDeviceResponseApplicationJson
    implements
        UppushSyncDeviceResponseApplicationJsonInterface,
        Built<UppushSyncDeviceResponseApplicationJson, UppushSyncDeviceResponseApplicationJsonBuilder> {
  factory UppushSyncDeviceResponseApplicationJson([
    final void Function(UppushSyncDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$UppushSyncDeviceResponseApplicationJson;

  // coverage:ignore-start
  const UppushSyncDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushSyncDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushSyncDeviceResponseApplicationJson> get serializer =>
      _$uppushSyncDeviceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushDeleteDeviceResponseApplicationJsonInterface {
  bool get success;
  UppushDeleteDeviceResponseApplicationJsonInterface rebuild(
    final void Function(UppushDeleteDeviceResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushDeleteDeviceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushDeleteDeviceResponseApplicationJson
    implements
        UppushDeleteDeviceResponseApplicationJsonInterface,
        Built<UppushDeleteDeviceResponseApplicationJson, UppushDeleteDeviceResponseApplicationJsonBuilder> {
  factory UppushDeleteDeviceResponseApplicationJson([
    final void Function(UppushDeleteDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$UppushDeleteDeviceResponseApplicationJson;

  // coverage:ignore-start
  const UppushDeleteDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushDeleteDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushDeleteDeviceResponseApplicationJson> get serializer =>
      _$uppushDeleteDeviceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushCreateAppResponseApplicationJsonInterface {
  bool get success;
  String get token;
  UppushCreateAppResponseApplicationJsonInterface rebuild(
    final void Function(UppushCreateAppResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushCreateAppResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushCreateAppResponseApplicationJson
    implements
        UppushCreateAppResponseApplicationJsonInterface,
        Built<UppushCreateAppResponseApplicationJson, UppushCreateAppResponseApplicationJsonBuilder> {
  factory UppushCreateAppResponseApplicationJson([
    final void Function(UppushCreateAppResponseApplicationJsonBuilder)? b,
  ]) = _$UppushCreateAppResponseApplicationJson;

  // coverage:ignore-start
  const UppushCreateAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushCreateAppResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushCreateAppResponseApplicationJson> get serializer =>
      _$uppushCreateAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushDeleteAppResponseApplicationJsonInterface {
  bool get success;
  UppushDeleteAppResponseApplicationJsonInterface rebuild(
    final void Function(UppushDeleteAppResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushDeleteAppResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushDeleteAppResponseApplicationJson
    implements
        UppushDeleteAppResponseApplicationJsonInterface,
        Built<UppushDeleteAppResponseApplicationJson, UppushDeleteAppResponseApplicationJsonBuilder> {
  factory UppushDeleteAppResponseApplicationJson([
    final void Function(UppushDeleteAppResponseApplicationJsonBuilder)? b,
  ]) = _$UppushDeleteAppResponseApplicationJson;

  // coverage:ignore-start
  const UppushDeleteAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushDeleteAppResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushDeleteAppResponseApplicationJson> get serializer =>
      _$uppushDeleteAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface {
  int get version;
  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface rebuild(
    final void Function(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder) updates,
  );
  UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder toBuilder();
}

abstract class UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush
    implements
        UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface,
        Built<UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
            UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder> {
  factory UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush([
    final void Function(UppushUnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush> get serializer =>
      _$uppushUnifiedpushDiscoveryResponseApplicationJsonUnifiedpushSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushUnifiedpushDiscoveryResponseApplicationJsonInterface {
  UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush get unifiedpush;
  UppushUnifiedpushDiscoveryResponseApplicationJsonInterface rebuild(
    final void Function(UppushUnifiedpushDiscoveryResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushUnifiedpushDiscoveryResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushUnifiedpushDiscoveryResponseApplicationJson
    implements
        UppushUnifiedpushDiscoveryResponseApplicationJsonInterface,
        Built<UppushUnifiedpushDiscoveryResponseApplicationJson,
            UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder> {
  factory UppushUnifiedpushDiscoveryResponseApplicationJson([
    final void Function(UppushUnifiedpushDiscoveryResponseApplicationJsonBuilder)? b,
  ]) = _$UppushUnifiedpushDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const UppushUnifiedpushDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushUnifiedpushDiscoveryResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushUnifiedpushDiscoveryResponseApplicationJson> get serializer =>
      _$uppushUnifiedpushDiscoveryResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushPushResponseApplicationJsonInterface {
  bool get success;
  UppushPushResponseApplicationJsonInterface rebuild(
    final void Function(UppushPushResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushPushResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushPushResponseApplicationJson
    implements
        UppushPushResponseApplicationJsonInterface,
        Built<UppushPushResponseApplicationJson, UppushPushResponseApplicationJsonBuilder> {
  factory UppushPushResponseApplicationJson([final void Function(UppushPushResponseApplicationJsonBuilder)? b]) =
      _$UppushPushResponseApplicationJson;

  // coverage:ignore-start
  const UppushPushResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushPushResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushPushResponseApplicationJson> get serializer => _$uppushPushResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface {
  String get gateway;
  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface rebuild(
    final void Function(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder) updates,
  );
  UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterfaceBuilder toBuilder();
}

abstract class UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush
    implements
        UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface,
        Built<UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
            UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder> {
  factory UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush([
    final void Function(UppushGatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush> get serializer =>
      _$uppushGatewayMatrixDiscoveryResponseApplicationJsonUnifiedpushSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushGatewayMatrixDiscoveryResponseApplicationJsonInterface {
  UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush get unifiedpush;
  UppushGatewayMatrixDiscoveryResponseApplicationJsonInterface rebuild(
    final void Function(UppushGatewayMatrixDiscoveryResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushGatewayMatrixDiscoveryResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushGatewayMatrixDiscoveryResponseApplicationJson
    implements
        UppushGatewayMatrixDiscoveryResponseApplicationJsonInterface,
        Built<UppushGatewayMatrixDiscoveryResponseApplicationJson,
            UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder> {
  factory UppushGatewayMatrixDiscoveryResponseApplicationJson([
    final void Function(UppushGatewayMatrixDiscoveryResponseApplicationJsonBuilder)? b,
  ]) = _$UppushGatewayMatrixDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const UppushGatewayMatrixDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushGatewayMatrixDiscoveryResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushGatewayMatrixDiscoveryResponseApplicationJson> get serializer =>
      _$uppushGatewayMatrixDiscoveryResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UppushGatewayMatrixResponseApplicationJsonInterface {
  BuiltList<String> get rejected;
  UppushGatewayMatrixResponseApplicationJsonInterface rebuild(
    final void Function(UppushGatewayMatrixResponseApplicationJsonInterfaceBuilder) updates,
  );
  UppushGatewayMatrixResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UppushGatewayMatrixResponseApplicationJson
    implements
        UppushGatewayMatrixResponseApplicationJsonInterface,
        Built<UppushGatewayMatrixResponseApplicationJson, UppushGatewayMatrixResponseApplicationJsonBuilder> {
  factory UppushGatewayMatrixResponseApplicationJson([
    final void Function(UppushGatewayMatrixResponseApplicationJsonBuilder)? b,
  ]) = _$UppushGatewayMatrixResponseApplicationJson;

  // coverage:ignore-start
  const UppushGatewayMatrixResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushGatewayMatrixResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UppushGatewayMatrixResponseApplicationJson> get serializer =>
      _$uppushGatewayMatrixResponseApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(UppushCheckResponseApplicationJson), UppushCheckResponseApplicationJson.new)
      ..add(UppushCheckResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushSetKeepaliveResponseApplicationJson),
        UppushSetKeepaliveResponseApplicationJson.new,
      )
      ..add(UppushSetKeepaliveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushCreateDeviceResponseApplicationJson),
        UppushCreateDeviceResponseApplicationJson.new,
      )
      ..add(UppushCreateDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushSyncDeviceResponseApplicationJson),
        UppushSyncDeviceResponseApplicationJson.new,
      )
      ..add(UppushSyncDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushDeleteDeviceResponseApplicationJson),
        UppushDeleteDeviceResponseApplicationJson.new,
      )
      ..add(UppushDeleteDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushCreateAppResponseApplicationJson),
        UppushCreateAppResponseApplicationJson.new,
      )
      ..add(UppushCreateAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushDeleteAppResponseApplicationJson),
        UppushDeleteAppResponseApplicationJson.new,
      )
      ..add(UppushDeleteAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushUnifiedpushDiscoveryResponseApplicationJson),
        UppushUnifiedpushDiscoveryResponseApplicationJson.new,
      )
      ..add(UppushUnifiedpushDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush),
        UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.new,
      )
      ..add(UppushUnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(const FullType(UppushPushResponseApplicationJson), UppushPushResponseApplicationJson.new)
      ..add(UppushPushResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushGatewayMatrixDiscoveryResponseApplicationJson),
        UppushGatewayMatrixDiscoveryResponseApplicationJson.new,
      )
      ..add(UppushGatewayMatrixDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush),
        UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.new,
      )
      ..add(UppushGatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(
        const FullType(UppushGatewayMatrixResponseApplicationJson),
        UppushGatewayMatrixResponseApplicationJson.new,
      )
      ..add(UppushGatewayMatrixResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
