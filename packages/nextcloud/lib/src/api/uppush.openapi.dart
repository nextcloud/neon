// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'uppush.openapi.g.dart';

class UppushResponse<T, U> extends DynamiteResponse<T, U> {
  UppushResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'UppushResponse(data: $data, headers: $headers)';
}

class UppushApiException extends DynamiteApiException {
  UppushApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<UppushApiException> fromResponse(final HttpClientResponse response) async {
    final data = await response.bodyBytes;

    String body;
    try {
      body = utf8.decode(data);
    } on FormatException {
      body = 'binary';
    }

    return UppushApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'UppushApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

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

  /// Check if the UnifiedPush provider is present
  Future<UppushCheckResponse200ApplicationJson> check() async {
    const path = '/index.php/apps/uppush';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushCheckResponse200ApplicationJson),
      )! as UppushCheckResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set keepalive interval
  ///
  /// This endpoint requires admin access
  Future<UppushSetKeepaliveResponse200ApplicationJson> setKeepalive({required final int keepalive}) async {
    const path = '/index.php/apps/uppush/keepalive';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    queryParameters['keepalive'] = keepalive.toString();
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushSetKeepaliveResponse200ApplicationJson),
      )! as UppushSetKeepaliveResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to create a new deviceId
  Future<UppushCreateDeviceResponse200ApplicationJson> createDevice({required final String deviceName}) async {
    const path = '/index.php/apps/uppush/device';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    queryParameters['deviceName'] = deviceName;
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushCreateDeviceResponse200ApplicationJson),
      )! as UppushCreateDeviceResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to get push messages
  ///
  /// This is a public page since it has to be handle by the non-connected app (NextPush app and not Nextcloud-app)
  Future<UppushSyncDeviceResponse401ApplicationJson> syncDevice({required final String deviceId}) async {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 401) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushSyncDeviceResponse401ApplicationJson),
      )! as UppushSyncDeviceResponse401ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a device
  Future<UppushDeleteDeviceResponse200ApplicationJson> deleteDevice({required final String deviceId}) async {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushDeleteDeviceResponse200ApplicationJson),
      )! as UppushDeleteDeviceResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create an authorization token for a new 3rd party service
  Future<UppushCreateAppResponse200ApplicationJson> createApp({
    required final String deviceId,
    required final String appName,
  }) async {
    const path = '/index.php/apps/uppush/app';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    queryParameters['deviceId'] = deviceId;
    queryParameters['appName'] = appName;
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushCreateAppResponse200ApplicationJson),
      )! as UppushCreateAppResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete an authorization token
  Future<UppushDeleteAppResponse200ApplicationJson> deleteApp({required final String token}) async {
    var path = '/index.php/apps/uppush/app/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushDeleteAppResponse200ApplicationJson),
      )! as UppushDeleteAppResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Unifiedpush discovery Following specifications
  Future<UppushUnifiedpushDiscoveryResponse200ApplicationJson> unifiedpushDiscovery({
    required final String token,
  }) async {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushUnifiedpushDiscoveryResponse200ApplicationJson),
      )! as UppushUnifiedpushDiscoveryResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Receive notifications from 3rd parties
  Future<UppushPushResponse201ApplicationJson> push({required final String token}) async {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 201) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushPushResponse201ApplicationJson),
      )! as UppushPushResponse201ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway discovery
  Future<UppushGatewayMatrixDiscoveryResponse200ApplicationJson> gatewayMatrixDiscovery() async {
    const path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushGatewayMatrixDiscoveryResponse200ApplicationJson),
      )! as UppushGatewayMatrixDiscoveryResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway
  Future<UppushGatewayMatrixResponse200ApplicationJson> gatewayMatrix() async {
    const path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushGatewayMatrixResponse200ApplicationJson),
      )! as UppushGatewayMatrixResponse200ApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class UppushCheckResponse200ApplicationJson
    implements Built<UppushCheckResponse200ApplicationJson, UppushCheckResponse200ApplicationJsonBuilder> {
  factory UppushCheckResponse200ApplicationJson([
    final void Function(UppushCheckResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushCheckResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushCheckResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushCheckResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<UppushCheckResponse200ApplicationJson> get serializer =>
      _$uppushCheckResponse200ApplicationJsonSerializer;
}

abstract class UppushSetKeepaliveResponse200ApplicationJson
    implements
        Built<UppushSetKeepaliveResponse200ApplicationJson, UppushSetKeepaliveResponse200ApplicationJsonBuilder> {
  factory UppushSetKeepaliveResponse200ApplicationJson([
    final void Function(UppushSetKeepaliveResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushSetKeepaliveResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushSetKeepaliveResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushSetKeepaliveResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<UppushSetKeepaliveResponse200ApplicationJson> get serializer =>
      _$uppushSetKeepaliveResponse200ApplicationJsonSerializer;
}

abstract class UppushCreateDeviceResponse200ApplicationJson
    implements
        Built<UppushCreateDeviceResponse200ApplicationJson, UppushCreateDeviceResponse200ApplicationJsonBuilder> {
  factory UppushCreateDeviceResponse200ApplicationJson([
    final void Function(UppushCreateDeviceResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushCreateDeviceResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushCreateDeviceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushCreateDeviceResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  String get deviceId;
  static Serializer<UppushCreateDeviceResponse200ApplicationJson> get serializer =>
      _$uppushCreateDeviceResponse200ApplicationJsonSerializer;
}

abstract class UppushSyncDeviceResponse401ApplicationJson
    implements Built<UppushSyncDeviceResponse401ApplicationJson, UppushSyncDeviceResponse401ApplicationJsonBuilder> {
  factory UppushSyncDeviceResponse401ApplicationJson([
    final void Function(UppushSyncDeviceResponse401ApplicationJsonBuilder)? b,
  ]) = _$UppushSyncDeviceResponse401ApplicationJson;

  // coverage:ignore-start
  const UppushSyncDeviceResponse401ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushSyncDeviceResponse401ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<UppushSyncDeviceResponse401ApplicationJson> get serializer =>
      _$uppushSyncDeviceResponse401ApplicationJsonSerializer;
}

abstract class UppushDeleteDeviceResponse200ApplicationJson
    implements
        Built<UppushDeleteDeviceResponse200ApplicationJson, UppushDeleteDeviceResponse200ApplicationJsonBuilder> {
  factory UppushDeleteDeviceResponse200ApplicationJson([
    final void Function(UppushDeleteDeviceResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushDeleteDeviceResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushDeleteDeviceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushDeleteDeviceResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<UppushDeleteDeviceResponse200ApplicationJson> get serializer =>
      _$uppushDeleteDeviceResponse200ApplicationJsonSerializer;
}

abstract class UppushCreateAppResponse200ApplicationJson
    implements Built<UppushCreateAppResponse200ApplicationJson, UppushCreateAppResponse200ApplicationJsonBuilder> {
  factory UppushCreateAppResponse200ApplicationJson([
    final void Function(UppushCreateAppResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushCreateAppResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushCreateAppResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushCreateAppResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  String get token;
  static Serializer<UppushCreateAppResponse200ApplicationJson> get serializer =>
      _$uppushCreateAppResponse200ApplicationJsonSerializer;
}

abstract class UppushDeleteAppResponse200ApplicationJson
    implements Built<UppushDeleteAppResponse200ApplicationJson, UppushDeleteAppResponse200ApplicationJsonBuilder> {
  factory UppushDeleteAppResponse200ApplicationJson([
    final void Function(UppushDeleteAppResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushDeleteAppResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushDeleteAppResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushDeleteAppResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<UppushDeleteAppResponse200ApplicationJson> get serializer =>
      _$uppushDeleteAppResponse200ApplicationJsonSerializer;
}

abstract class UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
    implements
        Built<UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
            UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  factory UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush([
    final void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int get version;
  static Serializer<UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush> get serializer =>
      _$uppushUnifiedpushDiscoveryResponse200ApplicationJsonUnifiedpushSerializer;
}

abstract class UppushUnifiedpushDiscoveryResponse200ApplicationJson
    implements
        Built<UppushUnifiedpushDiscoveryResponse200ApplicationJson,
            UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder> {
  factory UppushUnifiedpushDiscoveryResponse200ApplicationJson([
    final void Function(UppushUnifiedpushDiscoveryResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushUnifiedpushDiscoveryResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushUnifiedpushDiscoveryResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushUnifiedpushDiscoveryResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush get unifiedpush;
  static Serializer<UppushUnifiedpushDiscoveryResponse200ApplicationJson> get serializer =>
      _$uppushUnifiedpushDiscoveryResponse200ApplicationJsonSerializer;
}

abstract class UppushPushResponse201ApplicationJson
    implements Built<UppushPushResponse201ApplicationJson, UppushPushResponse201ApplicationJsonBuilder> {
  factory UppushPushResponse201ApplicationJson([final void Function(UppushPushResponse201ApplicationJsonBuilder)? b]) =
      _$UppushPushResponse201ApplicationJson;

  // coverage:ignore-start
  const UppushPushResponse201ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushPushResponse201ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<UppushPushResponse201ApplicationJson> get serializer =>
      _$uppushPushResponse201ApplicationJsonSerializer;
}

abstract class UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
    implements
        Built<UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
            UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  factory UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush([
    final void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)? b,
  ]) = _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush;

  // coverage:ignore-start
  const UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get gateway;
  static Serializer<UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush> get serializer =>
      _$uppushGatewayMatrixDiscoveryResponse200ApplicationJsonUnifiedpushSerializer;
}

abstract class UppushGatewayMatrixDiscoveryResponse200ApplicationJson
    implements
        Built<UppushGatewayMatrixDiscoveryResponse200ApplicationJson,
            UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder> {
  factory UppushGatewayMatrixDiscoveryResponse200ApplicationJson([
    final void Function(UppushGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushGatewayMatrixDiscoveryResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushGatewayMatrixDiscoveryResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushGatewayMatrixDiscoveryResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush get unifiedpush;
  static Serializer<UppushGatewayMatrixDiscoveryResponse200ApplicationJson> get serializer =>
      _$uppushGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer;
}

abstract class UppushGatewayMatrixResponse200ApplicationJson
    implements
        Built<UppushGatewayMatrixResponse200ApplicationJson, UppushGatewayMatrixResponse200ApplicationJsonBuilder> {
  factory UppushGatewayMatrixResponse200ApplicationJson([
    final void Function(UppushGatewayMatrixResponse200ApplicationJsonBuilder)? b,
  ]) = _$UppushGatewayMatrixResponse200ApplicationJson;

  // coverage:ignore-start
  const UppushGatewayMatrixResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UppushGatewayMatrixResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<String> get rejected;
  static Serializer<UppushGatewayMatrixResponse200ApplicationJson> get serializer =>
      _$uppushGatewayMatrixResponse200ApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(UppushCheckResponse200ApplicationJson),
        UppushCheckResponse200ApplicationJson.new,
      )
      ..add(UppushCheckResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushSetKeepaliveResponse200ApplicationJson),
        UppushSetKeepaliveResponse200ApplicationJson.new,
      )
      ..add(UppushSetKeepaliveResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushCreateDeviceResponse200ApplicationJson),
        UppushCreateDeviceResponse200ApplicationJson.new,
      )
      ..add(UppushCreateDeviceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushSyncDeviceResponse401ApplicationJson),
        UppushSyncDeviceResponse401ApplicationJson.new,
      )
      ..add(UppushSyncDeviceResponse401ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushDeleteDeviceResponse200ApplicationJson),
        UppushDeleteDeviceResponse200ApplicationJson.new,
      )
      ..add(UppushDeleteDeviceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushCreateAppResponse200ApplicationJson),
        UppushCreateAppResponse200ApplicationJson.new,
      )
      ..add(UppushCreateAppResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushDeleteAppResponse200ApplicationJson),
        UppushDeleteAppResponse200ApplicationJson.new,
      )
      ..add(UppushDeleteAppResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushUnifiedpushDiscoveryResponse200ApplicationJson),
        UppushUnifiedpushDiscoveryResponse200ApplicationJson.new,
      )
      ..add(UppushUnifiedpushDiscoveryResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush),
        UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush.new,
      )
      ..add(UppushUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(
        const FullType(UppushPushResponse201ApplicationJson),
        UppushPushResponse201ApplicationJson.new,
      )
      ..add(UppushPushResponse201ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushGatewayMatrixDiscoveryResponse200ApplicationJson),
        UppushGatewayMatrixDiscoveryResponse200ApplicationJson.new,
      )
      ..add(UppushGatewayMatrixDiscoveryResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush),
        UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush.new,
      )
      ..add(UppushGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush.serializer)
      ..addBuilderFactory(
        const FullType(UppushGatewayMatrixResponse200ApplicationJson),
        UppushGatewayMatrixResponse200ApplicationJson.new,
      )
      ..add(UppushGatewayMatrixResponse200ApplicationJson.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

Serializers get uppushSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeUppush<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeUppush<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
