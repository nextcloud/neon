// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_of.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ObjectAllOf> _$objectAllOfSerializer = _$ObjectAllOfSerializer();
Serializer<OneObjectAllOf> _$oneObjectAllOfSerializer = _$OneObjectAllOfSerializer();

class _$ObjectAllOfSerializer implements StructuredSerializer<ObjectAllOf> {
  @override
  final Iterable<Type> types = const [ObjectAllOf, _$ObjectAllOf];
  @override
  final String wireName = 'ObjectAllOf';

  @override
  Iterable<Object?> serialize(Serializers serializers, ObjectAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute1-allOf',
      serializers.serialize(object.attribute1AllOf, specifiedType: const FullType(String)),
      'attribute2-allOf',
      serializers.serialize(object.attribute2AllOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ObjectAllOf deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ObjectAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute1-allOf':
          result.attribute1AllOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'attribute2-allOf':
          result.attribute2AllOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OneObjectAllOfSerializer implements StructuredSerializer<OneObjectAllOf> {
  @override
  final Iterable<Type> types = const [OneObjectAllOf, _$OneObjectAllOf];
  @override
  final String wireName = 'OneObjectAllOf';

  @override
  Iterable<Object?> serialize(Serializers serializers, OneObjectAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'attribute-allOf',
      serializers.serialize(object.attributeAllOf, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OneObjectAllOf deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = OneObjectAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'attribute-allOf':
          result.attributeAllOf = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class ObjectAllOf_0InterfaceBuilder {
  void replace(ObjectAllOf_0Interface other);
  void update(void Function(ObjectAllOf_0InterfaceBuilder) updates);
  String? get attribute1AllOf;
  set attribute1AllOf(String? attribute1AllOf);
}

abstract mixin class ObjectAllOf_1InterfaceBuilder {
  void replace(ObjectAllOf_1Interface other);
  void update(void Function(ObjectAllOf_1InterfaceBuilder) updates);
  String? get attribute2AllOf;
  set attribute2AllOf(String? attribute2AllOf);
}

abstract mixin class ObjectAllOfInterfaceBuilder
    implements ObjectAllOf_0InterfaceBuilder, ObjectAllOf_1InterfaceBuilder {
  void replace(covariant ObjectAllOfInterface other);
  void update(void Function(ObjectAllOfInterfaceBuilder) updates);
  String? get attribute1AllOf;
  set attribute1AllOf(covariant String? attribute1AllOf);

  String? get attribute2AllOf;
  set attribute2AllOf(covariant String? attribute2AllOf);
}

class _$ObjectAllOf extends ObjectAllOf {
  @override
  final String attribute1AllOf;
  @override
  final String attribute2AllOf;

  factory _$ObjectAllOf([void Function(ObjectAllOfBuilder)? updates]) =>
      (ObjectAllOfBuilder()..update(updates))._build();

  _$ObjectAllOf._({required this.attribute1AllOf, required this.attribute2AllOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attribute1AllOf, r'ObjectAllOf', 'attribute1AllOf');
    BuiltValueNullFieldError.checkNotNull(attribute2AllOf, r'ObjectAllOf', 'attribute2AllOf');
  }

  @override
  ObjectAllOf rebuild(void Function(ObjectAllOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectAllOfBuilder toBuilder() => ObjectAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectAllOf && attribute1AllOf == other.attribute1AllOf && attribute2AllOf == other.attribute2AllOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attribute1AllOf.hashCode);
    _$hash = $jc(_$hash, attribute2AllOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectAllOf')
          ..add('attribute1AllOf', attribute1AllOf)
          ..add('attribute2AllOf', attribute2AllOf))
        .toString();
  }
}

class ObjectAllOfBuilder implements Builder<ObjectAllOf, ObjectAllOfBuilder>, ObjectAllOfInterfaceBuilder {
  _$ObjectAllOf? _$v;

  String? _attribute1AllOf;
  String? get attribute1AllOf => _$this._attribute1AllOf;
  set attribute1AllOf(covariant String? attribute1AllOf) => _$this._attribute1AllOf = attribute1AllOf;

  String? _attribute2AllOf;
  String? get attribute2AllOf => _$this._attribute2AllOf;
  set attribute2AllOf(covariant String? attribute2AllOf) => _$this._attribute2AllOf = attribute2AllOf;

  ObjectAllOfBuilder();

  ObjectAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attribute1AllOf = $v.attribute1AllOf;
      _attribute2AllOf = $v.attribute2AllOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectAllOf;
  }

  @override
  void update(void Function(ObjectAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectAllOf build() => _build();

  _$ObjectAllOf _build() {
    final _$result = _$v ??
        _$ObjectAllOf._(
            attribute1AllOf: BuiltValueNullFieldError.checkNotNull(attribute1AllOf, r'ObjectAllOf', 'attribute1AllOf'),
            attribute2AllOf: BuiltValueNullFieldError.checkNotNull(attribute2AllOf, r'ObjectAllOf', 'attribute2AllOf'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OneObjectAllOf_0InterfaceBuilder {
  void replace(OneObjectAllOf_0Interface other);
  void update(void Function(OneObjectAllOf_0InterfaceBuilder) updates);
  String? get attributeAllOf;
  set attributeAllOf(String? attributeAllOf);
}

abstract mixin class OneObjectAllOfInterfaceBuilder implements OneObjectAllOf_0InterfaceBuilder {
  void replace(covariant OneObjectAllOfInterface other);
  void update(void Function(OneObjectAllOfInterfaceBuilder) updates);
  String? get attributeAllOf;
  set attributeAllOf(covariant String? attributeAllOf);
}

class _$OneObjectAllOf extends OneObjectAllOf {
  @override
  final String attributeAllOf;

  factory _$OneObjectAllOf([void Function(OneObjectAllOfBuilder)? updates]) =>
      (OneObjectAllOfBuilder()..update(updates))._build();

  _$OneObjectAllOf._({required this.attributeAllOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(attributeAllOf, r'OneObjectAllOf', 'attributeAllOf');
  }

  @override
  OneObjectAllOf rebuild(void Function(OneObjectAllOfBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneObjectAllOfBuilder toBuilder() => OneObjectAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneObjectAllOf && attributeAllOf == other.attributeAllOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeAllOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneObjectAllOf')..add('attributeAllOf', attributeAllOf)).toString();
  }
}

class OneObjectAllOfBuilder implements Builder<OneObjectAllOf, OneObjectAllOfBuilder>, OneObjectAllOfInterfaceBuilder {
  _$OneObjectAllOf? _$v;

  String? _attributeAllOf;
  String? get attributeAllOf => _$this._attributeAllOf;
  set attributeAllOf(covariant String? attributeAllOf) => _$this._attributeAllOf = attributeAllOf;

  OneObjectAllOfBuilder();

  OneObjectAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeAllOf = $v.attributeAllOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneObjectAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneObjectAllOf;
  }

  @override
  void update(void Function(OneObjectAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneObjectAllOf build() => _build();

  _$OneObjectAllOf _build() {
    final _$result = _$v ??
        _$OneObjectAllOf._(
            attributeAllOf: BuiltValueNullFieldError.checkNotNull(attributeAllOf, r'OneObjectAllOf', 'attributeAllOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
