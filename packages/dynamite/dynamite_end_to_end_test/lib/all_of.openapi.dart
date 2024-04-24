// OpenAPI client generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names, public_member_api_docs
// ignore_for_file: unreachable_switch_case, unused_element

/// all of test Version: 0.0.1.
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i4;
import 'package:dynamite_runtime/built_value.dart' as _i3;
import 'package:dynamite_runtime/utils.dart' as _i1;
import 'package:meta/meta.dart' as _i2;

part 'all_of.openapi.g.dart';

/// All of with objects only.
@BuiltValue(instantiable: false)
abstract interface class $ObjectAllOfInterface {
  @BuiltValueField(wireName: 'attribute1-allOf')
  String get attribute1AllOf;
  @BuiltValueField(wireName: 'attribute2-allOf')
  String get attribute2AllOf;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ObjectAllOfInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ObjectAllOfInterfaceBuilder b) {}
}

/// All of with objects only.
abstract class ObjectAllOf implements $ObjectAllOfInterface, Built<ObjectAllOf, ObjectAllOfBuilder> {
  /// Creates a new ObjectAllOf object using the builder pattern.
  factory ObjectAllOf([void Function(ObjectAllOfBuilder)? b]) = _$ObjectAllOf;

  const ObjectAllOf._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory ObjectAllOf.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for ObjectAllOf.
  static Serializer<ObjectAllOf> get serializer => _$objectAllOfSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ObjectAllOfBuilder b) {
    $ObjectAllOfInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ObjectAllOfBuilder b) {
    $ObjectAllOfInterface._validate(b);
  }
}

/// All of with one object value.
@BuiltValue(instantiable: false)
abstract interface class $OneObjectAllOfInterface {
  @BuiltValueField(wireName: 'attribute-allOf')
  String get attributeAllOf;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($OneObjectAllOfInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($OneObjectAllOfInterfaceBuilder b) {}
}

/// All of with one object value.
abstract class OneObjectAllOf implements $OneObjectAllOfInterface, Built<OneObjectAllOf, OneObjectAllOfBuilder> {
  /// Creates a new OneObjectAllOf object using the builder pattern.
  factory OneObjectAllOf([void Function(OneObjectAllOfBuilder)? b]) = _$OneObjectAllOf;

  const OneObjectAllOf._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory OneObjectAllOf.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for OneObjectAllOf.
  static Serializer<OneObjectAllOf> get serializer => _$oneObjectAllOfSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OneObjectAllOfBuilder b) {
    $OneObjectAllOfInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OneObjectAllOfBuilder b) {
    $OneObjectAllOfInterface._validate(b);
  }
}

/// All of with an primitive values.
@BuiltValue(instantiable: false)
abstract interface class $PrimitiveAllOfInterface {
  @BuiltValueField(wireName: 'int')
  int get $int;
  @BuiltValueField(wireName: 'String')
  String get string;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($PrimitiveAllOfInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($PrimitiveAllOfInterfaceBuilder b) {}
}

/// All of with an primitive values.
abstract class PrimitiveAllOf implements $PrimitiveAllOfInterface, Built<PrimitiveAllOf, PrimitiveAllOfBuilder> {
  /// Creates a new PrimitiveAllOf object using the builder pattern.
  factory PrimitiveAllOf([void Function(PrimitiveAllOfBuilder)? b]) = _$PrimitiveAllOf;

  const PrimitiveAllOf._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory PrimitiveAllOf.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for PrimitiveAllOf.
  static Serializer<PrimitiveAllOf> get serializer => _$primitiveAllOfSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrimitiveAllOfBuilder b) {
    $PrimitiveAllOfInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(PrimitiveAllOfBuilder b) {
    $PrimitiveAllOfInterface._validate(b);
  }
}

/// All of with object and primitive value.
@BuiltValue(instantiable: false)
abstract interface class $MixedAllOfInterface {
  @BuiltValueField(wireName: 'String')
  String get string;
  @BuiltValueField(wireName: 'attribute-allOf')
  String get attributeAllOf;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($MixedAllOfInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($MixedAllOfInterfaceBuilder b) {}
}

/// All of with object and primitive value.
abstract class MixedAllOf implements $MixedAllOfInterface, Built<MixedAllOf, MixedAllOfBuilder> {
  /// Creates a new MixedAllOf object using the builder pattern.
  factory MixedAllOf([void Function(MixedAllOfBuilder)? b]) = _$MixedAllOf;

  const MixedAllOf._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory MixedAllOf.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for MixedAllOf.
  static Serializer<MixedAllOf> get serializer => _$mixedAllOfSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MixedAllOfBuilder b) {
    $MixedAllOfInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(MixedAllOfBuilder b) {
    $MixedAllOfInterface._validate(b);
  }
}

/// All of with one primitive value.
@BuiltValue(instantiable: false)
abstract interface class $OneValueAllOfInterface {
  @BuiltValueField(wireName: 'String')
  String get string;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($OneValueAllOfInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($OneValueAllOfInterfaceBuilder b) {}
}

/// All of with one primitive value.
abstract class OneValueAllOf implements $OneValueAllOfInterface, Built<OneValueAllOf, OneValueAllOfBuilder> {
  /// Creates a new OneValueAllOf object using the builder pattern.
  factory OneValueAllOf([void Function(OneValueAllOfBuilder)? b]) = _$OneValueAllOf;

  const OneValueAllOf._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory OneValueAllOf.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for OneValueAllOf.
  static Serializer<OneValueAllOf> get serializer => _$oneValueAllOfSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OneValueAllOfBuilder b) {
    $OneValueAllOfInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OneValueAllOfBuilder b) {
    $OneValueAllOfInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $SuperObjectInterface {
  /// Defaults to `123`.
  String get value;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SuperObjectInterfaceBuilder b) {
    b.value = '123';
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($SuperObjectInterfaceBuilder b) {
    _i1.checkString(
      b.value,
      'value',
      pattern: RegExp(r'^[0-9]*$'),
      minLength: 3,
      maxLength: 20,
    );
  }
}

abstract class SuperObject implements $SuperObjectInterface, Built<SuperObject, SuperObjectBuilder> {
  /// Creates a new SuperObject object using the builder pattern.
  factory SuperObject([void Function(SuperObjectBuilder)? b]) = _$SuperObject;

  const SuperObject._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory SuperObject.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for SuperObject.
  static Serializer<SuperObject> get serializer => _$superObjectSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SuperObjectBuilder b) {
    $SuperObjectInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(SuperObjectBuilder b) {
    $SuperObjectInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $SubObjectInterface implements $SuperObjectInterface {
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SubObjectInterfaceBuilder b) {
    $SuperObjectInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($SubObjectInterfaceBuilder b) {
    $SuperObjectInterface._validate(b);
  }
}

abstract class SubObject implements $SubObjectInterface, Built<SubObject, SubObjectBuilder> {
  /// Creates a new SubObject object using the builder pattern.
  factory SubObject([void Function(SubObjectBuilder)? b]) = _$SubObject;

  const SubObject._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory SubObject.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for SubObject.
  static Serializer<SubObject> get serializer => _$subObjectSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubObjectBuilder b) {
    $SubObjectInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(SubObjectBuilder b) {
    $SubObjectInterface._validate(b);
  }
}

// coverage:ignore-start
/// Serializer for all values in this library.
///
/// Serializes values into the `built_value` wire format.
/// See: [$jsonSerializers] for serializing into json.
@_i2.visibleForTesting
final Serializers $serializers = _$serializers;
final Serializers _$serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(ObjectAllOf), ObjectAllOfBuilder.new)
      ..add(ObjectAllOf.serializer)
      ..addBuilderFactory(const FullType(OneObjectAllOf), OneObjectAllOfBuilder.new)
      ..add(OneObjectAllOf.serializer)
      ..addBuilderFactory(const FullType(PrimitiveAllOf), PrimitiveAllOfBuilder.new)
      ..add(PrimitiveAllOf.serializer)
      ..addBuilderFactory(const FullType(MixedAllOf), MixedAllOfBuilder.new)
      ..add(MixedAllOf.serializer)
      ..addBuilderFactory(const FullType(OneValueAllOf), OneValueAllOfBuilder.new)
      ..add(OneValueAllOf.serializer)
      ..addBuilderFactory(const FullType(SuperObject), SuperObjectBuilder.new)
      ..add(SuperObject.serializer)
      ..addBuilderFactory(const FullType(SubObject), SubObjectBuilder.new)
      ..add(SubObject.serializer))
    .build();

/// Serializer for all values in this library.
///
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.
@_i2.visibleForTesting
final Serializers $jsonSerializers = _$jsonSerializers;
final Serializers _$jsonSerializers = (_$serializers.toBuilder()
      ..add(_i3.DynamiteDoubleSerializer())
      ..addPlugin(_i4.StandardJsonPlugin())
      ..addPlugin(const _i3.HeaderPlugin())
      ..addPlugin(const _i3.ContentStringPlugin()))
    .build();
// coverage:ignore-end
