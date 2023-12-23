// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: public_member_api_docs, unreachable_switch_case
// ignore_for_file: unused_element

library one_of_openapi;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';

part 'one_of.openapi.g.dart';

typedef OneObjectOneOf = OneObjectOneOf0;
typedef OneValueOneOf = String;
typedef OneOfIntDouble = num;
typedef OneOfIntDoubleNum = num;

@BuiltValue(instantiable: false)
abstract interface class $ObjectOneOf0Interface {
  @BuiltValueField(wireName: 'attribute1-oneOf')
  String get attribute1OneOf;
}

abstract class ObjectOneOf0 implements $ObjectOneOf0Interface, Built<ObjectOneOf0, ObjectOneOf0Builder> {
  factory ObjectOneOf0([void Function(ObjectOneOf0Builder)? b]) = _$ObjectOneOf0;

  const ObjectOneOf0._();

  factory ObjectOneOf0.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectOneOf0> get serializer => _$objectOneOf0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ObjectOneOf1Interface {
  @BuiltValueField(wireName: 'attribute2-oneOf')
  String get attribute2OneOf;
}

abstract class ObjectOneOf1 implements $ObjectOneOf1Interface, Built<ObjectOneOf1, ObjectOneOf1Builder> {
  factory ObjectOneOf1([void Function(ObjectOneOf1Builder)? b]) = _$ObjectOneOf1;

  const ObjectOneOf1._();

  factory ObjectOneOf1.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectOneOf1> get serializer => _$objectOneOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MixedOneOf1Interface {
  @BuiltValueField(wireName: 'attribute-oneOf')
  String get attributeOneOf;
}

abstract class MixedOneOf1 implements $MixedOneOf1Interface, Built<MixedOneOf1, MixedOneOf1Builder> {
  factory MixedOneOf1([void Function(MixedOneOf1Builder)? b]) = _$MixedOneOf1;

  const MixedOneOf1._();

  factory MixedOneOf1.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<MixedOneOf1> get serializer => _$mixedOneOf1Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OneObjectOneOf0Interface {
  @BuiltValueField(wireName: 'attribute-oneOf')
  String get attributeOneOf;
}

abstract class OneObjectOneOf0 implements $OneObjectOneOf0Interface, Built<OneObjectOneOf0, OneObjectOneOf0Builder> {
  factory OneObjectOneOf0([void Function(OneObjectOneOf0Builder)? b]) = _$OneObjectOneOf0;

  const OneObjectOneOf0._();

  factory OneObjectOneOf0.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<OneObjectOneOf0> get serializer => _$oneObjectOneOf0Serializer;
}

typedef ObjectOneOf = ({ObjectOneOf0? objectOneOf0, ObjectOneOf1? objectOneOf1});

extension $ObjectOneOfExtension on ObjectOneOf {
  static Serializer<ObjectOneOf> get serializer => $6c828020e1dac1d58ded0a29ef8b0c41Extension._serializer;
  static ObjectOneOf fromJson(Object? json) => $6c828020e1dac1d58ded0a29ef8b0c41Extension._fromJson(json);
}

typedef MixedOneOf = ({MixedOneOf1? mixedOneOf1, String? string});

extension $MixedOneOfExtension on MixedOneOf {
  static Serializer<MixedOneOf> get serializer => $d1b40dfcebdca2dfa1f3e52ac98462a5Extension._serializer;
  static MixedOneOf fromJson(Object? json) => $d1b40dfcebdca2dfa1f3e52ac98462a5Extension._fromJson(json);
}

typedef OneOfIntDoubleOther = ({num? $num, String? string});

extension $OneOfIntDoubleOtherExtension on OneOfIntDoubleOther {
  static Serializer<OneOfIntDoubleOther> get serializer => $b6d67dc2a96424d2f407f8e51557f3deExtension._serializer;
  static OneOfIntDoubleOther fromJson(Object? json) => $b6d67dc2a96424d2f407f8e51557f3deExtension._fromJson(json);
}

typedef _$6c828020e1dac1d58ded0a29ef8b0c41 = ({ObjectOneOf0? objectOneOf0, ObjectOneOf1? objectOneOf1});

/// @nodoc
// ignore: library_private_types_in_public_api
extension $6c828020e1dac1d58ded0a29ef8b0c41Extension on _$6c828020e1dac1d58ded0a29ef8b0c41 {
  List<dynamic> get _values => [objectOneOf0, objectOneOf1];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<_$6c828020e1dac1d58ded0a29ef8b0c41> get _serializer =>
      const _$6c828020e1dac1d58ded0a29ef8b0c41Serializer();
  static _$6c828020e1dac1d58ded0a29ef8b0c41 _fromJson(Object? json) =>
      jsonSerializers.deserializeWith(_serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(_serializer, this);
}

class _$6c828020e1dac1d58ded0a29ef8b0c41Serializer implements PrimitiveSerializer<_$6c828020e1dac1d58ded0a29ef8b0c41> {
  const _$6c828020e1dac1d58ded0a29ef8b0c41Serializer();

  @override
  Iterable<Type> get types => const [_$6c828020e1dac1d58ded0a29ef8b0c41];

  @override
  String get wireName => r'_$6c828020e1dac1d58ded0a29ef8b0c41';

  @override
  Object serialize(
    Serializers serializers,
    _$6c828020e1dac1d58ded0a29ef8b0c41 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.objectOneOf0;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ObjectOneOf0))!;
    }
    value = object.objectOneOf1;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ObjectOneOf1))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  _$6c828020e1dac1d58ded0a29ef8b0c41 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    ObjectOneOf0? objectOneOf0;
    try {
      objectOneOf0 = serializers.deserialize(data, specifiedType: const FullType(ObjectOneOf0))! as ObjectOneOf0;
    } catch (_) {}
    ObjectOneOf1? objectOneOf1;
    try {
      objectOneOf1 = serializers.deserialize(data, specifiedType: const FullType(ObjectOneOf1))! as ObjectOneOf1;
    } catch (_) {}
    return (objectOneOf0: objectOneOf0, objectOneOf1: objectOneOf1);
  }
}

typedef _$d1b40dfcebdca2dfa1f3e52ac98462a5 = ({MixedOneOf1? mixedOneOf1, String? string});

/// @nodoc
// ignore: library_private_types_in_public_api
extension $d1b40dfcebdca2dfa1f3e52ac98462a5Extension on _$d1b40dfcebdca2dfa1f3e52ac98462a5 {
  List<dynamic> get _values => [mixedOneOf1, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<_$d1b40dfcebdca2dfa1f3e52ac98462a5> get _serializer =>
      const _$d1b40dfcebdca2dfa1f3e52ac98462a5Serializer();
  static _$d1b40dfcebdca2dfa1f3e52ac98462a5 _fromJson(Object? json) =>
      jsonSerializers.deserializeWith(_serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(_serializer, this);
}

class _$d1b40dfcebdca2dfa1f3e52ac98462a5Serializer implements PrimitiveSerializer<_$d1b40dfcebdca2dfa1f3e52ac98462a5> {
  const _$d1b40dfcebdca2dfa1f3e52ac98462a5Serializer();

  @override
  Iterable<Type> get types => const [_$d1b40dfcebdca2dfa1f3e52ac98462a5];

  @override
  String get wireName => r'_$d1b40dfcebdca2dfa1f3e52ac98462a5';

  @override
  Object serialize(
    Serializers serializers,
    _$d1b40dfcebdca2dfa1f3e52ac98462a5 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.mixedOneOf1;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(MixedOneOf1))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  _$d1b40dfcebdca2dfa1f3e52ac98462a5 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    MixedOneOf1? mixedOneOf1;
    try {
      mixedOneOf1 = serializers.deserialize(data, specifiedType: const FullType(MixedOneOf1))! as MixedOneOf1;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return (mixedOneOf1: mixedOneOf1, string: string);
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
      ..addBuilderFactory(const FullType(ObjectOneOf0), ObjectOneOf0Builder.new)
      ..add(ObjectOneOf0.serializer)
      ..addBuilderFactory(const FullType(ObjectOneOf1), ObjectOneOf1Builder.new)
      ..add(ObjectOneOf1.serializer)
      ..add($6c828020e1dac1d58ded0a29ef8b0c41Extension._serializer)
      ..addBuilderFactory(const FullType(MixedOneOf1), MixedOneOf1Builder.new)
      ..add(MixedOneOf1.serializer)
      ..add($d1b40dfcebdca2dfa1f3e52ac98462a5Extension._serializer)
      ..addBuilderFactory(const FullType(OneObjectOneOf0), OneObjectOneOf0Builder.new)
      ..add(OneObjectOneOf0.serializer)
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
