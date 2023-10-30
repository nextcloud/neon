// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_ofs.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Base> _$baseSerializer = _$BaseSerializer();

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

abstract mixin class OneOfUnspecifiedArrayInterfaceBuilder {
  void replace(OneOfUnspecifiedArrayInterface other);
  void update(void Function(OneOfUnspecifiedArrayInterfaceBuilder) updates);
  BaseBuilder get base;
  set base(BaseBuilder? base);

  ListBuilder<JsonObject> get builtListJsonObject;
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject);
}

class _$OneOfUnspecifiedArray extends OneOfUnspecifiedArray {
  @override
  final JsonObject data;
  @override
  final Base? base;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;

  factory _$OneOfUnspecifiedArray([void Function(OneOfUnspecifiedArrayBuilder)? updates]) =>
      (OneOfUnspecifiedArrayBuilder()..update(updates))._build();

  _$OneOfUnspecifiedArray._({required this.data, this.base, this.builtListJsonObject}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneOfUnspecifiedArray', 'data');
  }

  @override
  OneOfUnspecifiedArray rebuild(void Function(OneOfUnspecifiedArrayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OneOfUnspecifiedArrayBuilder toBuilder() => OneOfUnspecifiedArrayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneOfUnspecifiedArray &&
        data == other.data &&
        base == other.base &&
        builtListJsonObject == other.builtListJsonObject;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, base.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneOfUnspecifiedArray')
          ..add('data', data)
          ..add('base', base)
          ..add('builtListJsonObject', builtListJsonObject))
        .toString();
  }
}

class OneOfUnspecifiedArrayBuilder
    implements Builder<OneOfUnspecifiedArray, OneOfUnspecifiedArrayBuilder>, OneOfUnspecifiedArrayInterfaceBuilder {
  _$OneOfUnspecifiedArray? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  BaseBuilder? _base;
  BaseBuilder get base => _$this._base ??= BaseBuilder();
  set base(covariant BaseBuilder? base) => _$this._base = base;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(covariant ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  OneOfUnspecifiedArrayBuilder();

  OneOfUnspecifiedArrayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _base = $v.base?.toBuilder();
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneOfUnspecifiedArray other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneOfUnspecifiedArray;
  }

  @override
  void update(void Function(OneOfUnspecifiedArrayBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneOfUnspecifiedArray build() => _build();

  _$OneOfUnspecifiedArray _build() {
    OneOfUnspecifiedArray._validate(this);
    _$OneOfUnspecifiedArray _$result;
    try {
      _$result = _$v ??
          _$OneOfUnspecifiedArray._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'OneOfUnspecifiedArray', 'data'),
              base: _base?.build(),
              builtListJsonObject: _builtListJsonObject?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'base';
        _base?.build();
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OneOfUnspecifiedArray', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OneOfStringArrayInterfaceBuilder {
  void replace(OneOfStringArrayInterface other);
  void update(void Function(OneOfStringArrayInterfaceBuilder) updates);
  BaseBuilder get base;
  set base(BaseBuilder? base);

  ListBuilder<String> get builtListString;
  set builtListString(ListBuilder<String>? builtListString);
}

class _$OneOfStringArray extends OneOfStringArray {
  @override
  final JsonObject data;
  @override
  final Base? base;
  @override
  final BuiltList<String>? builtListString;

  factory _$OneOfStringArray([void Function(OneOfStringArrayBuilder)? updates]) =>
      (OneOfStringArrayBuilder()..update(updates))._build();

  _$OneOfStringArray._({required this.data, this.base, this.builtListString}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'OneOfStringArray', 'data');
  }

  @override
  OneOfStringArray rebuild(void Function(OneOfStringArrayBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OneOfStringArrayBuilder toBuilder() => OneOfStringArrayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OneOfStringArray &&
        data == other.data &&
        base == other.base &&
        builtListString == other.builtListString;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, base.hashCode);
    _$hash = $jc(_$hash, builtListString.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OneOfStringArray')
          ..add('data', data)
          ..add('base', base)
          ..add('builtListString', builtListString))
        .toString();
  }
}

class OneOfStringArrayBuilder
    implements Builder<OneOfStringArray, OneOfStringArrayBuilder>, OneOfStringArrayInterfaceBuilder {
  _$OneOfStringArray? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  BaseBuilder? _base;
  BaseBuilder get base => _$this._base ??= BaseBuilder();
  set base(covariant BaseBuilder? base) => _$this._base = base;

  ListBuilder<String>? _builtListString;
  ListBuilder<String> get builtListString => _$this._builtListString ??= ListBuilder<String>();
  set builtListString(covariant ListBuilder<String>? builtListString) => _$this._builtListString = builtListString;

  OneOfStringArrayBuilder();

  OneOfStringArrayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _base = $v.base?.toBuilder();
      _builtListString = $v.builtListString?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OneOfStringArray other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OneOfStringArray;
  }

  @override
  void update(void Function(OneOfStringArrayBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OneOfStringArray build() => _build();

  _$OneOfStringArray _build() {
    OneOfStringArray._validate(this);
    _$OneOfStringArray _$result;
    try {
      _$result = _$v ??
          _$OneOfStringArray._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'OneOfStringArray', 'data'),
              base: _base?.build(),
              builtListString: _builtListString?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'base';
        _base?.build();
        _$failedField = 'builtListString';
        _builtListString?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OneOfStringArray', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
