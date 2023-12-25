// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: public_member_api_docs, unreachable_switch_case
// ignore_for_file: unused_element

library any_of_openapi;

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

extension $ObjectAnyOfExtension on ObjectAnyOf {
  static Serializer<ObjectAnyOf> get serializer => $0c9017d9a03ba2eb2f15acadeab85bbeExtension._serializer;
  static ObjectAnyOf fromJson(Object? json) => $0c9017d9a03ba2eb2f15acadeab85bbeExtension._fromJson(json);
}

typedef MixedAnyOf = ({MixedAnyOf1? mixedAnyOf1, String? string});

extension $MixedAnyOfExtension on MixedAnyOf {
  static Serializer<MixedAnyOf> get serializer => $fba45e085ee99d64c5141852d4323e3dExtension._serializer;
  static MixedAnyOf fromJson(Object? json) => $fba45e085ee99d64c5141852d4323e3dExtension._fromJson(json);
}

typedef AnyOfIntDoubleOther = ({num? $num, String? string});

extension $AnyOfIntDoubleOtherExtension on AnyOfIntDoubleOther {
  static Serializer<AnyOfIntDoubleOther> get serializer => $b6d67dc2a96424d2f407f8e51557f3deExtension._serializer;
  static AnyOfIntDoubleOther fromJson(Object? json) => $b6d67dc2a96424d2f407f8e51557f3deExtension._fromJson(json);
}

typedef _$0c9017d9a03ba2eb2f15acadeab85bbe = ({ObjectAnyOf0? objectAnyOf0, ObjectAnyOf1? objectAnyOf1});

/// @nodoc
// ignore: library_private_types_in_public_api
extension $0c9017d9a03ba2eb2f15acadeab85bbeExtension on _$0c9017d9a03ba2eb2f15acadeab85bbe {
  List<dynamic> get _values => [objectAnyOf0, objectAnyOf1];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<_$0c9017d9a03ba2eb2f15acadeab85bbe> get _serializer =>
      const _$0c9017d9a03ba2eb2f15acadeab85bbeSerializer();
  static _$0c9017d9a03ba2eb2f15acadeab85bbe _fromJson(Object? json) =>
      jsonSerializers.deserializeWith(_serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(_serializer, this);
}

class _$0c9017d9a03ba2eb2f15acadeab85bbeSerializer implements PrimitiveSerializer<_$0c9017d9a03ba2eb2f15acadeab85bbe> {
  const _$0c9017d9a03ba2eb2f15acadeab85bbeSerializer();

  @override
  Iterable<Type> get types => const [_$0c9017d9a03ba2eb2f15acadeab85bbe];

  @override
  String get wireName => r'_$0c9017d9a03ba2eb2f15acadeab85bbe';

  @override
  Object serialize(
    Serializers serializers,
    _$0c9017d9a03ba2eb2f15acadeab85bbe object, {
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
  _$0c9017d9a03ba2eb2f15acadeab85bbe deserialize(
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

typedef _$fba45e085ee99d64c5141852d4323e3d = ({MixedAnyOf1? mixedAnyOf1, String? string});

/// @nodoc
// ignore: library_private_types_in_public_api
extension $fba45e085ee99d64c5141852d4323e3dExtension on _$fba45e085ee99d64c5141852d4323e3d {
  List<dynamic> get _values => [mixedAnyOf1, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<_$fba45e085ee99d64c5141852d4323e3d> get _serializer =>
      const _$fba45e085ee99d64c5141852d4323e3dSerializer();
  static _$fba45e085ee99d64c5141852d4323e3d _fromJson(Object? json) =>
      jsonSerializers.deserializeWith(_serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(_serializer, this);
}

class _$fba45e085ee99d64c5141852d4323e3dSerializer implements PrimitiveSerializer<_$fba45e085ee99d64c5141852d4323e3d> {
  const _$fba45e085ee99d64c5141852d4323e3dSerializer();

  @override
  Iterable<Type> get types => const [_$fba45e085ee99d64c5141852d4323e3d];

  @override
  String get wireName => r'_$fba45e085ee99d64c5141852d4323e3d';

  @override
  Object serialize(
    Serializers serializers,
    _$fba45e085ee99d64c5141852d4323e3d object, {
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
  _$fba45e085ee99d64c5141852d4323e3d deserialize(
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

typedef _$b6d67dc2a96424d2f407f8e51557f3de = ({num? $num, String? string});

/// @nodoc
// ignore: library_private_types_in_public_api
extension $b6d67dc2a96424d2f407f8e51557f3deExtension on _$b6d67dc2a96424d2f407f8e51557f3de {
  List<dynamic> get _values => [$num, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<_$b6d67dc2a96424d2f407f8e51557f3de> get _serializer =>
      const _$b6d67dc2a96424d2f407f8e51557f3deSerializer();
  static _$b6d67dc2a96424d2f407f8e51557f3de _fromJson(Object? json) =>
      jsonSerializers.deserializeWith(_serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(_serializer, this);
}

class _$b6d67dc2a96424d2f407f8e51557f3deSerializer implements PrimitiveSerializer<_$b6d67dc2a96424d2f407f8e51557f3de> {
  const _$b6d67dc2a96424d2f407f8e51557f3deSerializer();

  @override
  Iterable<Type> get types => const [_$b6d67dc2a96424d2f407f8e51557f3de];

  @override
  String get wireName => r'_$b6d67dc2a96424d2f407f8e51557f3de';

  @override
  Object serialize(
    Serializers serializers,
    _$b6d67dc2a96424d2f407f8e51557f3de object, {
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
  _$b6d67dc2a96424d2f407f8e51557f3de deserialize(
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
      ..add($0c9017d9a03ba2eb2f15acadeab85bbeExtension._serializer)
      ..addBuilderFactory(const FullType(MixedAnyOf1), MixedAnyOf1Builder.new)
      ..add(MixedAnyOf1.serializer)
      ..add($fba45e085ee99d64c5141852d4323e3dExtension._serializer)
      ..addBuilderFactory(const FullType(OneObjectAnyOf0), OneObjectAnyOf0Builder.new)
      ..add(OneObjectAnyOf0.serializer)
      ..add($b6d67dc2a96424d2f407f8e51557f3deExtension._serializer))
    .build();
@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
