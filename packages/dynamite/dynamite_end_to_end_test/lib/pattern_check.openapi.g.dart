// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pattern_check.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestObject> _$testObjectSerializer = _$TestObjectSerializer();

class _$TestObjectSerializer implements StructuredSerializer<TestObject> {
  @override
  final Iterable<Type> types = const [TestObject, _$TestObject];
  @override
  final String wireName = 'TestObject';

  @override
  Iterable<Object?> serialize(Serializers serializers, TestObject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.onlyNumbers;
    if (value != null) {
      result
        ..add('only-numbers')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.minLength;
    if (value != null) {
      result
        ..add('min-length')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.maxLength;
    if (value != null) {
      result
        ..add('max-length')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.stringMultipleChecks;
    if (value != null) {
      result
        ..add('string-multiple-checks')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.minItems;
    if (value != null) {
      result
        ..add('min-items')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(int)])));
    }
    value = object.maxItems;
    if (value != null) {
      result
        ..add('max-items')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(int)])));
    }
    value = object.arrayMultipleChecks;
    if (value != null) {
      result
        ..add('array-multiple-checks')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(int)])));
    }
    return result;
  }

  @override
  TestObject deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TestObjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'only-numbers':
          result.onlyNumbers = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'min-length':
          result.minLength = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'max-length':
          result.maxLength = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'string-multiple-checks':
          result.stringMultipleChecks =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'min-items':
          result.minItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(int)]))! as BuiltList<Object?>);
          break;
        case 'max-items':
          result.maxItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(int)]))! as BuiltList<Object?>);
          break;
        case 'array-multiple-checks':
          result.arrayMultipleChecks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(int)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $TestObjectInterfaceBuilder {
  void replace($TestObjectInterface other);
  void update(void Function($TestObjectInterfaceBuilder) updates);
  String? get onlyNumbers;
  set onlyNumbers(String? onlyNumbers);

  String? get minLength;
  set minLength(String? minLength);

  String? get maxLength;
  set maxLength(String? maxLength);

  String? get stringMultipleChecks;
  set stringMultipleChecks(String? stringMultipleChecks);

  ListBuilder<int> get minItems;
  set minItems(ListBuilder<int>? minItems);

  ListBuilder<int> get maxItems;
  set maxItems(ListBuilder<int>? maxItems);

  ListBuilder<int> get arrayMultipleChecks;
  set arrayMultipleChecks(ListBuilder<int>? arrayMultipleChecks);
}

class _$TestObject extends TestObject {
  @override
  final String? onlyNumbers;
  @override
  final String? minLength;
  @override
  final String? maxLength;
  @override
  final String? stringMultipleChecks;
  @override
  final BuiltList<int>? minItems;
  @override
  final BuiltList<int>? maxItems;
  @override
  final BuiltList<int>? arrayMultipleChecks;

  factory _$TestObject([void Function(TestObjectBuilder)? updates]) => (TestObjectBuilder()..update(updates))._build();

  _$TestObject._(
      {this.onlyNumbers,
      this.minLength,
      this.maxLength,
      this.stringMultipleChecks,
      this.minItems,
      this.maxItems,
      this.arrayMultipleChecks})
      : super._();

  @override
  TestObject rebuild(void Function(TestObjectBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  TestObjectBuilder toBuilder() => TestObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestObject &&
        onlyNumbers == other.onlyNumbers &&
        minLength == other.minLength &&
        maxLength == other.maxLength &&
        stringMultipleChecks == other.stringMultipleChecks &&
        minItems == other.minItems &&
        maxItems == other.maxItems &&
        arrayMultipleChecks == other.arrayMultipleChecks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, onlyNumbers.hashCode);
    _$hash = $jc(_$hash, minLength.hashCode);
    _$hash = $jc(_$hash, maxLength.hashCode);
    _$hash = $jc(_$hash, stringMultipleChecks.hashCode);
    _$hash = $jc(_$hash, minItems.hashCode);
    _$hash = $jc(_$hash, maxItems.hashCode);
    _$hash = $jc(_$hash, arrayMultipleChecks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestObject')
          ..add('onlyNumbers', onlyNumbers)
          ..add('minLength', minLength)
          ..add('maxLength', maxLength)
          ..add('stringMultipleChecks', stringMultipleChecks)
          ..add('minItems', minItems)
          ..add('maxItems', maxItems)
          ..add('arrayMultipleChecks', arrayMultipleChecks))
        .toString();
  }
}

class TestObjectBuilder implements Builder<TestObject, TestObjectBuilder>, $TestObjectInterfaceBuilder {
  _$TestObject? _$v;

  String? _onlyNumbers;
  String? get onlyNumbers => _$this._onlyNumbers;
  set onlyNumbers(covariant String? onlyNumbers) => _$this._onlyNumbers = onlyNumbers;

  String? _minLength;
  String? get minLength => _$this._minLength;
  set minLength(covariant String? minLength) => _$this._minLength = minLength;

  String? _maxLength;
  String? get maxLength => _$this._maxLength;
  set maxLength(covariant String? maxLength) => _$this._maxLength = maxLength;

  String? _stringMultipleChecks;
  String? get stringMultipleChecks => _$this._stringMultipleChecks;
  set stringMultipleChecks(covariant String? stringMultipleChecks) =>
      _$this._stringMultipleChecks = stringMultipleChecks;

  ListBuilder<int>? _minItems;
  ListBuilder<int> get minItems => _$this._minItems ??= ListBuilder<int>();
  set minItems(covariant ListBuilder<int>? minItems) => _$this._minItems = minItems;

  ListBuilder<int>? _maxItems;
  ListBuilder<int> get maxItems => _$this._maxItems ??= ListBuilder<int>();
  set maxItems(covariant ListBuilder<int>? maxItems) => _$this._maxItems = maxItems;

  ListBuilder<int>? _arrayMultipleChecks;
  ListBuilder<int> get arrayMultipleChecks => _$this._arrayMultipleChecks ??= ListBuilder<int>();
  set arrayMultipleChecks(covariant ListBuilder<int>? arrayMultipleChecks) =>
      _$this._arrayMultipleChecks = arrayMultipleChecks;

  TestObjectBuilder() {
    TestObject._defaults(this);
  }

  TestObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _onlyNumbers = $v.onlyNumbers;
      _minLength = $v.minLength;
      _maxLength = $v.maxLength;
      _stringMultipleChecks = $v.stringMultipleChecks;
      _minItems = $v.minItems?.toBuilder();
      _maxItems = $v.maxItems?.toBuilder();
      _arrayMultipleChecks = $v.arrayMultipleChecks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TestObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestObject;
  }

  @override
  void update(void Function(TestObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestObject build() => _build();

  _$TestObject _build() {
    TestObject._validate(this);
    _$TestObject _$result;
    try {
      _$result = _$v ??
          _$TestObject._(
              onlyNumbers: onlyNumbers,
              minLength: minLength,
              maxLength: maxLength,
              stringMultipleChecks: stringMultipleChecks,
              minItems: _minItems?.build(),
              maxItems: _maxItems?.build(),
              arrayMultipleChecks: _arrayMultipleChecks?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'minItems';
        _minItems?.build();
        _$failedField = 'maxItems';
        _maxItems?.build();
        _$failedField = 'arrayMultipleChecks';
        _arrayMultipleChecks?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TestObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
