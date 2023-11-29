// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'any_of.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ObjectAnyOf0> _$objectAnyOf0Serializer = _$ObjectAnyOf0Serializer();
Serializer<ObjectAnyOf1> _$objectAnyOf1Serializer = _$ObjectAnyOf1Serializer();
Serializer<MixedAnyOf1> _$mixedAnyOf1Serializer = _$MixedAnyOf1Serializer();
Serializer<OneObjectAnyOf0> _$oneObjectAnyOf0Serializer = _$OneObjectAnyOf0Serializer();

class _$ObjectAnyOf0Serializer implements StructuredSerializer<ObjectAnyOf0> {
  @override
  final Iterable<Type> types = const [ObjectAnyOf0, _$ObjectAnyOf0];
  @override
  final String wireName = 'ObjectAnyOf0';

  @override
  Iterable<Object?> serialize(Serializers serializers, ObjectAnyOf0 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute1-anyOf',
      serializers.serialize(object.attribute1AnyOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ObjectAnyOf0 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ObjectAnyOf0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute1-anyOf':
          result.attribute1AnyOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ObjectAnyOf1Serializer implements StructuredSerializer<ObjectAnyOf1> {
  @override
  final Iterable<Type> types = const [ObjectAnyOf1, _$ObjectAnyOf1];
  @override
  final String wireName = 'ObjectAnyOf1';

  @override
  Iterable<Object?> serialize(Serializers serializers, ObjectAnyOf1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute2-anyOf',
      serializers.serialize(object.attribute2AnyOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ObjectAnyOf1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ObjectAnyOf1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute2-anyOf':
          result.attribute2AnyOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MixedAnyOf1Serializer implements StructuredSerializer<MixedAnyOf1> {
  @override
  final Iterable<Type> types = const [MixedAnyOf1, _$MixedAnyOf1];
  @override
  final String wireName = 'MixedAnyOf1';

  @override
  Iterable<Object?> serialize(Serializers serializers, MixedAnyOf1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-anyOf',
      serializers.serialize(object.attributeAnyOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MixedAnyOf1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MixedAnyOf1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute-anyOf':
          result.attributeAnyOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OneObjectAnyOf0Serializer implements StructuredSerializer<OneObjectAnyOf0> {
  @override
  final Iterable<Type> types = const [OneObjectAnyOf0, _$OneObjectAnyOf0];
  @override
  final String wireName = 'OneObjectAnyOf0';

  @override
  Iterable<Object?> serialize(Serializers serializers, OneObjectAnyOf0 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-anyOf',
      serializers.serialize(object.attributeAnyOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OneObjectAnyOf0 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = OneObjectAnyOf0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute-anyOf':
          result.attributeAnyOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $ObjectAnyOf0InterfaceBuilder {
  void replace($ObjectAnyOf0Interface other);
  void update(void Function($ObjectAnyOf0InterfaceBuilder) updates);
  String? get attribute1AnyOf;
  set attribute1AnyOf(String? attribute1AnyOf);
}

class _$ObjectAnyOf0 extends ObjectAnyOf0 {
  @override
  final String attribute1AnyOf;

  factory _$ObjectAnyOf0([void Function(ObjectAnyOf0Builder)? updates]) =>
      (ObjectAnyOf0Builder()..update(updates))._build();

  _$ObjectAnyOf0._({required this.attribute1AnyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute1AnyOf, r'ObjectAnyOf0', 'attribute1AnyOf');
  }

  @override
  ObjectAnyOf0 rebuild(void Function(ObjectAnyOf0Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectAnyOf0Builder toBuilder() => ObjectAnyOf0Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectAnyOf0 && attribute1AnyOf == other.attribute1AnyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute1AnyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectAnyOf0')..add('attribute1AnyOf', attribute1AnyOf)).toString();
  }
}

class ObjectAnyOf0Builder implements Builder<ObjectAnyOf0, ObjectAnyOf0Builder>, $ObjectAnyOf0InterfaceBuilder {
  _$ObjectAnyOf0? _$v;

  String? _attribute1AnyOf;
  String? get attribute1AnyOf => _$this._attribute1AnyOf;
  set attribute1AnyOf(covariant String? attribute1AnyOf) => _$this._attribute1AnyOf = attribute1AnyOf;

  ObjectAnyOf0Builder();

  ObjectAnyOf0Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute1AnyOf = $v.attribute1AnyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectAnyOf0 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectAnyOf0;
  }

  @override
  void update(void Function(ObjectAnyOf0Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectAnyOf0 build() => _build();

  _$ObjectAnyOf0 _build() {
    final _$result = _$v ??
        _$ObjectAnyOf0._(
            attribute1AnyOf:
                BuiltValueNullFieldError.checkNotNull(attribute1AnyOf, r'ObjectAnyOf0', 'attribute1AnyOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ObjectAnyOf1InterfaceBuilder {
  void replace($ObjectAnyOf1Interface other);
  void update(void Function($ObjectAnyOf1InterfaceBuilder) updates);
  String? get attribute2AnyOf;
  set attribute2AnyOf(String? attribute2AnyOf);
}

class _$ObjectAnyOf1 extends ObjectAnyOf1 {
  @override
  final String attribute2AnyOf;

  factory _$ObjectAnyOf1([void Function(ObjectAnyOf1Builder)? updates]) =>
      (ObjectAnyOf1Builder()..update(updates))._build();

  _$ObjectAnyOf1._({required this.attribute2AnyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute2AnyOf, r'ObjectAnyOf1', 'attribute2AnyOf');
  }

  @override
  ObjectAnyOf1 rebuild(void Function(ObjectAnyOf1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectAnyOf1Builder toBuilder() => ObjectAnyOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectAnyOf1 && attribute2AnyOf == other.attribute2AnyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute2AnyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectAnyOf1')..add('attribute2AnyOf', attribute2AnyOf)).toString();
  }
}

class ObjectAnyOf1Builder implements Builder<ObjectAnyOf1, ObjectAnyOf1Builder>, $ObjectAnyOf1InterfaceBuilder {
  _$ObjectAnyOf1? _$v;

  String? _attribute2AnyOf;
  String? get attribute2AnyOf => _$this._attribute2AnyOf;
  set attribute2AnyOf(covariant String? attribute2AnyOf) => _$this._attribute2AnyOf = attribute2AnyOf;

  ObjectAnyOf1Builder();

  ObjectAnyOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute2AnyOf = $v.attribute2AnyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectAnyOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectAnyOf1;
  }

  @override
  void update(void Function(ObjectAnyOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectAnyOf1 build() => _build();

  _$ObjectAnyOf1 _build() {
    final _$result = _$v ??
        _$ObjectAnyOf1._(
            attribute2AnyOf:
                BuiltValueNullFieldError.checkNotNull(attribute2AnyOf, r'ObjectAnyOf1', 'attribute2AnyOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ObjectAnyOfInterfaceBuilder {
  void replace($ObjectAnyOfInterface other);
  void update(void Function($ObjectAnyOfInterfaceBuilder) updates);
  ObjectAnyOf0Builder get objectAnyOf0;
  set objectAnyOf0(ObjectAnyOf0Builder? objectAnyOf0);

  ObjectAnyOf1Builder get objectAnyOf1;
  set objectAnyOf1(ObjectAnyOf1Builder? objectAnyOf1);
}

class _$ObjectAnyOf extends ObjectAnyOf {
  @override
  final JsonObject data;
  @override
  final ObjectAnyOf0? objectAnyOf0;
  @override
  final ObjectAnyOf1? objectAnyOf1;

  factory _$ObjectAnyOf([void Function(ObjectAnyOfBuilder)? updates]) =>
      (ObjectAnyOfBuilder()..update(updates))._build();

  _$ObjectAnyOf._({required this.data, this.objectAnyOf0, this.objectAnyOf1}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ObjectAnyOf', 'data');
  }

  @override
  ObjectAnyOf rebuild(void Function(ObjectAnyOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectAnyOfBuilder toBuilder() => ObjectAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectAnyOf &&
        data == other.data &&
        objectAnyOf0 == other.objectAnyOf0 &&
        objectAnyOf1 == other.objectAnyOf1;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, objectAnyOf0.hashCode);
    _$hash = $jc(_$hash, objectAnyOf1.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectAnyOf')
          ..add('data', data)
          ..add('objectAnyOf0', objectAnyOf0)
          ..add('objectAnyOf1', objectAnyOf1))
        .toString();
  }
}

class ObjectAnyOfBuilder implements Builder<ObjectAnyOf, ObjectAnyOfBuilder>, $ObjectAnyOfInterfaceBuilder {
  _$ObjectAnyOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ObjectAnyOf0Builder? _objectAnyOf0;
  ObjectAnyOf0Builder get objectAnyOf0 => _$this._objectAnyOf0 ??= ObjectAnyOf0Builder();
  set objectAnyOf0(covariant ObjectAnyOf0Builder? objectAnyOf0) => _$this._objectAnyOf0 = objectAnyOf0;

  ObjectAnyOf1Builder? _objectAnyOf1;
  ObjectAnyOf1Builder get objectAnyOf1 => _$this._objectAnyOf1 ??= ObjectAnyOf1Builder();
  set objectAnyOf1(covariant ObjectAnyOf1Builder? objectAnyOf1) => _$this._objectAnyOf1 = objectAnyOf1;

  ObjectAnyOfBuilder();

  ObjectAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _objectAnyOf0 = $v.objectAnyOf0?.toBuilder();
      _objectAnyOf1 = $v.objectAnyOf1?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectAnyOf;
  }

  @override
  void update(void Function(ObjectAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectAnyOf build() => _build();

  _$ObjectAnyOf _build() {
    ObjectAnyOf._validate(this);
    _$ObjectAnyOf _$result;
    try {
      _$result = _$v ??
          _$ObjectAnyOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'ObjectAnyOf', 'data'),
              objectAnyOf0: _objectAnyOf0?.build(),
              objectAnyOf1: _objectAnyOf1?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'objectAnyOf0';
        _objectAnyOf0?.build();
        _$failedField = 'objectAnyOf1';
        _objectAnyOf1?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ObjectAnyOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $MixedAnyOf1InterfaceBuilder {
  void replace($MixedAnyOf1Interface other);
  void update(void Function($MixedAnyOf1InterfaceBuilder) updates);
  String? get attributeAnyOf;
  set attributeAnyOf(String? attributeAnyOf);
}

class _$MixedAnyOf1 extends MixedAnyOf1 {
  @override
  final String attributeAnyOf;

  factory _$MixedAnyOf1([void Function(MixedAnyOf1Builder)? updates]) =>
      (MixedAnyOf1Builder()..update(updates))._build();

  _$MixedAnyOf1._({required this.attributeAnyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeAnyOf, r'MixedAnyOf1', 'attributeAnyOf');
  }

  @override
  MixedAnyOf1 rebuild(void Function(MixedAnyOf1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  MixedAnyOf1Builder toBuilder() => MixedAnyOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MixedAnyOf1 && attributeAnyOf == other.attributeAnyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeAnyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MixedAnyOf1')..add('attributeAnyOf', attributeAnyOf)).toString();
  }
}

class MixedAnyOf1Builder implements Builder<MixedAnyOf1, MixedAnyOf1Builder>, $MixedAnyOf1InterfaceBuilder {
  _$MixedAnyOf1? _$v;

  String? _attributeAnyOf;
  String? get attributeAnyOf => _$this._attributeAnyOf;
  set attributeAnyOf(covariant String? attributeAnyOf) => _$this._attributeAnyOf = attributeAnyOf;

  MixedAnyOf1Builder();

  MixedAnyOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeAnyOf = $v.attributeAnyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MixedAnyOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MixedAnyOf1;
  }

  @override
  void update(void Function(MixedAnyOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MixedAnyOf1 build() => _build();

  _$MixedAnyOf1 _build() {
    final _$result = _$v ??
        _$MixedAnyOf1._(
            attributeAnyOf: BuiltValueNullFieldError.checkNotNull(attributeAnyOf, r'MixedAnyOf1', 'attributeAnyOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $MixedAnyOfInterfaceBuilder {
  void replace($MixedAnyOfInterface other);
  void update(void Function($MixedAnyOfInterfaceBuilder) updates);
  String? get string;
  set string(String? string);

  MixedAnyOf1Builder get mixedAnyOf1;
  set mixedAnyOf1(MixedAnyOf1Builder? mixedAnyOf1);
}

class _$MixedAnyOf extends MixedAnyOf {
  @override
  final JsonObject data;
  @override
  final String? string;
  @override
  final MixedAnyOf1? mixedAnyOf1;

  factory _$MixedAnyOf([void Function(MixedAnyOfBuilder)? updates]) => (MixedAnyOfBuilder()..update(updates))._build();

  _$MixedAnyOf._({required this.data, this.string, this.mixedAnyOf1}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'MixedAnyOf', 'data');
  }

  @override
  MixedAnyOf rebuild(void Function(MixedAnyOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  MixedAnyOfBuilder toBuilder() => MixedAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MixedAnyOf && data == other.data && string == other.string && mixedAnyOf1 == other.mixedAnyOf1;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, mixedAnyOf1.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MixedAnyOf')
          ..add('data', data)
          ..add('string', string)
          ..add('mixedAnyOf1', mixedAnyOf1))
        .toString();
  }
}

class MixedAnyOfBuilder implements Builder<MixedAnyOf, MixedAnyOfBuilder>, $MixedAnyOfInterfaceBuilder {
  _$MixedAnyOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  MixedAnyOf1Builder? _mixedAnyOf1;
  MixedAnyOf1Builder get mixedAnyOf1 => _$this._mixedAnyOf1 ??= MixedAnyOf1Builder();
  set mixedAnyOf1(covariant MixedAnyOf1Builder? mixedAnyOf1) => _$this._mixedAnyOf1 = mixedAnyOf1;

  MixedAnyOfBuilder();

  MixedAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _string = $v.string;
      _mixedAnyOf1 = $v.mixedAnyOf1?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MixedAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MixedAnyOf;
  }

  @override
  void update(void Function(MixedAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MixedAnyOf build() => _build();

  _$MixedAnyOf _build() {
    MixedAnyOf._validate(this);
    _$MixedAnyOf _$result;
    try {
      _$result = _$v ??
          _$MixedAnyOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'MixedAnyOf', 'data'),
              string: string,
              mixedAnyOf1: _mixedAnyOf1?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mixedAnyOf1';
        _mixedAnyOf1?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'MixedAnyOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $OneObjectAnyOf0InterfaceBuilder {
  void replace($OneObjectAnyOf0Interface other);
  void update(void Function($OneObjectAnyOf0InterfaceBuilder) updates);
  String? get attributeAnyOf;
  set attributeAnyOf(String? attributeAnyOf);
}

class _$OneObjectAnyOf0 extends OneObjectAnyOf0 {
  @override
  final String attributeAnyOf;

  factory _$OneObjectAnyOf0([void Function(OneObjectAnyOf0Builder)? updates]) =>
      (OneObjectAnyOf0Builder()..update(updates))._build();

  _$OneObjectAnyOf0._({required this.attributeAnyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeAnyOf, r'OneObjectAnyOf0', 'attributeAnyOf');
  }

  @override
  OneObjectAnyOf0 rebuild(void Function(OneObjectAnyOf0Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneObjectAnyOf0Builder toBuilder() => OneObjectAnyOf0Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneObjectAnyOf0 && attributeAnyOf == other.attributeAnyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeAnyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneObjectAnyOf0')..add('attributeAnyOf', attributeAnyOf)).toString();
  }
}

class OneObjectAnyOf0Builder
    implements Builder<OneObjectAnyOf0, OneObjectAnyOf0Builder>, $OneObjectAnyOf0InterfaceBuilder {
  _$OneObjectAnyOf0? _$v;

  String? _attributeAnyOf;
  String? get attributeAnyOf => _$this._attributeAnyOf;
  set attributeAnyOf(covariant String? attributeAnyOf) => _$this._attributeAnyOf = attributeAnyOf;

  OneObjectAnyOf0Builder();

  OneObjectAnyOf0Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeAnyOf = $v.attributeAnyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneObjectAnyOf0 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneObjectAnyOf0;
  }

  @override
  void update(void Function(OneObjectAnyOf0Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneObjectAnyOf0 build() => _build();

  _$OneObjectAnyOf0 _build() {
    final _$result = _$v ??
        _$OneObjectAnyOf0._(
            attributeAnyOf:
                BuiltValueNullFieldError.checkNotNull(attributeAnyOf, r'OneObjectAnyOf0', 'attributeAnyOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $OneObjectAnyOfInterfaceBuilder {
  void replace($OneObjectAnyOfInterface other);
  void update(void Function($OneObjectAnyOfInterfaceBuilder) updates);
  OneObjectAnyOf0Builder get oneObjectAnyOf0;
  set oneObjectAnyOf0(OneObjectAnyOf0Builder? oneObjectAnyOf0);
}

class _$OneObjectAnyOf extends OneObjectAnyOf {
  @override
  final JsonObject data;
  @override
  final OneObjectAnyOf0? oneObjectAnyOf0;

  factory _$OneObjectAnyOf([void Function(OneObjectAnyOfBuilder)? updates]) =>
      (OneObjectAnyOfBuilder()..update(updates))._build();

  _$OneObjectAnyOf._({required this.data, this.oneObjectAnyOf0}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneObjectAnyOf', 'data');
  }

  @override
  OneObjectAnyOf rebuild(void Function(OneObjectAnyOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneObjectAnyOfBuilder toBuilder() => OneObjectAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneObjectAnyOf && data == other.data && oneObjectAnyOf0 == other.oneObjectAnyOf0;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, oneObjectAnyOf0.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneObjectAnyOf')
          ..add('data', data)
          ..add('oneObjectAnyOf0', oneObjectAnyOf0))
        .toString();
  }
}

class OneObjectAnyOfBuilder implements Builder<OneObjectAnyOf, OneObjectAnyOfBuilder>, $OneObjectAnyOfInterfaceBuilder {
  _$OneObjectAnyOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  OneObjectAnyOf0Builder? _oneObjectAnyOf0;
  OneObjectAnyOf0Builder get oneObjectAnyOf0 => _$this._oneObjectAnyOf0 ??= OneObjectAnyOf0Builder();
  set oneObjectAnyOf0(covariant OneObjectAnyOf0Builder? oneObjectAnyOf0) => _$this._oneObjectAnyOf0 = oneObjectAnyOf0;

  OneObjectAnyOfBuilder();

  OneObjectAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _oneObjectAnyOf0 = $v.oneObjectAnyOf0?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneObjectAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneObjectAnyOf;
  }

  @override
  void update(void Function(OneObjectAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneObjectAnyOf build() => _build();

  _$OneObjectAnyOf _build() {
    OneObjectAnyOf._validate(this);
    _$OneObjectAnyOf _$result;
    try {
      _$result = _$v ??
          _$OneObjectAnyOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'OneObjectAnyOf', 'data'),
              oneObjectAnyOf0: _oneObjectAnyOf0?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneObjectAnyOf0';
        _oneObjectAnyOf0?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OneObjectAnyOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $OneValueAnyOfInterfaceBuilder {
  void replace($OneValueAnyOfInterface other);
  void update(void Function($OneValueAnyOfInterfaceBuilder) updates);
  String? get string;
  set string(String? string);
}

class _$OneValueAnyOf extends OneValueAnyOf {
  @override
  final JsonObject data;
  @override
  final String? string;

  factory _$OneValueAnyOf([void Function(OneValueAnyOfBuilder)? updates]) =>
      (OneValueAnyOfBuilder()..update(updates))._build();

  _$OneValueAnyOf._({required this.data, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneValueAnyOf', 'data');
  }

  @override
  OneValueAnyOf rebuild(void Function(OneValueAnyOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneValueAnyOfBuilder toBuilder() => OneValueAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneValueAnyOf && data == other.data && string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneValueAnyOf')
          ..add('data', data)
          ..add('string', string))
        .toString();
  }
}

class OneValueAnyOfBuilder implements Builder<OneValueAnyOf, OneValueAnyOfBuilder>, $OneValueAnyOfInterfaceBuilder {
  _$OneValueAnyOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  OneValueAnyOfBuilder();

  OneValueAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneValueAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneValueAnyOf;
  }

  @override
  void update(void Function(OneValueAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneValueAnyOf build() => _build();

  _$OneValueAnyOf _build() {
    OneValueAnyOf._validate(this);
    final _$result = _$v ??
        _$OneValueAnyOf._(data: BuiltValueNullFieldError.checkNotNull(data, r'OneValueAnyOf', 'data'), string: string);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $AnyOfIntDoubleInterfaceBuilder {
  void replace($AnyOfIntDoubleInterface other);
  void update(void Function($AnyOfIntDoubleInterfaceBuilder) updates);
  int? get $int;
  set $int(int? $int);

  double? get $double;
  set $double(double? $double);
}

class _$AnyOfIntDouble extends AnyOfIntDouble {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final double? $double;

  factory _$AnyOfIntDouble([void Function(AnyOfIntDoubleBuilder)? updates]) =>
      (AnyOfIntDoubleBuilder()..update(updates))._build();

  _$AnyOfIntDouble._({required this.data, this.$int, this.$double}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'AnyOfIntDouble', 'data');
  }

  @override
  AnyOfIntDouble rebuild(void Function(AnyOfIntDoubleBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AnyOfIntDoubleBuilder toBuilder() => AnyOfIntDoubleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnyOfIntDouble && data == other.data && $int == other.$int && $double == other.$double;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jc(_$hash, $double.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnyOfIntDouble')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('\$double', $double))
        .toString();
  }
}

class AnyOfIntDoubleBuilder implements Builder<AnyOfIntDouble, AnyOfIntDoubleBuilder>, $AnyOfIntDoubleInterfaceBuilder {
  _$AnyOfIntDouble? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(covariant int? $int) => _$this._$int = $int;

  double? _$double;
  double? get $double => _$this._$double;
  set $double(covariant double? $double) => _$this._$double = $double;

  AnyOfIntDoubleBuilder();

  AnyOfIntDoubleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$int = $v.$int;
      _$double = $v.$double;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AnyOfIntDouble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnyOfIntDouble;
  }

  @override
  void update(void Function(AnyOfIntDoubleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnyOfIntDouble build() => _build();

  _$AnyOfIntDouble _build() {
    AnyOfIntDouble._validate(this);
    final _$result = _$v ??
        _$AnyOfIntDouble._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'AnyOfIntDouble', 'data'), $int: $int, $double: $double);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $AnyOfIntDoubleOtherInterfaceBuilder {
  void replace($AnyOfIntDoubleOtherInterface other);
  void update(void Function($AnyOfIntDoubleOtherInterfaceBuilder) updates);
  int? get $int;
  set $int(int? $int);

  double? get $double;
  set $double(double? $double);

  String? get string;
  set string(String? string);
}

class _$AnyOfIntDoubleOther extends AnyOfIntDoubleOther {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final double? $double;
  @override
  final String? string;

  factory _$AnyOfIntDoubleOther([void Function(AnyOfIntDoubleOtherBuilder)? updates]) =>
      (AnyOfIntDoubleOtherBuilder()..update(updates))._build();

  _$AnyOfIntDoubleOther._({required this.data, this.$int, this.$double, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'AnyOfIntDoubleOther', 'data');
  }

  @override
  AnyOfIntDoubleOther rebuild(void Function(AnyOfIntDoubleOtherBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnyOfIntDoubleOtherBuilder toBuilder() => AnyOfIntDoubleOtherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnyOfIntDoubleOther &&
        data == other.data &&
        $int == other.$int &&
        $double == other.$double &&
        string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jc(_$hash, $double.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnyOfIntDoubleOther')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('\$double', $double)
          ..add('string', string))
        .toString();
  }
}

class AnyOfIntDoubleOtherBuilder
    implements Builder<AnyOfIntDoubleOther, AnyOfIntDoubleOtherBuilder>, $AnyOfIntDoubleOtherInterfaceBuilder {
  _$AnyOfIntDoubleOther? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(covariant int? $int) => _$this._$int = $int;

  double? _$double;
  double? get $double => _$this._$double;
  set $double(covariant double? $double) => _$this._$double = $double;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  AnyOfIntDoubleOtherBuilder();

  AnyOfIntDoubleOtherBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$int = $v.$int;
      _$double = $v.$double;
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AnyOfIntDoubleOther other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AnyOfIntDoubleOther;
  }

  @override
  void update(void Function(AnyOfIntDoubleOtherBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnyOfIntDoubleOther build() => _build();

  _$AnyOfIntDoubleOther _build() {
    AnyOfIntDoubleOther._validate(this);
    final _$result = _$v ??
        _$AnyOfIntDoubleOther._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'AnyOfIntDoubleOther', 'data'),
            $int: $int,
            $double: $double,
            string: string);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
