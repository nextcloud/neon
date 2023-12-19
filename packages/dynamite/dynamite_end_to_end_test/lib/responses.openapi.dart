// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: unused_element
// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:typed_data';

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
  });

  Client.fromClient(DynamiteClient client)
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
  ///   * default
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<String, void>> $get() async {
    final rawResponse = $getRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * default
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<String, void> $getRaw() {
    const _headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? _body;

    const _path = '/';
    return DynamiteRawResponse<String, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        _body,
        null,
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///   * 201
  ///
  /// See:
  ///  * [putRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<String, void>> put() async {
    final rawResponse = putRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///   * 201
  ///
  /// See:
  ///  * [put] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<String, void> putRaw() {
    const _headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? _body;

    const _path = '/';
    return DynamiteRawResponse<String, void>(
      response: executeRequest(
        'put',
        _path,
        _headers,
        _body,
        const {200},
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * default
  ///   * 200
  ///   * 201
  ///
  /// See:
  ///  * [postRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<String, void>> post() async {
    final rawResponse = postRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * default
  ///   * 200
  ///   * 201
  ///
  /// See:
  ///  * [post] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<String, void> postRaw() {
    const _headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? _body;

    const _path = '/';
    return DynamiteRawResponse<String, void>(
      response: executeRequest(
        'post',
        _path,
        _headers,
        _body,
        null,
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///   * 201
  ///
  /// See:
  ///  * [patchRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<String, void>> patch() async {
    final rawResponse = patchRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///   * 201
  ///
  /// See:
  ///  * [patch] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<String, void> patchRaw() {
    const _headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? _body;

    const _path = '/';
    return DynamiteRawResponse<String, void>(
      response: executeRequest(
        'patch',
        _path,
        _headers,
        _body,
        const {200, 201},
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = Serializers().toBuilder().build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
