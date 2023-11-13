// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_ofs.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Base> _$baseSerializer = _$BaseSerializer();
Serializer<BaseAllOf> _$baseAllOfSerializer = _$BaseAllOfSerializer();
Serializer<BaseOneOf1> _$baseOneOf1Serializer = _$BaseOneOf1Serializer();
Serializer<BaseAnyOf1> _$baseAnyOf1Serializer = _$BaseAnyOf1Serializer();
Serializer<BaseNestedAllOf> _$baseNestedAllOfSerializer = _$BaseNestedAllOfSerializer();
Serializer<BaseNestedOneOf3> _$baseNestedOneOf3Serializer = _$BaseNestedOneOf3Serializer();
Serializer<BaseNestedAnyOf3> _$baseNestedAnyOf3Serializer = _$BaseNestedAnyOf3Serializer();

class _$BaseSerializer implements StructuredSerializer<Base> {
  @override
  final Iterable<Type> types = const [Base, _$Base];
  @override
  final String wireName = 'Base';

  @override
  Iterable<Object?> serialize(Serializers serializers, Base object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute',
      serializers.serialize(object.attribute, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Base deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BaseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute':
          result.attribute = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BaseAllOfSerializer implements StructuredSerializer<BaseAllOf> {
  @override
  final Iterable<Type> types = const [BaseAllOf, _$BaseAllOf];
  @override
  final String wireName = 'BaseAllOf';

  @override
  Iterable<Object?> serialize(Serializers serializers, BaseAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute',
      serializers.serialize(object.attribute, specifiedType: const FullType(String)),
      'attribute-allOf',
      serializers.serialize(object.attributeAllOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BaseAllOf deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BaseAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute':
          result.attribute = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'attribute-allOf':
          result.attributeAllOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BaseOneOf1Serializer implements StructuredSerializer<BaseOneOf1> {
  @override
  final Iterable<Type> types = const [BaseOneOf1, _$BaseOneOf1];
  @override
  final String wireName = 'BaseOneOf1';

  @override
  Iterable<Object?> serialize(Serializers serializers, BaseOneOf1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-oneOf',
      serializers.serialize(object.attributeOneOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BaseOneOf1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BaseOneOf1Builder();

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

class _$BaseAnyOf1Serializer implements StructuredSerializer<BaseAnyOf1> {
  @override
  final Iterable<Type> types = const [BaseAnyOf1, _$BaseAnyOf1];
  @override
  final String wireName = 'BaseAnyOf1';

  @override
  Iterable<Object?> serialize(Serializers serializers, BaseAnyOf1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-anyOf',
      serializers.serialize(object.attributeAnyOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BaseAnyOf1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BaseAnyOf1Builder();

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

class _$BaseNestedAllOfSerializer implements StructuredSerializer<BaseNestedAllOf> {
  @override
  final Iterable<Type> types = const [BaseNestedAllOf, _$BaseNestedAllOf];
  @override
  final String wireName = 'BaseNestedAllOf';

  @override
  Iterable<Object?> serialize(Serializers serializers, BaseNestedAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute',
      serializers.serialize(object.attribute, specifiedType: const FullType(String)),
      'attribute-allOf',
      serializers.serialize(object.attributeAllOf, specifiedType: const FullType(String)),
      'attribute-nested-allOf',
      serializers.serialize(object.attributeNestedAllOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BaseNestedAllOf deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BaseNestedAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute':
          result.attribute = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'attribute-allOf':
          result.attributeAllOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'attribute-nested-allOf':
          result.attributeNestedAllOf =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BaseNestedOneOf3Serializer implements StructuredSerializer<BaseNestedOneOf3> {
  @override
  final Iterable<Type> types = const [BaseNestedOneOf3, _$BaseNestedOneOf3];
  @override
  final String wireName = 'BaseNestedOneOf3';

  @override
  Iterable<Object?> serialize(Serializers serializers, BaseNestedOneOf3 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-nested-oneOf',
      serializers.serialize(object.attributeNestedOneOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BaseNestedOneOf3 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BaseNestedOneOf3Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute-nested-oneOf':
          result.attributeNestedOneOf =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BaseNestedAnyOf3Serializer implements StructuredSerializer<BaseNestedAnyOf3> {
  @override
  final Iterable<Type> types = const [BaseNestedAnyOf3, _$BaseNestedAnyOf3];
  @override
  final String wireName = 'BaseNestedAnyOf3';

  @override
  Iterable<Object?> serialize(Serializers serializers, BaseNestedAnyOf3 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-nested-anyOf',
      serializers.serialize(object.attributeNestedAnyOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BaseNestedAnyOf3 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BaseNestedAnyOf3Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute-nested-anyOf':
          result.attributeNestedAnyOf =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class BaseInterfaceBuilder {
  void replace(BaseInterface other);
  void update(void Function(BaseInterfaceBuilder) updates);
  String? get attribute;
  set attribute(String? attribute);
}

class _$Base extends Base {
  @override
  final String attribute;

  factory _$Base([void Function(BaseBuilder)? updates]) => (BaseBuilder()..update(updates))._build();

  _$Base._({required this.attribute}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute, r'Base', 'attribute');
  }

  @override
  Base rebuild(void Function(BaseBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseBuilder toBuilder() => BaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Base && attribute == other.attribute;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Base')..add('attribute', attribute)).toString();
  }
}

class BaseBuilder implements Builder<Base, BaseBuilder>, BaseInterfaceBuilder {
  _$Base? _$v;

  String? _attribute;
  String? get attribute => _$this._attribute;
  set attribute(covariant String? attribute) => _$this._attribute = attribute;

  BaseBuilder();

  BaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute = $v.attribute;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Base;
  }

  @override
  void update(void Function(BaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Base build() => _build();

  _$Base _build() {
    final _$result = _$v ?? _$Base._(attribute: BuiltValueNullFieldError.checkNotNull(attribute, r'Base', 'attribute'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseAllOf_1InterfaceBuilder {
  void replace(BaseAllOf_1Interface other);
  void update(void Function(BaseAllOf_1InterfaceBuilder) updates);
  String? get attributeAllOf;
  set attributeAllOf(String? attributeAllOf);
}

abstract mixin class BaseAllOfInterfaceBuilder implements BaseInterfaceBuilder, BaseAllOf_1InterfaceBuilder {
  void replace(covariant BaseAllOfInterface other);
  void update(void Function(BaseAllOfInterfaceBuilder) updates);
  String? get attribute;
  set attribute(covariant String? attribute);

  String? get attributeAllOf;
  set attributeAllOf(covariant String? attributeAllOf);
}

class _$BaseAllOf extends BaseAllOf {
  @override
  final String attribute;
  @override
  final String attributeAllOf;

  factory _$BaseAllOf([void Function(BaseAllOfBuilder)? updates]) => (BaseAllOfBuilder()..update(updates))._build();

  _$BaseAllOf._({required this.attribute, required this.attributeAllOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute, r'BaseAllOf', 'attribute');
    BuiltValueNullFieldError.checkNotNull(attributeAllOf, r'BaseAllOf', 'attributeAllOf');
  }

  @override
  BaseAllOf rebuild(void Function(BaseAllOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseAllOfBuilder toBuilder() => BaseAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseAllOf && attribute == other.attribute && attributeAllOf == other.attributeAllOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute.hashCode);
    _$hash = $jc(_$hash, attributeAllOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseAllOf')
          ..add('attribute', attribute)
          ..add('attributeAllOf', attributeAllOf))
        .toString();
  }
}

class BaseAllOfBuilder implements Builder<BaseAllOf, BaseAllOfBuilder>, BaseAllOfInterfaceBuilder {
  _$BaseAllOf? _$v;

  String? _attribute;
  String? get attribute => _$this._attribute;
  set attribute(covariant String? attribute) => _$this._attribute = attribute;

  String? _attributeAllOf;
  String? get attributeAllOf => _$this._attributeAllOf;
  set attributeAllOf(covariant String? attributeAllOf) => _$this._attributeAllOf = attributeAllOf;

  BaseAllOfBuilder();

  BaseAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute = $v.attribute;
      _attributeAllOf = $v.attributeAllOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseAllOf;
  }

  @override
  void update(void Function(BaseAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseAllOf build() => _build();

  _$BaseAllOf _build() {
    final _$result = _$v ??
        _$BaseAllOf._(
            attribute: BuiltValueNullFieldError.checkNotNull(attribute, r'BaseAllOf', 'attribute'),
            attributeAllOf: BuiltValueNullFieldError.checkNotNull(attributeAllOf, r'BaseAllOf', 'attributeAllOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseOneOf1InterfaceBuilder {
  void replace(BaseOneOf1Interface other);
  void update(void Function(BaseOneOf1InterfaceBuilder) updates);
  String? get attributeOneOf;
  set attributeOneOf(String? attributeOneOf);
}

class _$BaseOneOf1 extends BaseOneOf1 {
  @override
  final String attributeOneOf;

  factory _$BaseOneOf1([void Function(BaseOneOf1Builder)? updates]) => (BaseOneOf1Builder()..update(updates))._build();

  _$BaseOneOf1._({required this.attributeOneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeOneOf, r'BaseOneOf1', 'attributeOneOf');
  }

  @override
  BaseOneOf1 rebuild(void Function(BaseOneOf1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseOneOf1Builder toBuilder() => BaseOneOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseOneOf1 && attributeOneOf == other.attributeOneOf;
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
    return (newBuiltValueToStringHelper(r'BaseOneOf1')..add('attributeOneOf', attributeOneOf)).toString();
  }
}

class BaseOneOf1Builder implements Builder<BaseOneOf1, BaseOneOf1Builder>, BaseOneOf1InterfaceBuilder {
  _$BaseOneOf1? _$v;

  String? _attributeOneOf;
  String? get attributeOneOf => _$this._attributeOneOf;
  set attributeOneOf(covariant String? attributeOneOf) => _$this._attributeOneOf = attributeOneOf;

  BaseOneOf1Builder();

  BaseOneOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeOneOf = $v.attributeOneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseOneOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseOneOf1;
  }

  @override
  void update(void Function(BaseOneOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseOneOf1 build() => _build();

  _$BaseOneOf1 _build() {
    final _$result = _$v ??
        _$BaseOneOf1._(
            attributeOneOf: BuiltValueNullFieldError.checkNotNull(attributeOneOf, r'BaseOneOf1', 'attributeOneOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseOneOfInterfaceBuilder {
  void replace(BaseOneOfInterface other);
  void update(void Function(BaseOneOfInterfaceBuilder) updates);
  BaseBuilder get base;
  set base(BaseBuilder? base);

  BaseOneOf1Builder get baseOneOf1;
  set baseOneOf1(BaseOneOf1Builder? baseOneOf1);
}

class _$BaseOneOf extends BaseOneOf {
  @override
  final JsonObject data;
  @override
  final Base? base;
  @override
  final BaseOneOf1? baseOneOf1;

  factory _$BaseOneOf([void Function(BaseOneOfBuilder)? updates]) => (BaseOneOfBuilder()..update(updates))._build();

  _$BaseOneOf._({required this.data, this.base, this.baseOneOf1}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'BaseOneOf', 'data');
  }

  @override
  BaseOneOf rebuild(void Function(BaseOneOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseOneOfBuilder toBuilder() => BaseOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseOneOf && data == other.data && base == other.base && baseOneOf1 == other.baseOneOf1;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, base.hashCode);
    _$hash = $jc(_$hash, baseOneOf1.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseOneOf')
          ..add('data', data)
          ..add('base', base)
          ..add('baseOneOf1', baseOneOf1))
        .toString();
  }
}

class BaseOneOfBuilder implements Builder<BaseOneOf, BaseOneOfBuilder>, BaseOneOfInterfaceBuilder {
  _$BaseOneOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  BaseBuilder? _base;
  BaseBuilder get base => _$this._base ??= BaseBuilder();
  set base(covariant BaseBuilder? base) => _$this._base = base;

  BaseOneOf1Builder? _baseOneOf1;
  BaseOneOf1Builder get baseOneOf1 => _$this._baseOneOf1 ??= BaseOneOf1Builder();
  set baseOneOf1(covariant BaseOneOf1Builder? baseOneOf1) => _$this._baseOneOf1 = baseOneOf1;

  BaseOneOfBuilder();

  BaseOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _base = $v.base?.toBuilder();
      _baseOneOf1 = $v.baseOneOf1?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseOneOf;
  }

  @override
  void update(void Function(BaseOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseOneOf build() => _build();

  _$BaseOneOf _build() {
    BaseOneOf._validate(this);
    _$BaseOneOf _$result;
    try {
      _$result = _$v ??
          _$BaseOneOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'BaseOneOf', 'data'),
              base: _base?.build(),
              baseOneOf1: _baseOneOf1?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'base';
        _base?.build();
        _$failedField = 'baseOneOf1';
        _baseOneOf1?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'BaseOneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseAnyOf1InterfaceBuilder {
  void replace(BaseAnyOf1Interface other);
  void update(void Function(BaseAnyOf1InterfaceBuilder) updates);
  String? get attributeAnyOf;
  set attributeAnyOf(String? attributeAnyOf);
}

class _$BaseAnyOf1 extends BaseAnyOf1 {
  @override
  final String attributeAnyOf;

  factory _$BaseAnyOf1([void Function(BaseAnyOf1Builder)? updates]) => (BaseAnyOf1Builder()..update(updates))._build();

  _$BaseAnyOf1._({required this.attributeAnyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeAnyOf, r'BaseAnyOf1', 'attributeAnyOf');
  }

  @override
  BaseAnyOf1 rebuild(void Function(BaseAnyOf1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseAnyOf1Builder toBuilder() => BaseAnyOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseAnyOf1 && attributeAnyOf == other.attributeAnyOf;
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
    return (newBuiltValueToStringHelper(r'BaseAnyOf1')..add('attributeAnyOf', attributeAnyOf)).toString();
  }
}

class BaseAnyOf1Builder implements Builder<BaseAnyOf1, BaseAnyOf1Builder>, BaseAnyOf1InterfaceBuilder {
  _$BaseAnyOf1? _$v;

  String? _attributeAnyOf;
  String? get attributeAnyOf => _$this._attributeAnyOf;
  set attributeAnyOf(covariant String? attributeAnyOf) => _$this._attributeAnyOf = attributeAnyOf;

  BaseAnyOf1Builder();

  BaseAnyOf1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeAnyOf = $v.attributeAnyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseAnyOf1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseAnyOf1;
  }

  @override
  void update(void Function(BaseAnyOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseAnyOf1 build() => _build();

  _$BaseAnyOf1 _build() {
    final _$result = _$v ??
        _$BaseAnyOf1._(
            attributeAnyOf: BuiltValueNullFieldError.checkNotNull(attributeAnyOf, r'BaseAnyOf1', 'attributeAnyOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseAnyOfInterfaceBuilder {
  void replace(BaseAnyOfInterface other);
  void update(void Function(BaseAnyOfInterfaceBuilder) updates);
  BaseBuilder get base;
  set base(BaseBuilder? base);

  BaseAnyOf1Builder get baseAnyOf1;
  set baseAnyOf1(BaseAnyOf1Builder? baseAnyOf1);
}

class _$BaseAnyOf extends BaseAnyOf {
  @override
  final JsonObject data;
  @override
  final Base? base;
  @override
  final BaseAnyOf1? baseAnyOf1;

  factory _$BaseAnyOf([void Function(BaseAnyOfBuilder)? updates]) => (BaseAnyOfBuilder()..update(updates))._build();

  _$BaseAnyOf._({required this.data, this.base, this.baseAnyOf1}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'BaseAnyOf', 'data');
  }

  @override
  BaseAnyOf rebuild(void Function(BaseAnyOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseAnyOfBuilder toBuilder() => BaseAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseAnyOf && data == other.data && base == other.base && baseAnyOf1 == other.baseAnyOf1;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, base.hashCode);
    _$hash = $jc(_$hash, baseAnyOf1.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseAnyOf')
          ..add('data', data)
          ..add('base', base)
          ..add('baseAnyOf1', baseAnyOf1))
        .toString();
  }
}

class BaseAnyOfBuilder implements Builder<BaseAnyOf, BaseAnyOfBuilder>, BaseAnyOfInterfaceBuilder {
  _$BaseAnyOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  BaseBuilder? _base;
  BaseBuilder get base => _$this._base ??= BaseBuilder();
  set base(covariant BaseBuilder? base) => _$this._base = base;

  BaseAnyOf1Builder? _baseAnyOf1;
  BaseAnyOf1Builder get baseAnyOf1 => _$this._baseAnyOf1 ??= BaseAnyOf1Builder();
  set baseAnyOf1(covariant BaseAnyOf1Builder? baseAnyOf1) => _$this._baseAnyOf1 = baseAnyOf1;

  BaseAnyOfBuilder();

  BaseAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _base = $v.base?.toBuilder();
      _baseAnyOf1 = $v.baseAnyOf1?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseAnyOf;
  }

  @override
  void update(void Function(BaseAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseAnyOf build() => _build();

  _$BaseAnyOf _build() {
    BaseAnyOf._validate(this);
    _$BaseAnyOf _$result;
    try {
      _$result = _$v ??
          _$BaseAnyOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'BaseAnyOf', 'data'),
              base: _base?.build(),
              baseAnyOf1: _baseAnyOf1?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'base';
        _base?.build();
        _$failedField = 'baseAnyOf1';
        _baseAnyOf1?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'BaseAnyOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseNestedAllOf_1InterfaceBuilder {
  void replace(BaseNestedAllOf_1Interface other);
  void update(void Function(BaseNestedAllOf_1InterfaceBuilder) updates);
  String? get attributeNestedAllOf;
  set attributeNestedAllOf(String? attributeNestedAllOf);
}

abstract mixin class BaseNestedAllOfInterfaceBuilder
    implements BaseAllOfInterfaceBuilder, BaseNestedAllOf_1InterfaceBuilder {
  void replace(covariant BaseNestedAllOfInterface other);
  void update(void Function(BaseNestedAllOfInterfaceBuilder) updates);
  String? get attribute;
  set attribute(covariant String? attribute);

  String? get attributeAllOf;
  set attributeAllOf(covariant String? attributeAllOf);

  String? get attributeNestedAllOf;
  set attributeNestedAllOf(covariant String? attributeNestedAllOf);
}

class _$BaseNestedAllOf extends BaseNestedAllOf {
  @override
  final String attribute;
  @override
  final String attributeAllOf;
  @override
  final String attributeNestedAllOf;

  factory _$BaseNestedAllOf([void Function(BaseNestedAllOfBuilder)? updates]) =>
      (BaseNestedAllOfBuilder()..update(updates))._build();

  _$BaseNestedAllOf._({required this.attribute, required this.attributeAllOf, required this.attributeNestedAllOf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute, r'BaseNestedAllOf', 'attribute');
    BuiltValueNullFieldError.checkNotNull(attributeAllOf, r'BaseNestedAllOf', 'attributeAllOf');
    BuiltValueNullFieldError.checkNotNull(attributeNestedAllOf, r'BaseNestedAllOf', 'attributeNestedAllOf');
  }

  @override
  BaseNestedAllOf rebuild(void Function(BaseNestedAllOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseNestedAllOfBuilder toBuilder() => BaseNestedAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseNestedAllOf &&
        attribute == other.attribute &&
        attributeAllOf == other.attributeAllOf &&
        attributeNestedAllOf == other.attributeNestedAllOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute.hashCode);
    _$hash = $jc(_$hash, attributeAllOf.hashCode);
    _$hash = $jc(_$hash, attributeNestedAllOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseNestedAllOf')
          ..add('attribute', attribute)
          ..add('attributeAllOf', attributeAllOf)
          ..add('attributeNestedAllOf', attributeNestedAllOf))
        .toString();
  }
}

class BaseNestedAllOfBuilder
    implements Builder<BaseNestedAllOf, BaseNestedAllOfBuilder>, BaseNestedAllOfInterfaceBuilder {
  _$BaseNestedAllOf? _$v;

  String? _attribute;
  String? get attribute => _$this._attribute;
  set attribute(covariant String? attribute) => _$this._attribute = attribute;

  String? _attributeAllOf;
  String? get attributeAllOf => _$this._attributeAllOf;
  set attributeAllOf(covariant String? attributeAllOf) => _$this._attributeAllOf = attributeAllOf;

  String? _attributeNestedAllOf;
  String? get attributeNestedAllOf => _$this._attributeNestedAllOf;
  set attributeNestedAllOf(covariant String? attributeNestedAllOf) =>
      _$this._attributeNestedAllOf = attributeNestedAllOf;

  BaseNestedAllOfBuilder();

  BaseNestedAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute = $v.attribute;
      _attributeAllOf = $v.attributeAllOf;
      _attributeNestedAllOf = $v.attributeNestedAllOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseNestedAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseNestedAllOf;
  }

  @override
  void update(void Function(BaseNestedAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseNestedAllOf build() => _build();

  _$BaseNestedAllOf _build() {
    final _$result = _$v ??
        _$BaseNestedAllOf._(
            attribute: BuiltValueNullFieldError.checkNotNull(attribute, r'BaseNestedAllOf', 'attribute'),
            attributeAllOf: BuiltValueNullFieldError.checkNotNull(attributeAllOf, r'BaseNestedAllOf', 'attributeAllOf'),
            attributeNestedAllOf: BuiltValueNullFieldError.checkNotNull(
                attributeNestedAllOf, r'BaseNestedAllOf', 'attributeNestedAllOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseNestedOneOf3InterfaceBuilder {
  void replace(BaseNestedOneOf3Interface other);
  void update(void Function(BaseNestedOneOf3InterfaceBuilder) updates);
  String? get attributeNestedOneOf;
  set attributeNestedOneOf(String? attributeNestedOneOf);
}

class _$BaseNestedOneOf3 extends BaseNestedOneOf3 {
  @override
  final String attributeNestedOneOf;

  factory _$BaseNestedOneOf3([void Function(BaseNestedOneOf3Builder)? updates]) =>
      (BaseNestedOneOf3Builder()..update(updates))._build();

  _$BaseNestedOneOf3._({required this.attributeNestedOneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeNestedOneOf, r'BaseNestedOneOf3', 'attributeNestedOneOf');
  }

  @override
  BaseNestedOneOf3 rebuild(void Function(BaseNestedOneOf3Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseNestedOneOf3Builder toBuilder() => BaseNestedOneOf3Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseNestedOneOf3 && attributeNestedOneOf == other.attributeNestedOneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeNestedOneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseNestedOneOf3')..add('attributeNestedOneOf', attributeNestedOneOf))
        .toString();
  }
}

class BaseNestedOneOf3Builder
    implements Builder<BaseNestedOneOf3, BaseNestedOneOf3Builder>, BaseNestedOneOf3InterfaceBuilder {
  _$BaseNestedOneOf3? _$v;

  String? _attributeNestedOneOf;
  String? get attributeNestedOneOf => _$this._attributeNestedOneOf;
  set attributeNestedOneOf(covariant String? attributeNestedOneOf) =>
      _$this._attributeNestedOneOf = attributeNestedOneOf;

  BaseNestedOneOf3Builder();

  BaseNestedOneOf3Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeNestedOneOf = $v.attributeNestedOneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseNestedOneOf3 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseNestedOneOf3;
  }

  @override
  void update(void Function(BaseNestedOneOf3Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseNestedOneOf3 build() => _build();

  _$BaseNestedOneOf3 _build() {
    final _$result = _$v ??
        _$BaseNestedOneOf3._(
            attributeNestedOneOf: BuiltValueNullFieldError.checkNotNull(
                attributeNestedOneOf, r'BaseNestedOneOf3', 'attributeNestedOneOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseNestedOneOfInterfaceBuilder {
  void replace(BaseNestedOneOfInterface other);
  void update(void Function(BaseNestedOneOfInterfaceBuilder) updates);
  BaseAllOfBuilder get baseAllOf;
  set baseAllOf(BaseAllOfBuilder? baseAllOf);

  BaseOneOfBuilder get baseOneOf;
  set baseOneOf(BaseOneOfBuilder? baseOneOf);

  BaseAnyOfBuilder get baseAnyOf;
  set baseAnyOf(BaseAnyOfBuilder? baseAnyOf);

  BaseNestedOneOf3Builder get baseNestedOneOf3;
  set baseNestedOneOf3(BaseNestedOneOf3Builder? baseNestedOneOf3);
}

class _$BaseNestedOneOf extends BaseNestedOneOf {
  @override
  final JsonObject data;
  @override
  final BaseAllOf? baseAllOf;
  @override
  final BaseOneOf? baseOneOf;
  @override
  final BaseAnyOf? baseAnyOf;
  @override
  final BaseNestedOneOf3? baseNestedOneOf3;

  factory _$BaseNestedOneOf([void Function(BaseNestedOneOfBuilder)? updates]) =>
      (BaseNestedOneOfBuilder()..update(updates))._build();

  _$BaseNestedOneOf._({required this.data, this.baseAllOf, this.baseOneOf, this.baseAnyOf, this.baseNestedOneOf3})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'BaseNestedOneOf', 'data');
  }

  @override
  BaseNestedOneOf rebuild(void Function(BaseNestedOneOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseNestedOneOfBuilder toBuilder() => BaseNestedOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseNestedOneOf &&
        data == other.data &&
        baseAllOf == other.baseAllOf &&
        baseOneOf == other.baseOneOf &&
        baseAnyOf == other.baseAnyOf &&
        baseNestedOneOf3 == other.baseNestedOneOf3;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, baseAllOf.hashCode);
    _$hash = $jc(_$hash, baseOneOf.hashCode);
    _$hash = $jc(_$hash, baseAnyOf.hashCode);
    _$hash = $jc(_$hash, baseNestedOneOf3.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseNestedOneOf')
          ..add('data', data)
          ..add('baseAllOf', baseAllOf)
          ..add('baseOneOf', baseOneOf)
          ..add('baseAnyOf', baseAnyOf)
          ..add('baseNestedOneOf3', baseNestedOneOf3))
        .toString();
  }
}

class BaseNestedOneOfBuilder
    implements Builder<BaseNestedOneOf, BaseNestedOneOfBuilder>, BaseNestedOneOfInterfaceBuilder {
  _$BaseNestedOneOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  BaseAllOfBuilder? _baseAllOf;
  BaseAllOfBuilder get baseAllOf => _$this._baseAllOf ??= BaseAllOfBuilder();
  set baseAllOf(covariant BaseAllOfBuilder? baseAllOf) => _$this._baseAllOf = baseAllOf;

  BaseOneOfBuilder? _baseOneOf;
  BaseOneOfBuilder get baseOneOf => _$this._baseOneOf ??= BaseOneOfBuilder();
  set baseOneOf(covariant BaseOneOfBuilder? baseOneOf) => _$this._baseOneOf = baseOneOf;

  BaseAnyOfBuilder? _baseAnyOf;
  BaseAnyOfBuilder get baseAnyOf => _$this._baseAnyOf ??= BaseAnyOfBuilder();
  set baseAnyOf(covariant BaseAnyOfBuilder? baseAnyOf) => _$this._baseAnyOf = baseAnyOf;

  BaseNestedOneOf3Builder? _baseNestedOneOf3;
  BaseNestedOneOf3Builder get baseNestedOneOf3 => _$this._baseNestedOneOf3 ??= BaseNestedOneOf3Builder();
  set baseNestedOneOf3(covariant BaseNestedOneOf3Builder? baseNestedOneOf3) =>
      _$this._baseNestedOneOf3 = baseNestedOneOf3;

  BaseNestedOneOfBuilder();

  BaseNestedOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _baseAllOf = $v.baseAllOf?.toBuilder();
      _baseOneOf = $v.baseOneOf?.toBuilder();
      _baseAnyOf = $v.baseAnyOf?.toBuilder();
      _baseNestedOneOf3 = $v.baseNestedOneOf3?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseNestedOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseNestedOneOf;
  }

  @override
  void update(void Function(BaseNestedOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseNestedOneOf build() => _build();

  _$BaseNestedOneOf _build() {
    BaseNestedOneOf._validate(this);
    _$BaseNestedOneOf _$result;
    try {
      _$result = _$v ??
          _$BaseNestedOneOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'BaseNestedOneOf', 'data'),
              baseAllOf: _baseAllOf?.build(),
              baseOneOf: _baseOneOf?.build(),
              baseAnyOf: _baseAnyOf?.build(),
              baseNestedOneOf3: _baseNestedOneOf3?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'baseAllOf';
        _baseAllOf?.build();
        _$failedField = 'baseOneOf';
        _baseOneOf?.build();
        _$failedField = 'baseAnyOf';
        _baseAnyOf?.build();
        _$failedField = 'baseNestedOneOf3';
        _baseNestedOneOf3?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'BaseNestedOneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseNestedAnyOf3InterfaceBuilder {
  void replace(BaseNestedAnyOf3Interface other);
  void update(void Function(BaseNestedAnyOf3InterfaceBuilder) updates);
  String? get attributeNestedAnyOf;
  set attributeNestedAnyOf(String? attributeNestedAnyOf);
}

class _$BaseNestedAnyOf3 extends BaseNestedAnyOf3 {
  @override
  final String attributeNestedAnyOf;

  factory _$BaseNestedAnyOf3([void Function(BaseNestedAnyOf3Builder)? updates]) =>
      (BaseNestedAnyOf3Builder()..update(updates))._build();

  _$BaseNestedAnyOf3._({required this.attributeNestedAnyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeNestedAnyOf, r'BaseNestedAnyOf3', 'attributeNestedAnyOf');
  }

  @override
  BaseNestedAnyOf3 rebuild(void Function(BaseNestedAnyOf3Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseNestedAnyOf3Builder toBuilder() => BaseNestedAnyOf3Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseNestedAnyOf3 && attributeNestedAnyOf == other.attributeNestedAnyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeNestedAnyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseNestedAnyOf3')..add('attributeNestedAnyOf', attributeNestedAnyOf))
        .toString();
  }
}

class BaseNestedAnyOf3Builder
    implements Builder<BaseNestedAnyOf3, BaseNestedAnyOf3Builder>, BaseNestedAnyOf3InterfaceBuilder {
  _$BaseNestedAnyOf3? _$v;

  String? _attributeNestedAnyOf;
  String? get attributeNestedAnyOf => _$this._attributeNestedAnyOf;
  set attributeNestedAnyOf(covariant String? attributeNestedAnyOf) =>
      _$this._attributeNestedAnyOf = attributeNestedAnyOf;

  BaseNestedAnyOf3Builder();

  BaseNestedAnyOf3Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeNestedAnyOf = $v.attributeNestedAnyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseNestedAnyOf3 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseNestedAnyOf3;
  }

  @override
  void update(void Function(BaseNestedAnyOf3Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseNestedAnyOf3 build() => _build();

  _$BaseNestedAnyOf3 _build() {
    final _$result = _$v ??
        _$BaseNestedAnyOf3._(
            attributeNestedAnyOf: BuiltValueNullFieldError.checkNotNull(
                attributeNestedAnyOf, r'BaseNestedAnyOf3', 'attributeNestedAnyOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BaseNestedAnyOfInterfaceBuilder {
  void replace(BaseNestedAnyOfInterface other);
  void update(void Function(BaseNestedAnyOfInterfaceBuilder) updates);
  BaseAllOfBuilder get baseAllOf;
  set baseAllOf(BaseAllOfBuilder? baseAllOf);

  BaseOneOfBuilder get baseOneOf;
  set baseOneOf(BaseOneOfBuilder? baseOneOf);

  BaseAnyOfBuilder get baseAnyOf;
  set baseAnyOf(BaseAnyOfBuilder? baseAnyOf);

  BaseNestedAnyOf3Builder get baseNestedAnyOf3;
  set baseNestedAnyOf3(BaseNestedAnyOf3Builder? baseNestedAnyOf3);
}

class _$BaseNestedAnyOf extends BaseNestedAnyOf {
  @override
  final JsonObject data;
  @override
  final BaseAllOf? baseAllOf;
  @override
  final BaseOneOf? baseOneOf;
  @override
  final BaseAnyOf? baseAnyOf;
  @override
  final BaseNestedAnyOf3? baseNestedAnyOf3;

  factory _$BaseNestedAnyOf([void Function(BaseNestedAnyOfBuilder)? updates]) =>
      (BaseNestedAnyOfBuilder()..update(updates))._build();

  _$BaseNestedAnyOf._({required this.data, this.baseAllOf, this.baseOneOf, this.baseAnyOf, this.baseNestedAnyOf3})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'BaseNestedAnyOf', 'data');
  }

  @override
  BaseNestedAnyOf rebuild(void Function(BaseNestedAnyOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseNestedAnyOfBuilder toBuilder() => BaseNestedAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseNestedAnyOf &&
        data == other.data &&
        baseAllOf == other.baseAllOf &&
        baseOneOf == other.baseOneOf &&
        baseAnyOf == other.baseAnyOf &&
        baseNestedAnyOf3 == other.baseNestedAnyOf3;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, baseAllOf.hashCode);
    _$hash = $jc(_$hash, baseOneOf.hashCode);
    _$hash = $jc(_$hash, baseAnyOf.hashCode);
    _$hash = $jc(_$hash, baseNestedAnyOf3.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseNestedAnyOf')
          ..add('data', data)
          ..add('baseAllOf', baseAllOf)
          ..add('baseOneOf', baseOneOf)
          ..add('baseAnyOf', baseAnyOf)
          ..add('baseNestedAnyOf3', baseNestedAnyOf3))
        .toString();
  }
}

class BaseNestedAnyOfBuilder
    implements Builder<BaseNestedAnyOf, BaseNestedAnyOfBuilder>, BaseNestedAnyOfInterfaceBuilder {
  _$BaseNestedAnyOf? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  BaseAllOfBuilder? _baseAllOf;
  BaseAllOfBuilder get baseAllOf => _$this._baseAllOf ??= BaseAllOfBuilder();
  set baseAllOf(covariant BaseAllOfBuilder? baseAllOf) => _$this._baseAllOf = baseAllOf;

  BaseOneOfBuilder? _baseOneOf;
  BaseOneOfBuilder get baseOneOf => _$this._baseOneOf ??= BaseOneOfBuilder();
  set baseOneOf(covariant BaseOneOfBuilder? baseOneOf) => _$this._baseOneOf = baseOneOf;

  BaseAnyOfBuilder? _baseAnyOf;
  BaseAnyOfBuilder get baseAnyOf => _$this._baseAnyOf ??= BaseAnyOfBuilder();
  set baseAnyOf(covariant BaseAnyOfBuilder? baseAnyOf) => _$this._baseAnyOf = baseAnyOf;

  BaseNestedAnyOf3Builder? _baseNestedAnyOf3;
  BaseNestedAnyOf3Builder get baseNestedAnyOf3 => _$this._baseNestedAnyOf3 ??= BaseNestedAnyOf3Builder();
  set baseNestedAnyOf3(covariant BaseNestedAnyOf3Builder? baseNestedAnyOf3) =>
      _$this._baseNestedAnyOf3 = baseNestedAnyOf3;

  BaseNestedAnyOfBuilder();

  BaseNestedAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _baseAllOf = $v.baseAllOf?.toBuilder();
      _baseOneOf = $v.baseOneOf?.toBuilder();
      _baseAnyOf = $v.baseAnyOf?.toBuilder();
      _baseNestedAnyOf3 = $v.baseNestedAnyOf3?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BaseNestedAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseNestedAnyOf;
  }

  @override
  void update(void Function(BaseNestedAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseNestedAnyOf build() => _build();

  _$BaseNestedAnyOf _build() {
    BaseNestedAnyOf._validate(this);
    _$BaseNestedAnyOf _$result;
    try {
      _$result = _$v ??
          _$BaseNestedAnyOf._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'BaseNestedAnyOf', 'data'),
              baseAllOf: _baseAllOf?.build(),
              baseOneOf: _baseOneOf?.build(),
              baseAnyOf: _baseAnyOf?.build(),
              baseNestedAnyOf3: _baseNestedAnyOf3?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'baseAllOf';
        _baseAllOf?.build();
        _$failedField = 'baseOneOf';
        _baseOneOf?.build();
        _$failedField = 'baseAnyOf';
        _baseAnyOf?.build();
        _$failedField = 'baseNestedAnyOf3';
        _baseNestedAnyOf3?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'BaseNestedAnyOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
