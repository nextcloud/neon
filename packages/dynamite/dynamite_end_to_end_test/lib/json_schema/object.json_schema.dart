// JsonSchema models generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names, public_member_api_docs
// ignore_for_file: unreachable_switch_case, unused_element

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i4;
import 'package:dynamite_runtime/built_value.dart' as _i3;
import 'package:dynamite_runtime/models.dart';
import 'package:dynamite_runtime/utils.dart' as _i1;
import 'package:meta/meta.dart' as _i2;

part 'object.json_schema.g.dart';

@BuiltValue(instantiable: false)
abstract interface class $ObjectJsonSchemaJsonInterface {
  @BuiltValueField(wireName: 'bool')
  bool? get $bool;
  int? get integer;
  @BuiltValueField(wireName: 'double')
  double? get $double;
  @BuiltValueField(wireName: 'num')
  num? get $num;
  String? get string;
  @BuiltValueField(wireName: 'content-string')
  ContentString<int>? get contentString;
  @BuiltValueField(wireName: 'string-binary')
  Uint8List? get stringBinary;
  BuiltList<JsonObject>? get list;
  @BuiltValueField(wireName: 'list-never')
  BuiltList<Never>? get listNever;
  @BuiltValueField(wireName: 'list-string')
  BuiltList<String>? get listString;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ObjectJsonSchemaJsonInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ObjectJsonSchemaJsonInterfaceBuilder b) {
    _i1.checkIterable(
      b.listNever,
      'listNever',
      maxItems: 0,
    );
  }
}

abstract class ObjectJsonSchemaJson
    implements $ObjectJsonSchemaJsonInterface, Built<ObjectJsonSchemaJson, ObjectJsonSchemaJsonBuilder> {
  /// Creates a new ObjectJsonSchemaJson object using the builder pattern.
  factory ObjectJsonSchemaJson([void Function(ObjectJsonSchemaJsonBuilder)? b]) = _$ObjectJsonSchemaJson;

  const ObjectJsonSchemaJson._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory ObjectJsonSchemaJson.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for ObjectJsonSchemaJson.
  static Serializer<ObjectJsonSchemaJson> get serializer => _$objectJsonSchemaJsonSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ObjectJsonSchemaJsonBuilder b) {
    $ObjectJsonSchemaJsonInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ObjectJsonSchemaJsonBuilder b) {
    $ObjectJsonSchemaJsonInterface._validate(b);
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
      ..addBuilderFactory(const FullType(ObjectJsonSchemaJson), ObjectJsonSchemaJsonBuilder.new)
      ..add(ObjectJsonSchemaJson.serializer)
      ..addBuilderFactory(const FullType(ContentString, [FullType(int)]), ContentStringBuilder<int>.new)
      ..add(ContentString.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Never)]), ListBuilder<Never>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
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