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

const EnumInt _$enumInt$0 = EnumInt._('\$0');
const EnumInt _$enumInt$1 = EnumInt._('\$1');
const EnumInt _$enumInt$2 = EnumInt._('\$2');

EnumInt _$valueOfEnumInt(String name) {
  switch (name) {
    case '\$0':
      return _$enumInt$0;
    case '\$1':
      return _$enumInt$1;
    case '\$2':
      return _$enumInt$2;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<EnumInt> _$enumIntValues = BuiltSet<EnumInt>(const <EnumInt>[
  _$enumInt$0,
  _$enumInt$1,
  _$enumInt$2,
]);

const WrappedEnum_String _$wrappedEnumStringTest = WrappedEnum_String._('test');
const WrappedEnum_String _$wrappedEnumStringDefault = WrappedEnum_String._('\$default');

WrappedEnum_String _$valueOfWrappedEnum_String(String name) {
  switch (name) {
    case 'test':
      return _$wrappedEnumStringTest;
    case '\$default':
      return _$wrappedEnumStringDefault;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<WrappedEnum_String> _$wrappedEnumStringValues = BuiltSet<WrappedEnum_String>(const <WrappedEnum_String>[
  _$wrappedEnumStringTest,
  _$wrappedEnumStringDefault,
]);

const WrappedEnum_Integer _$wrappedEnumInteger$0 = WrappedEnum_Integer._('\$0');
const WrappedEnum_Integer _$wrappedEnumInteger$1 = WrappedEnum_Integer._('\$1');
const WrappedEnum_Integer _$wrappedEnumInteger$2 = WrappedEnum_Integer._('\$2');

WrappedEnum_Integer _$valueOfWrappedEnum_Integer(String name) {
  switch (name) {
    case '\$0':
      return _$wrappedEnumInteger$0;
    case '\$1':
      return _$wrappedEnumInteger$1;
    case '\$2':
      return _$wrappedEnumInteger$2;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<WrappedEnum_Integer> _$wrappedEnumIntegerValues =
    BuiltSet<WrappedEnum_Integer>(const <WrappedEnum_Integer>[
  _$wrappedEnumInteger$0,
  _$wrappedEnumInteger$1,
  _$wrappedEnumInteger$2,
]);

Serializer<EnumString> _$enumStringSerializer = _$EnumStringSerializer();
Serializer<EnumInt> _$enumIntSerializer = _$EnumIntSerializer();
Serializer<WrappedEnum_String> _$wrappedEnumStringSerializer = _$WrappedEnum_StringSerializer();
Serializer<WrappedEnum_Integer> _$wrappedEnumIntegerSerializer = _$WrappedEnum_IntegerSerializer();
Serializer<WrappedEnum> _$wrappedEnumSerializer = _$WrappedEnumSerializer();

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

class _$EnumIntSerializer implements PrimitiveSerializer<EnumInt> {
  static const Map<String, Object> _toWire = <String, Object>{
    '\$0': '0',
    '\$1': '1',
    '\$2': '2',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    '0': '\$0',
    '1': '\$1',
    '2': '\$2',
  };

  @override
  final Iterable<Type> types = const <Type>[EnumInt];
  @override
  final String wireName = 'EnumInt';

  @override
  Object serialize(Serializers serializers, EnumInt object, {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EnumInt deserialize(Serializers serializers, Object serialized, {FullType specifiedType = FullType.unspecified}) =>
      EnumInt.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$WrappedEnum_StringSerializer implements PrimitiveSerializer<WrappedEnum_String> {
  static const Map<String, Object> _toWire = <String, Object>{
    '\$default': 'default',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    'default': '\$default',
  };

  @override
  final Iterable<Type> types = const <Type>[WrappedEnum_String];
  @override
  final String wireName = 'WrappedEnum_String';

  @override
  Object serialize(Serializers serializers, WrappedEnum_String object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  WrappedEnum_String deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WrappedEnum_String.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$WrappedEnum_IntegerSerializer implements PrimitiveSerializer<WrappedEnum_Integer> {
  static const Map<String, Object> _toWire = <String, Object>{
    '\$0': '0',
    '\$1': '1',
    '\$2': '2',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    '0': '\$0',
    '1': '\$1',
    '2': '\$2',
  };

  @override
  final Iterable<Type> types = const <Type>[WrappedEnum_Integer];
  @override
  final String wireName = 'WrappedEnum_Integer';

  @override
  Object serialize(Serializers serializers, WrappedEnum_Integer object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  WrappedEnum_Integer deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WrappedEnum_Integer.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$WrappedEnumSerializer implements StructuredSerializer<WrappedEnum> {
  @override
  final Iterable<Type> types = const [WrappedEnum, _$WrappedEnum];
  @override
  final String wireName = 'WrappedEnum';

  @override
  Iterable<Object?> serialize(Serializers serializers, WrappedEnum object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'string',
      serializers.serialize(object.string, specifiedType: const FullType(WrappedEnum_String)),
      'integer',
      serializers.serialize(object.integer, specifiedType: const FullType(WrappedEnum_Integer)),
    ];

    return result;
  }

  @override
  WrappedEnum deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WrappedEnumBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'string':
          result.string =
              serializers.deserialize(value, specifiedType: const FullType(WrappedEnum_String))! as WrappedEnum_String;
          break;
        case 'integer':
          result.integer = serializers.deserialize(value, specifiedType: const FullType(WrappedEnum_Integer))!
              as WrappedEnum_Integer;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $WrappedEnumInterfaceBuilder {
  void replace($WrappedEnumInterface other);
  void update(void Function($WrappedEnumInterfaceBuilder) updates);
  WrappedEnum_String? get string;
  set string(WrappedEnum_String? string);

  WrappedEnum_Integer? get integer;
  set integer(WrappedEnum_Integer? integer);
}

class _$WrappedEnum extends WrappedEnum {
  @override
  final WrappedEnum_String string;
  @override
  final WrappedEnum_Integer integer;

  factory _$WrappedEnum([void Function(WrappedEnumBuilder)? updates]) =>
      (WrappedEnumBuilder()..update(updates))._build();

  _$WrappedEnum._({required this.string, required this.integer}) : super._() {
    BuiltValueNullFieldError.checkNotNull(string, r'WrappedEnum', 'string');
    BuiltValueNullFieldError.checkNotNull(integer, r'WrappedEnum', 'integer');
  }

  @override
  WrappedEnum rebuild(void Function(WrappedEnumBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  WrappedEnumBuilder toBuilder() => WrappedEnumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WrappedEnum && string == other.string && integer == other.integer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, integer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WrappedEnum')
          ..add('string', string)
          ..add('integer', integer))
        .toString();
  }
}

class WrappedEnumBuilder implements Builder<WrappedEnum, WrappedEnumBuilder>, $WrappedEnumInterfaceBuilder {
  _$WrappedEnum? _$v;

  WrappedEnum_String? _string;
  WrappedEnum_String? get string => _$this._string;
  set string(covariant WrappedEnum_String? string) => _$this._string = string;

  WrappedEnum_Integer? _integer;
  WrappedEnum_Integer? get integer => _$this._integer;
  set integer(covariant WrappedEnum_Integer? integer) => _$this._integer = integer;

  WrappedEnumBuilder();

  WrappedEnumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _string = $v.string;
      _integer = $v.integer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WrappedEnum other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WrappedEnum;
  }

  @override
  void update(void Function(WrappedEnumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WrappedEnum build() => _build();

  _$WrappedEnum _build() {
    final _$result = _$v ??
        _$WrappedEnum._(
            string: BuiltValueNullFieldError.checkNotNull(string, r'WrappedEnum', 'string'),
            integer: BuiltValueNullFieldError.checkNotNull(integer, r'WrappedEnum', 'integer'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
