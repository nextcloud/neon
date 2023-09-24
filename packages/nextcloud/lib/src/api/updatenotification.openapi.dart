// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
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
  Future<UpdatenotificationApiGetAppListResponseApplicationJson> getAppList({
    required final String newVersion,
    final UpdatenotificationApiGetAppListApiVersion apiVersion = UpdatenotificationApiGetAppListApiVersion.v1,
    final bool oCSAPIRequest = true,
  }) async {
    var path = '/ocs/v2.php/apps/updatenotification/api/{apiVersion}/applist/{newVersion}';
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
    path = path.replaceAll('{newVersion}', Uri.encodeQueryComponent(newVersion));
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
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
        specifiedType: const FullType(UpdatenotificationApiGetAppListResponseApplicationJson),
      )! as UpdatenotificationApiGetAppListResponseApplicationJson;
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

@BuiltValue(instantiable: false)
abstract interface class UpdatenotificationOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  UpdatenotificationOCSMetaInterface rebuild(final void Function(UpdatenotificationOCSMetaInterfaceBuilder) updates);
  UpdatenotificationOCSMetaInterfaceBuilder toBuilder();
}

abstract class UpdatenotificationOCSMeta
    implements UpdatenotificationOCSMetaInterface, Built<UpdatenotificationOCSMeta, UpdatenotificationOCSMetaBuilder> {
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

  static Serializer<UpdatenotificationOCSMeta> get serializer => _$updatenotificationOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UpdatenotificationAppInterface {
  String get appId;
  String get appName;
  UpdatenotificationAppInterface rebuild(final void Function(UpdatenotificationAppInterfaceBuilder) updates);
  UpdatenotificationAppInterfaceBuilder toBuilder();
}

abstract class UpdatenotificationApp
    implements UpdatenotificationAppInterface, Built<UpdatenotificationApp, UpdatenotificationAppBuilder> {
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

  static Serializer<UpdatenotificationApp> get serializer => _$updatenotificationAppSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterface {
  BuiltList<UpdatenotificationApp> get missing;
  BuiltList<UpdatenotificationApp> get available;
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data
    implements
        UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterface,
        Built<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data,
            UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder> {
  factory UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data([
    final void Function(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data> get serializer =>
      _$updatenotificationApiGetAppListResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterface {
  UpdatenotificationOCSMeta get meta;
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data get data;
  UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterface rebuild(
    final void Function(UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class UpdatenotificationApiGetAppListResponseApplicationJson_Ocs
    implements
        UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterface,
        Built<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs,
            UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder> {
  factory UpdatenotificationApiGetAppListResponseApplicationJson_Ocs([
    final void Function(UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UpdatenotificationApiGetAppListResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationApiGetAppListResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs> get serializer =>
      _$updatenotificationApiGetAppListResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UpdatenotificationApiGetAppListResponseApplicationJsonInterface {
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs get ocs;
  UpdatenotificationApiGetAppListResponseApplicationJsonInterface rebuild(
    final void Function(UpdatenotificationApiGetAppListResponseApplicationJsonInterfaceBuilder) updates,
  );
  UpdatenotificationApiGetAppListResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class UpdatenotificationApiGetAppListResponseApplicationJson
    implements
        UpdatenotificationApiGetAppListResponseApplicationJsonInterface,
        Built<UpdatenotificationApiGetAppListResponseApplicationJson,
            UpdatenotificationApiGetAppListResponseApplicationJsonBuilder> {
  factory UpdatenotificationApiGetAppListResponseApplicationJson([
    final void Function(UpdatenotificationApiGetAppListResponseApplicationJsonBuilder)? b,
  ]) = _$UpdatenotificationApiGetAppListResponseApplicationJson;

  // coverage:ignore-start
  const UpdatenotificationApiGetAppListResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UpdatenotificationApiGetAppListResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UpdatenotificationApiGetAppListResponseApplicationJson> get serializer =>
      _$updatenotificationApiGetAppListResponseApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..add(UpdatenotificationApiGetAppListApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(UpdatenotificationApiGetAppListResponseApplicationJson),
        UpdatenotificationApiGetAppListResponseApplicationJson.new,
      )
      ..add(UpdatenotificationApiGetAppListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs),
        UpdatenotificationApiGetAppListResponseApplicationJson_Ocs.new,
      )
      ..add(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UpdatenotificationOCSMeta), UpdatenotificationOCSMeta.new)
      ..add(UpdatenotificationOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data),
        UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data.serializer)
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
