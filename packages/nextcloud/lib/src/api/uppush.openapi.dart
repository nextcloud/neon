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
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'uppush.openapi.g.dart';

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
  Future<DynamiteResponse<CheckResponseApplicationJson, void>> check() async {
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
  DynamiteRawResponse<CheckResponseApplicationJson, void> checkRaw() {
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<CheckResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CheckResponseApplicationJson),
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
  ///   * [keepalive] Keep alive value in seconds.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [setKeepaliveRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SetKeepaliveResponseApplicationJson, void>> setKeepalive({
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
  ///   * [keepalive] Keep alive value in seconds.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [setKeepalive] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SetKeepaliveResponseApplicationJson, void> setKeepaliveRaw({required final int keepalive}) {
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/keepalive').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<SetKeepaliveResponseApplicationJson, void>(
      response: executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(SetKeepaliveResponseApplicationJson),
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
  ///   * [deviceName] Name of the device.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createDeviceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CreateDeviceResponseApplicationJson, void>> createDevice({
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
  ///   * [deviceName] Name of the device.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createDevice] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CreateDeviceResponseApplicationJson, void> createDeviceRaw({required final String deviceName}) {
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/device').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<CreateDeviceResponseApplicationJson, void>(
      response: executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CreateDeviceResponseApplicationJson),
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
  Future<DynamiteResponse<SyncDeviceResponseApplicationJson, void>> syncDevice({required final String deviceId}) async {
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
  DynamiteRawResponse<SyncDeviceResponseApplicationJson, void> syncDeviceRaw({required final String deviceId}) {
    final pathParameters = <String, dynamic>{};
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
    pathParameters['deviceId'] = deviceId;
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/device/{deviceId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<SyncDeviceResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {401},
      ),
      bodyType: const FullType(SyncDeviceResponseApplicationJson),
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
  Future<DynamiteResponse<DeleteDeviceResponseApplicationJson, void>> deleteDevice({
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
  DynamiteRawResponse<DeleteDeviceResponseApplicationJson, void> deleteDeviceRaw({required final String deviceId}) {
    final pathParameters = <String, dynamic>{};
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
    pathParameters['deviceId'] = deviceId;
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/device/{deviceId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DeleteDeviceResponseApplicationJson, void>(
      response: executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DeleteDeviceResponseApplicationJson),
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
  ///   * [deviceId] ID of the device.
  ///   * [appName] Name of the app.
  ///
  /// Status codes:
  ///   * 200: App created successfully
  ///
  /// See:
  ///  * [createAppRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CreateAppResponseApplicationJson, void>> createApp({
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
  ///   * [deviceId] ID of the device.
  ///   * [appName] Name of the app.
  ///
  /// Status codes:
  ///   * 200: App created successfully
  ///
  /// See:
  ///  * [createApp] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CreateAppResponseApplicationJson, void> createAppRaw({
    required final String deviceId,
    required final String appName,
  }) {
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/app').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<CreateAppResponseApplicationJson, void>(
      response: executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CreateAppResponseApplicationJson),
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
  Future<DynamiteResponse<DeleteAppResponseApplicationJson, void>> deleteApp({required final String token}) async {
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
  DynamiteRawResponse<DeleteAppResponseApplicationJson, void> deleteAppRaw({required final String token}) {
    final pathParameters = <String, dynamic>{};
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
    pathParameters['token'] = token;
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/app/{token}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DeleteAppResponseApplicationJson, void>(
      response: executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DeleteAppResponseApplicationJson),
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
  Future<DynamiteResponse<UnifiedpushDiscoveryResponseApplicationJson, void>> unifiedpushDiscovery({
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
  DynamiteRawResponse<UnifiedpushDiscoveryResponseApplicationJson, void> unifiedpushDiscoveryRaw({
    required final String token,
  }) {
    final pathParameters = <String, dynamic>{};
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
    pathParameters['token'] = token;
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/push/{token}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UnifiedpushDiscoveryResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UnifiedpushDiscoveryResponseApplicationJson),
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
  Future<DynamiteResponse<PushResponseApplicationJson, void>> push({required final String token}) async {
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
  DynamiteRawResponse<PushResponseApplicationJson, void> pushRaw({required final String token}) {
    final pathParameters = <String, dynamic>{};
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
    pathParameters['token'] = token;
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/push/{token}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<PushResponseApplicationJson, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {201},
      ),
      bodyType: const FullType(PushResponseApplicationJson),
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
  Future<DynamiteResponse<GatewayMatrixDiscoveryResponseApplicationJson, void>> gatewayMatrixDiscovery() async {
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
  DynamiteRawResponse<GatewayMatrixDiscoveryResponseApplicationJson, void> gatewayMatrixDiscoveryRaw() {
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/gateway/matrix').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GatewayMatrixDiscoveryResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GatewayMatrixDiscoveryResponseApplicationJson),
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
  Future<DynamiteResponse<GatewayMatrixResponseApplicationJson, void>> gatewayMatrix() async {
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
  DynamiteRawResponse<GatewayMatrixResponseApplicationJson, void> gatewayMatrixRaw() {
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/uppush/gateway/matrix').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<GatewayMatrixResponseApplicationJson, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(GatewayMatrixResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class CheckResponseApplicationJsonInterface {
  bool get success;
}

abstract class CheckResponseApplicationJson
    implements
        CheckResponseApplicationJsonInterface,
        Built<CheckResponseApplicationJson, CheckResponseApplicationJsonBuilder> {
  factory CheckResponseApplicationJson([final void Function(CheckResponseApplicationJsonBuilder)? b]) =
      _$CheckResponseApplicationJson;

  // coverage:ignore-start
  const CheckResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CheckResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckResponseApplicationJson> get serializer => const _$CheckResponseApplicationJsonSerializer();
}

class _$CheckResponseApplicationJsonSerializer implements StructuredSerializer<CheckResponseApplicationJson> {
  const _$CheckResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [CheckResponseApplicationJson, _$CheckResponseApplicationJson];

  @override
  String get wireName => 'CheckResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CheckResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  CheckResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SetKeepaliveResponseApplicationJsonInterface {
  bool get success;
}

abstract class SetKeepaliveResponseApplicationJson
    implements
        SetKeepaliveResponseApplicationJsonInterface,
        Built<SetKeepaliveResponseApplicationJson, SetKeepaliveResponseApplicationJsonBuilder> {
  factory SetKeepaliveResponseApplicationJson([final void Function(SetKeepaliveResponseApplicationJsonBuilder)? b]) =
      _$SetKeepaliveResponseApplicationJson;

  // coverage:ignore-start
  const SetKeepaliveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SetKeepaliveResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SetKeepaliveResponseApplicationJson> get serializer =>
      const _$SetKeepaliveResponseApplicationJsonSerializer();
}

class _$SetKeepaliveResponseApplicationJsonSerializer
    implements StructuredSerializer<SetKeepaliveResponseApplicationJson> {
  const _$SetKeepaliveResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [SetKeepaliveResponseApplicationJson, _$SetKeepaliveResponseApplicationJson];

  @override
  String get wireName => 'SetKeepaliveResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SetKeepaliveResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  SetKeepaliveResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetKeepaliveResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CreateDeviceResponseApplicationJsonInterface {
  bool get success;
  String get deviceId;
}

abstract class CreateDeviceResponseApplicationJson
    implements
        CreateDeviceResponseApplicationJsonInterface,
        Built<CreateDeviceResponseApplicationJson, CreateDeviceResponseApplicationJsonBuilder> {
  factory CreateDeviceResponseApplicationJson([final void Function(CreateDeviceResponseApplicationJsonBuilder)? b]) =
      _$CreateDeviceResponseApplicationJson;

  // coverage:ignore-start
  const CreateDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CreateDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateDeviceResponseApplicationJson> get serializer =>
      const _$CreateDeviceResponseApplicationJsonSerializer();
}

class _$CreateDeviceResponseApplicationJsonSerializer
    implements StructuredSerializer<CreateDeviceResponseApplicationJson> {
  const _$CreateDeviceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [CreateDeviceResponseApplicationJson, _$CreateDeviceResponseApplicationJson];

  @override
  String get wireName => 'CreateDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CreateDeviceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
      'deviceId',
      serializers.serialize(object.deviceId, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  CreateDeviceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateDeviceResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'deviceId':
          result.deviceId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SyncDeviceResponseApplicationJsonInterface {
  bool get success;
}

abstract class SyncDeviceResponseApplicationJson
    implements
        SyncDeviceResponseApplicationJsonInterface,
        Built<SyncDeviceResponseApplicationJson, SyncDeviceResponseApplicationJsonBuilder> {
  factory SyncDeviceResponseApplicationJson([final void Function(SyncDeviceResponseApplicationJsonBuilder)? b]) =
      _$SyncDeviceResponseApplicationJson;

  // coverage:ignore-start
  const SyncDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SyncDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SyncDeviceResponseApplicationJson> get serializer =>
      const _$SyncDeviceResponseApplicationJsonSerializer();
}

class _$SyncDeviceResponseApplicationJsonSerializer implements StructuredSerializer<SyncDeviceResponseApplicationJson> {
  const _$SyncDeviceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [SyncDeviceResponseApplicationJson, _$SyncDeviceResponseApplicationJson];

  @override
  String get wireName => 'SyncDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SyncDeviceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  SyncDeviceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SyncDeviceResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DeleteDeviceResponseApplicationJsonInterface {
  bool get success;
}

abstract class DeleteDeviceResponseApplicationJson
    implements
        DeleteDeviceResponseApplicationJsonInterface,
        Built<DeleteDeviceResponseApplicationJson, DeleteDeviceResponseApplicationJsonBuilder> {
  factory DeleteDeviceResponseApplicationJson([final void Function(DeleteDeviceResponseApplicationJsonBuilder)? b]) =
      _$DeleteDeviceResponseApplicationJson;

  // coverage:ignore-start
  const DeleteDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeleteDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteDeviceResponseApplicationJson> get serializer =>
      const _$DeleteDeviceResponseApplicationJsonSerializer();
}

class _$DeleteDeviceResponseApplicationJsonSerializer
    implements StructuredSerializer<DeleteDeviceResponseApplicationJson> {
  const _$DeleteDeviceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [DeleteDeviceResponseApplicationJson, _$DeleteDeviceResponseApplicationJson];

  @override
  String get wireName => 'DeleteDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DeleteDeviceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  DeleteDeviceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteDeviceResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CreateAppResponseApplicationJsonInterface {
  bool get success;
  String get token;
}

abstract class CreateAppResponseApplicationJson
    implements
        CreateAppResponseApplicationJsonInterface,
        Built<CreateAppResponseApplicationJson, CreateAppResponseApplicationJsonBuilder> {
  factory CreateAppResponseApplicationJson([final void Function(CreateAppResponseApplicationJsonBuilder)? b]) =
      _$CreateAppResponseApplicationJson;

  // coverage:ignore-start
  const CreateAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CreateAppResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAppResponseApplicationJson> get serializer =>
      const _$CreateAppResponseApplicationJsonSerializer();
}

class _$CreateAppResponseApplicationJsonSerializer implements StructuredSerializer<CreateAppResponseApplicationJson> {
  const _$CreateAppResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [CreateAppResponseApplicationJson, _$CreateAppResponseApplicationJson];

  @override
  String get wireName => 'CreateAppResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CreateAppResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
      'token',
      serializers.serialize(object.token, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  CreateAppResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAppResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DeleteAppResponseApplicationJsonInterface {
  bool get success;
}

abstract class DeleteAppResponseApplicationJson
    implements
        DeleteAppResponseApplicationJsonInterface,
        Built<DeleteAppResponseApplicationJson, DeleteAppResponseApplicationJsonBuilder> {
  factory DeleteAppResponseApplicationJson([final void Function(DeleteAppResponseApplicationJsonBuilder)? b]) =
      _$DeleteAppResponseApplicationJson;

  // coverage:ignore-start
  const DeleteAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeleteAppResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteAppResponseApplicationJson> get serializer =>
      const _$DeleteAppResponseApplicationJsonSerializer();
}

class _$DeleteAppResponseApplicationJsonSerializer implements StructuredSerializer<DeleteAppResponseApplicationJson> {
  const _$DeleteAppResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [DeleteAppResponseApplicationJson, _$DeleteAppResponseApplicationJson];

  @override
  String get wireName => 'DeleteAppResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DeleteAppResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  DeleteAppResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteAppResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface {
  int get version;
}

abstract class UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush
    implements
        UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface,
        Built<UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
            UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder> {
  factory UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush([
    final void Function(UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush> get serializer =>
      const _$UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushSerializer();
}

class _$UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushSerializer
    implements StructuredSerializer<UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush> {
  const _$UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushSerializer();

  @override
  Iterable<Type> get types => const [
        UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
        _$UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
      ];

  @override
  String get wireName => 'UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(int)),
    ];
    return result;
  }

  @override
  UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedpushDiscoveryResponseApplicationJsonInterface {
  UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush get unifiedpush;
}

abstract class UnifiedpushDiscoveryResponseApplicationJson
    implements
        UnifiedpushDiscoveryResponseApplicationJsonInterface,
        Built<UnifiedpushDiscoveryResponseApplicationJson, UnifiedpushDiscoveryResponseApplicationJsonBuilder> {
  factory UnifiedpushDiscoveryResponseApplicationJson([
    final void Function(UnifiedpushDiscoveryResponseApplicationJsonBuilder)? b,
  ]) = _$UnifiedpushDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const UnifiedpushDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedpushDiscoveryResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedpushDiscoveryResponseApplicationJson> get serializer =>
      const _$UnifiedpushDiscoveryResponseApplicationJsonSerializer();
}

class _$UnifiedpushDiscoveryResponseApplicationJsonSerializer
    implements StructuredSerializer<UnifiedpushDiscoveryResponseApplicationJson> {
  const _$UnifiedpushDiscoveryResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UnifiedpushDiscoveryResponseApplicationJson, _$UnifiedpushDiscoveryResponseApplicationJson];

  @override
  String get wireName => 'UnifiedpushDiscoveryResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedpushDiscoveryResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(
        object.unifiedpush,
        specifiedType: const FullType(UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush),
      ),
    ];
    return result;
  }

  @override
  UnifiedpushDiscoveryResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedpushDiscoveryResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush),
            )! as UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PushResponseApplicationJsonInterface {
  bool get success;
}

abstract class PushResponseApplicationJson
    implements
        PushResponseApplicationJsonInterface,
        Built<PushResponseApplicationJson, PushResponseApplicationJsonBuilder> {
  factory PushResponseApplicationJson([final void Function(PushResponseApplicationJsonBuilder)? b]) =
      _$PushResponseApplicationJson;

  // coverage:ignore-start
  const PushResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PushResponseApplicationJson> get serializer => const _$PushResponseApplicationJsonSerializer();
}

class _$PushResponseApplicationJsonSerializer implements StructuredSerializer<PushResponseApplicationJson> {
  const _$PushResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [PushResponseApplicationJson, _$PushResponseApplicationJson];

  @override
  String get wireName => 'PushResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PushResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  PushResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PushResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface {
  String get gateway;
}

abstract class GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush
    implements
        GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface,
        Built<GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
            GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder> {
  factory GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush([
    final void Function(GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush> get serializer =>
      const _$GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushSerializer();
}

class _$GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushSerializer
    implements StructuredSerializer<GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush> {
  const _$GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushSerializer();

  @override
  Iterable<Type> get types => const [
        GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
        _$GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
      ];

  @override
  String get wireName => 'GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'gateway',
      serializers.serialize(object.gateway, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'gateway':
          result.gateway = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GatewayMatrixDiscoveryResponseApplicationJsonInterface {
  GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush get unifiedpush;
}

abstract class GatewayMatrixDiscoveryResponseApplicationJson
    implements
        GatewayMatrixDiscoveryResponseApplicationJsonInterface,
        Built<GatewayMatrixDiscoveryResponseApplicationJson, GatewayMatrixDiscoveryResponseApplicationJsonBuilder> {
  factory GatewayMatrixDiscoveryResponseApplicationJson([
    final void Function(GatewayMatrixDiscoveryResponseApplicationJsonBuilder)? b,
  ]) = _$GatewayMatrixDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const GatewayMatrixDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GatewayMatrixDiscoveryResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GatewayMatrixDiscoveryResponseApplicationJson> get serializer =>
      const _$GatewayMatrixDiscoveryResponseApplicationJsonSerializer();
}

class _$GatewayMatrixDiscoveryResponseApplicationJsonSerializer
    implements StructuredSerializer<GatewayMatrixDiscoveryResponseApplicationJson> {
  const _$GatewayMatrixDiscoveryResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [GatewayMatrixDiscoveryResponseApplicationJson, _$GatewayMatrixDiscoveryResponseApplicationJson];

  @override
  String get wireName => 'GatewayMatrixDiscoveryResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GatewayMatrixDiscoveryResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(
        object.unifiedpush,
        specifiedType: const FullType(GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush),
      ),
    ];
    return result;
  }

  @override
  GatewayMatrixDiscoveryResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GatewayMatrixDiscoveryResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush),
            )! as GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class GatewayMatrixResponseApplicationJsonInterface {
  BuiltList<String> get rejected;
}

abstract class GatewayMatrixResponseApplicationJson
    implements
        GatewayMatrixResponseApplicationJsonInterface,
        Built<GatewayMatrixResponseApplicationJson, GatewayMatrixResponseApplicationJsonBuilder> {
  factory GatewayMatrixResponseApplicationJson([final void Function(GatewayMatrixResponseApplicationJsonBuilder)? b]) =
      _$GatewayMatrixResponseApplicationJson;

  // coverage:ignore-start
  const GatewayMatrixResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GatewayMatrixResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<GatewayMatrixResponseApplicationJson> get serializer =>
      const _$GatewayMatrixResponseApplicationJsonSerializer();
}

class _$GatewayMatrixResponseApplicationJsonSerializer
    implements StructuredSerializer<GatewayMatrixResponseApplicationJson> {
  const _$GatewayMatrixResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [GatewayMatrixResponseApplicationJson, _$GatewayMatrixResponseApplicationJson];

  @override
  String get wireName => 'GatewayMatrixResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final GatewayMatrixResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'rejected',
      serializers.serialize(object.rejected, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  GatewayMatrixResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = GatewayMatrixResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'rejected':
          result.rejected.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(CheckResponseApplicationJson), CheckResponseApplicationJson.new)
      ..add(CheckResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(SetKeepaliveResponseApplicationJson), SetKeepaliveResponseApplicationJson.new)
      ..add(SetKeepaliveResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(CreateDeviceResponseApplicationJson), CreateDeviceResponseApplicationJson.new)
      ..add(CreateDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(SyncDeviceResponseApplicationJson), SyncDeviceResponseApplicationJson.new)
      ..add(SyncDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(DeleteDeviceResponseApplicationJson), DeleteDeviceResponseApplicationJson.new)
      ..add(DeleteDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(CreateAppResponseApplicationJson), CreateAppResponseApplicationJson.new)
      ..add(CreateAppResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(DeleteAppResponseApplicationJson), DeleteAppResponseApplicationJson.new)
      ..add(DeleteAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedpushDiscoveryResponseApplicationJson),
        UnifiedpushDiscoveryResponseApplicationJson.new,
      )
      ..add(UnifiedpushDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush),
        UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.new,
      )
      ..add(UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(const FullType(PushResponseApplicationJson), PushResponseApplicationJson.new)
      ..add(PushResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GatewayMatrixDiscoveryResponseApplicationJson),
        GatewayMatrixDiscoveryResponseApplicationJson.new,
      )
      ..add(GatewayMatrixDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush),
        GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.new,
      )
      ..add(GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(
        const FullType(GatewayMatrixResponseApplicationJson),
        GatewayMatrixResponseApplicationJson.new,
      )
      ..add(GatewayMatrixResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
