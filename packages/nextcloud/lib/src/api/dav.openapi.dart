// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

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
  ///   * [fileId] ID of the file.
  ///   * [expirationTime] Duration until the link expires.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
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
  ///   * [fileId] ID of the file.
  ///   * [expirationTime] Duration until the link expires.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
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
    queryParameters['fileId'] = fileId.toString();
    if (expirationTime != null) {
      queryParameters['expirationTime'] = expirationTime.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/dav/api/v1/direct').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DirectGetUrlResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectGetUrlResponseApplicationJson_Ocs_Data> get serializer =>
      const _$DirectGetUrlResponseApplicationJson_Ocs_DataSerializer();
}

class _$DirectGetUrlResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<DirectGetUrlResponseApplicationJson_Ocs_Data> {
  const _$DirectGetUrlResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectGetUrlResponseApplicationJson_Ocs_Data, _$DirectGetUrlResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'DirectGetUrlResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectGetUrlResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectGetUrlResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectGetUrlResponseApplicationJson_Ocs> get serializer =>
      const _$DirectGetUrlResponseApplicationJson_OcsSerializer();
}

class _$DirectGetUrlResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DirectGetUrlResponseApplicationJson_Ocs> {
  const _$DirectGetUrlResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectGetUrlResponseApplicationJson_Ocs, _$DirectGetUrlResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DirectGetUrlResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectGetUrlResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectGetUrlResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs_Data),
            )! as DirectGetUrlResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectGetUrlResponseApplicationJson> get serializer =>
      const _$DirectGetUrlResponseApplicationJsonSerializer();
}

class _$DirectGetUrlResponseApplicationJsonSerializer
    implements StructuredSerializer<DirectGetUrlResponseApplicationJson> {
  const _$DirectGetUrlResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [DirectGetUrlResponseApplicationJson, _$DirectGetUrlResponseApplicationJson];

  @override
  String get wireName => 'DirectGetUrlResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectGetUrlResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  DirectGetUrlResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectGetUrlResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs))!
                as DirectGetUrlResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_Dav> get serializer => const _$Capabilities_DavSerializer();
}

class _$Capabilities_DavSerializer implements StructuredSerializer<Capabilities_Dav> {
  const _$Capabilities_DavSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_Dav, _$Capabilities_Dav];

  @override
  String get wireName => 'Capabilities_Dav';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_Dav object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'chunking',
      serializers.serialize(object.chunking, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.bulkupload;
    if (value != null) {
      result
        ..add('bulkupload')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  Capabilities_Dav deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_DavBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'chunking':
          result.chunking = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'bulkupload':
          result.bulkupload = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities> get serializer => const _$CapabilitiesSerializer();
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  const _$CapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities, _$Capabilities];

  @override
  String get wireName => 'Capabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'dav',
      serializers.serialize(object.dav, specifiedType: const FullType(Capabilities_Dav)),
    ];
    return result;
  }

  @override
  Capabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'dav':
          result.dav.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_Dav))! as Capabilities_Dav,
          );
      }
    }

    return result.build();
  }
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
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
