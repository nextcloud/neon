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
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';

part 'all_of.openapi.g.dart';

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

@BuiltValue(instantiable: false)
abstract interface class $ObjectAllOf_0Interface {
  @BuiltValueField(wireName: 'attribute1-allOf')
  String get attribute1AllOf;
}

@BuiltValue(instantiable: false)
abstract interface class $ObjectAllOf_1Interface {
  @BuiltValueField(wireName: 'attribute2-allOf')
  String get attribute2AllOf;
}

@BuiltValue(instantiable: false)
abstract interface class $ObjectAllOfInterface implements $ObjectAllOf_0Interface, $ObjectAllOf_1Interface {}

abstract class ObjectAllOf implements $ObjectAllOfInterface, Built<ObjectAllOf, ObjectAllOfBuilder> {
  factory ObjectAllOf([void Function(ObjectAllOfBuilder)? b]) = _$ObjectAllOf;

  const ObjectAllOf._();

  factory ObjectAllOf.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectAllOf> get serializer => _$objectAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OneObjectAllOf_0Interface {
  @BuiltValueField(wireName: 'attribute-allOf')
  String get attributeAllOf;
}

@BuiltValue(instantiable: false)
abstract interface class $OneObjectAllOfInterface implements $OneObjectAllOf_0Interface {}

abstract class OneObjectAllOf implements $OneObjectAllOfInterface, Built<OneObjectAllOf, OneObjectAllOfBuilder> {
  factory OneObjectAllOf([void Function(OneObjectAllOfBuilder)? b]) = _$OneObjectAllOf;

  const OneObjectAllOf._();

  factory OneObjectAllOf.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<OneObjectAllOf> get serializer => _$oneObjectAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PrimitiveAllOfInterface {
  @BuiltValueField(wireName: 'int')
  int get $int;
  @BuiltValueField(wireName: 'String')
  String get string;
}

abstract class PrimitiveAllOf implements $PrimitiveAllOfInterface, Built<PrimitiveAllOf, PrimitiveAllOfBuilder> {
  factory PrimitiveAllOf([void Function(PrimitiveAllOfBuilder)? b]) = _$PrimitiveAllOf;

  const PrimitiveAllOf._();

  factory PrimitiveAllOf.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<PrimitiveAllOf> get serializer => _$primitiveAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $MixedAllOf_1Interface {
  @BuiltValueField(wireName: 'attribute-allOf')
  String get attributeAllOf;
}

@BuiltValue(instantiable: false)
abstract interface class $MixedAllOfInterface implements $MixedAllOf_1Interface {
  @BuiltValueField(wireName: 'String')
  String get string;
}

abstract class MixedAllOf implements $MixedAllOfInterface, Built<MixedAllOf, MixedAllOfBuilder> {
  factory MixedAllOf([void Function(MixedAllOfBuilder)? b]) = _$MixedAllOf;

  const MixedAllOf._();

  factory MixedAllOf.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<MixedAllOf> get serializer => _$mixedAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OneValueAllOfInterface {
  @BuiltValueField(wireName: 'String')
  String get string;
}

abstract class OneValueAllOf implements $OneValueAllOfInterface, Built<OneValueAllOf, OneValueAllOfBuilder> {
  factory OneValueAllOf([void Function(OneValueAllOfBuilder)? b]) = _$OneValueAllOf;

  const OneValueAllOf._();

  factory OneValueAllOf.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<OneValueAllOf> get serializer => _$oneValueAllOfSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(ObjectAllOf), ObjectAllOfBuilder.new)
      ..add(ObjectAllOf.serializer)
      ..addBuilderFactory(const FullType(OneObjectAllOf), OneObjectAllOfBuilder.new)
      ..add(OneObjectAllOf.serializer)
      ..addBuilderFactory(const FullType(PrimitiveAllOf), PrimitiveAllOfBuilder.new)
      ..add(PrimitiveAllOf.serializer)
      ..addBuilderFactory(const FullType(MixedAllOf), MixedAllOfBuilder.new)
      ..add(MixedAllOf.serializer)
      ..addBuilderFactory(const FullType(OneValueAllOf), OneValueAllOfBuilder.new)
      ..add(OneValueAllOf.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
