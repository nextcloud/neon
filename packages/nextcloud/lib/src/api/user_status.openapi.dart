// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'user_status.openapi.g.dart';

class UserStatusResponse<T, U> extends DynamiteResponse<T, U> {
  UserStatusResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'UserStatusResponse(data: $data, headers: $headers)';
}

class UserStatusApiException extends DynamiteApiException {
  UserStatusApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<UserStatusApiException> fromResponse(final HttpClientResponse response) async {
    final data = await response.bodyBytes;

    String body;
    try {
      body = utf8.decode(data);
    } on FormatException {
      body = 'binary';
    }

    return UserStatusApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'UserStatusApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class UserStatusClient extends DynamiteClient {
  UserStatusClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  UserStatusClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  UserStatusHeartbeatClient get heartbeat => UserStatusHeartbeatClient(this);
  UserStatusPredefinedStatusClient get predefinedStatus => UserStatusPredefinedStatusClient(this);
  UserStatusStatusesClient get statuses => UserStatusStatusesClient(this);
  UserStatusUserStatusClient get userStatus => UserStatusUserStatusClient(this);
}

class UserStatusHeartbeatClient {
  UserStatusHeartbeatClient(this.rootClient);

  final UserStatusClient rootClient;

  /// Keep the status alive
  Future<UserStatusHeartbeatHeartbeatResponse200ApplicationJson> heartbeat({
    required final String status,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/heartbeat';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['status'] = status;
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusHeartbeatHeartbeatResponse200ApplicationJson),
      )! as UserStatusHeartbeatHeartbeatResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UserStatusPredefinedStatusClient {
  UserStatusPredefinedStatusClient(this.rootClient);

  final UserStatusClient rootClient;

  /// Get all predefined messages
  Future<UserStatusPredefinedStatusFindAllResponse200ApplicationJson> findAll({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusPredefinedStatusFindAllResponse200ApplicationJson),
      )! as UserStatusPredefinedStatusFindAllResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UserStatusStatusesClient {
  UserStatusStatusesClient(this.rootClient);

  final UserStatusClient rootClient;

  /// Find statuses of users
  Future<UserStatusStatusesFindAllResponse200ApplicationJson> findAll({
    final int? limit,
    final int? offset,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != null) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusStatusesFindAllResponse200ApplicationJson),
      )! as UserStatusStatusesFindAllResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Find the status of a user
  Future<UserStatusStatusesFindResponse200ApplicationJson> find({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusStatusesFindResponse200ApplicationJson),
      )! as UserStatusStatusesFindResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UserStatusUserStatusClient {
  UserStatusUserStatusClient(this.rootClient);

  final UserStatusClient rootClient;

  /// Get the status of the current user
  Future<UserStatusUserStatusGetStatusResponse200ApplicationJson> getStatus({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusGetStatusResponse200ApplicationJson),
      )! as UserStatusUserStatusGetStatusResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update the status type of the current user
  Future<UserStatusUserStatusSetStatusResponse200ApplicationJson> setStatus({
    required final String statusType,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['statusType'] = statusType;
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusSetStatusResponse200ApplicationJson),
      )! as UserStatusUserStatusSetStatusResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set the message to a predefined message for the current user
  Future<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson> setPredefinedMessage({
    required final String messageId,
    final int? clearAt,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['messageId'] = messageId;
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson),
      )! as UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set the message to a custom message for the current user
  Future<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson> setCustomMessage({
    final String? statusIcon,
    final String? message,
    final int? clearAt,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (statusIcon != null) {
      queryParameters['statusIcon'] = statusIcon;
    }
    if (message != null) {
      queryParameters['message'] = message;
    }
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson),
      )! as UserStatusUserStatusSetCustomMessageResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Clear the message of the current user
  Future<UserStatusUserStatusClearMessageResponse200ApplicationJson> clearMessage({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusClearMessageResponse200ApplicationJson),
      )! as UserStatusUserStatusClearMessageResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Revert the status to the previous status
  Future<UserStatusUserStatusRevertStatusResponse200ApplicationJson> revertStatus({
    required final String messageId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/revert/{messageId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{messageId}', Uri.encodeQueryComponent(messageId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson),
      )! as UserStatusUserStatusRevertStatusResponse200ApplicationJson;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class UserStatusOCSMeta implements Built<UserStatusOCSMeta, UserStatusOCSMetaBuilder> {
  factory UserStatusOCSMeta([final void Function(UserStatusOCSMetaBuilder)? b]) = _$UserStatusOCSMeta;

  // coverage:ignore-start
  const UserStatusOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<UserStatusOCSMeta> get serializer => _$userStatusOCSMetaSerializer;
}

abstract class UserStatusPublic implements Built<UserStatusPublic, UserStatusPublicBuilder> {
  factory UserStatusPublic([final void Function(UserStatusPublicBuilder)? b]) = _$UserStatusPublic;

  // coverage:ignore-start
  const UserStatusPublic._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPublic.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get userId;
  String? get message;
  String? get icon;
  int? get clearAt;
  String get status;
  static Serializer<UserStatusPublic> get serializer => _$userStatusPublicSerializer;
}

abstract class UserStatusPrivate1 implements Built<UserStatusPrivate1, UserStatusPrivate1Builder> {
  factory UserStatusPrivate1([final void Function(UserStatusPrivate1Builder)? b]) = _$UserStatusPrivate1;

  // coverage:ignore-start
  const UserStatusPrivate1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPrivate1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String? get messageId;
  bool get messageIsPredefined;
  bool get statusIsUserDefined;
  static Serializer<UserStatusPrivate1> get serializer => _$userStatusPrivate1Serializer;
}

abstract class UserStatusPrivate implements Built<UserStatusPrivate, UserStatusPrivateBuilder> {
  // coverage:ignore-end

  factory UserStatusPrivate([final void Function(UserStatusPrivateBuilder)? b]) = _$UserStatusPrivate;
  // coverage:ignore-start
  const UserStatusPrivate._();

  JsonObject get data;
  UserStatusPublic get public;
  UserStatusPrivate1 get private1;
  static UserStatusPrivate fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusPrivate> get serializer => _$UserStatusPrivateSerializer();
}

class _$UserStatusPrivateSerializer implements PrimitiveSerializer<UserStatusPrivate> {
  @override
  final Iterable<Type> types = const [UserStatusPrivate, _$UserStatusPrivate];

  @override
  final String wireName = 'UserStatusPrivate';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusPrivate object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusPrivate deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusPrivateBuilder()..data = JsonObject(data);
    result.public.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusPublic))! as UserStatusPublic,
    );
    result.private1.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusPrivate1))! as UserStatusPrivate1,
    );
    return result.build();
  }
}

abstract class UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs,
            UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs([
    final void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  static Serializer<UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusHeartbeatHeartbeatResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusHeartbeatHeartbeatResponse200ApplicationJson
    implements
        Built<UserStatusHeartbeatHeartbeatResponse200ApplicationJson,
            UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder> {
  factory UserStatusHeartbeatHeartbeatResponse200ApplicationJson([
    final void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusHeartbeatHeartbeatResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusHeartbeatHeartbeatResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusHeartbeatHeartbeatResponse200ApplicationJson> get serializer =>
      _$userStatusHeartbeatHeartbeatResponse200ApplicationJsonSerializer;
}

class UserStatusClearAt_Type extends EnumClass {
  const UserStatusClearAt_Type._(super.name);

  static const UserStatusClearAt_Type period = _$userStatusClearAtTypePeriod;

  @BuiltValueEnumConst(wireName: 'end-of')
  static const UserStatusClearAt_Type endOf = _$userStatusClearAtTypeEndOf;

  // coverage:ignore-start
  static BuiltSet<UserStatusClearAt_Type> get values => _$userStatusClearAtTypeValues;
  // coverage:ignore-end
  static UserStatusClearAt_Type valueOf(final String name) => _$valueOfUserStatusClearAt_Type(name);
  static Serializer<UserStatusClearAt_Type> get serializer => _$userStatusClearAtTypeSerializer;
}

class UserStatusClearAtTimeType extends EnumClass {
  const UserStatusClearAtTimeType._(super.name);

  static const UserStatusClearAtTimeType day = _$userStatusClearAtTimeTypeDay;

  static const UserStatusClearAtTimeType week = _$userStatusClearAtTimeTypeWeek;

  // coverage:ignore-start
  static BuiltSet<UserStatusClearAtTimeType> get values => _$userStatusClearAtTimeTypeValues;
  // coverage:ignore-end
  static UserStatusClearAtTimeType valueOf(final String name) => _$valueOfUserStatusClearAtTimeType(name);
  static Serializer<UserStatusClearAtTimeType> get serializer => _$userStatusClearAtTimeTypeSerializer;
}

abstract class UserStatusClearAt_Time implements Built<UserStatusClearAt_Time, UserStatusClearAt_TimeBuilder> {
  // coverage:ignore-end

  factory UserStatusClearAt_Time([final void Function(UserStatusClearAt_TimeBuilder)? b]) = _$UserStatusClearAt_Time;
  // coverage:ignore-start
  const UserStatusClearAt_Time._();

  JsonObject get data;
  int? get $int;
  UserStatusClearAtTimeType? get clearAtTimeType;
  static UserStatusClearAt_Time fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusClearAt_Time> get serializer => _$UserStatusClearAt_TimeSerializer();
}

class _$UserStatusClearAt_TimeSerializer implements PrimitiveSerializer<UserStatusClearAt_Time> {
  @override
  final Iterable<Type> types = const [UserStatusClearAt_Time, _$UserStatusClearAt_Time];

  @override
  final String wireName = 'UserStatusClearAt_Time';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusClearAt_Time object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusClearAt_Time deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusClearAt_TimeBuilder()..data = JsonObject(data);
    try {
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._clearAtTimeType = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(UserStatusClearAtTimeType),
      )! as UserStatusClearAtTimeType;
    } catch (_) {}
    assert(
      [result._$int, result._clearAtTimeType].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class UserStatusClearAt implements Built<UserStatusClearAt, UserStatusClearAtBuilder> {
  factory UserStatusClearAt([final void Function(UserStatusClearAtBuilder)? b]) = _$UserStatusClearAt;

  // coverage:ignore-start
  const UserStatusClearAt._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusClearAt.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusClearAt_Type get type;
  UserStatusClearAt_Time get time;
  static Serializer<UserStatusClearAt> get serializer => _$userStatusClearAtSerializer;
}

abstract class UserStatusPredefined implements Built<UserStatusPredefined, UserStatusPredefinedBuilder> {
  factory UserStatusPredefined([final void Function(UserStatusPredefinedBuilder)? b]) = _$UserStatusPredefined;

  // coverage:ignore-start
  const UserStatusPredefined._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPredefined.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get id;
  String get icon;
  String get message;
  UserStatusClearAt? get clearAt;
  bool? get visible;
  static Serializer<UserStatusPredefined> get serializer => _$userStatusPredefinedSerializer;
}

abstract class UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs,
            UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs([
    final void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  BuiltList<UserStatusPredefined> get data;
  static Serializer<UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusPredefinedStatusFindAllResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusPredefinedStatusFindAllResponse200ApplicationJson
    implements
        Built<UserStatusPredefinedStatusFindAllResponse200ApplicationJson,
            UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder> {
  factory UserStatusPredefinedStatusFindAllResponse200ApplicationJson([
    final void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusPredefinedStatusFindAllResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPredefinedStatusFindAllResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusPredefinedStatusFindAllResponse200ApplicationJson> get serializer =>
      _$userStatusPredefinedStatusFindAllResponse200ApplicationJsonSerializer;
}

abstract class UserStatusStatusesFindAllResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusStatusesFindAllResponse200ApplicationJson_Ocs,
            UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusStatusesFindAllResponse200ApplicationJson_Ocs([
    final void Function(UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusStatusesFindAllResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindAllResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  BuiltList<UserStatusPublic> get data;
  static Serializer<UserStatusStatusesFindAllResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusStatusesFindAllResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusStatusesFindAllResponse200ApplicationJson
    implements
        Built<UserStatusStatusesFindAllResponse200ApplicationJson,
            UserStatusStatusesFindAllResponse200ApplicationJsonBuilder> {
  factory UserStatusStatusesFindAllResponse200ApplicationJson([
    final void Function(UserStatusStatusesFindAllResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusStatusesFindAllResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusStatusesFindAllResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindAllResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusStatusesFindAllResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusStatusesFindAllResponse200ApplicationJson> get serializer =>
      _$userStatusStatusesFindAllResponse200ApplicationJsonSerializer;
}

abstract class UserStatusStatusesFindResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusStatusesFindResponse200ApplicationJson_Ocs,
            UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusStatusesFindResponse200ApplicationJson_Ocs([
    final void Function(UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusStatusesFindResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusStatusesFindResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  UserStatusPublic get data;
  static Serializer<UserStatusStatusesFindResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusStatusesFindResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusStatusesFindResponse200ApplicationJson
    implements
        Built<UserStatusStatusesFindResponse200ApplicationJson,
            UserStatusStatusesFindResponse200ApplicationJsonBuilder> {
  factory UserStatusStatusesFindResponse200ApplicationJson([
    final void Function(UserStatusStatusesFindResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusStatusesFindResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusStatusesFindResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusStatusesFindResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusStatusesFindResponse200ApplicationJson> get serializer =>
      _$userStatusStatusesFindResponse200ApplicationJsonSerializer;
}

abstract class UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs,
            UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs([
    final void Function(UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  static Serializer<UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusGetStatusResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusUserStatusGetStatusResponse200ApplicationJson
    implements
        Built<UserStatusUserStatusGetStatusResponse200ApplicationJson,
            UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder> {
  factory UserStatusUserStatusGetStatusResponse200ApplicationJson([
    final void Function(UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusGetStatusResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusGetStatusResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusGetStatusResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusUserStatusGetStatusResponse200ApplicationJson> get serializer =>
      _$userStatusUserStatusGetStatusResponse200ApplicationJsonSerializer;
}

abstract class UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs,
            UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs([
    final void Function(UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  static Serializer<UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusSetStatusResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusUserStatusSetStatusResponse200ApplicationJson
    implements
        Built<UserStatusUserStatusSetStatusResponse200ApplicationJson,
            UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder> {
  factory UserStatusUserStatusSetStatusResponse200ApplicationJson([
    final void Function(UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusSetStatusResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusSetStatusResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetStatusResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusUserStatusSetStatusResponse200ApplicationJson> get serializer =>
      _$userStatusUserStatusSetStatusResponse200ApplicationJsonSerializer;
}

abstract class UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs,
            UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs([
    final void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  static Serializer<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson
    implements
        Built<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson,
            UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder> {
  factory UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson([
    final void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson> get serializer =>
      _$userStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonSerializer;
}

abstract class UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs,
            UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs([
    final void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  static Serializer<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusSetCustomMessageResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusUserStatusSetCustomMessageResponse200ApplicationJson
    implements
        Built<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson,
            UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder> {
  factory UserStatusUserStatusSetCustomMessageResponse200ApplicationJson([
    final void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusSetCustomMessageResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetCustomMessageResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson> get serializer =>
      _$userStatusUserStatusSetCustomMessageResponse200ApplicationJsonSerializer;
}

abstract class UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs,
            UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs([
    final void Function(UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  JsonObject get data;
  static Serializer<UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusClearMessageResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusUserStatusClearMessageResponse200ApplicationJson
    implements
        Built<UserStatusUserStatusClearMessageResponse200ApplicationJson,
            UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder> {
  factory UserStatusUserStatusClearMessageResponse200ApplicationJson([
    final void Function(UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusClearMessageResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusClearMessageResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusClearMessageResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusUserStatusClearMessageResponse200ApplicationJson> get serializer =>
      _$userStatusUserStatusClearMessageResponse200ApplicationJsonSerializer;
}

abstract class UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data
    implements
        Built<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data,
            UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder> {
  // coverage:ignore-end

  factory UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data([
    final void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data;
  // coverage:ignore-start
  const UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data._();

  JsonObject get data;
  UserStatusPrivate? get private;
  JsonObject? get jsonObject;
  static UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataSerializer();
}

class _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataSerializer
    implements PrimitiveSerializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data,
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data
  ];

  @override
  final String wireName = 'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder()
      ..data = JsonObject(data);
    try {
      result._private =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusPrivate))! as UserStatusPrivate)
              .toBuilder();
    } catch (_) {}
    try {
      result._jsonObject = data as JsonObject?;
    } catch (_) {}
    assert(
      [result._private, result._jsonObject].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs
    implements
        Built<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs,
            UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs([
    final void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusOCSMeta get meta;
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusRevertStatusResponse200ApplicationJsonOcsSerializer;
}

abstract class UserStatusUserStatusRevertStatusResponse200ApplicationJson
    implements
        Built<UserStatusUserStatusRevertStatusResponse200ApplicationJson,
            UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder> {
  factory UserStatusUserStatusRevertStatusResponse200ApplicationJson([
    final void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusRevertStatusResponse200ApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusRevertStatusResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusRevertStatusResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson> get serializer =>
      _$userStatusUserStatusRevertStatusResponse200ApplicationJsonSerializer;
}

abstract class UserStatusCapabilities_UserStatus
    implements Built<UserStatusCapabilities_UserStatus, UserStatusCapabilities_UserStatusBuilder> {
  factory UserStatusCapabilities_UserStatus([final void Function(UserStatusCapabilities_UserStatusBuilder)? b]) =
      _$UserStatusCapabilities_UserStatus;

  // coverage:ignore-start
  const UserStatusCapabilities_UserStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusCapabilities_UserStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get enabled;
  bool get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
  static Serializer<UserStatusCapabilities_UserStatus> get serializer => _$userStatusCapabilitiesUserStatusSerializer;
}

abstract class UserStatusCapabilities implements Built<UserStatusCapabilities, UserStatusCapabilitiesBuilder> {
  factory UserStatusCapabilities([final void Function(UserStatusCapabilitiesBuilder)? b]) = _$UserStatusCapabilities;

  // coverage:ignore-start
  const UserStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'user_status')
  UserStatusCapabilities_UserStatus get userStatus;
  static Serializer<UserStatusCapabilities> get serializer => _$userStatusCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(UserStatusHeartbeatHeartbeatResponse200ApplicationJson),
        UserStatusHeartbeatHeartbeatResponse200ApplicationJson.new,
      )
      ..add(UserStatusHeartbeatHeartbeatResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs),
        UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UserStatusOCSMeta), UserStatusOCSMeta.new)
      ..add(UserStatusOCSMeta.serializer)
      ..addBuilderFactory(const FullType(UserStatusPrivate), UserStatusPrivate.new)
      ..add(UserStatusPrivate.serializer)
      ..addBuilderFactory(const FullType(UserStatusPublic), UserStatusPublic.new)
      ..add(UserStatusPublic.serializer)
      ..addBuilderFactory(const FullType(UserStatusPrivate1), UserStatusPrivate1.new)
      ..add(UserStatusPrivate1.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusPredefinedStatusFindAllResponse200ApplicationJson),
        UserStatusPredefinedStatusFindAllResponse200ApplicationJson.new,
      )
      ..add(UserStatusPredefinedStatusFindAllResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs),
        UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UserStatusPredefined), UserStatusPredefined.new)
      ..add(UserStatusPredefined.serializer)
      ..addBuilderFactory(const FullType(UserStatusClearAt), UserStatusClearAt.new)
      ..add(UserStatusClearAt.serializer)
      ..add(UserStatusClearAt_Type.serializer)
      ..addBuilderFactory(const FullType(UserStatusClearAt_Time), UserStatusClearAt_Time.new)
      ..add(UserStatusClearAt_Time.serializer)
      ..add(UserStatusClearAtTimeType.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserStatusPredefined)]),
        ListBuilder<UserStatusPredefined>.new,
      )
      ..addBuilderFactory(
        const FullType(UserStatusStatusesFindAllResponse200ApplicationJson),
        UserStatusStatusesFindAllResponse200ApplicationJson.new,
      )
      ..add(UserStatusStatusesFindAllResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusStatusesFindAllResponse200ApplicationJson_Ocs),
        UserStatusStatusesFindAllResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusStatusesFindAllResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(UserStatusPublic)]), ListBuilder<UserStatusPublic>.new)
      ..addBuilderFactory(
        const FullType(UserStatusStatusesFindResponse200ApplicationJson),
        UserStatusStatusesFindResponse200ApplicationJson.new,
      )
      ..add(UserStatusStatusesFindResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusStatusesFindResponse200ApplicationJson_Ocs),
        UserStatusStatusesFindResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusStatusesFindResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusGetStatusResponse200ApplicationJson),
        UserStatusUserStatusGetStatusResponse200ApplicationJson.new,
      )
      ..add(UserStatusUserStatusGetStatusResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs),
        UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetStatusResponse200ApplicationJson),
        UserStatusUserStatusSetStatusResponse200ApplicationJson.new,
      )
      ..add(UserStatusUserStatusSetStatusResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs),
        UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson),
        UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson.new,
      )
      ..add(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs),
        UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson),
        UserStatusUserStatusSetCustomMessageResponse200ApplicationJson.new,
      )
      ..add(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs),
        UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusClearMessageResponse200ApplicationJson),
        UserStatusUserStatusClearMessageResponse200ApplicationJson.new,
      )
      ..add(UserStatusUserStatusClearMessageResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs),
        UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson),
        UserStatusUserStatusRevertStatusResponse200ApplicationJson.new,
      )
      ..add(UserStatusUserStatusRevertStatusResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs),
        UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data),
        UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(UserStatusCapabilities), UserStatusCapabilities.new)
      ..add(UserStatusCapabilities.serializer)
      ..addBuilderFactory(const FullType(UserStatusCapabilities_UserStatus), UserStatusCapabilities_UserStatus.new)
      ..add(UserStatusCapabilities_UserStatus.serializer))
    .build();

Serializers get userStatusSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeUserStatus<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeUserStatus<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
