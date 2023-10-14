// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'dav.openapi.g.dart';

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

  DirectClient get direct => DirectClient(this);
}

class DirectClient {
  DirectClient(this._rootClient);

  final Client _rootClient;

  /// Get a direct link to a file.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [fileId] ID of the file
  ///   * [expirationTime] Duration until the link expires
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Direct link returned
  ///   * 404: File not found
  ///   * 400: Getting direct link is not possible
  ///   * 403: Missing permissions to get direct link
  ///
  /// See:
  ///  * [getUrlRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DirectGetUrlResponseApplicationJson, void>> getUrl({
    required final int fileId,
    final int? expirationTime,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUrlRaw(
      fileId: fileId,
      expirationTime: expirationTime,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a direct link to a file.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [fileId] ID of the file
  ///   * [expirationTime] Duration until the link expires
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Direct link returned
  ///   * 404: File not found
  ///   * 400: Getting direct link is not possible
  ///   * 403: Missing permissions to get direct link
  ///
  /// See:
  ///  * [getUrl] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DirectGetUrlResponseApplicationJson, void> getUrlRaw({
    required final int fileId,
    final int? expirationTime,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/apps/dav/api/v1/direct';
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
    queryParameters['fileId'] = fileId.toString();
    if (expirationTime != null) {
      queryParameters['expirationTime'] = expirationTime.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<DirectGetUrlResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DirectGetUrlResponseApplicationJson),
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

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DirectGetUrlResponseApplicationJson_Ocs_DataInterface {
  String get url;
}

abstract class DirectGetUrlResponseApplicationJson_Ocs_Data
    implements
        DirectGetUrlResponseApplicationJson_Ocs_DataInterface,
        Built<DirectGetUrlResponseApplicationJson_Ocs_Data, DirectGetUrlResponseApplicationJson_Ocs_DataBuilder> {
  factory DirectGetUrlResponseApplicationJson_Ocs_Data([
    final void Function(DirectGetUrlResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$DirectGetUrlResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const DirectGetUrlResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectGetUrlResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectGetUrlResponseApplicationJson_Ocs_Data> get serializer =>
      _$directGetUrlResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DirectGetUrlResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectGetUrlResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectGetUrlResponseApplicationJson_Ocs
    implements
        DirectGetUrlResponseApplicationJson_OcsInterface,
        Built<DirectGetUrlResponseApplicationJson_Ocs, DirectGetUrlResponseApplicationJson_OcsBuilder> {
  factory DirectGetUrlResponseApplicationJson_Ocs([
    final void Function(DirectGetUrlResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectGetUrlResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectGetUrlResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectGetUrlResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectGetUrlResponseApplicationJson_Ocs> get serializer =>
      _$directGetUrlResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DirectGetUrlResponseApplicationJsonInterface {
  DirectGetUrlResponseApplicationJson_Ocs get ocs;
}

abstract class DirectGetUrlResponseApplicationJson
    implements
        DirectGetUrlResponseApplicationJsonInterface,
        Built<DirectGetUrlResponseApplicationJson, DirectGetUrlResponseApplicationJsonBuilder> {
  factory DirectGetUrlResponseApplicationJson([final void Function(DirectGetUrlResponseApplicationJsonBuilder)? b]) =
      _$DirectGetUrlResponseApplicationJson;

  // coverage:ignore-start
  const DirectGetUrlResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectGetUrlResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectGetUrlResponseApplicationJson> get serializer =>
      _$directGetUrlResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_DavInterface {
  String get chunking;
  String? get bulkupload;
}

abstract class Capabilities_Dav implements Capabilities_DavInterface, Built<Capabilities_Dav, Capabilities_DavBuilder> {
  factory Capabilities_Dav([final void Function(Capabilities_DavBuilder)? b]) = _$Capabilities_Dav;

  // coverage:ignore-start
  const Capabilities_Dav._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Dav.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_Dav> get serializer => _$capabilitiesDavSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  Capabilities_Dav get dav;
}

abstract class Capabilities implements CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([final void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(DirectGetUrlResponseApplicationJson), DirectGetUrlResponseApplicationJson.new)
      ..add(DirectGetUrlResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectGetUrlResponseApplicationJson_Ocs),
        DirectGetUrlResponseApplicationJson_Ocs.new,
      )
      ..add(DirectGetUrlResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(DirectGetUrlResponseApplicationJson_Ocs_Data),
        DirectGetUrlResponseApplicationJson_Ocs_Data.new,
      )
      ..add(DirectGetUrlResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_Dav), Capabilities_Dav.new)
      ..add(Capabilities_Dav.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
