// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';

part 'all_of.openapi.g.dart';

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
abstract interface class ObjectAllOf_0Interface {
  @BuiltValueField(wireName: 'attribute1-allOf')
  String get attribute1AllOf;
}

@BuiltValue(instantiable: false)
abstract interface class ObjectAllOf_1Interface {
  @BuiltValueField(wireName: 'attribute2-allOf')
  String get attribute2AllOf;
}

@BuiltValue(instantiable: false)
abstract interface class ObjectAllOfInterface implements ObjectAllOf_0Interface, ObjectAllOf_1Interface {}

abstract class ObjectAllOf implements ObjectAllOfInterface, Built<ObjectAllOf, ObjectAllOfBuilder> {
  factory ObjectAllOf([final void Function(ObjectAllOfBuilder)? b]) = _$ObjectAllOf;

  const ObjectAllOf._();

  factory ObjectAllOf.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<ObjectAllOf> get serializer => _$objectAllOfSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OneObjectAllOf_0Interface {
  @BuiltValueField(wireName: 'attribute-allOf')
  String get attributeAllOf;
}

@BuiltValue(instantiable: false)
abstract interface class OneObjectAllOfInterface implements OneObjectAllOf_0Interface {}

abstract class OneObjectAllOf implements OneObjectAllOfInterface, Built<OneObjectAllOf, OneObjectAllOfBuilder> {
  factory OneObjectAllOf([final void Function(OneObjectAllOfBuilder)? b]) = _$OneObjectAllOf;

  const OneObjectAllOf._();

  factory OneObjectAllOf.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<OneObjectAllOf> get serializer => _$oneObjectAllOfSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(ObjectAllOf), ObjectAllOf.new)
      ..add(ObjectAllOf.serializer)
      ..addBuilderFactory(const FullType(OneObjectAllOf), OneObjectAllOf.new)
      ..add(OneObjectAllOf.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
