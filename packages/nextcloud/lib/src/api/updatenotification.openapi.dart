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

part 'updatenotification.openapi.g.dart';

class UpdatenotificationResponse<T, U> extends DynamiteResponse<T, U> {
  UpdatenotificationResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'UpdatenotificationResponse(data: $data, headers: $headers)';
}

class UpdatenotificationApiException extends DynamiteApiException {
  UpdatenotificationApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<UpdatenotificationApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return UpdatenotificationApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'UpdatenotificationApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class UpdatenotificationClient extends DynamiteClient {
  UpdatenotificationClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  UpdatenotificationClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  UpdatenotificationApiClient get api => UpdatenotificationApiClient(this);
}

class UpdatenotificationApiClient {
  UpdatenotificationApiClient(this._rootClient);

  final UpdatenotificationClient _rootClient;

  /// List available updates for apps
  ///
  /// This endpoint requires admin access
  Future<UpdatenotificationApiGetAppListResponse200ApplicationJson> getAppList({
    required final String newVersion,
    final UpdatenotificationApiGetAppListApiVersion apiVersion = UpdatenotificationApiGetAppListApiVersion.v1,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/updatenotification/api/{apiVersion}/applist/{newVersion}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{newVersion}', Uri.encodeQueryComponent(newVersion));
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(UpdatenotificationApiGetAppListResponse200ApplicationJson),
      )! as UpdatenotificationApiGetAppListResponse200ApplicationJson;
    }
    throw await UpdatenotificationApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UpdatenotificationApiGetAppListApiVersion extends EnumClass {
  const UpdatenotificationApiGetAppListApiVersion._(super.name);

  static const UpdatenotificationApiGetAppListApiVersion v1 = _$updatenotificationApiGetAppListApiVersionV1;

  // coverage:ignore-start
  static BuiltSet<UpdatenotificationApiGetAppListApiVersion> get values =>
      _$updatenotificationApiGetAppListApiVersionValues;
  // coverage:ignore-end
  static UpdatenotificationApiGetAppListApiVersion valueOf(final String name) =>
      _$valueOfUpdatenotificationApiGetAppListApiVersion(name);
  static Serializer<UpdatenotificationApiGetAppListApiVersion> get serializer =>
      _$updatenotificationApiGetAppListApiVersionSerializer;
}

abstract class UpdatenotificationOCSMeta implements Built<UpdatenotificationOCSMeta, UpdatenotificationOCSMetaBuilder> {
  factory UpdatenotificationOCSMeta([final void Function(UpdatenotificationOCSMetaBuilder)? b]) =
      _$UpdatenotificationOCSMeta;

  // coverage:ignore-start
  const UpdatenotificationOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationOCSMeta.fromJson(final Map<String, dynamic> json) =>
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
  static Serializer<UpdatenotificationOCSMeta> get serializer => _$updatenotificationOCSMetaSerializer;
}

abstract class UpdatenotificationApp implements Built<UpdatenotificationApp, UpdatenotificationAppBuilder> {
  factory UpdatenotificationApp([final void Function(UpdatenotificationAppBuilder)? b]) = _$UpdatenotificationApp;

  // coverage:ignore-start
  const UpdatenotificationApp._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationApp.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get appId;
  String get appName;
  static Serializer<UpdatenotificationApp> get serializer => _$updatenotificationAppSerializer;
}

abstract class UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data
    implements
        Built<UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data,
            UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_DataBuilder> {
  factory UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data([
    final void Function(UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<UpdatenotificationApp> get missing;
  BuiltList<UpdatenotificationApp> get available;
  static Serializer<UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$updatenotificationApiGetAppListResponse200ApplicationJsonOcsDataSerializer;
}

abstract class UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs
    implements
        Built<UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs,
            UpdatenotificationApiGetAppListResponse200ApplicationJson_OcsBuilder> {
  factory UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs([
    final void Function(UpdatenotificationApiGetAppListResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UpdatenotificationOCSMeta get meta;
  UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs> get serializer =>
      _$updatenotificationApiGetAppListResponse200ApplicationJsonOcsSerializer;
}

abstract class UpdatenotificationApiGetAppListResponse200ApplicationJson
    implements
        Built<UpdatenotificationApiGetAppListResponse200ApplicationJson,
            UpdatenotificationApiGetAppListResponse200ApplicationJsonBuilder> {
  factory UpdatenotificationApiGetAppListResponse200ApplicationJson([
    final void Function(UpdatenotificationApiGetAppListResponse200ApplicationJsonBuilder)? b,
  ]) = _$UpdatenotificationApiGetAppListResponse200ApplicationJson;

  // coverage:ignore-start
  const UpdatenotificationApiGetAppListResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationApiGetAppListResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs get ocs;
  static Serializer<UpdatenotificationApiGetAppListResponse200ApplicationJson> get serializer =>
      _$updatenotificationApiGetAppListResponse200ApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..add(UpdatenotificationApiGetAppListApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(UpdatenotificationApiGetAppListResponse200ApplicationJson),
        UpdatenotificationApiGetAppListResponse200ApplicationJson.new,
      )
      ..add(UpdatenotificationApiGetAppListResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs),
        UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs.new,
      )
      ..add(UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UpdatenotificationOCSMeta), UpdatenotificationOCSMeta.new)
      ..add(UpdatenotificationOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data),
        UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(UpdatenotificationApiGetAppListResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(UpdatenotificationApp), UpdatenotificationApp.new)
      ..add(UpdatenotificationApp.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UpdatenotificationApp)]),
        ListBuilder<UpdatenotificationApp>.new,
      ))
    .build();

Serializers get updatenotificationSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeUpdatenotification<T>(final Object data) =>
    _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeUpdatenotification<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
