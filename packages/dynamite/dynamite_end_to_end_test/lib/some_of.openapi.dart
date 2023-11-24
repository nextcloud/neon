// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;

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
}

@BuiltValue(instantiable: false)
abstract interface class $OneValueSomeOfInObjectInterface {
  @BuiltValueField(wireName: 'OneValue')
  int get oneValue;
  @BuiltValueField(wireName: 'IntDouble')
  OneValueSomeOfInObject_IntDouble? get intDouble;
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
    b.intDouble?.validateOneOf();
    b.intDoubleString?.validateOneOf();
  }
}

typedef OneOfIntDoubleOther = ({double? $double, int? $int, String? string});

typedef AnyOfIntDoubleOther = ({double? $double, int? $int, String? string});

typedef OneValueSomeOfInObject_IntDouble = ({double? $double, int? $int});

typedef OneValueSomeOfInObject_IntDoubleString = ({double? $double, int? $int, String? string});

typedef $DoubleIntString = ({double? $double, int? $int, String? string});

extension $DoubleIntStringExtension on $DoubleIntString {
  List<dynamic> get _values => [$double, $int, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$DoubleIntString> get serializer => const _$DoubleIntStringSerializer();
  static $DoubleIntString fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$DoubleIntStringSerializer implements PrimitiveSerializer<$DoubleIntString> {
  const _$DoubleIntStringSerializer();

  @override
  Iterable<Type> get types => const [$DoubleIntString];

  @override
  String get wireName => r'$DoubleIntString';

  @override
  Object serialize(
    final Serializers serializers,
    final $DoubleIntString object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$double;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(double))!;
    }
    value = object.$int;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(int))!;
    }
    value = object.string;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $DoubleIntString deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    double? $double;
    try {
      $double = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
    } catch (_) {}
    int? $int;
    try {
      $int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    String? string;
    try {
      string = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return ($double: $double, $int: $int, string: string);
  }
}

typedef $DoubleInt = ({double? $double, int? $int});

extension $DoubleIntExtension on $DoubleInt {
  List<dynamic> get _values => [$double, $int];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$DoubleInt> get serializer => const _$DoubleIntSerializer();
  static $DoubleInt fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$DoubleIntSerializer implements PrimitiveSerializer<$DoubleInt> {
  const _$DoubleIntSerializer();

  @override
  Iterable<Type> get types => const [$DoubleInt];

  @override
  String get wireName => r'$DoubleInt';

  @override
  Object serialize(
    final Serializers serializers,
    final $DoubleInt object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$double;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(double))!;
    }
    value = object.$int;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(int))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $DoubleInt deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    double? $double;
    try {
      $double = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
    } catch (_) {}
    int? $int;
    try {
      $int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    return ($double: $double, $int: $int);
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..add($DoubleIntStringExtension.serializer)
      ..addBuilderFactory(const FullType(OneValueSomeOfInObject), OneValueSomeOfInObjectBuilder.new)
      ..add(OneValueSomeOfInObject.serializer)
      ..add($DoubleIntExtension.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
