// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: unused_element

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';

part 'enum.openapi.g.dart';

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

class EnumString extends EnumClass {
  const EnumString._(super.name);

  static const EnumString test = _$enumStringTest;

  @BuiltValueEnumConst(wireName: 'default')
  static const EnumString $default = _$enumStringDefault;

  static BuiltSet<EnumString> get values => _$enumStringValues;

  static EnumString valueOf(final String name) => _$valueOfEnumString(name);

  static Serializer<EnumString> get serializer => _$enumStringSerializer;
}

class EnumInt extends EnumClass {
  const EnumInt._(super.name);

  @BuiltValueEnumConst(wireName: '0')
  static const EnumInt $0 = _$enumInt$0;

  @BuiltValueEnumConst(wireName: '1')
  static const EnumInt $1 = _$enumInt$1;

  @BuiltValueEnumConst(wireName: '2')
  static const EnumInt $2 = _$enumInt$2;

  static BuiltSet<EnumInt> get values => _$enumIntValues;

  static EnumInt valueOf(final String name) => _$valueOfEnumInt(name);

  static Serializer<EnumInt> get serializer => _$enumIntSerializer;
}

class WrappedEnum_String extends EnumClass {
  const WrappedEnum_String._(super.name);

  static const WrappedEnum_String test = _$wrappedEnumStringTest;

  @BuiltValueEnumConst(wireName: 'default')
  static const WrappedEnum_String $default = _$wrappedEnumStringDefault;

  static BuiltSet<WrappedEnum_String> get values => _$wrappedEnumStringValues;

  static WrappedEnum_String valueOf(final String name) => _$valueOfWrappedEnum_String(name);

  static Serializer<WrappedEnum_String> get serializer => _$wrappedEnumStringSerializer;
}

class WrappedEnum_Integer extends EnumClass {
  const WrappedEnum_Integer._(super.name);

  @BuiltValueEnumConst(wireName: '0')
  static const WrappedEnum_Integer $0 = _$wrappedEnumInteger$0;

  @BuiltValueEnumConst(wireName: '1')
  static const WrappedEnum_Integer $1 = _$wrappedEnumInteger$1;

  @BuiltValueEnumConst(wireName: '2')
  static const WrappedEnum_Integer $2 = _$wrappedEnumInteger$2;

  static BuiltSet<WrappedEnum_Integer> get values => _$wrappedEnumIntegerValues;

  static WrappedEnum_Integer valueOf(final String name) => _$valueOfWrappedEnum_Integer(name);

  static Serializer<WrappedEnum_Integer> get serializer => _$wrappedEnumIntegerSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WrappedEnumInterface {
  WrappedEnum_String get string;
  WrappedEnum_Integer get integer;
}

abstract class WrappedEnum implements $WrappedEnumInterface, Built<WrappedEnum, WrappedEnumBuilder> {
  factory WrappedEnum([final void Function(WrappedEnumBuilder)? b]) = _$WrappedEnum;

  const WrappedEnum._();

  factory WrappedEnum.fromJson(final Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<WrappedEnum> get serializer => _$wrappedEnumSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..add(EnumString.serializer)
      ..add(EnumInt.serializer)
      ..addBuilderFactory(const FullType(WrappedEnum), WrappedEnumBuilder.new)
      ..add(WrappedEnum.serializer)
      ..add(WrappedEnum_String.serializer)
      ..add(WrappedEnum_Integer.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
