// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_of.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ObjectOneOf0> _$objectOneOf0Serializer = _$ObjectOneOf0Serializer();
Serializer<ObjectOneOf1> _$objectOneOf1Serializer = _$ObjectOneOf1Serializer();
Serializer<MixedOneOf1> _$mixedOneOf1Serializer = _$MixedOneOf1Serializer();
Serializer<OneObjectOneOf0> _$oneObjectOneOf0Serializer = _$OneObjectOneOf0Serializer();

class _$ObjectOneOf0Serializer implements StructuredSerializer<ObjectOneOf0> {
  @override
  final Iterable<Type> types = const [ObjectOneOf0, _$ObjectOneOf0];
  @override
  final String wireName = 'ObjectOneOf0';

  @override
  Iterable<Object?> serialize(Serializers serializers, ObjectOneOf0 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute1-oneOf',
      serializers.serialize(object.attribute1OneOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ObjectOneOf0 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ObjectOneOf0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute1-oneOf':
          result.attribute1OneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ObjectOneOf1Serializer implements StructuredSerializer<ObjectOneOf1> {
  @override
  final Iterable<Type> types = const [ObjectOneOf1, _$ObjectOneOf1];
  @override
  final String wireName = 'ObjectOneOf1';

  @override
  Iterable<Object?> serialize(Serializers serializers, ObjectOneOf1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute2-oneOf',
      serializers.serialize(object.attribute2OneOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ObjectOneOf1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ObjectOneOf1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute2-oneOf':
          result.attribute2OneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MixedOneOf1Serializer implements StructuredSerializer<MixedOneOf1> {
  @override
  final Iterable<Type> types = const [MixedOneOf1, _$MixedOneOf1];
  @override
  final String wireName = 'MixedOneOf1';

  @override
  Iterable<Object?> serialize(Serializers serializers, MixedOneOf1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-oneOf',
      serializers.serialize(object.attributeOneOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MixedOneOf1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MixedOneOf1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute-oneOf':
          result.attributeOneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OneObjectOneOf0Serializer implements StructuredSerializer<OneObjectOneOf0> {
  @override
  final Iterable<Type> types = const [OneObjectOneOf0, _$OneObjectOneOf0];
  @override
  final String wireName = 'OneObjectOneOf0';

  @override
  Iterable<Object?> serialize(Serializers serializers, OneObjectOneOf0 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-oneOf',
      serializers.serialize(object.attributeOneOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OneObjectOneOf0 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = OneObjectOneOf0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute-oneOf':
          result.attributeOneOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class ObjectOneOf0InterfaceBuilder {
  void replace(ObjectOneOf0Interface other);
  void update(void Function(ObjectOneOf0InterfaceBuilder) updates);
  String? get attribute1OneOf;
  set attribute1OneOf(String? attribute1OneOf);
}

class _$ObjectOneOf0 extends ObjectOneOf0 {
  @override
  final String attribute1OneOf;

  factory _$ObjectOneOf0([void Function(ObjectOneOf0Builder)? updates]) =>
      (ObjectOneOf0Builder()..update(updates))._build();

  _$ObjectOneOf0._({required this.attribute1OneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute1OneOf, r'ObjectOneOf0', 'attribute1OneOf');
  }

  @override
  ObjectOneOf0 rebuild(void Function(ObjectOneOf0Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectOneOf0Builder toBuilder() => ObjectOneOf0Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectOneOf0 && attribute1OneOf == other.attribute1OneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute1OneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectOneOf0')..add('attribute1OneOf', attribute1OneOf)).toString();
  }
}

class ObjectOneOf0Builder implements Builder<ObjectOneOf0, ObjectOneOf0Builder>, ObjectOneOf0InterfaceBuilder {
  _$ObjectOneOf0? _$v;

  String? _attribute1OneOf;
  String? get attribute1OneOf => _$this._attribute1OneOf;
  set attribute1OneOf(covariant String? attribute1OneOf) => _$this._attribute1OneOf = attribute1OneOf;

  ObjectOneOf0Builder();

  ObjectOneOf0Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute1OneOf = $v.attribute1OneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectOneOf0 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectOneOf0;
  }

  @override
  void update(void Function(ObjectOneOf0Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectOneOf0 build() => _build();

  _$ObjectOneOf0 _build() {
    final _$result = _$v ??
        _$ObjectOneOf0._(
            attribute1OneOf:
                BuiltValueNullFieldError.checkNotNull(attribute1OneOf, r'ObjectOneOf0', 'attribute1OneOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ObjectOneOf1InterfaceBuilder {
  void replace(ObjectOneOf1Interface other);
  void update(void Function(ObjectOneOf1InterfaceBuilder) updates);
  String? get attribute2OneOf;
  set attribute2OneOf(String? attribute2OneOf);
}

class _$ObjectOneOf1 extends ObjectOneOf1 {
  @override
  final String attribute2OneOf;

  factory _$ObjectOneOf1([void Function(ObjectOneOf1Builder)? updates]) =>
      (ObjectOneOf1Builder()..update(updates))._build();

  _$ObjectOneOf1._({required this.attribute2OneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute2OneOf, r'ObjectOneOf1', 'attribute2OneOf');
  }

  @override
  ObjectOneOf1 rebuild(void Function(ObjectOneOf1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectOneOf1Builder toBuilder() => ObjectOneOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectOneOf1 && attribute2OneOf == other.attribute2OneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute2OneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectOneOf1')..add('attribute2OneOf', attribute2OneOf)).toString();
  }
}

class ObjectOneOf1Builder implements Builder<ObjectOneOf1, ObjectOneOf1Builder>, ObjectOneOf1InterfaceBuilder {
  _$ObjectOneOf1? _$v;

  String? _attribute2OneOf;
  String? get attribute2OneOf => _$this._attribute2OneOf;
  set attribute2OneOf(covariant String? attribute2OneOf) => _$this._attribute2OneOf = attribute2OneOf;

  ObjectOneOf1Builder();

  ObjectOneOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute2OneOf = $v.attribute2OneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectOneOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectOneOf1;
  }

  @override
  void update(void Function(ObjectOneOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectOneOf1 build() => _build();

  _$ObjectOneOf1 _build() {
    final _$result = _$v ??
        _$ObjectOneOf1._(
            attribute2OneOf:
                BuiltValueNullFieldError.checkNotNull(attribute2OneOf, r'ObjectOneOf1', 'attribute2OneOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ObjectOneOfInterfaceBuilder {
  void replace(ObjectOneOfInterface other);
  void update(void Function(ObjectOneOfInterfaceBuilder) updates);
  ObjectOneOf0Builder get objectOneOf0;
  set objectOneOf0(ObjectOneOf0Builder? objectOneOf0);

  ObjectOneOf1Builder get objectOneOf1;
  set objectOneOf1(ObjectOneOf1Builder? objectOneOf1);
}

class _$ObjectOneOf extends ObjectOneOf {
  @override
  final JsonObject data;
  @override
  final ObjectOneOf0? objectOneOf0;
  @override
  final ObjectOneOf1? objectOneOf1;

  factory _$ObjectOneOf([void Function(ObjectOneOfBuilder)? updates]) =>
      (ObjectOneOfBuilder()..update(updates))._build();

  _$ObjectOneOf._({required this.data, this.objectOneOf0, this.objectOneOf1}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'ObjectOneOf', 'data');
  }

  @override
  ObjectOneOf rebuild(void Function(ObjectOneOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectOneOfBuilder toBuilder() => ObjectOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectOneOf &&
        data == other.data &&
        objectOneOf0 == other.objectOneOf0 &&
        objectOneOf1 == other.objectOneOf1;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, objectOneOf0.hashCode);
    _$hash = $jc(_$hash, objectOneOf1.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectOneOf')
          ..add('data', data)
          ..add('objectOneOf0', objectOneOf0)
          ..add('objectOneOf1', objectOneOf1))
        .toString();
  }
}

class ObjectOneOfBuilder implements Builder<ObjectOneOf, ObjectOneOfBuilder>, ObjectOneOfInterfaceBuilder {
  _$ObjectOneOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ObjectOneOf0Builder? _objectOneOf0;
  ObjectOneOf0Builder get objectOneOf0 => _$this._objectOneOf0 ??= ObjectOneOf0Builder();
  set objectOneOf0(covariant ObjectOneOf0Builder? objectOneOf0) => _$this._objectOneOf0 = objectOneOf0;

  ObjectOneOf1Builder? _objectOneOf1;
  ObjectOneOf1Builder get objectOneOf1 => _$this._objectOneOf1 ??= ObjectOneOf1Builder();
  set objectOneOf1(covariant ObjectOneOf1Builder? objectOneOf1) => _$this._objectOneOf1 = objectOneOf1;

  ObjectOneOfBuilder();

  ObjectOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _objectOneOf0 = $v.objectOneOf0?.toBuilder();
      _objectOneOf1 = $v.objectOneOf1?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectOneOf;
  }

  @override
  void update(void Function(ObjectOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectOneOf build() => _build();

  _$ObjectOneOf _build() {
    ObjectOneOf._validate(this);
    _$ObjectOneOf _$result;
    try {
      _$result = _$v ??
          _$ObjectOneOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'ObjectOneOf', 'data'),
              objectOneOf0: _objectOneOf0?.build(),
              objectOneOf1: _objectOneOf1?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'objectOneOf0';
        _objectOneOf0?.build();
        _$failedField = 'objectOneOf1';
        _objectOneOf1?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ObjectOneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class MixedOneOf1InterfaceBuilder {
  void replace(MixedOneOf1Interface other);
  void update(void Function(MixedOneOf1InterfaceBuilder) updates);
  String? get attributeOneOf;
  set attributeOneOf(String? attributeOneOf);
}

class _$MixedOneOf1 extends MixedOneOf1 {
  @override
  final String attributeOneOf;

  factory _$MixedOneOf1([void Function(MixedOneOf1Builder)? updates]) =>
      (MixedOneOf1Builder()..update(updates))._build();

  _$MixedOneOf1._({required this.attributeOneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeOneOf, r'MixedOneOf1', 'attributeOneOf');
  }

  @override
  MixedOneOf1 rebuild(void Function(MixedOneOf1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  MixedOneOf1Builder toBuilder() => MixedOneOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MixedOneOf1 && attributeOneOf == other.attributeOneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeOneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MixedOneOf1')..add('attributeOneOf', attributeOneOf)).toString();
  }
}

class MixedOneOf1Builder implements Builder<MixedOneOf1, MixedOneOf1Builder>, MixedOneOf1InterfaceBuilder {
  _$MixedOneOf1? _$v;

  String? _attributeOneOf;
  String? get attributeOneOf => _$this._attributeOneOf;
  set attributeOneOf(covariant String? attributeOneOf) => _$this._attributeOneOf = attributeOneOf;

  MixedOneOf1Builder();

  MixedOneOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeOneOf = $v.attributeOneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MixedOneOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MixedOneOf1;
  }

  @override
  void update(void Function(MixedOneOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MixedOneOf1 build() => _build();

  _$MixedOneOf1 _build() {
    final _$result = _$v ??
        _$MixedOneOf1._(
            attributeOneOf: BuiltValueNullFieldError.checkNotNull(attributeOneOf, r'MixedOneOf1', 'attributeOneOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class MixedOneOfInterfaceBuilder {
  void replace(MixedOneOfInterface other);
  void update(void Function(MixedOneOfInterfaceBuilder) updates);
  String? get string;
  set string(String? string);

  MixedOneOf1Builder get mixedOneOf1;
  set mixedOneOf1(MixedOneOf1Builder? mixedOneOf1);
}

class _$MixedOneOf extends MixedOneOf {
  @override
  final JsonObject data;
  @override
  final String? string;
  @override
  final MixedOneOf1? mixedOneOf1;

  factory _$MixedOneOf([void Function(MixedOneOfBuilder)? updates]) => (MixedOneOfBuilder()..update(updates))._build();

  _$MixedOneOf._({required this.data, this.string, this.mixedOneOf1}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'MixedOneOf', 'data');
  }

  @override
  MixedOneOf rebuild(void Function(MixedOneOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  MixedOneOfBuilder toBuilder() => MixedOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MixedOneOf && data == other.data && string == other.string && mixedOneOf1 == other.mixedOneOf1;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, mixedOneOf1.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MixedOneOf')
          ..add('data', data)
          ..add('string', string)
          ..add('mixedOneOf1', mixedOneOf1))
        .toString();
  }
}

class MixedOneOfBuilder implements Builder<MixedOneOf, MixedOneOfBuilder>, MixedOneOfInterfaceBuilder {
  _$MixedOneOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  MixedOneOf1Builder? _mixedOneOf1;
  MixedOneOf1Builder get mixedOneOf1 => _$this._mixedOneOf1 ??= MixedOneOf1Builder();
  set mixedOneOf1(covariant MixedOneOf1Builder? mixedOneOf1) => _$this._mixedOneOf1 = mixedOneOf1;

  MixedOneOfBuilder();

  MixedOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _string = $v.string;
      _mixedOneOf1 = $v.mixedOneOf1?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MixedOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MixedOneOf;
  }

  @override
  void update(void Function(MixedOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MixedOneOf build() => _build();

  _$MixedOneOf _build() {
    MixedOneOf._validate(this);
    _$MixedOneOf _$result;
    try {
      _$result = _$v ??
          _$MixedOneOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'MixedOneOf', 'data'),
              string: string,
              mixedOneOf1: _mixedOneOf1?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mixedOneOf1';
        _mixedOneOf1?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'MixedOneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OneObjectOneOf0InterfaceBuilder {
  void replace(OneObjectOneOf0Interface other);
  void update(void Function(OneObjectOneOf0InterfaceBuilder) updates);
  String? get attributeOneOf;
  set attributeOneOf(String? attributeOneOf);
}

class _$OneObjectOneOf0 extends OneObjectOneOf0 {
  @override
  final String attributeOneOf;

  factory _$OneObjectOneOf0([void Function(OneObjectOneOf0Builder)? updates]) =>
      (OneObjectOneOf0Builder()..update(updates))._build();

  _$OneObjectOneOf0._({required this.attributeOneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeOneOf, r'OneObjectOneOf0', 'attributeOneOf');
  }

  @override
  OneObjectOneOf0 rebuild(void Function(OneObjectOneOf0Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneObjectOneOf0Builder toBuilder() => OneObjectOneOf0Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneObjectOneOf0 && attributeOneOf == other.attributeOneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeOneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneObjectOneOf0')..add('attributeOneOf', attributeOneOf)).toString();
  }
}

class OneObjectOneOf0Builder
    implements Builder<OneObjectOneOf0, OneObjectOneOf0Builder>, OneObjectOneOf0InterfaceBuilder {
  _$OneObjectOneOf0? _$v;

  String? _attributeOneOf;
  String? get attributeOneOf => _$this._attributeOneOf;
  set attributeOneOf(covariant String? attributeOneOf) => _$this._attributeOneOf = attributeOneOf;

  OneObjectOneOf0Builder();

  OneObjectOneOf0Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeOneOf = $v.attributeOneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneObjectOneOf0 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneObjectOneOf0;
  }

  @override
  void update(void Function(OneObjectOneOf0Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneObjectOneOf0 build() => _build();

  _$OneObjectOneOf0 _build() {
    final _$result = _$v ??
        _$OneObjectOneOf0._(
            attributeOneOf:
                BuiltValueNullFieldError.checkNotNull(attributeOneOf, r'OneObjectOneOf0', 'attributeOneOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OneObjectOneOfInterfaceBuilder {
  void replace(OneObjectOneOfInterface other);
  void update(void Function(OneObjectOneOfInterfaceBuilder) updates);
  OneObjectOneOf0Builder get oneObjectOneOf0;
  set oneObjectOneOf0(OneObjectOneOf0Builder? oneObjectOneOf0);
}

class _$OneObjectOneOf extends OneObjectOneOf {
  @override
  final JsonObject data;
  @override
  final OneObjectOneOf0? oneObjectOneOf0;

  factory _$OneObjectOneOf([void Function(OneObjectOneOfBuilder)? updates]) =>
      (OneObjectOneOfBuilder()..update(updates))._build();

  _$OneObjectOneOf._({required this.data, this.oneObjectOneOf0}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneObjectOneOf', 'data');
  }

  @override
  OneObjectOneOf rebuild(void Function(OneObjectOneOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneObjectOneOfBuilder toBuilder() => OneObjectOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneObjectOneOf && data == other.data && oneObjectOneOf0 == other.oneObjectOneOf0;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, oneObjectOneOf0.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneObjectOneOf')
          ..add('data', data)
          ..add('oneObjectOneOf0', oneObjectOneOf0))
        .toString();
  }
}

class OneObjectOneOfBuilder implements Builder<OneObjectOneOf, OneObjectOneOfBuilder>, OneObjectOneOfInterfaceBuilder {
  _$OneObjectOneOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  OneObjectOneOf0Builder? _oneObjectOneOf0;
  OneObjectOneOf0Builder get oneObjectOneOf0 => _$this._oneObjectOneOf0 ??= OneObjectOneOf0Builder();
  set oneObjectOneOf0(covariant OneObjectOneOf0Builder? oneObjectOneOf0) => _$this._oneObjectOneOf0 = oneObjectOneOf0;

  OneObjectOneOfBuilder();

  OneObjectOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _oneObjectOneOf0 = $v.oneObjectOneOf0?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneObjectOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneObjectOneOf;
  }

  @override
  void update(void Function(OneObjectOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneObjectOneOf build() => _build();

  _$OneObjectOneOf _build() {
    OneObjectOneOf._validate(this);
    _$OneObjectOneOf _$result;
    try {
      _$result = _$v ??
          _$OneObjectOneOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'OneObjectOneOf', 'data'),
              oneObjectOneOf0: _oneObjectOneOf0?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneObjectOneOf0';
        _oneObjectOneOf0?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OneObjectOneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OneValueOneOfInterfaceBuilder {
  void replace(OneValueOneOfInterface other);
  void update(void Function(OneValueOneOfInterfaceBuilder) updates);
  String? get string;
  set string(String? string);
}

class _$OneValueOneOf extends OneValueOneOf {
  @override
  final JsonObject data;
  @override
  final String? string;

  factory _$OneValueOneOf([void Function(OneValueOneOfBuilder)? updates]) =>
      (OneValueOneOfBuilder()..update(updates))._build();

  _$OneValueOneOf._({required this.data, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneValueOneOf', 'data');
  }

  @override
  OneValueOneOf rebuild(void Function(OneValueOneOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneValueOneOfBuilder toBuilder() => OneValueOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneValueOneOf && data == other.data && string == other.string;
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
    return (newBuiltValueToStringHelper(r'OneValueOneOf')
          ..add('data', data)
          ..add('string', string))
        .toString();
  }
}

class OneValueOneOfBuilder implements Builder<OneValueOneOf, OneValueOneOfBuilder>, OneValueOneOfInterfaceBuilder {
  _$OneValueOneOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  OneValueOneOfBuilder();

  OneValueOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneValueOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneValueOneOf;
  }

  @override
  void update(void Function(OneValueOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneValueOneOf build() => _build();

  _$OneValueOneOf _build() {
    OneValueOneOf._validate(this);
    final _$result = _$v ??
        _$OneValueOneOf._(data: BuiltValueNullFieldError.checkNotNull(data, r'OneValueOneOf', 'data'), string: string);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OneOfIntDoubleInterfaceBuilder {
  void replace(OneOfIntDoubleInterface other);
  void update(void Function(OneOfIntDoubleInterfaceBuilder) updates);
  int? get $int;
  set $int(int? $int);

  double? get $double;
  set $double(double? $double);
}

class _$OneOfIntDouble extends OneOfIntDouble {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final double? $double;

  factory _$OneOfIntDouble([void Function(OneOfIntDoubleBuilder)? updates]) =>
      (OneOfIntDoubleBuilder()..update(updates))._build();

  _$OneOfIntDouble._({required this.data, this.$int, this.$double}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneOfIntDouble', 'data');
  }

  @override
  OneOfIntDouble rebuild(void Function(OneOfIntDoubleBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneOfIntDoubleBuilder toBuilder() => OneOfIntDoubleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneOfIntDouble && data == other.data && $int == other.$int && $double == other.$double;
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
    return (newBuiltValueToStringHelper(r'OneOfIntDouble')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('\$double', $double))
        .toString();
  }
}

class OneOfIntDoubleBuilder implements Builder<OneOfIntDouble, OneOfIntDoubleBuilder>, OneOfIntDoubleInterfaceBuilder {
  _$OneOfIntDouble? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(covariant int? $int) => _$this._$int = $int;

  double? _$double;
  double? get $double => _$this._$double;
  set $double(covariant double? $double) => _$this._$double = $double;

  OneOfIntDoubleBuilder();

  OneOfIntDoubleBuilder get _$this {
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
  void replace(covariant OneOfIntDouble other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneOfIntDouble;
  }

  @override
  void update(void Function(OneOfIntDoubleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneOfIntDouble build() => _build();

  _$OneOfIntDouble _build() {
    OneOfIntDouble._validate(this);
    final _$result = _$v ??
        _$OneOfIntDouble._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'OneOfIntDouble', 'data'), $int: $int, $double: $double);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OneOfIntDoubleOtherInterfaceBuilder {
  void replace(OneOfIntDoubleOtherInterface other);
  void update(void Function(OneOfIntDoubleOtherInterfaceBuilder) updates);
  int? get $int;
  set $int(int? $int);

  double? get $double;
  set $double(double? $double);

  String? get string;
  set string(String? string);
}

class _$OneOfIntDoubleOther extends OneOfIntDoubleOther {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final double? $double;
  @override
  final String? string;

  factory _$OneOfIntDoubleOther([void Function(OneOfIntDoubleOtherBuilder)? updates]) =>
      (OneOfIntDoubleOtherBuilder()..update(updates))._build();

  _$OneOfIntDoubleOther._({required this.data, this.$int, this.$double, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneOfIntDoubleOther', 'data');
  }

  @override
  OneOfIntDoubleOther rebuild(void Function(OneOfIntDoubleOtherBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OneOfIntDoubleOtherBuilder toBuilder() => OneOfIntDoubleOtherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneOfIntDoubleOther &&
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
    return (newBuiltValueToStringHelper(r'OneOfIntDoubleOther')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('\$double', $double)
          ..add('string', string))
        .toString();
  }
}

class OneOfIntDoubleOtherBuilder
    implements Builder<OneOfIntDoubleOther, OneOfIntDoubleOtherBuilder>, OneOfIntDoubleOtherInterfaceBuilder {
  _$OneOfIntDoubleOther? _$v;

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

  OneOfIntDoubleOtherBuilder();

  OneOfIntDoubleOtherBuilder get _$this {
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
  void replace(covariant OneOfIntDoubleOther other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneOfIntDoubleOther;
  }

  @override
  void update(void Function(OneOfIntDoubleOtherBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneOfIntDoubleOther build() => _build();

  _$OneOfIntDoubleOther _build() {
    OneOfIntDoubleOther._validate(this);
    final _$result = _$v ??
        _$OneOfIntDoubleOther._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'OneOfIntDoubleOther', 'data'),
            $int: $int,
            $double: $double,
            string: string);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
