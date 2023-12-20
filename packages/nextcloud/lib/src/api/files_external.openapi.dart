// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
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
import 'package:uri/uri.dart';

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

  Client.fromClient(DynamiteClient client)
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
  Future<DynamiteResponse<ApiGetUserMountsResponseApplicationJson, void>> getUserMounts({bool? oCSAPIRequest}) async {
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
  DynamiteRawResponse<ApiGetUserMountsResponseApplicationJson, void> getUserMountsRaw({bool? oCSAPIRequest}) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final path = UriTemplate('/ocs/v2.php/apps/files_external/api/v1/mounts').expand(parameters);
    return DynamiteRawResponse<ApiGetUserMountsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ApiGetUserMountsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

class Mount_Type extends EnumClass {
  const Mount_Type._(super.name);

  static const Mount_Type dir = _$mountTypeDir;

  // coverage:ignore-start
  static BuiltSet<Mount_Type> get values => _$mountTypeValues;
  // coverage:ignore-end

  static Mount_Type valueOf(String name) => _$valueOfMount_Type(name);

  static Serializer<Mount_Type> get serializer => _$mountTypeSerializer;
}

class Mount_Scope extends EnumClass {
  const Mount_Scope._(super.name);

  static const Mount_Scope system = _$mountScopeSystem;

  static const Mount_Scope personal = _$mountScopePersonal;

  // coverage:ignore-start
  static BuiltSet<Mount_Scope> get values => _$mountScopeValues;
  // coverage:ignore-end

  static Mount_Scope valueOf(String name) => _$valueOfMount_Scope(name);

  static Serializer<Mount_Scope> get serializer => _$mountScopeSerializer;
}

class StorageConfig_Type extends EnumClass {
  const StorageConfig_Type._(super.name);

  static const StorageConfig_Type personal = _$storageConfigTypePersonal;

  static const StorageConfig_Type system = _$storageConfigTypeSystem;

  // coverage:ignore-start
  static BuiltSet<StorageConfig_Type> get values => _$storageConfigTypeValues;
  // coverage:ignore-end

  static StorageConfig_Type valueOf(String name) => _$valueOfStorageConfig_Type(name);

  static Serializer<StorageConfig_Type> get serializer => _$storageConfigTypeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $StorageConfigInterface {
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

abstract class StorageConfig implements $StorageConfigInterface, Built<StorageConfig, StorageConfigBuilder> {
  factory StorageConfig([void Function(StorageConfigBuilder)? b]) = _$StorageConfig;

  // coverage:ignore-start
  const StorageConfig._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StorageConfig.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<StorageConfig> get serializer => _$storageConfigSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MountInterface {
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

abstract class Mount implements $MountInterface, Built<Mount, MountBuilder> {
  factory Mount([void Function(MountBuilder)? b]) = _$Mount;

  // coverage:ignore-start
  const Mount._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Mount.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Mount> get serializer => _$mountSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetUserMountsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Mount> get data;
}

abstract class ApiGetUserMountsResponseApplicationJson_Ocs
    implements
        $ApiGetUserMountsResponseApplicationJson_OcsInterface,
        Built<ApiGetUserMountsResponseApplicationJson_Ocs, ApiGetUserMountsResponseApplicationJson_OcsBuilder> {
  factory ApiGetUserMountsResponseApplicationJson_Ocs([
    void Function(ApiGetUserMountsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ApiGetUserMountsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGetUserMountsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetUserMountsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiGetUserMountsResponseApplicationJson_Ocs> get serializer =>
      _$apiGetUserMountsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetUserMountsResponseApplicationJsonInterface {
  ApiGetUserMountsResponseApplicationJson_Ocs get ocs;
}

abstract class ApiGetUserMountsResponseApplicationJson
    implements
        $ApiGetUserMountsResponseApplicationJsonInterface,
        Built<ApiGetUserMountsResponseApplicationJson, ApiGetUserMountsResponseApplicationJsonBuilder> {
  factory ApiGetUserMountsResponseApplicationJson([void Function(ApiGetUserMountsResponseApplicationJsonBuilder)? b]) =
      _$ApiGetUserMountsResponseApplicationJson;

  // coverage:ignore-start
  const ApiGetUserMountsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetUserMountsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiGetUserMountsResponseApplicationJson> get serializer =>
      _$apiGetUserMountsResponseApplicationJsonSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(ApiGetUserMountsResponseApplicationJson),
        ApiGetUserMountsResponseApplicationJsonBuilder.new,
      )
      ..add(ApiGetUserMountsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetUserMountsResponseApplicationJson_Ocs),
        ApiGetUserMountsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiGetUserMountsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(Mount), MountBuilder.new)
      ..add(Mount.serializer)
      ..add(Mount_Type.serializer)
      ..add(Mount_Scope.serializer)
      ..addBuilderFactory(const FullType(StorageConfig), StorageConfigBuilder.new)
      ..add(StorageConfig.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..add(StorageConfig_Type.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Mount)]), ListBuilder<Mount>.new))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
