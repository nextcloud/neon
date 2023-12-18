// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GetEnumPattern _$getEnumPatternA = GetEnumPattern._('a');
const GetEnumPattern _$getEnumPattern$0 = GetEnumPattern._('\$0');

GetEnumPattern _$valueOfGetEnumPattern(String name) {
  switch (name) {
    case 'a':
      return _$getEnumPatternA;
    case '\$0':
      return _$getEnumPattern$0;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<GetEnumPattern> _$getEnumPatternValues = BuiltSet<GetEnumPattern>(const <GetEnumPattern>[
  _$getEnumPatternA,
  _$getEnumPattern$0,
]);

Serializer<GetEnumPattern> _$getEnumPatternSerializer = _$GetEnumPatternSerializer();

class _$GetEnumPatternSerializer implements PrimitiveSerializer<GetEnumPattern> {
  static const Map<String, Object> _toWire = <String, Object>{
    '\$0': '0',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    '0': '\$0',
  };

  @override
  final Iterable<Type> types = const <Type>[GetEnumPattern];
  @override
  final String wireName = 'GetEnumPattern';

  @override
  Object serialize(Serializers serializers, GetEnumPattern object, {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GetEnumPattern deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GetEnumPattern.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
