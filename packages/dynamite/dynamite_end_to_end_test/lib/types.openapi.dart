// OpenAPI client generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names, public_member_api_docs
// ignore_for_file: unreachable_switch_case, unused_element

/// Test type resolving Version: 0.0.1.
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i3;
import 'package:dynamite_runtime/built_value.dart' as _i2;
import 'package:dynamite_runtime/models.dart';
import 'package:meta/meta.dart' as _i1;

part 'types.openapi.g.dart';

typedef $Object = dynamic;
typedef $String = dynamic;
typedef $Uri = dynamic;
typedef $Uint8List = dynamic;
typedef $List = dynamic;
typedef $Map = dynamic;
typedef $RegExp = dynamic;

@BuiltValue(instantiable: false)
abstract interface class $BaseInterface {
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
}

abstract class Base implements $BaseInterface, Built<Base, BaseBuilder> {
  /// Creates a new Base object using the builder pattern.
  factory Base([void Function(BaseBuilder)? b]) = _$Base;

  const Base._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory Base.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;

  /// Serializer for Base.
  static Serializer<Base> get serializer => _$baseSerializer;
}

// coverage:ignore-start
/// Serializer for all values in this library.
///
/// Serializes values into the `built_value` wire format.
/// See: [$jsonSerializers] for serializing into json.
@_i1.visibleForTesting
final Serializers $serializers = _$serializers;
final Serializers _$serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Base), BaseBuilder.new)
      ..add(Base.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(int)]),
        ContentStringBuilder<int>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(JsonObject)]),
        ListBuilder<JsonObject>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Never)]),
        ListBuilder<Never>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        ListBuilder<String>.new,
      ))
    .build();

/// Serializer for all values in this library.
///
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.
@_i1.visibleForTesting
final Serializers $jsonSerializers = _$jsonSerializers;
final Serializers _$jsonSerializers = (_$serializers.toBuilder()
      ..add(_i2.DynamiteDoubleSerializer())
      ..addPlugin(_i3.StandardJsonPlugin())
      ..addPlugin(const _i2.HeaderPlugin())
      ..addPlugin(const _i2.ContentStringPlugin()))
    .build();
// coverage:ignore-end
