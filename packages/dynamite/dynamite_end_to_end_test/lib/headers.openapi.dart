// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: unused_element
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'headers.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
  });

  Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, GetHeaders>> $get() async {
    final rawResponse = $getRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, GetHeaders> $getRaw() {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

    var uri = Uri.parse(UriTemplate('/').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, GetHeaders>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: const FullType(GetHeaders),
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [withContentOperationIdRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, WithContentOperationIdHeaders>> withContentOperationId() async {
    final rawResponse = withContentOperationIdRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [withContentOperationId] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, WithContentOperationIdHeaders> withContentOperationIdRaw() {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

    var uri = Uri.parse(UriTemplate('/with_content/operation_id').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, WithContentOperationIdHeaders>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: const FullType(WithContentOperationIdHeaders),
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns both a header and a body.
  ///
  /// See:
  ///  * [getWithContentRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, GetWithContentHeaders>> getWithContent() async {
    final rawResponse = getWithContentRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns both a header and a body.
  ///
  /// See:
  ///  * [getWithContent] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, GetWithContentHeaders> getWithContentRaw() {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/octet-stream',
    };
    Uint8List? body;

    var uri = Uri.parse(UriTemplate('/with_content').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Uint8List, GetWithContentHeaders>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(GetWithContentHeaders),
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $GetHeadersInterface {
  @BuiltValueField(wireName: 'my-header')
  String? get myHeader;
}

abstract class GetHeaders implements $GetHeadersInterface, Built<GetHeaders, GetHeadersBuilder> {
  factory GetHeaders([final void Function(GetHeadersBuilder)? b]) = _$GetHeaders;

  const GetHeaders._();

  factory GetHeaders.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<GetHeaders> get serializer => _$getHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WithContentOperationIdHeadersInterface {
  @BuiltValueField(wireName: 'my-header')
  String? get myHeader;
}

abstract class WithContentOperationIdHeaders
    implements
        $WithContentOperationIdHeadersInterface,
        Built<WithContentOperationIdHeaders, WithContentOperationIdHeadersBuilder> {
  factory WithContentOperationIdHeaders([final void Function(WithContentOperationIdHeadersBuilder)? b]) =
      _$WithContentOperationIdHeaders;

  const WithContentOperationIdHeaders._();

  factory WithContentOperationIdHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<WithContentOperationIdHeaders> get serializer => _$withContentOperationIdHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $GetWithContentHeadersInterface {
  @BuiltValueField(wireName: 'my-header')
  String? get myHeader;
}

abstract class GetWithContentHeaders
    implements $GetWithContentHeadersInterface, Built<GetWithContentHeaders, GetWithContentHeadersBuilder> {
  factory GetWithContentHeaders([final void Function(GetWithContentHeadersBuilder)? b]) = _$GetWithContentHeaders;

  const GetWithContentHeaders._();

  factory GetWithContentHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<GetWithContentHeaders> get serializer => _$getWithContentHeadersSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(GetHeaders), GetHeadersBuilder.new)
      ..add(GetHeaders.serializer)
      ..addBuilderFactory(const FullType(WithContentOperationIdHeaders), WithContentOperationIdHeadersBuilder.new)
      ..add(WithContentOperationIdHeaders.serializer)
      ..addBuilderFactory(const FullType(GetWithContentHeaders), GetWithContentHeadersBuilder.new)
      ..add(GetWithContentHeaders.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
