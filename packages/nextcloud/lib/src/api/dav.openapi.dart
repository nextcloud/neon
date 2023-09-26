// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'dav.openapi.g.dart';

class DavResponse<T, U> extends DynamiteResponse<T, U> {
  DavResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'DavResponse(data: $data, headers: $headers)';
}

class DavApiException extends DynamiteApiException {
  DavApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<DavApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return DavApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'DavApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class DavClient extends DynamiteClient {
  DavClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  DavClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  DavDirectClient get direct => DavDirectClient(this);
}

class DavDirectClient {
  DavDirectClient(this._rootClient);

  final DavClient _rootClient;

  /// Get a direct link to a file
  Future<DavDirectGetUrlResponseApplicationJson> getUrl({
    required final int fileId,
    final int? expirationTime,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/dav/api/v1/direct';
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
    queryParameters['fileId'] = fileId.toString();
    if (expirationTime != null) {
      queryParameters['expirationTime'] = expirationTime.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(DavDirectGetUrlResponseApplicationJson),
      )! as DavDirectGetUrlResponseApplicationJson;
    }
    throw await DavApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class DavOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  DavOCSMetaInterface rebuild(final void Function(DavOCSMetaInterfaceBuilder) updates);
  DavOCSMetaInterfaceBuilder toBuilder();
}

abstract class DavOCSMeta implements DavOCSMetaInterface, Built<DavOCSMeta, DavOCSMetaBuilder> {
  factory DavOCSMeta([final void Function(DavOCSMetaBuilder)? b]) = _$DavOCSMeta;

  // coverage:ignore-start
  const DavOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavOCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavOCSMeta> get serializer => _$davOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DavDirectGetUrlResponseApplicationJson_Ocs_DataInterface {
  String get url;
  DavDirectGetUrlResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(DavDirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  DavDirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class DavDirectGetUrlResponseApplicationJson_Ocs_Data
    implements
        DavDirectGetUrlResponseApplicationJson_Ocs_DataInterface,
        Built<DavDirectGetUrlResponseApplicationJson_Ocs_Data, DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder> {
  factory DavDirectGetUrlResponseApplicationJson_Ocs_Data([
    final void Function(DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$DavDirectGetUrlResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const DavDirectGetUrlResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavDirectGetUrlResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavDirectGetUrlResponseApplicationJson_Ocs_Data> get serializer =>
      _$davDirectGetUrlResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DavDirectGetUrlResponseApplicationJson_OcsInterface {
  DavOCSMeta get meta;
  DavDirectGetUrlResponseApplicationJson_Ocs_Data get data;
  DavDirectGetUrlResponseApplicationJson_OcsInterface rebuild(
    final void Function(DavDirectGetUrlResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  DavDirectGetUrlResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class DavDirectGetUrlResponseApplicationJson_Ocs
    implements
        DavDirectGetUrlResponseApplicationJson_OcsInterface,
        Built<DavDirectGetUrlResponseApplicationJson_Ocs, DavDirectGetUrlResponseApplicationJson_OcsBuilder> {
  factory DavDirectGetUrlResponseApplicationJson_Ocs([
    final void Function(DavDirectGetUrlResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DavDirectGetUrlResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DavDirectGetUrlResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavDirectGetUrlResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavDirectGetUrlResponseApplicationJson_Ocs> get serializer =>
      _$davDirectGetUrlResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DavDirectGetUrlResponseApplicationJsonInterface {
  DavDirectGetUrlResponseApplicationJson_Ocs get ocs;
  DavDirectGetUrlResponseApplicationJsonInterface rebuild(
    final void Function(DavDirectGetUrlResponseApplicationJsonInterfaceBuilder) updates,
  );
  DavDirectGetUrlResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class DavDirectGetUrlResponseApplicationJson
    implements
        DavDirectGetUrlResponseApplicationJsonInterface,
        Built<DavDirectGetUrlResponseApplicationJson, DavDirectGetUrlResponseApplicationJsonBuilder> {
  factory DavDirectGetUrlResponseApplicationJson([
    final void Function(DavDirectGetUrlResponseApplicationJsonBuilder)? b,
  ]) = _$DavDirectGetUrlResponseApplicationJson;

  // coverage:ignore-start
  const DavDirectGetUrlResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavDirectGetUrlResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavDirectGetUrlResponseApplicationJson> get serializer =>
      _$davDirectGetUrlResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DavCapabilities_DavInterface {
  String get chunking;
  String? get bulkupload;
  DavCapabilities_DavInterface rebuild(final void Function(DavCapabilities_DavInterfaceBuilder) updates);
  DavCapabilities_DavInterfaceBuilder toBuilder();
}

abstract class DavCapabilities_Dav
    implements DavCapabilities_DavInterface, Built<DavCapabilities_Dav, DavCapabilities_DavBuilder> {
  factory DavCapabilities_Dav([final void Function(DavCapabilities_DavBuilder)? b]) = _$DavCapabilities_Dav;

  // coverage:ignore-start
  const DavCapabilities_Dav._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavCapabilities_Dav.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavCapabilities_Dav> get serializer => _$davCapabilitiesDavSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DavCapabilitiesInterface {
  DavCapabilities_Dav get dav;
  DavCapabilitiesInterface rebuild(final void Function(DavCapabilitiesInterfaceBuilder) updates);
  DavCapabilitiesInterfaceBuilder toBuilder();
}

abstract class DavCapabilities implements DavCapabilitiesInterface, Built<DavCapabilities, DavCapabilitiesBuilder> {
  factory DavCapabilities([final void Function(DavCapabilitiesBuilder)? b]) = _$DavCapabilities;

  // coverage:ignore-start
  const DavCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavCapabilities> get serializer => _$davCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DavDirectGetUrlResponseApplicationJson),
        DavDirectGetUrlResponseApplicationJson.new,
      )
      ..add(DavDirectGetUrlResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DavDirectGetUrlResponseApplicationJson_Ocs),
        DavDirectGetUrlResponseApplicationJson_Ocs.new,
      )
      ..add(DavDirectGetUrlResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(DavOCSMeta), DavOCSMeta.new)
      ..add(DavOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(DavDirectGetUrlResponseApplicationJson_Ocs_Data),
        DavDirectGetUrlResponseApplicationJson_Ocs_Data.new,
      )
      ..add(DavDirectGetUrlResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(DavCapabilities), DavCapabilities.new)
      ..add(DavCapabilities.serializer)
      ..addBuilderFactory(const FullType(DavCapabilities_Dav), DavCapabilities_Dav.new)
      ..add(DavCapabilities_Dav.serializer))
    .build();

Serializers get davSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeDav<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeDav<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
