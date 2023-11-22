// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'files_reminders.openapi.g.dart';

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

  ApiClient get api => ApiClient(this);
}

class ApiClient {
  ApiClient(this._rootClient);

  final Client _rootClient;

  /// Get a reminder.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 401: User not found
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiGetResponseApplicationJson, void>> $get({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = $getRaw(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a reminder.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 401: User not found
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiGetResponseApplicationJson, void> $getRaw({
    required final String version,
    required final int fileId,
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
    checkPattern(version, RegExp(r'^1$'), 'version'); // coverage:ignore-line
    pathParameters['version'] = version;
    pathParameters['fileId'] = fileId.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ApiGetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ApiGetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Set a reminder.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [dueDate] ISO 8601 formatted date time string.
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder updated
  ///   * 201: Reminder created successfully
  ///   * 400: Creating reminder is not possible
  ///   * 401: User not found
  ///   * 404: File not found
  ///
  /// See:
  ///  * [$setRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiSetResponseApplicationJson, void>> $set({
    required final String dueDate,
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = $setRaw(
      dueDate: dueDate,
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set a reminder.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [dueDate] ISO 8601 formatted date time string.
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder updated
  ///   * 201: Reminder created successfully
  ///   * 400: Creating reminder is not possible
  ///   * 401: User not found
  ///   * 404: File not found
  ///
  /// See:
  ///  * [$set] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiSetResponseApplicationJson, void> $setRaw({
    required final String dueDate,
    required final String version,
    required final int fileId,
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
    queryParameters['dueDate'] = dueDate;
    checkPattern(version, RegExp(r'^1$'), 'version'); // coverage:ignore-line
    pathParameters['version'] = version;
    pathParameters['fileId'] = fileId.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ApiSetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200, 201, 400, 401, 404},
      ),
      bodyType: const FullType(ApiSetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Remove a reminder.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 401: User not found
  ///   * 404: Reminder not found
  ///
  /// See:
  ///  * [removeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiRemoveResponseApplicationJson, void>> remove({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = removeRaw(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a reminder.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 401: User not found
  ///   * 404: Reminder not found
  ///
  /// See:
  ///  * [remove] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiRemoveResponseApplicationJson, void> removeRaw({
    required final String version,
    required final int fileId,
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
    checkPattern(version, RegExp(r'^1$'), 'version'); // coverage:ignore-line
    pathParameters['version'] = version;
    pathParameters['fileId'] = fileId.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ApiRemoveResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 401, 404},
      ),
      bodyType: const FullType(ApiRemoveResponseApplicationJson),
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
abstract interface class ApiGetResponseApplicationJson_Ocs_DataInterface {
  String? get dueDate;
}

abstract class ApiGetResponseApplicationJson_Ocs_Data
    implements
        ApiGetResponseApplicationJson_Ocs_DataInterface,
        Built<ApiGetResponseApplicationJson_Ocs_Data, ApiGetResponseApplicationJson_Ocs_DataBuilder> {
  factory ApiGetResponseApplicationJson_Ocs_Data([
    final void Function(ApiGetResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ApiGetResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetResponseApplicationJson_Ocs_Data> get serializer =>
      const _$ApiGetResponseApplicationJson_Ocs_DataSerializer();
}

class _$ApiGetResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ApiGetResponseApplicationJson_Ocs_Data> {
  const _$ApiGetResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [ApiGetResponseApplicationJson_Ocs_Data, _$ApiGetResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'ApiGetResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.dueDate;
    if (value != null) {
      result
        ..add('dueDate')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  ApiGetResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'dueDate':
          result.dueDate = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiGetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ApiGetResponseApplicationJson_Ocs_Data get data;
}

abstract class ApiGetResponseApplicationJson_Ocs
    implements
        ApiGetResponseApplicationJson_OcsInterface,
        Built<ApiGetResponseApplicationJson_Ocs, ApiGetResponseApplicationJson_OcsBuilder> {
  factory ApiGetResponseApplicationJson_Ocs([final void Function(ApiGetResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetResponseApplicationJson_Ocs> get serializer =>
      const _$ApiGetResponseApplicationJson_OcsSerializer();
}

class _$ApiGetResponseApplicationJson_OcsSerializer implements StructuredSerializer<ApiGetResponseApplicationJson_Ocs> {
  const _$ApiGetResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [ApiGetResponseApplicationJson_Ocs, _$ApiGetResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ApiGetResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(ApiGetResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  ApiGetResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(ApiGetResponseApplicationJson_Ocs_Data))!
                as ApiGetResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiGetResponseApplicationJsonInterface {
  ApiGetResponseApplicationJson_Ocs get ocs;
}

abstract class ApiGetResponseApplicationJson
    implements
        ApiGetResponseApplicationJsonInterface,
        Built<ApiGetResponseApplicationJson, ApiGetResponseApplicationJsonBuilder> {
  factory ApiGetResponseApplicationJson([final void Function(ApiGetResponseApplicationJsonBuilder)? b]) =
      _$ApiGetResponseApplicationJson;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetResponseApplicationJson> get serializer => const _$ApiGetResponseApplicationJsonSerializer();
}

class _$ApiGetResponseApplicationJsonSerializer implements StructuredSerializer<ApiGetResponseApplicationJson> {
  const _$ApiGetResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [ApiGetResponseApplicationJson, _$ApiGetResponseApplicationJson];

  @override
  String get wireName => 'ApiGetResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ApiGetResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ApiGetResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(ApiGetResponseApplicationJson_Ocs))!
                as ApiGetResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiSetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ApiSetResponseApplicationJson_Ocs
    implements
        ApiSetResponseApplicationJson_OcsInterface,
        Built<ApiSetResponseApplicationJson_Ocs, ApiSetResponseApplicationJson_OcsBuilder> {
  factory ApiSetResponseApplicationJson_Ocs([final void Function(ApiSetResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiSetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiSetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiSetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiSetResponseApplicationJson_Ocs> get serializer =>
      const _$ApiSetResponseApplicationJson_OcsSerializer();
}

class _$ApiSetResponseApplicationJson_OcsSerializer implements StructuredSerializer<ApiSetResponseApplicationJson_Ocs> {
  const _$ApiSetResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [ApiSetResponseApplicationJson_Ocs, _$ApiSetResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ApiSetResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiSetResponseApplicationJson_Ocs object, {
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
  ApiSetResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiSetResponseApplicationJson_OcsBuilder();

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
abstract interface class ApiSetResponseApplicationJsonInterface {
  ApiSetResponseApplicationJson_Ocs get ocs;
}

abstract class ApiSetResponseApplicationJson
    implements
        ApiSetResponseApplicationJsonInterface,
        Built<ApiSetResponseApplicationJson, ApiSetResponseApplicationJsonBuilder> {
  factory ApiSetResponseApplicationJson([final void Function(ApiSetResponseApplicationJsonBuilder)? b]) =
      _$ApiSetResponseApplicationJson;

  // coverage:ignore-start
  const ApiSetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiSetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiSetResponseApplicationJson> get serializer => const _$ApiSetResponseApplicationJsonSerializer();
}

class _$ApiSetResponseApplicationJsonSerializer implements StructuredSerializer<ApiSetResponseApplicationJson> {
  const _$ApiSetResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [ApiSetResponseApplicationJson, _$ApiSetResponseApplicationJson];

  @override
  String get wireName => 'ApiSetResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiSetResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ApiSetResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ApiSetResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiSetResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(ApiSetResponseApplicationJson_Ocs))!
                as ApiSetResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiRemoveResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ApiRemoveResponseApplicationJson_Ocs
    implements
        ApiRemoveResponseApplicationJson_OcsInterface,
        Built<ApiRemoveResponseApplicationJson_Ocs, ApiRemoveResponseApplicationJson_OcsBuilder> {
  factory ApiRemoveResponseApplicationJson_Ocs([final void Function(ApiRemoveResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiRemoveResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiRemoveResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiRemoveResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiRemoveResponseApplicationJson_Ocs> get serializer =>
      const _$ApiRemoveResponseApplicationJson_OcsSerializer();
}

class _$ApiRemoveResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ApiRemoveResponseApplicationJson_Ocs> {
  const _$ApiRemoveResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [ApiRemoveResponseApplicationJson_Ocs, _$ApiRemoveResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ApiRemoveResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiRemoveResponseApplicationJson_Ocs object, {
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
  ApiRemoveResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiRemoveResponseApplicationJson_OcsBuilder();

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
abstract interface class ApiRemoveResponseApplicationJsonInterface {
  ApiRemoveResponseApplicationJson_Ocs get ocs;
}

abstract class ApiRemoveResponseApplicationJson
    implements
        ApiRemoveResponseApplicationJsonInterface,
        Built<ApiRemoveResponseApplicationJson, ApiRemoveResponseApplicationJsonBuilder> {
  factory ApiRemoveResponseApplicationJson([final void Function(ApiRemoveResponseApplicationJsonBuilder)? b]) =
      _$ApiRemoveResponseApplicationJson;

  // coverage:ignore-start
  const ApiRemoveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiRemoveResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiRemoveResponseApplicationJson> get serializer =>
      const _$ApiRemoveResponseApplicationJsonSerializer();
}

class _$ApiRemoveResponseApplicationJsonSerializer implements StructuredSerializer<ApiRemoveResponseApplicationJson> {
  const _$ApiRemoveResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [ApiRemoveResponseApplicationJson, _$ApiRemoveResponseApplicationJson];

  @override
  String get wireName => 'ApiRemoveResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiRemoveResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ApiRemoveResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ApiRemoveResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiRemoveResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(ApiRemoveResponseApplicationJson_Ocs))!
                as ApiRemoveResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(ApiGetResponseApplicationJson), ApiGetResponseApplicationJson.new)
      ..add(ApiGetResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(ApiGetResponseApplicationJson_Ocs), ApiGetResponseApplicationJson_Ocs.new)
      ..add(ApiGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetResponseApplicationJson_Ocs_Data),
        ApiGetResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ApiGetResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(ApiSetResponseApplicationJson), ApiSetResponseApplicationJson.new)
      ..add(ApiSetResponseApplicationJson.serializer)
      ..addBuilderFactory(const FullType(ApiSetResponseApplicationJson_Ocs), ApiSetResponseApplicationJson_Ocs.new)
      ..add(ApiSetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ApiRemoveResponseApplicationJson), ApiRemoveResponseApplicationJson.new)
      ..add(ApiRemoveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiRemoveResponseApplicationJson_Ocs),
        ApiRemoveResponseApplicationJson_Ocs.new,
      )
      ..add(ApiRemoveResponseApplicationJson_Ocs.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
