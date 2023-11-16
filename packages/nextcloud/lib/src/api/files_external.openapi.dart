// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'files_external.openapi.g.dart';

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

  /// Get the mount points visible for this user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User mounts returned
  ///
  /// See:
  ///  * [getUserMountsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiGetUserMountsResponseApplicationJson, void>> getUserMounts({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUserMountsRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the mount points visible for this user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User mounts returned
  ///
  /// See:
  ///  * [getUserMounts] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiGetUserMountsResponseApplicationJson, void> getUserMountsRaw({
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/files_external/api/v1/mounts';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ApiGetUserMountsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ApiGetUserMountsResponseApplicationJson),
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

class Mount_Type extends EnumClass {
  const Mount_Type._(super.name);

  static const Mount_Type dir = _$mountTypeDir;

  // coverage:ignore-start
  static BuiltSet<Mount_Type> get values => _$mountTypeValues;
  // coverage:ignore-end

  static Mount_Type valueOf(final String name) => _$valueOfMount_Type(name);

  static Serializer<Mount_Type> get serializer => _$mountTypeSerializer;
}

class Mount_Scope extends EnumClass {
  const Mount_Scope._(super.name);

  static const Mount_Scope system = _$mountScopeSystem;

  static const Mount_Scope personal = _$mountScopePersonal;

  // coverage:ignore-start
  static BuiltSet<Mount_Scope> get values => _$mountScopeValues;
  // coverage:ignore-end

  static Mount_Scope valueOf(final String name) => _$valueOfMount_Scope(name);

  static Serializer<Mount_Scope> get serializer => _$mountScopeSerializer;
}

class StorageConfig_Type extends EnumClass {
  const StorageConfig_Type._(super.name);

  static const StorageConfig_Type personal = _$storageConfigTypePersonal;

  static const StorageConfig_Type system = _$storageConfigTypeSystem;

  // coverage:ignore-start
  static BuiltSet<StorageConfig_Type> get values => _$storageConfigTypeValues;
  // coverage:ignore-end

  static StorageConfig_Type valueOf(final String name) => _$valueOfStorageConfig_Type(name);

  static Serializer<StorageConfig_Type> get serializer => _$storageConfigTypeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class StorageConfigInterface {
  BuiltList<String>? get applicableGroups;
  BuiltList<String>? get applicableUsers;
  String get authMechanism;
  String get backend;
  BuiltMap<String, JsonObject> get backendOptions;
  int? get id;
  BuiltMap<String, JsonObject>? get mountOptions;
  String get mountPoint;
  int? get priority;
  int? get status;
  String? get statusMessage;
  StorageConfig_Type get type;
  bool get userProvided;
}

abstract class StorageConfig implements StorageConfigInterface, Built<StorageConfig, StorageConfigBuilder> {
  factory StorageConfig([final void Function(StorageConfigBuilder)? b]) = _$StorageConfig;

  // coverage:ignore-start
  const StorageConfig._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StorageConfig.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<StorageConfig> get serializer => const _$StorageConfigSerializer();
}

class _$StorageConfigSerializer implements StructuredSerializer<StorageConfig> {
  const _$StorageConfigSerializer();

  @override
  Iterable<Type> get types => const [StorageConfig, _$StorageConfig];

  @override
  String get wireName => 'StorageConfig';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final StorageConfig object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'authMechanism',
      serializers.serialize(object.authMechanism, specifiedType: const FullType(String)),
      'backend',
      serializers.serialize(object.backend, specifiedType: const FullType(String)),
      'backendOptions',
      serializers.serialize(
        object.backendOptions,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
      ),
      'mountPoint',
      serializers.serialize(object.mountPoint, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(StorageConfig_Type)),
      'userProvided',
      serializers.serialize(object.userProvided, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.applicableGroups;
    if (value != null) {
      result
        ..add('applicableGroups')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    value = object.applicableUsers;
    if (value != null) {
      result
        ..add('applicableUsers')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.mountOptions;
    if (value != null) {
      result
        ..add('mountOptions')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
          ),
        );
    }

    value = object.priority;
    if (value != null) {
      result
        ..add('priority')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.statusMessage;
    if (value != null) {
      result
        ..add('statusMessage')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  StorageConfig deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = StorageConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'applicableGroups':
          result.applicableGroups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'applicableUsers':
          result.applicableUsers.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'authMechanism':
          result.authMechanism = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'backend':
          result.backend = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'backendOptions':
          result.backendOptions.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
            )! as BuiltMap<String, JsonObject>,
          );
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'mountOptions':
          result.mountOptions.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
            )! as BuiltMap<String, JsonObject>,
          );
        case 'mountPoint':
          result.mountPoint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'priority':
          result.priority = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'statusMessage':
          result.statusMessage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(StorageConfig_Type))! as StorageConfig_Type;
        case 'userProvided':
          result.userProvided = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class MountInterface {
  String get name;
  String get path;
  Mount_Type get type;
  String get backend;
  Mount_Scope get scope;
  int get permissions;
  int get id;
  @BuiltValueField(wireName: 'class')
  String get $class;
  StorageConfig get config;
}

abstract class Mount implements MountInterface, Built<Mount, MountBuilder> {
  factory Mount([final void Function(MountBuilder)? b]) = _$Mount;

  // coverage:ignore-start
  const Mount._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Mount.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Mount> get serializer => const _$MountSerializer();
}

class _$MountSerializer implements StructuredSerializer<Mount> {
  const _$MountSerializer();

  @override
  Iterable<Type> get types => const [Mount, _$Mount];

  @override
  String get wireName => 'Mount';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Mount object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(Mount_Type)),
      'backend',
      serializers.serialize(object.backend, specifiedType: const FullType(String)),
      'scope',
      serializers.serialize(object.scope, specifiedType: const FullType(Mount_Scope)),
      'permissions',
      serializers.serialize(object.permissions, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'class',
      serializers.serialize(object.$class, specifiedType: const FullType(String)),
      'config',
      serializers.serialize(object.config, specifiedType: const FullType(StorageConfig)),
    ];
    return result;
  }

  @override
  Mount deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = MountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'path':
          result.path = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(Mount_Type))! as Mount_Type;
        case 'backend':
          result.backend = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'scope':
          result.scope = serializers.deserialize(value, specifiedType: const FullType(Mount_Scope))! as Mount_Scope;
        case 'permissions':
          result.permissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'class':
          result.$class = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'config':
          result.config.replace(
            serializers.deserialize(value, specifiedType: const FullType(StorageConfig))! as StorageConfig,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiGetUserMountsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Mount> get data;
}

abstract class ApiGetUserMountsResponseApplicationJson_Ocs
    implements
        ApiGetUserMountsResponseApplicationJson_OcsInterface,
        Built<ApiGetUserMountsResponseApplicationJson_Ocs, ApiGetUserMountsResponseApplicationJson_OcsBuilder> {
  factory ApiGetUserMountsResponseApplicationJson_Ocs([
    final void Function(ApiGetUserMountsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ApiGetUserMountsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGetUserMountsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetUserMountsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetUserMountsResponseApplicationJson_Ocs> get serializer =>
      const _$ApiGetUserMountsResponseApplicationJson_OcsSerializer();
}

class _$ApiGetUserMountsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ApiGetUserMountsResponseApplicationJson_Ocs> {
  const _$ApiGetUserMountsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ApiGetUserMountsResponseApplicationJson_Ocs, _$ApiGetUserMountsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ApiGetUserMountsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetUserMountsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Mount)])),
    ];
    return result;
  }

  @override
  ApiGetUserMountsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetUserMountsResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Mount)]))!
                as BuiltList<Mount>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ApiGetUserMountsResponseApplicationJsonInterface {
  ApiGetUserMountsResponseApplicationJson_Ocs get ocs;
}

abstract class ApiGetUserMountsResponseApplicationJson
    implements
        ApiGetUserMountsResponseApplicationJsonInterface,
        Built<ApiGetUserMountsResponseApplicationJson, ApiGetUserMountsResponseApplicationJsonBuilder> {
  factory ApiGetUserMountsResponseApplicationJson([
    final void Function(ApiGetUserMountsResponseApplicationJsonBuilder)? b,
  ]) = _$ApiGetUserMountsResponseApplicationJson;

  // coverage:ignore-start
  const ApiGetUserMountsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetUserMountsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGetUserMountsResponseApplicationJson> get serializer =>
      const _$ApiGetUserMountsResponseApplicationJsonSerializer();
}

class _$ApiGetUserMountsResponseApplicationJsonSerializer
    implements StructuredSerializer<ApiGetUserMountsResponseApplicationJson> {
  const _$ApiGetUserMountsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ApiGetUserMountsResponseApplicationJson, _$ApiGetUserMountsResponseApplicationJson];

  @override
  String get wireName => 'ApiGetUserMountsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGetUserMountsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ApiGetUserMountsResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ApiGetUserMountsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGetUserMountsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(ApiGetUserMountsResponseApplicationJson_Ocs))!
                as ApiGetUserMountsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(ApiGetUserMountsResponseApplicationJson),
        ApiGetUserMountsResponseApplicationJson.new,
      )
      ..add(ApiGetUserMountsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetUserMountsResponseApplicationJson_Ocs),
        ApiGetUserMountsResponseApplicationJson_Ocs.new,
      )
      ..add(ApiGetUserMountsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(Mount), Mount.new)
      ..add(Mount.serializer)
      ..add(Mount_Type.serializer)
      ..add(Mount_Scope.serializer)
      ..addBuilderFactory(const FullType(StorageConfig), StorageConfig.new)
      ..add(StorageConfig.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..add(StorageConfig_Type.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Mount)]), ListBuilder<Mount>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
