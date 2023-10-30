// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';

part 'some_ofs.openapi.g.dart';

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
abstract interface class BaseInterface {
  String get attribute;
}

abstract class Base implements BaseInterface, Built<Base, BaseBuilder> {
  factory Base([final void Function(BaseBuilder)? b]) = _$Base;

  const Base._();

  factory Base.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Base> get serializer => _$baseSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OneOfUnspecifiedArrayInterface {
  Base? get base;
  BuiltList<JsonObject>? get builtListJsonObject;
}

abstract class OneOfUnspecifiedArray
    implements OneOfUnspecifiedArrayInterface, Built<OneOfUnspecifiedArray, OneOfUnspecifiedArrayBuilder> {
  factory OneOfUnspecifiedArray([final void Function(OneOfUnspecifiedArrayBuilder)? b]) = _$OneOfUnspecifiedArray;

  const OneOfUnspecifiedArray._();

  factory OneOfUnspecifiedArray.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneOfUnspecifiedArray> get serializer => _$OneOfUnspecifiedArraySerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneOfUnspecifiedArrayBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._base, b._builtListJsonObject].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'base', 'builtListJsonObject' for ${b._data}");
    }
  }
}

class _$OneOfUnspecifiedArraySerializer implements PrimitiveSerializer<OneOfUnspecifiedArray> {
  @override
  final Iterable<Type> types = const [OneOfUnspecifiedArray, _$OneOfUnspecifiedArray];

  @override
  final String wireName = 'OneOfUnspecifiedArray';

  @override
  Object serialize(
    final Serializers serializers,
    final OneOfUnspecifiedArray object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneOfUnspecifiedArray deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneOfUnspecifiedArrayBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(Base))! as Base;
      result.base.replace(value);
      return result.build();
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>;
      result.builtListJsonObject.replace(value);
      return result.build();
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OneOfStringArrayInterface {
  Base? get base;
  BuiltList<String>? get builtListString;
}

abstract class OneOfStringArray implements OneOfStringArrayInterface, Built<OneOfStringArray, OneOfStringArrayBuilder> {
  factory OneOfStringArray([final void Function(OneOfStringArrayBuilder)? b]) = _$OneOfStringArray;

  const OneOfStringArray._();

  factory OneOfStringArray.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<OneOfStringArray> get serializer => _$OneOfStringArraySerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OneOfStringArrayBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._base, b._builtListString].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'base', 'builtListString' for ${b._data}");
    }
  }
}

class _$OneOfStringArraySerializer implements PrimitiveSerializer<OneOfStringArray> {
  @override
  final Iterable<Type> types = const [OneOfStringArray, _$OneOfStringArray];

  @override
  final String wireName = 'OneOfStringArray';

  @override
  Object serialize(
    final Serializers serializers,
    final OneOfStringArray object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OneOfStringArray deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OneOfStringArrayBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(Base))! as Base;
      result.base.replace(value);
      return result.build();
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(String)]))!
          as BuiltList<String>;
      result.builtListString.replace(value);
      return result.build();
    } catch (_) {}
    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Base), Base.new)
      ..add(Base.serializer)
      ..addBuilderFactory(const FullType(OneOfUnspecifiedArray), OneOfUnspecifiedArray.new)
      ..add(OneOfUnspecifiedArray.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(const FullType(OneOfStringArray), OneOfStringArray.new)
      ..add(OneOfStringArray.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
