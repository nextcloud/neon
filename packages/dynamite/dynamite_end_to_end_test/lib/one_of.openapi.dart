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

part 'one_of.openapi.g.dart';

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
abstract interface class ObjectOneOf0Interface {
  @BuiltValueField(wireName: 'attribute1-oneOf')
  String get attribute1OneOf;
}

abstract class ObjectOneOf0 implements ObjectOneOf0Interface, Built<ObjectOneOf0, ObjectOneOf0Builder> {
  factory ObjectOneOf0([final void Function(ObjectOneOf0Builder)? b]) = _$ObjectOneOf0;

  const ObjectOneOf0._();

  factory ObjectOneOf0.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<ObjectOneOf0> get serializer => const _$ObjectOneOf0Serializer();
}

class _$ObjectOneOf0Serializer implements StructuredSerializer<ObjectOneOf0> {
  const _$ObjectOneOf0Serializer();

  @override
  Iterable<Type> get types => const [ObjectOneOf0, _$ObjectOneOf0];

  @override
  String get wireName => 'ObjectOneOf0';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ObjectOneOf0 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'attribute1-oneOf',
      serializers.serialize(object.attribute1OneOf, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  ObjectOneOf0 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ObjectOneOf0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'attribute1-oneOf':
          result.attribute1OneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ObjectOneOf1Interface {
  @BuiltValueField(wireName: 'attribute2-oneOf')
  String get attribute2OneOf;
}

abstract class ObjectOneOf1 implements ObjectOneOf1Interface, Built<ObjectOneOf1, ObjectOneOf1Builder> {
  factory ObjectOneOf1([final void Function(ObjectOneOf1Builder)? b]) = _$ObjectOneOf1;

  const ObjectOneOf1._();

  factory ObjectOneOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<ObjectOneOf1> get serializer => const _$ObjectOneOf1Serializer();
}

class _$ObjectOneOf1Serializer implements StructuredSerializer<ObjectOneOf1> {
  const _$ObjectOneOf1Serializer();

  @override
  Iterable<Type> get types => const [ObjectOneOf1, _$ObjectOneOf1];

  @override
  String get wireName => 'ObjectOneOf1';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ObjectOneOf1 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'attribute2-oneOf',
      serializers.serialize(object.attribute2OneOf, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  ObjectOneOf1 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ObjectOneOf1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'attribute2-oneOf':
          result.attribute2OneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ObjectOneOfInterface {
  ObjectOneOf0? get objectOneOf0;
  ObjectOneOf1? get objectOneOf1;
}

abstract class ObjectOneOf implements ObjectOneOfInterface, Built<ObjectOneOf, ObjectOneOfBuilder> {
  factory ObjectOneOf([final void Function(ObjectOneOfBuilder)? b]) = _$ObjectOneOf;

  const ObjectOneOf._();

  factory ObjectOneOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<ObjectOneOf> get serializer => _$ObjectOneOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final ObjectOneOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._objectOneOf0, b._objectOneOf1].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'objectOneOf0', 'objectOneOf1' for ${b._data}");
    }
  }
}

class _$ObjectOneOfSerializer implements PrimitiveSerializer<ObjectOneOf> {
  @override
  final Iterable<Type> types = const [ObjectOneOf, _$ObjectOneOf];

  @override
  final String wireName = 'ObjectOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final ObjectOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ObjectOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ObjectOneOfBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(ObjectOneOf0))! as ObjectOneOf0;
      result.objectOneOf0.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(ObjectOneOf1))! as ObjectOneOf1;
      result.objectOneOf1.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class MixedOneOf1Interface {
  @BuiltValueField(wireName: 'attribute-oneOf')
  String get attributeOneOf;
}

abstract class MixedOneOf1 implements MixedOneOf1Interface, Built<MixedOneOf1, MixedOneOf1Builder> {
  factory MixedOneOf1([final void Function(MixedOneOf1Builder)? b]) = _$MixedOneOf1;

  const MixedOneOf1._();

  factory MixedOneOf1.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<MixedOneOf1> get serializer => const _$MixedOneOf1Serializer();
}

class _$MixedOneOf1Serializer implements StructuredSerializer<MixedOneOf1> {
  const _$MixedOneOf1Serializer();

  @override
  Iterable<Type> get types => const [MixedOneOf1, _$MixedOneOf1];

  @override
  String get wireName => 'MixedOneOf1';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final MixedOneOf1 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'attribute-oneOf',
      serializers.serialize(object.attributeOneOf, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  MixedOneOf1 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = MixedOneOf1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'attribute-oneOf':
          result.attributeOneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class MixedOneOfInterface {
  String? get string;
  MixedOneOf1? get mixedOneOf1;
}

abstract class MixedOneOf implements MixedOneOfInterface, Built<MixedOneOf, MixedOneOfBuilder> {
  factory MixedOneOf([final void Function(MixedOneOfBuilder)? b]) = _$MixedOneOf;

  const MixedOneOf._();

  factory MixedOneOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<MixedOneOf> get serializer => _$MixedOneOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final MixedOneOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._string, b._mixedOneOf1].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'string', 'mixedOneOf1' for ${b._data}");
    }
  }
}

class _$MixedOneOfSerializer implements PrimitiveSerializer<MixedOneOf> {
  @override
  final Iterable<Type> types = const [MixedOneOf, _$MixedOneOf];

  @override
  final String wireName = 'MixedOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final MixedOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  MixedOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = MixedOneOfBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(MixedOneOf1))! as MixedOneOf1;
      result.mixedOneOf1.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OneObjectOneOf0Interface {
  @BuiltValueField(wireName: 'attribute-oneOf')
  String get attributeOneOf;
}

abstract class OneObjectOneOf0 implements OneObjectOneOf0Interface, Built<OneObjectOneOf0, OneObjectOneOf0Builder> {
  factory OneObjectOneOf0([final void Function(OneObjectOneOf0Builder)? b]) = _$OneObjectOneOf0;

  const OneObjectOneOf0._();

  factory OneObjectOneOf0.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneObjectOneOf0> get serializer => const _$OneObjectOneOf0Serializer();
}

class _$OneObjectOneOf0Serializer implements StructuredSerializer<OneObjectOneOf0> {
  const _$OneObjectOneOf0Serializer();

  @override
  Iterable<Type> get types => const [OneObjectOneOf0, _$OneObjectOneOf0];

  @override
  String get wireName => 'OneObjectOneOf0';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OneObjectOneOf0 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'attribute-oneOf',
      serializers.serialize(object.attributeOneOf, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  OneObjectOneOf0 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneObjectOneOf0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'attribute-oneOf':
          result.attributeOneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OneObjectOneOfInterface {
  OneObjectOneOf0? get oneObjectOneOf0;
}

abstract class OneObjectOneOf implements OneObjectOneOfInterface, Built<OneObjectOneOf, OneObjectOneOfBuilder> {
  factory OneObjectOneOf([final void Function(OneObjectOneOfBuilder)? b]) = _$OneObjectOneOf;

  const OneObjectOneOf._();

  factory OneObjectOneOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneObjectOneOf> get serializer => _$OneObjectOneOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneObjectOneOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._oneObjectOneOf0].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'oneObjectOneOf0' for ${b._data}");
    }
  }
}

class _$OneObjectOneOfSerializer implements PrimitiveSerializer<OneObjectOneOf> {
  @override
  final Iterable<Type> types = const [OneObjectOneOf, _$OneObjectOneOf];

  @override
  final String wireName = 'OneObjectOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final OneObjectOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneObjectOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneObjectOneOfBuilder()..data = JsonObject(data);
    try {
      final value =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(OneObjectOneOf0))! as OneObjectOneOf0;
      result.oneObjectOneOf0.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OneValueOneOfInterface {
  String? get string;
}

abstract class OneValueOneOf implements OneValueOneOfInterface, Built<OneValueOneOf, OneValueOneOfBuilder> {
  factory OneValueOneOf([final void Function(OneValueOneOfBuilder)? b]) = _$OneValueOneOf;

  const OneValueOneOf._();

  factory OneValueOneOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneValueOneOf> get serializer => _$OneValueOneOfSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneValueOneOfBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._string].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'string' for ${b._data}");
    }
  }
}

class _$OneValueOneOfSerializer implements PrimitiveSerializer<OneValueOneOf> {
  @override
  final Iterable<Type> types = const [OneValueOneOf, _$OneValueOneOf];

  @override
  final String wireName = 'OneValueOneOf';

  @override
  Object serialize(
    final Serializers serializers,
    final OneValueOneOf object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneValueOneOf deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneValueOneOfBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OneOfIntDoubleInterface {
  int? get $int;
  double? get $double;
}

abstract class OneOfIntDouble implements OneOfIntDoubleInterface, Built<OneOfIntDouble, OneOfIntDoubleBuilder> {
  factory OneOfIntDouble([final void Function(OneOfIntDoubleBuilder)? b]) = _$OneOfIntDouble;

  const OneOfIntDouble._();

  factory OneOfIntDouble.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneOfIntDouble> get serializer => _$OneOfIntDoubleSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneOfIntDoubleBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._$double].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', '$double' for ${b._data}");
    }
  }
}

class _$OneOfIntDoubleSerializer implements PrimitiveSerializer<OneOfIntDouble> {
  @override
  final Iterable<Type> types = const [OneOfIntDouble, _$OneOfIntDouble];

  @override
  final String wireName = 'OneOfIntDouble';

  @override
  Object serialize(
    final Serializers serializers,
    final OneOfIntDouble object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneOfIntDouble deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneOfIntDoubleBuilder()..data = JsonObject(data);
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
abstract interface class OneOfIntDoubleOtherInterface {
  int? get $int;
  double? get $double;
  String? get string;
}

abstract class OneOfIntDoubleOther
    implements OneOfIntDoubleOtherInterface, Built<OneOfIntDoubleOther, OneOfIntDoubleOtherBuilder> {
  factory OneOfIntDoubleOther([final void Function(OneOfIntDoubleOtherBuilder)? b]) = _$OneOfIntDoubleOther;

  const OneOfIntDoubleOther._();

  factory OneOfIntDoubleOther.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneOfIntDoubleOther> get serializer => _$OneOfIntDoubleOtherSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneOfIntDoubleOtherBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._$double, b._string].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', '$double', 'string' for ${b._data}");
    }
  }
}

class _$OneOfIntDoubleOtherSerializer implements PrimitiveSerializer<OneOfIntDoubleOther> {
  @override
  final Iterable<Type> types = const [OneOfIntDoubleOther, _$OneOfIntDoubleOther];

  @override
  final String wireName = 'OneOfIntDoubleOther';

  @override
  Object serialize(
    final Serializers serializers,
    final OneOfIntDoubleOther object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneOfIntDoubleOther deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneOfIntDoubleOtherBuilder()..data = JsonObject(data);
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
      ..addBuilderFactory(const FullType(ObjectOneOf), ObjectOneOf.new)
      ..add(ObjectOneOf.serializer)
      ..addBuilderFactory(const FullType(ObjectOneOf0), ObjectOneOf0.new)
      ..add(ObjectOneOf0.serializer)
      ..addBuilderFactory(const FullType(ObjectOneOf1), ObjectOneOf1.new)
      ..add(ObjectOneOf1.serializer)
      ..addBuilderFactory(const FullType(MixedOneOf), MixedOneOf.new)
      ..add(MixedOneOf.serializer)
      ..addBuilderFactory(const FullType(MixedOneOf1), MixedOneOf1.new)
      ..add(MixedOneOf1.serializer)
      ..addBuilderFactory(const FullType(OneObjectOneOf), OneObjectOneOf.new)
      ..add(OneObjectOneOf.serializer)
      ..addBuilderFactory(const FullType(OneObjectOneOf0), OneObjectOneOf0.new)
      ..add(OneObjectOneOf0.serializer)
      ..addBuilderFactory(const FullType(OneValueOneOf), OneValueOneOf.new)
      ..add(OneValueOneOf.serializer)
      ..addBuilderFactory(const FullType(OneOfIntDouble), OneOfIntDouble.new)
      ..add(OneOfIntDouble.serializer)
      ..addBuilderFactory(const FullType(OneOfIntDoubleOther), OneOfIntDoubleOther.new)
      ..add(OneOfIntDoubleOther.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
