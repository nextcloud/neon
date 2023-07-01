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

  Future<UserStatusGetPublicStatuses> getPublicStatuses() async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusGetPublicStatuses),
      )! as UserStatusGetPublicStatuses;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetPublicStatus> getPublicStatus({required final String userId}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusGetPublicStatus),
      )! as UserStatusGetPublicStatus;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetStatus> getStatus() async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(UserStatusGetStatus))!
          as UserStatusGetStatus;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetStatus> setStatus({required final UserStatusType statusType}) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['statusType'] = statusType.name;
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(UserStatusGetStatus))!
          as UserStatusGetStatus;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetStatus> setPredefinedMessage({
    required final String messageId,
    final int? clearAt,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['messageId'] = messageId;
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(UserStatusGetStatus))!
          as UserStatusGetStatus;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetStatus> setCustomMessage({
    final String? statusIcon,
    final String? message,
    final int? clearAt,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    if (statusIcon != null) {
      queryParameters['statusIcon'] = statusIcon;
    }
    if (message != null) {
      queryParameters['message'] = message;
    }
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(UserStatusGetStatus))!
          as UserStatusGetStatus;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future clearMessage() async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusPredefinedStatuses> getPredefinedStatuses() async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UserStatusPredefinedStatuses),
      )! as UserStatusPredefinedStatuses;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusHeartbeat> heartbeat({required final UserStatusType status}) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/heartbeat';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['status'] = status.name;
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(UserStatusHeartbeat))!
          as UserStatusHeartbeat;
    }
    throw await UserStatusApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class UserStatusOCSMeta implements Built<UserStatusOCSMeta, UserStatusOCSMetaBuilder> {
  factory UserStatusOCSMeta([final void Function(UserStatusOCSMetaBuilder)? b]) = _$UserStatusOCSMeta;
  const UserStatusOCSMeta._();

  factory UserStatusOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<UserStatusOCSMeta> get serializer => _$userStatusOCSMetaSerializer;
}

class UserStatusClearAt_Type extends EnumClass {
  const UserStatusClearAt_Type._(super.name);

  static const UserStatusClearAt_Type period = _$userStatusClearAtTypePeriod;

  @BuiltValueEnumConst(wireName: 'end-of')
  static const UserStatusClearAt_Type endOf = _$userStatusClearAtTypeEndOf;

  static BuiltSet<UserStatusClearAt_Type> get values => _$userStatusClearAtTypeValues;
  static UserStatusClearAt_Type valueOf(final String name) => _$valueOfUserStatusClearAt_Type(name);
  static Serializer<UserStatusClearAt_Type> get serializer => _$userStatusClearAtTypeSerializer;
}

class UserStatusClearAt_Time0 extends EnumClass {
  const UserStatusClearAt_Time0._(super.name);

  static const UserStatusClearAt_Time0 day = _$userStatusClearAtTime0Day;

  static const UserStatusClearAt_Time0 week = _$userStatusClearAtTime0Week;

  static BuiltSet<UserStatusClearAt_Time0> get values => _$userStatusClearAtTime0Values;
  static UserStatusClearAt_Time0 valueOf(final String name) => _$valueOfUserStatusClearAt_Time0(name);
  static Serializer<UserStatusClearAt_Time0> get serializer => _$userStatusClearAtTime0Serializer;
}

abstract class UserStatusClearAt_Time implements Built<UserStatusClearAt_Time, UserStatusClearAt_TimeBuilder> {
  factory UserStatusClearAt_Time([final void Function(UserStatusClearAt_TimeBuilder)? b]) = _$UserStatusClearAt_Time;
  const UserStatusClearAt_Time._();

  JsonObject get data;
  UserStatusClearAt_Time0? get clearAtTime0;

  /// Time offset in seconds
  int? get $int;
  static UserStatusClearAt_Time fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
      result._clearAtTime0 = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(UserStatusClearAt_Time0),
      )! as UserStatusClearAt_Time0;
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert(
      [result._clearAtTime0, result._$int].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class UserStatusClearAt implements Built<UserStatusClearAt, UserStatusClearAtBuilder> {
  factory UserStatusClearAt([final void Function(UserStatusClearAtBuilder)? b]) = _$UserStatusClearAt;
  const UserStatusClearAt._();

  factory UserStatusClearAt.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusClearAt_Type get type;
  UserStatusClearAt_Time get time;
  static Serializer<UserStatusClearAt> get serializer => _$userStatusClearAtSerializer;
}

abstract class UserStatusPublicStatus_ClearAt
    implements Built<UserStatusPublicStatus_ClearAt, UserStatusPublicStatus_ClearAtBuilder> {
  factory UserStatusPublicStatus_ClearAt([final void Function(UserStatusPublicStatus_ClearAtBuilder)? b]) =
      _$UserStatusPublicStatus_ClearAt;
  const UserStatusPublicStatus_ClearAt._();

  JsonObject get data;
  UserStatusClearAt? get clearAt;

  /// Time as unix timestamp
  int? get $int;
  static UserStatusPublicStatus_ClearAt fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusPublicStatus_ClearAt> get serializer => _$UserStatusPublicStatus_ClearAtSerializer();
}

class _$UserStatusPublicStatus_ClearAtSerializer implements PrimitiveSerializer<UserStatusPublicStatus_ClearAt> {
  @override
  final Iterable<Type> types = const [UserStatusPublicStatus_ClearAt, _$UserStatusPublicStatus_ClearAt];

  @override
  final String wireName = 'UserStatusPublicStatus_ClearAt';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusPublicStatus_ClearAt object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusPublicStatus_ClearAt deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusPublicStatus_ClearAtBuilder()..data = JsonObject(data);
    try {
      result._clearAt =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusClearAt))! as UserStatusClearAt)
              .toBuilder();
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert([result._clearAt, result._$int].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

class UserStatusType extends EnumClass {
  const UserStatusType._(super.name);

  static const UserStatusType online = _$userStatusTypeOnline;

  static const UserStatusType offline = _$userStatusTypeOffline;

  static const UserStatusType dnd = _$userStatusTypeDnd;

  static const UserStatusType away = _$userStatusTypeAway;

  static const UserStatusType invisible = _$userStatusTypeInvisible;

  static BuiltSet<UserStatusType> get values => _$userStatusTypeValues;
  static UserStatusType valueOf(final String name) => _$valueOfUserStatusType(name);
  static Serializer<UserStatusType> get serializer => _$userStatusTypeSerializer;
}

abstract class UserStatusPublicStatus implements Built<UserStatusPublicStatus, UserStatusPublicStatusBuilder> {
  factory UserStatusPublicStatus([final void Function(UserStatusPublicStatusBuilder)? b]) = _$UserStatusPublicStatus;
  const UserStatusPublicStatus._();

  factory UserStatusPublicStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get userId;
  String? get message;
  String? get icon;
  UserStatusPublicStatus_ClearAt? get clearAt;
  UserStatusType get status;
  static Serializer<UserStatusPublicStatus> get serializer => _$userStatusPublicStatusSerializer;
}

abstract class UserStatusGetPublicStatuses_Ocs
    implements Built<UserStatusGetPublicStatuses_Ocs, UserStatusGetPublicStatuses_OcsBuilder> {
  factory UserStatusGetPublicStatuses_Ocs([final void Function(UserStatusGetPublicStatuses_OcsBuilder)? b]) =
      _$UserStatusGetPublicStatuses_Ocs;
  const UserStatusGetPublicStatuses_Ocs._();

  factory UserStatusGetPublicStatuses_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusOCSMeta get meta;
  BuiltList<UserStatusPublicStatus> get data;
  static Serializer<UserStatusGetPublicStatuses_Ocs> get serializer => _$userStatusGetPublicStatusesOcsSerializer;
}

abstract class UserStatusGetPublicStatuses
    implements Built<UserStatusGetPublicStatuses, UserStatusGetPublicStatusesBuilder> {
  factory UserStatusGetPublicStatuses([final void Function(UserStatusGetPublicStatusesBuilder)? b]) =
      _$UserStatusGetPublicStatuses;
  const UserStatusGetPublicStatuses._();

  factory UserStatusGetPublicStatuses.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusGetPublicStatuses_Ocs get ocs;
  static Serializer<UserStatusGetPublicStatuses> get serializer => _$userStatusGetPublicStatusesSerializer;
}

abstract class UserStatusGetPublicStatus_Ocs_Data
    implements Built<UserStatusGetPublicStatus_Ocs_Data, UserStatusGetPublicStatus_Ocs_DataBuilder> {
  factory UserStatusGetPublicStatus_Ocs_Data([final void Function(UserStatusGetPublicStatus_Ocs_DataBuilder)? b]) =
      _$UserStatusGetPublicStatus_Ocs_Data;
  const UserStatusGetPublicStatus_Ocs_Data._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  UserStatusPublicStatus? get publicStatus;
  static UserStatusGetPublicStatus_Ocs_Data fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusGetPublicStatus_Ocs_Data> get serializer =>
      _$UserStatusGetPublicStatus_Ocs_DataSerializer();
}

class _$UserStatusGetPublicStatus_Ocs_DataSerializer
    implements PrimitiveSerializer<UserStatusGetPublicStatus_Ocs_Data> {
  @override
  final Iterable<Type> types = const [UserStatusGetPublicStatus_Ocs_Data, _$UserStatusGetPublicStatus_Ocs_Data];

  @override
  final String wireName = 'UserStatusGetPublicStatus_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusGetPublicStatus_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusGetPublicStatus_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusGetPublicStatus_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>)
          .toBuilder();
    } catch (_) {}
    try {
      result._publicStatus = (_jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusPublicStatus))!
              as UserStatusPublicStatus)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._builtListJsonObject, result._publicStatus].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class UserStatusGetPublicStatus_Ocs
    implements Built<UserStatusGetPublicStatus_Ocs, UserStatusGetPublicStatus_OcsBuilder> {
  factory UserStatusGetPublicStatus_Ocs([final void Function(UserStatusGetPublicStatus_OcsBuilder)? b]) =
      _$UserStatusGetPublicStatus_Ocs;
  const UserStatusGetPublicStatus_Ocs._();

  factory UserStatusGetPublicStatus_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusOCSMeta get meta;
  UserStatusGetPublicStatus_Ocs_Data get data;
  static Serializer<UserStatusGetPublicStatus_Ocs> get serializer => _$userStatusGetPublicStatusOcsSerializer;
}

abstract class UserStatusGetPublicStatus implements Built<UserStatusGetPublicStatus, UserStatusGetPublicStatusBuilder> {
  factory UserStatusGetPublicStatus([final void Function(UserStatusGetPublicStatusBuilder)? b]) =
      _$UserStatusGetPublicStatus;
  const UserStatusGetPublicStatus._();

  factory UserStatusGetPublicStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusGetPublicStatus_Ocs get ocs;
  static Serializer<UserStatusGetPublicStatus> get serializer => _$userStatusGetPublicStatusSerializer;
}

abstract class UserStatusStatus1 implements Built<UserStatusStatus1, UserStatusStatus1Builder> {
  factory UserStatusStatus1([final void Function(UserStatusStatus1Builder)? b]) = _$UserStatusStatus1;
  const UserStatusStatus1._();

  factory UserStatusStatus1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get messageId;
  bool get messageIsPredefined;
  bool get statusIsUserDefined;
  static Serializer<UserStatusStatus1> get serializer => _$userStatusStatus1Serializer;
}

abstract class UserStatusStatus implements Built<UserStatusStatus, UserStatusStatusBuilder> {
  factory UserStatusStatus([final void Function(UserStatusStatusBuilder)? b]) = _$UserStatusStatus;
  const UserStatusStatus._();

  JsonObject get data;
  UserStatusPublicStatus get publicStatus;
  UserStatusStatus1 get status1;
  static UserStatusStatus fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusStatus> get serializer => _$UserStatusStatusSerializer();
}

class _$UserStatusStatusSerializer implements PrimitiveSerializer<UserStatusStatus> {
  @override
  final Iterable<Type> types = const [UserStatusStatus, _$UserStatusStatus];

  @override
  final String wireName = 'UserStatusStatus';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusStatus object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusStatus deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusStatusBuilder()..data = JsonObject(data);
    result.publicStatus.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(UserStatusPublicStatus),
      )! as UserStatusPublicStatus,
    );
    result.status1.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusStatus1))! as UserStatusStatus1,
    );
    return result.build();
  }
}

abstract class UserStatusGetStatus_Ocs_Data
    implements Built<UserStatusGetStatus_Ocs_Data, UserStatusGetStatus_Ocs_DataBuilder> {
  factory UserStatusGetStatus_Ocs_Data([final void Function(UserStatusGetStatus_Ocs_DataBuilder)? b]) =
      _$UserStatusGetStatus_Ocs_Data;
  const UserStatusGetStatus_Ocs_Data._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  UserStatusStatus? get status;
  static UserStatusGetStatus_Ocs_Data fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusGetStatus_Ocs_Data> get serializer => _$UserStatusGetStatus_Ocs_DataSerializer();
}

class _$UserStatusGetStatus_Ocs_DataSerializer implements PrimitiveSerializer<UserStatusGetStatus_Ocs_Data> {
  @override
  final Iterable<Type> types = const [UserStatusGetStatus_Ocs_Data, _$UserStatusGetStatus_Ocs_Data];

  @override
  final String wireName = 'UserStatusGetStatus_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusGetStatus_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusGetStatus_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusGetStatus_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>)
          .toBuilder();
    } catch (_) {}
    try {
      result._status =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusStatus))! as UserStatusStatus)
              .toBuilder();
    } catch (_) {}
    assert(
      [result._builtListJsonObject, result._status].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class UserStatusGetStatus_Ocs implements Built<UserStatusGetStatus_Ocs, UserStatusGetStatus_OcsBuilder> {
  factory UserStatusGetStatus_Ocs([final void Function(UserStatusGetStatus_OcsBuilder)? b]) = _$UserStatusGetStatus_Ocs;
  const UserStatusGetStatus_Ocs._();

  factory UserStatusGetStatus_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusOCSMeta get meta;
  UserStatusGetStatus_Ocs_Data get data;
  static Serializer<UserStatusGetStatus_Ocs> get serializer => _$userStatusGetStatusOcsSerializer;
}

abstract class UserStatusGetStatus implements Built<UserStatusGetStatus, UserStatusGetStatusBuilder> {
  factory UserStatusGetStatus([final void Function(UserStatusGetStatusBuilder)? b]) = _$UserStatusGetStatus;
  const UserStatusGetStatus._();

  factory UserStatusGetStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusGetStatus_Ocs get ocs;
  static Serializer<UserStatusGetStatus> get serializer => _$userStatusGetStatusSerializer;
}

abstract class UserStatusPredefinedStatus_ClearAt
    implements Built<UserStatusPredefinedStatus_ClearAt, UserStatusPredefinedStatus_ClearAtBuilder> {
  factory UserStatusPredefinedStatus_ClearAt([final void Function(UserStatusPredefinedStatus_ClearAtBuilder)? b]) =
      _$UserStatusPredefinedStatus_ClearAt;
  const UserStatusPredefinedStatus_ClearAt._();

  JsonObject get data;
  UserStatusClearAt? get clearAt;

  /// Time as unix timestamp
  int? get $int;
  static UserStatusPredefinedStatus_ClearAt fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusPredefinedStatus_ClearAt> get serializer =>
      _$UserStatusPredefinedStatus_ClearAtSerializer();
}

class _$UserStatusPredefinedStatus_ClearAtSerializer
    implements PrimitiveSerializer<UserStatusPredefinedStatus_ClearAt> {
  @override
  final Iterable<Type> types = const [UserStatusPredefinedStatus_ClearAt, _$UserStatusPredefinedStatus_ClearAt];

  @override
  final String wireName = 'UserStatusPredefinedStatus_ClearAt';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusPredefinedStatus_ClearAt object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusPredefinedStatus_ClearAt deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusPredefinedStatus_ClearAtBuilder()..data = JsonObject(data);
    try {
      result._clearAt =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusClearAt))! as UserStatusClearAt)
              .toBuilder();
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert([result._clearAt, result._$int].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

abstract class UserStatusPredefinedStatus
    implements Built<UserStatusPredefinedStatus, UserStatusPredefinedStatusBuilder> {
  factory UserStatusPredefinedStatus([final void Function(UserStatusPredefinedStatusBuilder)? b]) =
      _$UserStatusPredefinedStatus;
  const UserStatusPredefinedStatus._();

  factory UserStatusPredefinedStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get id;
  String get icon;
  String get message;
  UserStatusPredefinedStatus_ClearAt? get clearAt;
  static Serializer<UserStatusPredefinedStatus> get serializer => _$userStatusPredefinedStatusSerializer;
}

abstract class UserStatusPredefinedStatuses_Ocs
    implements Built<UserStatusPredefinedStatuses_Ocs, UserStatusPredefinedStatuses_OcsBuilder> {
  factory UserStatusPredefinedStatuses_Ocs([final void Function(UserStatusPredefinedStatuses_OcsBuilder)? b]) =
      _$UserStatusPredefinedStatuses_Ocs;
  const UserStatusPredefinedStatuses_Ocs._();

  factory UserStatusPredefinedStatuses_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusOCSMeta get meta;
  BuiltList<UserStatusPredefinedStatus> get data;
  static Serializer<UserStatusPredefinedStatuses_Ocs> get serializer => _$userStatusPredefinedStatusesOcsSerializer;
}

abstract class UserStatusPredefinedStatuses
    implements Built<UserStatusPredefinedStatuses, UserStatusPredefinedStatusesBuilder> {
  factory UserStatusPredefinedStatuses([final void Function(UserStatusPredefinedStatusesBuilder)? b]) =
      _$UserStatusPredefinedStatuses;
  const UserStatusPredefinedStatuses._();

  factory UserStatusPredefinedStatuses.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusPredefinedStatuses_Ocs get ocs;
  static Serializer<UserStatusPredefinedStatuses> get serializer => _$userStatusPredefinedStatusesSerializer;
}

abstract class UserStatusHeartbeat_Ocs_Data
    implements Built<UserStatusHeartbeat_Ocs_Data, UserStatusHeartbeat_Ocs_DataBuilder> {
  factory UserStatusHeartbeat_Ocs_Data([final void Function(UserStatusHeartbeat_Ocs_DataBuilder)? b]) =
      _$UserStatusHeartbeat_Ocs_Data;
  const UserStatusHeartbeat_Ocs_Data._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  UserStatusStatus? get status;
  static UserStatusHeartbeat_Ocs_Data fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusHeartbeat_Ocs_Data> get serializer => _$UserStatusHeartbeat_Ocs_DataSerializer();
}

class _$UserStatusHeartbeat_Ocs_DataSerializer implements PrimitiveSerializer<UserStatusHeartbeat_Ocs_Data> {
  @override
  final Iterable<Type> types = const [UserStatusHeartbeat_Ocs_Data, _$UserStatusHeartbeat_Ocs_Data];

  @override
  final String wireName = 'UserStatusHeartbeat_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusHeartbeat_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusHeartbeat_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusHeartbeat_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>)
          .toBuilder();
    } catch (_) {}
    try {
      result._status =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusStatus))! as UserStatusStatus)
              .toBuilder();
    } catch (_) {}
    assert(
      [result._builtListJsonObject, result._status].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class UserStatusHeartbeat_Ocs implements Built<UserStatusHeartbeat_Ocs, UserStatusHeartbeat_OcsBuilder> {
  factory UserStatusHeartbeat_Ocs([final void Function(UserStatusHeartbeat_OcsBuilder)? b]) = _$UserStatusHeartbeat_Ocs;
  const UserStatusHeartbeat_Ocs._();

  factory UserStatusHeartbeat_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusOCSMeta get meta;
  UserStatusHeartbeat_Ocs_Data get data;
  static Serializer<UserStatusHeartbeat_Ocs> get serializer => _$userStatusHeartbeatOcsSerializer;
}

abstract class UserStatusHeartbeat implements Built<UserStatusHeartbeat, UserStatusHeartbeatBuilder> {
  factory UserStatusHeartbeat([final void Function(UserStatusHeartbeatBuilder)? b]) = _$UserStatusHeartbeat;
  const UserStatusHeartbeat._();

  factory UserStatusHeartbeat.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusHeartbeat_Ocs get ocs;
  static Serializer<UserStatusHeartbeat> get serializer => _$userStatusHeartbeatSerializer;
}

abstract class UserStatusEmptyOCS_Ocs implements Built<UserStatusEmptyOCS_Ocs, UserStatusEmptyOCS_OcsBuilder> {
  factory UserStatusEmptyOCS_Ocs([final void Function(UserStatusEmptyOCS_OcsBuilder)? b]) = _$UserStatusEmptyOCS_Ocs;
  const UserStatusEmptyOCS_Ocs._();

  factory UserStatusEmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<UserStatusEmptyOCS_Ocs> get serializer => _$userStatusEmptyOCSOcsSerializer;
}

abstract class UserStatusEmptyOCS implements Built<UserStatusEmptyOCS, UserStatusEmptyOCSBuilder> {
  factory UserStatusEmptyOCS([final void Function(UserStatusEmptyOCSBuilder)? b]) = _$UserStatusEmptyOCS;
  const UserStatusEmptyOCS._();

  factory UserStatusEmptyOCS.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  UserStatusEmptyOCS_Ocs get ocs;
  static Serializer<UserStatusEmptyOCS> get serializer => _$userStatusEmptyOCSSerializer;
}

@SerializersFor([
  UserStatusGetPublicStatuses,
  UserStatusGetPublicStatuses_Ocs,
  UserStatusOCSMeta,
  UserStatusPublicStatus,
  UserStatusClearAt,
  UserStatusGetPublicStatus,
  UserStatusGetPublicStatus_Ocs,
  UserStatusGetStatus,
  UserStatusGetStatus_Ocs,
  UserStatusStatus1,
  UserStatusPredefinedStatuses,
  UserStatusPredefinedStatuses_Ocs,
  UserStatusPredefinedStatus,
  UserStatusHeartbeat,
  UserStatusHeartbeat_Ocs,
  UserStatusEmptyOCS,
  UserStatusEmptyOCS_Ocs,
])
final Serializers _serializers = (_$_serializers.toBuilder()
      ..addBuilderFactory(const FullType(UserStatusGetPublicStatuses), UserStatusGetPublicStatuses.new)
      ..addBuilderFactory(const FullType(UserStatusGetPublicStatus), UserStatusGetPublicStatus.new)
      ..addBuilderFactory(const FullType(UserStatusGetStatus), UserStatusGetStatus.new)
      ..addBuilderFactory(const FullType(UserStatusPredefinedStatuses), UserStatusPredefinedStatuses.new)
      ..addBuilderFactory(const FullType(UserStatusHeartbeat), UserStatusHeartbeat.new))
    .build();

Serializers get userStatusSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

// coverage:ignore-start
T deserializeUserStatus<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeUserStatus<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
