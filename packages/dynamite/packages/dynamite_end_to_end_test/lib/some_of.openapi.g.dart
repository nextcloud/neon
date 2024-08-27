// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_of.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OneOfInObject> _$oneOfInObjectSerializer = _$OneOfInObjectSerializer();

class _$OneOfInObjectSerializer implements StructuredSerializer<OneOfInObject> {
  @override
  final Iterable<Type> types = const [OneOfInObject, _$OneOfInObject];
  @override
  final String wireName = 'OneOfInObject';

  @override
  Iterable<Object?> serialize(Serializers serializers, OneOfInObject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'OneValueRequired',
      serializers.serialize(object.oneValueRequired, specifiedType: const FullType(int)),
      'IntDoubleRequired',
      serializers.serialize(object.intDoubleRequired, specifiedType: const FullType(num)),
      'IntDoubleOtherRequired',
      serializers.serialize(object.intDoubleOtherRequired,
          specifiedType: const FullType(OneOfInObject_IntDoubleOtherRequired)),
    ];
    Object? value;
    value = object.oneValue;
    if (value != null) {
      result
        ..add('OneValue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.intDouble;
    if (value != null) {
      result
        ..add('IntDouble')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.intDoubleOther;
    if (value != null) {
      result
        ..add('IntDoubleOther')
        ..add(serializers.serialize(value, specifiedType: const FullType(OneOfInObject_IntDoubleOther)));
    }
    return result;
  }

  @override
  OneOfInObject deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = OneOfInObjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'OneValue':
          result.oneValue = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'OneValueRequired':
          result.oneValueRequired = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'IntDouble':
          result.intDouble = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'IntDoubleRequired':
          result.intDoubleRequired = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'IntDoubleOther':
          result.intDoubleOther = serializers.deserialize(value,
              specifiedType: const FullType(OneOfInObject_IntDoubleOther)) as OneOfInObject_IntDoubleOther?;
          break;
        case 'IntDoubleOtherRequired':
          result.intDoubleOtherRequired =
              serializers.deserialize(value, specifiedType: const FullType(OneOfInObject_IntDoubleOtherRequired))!
                  as OneOfInObject_IntDoubleOtherRequired;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $OneOfInObjectInterfaceBuilder {
  void replace($OneOfInObjectInterface other);
  void update(void Function($OneOfInObjectInterfaceBuilder) updates);
  int? get oneValue;
  set oneValue(int? oneValue);

  int? get oneValueRequired;
  set oneValueRequired(int? oneValueRequired);

  num? get intDouble;
  set intDouble(num? intDouble);

  num? get intDoubleRequired;
  set intDoubleRequired(num? intDoubleRequired);

  OneOfInObject_IntDoubleOther? get intDoubleOther;
  set intDoubleOther(OneOfInObject_IntDoubleOther? intDoubleOther);

  OneOfInObject_IntDoubleOtherRequired? get intDoubleOtherRequired;
  set intDoubleOtherRequired(OneOfInObject_IntDoubleOtherRequired? intDoubleOtherRequired);
}

class _$OneOfInObject extends OneOfInObject {
  @override
  final int? oneValue;
  @override
  final int oneValueRequired;
  @override
  final num? intDouble;
  @override
  final num intDoubleRequired;
  @override
  final OneOfInObject_IntDoubleOther? intDoubleOther;
  @override
  final OneOfInObject_IntDoubleOtherRequired intDoubleOtherRequired;

  factory _$OneOfInObject([void Function(OneOfInObjectBuilder)? updates]) =>
      (OneOfInObjectBuilder()..update(updates))._build();

  _$OneOfInObject._(
      {this.oneValue,
      required this.oneValueRequired,
      this.intDouble,
      required this.intDoubleRequired,
      this.intDoubleOther,
      required this.intDoubleOtherRequired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(oneValueRequired, r'OneOfInObject', 'oneValueRequired');
    BuiltValueNullFieldError.checkNotNull(intDoubleRequired, r'OneOfInObject', 'intDoubleRequired');
    BuiltValueNullFieldError.checkNotNull(intDoubleOtherRequired, r'OneOfInObject', 'intDoubleOtherRequired');
  }

  @override
  OneOfInObject rebuild(void Function(OneOfInObjectBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneOfInObjectBuilder toBuilder() => OneOfInObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is OneOfInObject &&
        oneValue == other.oneValue &&
        oneValueRequired == other.oneValueRequired &&
        intDouble == other.intDouble &&
        intDoubleRequired == other.intDoubleRequired &&
        intDoubleOther == _$dynamicOther.intDoubleOther &&
        intDoubleOtherRequired == _$dynamicOther.intDoubleOtherRequired;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneValue.hashCode);
    _$hash = $jc(_$hash, oneValueRequired.hashCode);
    _$hash = $jc(_$hash, intDouble.hashCode);
    _$hash = $jc(_$hash, intDoubleRequired.hashCode);
    _$hash = $jc(_$hash, intDoubleOther.hashCode);
    _$hash = $jc(_$hash, intDoubleOtherRequired.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneOfInObject')
          ..add('oneValue', oneValue)
          ..add('oneValueRequired', oneValueRequired)
          ..add('intDouble', intDouble)
          ..add('intDoubleRequired', intDoubleRequired)
          ..add('intDoubleOther', intDoubleOther)
          ..add('intDoubleOtherRequired', intDoubleOtherRequired))
        .toString();
  }
}

class OneOfInObjectBuilder implements Builder<OneOfInObject, OneOfInObjectBuilder>, $OneOfInObjectInterfaceBuilder {
  _$OneOfInObject? _$v;

  int? _oneValue;
  int? get oneValue => _$this._oneValue;
  set oneValue(covariant int? oneValue) => _$this._oneValue = oneValue;

  int? _oneValueRequired;
  int? get oneValueRequired => _$this._oneValueRequired;
  set oneValueRequired(covariant int? oneValueRequired) => _$this._oneValueRequired = oneValueRequired;

  num? _intDouble;
  num? get intDouble => _$this._intDouble;
  set intDouble(covariant num? intDouble) => _$this._intDouble = intDouble;

  num? _intDoubleRequired;
  num? get intDoubleRequired => _$this._intDoubleRequired;
  set intDoubleRequired(covariant num? intDoubleRequired) => _$this._intDoubleRequired = intDoubleRequired;

  OneOfInObject_IntDoubleOther? _intDoubleOther;
  OneOfInObject_IntDoubleOther? get intDoubleOther => _$this._intDoubleOther;
  set intDoubleOther(covariant OneOfInObject_IntDoubleOther? intDoubleOther) => _$this._intDoubleOther = intDoubleOther;

  OneOfInObject_IntDoubleOtherRequired? _intDoubleOtherRequired;
  OneOfInObject_IntDoubleOtherRequired? get intDoubleOtherRequired => _$this._intDoubleOtherRequired;
  set intDoubleOtherRequired(covariant OneOfInObject_IntDoubleOtherRequired? intDoubleOtherRequired) =>
      _$this._intDoubleOtherRequired = intDoubleOtherRequired;

  OneOfInObjectBuilder() {
    OneOfInObject._defaults(this);
  }

  OneOfInObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneValue = $v.oneValue;
      _oneValueRequired = $v.oneValueRequired;
      _intDouble = $v.intDouble;
      _intDoubleRequired = $v.intDoubleRequired;
      _intDoubleOther = $v.intDoubleOther;
      _intDoubleOtherRequired = $v.intDoubleOtherRequired;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneOfInObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneOfInObject;
  }

  @override
  void update(void Function(OneOfInObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneOfInObject build() => _build();

  _$OneOfInObject _build() {
    OneOfInObject._validate(this);
    final _$result = _$v ??
        _$OneOfInObject._(
            oneValue: oneValue,
            oneValueRequired:
                BuiltValueNullFieldError.checkNotNull(oneValueRequired, r'OneOfInObject', 'oneValueRequired'),
            intDouble: intDouble,
            intDoubleRequired:
                BuiltValueNullFieldError.checkNotNull(intDoubleRequired, r'OneOfInObject', 'intDoubleRequired'),
            intDoubleOther: intDoubleOther,
            intDoubleOtherRequired: BuiltValueNullFieldError.checkNotNull(
                intDoubleOtherRequired, r'OneOfInObject', 'intDoubleOtherRequired'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
