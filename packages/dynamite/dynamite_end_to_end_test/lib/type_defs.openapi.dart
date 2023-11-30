// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';

part 'type_defs.openapi.g.dart';

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

typedef TypeResultBase = int;

typedef EmptySchema = JsonObject;

typedef Redirect = Base;

typedef RedirectBaseType = int;

typedef RedirectEmptyType = JsonObject;

@BuiltValue(instantiable: false)
abstract interface class $BaseInterface {
  String? get attribute;
}

abstract class Base implements $BaseInterface, Built<Base, BaseBuilder> {
  factory Base([final void Function(BaseBuilder)? b]) = _$Base;

  const Base._();

  factory Base.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Base> get serializer => _$baseSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NestedRedirectInterface {
  Base? get redirect;
  int? get redirectBaseType;
  JsonObject? get redirectEmptyType;
}

abstract class NestedRedirect implements $NestedRedirectInterface, Built<NestedRedirect, NestedRedirectBuilder> {
  factory NestedRedirect([final void Function(NestedRedirectBuilder)? b]) = _$NestedRedirect;

  const NestedRedirect._();

  factory NestedRedirect.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<NestedRedirect> get serializer => _$nestedRedirectSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SomeOfRedirectInterface {
  Base? get base;
  int? get $int;
  JsonObject? get jsonObject;
}

abstract class SomeOfRedirect implements $SomeOfRedirectInterface, Built<SomeOfRedirect, SomeOfRedirectBuilder> {
  factory SomeOfRedirect([final void Function(SomeOfRedirectBuilder)? b]) = _$SomeOfRedirect;

  const SomeOfRedirect._();

  factory SomeOfRedirect.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  @BuiltValueSerializer(custom: true)
  static Serializer<SomeOfRedirect> get serializer => _$SomeOfRedirectSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final SomeOfRedirectBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._base, b._$int, b._jsonObject].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'base', '$int', 'jsonObject' for ${b._data}");
    }
  }
}

class _$SomeOfRedirectSerializer implements PrimitiveSerializer<SomeOfRedirect> {
  @override
  final Iterable<Type> types = const [SomeOfRedirect, _$SomeOfRedirect];

  @override
  final String wireName = 'SomeOfRedirect';

  @override
  Object serialize(
    final Serializers serializers,
    final SomeOfRedirect object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  SomeOfRedirect deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SomeOfRedirectBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(Base))! as Base;
      result.base.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(JsonObject))! as JsonObject;
      result.jsonObject = value;
    } catch (_) {}
    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Base), BaseBuilder.new)
      ..add(Base.serializer)
      ..addBuilderFactory(const FullType(NestedRedirect), NestedRedirectBuilder.new)
      ..add(NestedRedirect.serializer)
      ..addBuilderFactory(const FullType(SomeOfRedirect), SomeOfRedirectBuilder.new)
      ..add(SomeOfRedirect.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
