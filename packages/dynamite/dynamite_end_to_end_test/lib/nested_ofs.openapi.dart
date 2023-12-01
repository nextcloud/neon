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
abstract interface class $BaseAllOf_1Interface {
  @BuiltValueField(wireName: 'attribute-allOf')
  String get attributeAllOf;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseAllOfInterface implements $BaseAllOf_1Interface {
  @BuiltValueField(wireName: 'String')
  String get string;
}

abstract class BaseAllOf implements $BaseAllOfInterface, Built<BaseAllOf, BaseAllOfBuilder> {
  factory BaseAllOf([final void Function(BaseAllOfBuilder)? b]) = _$BaseAllOf;

  const BaseAllOf._();

  factory BaseAllOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<BaseAllOf> get serializer => _$baseAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseOneOf1Interface {
  @BuiltValueField(wireName: 'attribute-oneOf')
  String get attributeOneOf;
}

abstract class BaseOneOf1 implements $BaseOneOf1Interface, Built<BaseOneOf1, BaseOneOf1Builder> {
  factory BaseOneOf1([final void Function(BaseOneOf1Builder)? b]) = _$BaseOneOf1;

  const BaseOneOf1._();

  factory BaseOneOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<BaseOneOf1> get serializer => _$baseOneOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseAnyOf1Interface {
  @BuiltValueField(wireName: 'attribute-anyOf')
  String get attributeAnyOf;
}

abstract class BaseAnyOf1 implements $BaseAnyOf1Interface, Built<BaseAnyOf1, BaseAnyOf1Builder> {
  factory BaseAnyOf1([final void Function(BaseAnyOf1Builder)? b]) = _$BaseAnyOf1;

  const BaseAnyOf1._();

  factory BaseAnyOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<BaseAnyOf1> get serializer => _$baseAnyOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseNestedAllOf_3Interface {
  @BuiltValueField(wireName: 'attribute-nested-allOf')
  String get attributeNestedAllOf;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseNestedAllOfInterface implements $BaseAllOfInterface, $BaseNestedAllOf_3Interface {
  @BuiltValueField(wireName: 'BaseOneOf')
  BaseOneOf get baseOneOf;
  @BuiltValueField(wireName: 'BaseAnyOf')
  BaseAnyOf get baseAnyOf;
}

abstract class BaseNestedAllOf implements $BaseNestedAllOfInterface, Built<BaseNestedAllOf, BaseNestedAllOfBuilder> {
  factory BaseNestedAllOf([final void Function(BaseNestedAllOfBuilder)? b]) = _$BaseNestedAllOf;

  const BaseNestedAllOf._();

  factory BaseNestedAllOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<BaseNestedAllOf> get serializer => _$baseNestedAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseNestedOneOf3Interface {
  @BuiltValueField(wireName: 'attribute-nested-oneOf')
  String get attributeNestedOneOf;
}

abstract class BaseNestedOneOf3
    implements $BaseNestedOneOf3Interface, Built<BaseNestedOneOf3, BaseNestedOneOf3Builder> {
  factory BaseNestedOneOf3([final void Function(BaseNestedOneOf3Builder)? b]) = _$BaseNestedOneOf3;

  const BaseNestedOneOf3._();

  factory BaseNestedOneOf3.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<BaseNestedOneOf3> get serializer => _$baseNestedOneOf3Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseNestedAnyOf3Interface {
  @BuiltValueField(wireName: 'attribute-nested-anyOf')
  String get attributeNestedAnyOf;
}

abstract class BaseNestedAnyOf3
    implements $BaseNestedAnyOf3Interface, Built<BaseNestedAnyOf3, BaseNestedAnyOf3Builder> {
  factory BaseNestedAnyOf3([final void Function(BaseNestedAnyOf3Builder)? b]) = _$BaseNestedAnyOf3;

  const BaseNestedAnyOf3._();

  factory BaseNestedAnyOf3.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<BaseNestedAnyOf3> get serializer => _$baseNestedAnyOf3Serializer;
}

typedef BaseOneOf = ({BaseOneOf1? baseOneOf1, double? $double});

typedef BaseAnyOf = ({BaseAnyOf1? baseAnyOf1, int? $int});

typedef BaseNestedOneOf = ({
  BaseAllOf? baseAllOf,
  BaseAnyOf? baseAnyOf,
  BaseNestedOneOf3? baseNestedOneOf3,
  BaseOneOf? baseOneOf
});

typedef BaseNestedAnyOf = ({
  BaseAllOf? baseAllOf,
  BaseAnyOf? baseAnyOf,
  BaseNestedAnyOf3? baseNestedAnyOf3,
  BaseOneOf? baseOneOf
});

typedef $BaseOneOf1Double = ({BaseOneOf1? baseOneOf1, double? $double});

extension $BaseOneOf1DoubleExtension on $BaseOneOf1Double {
  List<dynamic> get _values => [baseOneOf1, $double];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BaseOneOf1Double> get serializer => const _$BaseOneOf1DoubleSerializer();
  static $BaseOneOf1Double fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$BaseOneOf1DoubleSerializer implements PrimitiveSerializer<$BaseOneOf1Double> {
  const _$BaseOneOf1DoubleSerializer();

  @override
  Iterable<Type> get types => const [$BaseOneOf1Double];

  @override
  String get wireName => r'$BaseOneOf1Double';

  @override
  Object serialize(
    final Serializers serializers,
    final $BaseOneOf1Double object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.baseOneOf1;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseOneOf1))!;
    }
    value = object.$double;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(double))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BaseOneOf1Double deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    BaseOneOf1? baseOneOf1;
    try {
      baseOneOf1 = _jsonSerializers.deserialize(data, specifiedType: const FullType(BaseOneOf1))! as BaseOneOf1;
    } catch (_) {}
    double? $double;
    try {
      $double = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
    } catch (_) {}
    return (baseOneOf1: baseOneOf1, $double: $double);
  }
}

typedef $BaseAnyOf1Int = ({BaseAnyOf1? baseAnyOf1, int? $int});

extension $BaseAnyOf1IntExtension on $BaseAnyOf1Int {
  List<dynamic> get _values => [baseAnyOf1, $int];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BaseAnyOf1Int> get serializer => const _$BaseAnyOf1IntSerializer();
  static $BaseAnyOf1Int fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$BaseAnyOf1IntSerializer implements PrimitiveSerializer<$BaseAnyOf1Int> {
  const _$BaseAnyOf1IntSerializer();

  @override
  Iterable<Type> get types => const [$BaseAnyOf1Int];

  @override
  String get wireName => r'$BaseAnyOf1Int';

  @override
  Object serialize(
    final Serializers serializers,
    final $BaseAnyOf1Int object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.baseAnyOf1;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseAnyOf1))!;
    }
    value = object.$int;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(int))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BaseAnyOf1Int deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    BaseAnyOf1? baseAnyOf1;
    try {
      baseAnyOf1 = _jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAnyOf1))! as BaseAnyOf1;
    } catch (_) {}
    int? $int;
    try {
      $int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    return (baseAnyOf1: baseAnyOf1, $int: $int);
  }
}

typedef $BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf = ({
  BaseAllOf? baseAllOf,
  BaseAnyOf? baseAnyOf,
  BaseNestedOneOf3? baseNestedOneOf3,
  BaseOneOf? baseOneOf
});

extension $BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOfExtension on $BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf {
  List<dynamic> get _values => [baseAllOf, baseAnyOf, baseNestedOneOf3, baseOneOf];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf> get serializer =>
      const _$BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOfSerializer();
  static $BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf fromJson(final Object? json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOfSerializer
    implements PrimitiveSerializer<$BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf> {
  const _$BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOfSerializer();

  @override
  Iterable<Type> get types => const [$BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf];

  @override
  String get wireName => r'$BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final $BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.baseAllOf;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseAllOf))!;
    }
    value = object.baseAnyOf;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseAnyOf))!;
    }
    value = object.baseNestedOneOf3;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseNestedOneOf3))!;
    }
    value = object.baseOneOf;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseOneOf))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    BaseAllOf? baseAllOf;
    try {
      baseAllOf = _jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAllOf))! as BaseAllOf;
    } catch (_) {}
    BaseAnyOf? baseAnyOf;
    try {
      baseAnyOf = ((_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAnyOf))! as BaseAnyOf)
        ..validateAnyOf());
    } catch (_) {}
    BaseNestedOneOf3? baseNestedOneOf3;
    try {
      baseNestedOneOf3 =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(BaseNestedOneOf3))! as BaseNestedOneOf3;
    } catch (_) {}
    BaseOneOf? baseOneOf;
    try {
      baseOneOf = ((_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseOneOf))! as BaseOneOf)
        ..validateOneOf());
    } catch (_) {}
    return (baseAllOf: baseAllOf, baseAnyOf: baseAnyOf, baseNestedOneOf3: baseNestedOneOf3, baseOneOf: baseOneOf);
  }
}

typedef $BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf = ({
  BaseAllOf? baseAllOf,
  BaseAnyOf? baseAnyOf,
  BaseNestedAnyOf3? baseNestedAnyOf3,
  BaseOneOf? baseOneOf
});

extension $BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOfExtension on $BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf {
  List<dynamic> get _values => [baseAllOf, baseAnyOf, baseNestedAnyOf3, baseOneOf];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf> get serializer =>
      const _$BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOfSerializer();
  static $BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf fromJson(final Object? json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOfSerializer
    implements PrimitiveSerializer<$BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf> {
  const _$BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOfSerializer();

  @override
  Iterable<Type> get types => const [$BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf];

  @override
  String get wireName => r'$BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final $BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.baseAllOf;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseAllOf))!;
    }
    value = object.baseAnyOf;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseAnyOf))!;
    }
    value = object.baseNestedAnyOf3;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseNestedAnyOf3))!;
    }
    value = object.baseOneOf;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BaseOneOf))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    BaseAllOf? baseAllOf;
    try {
      baseAllOf = _jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAllOf))! as BaseAllOf;
    } catch (_) {}
    BaseAnyOf? baseAnyOf;
    try {
      baseAnyOf = ((_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseAnyOf))! as BaseAnyOf)
        ..validateAnyOf());
    } catch (_) {}
    BaseNestedAnyOf3? baseNestedAnyOf3;
    try {
      baseNestedAnyOf3 =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(BaseNestedAnyOf3))! as BaseNestedAnyOf3;
    } catch (_) {}
    BaseOneOf? baseOneOf;
    try {
      baseOneOf = ((_jsonSerializers.deserialize(data, specifiedType: const FullType(BaseOneOf))! as BaseOneOf)
        ..validateOneOf());
    } catch (_) {}
    return (baseAllOf: baseAllOf, baseAnyOf: baseAnyOf, baseNestedAnyOf3: baseNestedAnyOf3, baseOneOf: baseOneOf);
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(BaseAllOf), BaseAllOfBuilder.new)
      ..add(BaseAllOf.serializer)
      ..addBuilderFactory(const FullType(BaseOneOf1), BaseOneOf1Builder.new)
      ..add(BaseOneOf1.serializer)
      ..add($BaseOneOf1DoubleExtension.serializer)
      ..addBuilderFactory(const FullType(BaseAnyOf1), BaseAnyOf1Builder.new)
      ..add(BaseAnyOf1.serializer)
      ..add($BaseAnyOf1IntExtension.serializer)
      ..addBuilderFactory(const FullType(BaseNestedAllOf), BaseNestedAllOfBuilder.new)
      ..add(BaseNestedAllOf.serializer)
      ..addBuilderFactory(const FullType(BaseNestedOneOf3), BaseNestedOneOf3Builder.new)
      ..add(BaseNestedOneOf3.serializer)
      ..add($BaseAllOfBaseAnyOfBaseNestedOneOf3BaseOneOfExtension.serializer)
      ..addBuilderFactory(const FullType(BaseNestedAnyOf3), BaseNestedAnyOf3Builder.new)
      ..add(BaseNestedAnyOf3.serializer)
      ..add($BaseAllOfBaseAnyOfBaseNestedAnyOf3BaseOneOfExtension.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
