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
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'files_external.openapi.g.dart';

class FilesExternalResponse<T, U> extends DynamiteResponse<T, U> {
  FilesExternalResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'FilesExternalResponse(data: $data, headers: $headers)';
}

class FilesExternalApiException extends DynamiteApiException {
  FilesExternalApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<FilesExternalApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return FilesExternalApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'FilesExternalApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class FilesExternalClient extends DynamiteClient {
  FilesExternalClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  FilesExternalClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  FilesExternalApiClient get api => FilesExternalApiClient(this);
}

class FilesExternalApiClient {
  FilesExternalApiClient(this._rootClient);

  final FilesExternalClient _rootClient;

  /// Get the mount points visible for this user
  Future<FilesExternalApiGetUserMountsResponseApplicationJson> getUserMounts({final bool oCSAPIRequest = true}) async {
    const path = '/ocs/v2.php/apps/files_external/api/v1/mounts';
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
        specifiedType: const FullType(FilesExternalApiGetUserMountsResponseApplicationJson),
      )! as FilesExternalApiGetUserMountsResponseApplicationJson;
    }
    throw await FilesExternalApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class FilesExternalOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  FilesExternalOCSMetaInterface rebuild(final void Function(FilesExternalOCSMetaInterfaceBuilder) updates);
  FilesExternalOCSMetaInterfaceBuilder toBuilder();
}

abstract class FilesExternalOCSMeta
    implements FilesExternalOCSMetaInterface, Built<FilesExternalOCSMeta, FilesExternalOCSMetaBuilder> {
  factory FilesExternalOCSMeta([final void Function(FilesExternalOCSMetaBuilder)? b]) = _$FilesExternalOCSMeta;

  // coverage:ignore-start
  const FilesExternalOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesExternalOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesExternalOCSMeta> get serializer => _$filesExternalOCSMetaSerializer;
}

class FilesExternalMount_Type extends EnumClass {
  const FilesExternalMount_Type._(super.name);

  static const FilesExternalMount_Type dir = _$filesExternalMountTypeDir;

  // coverage:ignore-start
  static BuiltSet<FilesExternalMount_Type> get values => _$filesExternalMountTypeValues;
  // coverage:ignore-end

  static FilesExternalMount_Type valueOf(final String name) => _$valueOfFilesExternalMount_Type(name);

  static Serializer<FilesExternalMount_Type> get serializer => _$filesExternalMountTypeSerializer;
}

class FilesExternalMount_Scope extends EnumClass {
  const FilesExternalMount_Scope._(super.name);

  static const FilesExternalMount_Scope system = _$filesExternalMountScopeSystem;

  static const FilesExternalMount_Scope personal = _$filesExternalMountScopePersonal;

  // coverage:ignore-start
  static BuiltSet<FilesExternalMount_Scope> get values => _$filesExternalMountScopeValues;
  // coverage:ignore-end

  static FilesExternalMount_Scope valueOf(final String name) => _$valueOfFilesExternalMount_Scope(name);

  static Serializer<FilesExternalMount_Scope> get serializer => _$filesExternalMountScopeSerializer;
}

class FilesExternalStorageConfig_Type extends EnumClass {
  const FilesExternalStorageConfig_Type._(super.name);

  static const FilesExternalStorageConfig_Type personal = _$filesExternalStorageConfigTypePersonal;

  static const FilesExternalStorageConfig_Type system = _$filesExternalStorageConfigTypeSystem;

  // coverage:ignore-start
  static BuiltSet<FilesExternalStorageConfig_Type> get values => _$filesExternalStorageConfigTypeValues;
  // coverage:ignore-end

  static FilesExternalStorageConfig_Type valueOf(final String name) => _$valueOfFilesExternalStorageConfig_Type(name);

  static Serializer<FilesExternalStorageConfig_Type> get serializer => _$filesExternalStorageConfigTypeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesExternalStorageConfigInterface {
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
  FilesExternalStorageConfig_Type get type;
  bool get userProvided;
  FilesExternalStorageConfigInterface rebuild(final void Function(FilesExternalStorageConfigInterfaceBuilder) updates);
  FilesExternalStorageConfigInterfaceBuilder toBuilder();
}

abstract class FilesExternalStorageConfig
    implements
        FilesExternalStorageConfigInterface,
        Built<FilesExternalStorageConfig, FilesExternalStorageConfigBuilder> {
  factory FilesExternalStorageConfig([final void Function(FilesExternalStorageConfigBuilder)? b]) =
      _$FilesExternalStorageConfig;

  // coverage:ignore-start
  const FilesExternalStorageConfig._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesExternalStorageConfig.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesExternalStorageConfig> get serializer => _$filesExternalStorageConfigSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesExternalMountInterface {
  String get name;
  String get path;
  FilesExternalMount_Type get type;
  String get backend;
  FilesExternalMount_Scope get scope;
  int get permissions;
  int get id;
  @BuiltValueField(wireName: 'class')
  String get $class;
  FilesExternalStorageConfig get config;
  FilesExternalMountInterface rebuild(final void Function(FilesExternalMountInterfaceBuilder) updates);
  FilesExternalMountInterfaceBuilder toBuilder();
}

abstract class FilesExternalMount
    implements FilesExternalMountInterface, Built<FilesExternalMount, FilesExternalMountBuilder> {
  factory FilesExternalMount([final void Function(FilesExternalMountBuilder)? b]) = _$FilesExternalMount;

  // coverage:ignore-start
  const FilesExternalMount._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesExternalMount.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesExternalMount> get serializer => _$filesExternalMountSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesExternalApiGetUserMountsResponseApplicationJson_OcsInterface {
  FilesExternalOCSMeta get meta;
  BuiltList<FilesExternalMount> get data;
  FilesExternalApiGetUserMountsResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesExternalApiGetUserMountsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesExternalApiGetUserMountsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesExternalApiGetUserMountsResponseApplicationJson_Ocs
    implements
        FilesExternalApiGetUserMountsResponseApplicationJson_OcsInterface,
        Built<FilesExternalApiGetUserMountsResponseApplicationJson_Ocs,
            FilesExternalApiGetUserMountsResponseApplicationJson_OcsBuilder> {
  factory FilesExternalApiGetUserMountsResponseApplicationJson_Ocs([
    final void Function(FilesExternalApiGetUserMountsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesExternalApiGetUserMountsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesExternalApiGetUserMountsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesExternalApiGetUserMountsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesExternalApiGetUserMountsResponseApplicationJson_Ocs> get serializer =>
      _$filesExternalApiGetUserMountsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesExternalApiGetUserMountsResponseApplicationJsonInterface {
  FilesExternalApiGetUserMountsResponseApplicationJson_Ocs get ocs;
  FilesExternalApiGetUserMountsResponseApplicationJsonInterface rebuild(
    final void Function(FilesExternalApiGetUserMountsResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesExternalApiGetUserMountsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesExternalApiGetUserMountsResponseApplicationJson
    implements
        FilesExternalApiGetUserMountsResponseApplicationJsonInterface,
        Built<FilesExternalApiGetUserMountsResponseApplicationJson,
            FilesExternalApiGetUserMountsResponseApplicationJsonBuilder> {
  factory FilesExternalApiGetUserMountsResponseApplicationJson([
    final void Function(FilesExternalApiGetUserMountsResponseApplicationJsonBuilder)? b,
  ]) = _$FilesExternalApiGetUserMountsResponseApplicationJson;

  // coverage:ignore-start
  const FilesExternalApiGetUserMountsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesExternalApiGetUserMountsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesExternalApiGetUserMountsResponseApplicationJson> get serializer =>
      _$filesExternalApiGetUserMountsResponseApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(FilesExternalApiGetUserMountsResponseApplicationJson),
        FilesExternalApiGetUserMountsResponseApplicationJson.new,
      )
      ..add(FilesExternalApiGetUserMountsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesExternalApiGetUserMountsResponseApplicationJson_Ocs),
        FilesExternalApiGetUserMountsResponseApplicationJson_Ocs.new,
      )
      ..add(FilesExternalApiGetUserMountsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesExternalOCSMeta), FilesExternalOCSMeta.new)
      ..add(FilesExternalOCSMeta.serializer)
      ..addBuilderFactory(const FullType(FilesExternalMount), FilesExternalMount.new)
      ..add(FilesExternalMount.serializer)
      ..add(FilesExternalMount_Type.serializer)
      ..add(FilesExternalMount_Scope.serializer)
      ..addBuilderFactory(const FullType(FilesExternalStorageConfig), FilesExternalStorageConfig.new)
      ..add(FilesExternalStorageConfig.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..add(FilesExternalStorageConfig_Type.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesExternalMount)]),
        ListBuilder<FilesExternalMount>.new,
      ))
    .build();

Serializers get filesExternalSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeFilesExternal<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeFilesExternal<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
