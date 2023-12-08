// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'some_of.openapi.g.dart';

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
  ///   * [oneOf]
  ///   * [anyOf]
  ///
  /// Status codes:
  ///   * default
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> $get({
    final ({bool? $bool, String? string})? oneOf,
    final ({bool? $bool, String? string})? anyOf,
  }) async {
    final rawResponse = $getRaw(
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
  ///   * [oneOf]
  ///   * [anyOf]
  ///
  /// Status codes:
  ///   * default
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> $getRaw({
    final ({bool? $bool, String? string})? oneOf,
    final ({bool? $bool, String? string})? anyOf,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

    if (oneOf != null) {
      queryParameters['oneOf'] = oneOf.toString();
    }
    if (anyOf != null) {
      queryParameters['anyOf'] = anyOf.toString();
    }
    var uri = Uri.parse(UriTemplate('/').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        null,
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OneValueSomeOfInObjectInterface {
  @BuiltValueField(wireName: 'OneValue')
  int get oneValue;
  @BuiltValueField(wireName: 'IntDouble')
  num get intDouble;
  @BuiltValueField(wireName: 'IntDoubleString')
  OneValueSomeOfInObject_IntDoubleString? get intDoubleString;
}

abstract class OneValueSomeOfInObject
    implements $OneValueSomeOfInObjectInterface, Built<OneValueSomeOfInObject, OneValueSomeOfInObjectBuilder> {
  factory OneValueSomeOfInObject([final void Function(OneValueSomeOfInObjectBuilder)? b]) = _$OneValueSomeOfInObject;

  const OneValueSomeOfInObject._();

  factory OneValueSomeOfInObject.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<OneValueSomeOfInObject> get serializer => _$oneValueSomeOfInObjectSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneValueSomeOfInObjectBuilder b) {
    b.intDoubleString?.validateOneOf();
  }
}

typedef GetOneOf = ({bool? $bool, String? string});

typedef GetAnyOf = ({bool? $bool, String? string});

typedef OneOfIntDoubleOther = ({num? $num, String? string});

typedef AnyOfIntDoubleOther = ({num? $num, String? string});

typedef OneValueSomeOfInObject_IntDoubleString = ({num? $num, String? string});

typedef $BoolString = ({bool? $bool, String? string});

extension $BoolStringExtension on $BoolString {
  List<dynamic> get _values => [$bool, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BoolString> get serializer => const _$BoolStringSerializer();
  static $BoolString fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
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

typedef $NumString = ({num? $num, String? string});

extension $NumStringExtension on $NumString {
  List<dynamic> get _values => [$num, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$NumString> get serializer => const _$NumStringSerializer();
  static $NumString fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$NumStringSerializer implements PrimitiveSerializer<$NumString> {
  const _$NumStringSerializer();

  @override
  Iterable<Type> get types => const [$NumString];

  @override
  String get wireName => r'$NumString';

  @override
  Object serialize(
    final Serializers serializers,
    final $NumString object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$num;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(num))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $NumString deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    num? $num;
    try {
      $num = serializers.deserialize(data, specifiedType: const FullType(num))! as num;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return ($num: $num, string: string);
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..add($BoolStringExtension.serializer)
      ..add($NumStringExtension.serializer)
      ..addBuilderFactory(const FullType(OneValueSomeOfInObject), OneValueSomeOfInObjectBuilder.new)
      ..add(OneValueSomeOfInObject.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
