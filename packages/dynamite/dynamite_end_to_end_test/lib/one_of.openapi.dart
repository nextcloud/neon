// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: unused_element

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';

part 'one_of.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
  });

  Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );
}

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

typedef MixedOneOf = ({MixedOneOf1? mixedOneOf1, String? string});

typedef OneOfIntDoubleOther = ({num? $num, String? string});

typedef $ObjectOneOf0ObjectOneOf1 = ({ObjectOneOf0? objectOneOf0, ObjectOneOf1? objectOneOf1});

extension $ObjectOneOf0ObjectOneOf1Extension on $ObjectOneOf0ObjectOneOf1 {
  List<dynamic> get _values => [objectOneOf0, objectOneOf1];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$ObjectOneOf0ObjectOneOf1> get serializer => const _$ObjectOneOf0ObjectOneOf1Serializer();
  static $ObjectOneOf0ObjectOneOf1 fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$ObjectOneOf0ObjectOneOf1Serializer implements PrimitiveSerializer<$ObjectOneOf0ObjectOneOf1> {
  const _$ObjectOneOf0ObjectOneOf1Serializer();

  @override
  Iterable<Type> get types => const [$ObjectOneOf0ObjectOneOf1];

  @override
  String get wireName => r'$ObjectOneOf0ObjectOneOf1';

  @override
  Object serialize(
    Serializers serializers,
    $ObjectOneOf0ObjectOneOf1 object, {
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
  $ObjectOneOf0ObjectOneOf1 deserialize(
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

typedef $MixedOneOf1String = ({MixedOneOf1? mixedOneOf1, String? string});

extension $MixedOneOf1StringExtension on $MixedOneOf1String {
  List<dynamic> get _values => [mixedOneOf1, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$MixedOneOf1String> get serializer => const _$MixedOneOf1StringSerializer();
  static $MixedOneOf1String fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$MixedOneOf1StringSerializer implements PrimitiveSerializer<$MixedOneOf1String> {
  const _$MixedOneOf1StringSerializer();

  @override
  Iterable<Type> get types => const [$MixedOneOf1String];

  @override
  String get wireName => r'$MixedOneOf1String';

  @override
  Object serialize(
    Serializers serializers,
    $MixedOneOf1String object, {
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
  $MixedOneOf1String deserialize(
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
      ..addBuilderFactory(const FullType(ObjectOneOf0), ObjectOneOf0Builder.new)
      ..add(ObjectOneOf0.serializer)
      ..addBuilderFactory(const FullType(ObjectOneOf1), ObjectOneOf1Builder.new)
      ..add(ObjectOneOf1.serializer)
      ..add($ObjectOneOf0ObjectOneOf1Extension.serializer)
      ..addBuilderFactory(const FullType(MixedOneOf1), MixedOneOf1Builder.new)
      ..add(MixedOneOf1.serializer)
      ..add($MixedOneOf1StringExtension.serializer)
      ..addBuilderFactory(const FullType(OneObjectOneOf0), OneObjectOneOf0Builder.new)
      ..add(OneObjectOneOf0.serializer)
      ..add($NumStringExtension.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
