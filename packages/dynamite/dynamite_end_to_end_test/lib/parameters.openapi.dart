// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/models.dart';
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
  /// Parameters:
  ///   * [contentString]
  ///   * [contentParameter]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<JsonObject, void>> $get({
    final ContentString<BuiltMap<String, JsonObject>>? contentString,
    final ContentString<BuiltMap<String, JsonObject>>? contentParameter,
  }) async {
    final rawResponse = $getRaw(
      contentString: contentString,
      contentParameter: contentParameter,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [contentString]
  ///   * [contentParameter]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<JsonObject, void> $getRaw({
    final ContentString<BuiltMap<String, JsonObject>>? contentString,
    final ContentString<BuiltMap<String, JsonObject>>? contentParameter,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    if (contentString != null) {
      queryParameters['content-string'] = _jsonSerializers.serialize(
        contentString,
        specifiedType: const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
      );
    }
    if (contentParameter != null) {
      queryParameters['content-parameter'] = _jsonSerializers.serialize(
        contentParameter,
        specifiedType: const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
      );
    }
    const path = '/';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<JsonObject, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(JsonObject),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

// coverage:ignore-start
final Serializers _serializers = Serializers().toBuilder().build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
