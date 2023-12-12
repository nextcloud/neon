// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EnumString _$enumStringTest = EnumString._('test');
const EnumString _$enumStringDefault = EnumString._('\$default');

EnumString _$valueOfEnumString(String name) {
  switch (name) {
    case 'test':
      return _$enumStringTest;
    case '\$default':
      return _$enumStringDefault;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<EnumString> _$enumStringValues = BuiltSet<EnumString>(const <EnumString>[
  _$enumStringTest,
  _$enumStringDefault,
]);

Serializer<EnumString> _$enumStringSerializer = _$EnumStringSerializer();

class _$EnumStringSerializer implements PrimitiveSerializer<EnumString> {
  static const Map<String, Object> _toWire = <String, Object>{
    '\$default': 'default',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    'default': '\$default',
  };

  @override
  final Iterable<Type> types = const <Type>[EnumString];
  @override
  final String wireName = 'EnumString';

  @override
  Object serialize(Serializers serializers, EnumString object, {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EnumString deserialize(Serializers serializers, Object serialized, {FullType specifiedType = FullType.unspecified}) =>
      EnumString.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
