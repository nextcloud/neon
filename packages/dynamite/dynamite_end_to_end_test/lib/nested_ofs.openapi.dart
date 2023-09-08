// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';

part 'nested_ofs.openapi.g.dart';

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
abstract interface class BaseInterface {
  String? get attribute;
}

abstract class Base implements BaseInterface, Built<Base, BaseBuilder> {
  factory Base([final void Function(BaseBuilder)? b]) = _$Base;

  // coverage:ignore-start
  const Base._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Base.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Base> get serializer => _$baseSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class BaseAllOf_1Interface {
  @BuiltValueField(wireName: 'attribute-allOf')
  String? get attributeAllOf;
}

@BuiltValue(instantiable: false)
abstract interface class BaseAllOfInterface implements BaseInterface, BaseAllOf_1Interface {}

abstract class BaseAllOf implements BaseAllOfInterface, Built<BaseAllOf, BaseAllOfBuilder> {
  factory BaseAllOf([final void Function(BaseAllOfBuilder)? b]) = _$BaseAllOf;

  // coverage:ignore-start
  const BaseAllOf._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseAllOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BaseAllOf> get serializer => _$baseAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class BaseOneOf1Interface {
  @BuiltValueField(wireName: 'attribute-oneOf')
  String? get attributeOneOf;
}

abstract class BaseOneOf1 implements BaseOneOf1Interface, Built<BaseOneOf1, BaseOneOf1Builder> {
  factory BaseOneOf1([final void Function(BaseOneOf1Builder)? b]) = _$BaseOneOf1;

  // coverage:ignore-start
  const BaseOneOf1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseOneOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BaseOneOf1> get serializer => _$baseOneOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class BaseOneOfInterface {
  Base? get base;
  BaseOneOf1? get baseOneOf1;
}

abstract class BaseOneOf implements BaseOneOfInterface, Built<BaseOneOf, BaseOneOfBuilder> {
  factory BaseOneOf([final void Function(BaseOneOfBuilder)? b]) = _$BaseOneOf;

  // coverage:ignore-start
  const BaseOneOf._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseOneOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<BaseOneOf> get serializer => _$BaseOneOfSerializer();

  JsonObject get data;
}

class _$BaseOneOfSerializer implements PrimitiveSerializer<BaseOneOf> {
  @override
  final Iterable<Type> types = const [BaseOneOf, _$BaseOneOf];

  @override
  final String wireName = 'BaseOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final BaseOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  BaseOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = BaseOneOfBuilder()..data = JsonObject(data);
    try {
      result._base = (_jsonSerializers.deserialize(data, specifiedType: const FullType(Base))! as Base).toBuilder();
    } catch (_) {}
    try {
      result._baseOneOf1 =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseOneOf1))! as BaseOneOf1).toBuilder();
    } catch (_) {}
    assert(
      [result._base, result._baseOneOf1].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class BaseAnyOf1Interface {
  @BuiltValueField(wireName: 'attribute-anyOf')
  String? get attributeAnyOf;
}

abstract class BaseAnyOf1 implements BaseAnyOf1Interface, Built<BaseAnyOf1, BaseAnyOf1Builder> {
  factory BaseAnyOf1([final void Function(BaseAnyOf1Builder)? b]) = _$BaseAnyOf1;

  // coverage:ignore-start
  const BaseAnyOf1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseAnyOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BaseAnyOf1> get serializer => _$baseAnyOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class BaseAnyOfInterface {
  Base? get base;
  BaseAnyOf1? get baseAnyOf1;
}

abstract class BaseAnyOf implements BaseAnyOfInterface, Built<BaseAnyOf, BaseAnyOfBuilder> {
  factory BaseAnyOf([final void Function(BaseAnyOfBuilder)? b]) = _$BaseAnyOf;

  // coverage:ignore-start
  const BaseAnyOf._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseAnyOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<BaseAnyOf> get serializer => _$BaseAnyOfSerializer();

  JsonObject get data;
}

class _$BaseAnyOfSerializer implements PrimitiveSerializer<BaseAnyOf> {
  @override
  final Iterable<Type> types = const [BaseAnyOf, _$BaseAnyOf];

  @override
  final String wireName = 'BaseAnyOf';

  @override
  Object serialize(
    final Serializers serializers,
    final BaseAnyOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  BaseAnyOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = BaseAnyOfBuilder()..data = JsonObject(data);
    try {
      result._base = (_jsonSerializers.deserialize(data, specifiedType: const FullType(Base))! as Base).toBuilder();
    } catch (_) {}
    try {
      result._baseAnyOf1 =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAnyOf1))! as BaseAnyOf1).toBuilder();
    } catch (_) {}
    assert(
      [result._base, result._baseAnyOf1].where((final x) => x != null).isNotEmpty,
      'Need anyOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class BaseNestedAllOf_3Interface {
  @BuiltValueField(wireName: 'attribute-nested-allOf')
  String? get attributeNestedAllOf;
}

@BuiltValue(instantiable: false)
abstract interface class BaseNestedAllOfInterface
    implements BaseAllOfInterface, BaseOneOfInterface, BaseAnyOfInterface, BaseNestedAllOf_3Interface {}

abstract class BaseNestedAllOf implements BaseNestedAllOfInterface, Built<BaseNestedAllOf, BaseNestedAllOfBuilder> {
  factory BaseNestedAllOf([final void Function(BaseNestedAllOfBuilder)? b]) = _$BaseNestedAllOf;

  // coverage:ignore-start
  const BaseNestedAllOf._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseNestedAllOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BaseNestedAllOf> get serializer => _$baseNestedAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class BaseNestedOneOf3Interface {
  @BuiltValueField(wireName: 'attribute-nested-oneOf')
  String? get attributeNestedOneOf;
}

abstract class BaseNestedOneOf3 implements BaseNestedOneOf3Interface, Built<BaseNestedOneOf3, BaseNestedOneOf3Builder> {
  factory BaseNestedOneOf3([final void Function(BaseNestedOneOf3Builder)? b]) = _$BaseNestedOneOf3;

  // coverage:ignore-start
  const BaseNestedOneOf3._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseNestedOneOf3.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BaseNestedOneOf3> get serializer => _$baseNestedOneOf3Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class BaseNestedOneOfInterface {
  BaseAllOf? get baseAllOf;
  BaseOneOf? get baseOneOf;
  BaseAnyOf? get baseAnyOf;
  BaseNestedOneOf3? get baseNestedOneOf3;
}

abstract class BaseNestedOneOf implements BaseNestedOneOfInterface, Built<BaseNestedOneOf, BaseNestedOneOfBuilder> {
  factory BaseNestedOneOf([final void Function(BaseNestedOneOfBuilder)? b]) = _$BaseNestedOneOf;

  // coverage:ignore-start
  const BaseNestedOneOf._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseNestedOneOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<BaseNestedOneOf> get serializer => _$BaseNestedOneOfSerializer();

  JsonObject get data;
}

class _$BaseNestedOneOfSerializer implements PrimitiveSerializer<BaseNestedOneOf> {
  @override
  final Iterable<Type> types = const [BaseNestedOneOf, _$BaseNestedOneOf];

  @override
  final String wireName = 'BaseNestedOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final BaseNestedOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  BaseNestedOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = BaseNestedOneOfBuilder()..data = JsonObject(data);
    try {
      result._baseAllOf =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAllOf))! as BaseAllOf).toBuilder();
    } catch (_) {}
    try {
      result._baseOneOf =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseOneOf))! as BaseOneOf).toBuilder();
    } catch (_) {}
    try {
      result._baseAnyOf =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAnyOf))! as BaseAnyOf).toBuilder();
    } catch (_) {}
    try {
      result._baseNestedOneOf3 =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseNestedOneOf3))! as BaseNestedOneOf3)
              .toBuilder();
    } catch (_) {}
    assert(
      [result._baseAllOf, result._baseOneOf, result._baseAnyOf, result._baseNestedOneOf3]
          .where((final x) => x != null)
          .isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class BaseNestedAnyOf3Interface {
  @BuiltValueField(wireName: 'attribute-nested-anyOf')
  String? get attributeNestedAnyOf;
}

abstract class BaseNestedAnyOf3 implements BaseNestedAnyOf3Interface, Built<BaseNestedAnyOf3, BaseNestedAnyOf3Builder> {
  factory BaseNestedAnyOf3([final void Function(BaseNestedAnyOf3Builder)? b]) = _$BaseNestedAnyOf3;

  // coverage:ignore-start
  const BaseNestedAnyOf3._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseNestedAnyOf3.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<BaseNestedAnyOf3> get serializer => _$baseNestedAnyOf3Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class BaseNestedAnyOfInterface {
  BaseAllOf? get baseAllOf;
  BaseOneOf? get baseOneOf;
  BaseAnyOf? get baseAnyOf;
  BaseNestedAnyOf3? get baseNestedAnyOf3;
}

abstract class BaseNestedAnyOf implements BaseNestedAnyOfInterface, Built<BaseNestedAnyOf, BaseNestedAnyOfBuilder> {
  factory BaseNestedAnyOf([final void Function(BaseNestedAnyOfBuilder)? b]) = _$BaseNestedAnyOf;

  // coverage:ignore-start
  const BaseNestedAnyOf._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory BaseNestedAnyOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<BaseNestedAnyOf> get serializer => _$BaseNestedAnyOfSerializer();

  JsonObject get data;
}

class _$BaseNestedAnyOfSerializer implements PrimitiveSerializer<BaseNestedAnyOf> {
  @override
  final Iterable<Type> types = const [BaseNestedAnyOf, _$BaseNestedAnyOf];

  @override
  final String wireName = 'BaseNestedAnyOf';

  @override
  Object serialize(
    final Serializers serializers,
    final BaseNestedAnyOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  BaseNestedAnyOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = BaseNestedAnyOfBuilder()..data = JsonObject(data);
    try {
      result._baseAllOf =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAllOf))! as BaseAllOf).toBuilder();
    } catch (_) {}
    try {
      result._baseOneOf =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseOneOf))! as BaseOneOf).toBuilder();
    } catch (_) {}
    try {
      result._baseAnyOf =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAnyOf))! as BaseAnyOf).toBuilder();
    } catch (_) {}
    try {
      result._baseNestedAnyOf3 =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseNestedAnyOf3))! as BaseNestedAnyOf3)
              .toBuilder();
    } catch (_) {}
    assert(
      [result._baseAllOf, result._baseOneOf, result._baseAnyOf, result._baseNestedAnyOf3]
          .where((final x) => x != null)
          .isNotEmpty,
      'Need anyOf for ${result._data}',
    );
    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Base), Base.new)
      ..add(Base.serializer)
      ..addBuilderFactory(const FullType(BaseAllOf), BaseAllOf.new)
      ..add(BaseAllOf.serializer)
      ..addBuilderFactory(const FullType(BaseOneOf), BaseOneOf.new)
      ..add(BaseOneOf.serializer)
      ..addBuilderFactory(const FullType(BaseOneOf1), BaseOneOf1.new)
      ..add(BaseOneOf1.serializer)
      ..addBuilderFactory(const FullType(BaseAnyOf), BaseAnyOf.new)
      ..add(BaseAnyOf.serializer)
      ..addBuilderFactory(const FullType(BaseAnyOf1), BaseAnyOf1.new)
      ..add(BaseAnyOf1.serializer)
      ..addBuilderFactory(const FullType(BaseNestedAllOf), BaseNestedAllOf.new)
      ..add(BaseNestedAllOf.serializer)
      ..addBuilderFactory(const FullType(BaseNestedOneOf), BaseNestedOneOf.new)
      ..add(BaseNestedOneOf.serializer)
      ..addBuilderFactory(const FullType(BaseNestedOneOf3), BaseNestedOneOf3.new)
      ..add(BaseNestedOneOf3.serializer)
      ..addBuilderFactory(const FullType(BaseNestedAnyOf), BaseNestedAnyOf.new)
      ..add(BaseNestedAnyOf.serializer)
      ..addBuilderFactory(const FullType(BaseNestedAnyOf3), BaseNestedAnyOf3.new)
      ..add(BaseNestedAnyOf3.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
