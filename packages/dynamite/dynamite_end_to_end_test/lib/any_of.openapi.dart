// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: unused_element
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';

part 'any_of.openapi.g.dart';

typedef OneObjectAnyOf = OneObjectAnyOf0;

typedef OneValueAnyOf = String;

typedef AnyOfIntDouble = num;

typedef AnyOfIntDoubleNum = num;

@BuiltValue(instantiable: false)
abstract interface class $ObjectAnyOf0Interface {
  @BuiltValueField(wireName: 'attribute1-anyOf')
  String get attribute1AnyOf;
}

abstract class ObjectAnyOf0 implements $ObjectAnyOf0Interface, Built<ObjectAnyOf0, ObjectAnyOf0Builder> {
  factory ObjectAnyOf0([void Function(ObjectAnyOf0Builder)? b]) = _$ObjectAnyOf0;

  const ObjectAnyOf0._();

  factory ObjectAnyOf0.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectAnyOf0> get serializer => _$objectAnyOf0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ObjectAnyOf1Interface {
  @BuiltValueField(wireName: 'attribute2-anyOf')
  String get attribute2AnyOf;
}

abstract class ObjectAnyOf1 implements $ObjectAnyOf1Interface, Built<ObjectAnyOf1, ObjectAnyOf1Builder> {
  factory ObjectAnyOf1([void Function(ObjectAnyOf1Builder)? b]) = _$ObjectAnyOf1;

  const ObjectAnyOf1._();

  factory ObjectAnyOf1.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectAnyOf1> get serializer => _$objectAnyOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MixedAnyOf1Interface {
  @BuiltValueField(wireName: 'attribute-anyOf')
  String get attributeAnyOf;
}

abstract class MixedAnyOf1 implements $MixedAnyOf1Interface, Built<MixedAnyOf1, MixedAnyOf1Builder> {
  factory MixedAnyOf1([void Function(MixedAnyOf1Builder)? b]) = _$MixedAnyOf1;

  const MixedAnyOf1._();

  factory MixedAnyOf1.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<MixedAnyOf1> get serializer => _$mixedAnyOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OneObjectAnyOf0Interface {
  @BuiltValueField(wireName: 'attribute-anyOf')
  String get attributeAnyOf;
}

abstract class OneObjectAnyOf0 implements $OneObjectAnyOf0Interface, Built<OneObjectAnyOf0, OneObjectAnyOf0Builder> {
  factory OneObjectAnyOf0([void Function(OneObjectAnyOf0Builder)? b]) = _$OneObjectAnyOf0;

  const OneObjectAnyOf0._();

  factory OneObjectAnyOf0.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<OneObjectAnyOf0> get serializer => _$oneObjectAnyOf0Serializer;
}

typedef ObjectAnyOf = ({ObjectAnyOf0? objectAnyOf0, ObjectAnyOf1? objectAnyOf1});

typedef MixedAnyOf = ({MixedAnyOf1? mixedAnyOf1, String? string});

typedef AnyOfIntDoubleOther = ({num? $num, String? string});

typedef $ObjectAnyOf0ObjectAnyOf1 = ({ObjectAnyOf0? objectAnyOf0, ObjectAnyOf1? objectAnyOf1});

extension $ObjectAnyOf0ObjectAnyOf1Extension on $ObjectAnyOf0ObjectAnyOf1 {
  List<dynamic> get _values => [objectAnyOf0, objectAnyOf1];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$ObjectAnyOf0ObjectAnyOf1> get serializer => const _$ObjectAnyOf0ObjectAnyOf1Serializer();
  static $ObjectAnyOf0ObjectAnyOf1 fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$ObjectAnyOf0ObjectAnyOf1Serializer implements PrimitiveSerializer<$ObjectAnyOf0ObjectAnyOf1> {
  const _$ObjectAnyOf0ObjectAnyOf1Serializer();

  @override
  Iterable<Type> get types => const [$ObjectAnyOf0ObjectAnyOf1];

  @override
  String get wireName => r'$ObjectAnyOf0ObjectAnyOf1';

  @override
  Object serialize(
    Serializers serializers,
    $ObjectAnyOf0ObjectAnyOf1 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.objectAnyOf0;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ObjectAnyOf0))!;
    }
    value = object.objectAnyOf1;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ObjectAnyOf1))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $ObjectAnyOf0ObjectAnyOf1 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    ObjectAnyOf0? objectAnyOf0;
    try {
      objectAnyOf0 = serializers.deserialize(data, specifiedType: const FullType(ObjectAnyOf0))! as ObjectAnyOf0;
    } catch (_) {}
    ObjectAnyOf1? objectAnyOf1;
    try {
      objectAnyOf1 = serializers.deserialize(data, specifiedType: const FullType(ObjectAnyOf1))! as ObjectAnyOf1;
    } catch (_) {}
    return (objectAnyOf0: objectAnyOf0, objectAnyOf1: objectAnyOf1);
  }
}

typedef $MixedAnyOf1String = ({MixedAnyOf1? mixedAnyOf1, String? string});

extension $MixedAnyOf1StringExtension on $MixedAnyOf1String {
  List<dynamic> get _values => [mixedAnyOf1, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$MixedAnyOf1String> get serializer => const _$MixedAnyOf1StringSerializer();
  static $MixedAnyOf1String fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$MixedAnyOf1StringSerializer implements PrimitiveSerializer<$MixedAnyOf1String> {
  const _$MixedAnyOf1StringSerializer();

  @override
  Iterable<Type> get types => const [$MixedAnyOf1String];

  @override
  String get wireName => r'$MixedAnyOf1String';

  @override
  Object serialize(
    Serializers serializers,
    $MixedAnyOf1String object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.mixedAnyOf1;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(MixedAnyOf1))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $MixedAnyOf1String deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    MixedAnyOf1? mixedAnyOf1;
    try {
      mixedAnyOf1 = serializers.deserialize(data, specifiedType: const FullType(MixedAnyOf1))! as MixedAnyOf1;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return (mixedAnyOf1: mixedAnyOf1, string: string);
  }
}

typedef $NumString = ({num? $num, String? string});

extension $NumStringExtension on $NumString {
  List<dynamic> get _values => [$num, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$NumString> get serializer => const _$NumStringSerializer();
  static $NumString fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$NumStringSerializer implements PrimitiveSerializer<$NumString> {
  const _$NumStringSerializer();

  @override
  Iterable<Type> get types => const [$NumString];

  @override
  String get wireName => r'$NumString';

  @override
  Object serialize(
    Serializers serializers,
    $NumString object, {
    FullType specifiedType = FullType.unspecified,
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
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
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
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(ObjectAnyOf0), ObjectAnyOf0Builder.new)
      ..add(ObjectAnyOf0.serializer)
      ..addBuilderFactory(const FullType(ObjectAnyOf1), ObjectAnyOf1Builder.new)
      ..add(ObjectAnyOf1.serializer)
      ..add($ObjectAnyOf0ObjectAnyOf1Extension.serializer)
      ..addBuilderFactory(const FullType(MixedAnyOf1), MixedAnyOf1Builder.new)
      ..add(MixedAnyOf1.serializer)
      ..add($MixedAnyOf1StringExtension.serializer)
      ..addBuilderFactory(const FullType(OneObjectAnyOf0), OneObjectAnyOf0Builder.new)
      ..add(OneObjectAnyOf0.serializer)
      ..add($NumStringExtension.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
