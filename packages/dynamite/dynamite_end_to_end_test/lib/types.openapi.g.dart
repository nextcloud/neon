// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Base> _$baseSerializer = _$BaseSerializer();
Serializer<Defaults> _$defaultsSerializer = _$DefaultsSerializer();
Serializer<AdditionalProperties> _$additionalPropertiesSerializer = _$AdditionalPropertiesSerializer();

class _$BaseSerializer implements StructuredSerializer<Base> {
  @override
  final Iterable<Type> types = const [Base, _$Base];
  @override
  final String wireName = 'Base';

  @override
  Iterable<Object?> serialize(Serializers serializers, Base object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.$bool;
    if (value != null) {
      result
        ..add('bool')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.integer;
    if (value != null) {
      result
        ..add('integer')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.$double;
    if (value != null) {
      result
        ..add('double')
        ..add(serializers.serialize(value, specifiedType: const FullType(double)));
    }
    value = object.$num;
    if (value != null) {
      result
        ..add('num')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.string;
    if (value != null) {
      result
        ..add('string')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.contentString;
    if (value != null) {
      result
        ..add('content-string')
        ..add(serializers.serialize(value, specifiedType: const FullType(ContentString, [FullType(int)])));
    }
    value = object.stringBinary;
    if (value != null) {
      result
        ..add('string-binary')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uint8List)));
    }
    value = object.list;
    if (value != null) {
      result
        ..add('list')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.listNever;
    if (value != null) {
      result
        ..add('list-never')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)])));
    }
    value = object.listString;
    if (value != null) {
      result
        ..add('list-string')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
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
        case 'bool':
          result.$bool = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'integer':
          result.integer = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'double':
          result.$double = serializers.deserialize(value, specifiedType: const FullType(double)) as double?;
          break;
        case 'num':
          result.$num = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'string':
          result.string = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'content-string':
          result.contentString.replace(serializers.deserialize(value,
              specifiedType: const FullType(ContentString, [FullType(int)]))! as ContentString<int>);
          break;
        case 'string-binary':
          result.stringBinary = serializers.deserialize(value, specifiedType: const FullType(Uint8List)) as Uint8List?;
          break;
        case 'list':
          result.list.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'list-never':
          result.listNever.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(Never)]))! as BuiltList<Object?>);
          break;
        case 'list-string':
          result.listString.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DefaultsSerializer implements StructuredSerializer<Defaults> {
  @override
  final Iterable<Type> types = const [Defaults, _$Defaults];
  @override
  final String wireName = 'Defaults';

  @override
  Iterable<Object?> serialize(Serializers serializers, Defaults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'bool',
      serializers.serialize(object.$bool, specifiedType: const FullType(bool)),
      'integer',
      serializers.serialize(object.integer, specifiedType: const FullType(int)),
      'double',
      serializers.serialize(object.$double, specifiedType: const FullType(double)),
      'num',
      serializers.serialize(object.$num, specifiedType: const FullType(num)),
      'string',
      serializers.serialize(object.string, specifiedType: const FullType(String)),
      'string-binary',
      serializers.serialize(object.stringBinary, specifiedType: const FullType(Uint8List)),
      'list',
      serializers.serialize(object.list, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
      'list-never',
      serializers.serialize(object.listNever, specifiedType: const FullType(BuiltList, [FullType(Never)])),
      'list-string',
      serializers.serialize(object.listString, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'object-map',
      serializers.serialize(object.objectMap, specifiedType: const FullType(JsonObject)),
      'object-array',
      serializers.serialize(object.objectArray, specifiedType: const FullType(JsonObject)),
      'object-bool',
      serializers.serialize(object.objectBool, specifiedType: const FullType(JsonObject)),
    ];
    Object? value;
    value = object.contentString;
    if (value != null) {
      result
        ..add('content-string')
        ..add(serializers.serialize(value, specifiedType: const FullType(ContentString, [FullType(int)])));
    }
    return result;
  }

  @override
  Defaults deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DefaultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'bool':
          result.$bool = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'integer':
          result.integer = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'double':
          result.$double = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
          break;
        case 'num':
          result.$num = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'string':
          result.string = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'content-string':
          result.contentString.replace(serializers.deserialize(value,
              specifiedType: const FullType(ContentString, [FullType(int)]))! as ContentString<int>);
          break;
        case 'string-binary':
          result.stringBinary = serializers.deserialize(value, specifiedType: const FullType(Uint8List))! as Uint8List;
          break;
        case 'list':
          result.list.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'list-never':
          result.listNever.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(Never)]))! as BuiltList<Object?>);
          break;
        case 'list-string':
          result.listString.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'object-map':
          result.objectMap = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'object-array':
          result.objectArray = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'object-bool':
          result.objectBool = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$AdditionalPropertiesSerializer implements StructuredSerializer<AdditionalProperties> {
  @override
  final Iterable<Type> types = const [AdditionalProperties, _$AdditionalProperties];
  @override
  final String wireName = 'AdditionalProperties';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdditionalProperties object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.emptySchemaBool;
    if (value != null) {
      result
        ..add('empty_schema_bool')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    value = object.emptySchema;
    if (value != null) {
      result
        ..add('empty_schema')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    value = object.nested;
    if (value != null) {
      result
        ..add('nested')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [
              FullType(String),
              FullType(BuiltMap, [FullType(String), FullType(JsonObject)])
            ])));
    }
    value = object.object;
    if (value != null) {
      result
        ..add('Object')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    value = object.objectNullable;
    if (value != null) {
      result
        ..add('ObjectNullable')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)])));
    }
    value = object.$bool;
    if (value != null) {
      result
        ..add('bool')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(BuiltMap, [FullType(String), FullType(bool)])));
    }
    value = object.integer;
    if (value != null) {
      result
        ..add('integer')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltMap, [FullType(String), FullType(int)])));
    }
    value = object.$double;
    if (value != null) {
      result
        ..add('double')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(double)])));
    }
    value = object.$num;
    if (value != null) {
      result
        ..add('num')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltMap, [FullType(String), FullType(num)])));
    }
    value = object.string;
    if (value != null) {
      result
        ..add('string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)])));
    }
    value = object.contentString;
    if (value != null) {
      result
        ..add('content-string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [
              FullType(String),
              FullType.nullable(ContentString, [FullType(int)])
            ])));
    }
    value = object.stringBinary;
    if (value != null) {
      result
        ..add('string-binary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Uint8List)])));
    }
    value = object.list;
    if (value != null) {
      result
        ..add('list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [
              FullType(String),
              FullType(BuiltList, [FullType(JsonObject)])
            ])));
    }
    value = object.listNever;
    if (value != null) {
      result
        ..add('list-never')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [
              FullType(String),
              FullType(BuiltList, [FullType(Never)])
            ])));
    }
    value = object.listString;
    if (value != null) {
      result
        ..add('list-string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [
              FullType(String),
              FullType(BuiltList, [FullType(String)])
            ])));
    }
    return result;
  }

  @override
  AdditionalProperties deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AdditionalPropertiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'empty_schema_bool':
          result.emptySchemaBool.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'empty_schema':
          result.emptySchema.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'nested':
          result.nested.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(BuiltMap, [FullType(String), FullType(JsonObject)])
              ]))!);
          break;
        case 'Object':
          result.object.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'ObjectNullable':
          result.objectNullable.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]))!);
          break;
        case 'bool':
          result.$bool.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(bool)]))!);
          break;
        case 'integer':
          result.integer.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(int)]))!);
          break;
        case 'double':
          result.$double.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(double)]))!);
          break;
        case 'num':
          result.$num.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(num)]))!);
          break;
        case 'string':
          result.string.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]))!);
          break;
        case 'content-string':
          result.contentString.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType.nullable(ContentString, [FullType(int)])
              ]))!);
          break;
        case 'string-binary':
          result.stringBinary.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Uint8List)]))!);
          break;
        case 'list':
          result.list.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(BuiltList, [FullType(JsonObject)])
              ]))!);
          break;
        case 'list-never':
          result.listNever.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(BuiltList, [FullType(Never)])
              ]))!);
          break;
        case 'list-string':
          result.listString.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(BuiltList, [FullType(String)])
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $BaseInterfaceBuilder {
  void replace($BaseInterface other);
  void update(void Function($BaseInterfaceBuilder) updates);
  bool? get $bool;
  set $bool(bool? $bool);

  int? get integer;
  set integer(int? integer);

  double? get $double;
  set $double(double? $double);

  num? get $num;
  set $num(num? $num);

  String? get string;
  set string(String? string);

  ContentStringBuilder<int> get contentString;
  set contentString(ContentStringBuilder<int>? contentString);

  Uint8List? get stringBinary;
  set stringBinary(Uint8List? stringBinary);

  ListBuilder<JsonObject> get list;
  set list(ListBuilder<JsonObject>? list);

  ListBuilder<Never> get listNever;
  set listNever(ListBuilder<Never>? listNever);

  ListBuilder<String> get listString;
  set listString(ListBuilder<String>? listString);
}

class _$Base extends Base {
  @override
  final bool? $bool;
  @override
  final int? integer;
  @override
  final double? $double;
  @override
  final num? $num;
  @override
  final String? string;
  @override
  final ContentString<int>? contentString;
  @override
  final Uint8List? stringBinary;
  @override
  final BuiltList<JsonObject>? list;
  @override
  final BuiltList<Never>? listNever;
  @override
  final BuiltList<String>? listString;

  factory _$Base([void Function(BaseBuilder)? updates]) => (BaseBuilder()..update(updates))._build();

  _$Base._(
      {this.$bool,
      this.integer,
      this.$double,
      this.$num,
      this.string,
      this.contentString,
      this.stringBinary,
      this.list,
      this.listNever,
      this.listString})
      : super._();

  @override
  Base rebuild(void Function(BaseBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BaseBuilder toBuilder() => BaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Base &&
        $bool == other.$bool &&
        integer == other.integer &&
        $double == other.$double &&
        $num == other.$num &&
        string == other.string &&
        contentString == other.contentString &&
        stringBinary == other.stringBinary &&
        list == other.list &&
        listNever == other.listNever &&
        listString == other.listString;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, $bool.hashCode);
    _$hash = $jc(_$hash, integer.hashCode);
    _$hash = $jc(_$hash, $double.hashCode);
    _$hash = $jc(_$hash, $num.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, contentString.hashCode);
    _$hash = $jc(_$hash, stringBinary.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jc(_$hash, listNever.hashCode);
    _$hash = $jc(_$hash, listString.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Base')
          ..add('\$bool', $bool)
          ..add('integer', integer)
          ..add('\$double', $double)
          ..add('\$num', $num)
          ..add('string', string)
          ..add('contentString', contentString)
          ..add('stringBinary', stringBinary)
          ..add('list', list)
          ..add('listNever', listNever)
          ..add('listString', listString))
        .toString();
  }
}

class BaseBuilder implements Builder<Base, BaseBuilder>, $BaseInterfaceBuilder {
  _$Base? _$v;

  bool? _$bool;
  bool? get $bool => _$this._$bool;
  set $bool(covariant bool? $bool) => _$this._$bool = $bool;

  int? _integer;
  int? get integer => _$this._integer;
  set integer(covariant int? integer) => _$this._integer = integer;

  double? _$double;
  double? get $double => _$this._$double;
  set $double(covariant double? $double) => _$this._$double = $double;

  num? _$num;
  num? get $num => _$this._$num;
  set $num(covariant num? $num) => _$this._$num = $num;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  ContentStringBuilder<int>? _contentString;
  ContentStringBuilder<int> get contentString => _$this._contentString ??= ContentStringBuilder<int>();
  set contentString(covariant ContentStringBuilder<int>? contentString) => _$this._contentString = contentString;

  Uint8List? _stringBinary;
  Uint8List? get stringBinary => _$this._stringBinary;
  set stringBinary(covariant Uint8List? stringBinary) => _$this._stringBinary = stringBinary;

  ListBuilder<JsonObject>? _list;
  ListBuilder<JsonObject> get list => _$this._list ??= ListBuilder<JsonObject>();
  set list(covariant ListBuilder<JsonObject>? list) => _$this._list = list;

  ListBuilder<Never>? _listNever;
  ListBuilder<Never> get listNever => _$this._listNever ??= ListBuilder<Never>();
  set listNever(covariant ListBuilder<Never>? listNever) => _$this._listNever = listNever;

  ListBuilder<String>? _listString;
  ListBuilder<String> get listString => _$this._listString ??= ListBuilder<String>();
  set listString(covariant ListBuilder<String>? listString) => _$this._listString = listString;

  BaseBuilder() {
    Base._defaults(this);
  }

  BaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _$bool = $v.$bool;
      _integer = $v.integer;
      _$double = $v.$double;
      _$num = $v.$num;
      _string = $v.string;
      _contentString = $v.contentString?.toBuilder();
      _stringBinary = $v.stringBinary;
      _list = $v.list?.toBuilder();
      _listNever = $v.listNever?.toBuilder();
      _listString = $v.listString?.toBuilder();
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
    Base._validate(this);
    _$Base _$result;
    try {
      _$result = _$v ??
          _$Base._(
              $bool: $bool,
              integer: integer,
              $double: $double,
              $num: $num,
              string: string,
              contentString: _contentString?.build(),
              stringBinary: stringBinary,
              list: _list?.build(),
              listNever: _listNever?.build(),
              listString: _listString?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contentString';
        _contentString?.build();

        _$failedField = 'list';
        _list?.build();
        _$failedField = 'listNever';
        _listNever?.build();
        _$failedField = 'listString';
        _listString?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Base', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DefaultsInterfaceBuilder {
  void replace($DefaultsInterface other);
  void update(void Function($DefaultsInterfaceBuilder) updates);
  bool? get $bool;
  set $bool(bool? $bool);

  int? get integer;
  set integer(int? integer);

  double? get $double;
  set $double(double? $double);

  num? get $num;
  set $num(num? $num);

  String? get string;
  set string(String? string);

  ContentStringBuilder<int> get contentString;
  set contentString(ContentStringBuilder<int>? contentString);

  Uint8List? get stringBinary;
  set stringBinary(Uint8List? stringBinary);

  ListBuilder<JsonObject> get list;
  set list(ListBuilder<JsonObject>? list);

  ListBuilder<Never> get listNever;
  set listNever(ListBuilder<Never>? listNever);

  ListBuilder<String> get listString;
  set listString(ListBuilder<String>? listString);

  JsonObject? get objectMap;
  set objectMap(JsonObject? objectMap);

  JsonObject? get objectArray;
  set objectArray(JsonObject? objectArray);

  JsonObject? get objectBool;
  set objectBool(JsonObject? objectBool);
}

class _$Defaults extends Defaults {
  @override
  final bool $bool;
  @override
  final int integer;
  @override
  final double $double;
  @override
  final num $num;
  @override
  final String string;
  @override
  final ContentString<int>? contentString;
  @override
  final Uint8List stringBinary;
  @override
  final BuiltList<JsonObject> list;
  @override
  final BuiltList<Never> listNever;
  @override
  final BuiltList<String> listString;
  @override
  final JsonObject objectMap;
  @override
  final JsonObject objectArray;
  @override
  final JsonObject objectBool;

  factory _$Defaults([void Function(DefaultsBuilder)? updates]) => (DefaultsBuilder()..update(updates))._build();

  _$Defaults._(
      {required this.$bool,
      required this.integer,
      required this.$double,
      required this.$num,
      required this.string,
      this.contentString,
      required this.stringBinary,
      required this.list,
      required this.listNever,
      required this.listString,
      required this.objectMap,
      required this.objectArray,
      required this.objectBool})
      : super._() {
    BuiltValueNullFieldError.checkNotNull($bool, r'Defaults', '\$bool');
    BuiltValueNullFieldError.checkNotNull(integer, r'Defaults', 'integer');
    BuiltValueNullFieldError.checkNotNull($double, r'Defaults', '\$double');
    BuiltValueNullFieldError.checkNotNull($num, r'Defaults', '\$num');
    BuiltValueNullFieldError.checkNotNull(string, r'Defaults', 'string');
    BuiltValueNullFieldError.checkNotNull(stringBinary, r'Defaults', 'stringBinary');
    BuiltValueNullFieldError.checkNotNull(list, r'Defaults', 'list');
    BuiltValueNullFieldError.checkNotNull(listNever, r'Defaults', 'listNever');
    BuiltValueNullFieldError.checkNotNull(listString, r'Defaults', 'listString');
    BuiltValueNullFieldError.checkNotNull(objectMap, r'Defaults', 'objectMap');
    BuiltValueNullFieldError.checkNotNull(objectArray, r'Defaults', 'objectArray');
    BuiltValueNullFieldError.checkNotNull(objectBool, r'Defaults', 'objectBool');
  }

  @override
  Defaults rebuild(void Function(DefaultsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DefaultsBuilder toBuilder() => DefaultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Defaults &&
        $bool == other.$bool &&
        integer == other.integer &&
        $double == other.$double &&
        $num == other.$num &&
        string == other.string &&
        contentString == other.contentString &&
        stringBinary == other.stringBinary &&
        list == other.list &&
        listNever == other.listNever &&
        listString == other.listString &&
        objectMap == other.objectMap &&
        objectArray == other.objectArray &&
        objectBool == other.objectBool;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, $bool.hashCode);
    _$hash = $jc(_$hash, integer.hashCode);
    _$hash = $jc(_$hash, $double.hashCode);
    _$hash = $jc(_$hash, $num.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, contentString.hashCode);
    _$hash = $jc(_$hash, stringBinary.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jc(_$hash, listNever.hashCode);
    _$hash = $jc(_$hash, listString.hashCode);
    _$hash = $jc(_$hash, objectMap.hashCode);
    _$hash = $jc(_$hash, objectArray.hashCode);
    _$hash = $jc(_$hash, objectBool.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Defaults')
          ..add('\$bool', $bool)
          ..add('integer', integer)
          ..add('\$double', $double)
          ..add('\$num', $num)
          ..add('string', string)
          ..add('contentString', contentString)
          ..add('stringBinary', stringBinary)
          ..add('list', list)
          ..add('listNever', listNever)
          ..add('listString', listString)
          ..add('objectMap', objectMap)
          ..add('objectArray', objectArray)
          ..add('objectBool', objectBool))
        .toString();
  }
}

class DefaultsBuilder implements Builder<Defaults, DefaultsBuilder>, $DefaultsInterfaceBuilder {
  _$Defaults? _$v;

  bool? _$bool;
  bool? get $bool => _$this._$bool;
  set $bool(covariant bool? $bool) => _$this._$bool = $bool;

  int? _integer;
  int? get integer => _$this._integer;
  set integer(covariant int? integer) => _$this._integer = integer;

  double? _$double;
  double? get $double => _$this._$double;
  set $double(covariant double? $double) => _$this._$double = $double;

  num? _$num;
  num? get $num => _$this._$num;
  set $num(covariant num? $num) => _$this._$num = $num;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  ContentStringBuilder<int>? _contentString;
  ContentStringBuilder<int> get contentString => _$this._contentString ??= ContentStringBuilder<int>();
  set contentString(covariant ContentStringBuilder<int>? contentString) => _$this._contentString = contentString;

  Uint8List? _stringBinary;
  Uint8List? get stringBinary => _$this._stringBinary;
  set stringBinary(covariant Uint8List? stringBinary) => _$this._stringBinary = stringBinary;

  ListBuilder<JsonObject>? _list;
  ListBuilder<JsonObject> get list => _$this._list ??= ListBuilder<JsonObject>();
  set list(covariant ListBuilder<JsonObject>? list) => _$this._list = list;

  ListBuilder<Never>? _listNever;
  ListBuilder<Never> get listNever => _$this._listNever ??= ListBuilder<Never>();
  set listNever(covariant ListBuilder<Never>? listNever) => _$this._listNever = listNever;

  ListBuilder<String>? _listString;
  ListBuilder<String> get listString => _$this._listString ??= ListBuilder<String>();
  set listString(covariant ListBuilder<String>? listString) => _$this._listString = listString;

  JsonObject? _objectMap;
  JsonObject? get objectMap => _$this._objectMap;
  set objectMap(covariant JsonObject? objectMap) => _$this._objectMap = objectMap;

  JsonObject? _objectArray;
  JsonObject? get objectArray => _$this._objectArray;
  set objectArray(covariant JsonObject? objectArray) => _$this._objectArray = objectArray;

  JsonObject? _objectBool;
  JsonObject? get objectBool => _$this._objectBool;
  set objectBool(covariant JsonObject? objectBool) => _$this._objectBool = objectBool;

  DefaultsBuilder() {
    Defaults._defaults(this);
  }

  DefaultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _$bool = $v.$bool;
      _integer = $v.integer;
      _$double = $v.$double;
      _$num = $v.$num;
      _string = $v.string;
      _contentString = $v.contentString?.toBuilder();
      _stringBinary = $v.stringBinary;
      _list = $v.list.toBuilder();
      _listNever = $v.listNever.toBuilder();
      _listString = $v.listString.toBuilder();
      _objectMap = $v.objectMap;
      _objectArray = $v.objectArray;
      _objectBool = $v.objectBool;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Defaults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Defaults;
  }

  @override
  void update(void Function(DefaultsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Defaults build() => _build();

  _$Defaults _build() {
    Defaults._validate(this);
    _$Defaults _$result;
    try {
      _$result = _$v ??
          _$Defaults._(
              $bool: BuiltValueNullFieldError.checkNotNull($bool, r'Defaults', '\$bool'),
              integer: BuiltValueNullFieldError.checkNotNull(integer, r'Defaults', 'integer'),
              $double: BuiltValueNullFieldError.checkNotNull($double, r'Defaults', '\$double'),
              $num: BuiltValueNullFieldError.checkNotNull($num, r'Defaults', '\$num'),
              string: BuiltValueNullFieldError.checkNotNull(string, r'Defaults', 'string'),
              contentString: _contentString?.build(),
              stringBinary: BuiltValueNullFieldError.checkNotNull(stringBinary, r'Defaults', 'stringBinary'),
              list: list.build(),
              listNever: listNever.build(),
              listString: listString.build(),
              objectMap: BuiltValueNullFieldError.checkNotNull(objectMap, r'Defaults', 'objectMap'),
              objectArray: BuiltValueNullFieldError.checkNotNull(objectArray, r'Defaults', 'objectArray'),
              objectBool: BuiltValueNullFieldError.checkNotNull(objectBool, r'Defaults', 'objectBool'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contentString';
        _contentString?.build();

        _$failedField = 'list';
        list.build();
        _$failedField = 'listNever';
        listNever.build();
        _$failedField = 'listString';
        listString.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Defaults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $AdditionalPropertiesInterfaceBuilder {
  void replace($AdditionalPropertiesInterface other);
  void update(void Function($AdditionalPropertiesInterfaceBuilder) updates);
  MapBuilder<String, JsonObject> get emptySchemaBool;
  set emptySchemaBool(MapBuilder<String, JsonObject>? emptySchemaBool);

  MapBuilder<String, JsonObject> get emptySchema;
  set emptySchema(MapBuilder<String, JsonObject>? emptySchema);

  MapBuilder<String, BuiltMap<String, JsonObject>> get nested;
  set nested(MapBuilder<String, BuiltMap<String, JsonObject>>? nested);

  MapBuilder<String, JsonObject> get object;
  set object(MapBuilder<String, JsonObject>? object);

  MapBuilder<String, JsonObject?> get objectNullable;
  set objectNullable(MapBuilder<String, JsonObject?>? objectNullable);

  MapBuilder<String, bool> get $bool;
  set $bool(MapBuilder<String, bool>? $bool);

  MapBuilder<String, int> get integer;
  set integer(MapBuilder<String, int>? integer);

  MapBuilder<String, double> get $double;
  set $double(MapBuilder<String, double>? $double);

  MapBuilder<String, num> get $num;
  set $num(MapBuilder<String, num>? $num);

  MapBuilder<String, String> get string;
  set string(MapBuilder<String, String>? string);

  MapBuilder<String, ContentString<int>?> get contentString;
  set contentString(MapBuilder<String, ContentString<int>?>? contentString);

  MapBuilder<String, Uint8List> get stringBinary;
  set stringBinary(MapBuilder<String, Uint8List>? stringBinary);

  MapBuilder<String, BuiltList<JsonObject>> get list;
  set list(MapBuilder<String, BuiltList<JsonObject>>? list);

  MapBuilder<String, BuiltList<Never>> get listNever;
  set listNever(MapBuilder<String, BuiltList<Never>>? listNever);

  MapBuilder<String, BuiltList<String>> get listString;
  set listString(MapBuilder<String, BuiltList<String>>? listString);
}

class _$AdditionalProperties extends AdditionalProperties {
  @override
  final BuiltMap<String, JsonObject>? emptySchemaBool;
  @override
  final BuiltMap<String, JsonObject>? emptySchema;
  @override
  final BuiltMap<String, BuiltMap<String, JsonObject>>? nested;
  @override
  final BuiltMap<String, JsonObject>? object;
  @override
  final BuiltMap<String, JsonObject?>? objectNullable;
  @override
  final BuiltMap<String, bool>? $bool;
  @override
  final BuiltMap<String, int>? integer;
  @override
  final BuiltMap<String, double>? $double;
  @override
  final BuiltMap<String, num>? $num;
  @override
  final BuiltMap<String, String>? string;
  @override
  final BuiltMap<String, ContentString<int>?>? contentString;
  @override
  final BuiltMap<String, Uint8List>? stringBinary;
  @override
  final BuiltMap<String, BuiltList<JsonObject>>? list;
  @override
  final BuiltMap<String, BuiltList<Never>>? listNever;
  @override
  final BuiltMap<String, BuiltList<String>>? listString;

  factory _$AdditionalProperties([void Function(AdditionalPropertiesBuilder)? updates]) =>
      (AdditionalPropertiesBuilder()..update(updates))._build();

  _$AdditionalProperties._(
      {this.emptySchemaBool,
      this.emptySchema,
      this.nested,
      this.object,
      this.objectNullable,
      this.$bool,
      this.integer,
      this.$double,
      this.$num,
      this.string,
      this.contentString,
      this.stringBinary,
      this.list,
      this.listNever,
      this.listString})
      : super._();

  @override
  AdditionalProperties rebuild(void Function(AdditionalPropertiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdditionalPropertiesBuilder toBuilder() => AdditionalPropertiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdditionalProperties &&
        emptySchemaBool == other.emptySchemaBool &&
        emptySchema == other.emptySchema &&
        nested == other.nested &&
        object == other.object &&
        objectNullable == other.objectNullable &&
        $bool == other.$bool &&
        integer == other.integer &&
        $double == other.$double &&
        $num == other.$num &&
        string == other.string &&
        contentString == other.contentString &&
        stringBinary == other.stringBinary &&
        list == other.list &&
        listNever == other.listNever &&
        listString == other.listString;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, emptySchemaBool.hashCode);
    _$hash = $jc(_$hash, emptySchema.hashCode);
    _$hash = $jc(_$hash, nested.hashCode);
    _$hash = $jc(_$hash, object.hashCode);
    _$hash = $jc(_$hash, objectNullable.hashCode);
    _$hash = $jc(_$hash, $bool.hashCode);
    _$hash = $jc(_$hash, integer.hashCode);
    _$hash = $jc(_$hash, $double.hashCode);
    _$hash = $jc(_$hash, $num.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, contentString.hashCode);
    _$hash = $jc(_$hash, stringBinary.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jc(_$hash, listNever.hashCode);
    _$hash = $jc(_$hash, listString.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdditionalProperties')
          ..add('emptySchemaBool', emptySchemaBool)
          ..add('emptySchema', emptySchema)
          ..add('nested', nested)
          ..add('object', object)
          ..add('objectNullable', objectNullable)
          ..add('\$bool', $bool)
          ..add('integer', integer)
          ..add('\$double', $double)
          ..add('\$num', $num)
          ..add('string', string)
          ..add('contentString', contentString)
          ..add('stringBinary', stringBinary)
          ..add('list', list)
          ..add('listNever', listNever)
          ..add('listString', listString))
        .toString();
  }
}

class AdditionalPropertiesBuilder
    implements Builder<AdditionalProperties, AdditionalPropertiesBuilder>, $AdditionalPropertiesInterfaceBuilder {
  _$AdditionalProperties? _$v;

  MapBuilder<String, JsonObject>? _emptySchemaBool;
  MapBuilder<String, JsonObject> get emptySchemaBool => _$this._emptySchemaBool ??= MapBuilder<String, JsonObject>();
  set emptySchemaBool(covariant MapBuilder<String, JsonObject>? emptySchemaBool) =>
      _$this._emptySchemaBool = emptySchemaBool;

  MapBuilder<String, JsonObject>? _emptySchema;
  MapBuilder<String, JsonObject> get emptySchema => _$this._emptySchema ??= MapBuilder<String, JsonObject>();
  set emptySchema(covariant MapBuilder<String, JsonObject>? emptySchema) => _$this._emptySchema = emptySchema;

  MapBuilder<String, BuiltMap<String, JsonObject>>? _nested;
  MapBuilder<String, BuiltMap<String, JsonObject>> get nested =>
      _$this._nested ??= MapBuilder<String, BuiltMap<String, JsonObject>>();
  set nested(covariant MapBuilder<String, BuiltMap<String, JsonObject>>? nested) => _$this._nested = nested;

  MapBuilder<String, JsonObject>? _object;
  MapBuilder<String, JsonObject> get object => _$this._object ??= MapBuilder<String, JsonObject>();
  set object(covariant MapBuilder<String, JsonObject>? object) => _$this._object = object;

  MapBuilder<String, JsonObject?>? _objectNullable;
  MapBuilder<String, JsonObject?> get objectNullable => _$this._objectNullable ??= MapBuilder<String, JsonObject?>();
  set objectNullable(covariant MapBuilder<String, JsonObject?>? objectNullable) =>
      _$this._objectNullable = objectNullable;

  MapBuilder<String, bool>? _$bool;
  MapBuilder<String, bool> get $bool => _$this._$bool ??= MapBuilder<String, bool>();
  set $bool(covariant MapBuilder<String, bool>? $bool) => _$this._$bool = $bool;

  MapBuilder<String, int>? _integer;
  MapBuilder<String, int> get integer => _$this._integer ??= MapBuilder<String, int>();
  set integer(covariant MapBuilder<String, int>? integer) => _$this._integer = integer;

  MapBuilder<String, double>? _$double;
  MapBuilder<String, double> get $double => _$this._$double ??= MapBuilder<String, double>();
  set $double(covariant MapBuilder<String, double>? $double) => _$this._$double = $double;

  MapBuilder<String, num>? _$num;
  MapBuilder<String, num> get $num => _$this._$num ??= MapBuilder<String, num>();
  set $num(covariant MapBuilder<String, num>? $num) => _$this._$num = $num;

  MapBuilder<String, String>? _string;
  MapBuilder<String, String> get string => _$this._string ??= MapBuilder<String, String>();
  set string(covariant MapBuilder<String, String>? string) => _$this._string = string;

  MapBuilder<String, ContentString<int>?>? _contentString;
  MapBuilder<String, ContentString<int>?> get contentString =>
      _$this._contentString ??= MapBuilder<String, ContentString<int>?>();
  set contentString(covariant MapBuilder<String, ContentString<int>?>? contentString) =>
      _$this._contentString = contentString;

  MapBuilder<String, Uint8List>? _stringBinary;
  MapBuilder<String, Uint8List> get stringBinary => _$this._stringBinary ??= MapBuilder<String, Uint8List>();
  set stringBinary(covariant MapBuilder<String, Uint8List>? stringBinary) => _$this._stringBinary = stringBinary;

  MapBuilder<String, BuiltList<JsonObject>>? _list;
  MapBuilder<String, BuiltList<JsonObject>> get list => _$this._list ??= MapBuilder<String, BuiltList<JsonObject>>();
  set list(covariant MapBuilder<String, BuiltList<JsonObject>>? list) => _$this._list = list;

  MapBuilder<String, BuiltList<Never>>? _listNever;
  MapBuilder<String, BuiltList<Never>> get listNever => _$this._listNever ??= MapBuilder<String, BuiltList<Never>>();
  set listNever(covariant MapBuilder<String, BuiltList<Never>>? listNever) => _$this._listNever = listNever;

  MapBuilder<String, BuiltList<String>>? _listString;
  MapBuilder<String, BuiltList<String>> get listString =>
      _$this._listString ??= MapBuilder<String, BuiltList<String>>();
  set listString(covariant MapBuilder<String, BuiltList<String>>? listString) => _$this._listString = listString;

  AdditionalPropertiesBuilder() {
    AdditionalProperties._defaults(this);
  }

  AdditionalPropertiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _emptySchemaBool = $v.emptySchemaBool?.toBuilder();
      _emptySchema = $v.emptySchema?.toBuilder();
      _nested = $v.nested?.toBuilder();
      _object = $v.object?.toBuilder();
      _objectNullable = $v.objectNullable?.toBuilder();
      _$bool = $v.$bool?.toBuilder();
      _integer = $v.integer?.toBuilder();
      _$double = $v.$double?.toBuilder();
      _$num = $v.$num?.toBuilder();
      _string = $v.string?.toBuilder();
      _contentString = $v.contentString?.toBuilder();
      _stringBinary = $v.stringBinary?.toBuilder();
      _list = $v.list?.toBuilder();
      _listNever = $v.listNever?.toBuilder();
      _listString = $v.listString?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AdditionalProperties other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdditionalProperties;
  }

  @override
  void update(void Function(AdditionalPropertiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdditionalProperties build() => _build();

  _$AdditionalProperties _build() {
    AdditionalProperties._validate(this);
    _$AdditionalProperties _$result;
    try {
      _$result = _$v ??
          _$AdditionalProperties._(
              emptySchemaBool: _emptySchemaBool?.build(),
              emptySchema: _emptySchema?.build(),
              nested: _nested?.build(),
              object: _object?.build(),
              objectNullable: _objectNullable?.build(),
              $bool: _$bool?.build(),
              integer: _integer?.build(),
              $double: _$double?.build(),
              $num: _$num?.build(),
              string: _string?.build(),
              contentString: _contentString?.build(),
              stringBinary: _stringBinary?.build(),
              list: _list?.build(),
              listNever: _listNever?.build(),
              listString: _listString?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'emptySchemaBool';
        _emptySchemaBool?.build();
        _$failedField = 'emptySchema';
        _emptySchema?.build();
        _$failedField = 'nested';
        _nested?.build();
        _$failedField = 'object';
        _object?.build();
        _$failedField = 'objectNullable';
        _objectNullable?.build();
        _$failedField = '\$bool';
        _$bool?.build();
        _$failedField = 'integer';
        _integer?.build();
        _$failedField = '\$double';
        _$double?.build();
        _$failedField = '\$num';
        _$num?.build();
        _$failedField = 'string';
        _string?.build();
        _$failedField = 'contentString';
        _contentString?.build();
        _$failedField = 'stringBinary';
        _stringBinary?.build();
        _$failedField = 'list';
        _list?.build();
        _$failedField = 'listNever';
        _listNever?.build();
        _$failedField = 'listString';
        _listString?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'AdditionalProperties', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
