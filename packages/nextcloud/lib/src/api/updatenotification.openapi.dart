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

part 'updatenotification.openapi.g.dart';

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

  /// List available updates for apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [newVersion] Server version to check updates for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps returned
  ///   * 404: New versions not found
  ///
  /// See:
  ///  * [getAppListRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiGetAppListResponseApplicationJson, void>> getAppList({
    required final String newVersion,
    final ApiGetAppListApiVersion apiVersion = ApiGetAppListApiVersion.v1,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppListRaw(
      newVersion: newVersion,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// List available updates for apps.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v1`.
  ///   * [newVersion] Server version to check updates for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps returned
  ///   * 404: New versions not found
  ///
  /// See:
  ///  * [getAppList] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiGetAppListResponseApplicationJson, void> getAppListRaw({
    required final String newVersion,
    final ApiGetAppListApiVersion apiVersion = ApiGetAppListApiVersion.v1,
    final bool oCSAPIRequest = true,
  }) {
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
    final newVersion0 = Uri.encodeQueryComponent(newVersion);
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/updatenotification/api/$apiVersion0/applist/$newVersion0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ApiGetAppListResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ApiGetAppListResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class ApiGetAppListApiVersion extends EnumClass {
  const ApiGetAppListApiVersion._(super.name);

  static const ApiGetAppListApiVersion v1 = _$apiGetAppListApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<ApiGetAppListApiVersion> get values => _$apiGetAppListApiVersionValues;
  // coverage:ignore-end

  static ApiGetAppListApiVersion valueOf(final String name) => _$valueOfApiGetAppListApiVersion(name);

  static Serializer<ApiGetAppListApiVersion> get serializer => _$apiGetAppListApiVersionSerializer;
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
abstract interface class AppInterface {
  String get appId;
  String get appName;
}

abstract class App implements AppInterface, Built<App, AppBuilder> {
  factory App([final void Function(AppBuilder)? b]) = _$App;

  // coverage:ignore-start
  const App._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory App.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<App> get serializer => const _$AppSerializer();
}

class _$AppSerializer implements StructuredSerializer<App> {
  const _$AppSerializer();

  @override
  Iterable<Type> get types => const [App, _$App];

  @override
  String get wireName => 'App';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final App object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'appId',
      serializers.serialize(object.appId, specifiedType: const FullType(String)),
      'appName',
      serializers.serialize(object.appName, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  App deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'appId':
          result.appId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'appName':
          result.appName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiGetAppListResponseApplicationJson_Ocs_DataInterface {
  BuiltList<App> get missing;
  BuiltList<App> get available;
}

abstract class ApiGetAppListResponseApplicationJson_Ocs_Data
    implements
        ApiGetAppListResponseApplicationJson_Ocs_DataInterface,
        Built<ApiGetAppListResponseApplicationJson_Ocs_Data, ApiGetAppListResponseApplicationJson_Ocs_DataBuilder> {
  factory ApiGetAppListResponseApplicationJson_Ocs_Data([
    final void Function(ApiGetAppListResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ApiGetAppListResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ApiGetAppListResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetAppListResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetAppListResponseApplicationJson_Ocs_Data> get serializer =>
      const _$ApiGetAppListResponseApplicationJson_Ocs_DataSerializer();
}

class _$ApiGetAppListResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ApiGetAppListResponseApplicationJson_Ocs_Data> {
  const _$ApiGetAppListResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [ApiGetAppListResponseApplicationJson_Ocs_Data, _$ApiGetAppListResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'ApiGetAppListResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetAppListResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'missing',
      serializers.serialize(object.missing, specifiedType: const FullType(BuiltList, [FullType(App)])),
      'available',
      serializers.serialize(object.available, specifiedType: const FullType(BuiltList, [FullType(App)])),
    ];
    return result;
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetAppListResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'missing':
          result.missing.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(App)]))!
                as BuiltList<App>,
          );
        case 'available':
          result.available.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(App)]))!
                as BuiltList<App>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiGetAppListResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ApiGetAppListResponseApplicationJson_Ocs_Data get data;
}

abstract class ApiGetAppListResponseApplicationJson_Ocs
    implements
        ApiGetAppListResponseApplicationJson_OcsInterface,
        Built<ApiGetAppListResponseApplicationJson_Ocs, ApiGetAppListResponseApplicationJson_OcsBuilder> {
  factory ApiGetAppListResponseApplicationJson_Ocs([
    final void Function(ApiGetAppListResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ApiGetAppListResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGetAppListResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetAppListResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetAppListResponseApplicationJson_Ocs> get serializer =>
      const _$ApiGetAppListResponseApplicationJson_OcsSerializer();
}

class _$ApiGetAppListResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ApiGetAppListResponseApplicationJson_Ocs> {
  const _$ApiGetAppListResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ApiGetAppListResponseApplicationJson_Ocs, _$ApiGetAppListResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ApiGetAppListResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetAppListResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetAppListResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs_Data),
            )! as ApiGetAppListResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiGetAppListResponseApplicationJsonInterface {
  ApiGetAppListResponseApplicationJson_Ocs get ocs;
}

abstract class ApiGetAppListResponseApplicationJson
    implements
        ApiGetAppListResponseApplicationJsonInterface,
        Built<ApiGetAppListResponseApplicationJson, ApiGetAppListResponseApplicationJsonBuilder> {
  factory ApiGetAppListResponseApplicationJson([final void Function(ApiGetAppListResponseApplicationJsonBuilder)? b]) =
      _$ApiGetAppListResponseApplicationJson;

  // coverage:ignore-start
  const ApiGetAppListResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetAppListResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetAppListResponseApplicationJson> get serializer =>
      const _$ApiGetAppListResponseApplicationJsonSerializer();
}

class _$ApiGetAppListResponseApplicationJsonSerializer
    implements StructuredSerializer<ApiGetAppListResponseApplicationJson> {
  const _$ApiGetAppListResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [ApiGetAppListResponseApplicationJson, _$ApiGetAppListResponseApplicationJson];

  @override
  String get wireName => 'ApiGetAppListResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetAppListResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ApiGetAppListResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetAppListResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs))!
                as ApiGetAppListResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..add(ApiGetAppListApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetAppListResponseApplicationJson),
        ApiGetAppListResponseApplicationJson.new,
      )
      ..add(ApiGetAppListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetAppListResponseApplicationJson_Ocs),
        ApiGetAppListResponseApplicationJson_Ocs.new,
      )
      ..add(ApiGetAppListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetAppListResponseApplicationJson_Ocs_Data),
        ApiGetAppListResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ApiGetAppListResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(App), App.new)
      ..add(App.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(App)]), ListBuilder<App>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
