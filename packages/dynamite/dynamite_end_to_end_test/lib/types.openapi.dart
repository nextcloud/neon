// ignore_for_file: camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: public_member_api_docs, unreachable_switch_case
// ignore_for_file: unused_element

library types_openapi;

import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:meta/meta.dart';

part 'types.openapi.g.dart';

typedef $Object = dynamic;
typedef $String = dynamic;
typedef $Uri = dynamic;
typedef $Uint8List = dynamic;
typedef $List = dynamic;
typedef $Map = dynamic;

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
  factory Base([void Function(BaseBuilder)? b]) = _$Base;

  const Base._();

  factory Base.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Base> get serializer => _$baseSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Base), BaseBuilder.new)
      ..add(Base.serializer)
      ..addBuilderFactory(const FullType(ContentString, [FullType(int)]), ContentStringBuilder<int>.new)
      ..add(ContentString.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Never)]), ListBuilder<Never>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();
@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
