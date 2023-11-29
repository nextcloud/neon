// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';

part 'any_of.openapi.g.dart';

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
abstract interface class $ObjectAnyOf0Interface {
  @BuiltValueField(wireName: 'attribute1-anyOf')
  String get attribute1AnyOf;
}

abstract class ObjectAnyOf0 implements $ObjectAnyOf0Interface, Built<ObjectAnyOf0, ObjectAnyOf0Builder> {
  factory ObjectAnyOf0([final void Function(ObjectAnyOf0Builder)? b]) = _$ObjectAnyOf0;

  const ObjectAnyOf0._();

  factory ObjectAnyOf0.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectAnyOf0> get serializer => _$objectAnyOf0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ObjectAnyOf1Interface {
  @BuiltValueField(wireName: 'attribute2-anyOf')
  String get attribute2AnyOf;
}

abstract class ObjectAnyOf1 implements $ObjectAnyOf1Interface, Built<ObjectAnyOf1, ObjectAnyOf1Builder> {
  factory ObjectAnyOf1([final void Function(ObjectAnyOf1Builder)? b]) = _$ObjectAnyOf1;

  const ObjectAnyOf1._();

  factory ObjectAnyOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectAnyOf1> get serializer => _$objectAnyOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ObjectAnyOfInterface {
  ObjectAnyOf0? get objectAnyOf0;
  ObjectAnyOf1? get objectAnyOf1;
}

abstract class ObjectAnyOf implements $ObjectAnyOfInterface, Built<ObjectAnyOf, ObjectAnyOfBuilder> {
  factory ObjectAnyOf([final void Function(ObjectAnyOfBuilder)? b]) = _$ObjectAnyOf;

  const ObjectAnyOf._();

  factory ObjectAnyOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<ObjectAnyOf> get serializer => _$ObjectAnyOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final ObjectAnyOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._objectAnyOf0, b._objectAnyOf1].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'objectAnyOf0', 'objectAnyOf1' for ${b._data}");
    }
  }
}

class _$ObjectAnyOfSerializer implements PrimitiveSerializer<ObjectAnyOf> {
  @override
  final Iterable<Type> types = const [ObjectAnyOf, _$ObjectAnyOf];

  @override
  final String wireName = 'ObjectAnyOf';

  @override
  Object serialize(
    final Serializers serializers,
    final ObjectAnyOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ObjectAnyOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ObjectAnyOfBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(ObjectAnyOf0))! as ObjectAnyOf0;
      result.objectAnyOf0.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(ObjectAnyOf1))! as ObjectAnyOf1;
      result.objectAnyOf1.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $MixedAnyOf1Interface {
  @BuiltValueField(wireName: 'attribute-anyOf')
  String get attributeAnyOf;
}

abstract class MixedAnyOf1 implements $MixedAnyOf1Interface, Built<MixedAnyOf1, MixedAnyOf1Builder> {
  factory MixedAnyOf1([final void Function(MixedAnyOf1Builder)? b]) = _$MixedAnyOf1;

  const MixedAnyOf1._();

  factory MixedAnyOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<MixedAnyOf1> get serializer => _$mixedAnyOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MixedAnyOfInterface {
  String? get string;
  MixedAnyOf1? get mixedAnyOf1;
}

abstract class MixedAnyOf implements $MixedAnyOfInterface, Built<MixedAnyOf, MixedAnyOfBuilder> {
  factory MixedAnyOf([final void Function(MixedAnyOfBuilder)? b]) = _$MixedAnyOf;

  const MixedAnyOf._();

  factory MixedAnyOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<MixedAnyOf> get serializer => _$MixedAnyOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final MixedAnyOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._string, b._mixedAnyOf1].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'string', 'mixedAnyOf1' for ${b._data}");
    }
  }
}

class _$MixedAnyOfSerializer implements PrimitiveSerializer<MixedAnyOf> {
  @override
  final Iterable<Type> types = const [MixedAnyOf, _$MixedAnyOf];

  @override
  final String wireName = 'MixedAnyOf';

  @override
  Object serialize(
    final Serializers serializers,
    final MixedAnyOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  MixedAnyOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = MixedAnyOfBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(MixedAnyOf1))! as MixedAnyOf1;
      result.mixedAnyOf1.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OneObjectAnyOf0Interface {
  @BuiltValueField(wireName: 'attribute-anyOf')
  String get attributeAnyOf;
}

abstract class OneObjectAnyOf0 implements $OneObjectAnyOf0Interface, Built<OneObjectAnyOf0, OneObjectAnyOf0Builder> {
  factory OneObjectAnyOf0([final void Function(OneObjectAnyOf0Builder)? b]) = _$OneObjectAnyOf0;

  const OneObjectAnyOf0._();

  factory OneObjectAnyOf0.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<OneObjectAnyOf0> get serializer => _$oneObjectAnyOf0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OneObjectAnyOfInterface {
  OneObjectAnyOf0? get oneObjectAnyOf0;
}

abstract class OneObjectAnyOf implements $OneObjectAnyOfInterface, Built<OneObjectAnyOf, OneObjectAnyOfBuilder> {
  factory OneObjectAnyOf([final void Function(OneObjectAnyOfBuilder)? b]) = _$OneObjectAnyOf;

  const OneObjectAnyOf._();

  factory OneObjectAnyOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneObjectAnyOf> get serializer => _$OneObjectAnyOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneObjectAnyOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._oneObjectAnyOf0].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'oneObjectAnyOf0' for ${b._data}");
    }
  }
}

class _$OneObjectAnyOfSerializer implements PrimitiveSerializer<OneObjectAnyOf> {
  @override
  final Iterable<Type> types = const [OneObjectAnyOf, _$OneObjectAnyOf];

  @override
  final String wireName = 'OneObjectAnyOf';

  @override
  Object serialize(
    final Serializers serializers,
    final OneObjectAnyOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneObjectAnyOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneObjectAnyOfBuilder()..data = JsonObject(data);
    try {
      final value =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(OneObjectAnyOf0))! as OneObjectAnyOf0;
      result.oneObjectAnyOf0.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OneValueAnyOfInterface {
  String? get string;
}

abstract class OneValueAnyOf implements $OneValueAnyOfInterface, Built<OneValueAnyOf, OneValueAnyOfBuilder> {
  factory OneValueAnyOf([final void Function(OneValueAnyOfBuilder)? b]) = _$OneValueAnyOf;

  const OneValueAnyOf._();

  factory OneValueAnyOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneValueAnyOf> get serializer => _$OneValueAnyOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneValueAnyOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._string].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'string' for ${b._data}");
    }
  }
}

class _$OneValueAnyOfSerializer implements PrimitiveSerializer<OneValueAnyOf> {
  @override
  final Iterable<Type> types = const [OneValueAnyOf, _$OneValueAnyOf];

  @override
  final String wireName = 'OneValueAnyOf';

  @override
  Object serialize(
    final Serializers serializers,
    final OneValueAnyOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneValueAnyOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneValueAnyOfBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $AnyOfIntDoubleInterface {
  int? get $int;
  double? get $double;
}

abstract class AnyOfIntDouble implements $AnyOfIntDoubleInterface, Built<AnyOfIntDouble, AnyOfIntDoubleBuilder> {
  factory AnyOfIntDouble([final void Function(AnyOfIntDoubleBuilder)? b]) = _$AnyOfIntDouble;

  const AnyOfIntDouble._();

  factory AnyOfIntDouble.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnyOfIntDouble> get serializer => _$AnyOfIntDoubleSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final AnyOfIntDoubleBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._$double].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of '$int', '$double' for ${b._data}");
    }
  }
}

class _$AnyOfIntDoubleSerializer implements PrimitiveSerializer<AnyOfIntDouble> {
  @override
  final Iterable<Type> types = const [AnyOfIntDouble, _$AnyOfIntDouble];

  @override
  final String wireName = 'AnyOfIntDouble';

  @override
  Object serialize(
    final Serializers serializers,
    final AnyOfIntDouble object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  AnyOfIntDouble deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnyOfIntDoubleBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $AnyOfIntDoubleOtherInterface {
  int? get $int;
  double? get $double;
  String? get string;
}

abstract class AnyOfIntDoubleOther
    implements $AnyOfIntDoubleOtherInterface, Built<AnyOfIntDoubleOther, AnyOfIntDoubleOtherBuilder> {
  factory AnyOfIntDoubleOther([final void Function(AnyOfIntDoubleOtherBuilder)? b]) = _$AnyOfIntDoubleOther;

  const AnyOfIntDoubleOther._();

  factory AnyOfIntDoubleOther.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnyOfIntDoubleOther> get serializer => _$AnyOfIntDoubleOtherSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final AnyOfIntDoubleOtherBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._$double, b._string].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of '$int', '$double', 'string' for ${b._data}");
    }
  }
}

class _$AnyOfIntDoubleOtherSerializer implements PrimitiveSerializer<AnyOfIntDoubleOther> {
  @override
  final Iterable<Type> types = const [AnyOfIntDoubleOther, _$AnyOfIntDoubleOther];

  @override
  final String wireName = 'AnyOfIntDoubleOther';

  @override
  Object serialize(
    final Serializers serializers,
    final AnyOfIntDoubleOther object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  AnyOfIntDoubleOther deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnyOfIntDoubleOtherBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(ObjectAnyOf), ObjectAnyOf.new)
      ..add(ObjectAnyOf.serializer)
      ..addBuilderFactory(const FullType(ObjectAnyOf0), ObjectAnyOf0.new)
      ..add(ObjectAnyOf0.serializer)
      ..addBuilderFactory(const FullType(ObjectAnyOf1), ObjectAnyOf1.new)
      ..add(ObjectAnyOf1.serializer)
      ..addBuilderFactory(const FullType(MixedAnyOf), MixedAnyOf.new)
      ..add(MixedAnyOf.serializer)
      ..addBuilderFactory(const FullType(MixedAnyOf1), MixedAnyOf1.new)
      ..add(MixedAnyOf1.serializer)
      ..addBuilderFactory(const FullType(OneObjectAnyOf), OneObjectAnyOf.new)
      ..add(OneObjectAnyOf.serializer)
      ..addBuilderFactory(const FullType(OneObjectAnyOf0), OneObjectAnyOf0.new)
      ..add(OneObjectAnyOf0.serializer)
      ..addBuilderFactory(const FullType(OneValueAnyOf), OneValueAnyOf.new)
      ..add(OneValueAnyOf.serializer)
      ..addBuilderFactory(const FullType(AnyOfIntDouble), AnyOfIntDouble.new)
      ..add(AnyOfIntDouble.serializer)
      ..addBuilderFactory(const FullType(AnyOfIntDoubleOther), AnyOfIntDoubleOther.new)
      ..add(AnyOfIntDoubleOther.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
