// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'user_status.openapi.g.dart';

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
  UserStatusHeartbeatClient(this._rootClient);

  final UserStatusClient _rootClient;

  /// Keep the status alive
  Future<UserStatusHeartbeatHeartbeatResponseApplicationJson> heartbeat({
    required final String status,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/heartbeat';
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
    queryParameters['status'] = status;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusHeartbeatHeartbeatResponseApplicationJson),
      )! as UserStatusHeartbeatHeartbeatResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UserStatusPredefinedStatusClient {
  UserStatusPredefinedStatusClient(this._rootClient);

  final UserStatusClient _rootClient;

  /// Get all predefined messages
  Future<UserStatusPredefinedStatusFindAllResponseApplicationJson> findAll({final bool oCSAPIRequest = true}) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusPredefinedStatusFindAllResponseApplicationJson),
      )! as UserStatusPredefinedStatusFindAllResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UserStatusStatusesClient {
  UserStatusStatusesClient(this._rootClient);

  final UserStatusClient _rootClient;

  /// Find statuses of users
  Future<UserStatusStatusesFindAllResponseApplicationJson> findAll({
    final int? limit,
    final int? offset,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/statuses';
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
    if (offset != null) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusStatusesFindAllResponseApplicationJson),
      )! as UserStatusStatusesFindAllResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Find the status of a user
  Future<UserStatusStatusesFindResponseApplicationJson> find({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses/{userId}';
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
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusStatusesFindResponseApplicationJson),
      )! as UserStatusStatusesFindResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UserStatusUserStatusClient {
  UserStatusUserStatusClient(this._rootClient);

  final UserStatusClient _rootClient;

  /// Get the status of the current user
  Future<UserStatusUserStatusGetStatusResponseApplicationJson> getStatus({final bool oCSAPIRequest = true}) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusGetStatusResponseApplicationJson),
      )! as UserStatusUserStatusGetStatusResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update the status type of the current user
  Future<UserStatusUserStatusSetStatusResponseApplicationJson> setStatus({
    required final String statusType,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/status';
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
    queryParameters['statusType'] = statusType;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusSetStatusResponseApplicationJson),
      )! as UserStatusUserStatusSetStatusResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set the message to a predefined message for the current user
  Future<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson> setPredefinedMessage({
    required final String messageId,
    final int? clearAt,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined';
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
    queryParameters['messageId'] = messageId;
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson),
      )! as UserStatusUserStatusSetPredefinedMessageResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set the message to a custom message for the current user
  Future<UserStatusUserStatusSetCustomMessageResponseApplicationJson> setCustomMessage({
    final String? statusIcon,
    final String? message,
    final int? clearAt,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom';
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
    if (statusIcon != null) {
      queryParameters['statusIcon'] = statusIcon;
    }
    if (message != null) {
      queryParameters['message'] = message;
    }
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusSetCustomMessageResponseApplicationJson),
      )! as UserStatusUserStatusSetCustomMessageResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Clear the message of the current user
  Future<UserStatusUserStatusClearMessageResponseApplicationJson> clearMessage({
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
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
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusClearMessageResponseApplicationJson),
      )! as UserStatusUserStatusClearMessageResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Revert the status to the previous status
  Future<UserStatusUserStatusRevertStatusResponseApplicationJson> revertStatus({
    required final String messageId,
    final bool oCSAPIRequest = true,
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/revert/{messageId}';
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
    path = path.replaceAll('{messageId}', Uri.encodeQueryComponent(messageId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson),
      )! as UserStatusUserStatusRevertStatusResponseApplicationJson;
    }
    throw await DynamiteApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  UserStatusOCSMetaInterface rebuild(final void Function(UserStatusOCSMetaInterfaceBuilder) updates);
  UserStatusOCSMetaInterfaceBuilder toBuilder();
}

abstract class UserStatusOCSMeta
    implements UserStatusOCSMetaInterface, Built<UserStatusOCSMeta, UserStatusOCSMetaBuilder> {
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

  static Serializer<UserStatusOCSMeta> get serializer => _$userStatusOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusPublicInterface {
  String get userId;
  String? get message;
  String? get icon;
  int? get clearAt;
  String get status;
  UserStatusPublicInterface rebuild(final void Function(UserStatusPublicInterfaceBuilder) updates);
  UserStatusPublicInterfaceBuilder toBuilder();
}

abstract class UserStatusPublic implements UserStatusPublicInterface, Built<UserStatusPublic, UserStatusPublicBuilder> {
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

  static Serializer<UserStatusPublic> get serializer => _$userStatusPublicSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusPrivate_1Interface {
  String? get messageId;
  bool get messageIsPredefined;
  bool get statusIsUserDefined;
  UserStatusPrivate_1Interface rebuild(final void Function(UserStatusPrivate_1InterfaceBuilder) updates);
  UserStatusPrivate_1InterfaceBuilder toBuilder();
}

abstract class UserStatusPrivate
    implements
        UserStatusPublicInterface,
        UserStatusPrivate_1Interface,
        Built<UserStatusPrivate, UserStatusPrivateBuilder> {
  factory UserStatusPrivate([final void Function(UserStatusPrivateBuilder)? b]) = _$UserStatusPrivate;

  // coverage:ignore-start
  const UserStatusPrivate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPrivate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusPrivate> get serializer => _$userStatusPrivateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs
    implements
        UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterface,
        Built<UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs,
            UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder> {
  factory UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs([
    final void Function(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs> get serializer =>
      _$userStatusHeartbeatHeartbeatResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusHeartbeatHeartbeatResponseApplicationJsonInterface {
  UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs get ocs;
  UserStatusHeartbeatHeartbeatResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusHeartbeatHeartbeatResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusHeartbeatHeartbeatResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusHeartbeatHeartbeatResponseApplicationJson
    implements
        UserStatusHeartbeatHeartbeatResponseApplicationJsonInterface,
        Built<UserStatusHeartbeatHeartbeatResponseApplicationJson,
            UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder> {
  factory UserStatusHeartbeatHeartbeatResponseApplicationJson([
    final void Function(UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusHeartbeatHeartbeatResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusHeartbeatHeartbeatResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusHeartbeatHeartbeatResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusHeartbeatHeartbeatResponseApplicationJson> get serializer =>
      _$userStatusHeartbeatHeartbeatResponseApplicationJsonSerializer;
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
  factory UserStatusClearAt_Time([final void Function(UserStatusClearAt_TimeBuilder)? b]) = _$UserStatusClearAt_Time;

  // coverage:ignore-start
  const UserStatusClearAt_Time._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusClearAt_Time.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  int? get $int;
  UserStatusClearAtTimeType? get clearAtTimeType;
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
      result._$int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
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

@BuiltValue(instantiable: false)
abstract interface class UserStatusClearAtInterface {
  UserStatusClearAt_Type get type;
  UserStatusClearAt_Time get time;
  UserStatusClearAtInterface rebuild(final void Function(UserStatusClearAtInterfaceBuilder) updates);
  UserStatusClearAtInterfaceBuilder toBuilder();
}

abstract class UserStatusClearAt
    implements UserStatusClearAtInterface, Built<UserStatusClearAt, UserStatusClearAtBuilder> {
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

  static Serializer<UserStatusClearAt> get serializer => _$userStatusClearAtSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusPredefinedInterface {
  String get id;
  String get icon;
  String get message;
  UserStatusClearAt? get clearAt;
  bool? get visible;
  UserStatusPredefinedInterface rebuild(final void Function(UserStatusPredefinedInterfaceBuilder) updates);
  UserStatusPredefinedInterfaceBuilder toBuilder();
}

abstract class UserStatusPredefined
    implements UserStatusPredefinedInterface, Built<UserStatusPredefined, UserStatusPredefinedBuilder> {
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

  static Serializer<UserStatusPredefined> get serializer => _$userStatusPredefinedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  BuiltList<UserStatusPredefined> get data;
  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs
    implements
        UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterface,
        Built<UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs,
            UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder> {
  factory UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs([
    final void Function(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs> get serializer =>
      _$userStatusPredefinedStatusFindAllResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusPredefinedStatusFindAllResponseApplicationJsonInterface {
  UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs get ocs;
  UserStatusPredefinedStatusFindAllResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusPredefinedStatusFindAllResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusPredefinedStatusFindAllResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusPredefinedStatusFindAllResponseApplicationJson
    implements
        UserStatusPredefinedStatusFindAllResponseApplicationJsonInterface,
        Built<UserStatusPredefinedStatusFindAllResponseApplicationJson,
            UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder> {
  factory UserStatusPredefinedStatusFindAllResponseApplicationJson([
    final void Function(UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusPredefinedStatusFindAllResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusPredefinedStatusFindAllResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusPredefinedStatusFindAllResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusPredefinedStatusFindAllResponseApplicationJson> get serializer =>
      _$userStatusPredefinedStatusFindAllResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusStatusesFindAllResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  BuiltList<UserStatusPublic> get data;
  UserStatusStatusesFindAllResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusStatusesFindAllResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusStatusesFindAllResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusStatusesFindAllResponseApplicationJson_Ocs
    implements
        UserStatusStatusesFindAllResponseApplicationJson_OcsInterface,
        Built<UserStatusStatusesFindAllResponseApplicationJson_Ocs,
            UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder> {
  factory UserStatusStatusesFindAllResponseApplicationJson_Ocs([
    final void Function(UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusStatusesFindAllResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusStatusesFindAllResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindAllResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusStatusesFindAllResponseApplicationJson_Ocs> get serializer =>
      _$userStatusStatusesFindAllResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusStatusesFindAllResponseApplicationJsonInterface {
  UserStatusStatusesFindAllResponseApplicationJson_Ocs get ocs;
  UserStatusStatusesFindAllResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusStatusesFindAllResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusStatusesFindAllResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusStatusesFindAllResponseApplicationJson
    implements
        UserStatusStatusesFindAllResponseApplicationJsonInterface,
        Built<UserStatusStatusesFindAllResponseApplicationJson,
            UserStatusStatusesFindAllResponseApplicationJsonBuilder> {
  factory UserStatusStatusesFindAllResponseApplicationJson([
    final void Function(UserStatusStatusesFindAllResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusStatusesFindAllResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusStatusesFindAllResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindAllResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusStatusesFindAllResponseApplicationJson> get serializer =>
      _$userStatusStatusesFindAllResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusStatusesFindResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  UserStatusPublic get data;
  UserStatusStatusesFindResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusStatusesFindResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusStatusesFindResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusStatusesFindResponseApplicationJson_Ocs
    implements
        UserStatusStatusesFindResponseApplicationJson_OcsInterface,
        Built<UserStatusStatusesFindResponseApplicationJson_Ocs,
            UserStatusStatusesFindResponseApplicationJson_OcsBuilder> {
  factory UserStatusStatusesFindResponseApplicationJson_Ocs([
    final void Function(UserStatusStatusesFindResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusStatusesFindResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusStatusesFindResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusStatusesFindResponseApplicationJson_Ocs> get serializer =>
      _$userStatusStatusesFindResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusStatusesFindResponseApplicationJsonInterface {
  UserStatusStatusesFindResponseApplicationJson_Ocs get ocs;
  UserStatusStatusesFindResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusStatusesFindResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusStatusesFindResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusStatusesFindResponseApplicationJson
    implements
        UserStatusStatusesFindResponseApplicationJsonInterface,
        Built<UserStatusStatusesFindResponseApplicationJson, UserStatusStatusesFindResponseApplicationJsonBuilder> {
  factory UserStatusStatusesFindResponseApplicationJson([
    final void Function(UserStatusStatusesFindResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusStatusesFindResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusStatusesFindResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusStatusesFindResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusStatusesFindResponseApplicationJson> get serializer =>
      _$userStatusStatusesFindResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusGetStatusResponseApplicationJson_Ocs
    implements
        UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusUserStatusGetStatusResponseApplicationJson_Ocs,
            UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusGetStatusResponseApplicationJson_Ocs([
    final void Function(UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusGetStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusGetStatusResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusGetStatusResponseApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusGetStatusResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusGetStatusResponseApplicationJsonInterface {
  UserStatusUserStatusGetStatusResponseApplicationJson_Ocs get ocs;
  UserStatusUserStatusGetStatusResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusUserStatusGetStatusResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusUserStatusGetStatusResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusGetStatusResponseApplicationJson
    implements
        UserStatusUserStatusGetStatusResponseApplicationJsonInterface,
        Built<UserStatusUserStatusGetStatusResponseApplicationJson,
            UserStatusUserStatusGetStatusResponseApplicationJsonBuilder> {
  factory UserStatusUserStatusGetStatusResponseApplicationJson([
    final void Function(UserStatusUserStatusGetStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusGetStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusGetStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusGetStatusResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusGetStatusResponseApplicationJson> get serializer =>
      _$userStatusUserStatusGetStatusResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusSetStatusResponseApplicationJson_Ocs
    implements
        UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusUserStatusSetStatusResponseApplicationJson_Ocs,
            UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusSetStatusResponseApplicationJson_Ocs([
    final void Function(UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusSetStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetStatusResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusSetStatusResponseApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusSetStatusResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusSetStatusResponseApplicationJsonInterface {
  UserStatusUserStatusSetStatusResponseApplicationJson_Ocs get ocs;
  UserStatusUserStatusSetStatusResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusUserStatusSetStatusResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusUserStatusSetStatusResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusSetStatusResponseApplicationJson
    implements
        UserStatusUserStatusSetStatusResponseApplicationJsonInterface,
        Built<UserStatusUserStatusSetStatusResponseApplicationJson,
            UserStatusUserStatusSetStatusResponseApplicationJsonBuilder> {
  factory UserStatusUserStatusSetStatusResponseApplicationJson([
    final void Function(UserStatusUserStatusSetStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusSetStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusSetStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetStatusResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusSetStatusResponseApplicationJson> get serializer =>
      _$userStatusUserStatusSetStatusResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs
    implements
        UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
            UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs([
    final void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusSetPredefinedMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterface {
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs get ocs;
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusSetPredefinedMessageResponseApplicationJson
    implements
        UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterface,
        Built<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson,
            UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder> {
  factory UserStatusUserStatusSetPredefinedMessageResponseApplicationJson([
    final void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusSetPredefinedMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetPredefinedMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson> get serializer =>
      _$userStatusUserStatusSetPredefinedMessageResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  UserStatusPrivate get data;
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs
    implements
        UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs,
            UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs([
    final void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusSetCustomMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterface {
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs get ocs;
  UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusSetCustomMessageResponseApplicationJson
    implements
        UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterface,
        Built<UserStatusUserStatusSetCustomMessageResponseApplicationJson,
            UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder> {
  factory UserStatusUserStatusSetCustomMessageResponseApplicationJson([
    final void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusSetCustomMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusSetCustomMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusSetCustomMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusSetCustomMessageResponseApplicationJson> get serializer =>
      _$userStatusUserStatusSetCustomMessageResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  JsonObject get data;
  UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusClearMessageResponseApplicationJson_Ocs
    implements
        UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusUserStatusClearMessageResponseApplicationJson_Ocs,
            UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusClearMessageResponseApplicationJson_Ocs([
    final void Function(UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusClearMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusClearMessageResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusClearMessageResponseApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusClearMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusClearMessageResponseApplicationJsonInterface {
  UserStatusUserStatusClearMessageResponseApplicationJson_Ocs get ocs;
  UserStatusUserStatusClearMessageResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusUserStatusClearMessageResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusUserStatusClearMessageResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusClearMessageResponseApplicationJson
    implements
        UserStatusUserStatusClearMessageResponseApplicationJsonInterface,
        Built<UserStatusUserStatusClearMessageResponseApplicationJson,
            UserStatusUserStatusClearMessageResponseApplicationJsonBuilder> {
  factory UserStatusUserStatusClearMessageResponseApplicationJson([
    final void Function(UserStatusUserStatusClearMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusClearMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusClearMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusClearMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusClearMessageResponseApplicationJson> get serializer =>
      _$userStatusUserStatusClearMessageResponseApplicationJsonSerializer;
}

abstract class UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data
    implements
        Built<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data,
            UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder> {
  factory UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data([
    final void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  UserStatusPrivate? get private;
  JsonObject? get jsonObject;
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data> get serializer =>
      _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataSerializer();
}

class _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataSerializer
    implements PrimitiveSerializer<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data,
    _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data,
  ];

  @override
  final String wireName = 'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      result._private =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusPrivate))! as UserStatusPrivate)
              .toBuilder();
    } catch (_) {}
    try {
      result._jsonObject = _jsonSerializers.deserialize(data, specifiedType: const FullType(JsonObject))! as JsonObject;
    } catch (_) {}
    assert(
      [result._private, result._jsonObject].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterface {
  UserStatusOCSMeta get meta;
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data get data;
  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterface rebuild(
    final void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs
    implements
        UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs,
            UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs([
    final void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs> get serializer =>
      _$userStatusUserStatusRevertStatusResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusUserStatusRevertStatusResponseApplicationJsonInterface {
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs get ocs;
  UserStatusUserStatusRevertStatusResponseApplicationJsonInterface rebuild(
    final void Function(UserStatusUserStatusRevertStatusResponseApplicationJsonInterfaceBuilder) updates,
  );
  UserStatusUserStatusRevertStatusResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UserStatusUserStatusRevertStatusResponseApplicationJson
    implements
        UserStatusUserStatusRevertStatusResponseApplicationJsonInterface,
        Built<UserStatusUserStatusRevertStatusResponseApplicationJson,
            UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder> {
  factory UserStatusUserStatusRevertStatusResponseApplicationJson([
    final void Function(UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusUserStatusRevertStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusUserStatusRevertStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusUserStatusRevertStatusResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusUserStatusRevertStatusResponseApplicationJson> get serializer =>
      _$userStatusUserStatusRevertStatusResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusCapabilities_UserStatusInterface {
  bool get enabled;
  bool get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
  UserStatusCapabilities_UserStatusInterface rebuild(
    final void Function(UserStatusCapabilities_UserStatusInterfaceBuilder) updates,
  );
  UserStatusCapabilities_UserStatusInterfaceBuilder toBuilder();
}

abstract class UserStatusCapabilities_UserStatus
    implements
        UserStatusCapabilities_UserStatusInterface,
        Built<UserStatusCapabilities_UserStatus, UserStatusCapabilities_UserStatusBuilder> {
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

  static Serializer<UserStatusCapabilities_UserStatus> get serializer => _$userStatusCapabilitiesUserStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'user_status')
  UserStatusCapabilities_UserStatus get userStatus;
  UserStatusCapabilitiesInterface rebuild(final void Function(UserStatusCapabilitiesInterfaceBuilder) updates);
  UserStatusCapabilitiesInterfaceBuilder toBuilder();
}

abstract class UserStatusCapabilities
    implements UserStatusCapabilitiesInterface, Built<UserStatusCapabilities, UserStatusCapabilitiesBuilder> {
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

  static Serializer<UserStatusCapabilities> get serializer => _$userStatusCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(UserStatusHeartbeatHeartbeatResponseApplicationJson),
        UserStatusHeartbeatHeartbeatResponseApplicationJson.new,
      )
      ..add(UserStatusHeartbeatHeartbeatResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs),
        UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UserStatusOCSMeta), UserStatusOCSMeta.new)
      ..add(UserStatusOCSMeta.serializer)
      ..addBuilderFactory(const FullType(UserStatusPrivate), UserStatusPrivate.new)
      ..add(UserStatusPrivate.serializer)
      ..addBuilderFactory(const FullType(UserStatusPublic), UserStatusPublic.new)
      ..add(UserStatusPublic.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusPredefinedStatusFindAllResponseApplicationJson),
        UserStatusPredefinedStatusFindAllResponseApplicationJson.new,
      )
      ..add(UserStatusPredefinedStatusFindAllResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs),
        UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs.serializer)
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
        const FullType(UserStatusStatusesFindAllResponseApplicationJson),
        UserStatusStatusesFindAllResponseApplicationJson.new,
      )
      ..add(UserStatusStatusesFindAllResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusStatusesFindAllResponseApplicationJson_Ocs),
        UserStatusStatusesFindAllResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusStatusesFindAllResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(UserStatusPublic)]), ListBuilder<UserStatusPublic>.new)
      ..addBuilderFactory(
        const FullType(UserStatusStatusesFindResponseApplicationJson),
        UserStatusStatusesFindResponseApplicationJson.new,
      )
      ..add(UserStatusStatusesFindResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusStatusesFindResponseApplicationJson_Ocs),
        UserStatusStatusesFindResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusStatusesFindResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusGetStatusResponseApplicationJson),
        UserStatusUserStatusGetStatusResponseApplicationJson.new,
      )
      ..add(UserStatusUserStatusGetStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusGetStatusResponseApplicationJson_Ocs),
        UserStatusUserStatusGetStatusResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusGetStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetStatusResponseApplicationJson),
        UserStatusUserStatusSetStatusResponseApplicationJson.new,
      )
      ..add(UserStatusUserStatusSetStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetStatusResponseApplicationJson_Ocs),
        UserStatusUserStatusSetStatusResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusSetStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson),
        UserStatusUserStatusSetPredefinedMessageResponseApplicationJson.new,
      )
      ..add(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs),
        UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetCustomMessageResponseApplicationJson),
        UserStatusUserStatusSetCustomMessageResponseApplicationJson.new,
      )
      ..add(UserStatusUserStatusSetCustomMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs),
        UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusClearMessageResponseApplicationJson),
        UserStatusUserStatusClearMessageResponseApplicationJson.new,
      )
      ..add(UserStatusUserStatusClearMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusClearMessageResponseApplicationJson_Ocs),
        UserStatusUserStatusClearMessageResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusClearMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson),
        UserStatusUserStatusRevertStatusResponseApplicationJson.new,
      )
      ..add(UserStatusUserStatusRevertStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs),
        UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data),
        UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data.serializer)
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
