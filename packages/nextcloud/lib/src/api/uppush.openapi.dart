// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers

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

  Client.fromClient(DynamiteClient client)
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
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const _path = '/index.php/apps/uppush';
    return DynamiteRawResponse<CheckResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CheckResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<SetKeepaliveResponseApplicationJson, void>> setKeepalive({required int keepalive}) async {
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
  DynamiteRawResponse<SetKeepaliveResponseApplicationJson, void> setKeepaliveRaw({required int keepalive}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $keepalive = jsonSerializers.serialize(keepalive, specifiedType: const FullType(int));
    _parameters['keepalive'] = $keepalive;

    final _path = UriTemplate('/index.php/apps/uppush/keepalive{?keepalive*}').expand(_parameters);
    return DynamiteRawResponse<SetKeepaliveResponseApplicationJson, void>(
      response: executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SetKeepaliveResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<CreateDeviceResponseApplicationJson, void>> createDevice({required String deviceName}) async {
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
  DynamiteRawResponse<CreateDeviceResponseApplicationJson, void> createDeviceRaw({required String deviceName}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $deviceName = jsonSerializers.serialize(deviceName, specifiedType: const FullType(String));
    _parameters['deviceName'] = $deviceName;

    final _path = UriTemplate('/index.php/apps/uppush/device{?deviceName*}').expand(_parameters);
    return DynamiteRawResponse<CreateDeviceResponseApplicationJson, void>(
      response: executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CreateDeviceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<SyncDeviceResponseApplicationJson, void>> syncDevice({required String deviceId}) async {
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
  DynamiteRawResponse<SyncDeviceResponseApplicationJson, void> syncDeviceRaw({required String deviceId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $deviceId = jsonSerializers.serialize(deviceId, specifiedType: const FullType(String));
    _parameters['deviceId'] = $deviceId;

    final _path = UriTemplate('/index.php/apps/uppush/device/{deviceId}').expand(_parameters);
    return DynamiteRawResponse<SyncDeviceResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {401},
      ),
      bodyType: const FullType(SyncDeviceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<DeleteDeviceResponseApplicationJson, void>> deleteDevice({required String deviceId}) async {
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
  DynamiteRawResponse<DeleteDeviceResponseApplicationJson, void> deleteDeviceRaw({required String deviceId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $deviceId = jsonSerializers.serialize(deviceId, specifiedType: const FullType(String));
    _parameters['deviceId'] = $deviceId;

    final _path = UriTemplate('/index.php/apps/uppush/device/{deviceId}').expand(_parameters);
    return DynamiteRawResponse<DeleteDeviceResponseApplicationJson, void>(
      response: executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(DeleteDeviceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String deviceId,
    required String appName,
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
    required String deviceId,
    required String appName,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $deviceId = jsonSerializers.serialize(deviceId, specifiedType: const FullType(String));
    _parameters['deviceId'] = $deviceId;

    final $appName = jsonSerializers.serialize(appName, specifiedType: const FullType(String));
    _parameters['appName'] = $appName;

    final _path = UriTemplate('/index.php/apps/uppush/app{?deviceId*,appName*}').expand(_parameters);
    return DynamiteRawResponse<CreateAppResponseApplicationJson, void>(
      response: executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CreateAppResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<DeleteAppResponseApplicationJson, void>> deleteApp({required String token}) async {
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
  DynamiteRawResponse<DeleteAppResponseApplicationJson, void> deleteAppRaw({required String token}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    _parameters['token'] = $token;

    final _path = UriTemplate('/index.php/apps/uppush/app/{token}').expand(_parameters);
    return DynamiteRawResponse<DeleteAppResponseApplicationJson, void>(
      response: executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(DeleteAppResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String token,
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
    required String token,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    _parameters['token'] = $token;

    final _path = UriTemplate('/index.php/apps/uppush/push/{token}').expand(_parameters);
    return DynamiteRawResponse<UnifiedpushDiscoveryResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UnifiedpushDiscoveryResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<PushResponseApplicationJson, void>> push({required String token}) async {
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
  DynamiteRawResponse<PushResponseApplicationJson, void> pushRaw({required String token}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    _parameters['token'] = $token;

    final _path = UriTemplate('/index.php/apps/uppush/push/{token}').expand(_parameters);
    return DynamiteRawResponse<PushResponseApplicationJson, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {201},
      ),
      bodyType: const FullType(PushResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const _path = '/index.php/apps/uppush/gateway/matrix';
    return DynamiteRawResponse<GatewayMatrixDiscoveryResponseApplicationJson, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(GatewayMatrixDiscoveryResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const _path = '/index.php/apps/uppush/gateway/matrix';
    return DynamiteRawResponse<GatewayMatrixResponseApplicationJson, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(GatewayMatrixResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $CheckResponseApplicationJsonInterface {
  bool get success;
}

abstract class CheckResponseApplicationJson
    implements
        $CheckResponseApplicationJsonInterface,
        Built<CheckResponseApplicationJson, CheckResponseApplicationJsonBuilder> {
  factory CheckResponseApplicationJson([void Function(CheckResponseApplicationJsonBuilder)? b]) =
      _$CheckResponseApplicationJson;

  // coverage:ignore-start
  const CheckResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CheckResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CheckResponseApplicationJson> get serializer => _$checkResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SetKeepaliveResponseApplicationJsonInterface {
  bool get success;
}

abstract class SetKeepaliveResponseApplicationJson
    implements
        $SetKeepaliveResponseApplicationJsonInterface,
        Built<SetKeepaliveResponseApplicationJson, SetKeepaliveResponseApplicationJsonBuilder> {
  factory SetKeepaliveResponseApplicationJson([void Function(SetKeepaliveResponseApplicationJsonBuilder)? b]) =
      _$SetKeepaliveResponseApplicationJson;

  // coverage:ignore-start
  const SetKeepaliveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SetKeepaliveResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SetKeepaliveResponseApplicationJson> get serializer =>
      _$setKeepaliveResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CreateDeviceResponseApplicationJsonInterface {
  bool get success;
  String get deviceId;
}

abstract class CreateDeviceResponseApplicationJson
    implements
        $CreateDeviceResponseApplicationJsonInterface,
        Built<CreateDeviceResponseApplicationJson, CreateDeviceResponseApplicationJsonBuilder> {
  factory CreateDeviceResponseApplicationJson([void Function(CreateDeviceResponseApplicationJsonBuilder)? b]) =
      _$CreateDeviceResponseApplicationJson;

  // coverage:ignore-start
  const CreateDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CreateDeviceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CreateDeviceResponseApplicationJson> get serializer =>
      _$createDeviceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SyncDeviceResponseApplicationJsonInterface {
  bool get success;
}

abstract class SyncDeviceResponseApplicationJson
    implements
        $SyncDeviceResponseApplicationJsonInterface,
        Built<SyncDeviceResponseApplicationJson, SyncDeviceResponseApplicationJsonBuilder> {
  factory SyncDeviceResponseApplicationJson([void Function(SyncDeviceResponseApplicationJsonBuilder)? b]) =
      _$SyncDeviceResponseApplicationJson;

  // coverage:ignore-start
  const SyncDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SyncDeviceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SyncDeviceResponseApplicationJson> get serializer => _$syncDeviceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DeleteDeviceResponseApplicationJsonInterface {
  bool get success;
}

abstract class DeleteDeviceResponseApplicationJson
    implements
        $DeleteDeviceResponseApplicationJsonInterface,
        Built<DeleteDeviceResponseApplicationJson, DeleteDeviceResponseApplicationJsonBuilder> {
  factory DeleteDeviceResponseApplicationJson([void Function(DeleteDeviceResponseApplicationJsonBuilder)? b]) =
      _$DeleteDeviceResponseApplicationJson;

  // coverage:ignore-start
  const DeleteDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeleteDeviceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DeleteDeviceResponseApplicationJson> get serializer =>
      _$deleteDeviceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CreateAppResponseApplicationJsonInterface {
  bool get success;
  String get token;
}

abstract class CreateAppResponseApplicationJson
    implements
        $CreateAppResponseApplicationJsonInterface,
        Built<CreateAppResponseApplicationJson, CreateAppResponseApplicationJsonBuilder> {
  factory CreateAppResponseApplicationJson([void Function(CreateAppResponseApplicationJsonBuilder)? b]) =
      _$CreateAppResponseApplicationJson;

  // coverage:ignore-start
  const CreateAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CreateAppResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CreateAppResponseApplicationJson> get serializer => _$createAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DeleteAppResponseApplicationJsonInterface {
  bool get success;
}

abstract class DeleteAppResponseApplicationJson
    implements
        $DeleteAppResponseApplicationJsonInterface,
        Built<DeleteAppResponseApplicationJson, DeleteAppResponseApplicationJsonBuilder> {
  factory DeleteAppResponseApplicationJson([void Function(DeleteAppResponseApplicationJsonBuilder)? b]) =
      _$DeleteAppResponseApplicationJson;

  // coverage:ignore-start
  const DeleteAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeleteAppResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DeleteAppResponseApplicationJson> get serializer => _$deleteAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface {
  int get version;
}

abstract class UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush
    implements
        $UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushInterface,
        Built<UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush,
            UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder> {
  factory UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush([
    void Function(UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush> get serializer =>
      _$unifiedpushDiscoveryResponseApplicationJsonUnifiedpushSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedpushDiscoveryResponseApplicationJsonInterface {
  UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush get unifiedpush;
}

abstract class UnifiedpushDiscoveryResponseApplicationJson
    implements
        $UnifiedpushDiscoveryResponseApplicationJsonInterface,
        Built<UnifiedpushDiscoveryResponseApplicationJson, UnifiedpushDiscoveryResponseApplicationJsonBuilder> {
  factory UnifiedpushDiscoveryResponseApplicationJson([
    void Function(UnifiedpushDiscoveryResponseApplicationJsonBuilder)? b,
  ]) = _$UnifiedpushDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const UnifiedpushDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedpushDiscoveryResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedpushDiscoveryResponseApplicationJson> get serializer =>
      _$unifiedpushDiscoveryResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PushResponseApplicationJsonInterface {
  bool get success;
}

abstract class PushResponseApplicationJson
    implements
        $PushResponseApplicationJsonInterface,
        Built<PushResponseApplicationJson, PushResponseApplicationJsonBuilder> {
  factory PushResponseApplicationJson([void Function(PushResponseApplicationJsonBuilder)? b]) =
      _$PushResponseApplicationJson;

  // coverage:ignore-start
  const PushResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PushResponseApplicationJson> get serializer => _$pushResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface {
  String get gateway;
}

abstract class GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush
    implements
        $GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushInterface,
        Built<GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush,
            GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder> {
  factory GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush([
    void Function(GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush> get serializer =>
      _$gatewayMatrixDiscoveryResponseApplicationJsonUnifiedpushSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GatewayMatrixDiscoveryResponseApplicationJsonInterface {
  GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush get unifiedpush;
}

abstract class GatewayMatrixDiscoveryResponseApplicationJson
    implements
        $GatewayMatrixDiscoveryResponseApplicationJsonInterface,
        Built<GatewayMatrixDiscoveryResponseApplicationJson, GatewayMatrixDiscoveryResponseApplicationJsonBuilder> {
  factory GatewayMatrixDiscoveryResponseApplicationJson([
    void Function(GatewayMatrixDiscoveryResponseApplicationJsonBuilder)? b,
  ]) = _$GatewayMatrixDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const GatewayMatrixDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GatewayMatrixDiscoveryResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GatewayMatrixDiscoveryResponseApplicationJson> get serializer =>
      _$gatewayMatrixDiscoveryResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GatewayMatrixResponseApplicationJsonInterface {
  BuiltList<String> get rejected;
}

abstract class GatewayMatrixResponseApplicationJson
    implements
        $GatewayMatrixResponseApplicationJsonInterface,
        Built<GatewayMatrixResponseApplicationJson, GatewayMatrixResponseApplicationJsonBuilder> {
  factory GatewayMatrixResponseApplicationJson([void Function(GatewayMatrixResponseApplicationJsonBuilder)? b]) =
      _$GatewayMatrixResponseApplicationJson;

  // coverage:ignore-start
  const GatewayMatrixResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory GatewayMatrixResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<GatewayMatrixResponseApplicationJson> get serializer =>
      _$gatewayMatrixResponseApplicationJsonSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(CheckResponseApplicationJson), CheckResponseApplicationJsonBuilder.new)
      ..add(CheckResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SetKeepaliveResponseApplicationJson),
        SetKeepaliveResponseApplicationJsonBuilder.new,
      )
      ..add(SetKeepaliveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CreateDeviceResponseApplicationJson),
        CreateDeviceResponseApplicationJsonBuilder.new,
      )
      ..add(CreateDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SyncDeviceResponseApplicationJson),
        SyncDeviceResponseApplicationJsonBuilder.new,
      )
      ..add(SyncDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DeleteDeviceResponseApplicationJson),
        DeleteDeviceResponseApplicationJsonBuilder.new,
      )
      ..add(DeleteDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(CreateAppResponseApplicationJson), CreateAppResponseApplicationJsonBuilder.new)
      ..add(CreateAppResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(DeleteAppResponseApplicationJson), DeleteAppResponseApplicationJsonBuilder.new)
      ..add(DeleteAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedpushDiscoveryResponseApplicationJson),
        UnifiedpushDiscoveryResponseApplicationJsonBuilder.new,
      )
      ..add(UnifiedpushDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush),
        UnifiedpushDiscoveryResponseApplicationJson_UnifiedpushBuilder.new,
      )
      ..add(UnifiedpushDiscoveryResponseApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(const FullType(PushResponseApplicationJson), PushResponseApplicationJsonBuilder.new)
      ..add(PushResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GatewayMatrixDiscoveryResponseApplicationJson),
        GatewayMatrixDiscoveryResponseApplicationJsonBuilder.new,
      )
      ..add(GatewayMatrixDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush),
        GatewayMatrixDiscoveryResponseApplicationJson_UnifiedpushBuilder.new,
      )
      ..add(GatewayMatrixDiscoveryResponseApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(
        const FullType(GatewayMatrixResponseApplicationJson),
        GatewayMatrixResponseApplicationJsonBuilder.new,
      )
      ..add(GatewayMatrixResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
