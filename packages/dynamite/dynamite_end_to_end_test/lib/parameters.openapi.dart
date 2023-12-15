// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: unused_element
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
import 'package:uri/uri.dart';

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
  ///   * [array]
  ///   * [$bool]
  ///   * [string]
  ///   * [stringBinary]
  ///   * [$int]
  ///   * [$double]
  ///   * [$num]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<JsonObject, void>> $get({
    final ContentString<BuiltMap<String, JsonObject>>? contentString,
    final ContentString<BuiltMap<String, JsonObject>>? contentParameter,
    final BuiltList<JsonObject>? array,
    final bool? $bool,
    final String? string,
    final Uint8List? stringBinary,
    final int? $int,
    final double? $double,
    final num? $num,
  }) async {
    final rawResponse = $getRaw(
      contentString: contentString,
      contentParameter: contentParameter,
      array: array,
      $bool: $bool,
      string: string,
      stringBinary: stringBinary,
      $int: $int,
      $double: $double,
      $num: $num,
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
  ///   * [array]
  ///   * [$bool]
  ///   * [string]
  ///   * [stringBinary]
  ///   * [$int]
  ///   * [$double]
  ///   * [$num]
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
    final BuiltList<JsonObject>? array,
    final bool? $bool,
    final String? string,
    final Uint8List? stringBinary,
    final int? $int,
    final double? $double,
    final num? $num,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    if (contentString != null) {
      queryParameters['content_string'] = jsonSerializers.serialize(
        contentString,
        specifiedType: const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
      );
    }
    if (contentParameter != null) {
      queryParameters['content_parameter'] = jsonSerializers.serialize(
        contentParameter,
        specifiedType: const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
      );
    }
    if (array != null) {
      queryParameters['array'] = array.map((final e) => e.toString());
    }
    if ($bool != null) {
      queryParameters['bool'] = $bool.toString();
    }
    if (string != null) {
      queryParameters['string'] = string;
    }
    if (stringBinary != null) {
      queryParameters['string_binary'] = stringBinary.toString();
    }
    if ($int != null) {
      queryParameters['int'] = $int.toString();
    }
    if ($double != null) {
      queryParameters['double'] = $double.toString();
    }
    if ($num != null) {
      queryParameters['num'] = $num.toString();
    }
    var uri = Uri.parse(UriTemplate('/').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getPathParameterRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<JsonObject, void>> getPathParameter({required final String pathParameter}) async {
    final rawResponse = getPathParameterRaw(
      pathParameter: pathParameter,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getPathParameter] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<JsonObject, void> getPathParameterRaw({required final String pathParameter}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    pathParameters['path_parameter'] = pathParameter;
    var uri = Uri.parse(UriTemplate('/{path_parameter}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
    );
  }
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
        ContentStringBuilder<BuiltMap<String, JsonObject>>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
