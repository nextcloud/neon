// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
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
    String body;
    try {
      body = await response.body;
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
  Future<UppushCheckResponseApplicationJson> check() async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushCheckResponseApplicationJson),
      )! as UppushCheckResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set keepalive interval
  ///
  /// This endpoint requires admin access
  Future<UppushSetKeepaliveResponseApplicationJson> setKeepalive({required final int keepalive}) async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushSetKeepaliveResponseApplicationJson),
      )! as UppushSetKeepaliveResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to create a new deviceId
  Future<UppushCreateDeviceResponseApplicationJson> createDevice({required final String deviceName}) async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushCreateDeviceResponseApplicationJson),
      )! as UppushCreateDeviceResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to get push messages
  ///
  /// This is a public page since it has to be handle by the non-connected app (NextPush app and not Nextcloud-app)
  Future<UppushSyncDeviceResponseApplicationJson> syncDevice({required final String deviceId}) async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 401) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushSyncDeviceResponseApplicationJson),
      )! as UppushSyncDeviceResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a device
  Future<UppushDeleteDeviceResponseApplicationJson> deleteDevice({required final String deviceId}) async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushDeleteDeviceResponseApplicationJson),
      )! as UppushDeleteDeviceResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create an authorization token for a new 3rd party service
  Future<UppushCreateAppResponseApplicationJson> createApp({
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushCreateAppResponseApplicationJson),
      )! as UppushCreateAppResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete an authorization token
  Future<UppushDeleteAppResponseApplicationJson> deleteApp({required final String token}) async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushDeleteAppResponseApplicationJson),
      )! as UppushDeleteAppResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Unifiedpush discovery Following specifications
  Future<UppushUnifiedpushDiscoveryResponseApplicationJson> unifiedpushDiscovery({required final String token}) async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushUnifiedpushDiscoveryResponseApplicationJson),
      )! as UppushUnifiedpushDiscoveryResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Receive notifications from 3rd parties
  Future<UppushPushResponseApplicationJson> push({required final String token}) async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 201) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushPushResponseApplicationJson),
      )! as UppushPushResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway discovery
  Future<UppushGatewayMatrixDiscoveryResponseApplicationJson> gatewayMatrixDiscovery() async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushGatewayMatrixDiscoveryResponseApplicationJson),
      )! as UppushGatewayMatrixDiscoveryResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway
  Future<UppushGatewayMatrixResponseApplicationJson> gatewayMatrix() async {
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UppushGatewayMatrixResponseApplicationJson),
      )! as UppushGatewayMatrixResponseApplicationJson;
    }
    throw await UppushApiException.fromResponse(response); // coverage:ignore-line
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

Serializers get uppushSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeUppush<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeUppush<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
