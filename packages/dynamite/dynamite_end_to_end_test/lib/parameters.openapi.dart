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
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
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
  ///   * [object]
  ///   * [oneOf]
  ///   * [anyOf]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<JsonObject, void>> $get({
    final ContentString<BuiltMap<String, JsonObject>>? contentString,
    final ContentString<BuiltMap<String, JsonObject>>? contentParameter,
    final BuiltList<String>? array,
    final bool? $bool,
    final String? string,
    final Uint8List? stringBinary,
    final int? $int,
    final double? $double,
    final num? $num,
    final JsonObject? object,
    final GetOneOf? oneOf,
    final GetAnyOf? anyOf,
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
      object: object,
      oneOf: oneOf,
      anyOf: anyOf,
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
  ///   * [object]
  ///   * [oneOf]
  ///   * [anyOf]
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
    final BuiltList<String>? array,
    final bool? $bool,
    final String? string,
    final Uint8List? stringBinary,
    final int? $int,
    final double? $double,
    final num? $num,
    final JsonObject? object,
    final GetOneOf? oneOf,
    final GetAnyOf? anyOf,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    final $contentString = jsonSerializers.serialize(
      contentString,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
      ]),
    );
    parameters['content_string'] = $contentString;

    final $contentParameter = jsonSerializers.serialize(
      contentParameter,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
      ]),
    );
    parameters['content_parameter'] = $contentParameter;

    final $array = jsonSerializers.serialize(array, specifiedType: const FullType(BuiltList, [FullType(String)]));
    parameters['array'] = $array;

    final $$bool = jsonSerializers.serialize($bool, specifiedType: const FullType(bool));
    parameters['bool'] = $$bool;

    final $string = jsonSerializers.serialize(string, specifiedType: const FullType(String));
    parameters['string'] = $string;

    final $stringBinary = jsonSerializers.serialize(stringBinary, specifiedType: const FullType(Uint8List));
    parameters['string_binary'] = $stringBinary;

    final $$int = jsonSerializers.serialize($int, specifiedType: const FullType(int));
    parameters['int'] = $$int;

    final $$double = jsonSerializers.serialize($double, specifiedType: const FullType(double));
    parameters['double'] = $$double;

    final $$num = jsonSerializers.serialize($num, specifiedType: const FullType(num));
    parameters['num'] = $$num;

    final $object = jsonSerializers.serialize(object, specifiedType: const FullType(JsonObject));
    parameters['object'] = $object;

    final $oneOf = jsonSerializers.serialize(oneOf, specifiedType: const FullType(GetOneOf));
    parameters['oneOf'] = $oneOf;

    final $anyOf = jsonSerializers.serialize(anyOf, specifiedType: const FullType(GetAnyOf));
    parameters['anyOf'] = $anyOf;

    final uri = Uri.parse(
      UriTemplate(
        '/{?content_string*,content_parameter*,array*,bool*,string*,string_binary*,int*,double*,num*,object*,oneOf*,anyOf*}',
      ).expand(parameters),
    );
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
  /// Parameters:
  ///   * [array]
  ///   * [$bool]
  ///   * [string]
  ///   * [$int]
  ///   * [$double]
  ///   * [$num]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getHeadersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<JsonObject, void>> getHeaders({
    final BuiltList<String>? array,
    final bool? $bool,
    final String? string,
    final int? $int,
    final double? $double,
    final num? $num,
  }) async {
    final rawResponse = getHeadersRaw(
      array: array,
      $bool: $bool,
      string: string,
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
  ///   * [array]
  ///   * [$bool]
  ///   * [string]
  ///   * [$int]
  ///   * [$double]
  ///   * [$num]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getHeaders] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<JsonObject, void> getHeadersRaw({
    final BuiltList<String>? array,
    final bool? $bool,
    final String? string,
    final int? $int,
    final double? $double,
    final num? $num,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    final $array = jsonSerializers.serialize(array, specifiedType: const FullType(BuiltList, [FullType(String)]));
    if ($array != null) {
      headers['array'] = ($array as List).map<String>((final e) => e as String).join();
    }

    final $$bool = jsonSerializers.serialize($bool, specifiedType: const FullType(bool));
    if ($$bool != null) {
      headers['bool'] = $$bool.toString();
    }

    final $string = jsonSerializers.serialize(string, specifiedType: const FullType(String));
    if ($string != null) {
      headers['string'] = $string as String;
    }

    final $$int = jsonSerializers.serialize($int, specifiedType: const FullType(int));
    if ($$int != null) {
      headers['int'] = $$int.toString();
    }

    final $$double = jsonSerializers.serialize($double, specifiedType: const FullType(double));
    if ($$double != null) {
      headers['double'] = $$double.toString();
    }

    final $$num = jsonSerializers.serialize($num, specifiedType: const FullType(num));
    if ($$num != null) {
      headers['num'] = $$num.toString();
    }

    final uri = Uri.parse(UriTemplate('/headers').expand(parameters));
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
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    final $pathParameter = jsonSerializers.serialize(pathParameter, specifiedType: const FullType(String));
    parameters['path_parameter'] = $pathParameter;

    final uri = Uri.parse(UriTemplate('/{path_parameter}').expand(parameters));
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

typedef GetOneOf = ({bool? $bool, String? string});

typedef GetAnyOf = ({bool? $bool, String? string});

typedef $BoolString = ({bool? $bool, String? string});

extension $BoolStringExtension on $BoolString {
  List<dynamic> get _values => [$bool, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BoolString> get serializer => const _$BoolStringSerializer();
  static $BoolString fromJson(final Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BoolStringSerializer implements PrimitiveSerializer<$BoolString> {
  const _$BoolStringSerializer();

  @override
  Iterable<Type> get types => const [$BoolString];

  @override
  String get wireName => r'$BoolString';

  @override
  Object serialize(
    final Serializers serializers,
    final $BoolString object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$bool;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(bool))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BoolString deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    bool? $bool;
    try {
      $bool = serializers.deserialize(data, specifiedType: const FullType(bool))! as bool;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return ($bool: $bool, string: string);
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
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..add($BoolStringExtension.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
