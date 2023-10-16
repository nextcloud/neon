// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Parameter> _$parameterSerializer = _$ParameterSerializer();

class _$ParameterSerializer implements StructuredSerializer<Parameter> {
  @override
  final Iterable<Type> types = const [Parameter, _$Parameter];
  @override
  final String wireName = 'Parameter';

  @override
  Iterable<Object?> serialize(Serializers serializers, Parameter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'in',
      serializers.serialize(object.$in, specifiedType: const FullType(String)),
      'required',
      serializers.serialize(object.required, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.schema;
    if (value != null) {
      result
        ..add('schema')
        ..add(serializers.serialize(value, specifiedType: const FullType(Schema)));
    }
    return result;
  }

  @override
  Parameter deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ParameterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'in':
          result.$in = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'required':
          result.required = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'schema':
          result.schema.replace(serializers.deserialize(value, specifiedType: const FullType(Schema))! as Schema);
          break;
      }
    }

    return result.build();
  }
}

class _$Parameter extends Parameter {
  @override
  final String name;
  @override
  final String $in;
  @override
  final String? description;
  @override
  final bool required;
  @override
  final Schema? schema;

  factory _$Parameter([void Function(ParameterBuilder)? updates]) => (ParameterBuilder()..update(updates))._build();

  _$Parameter._({required this.name, required this.$in, this.description, required this.required, this.schema})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Parameter', 'name');
    BuiltValueNullFieldError.checkNotNull($in, r'Parameter', '\$in');
    BuiltValueNullFieldError.checkNotNull(required, r'Parameter', 'required');
  }

  @override
  Parameter rebuild(void Function(ParameterBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ParameterBuilder toBuilder() => ParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Parameter &&
        name == other.name &&
        $in == other.$in &&
        required == other.required &&
        schema == other.schema;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, $in.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, schema.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Parameter')
          ..add('name', name)
          ..add('\$in', $in)
          ..add('description', description)
          ..add('required', required)
          ..add('schema', schema))
        .toString();
  }
}

class ParameterBuilder implements Builder<Parameter, ParameterBuilder> {
  _$Parameter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _$in;
  String? get $in => _$this._$in;
  set $in(String? $in) => _$this._$in = $in;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _required;
  bool? get required => _$this._required;
  set required(bool? required) => _$this._required = required;

  SchemaBuilder? _schema;
  SchemaBuilder get schema => _$this._schema ??= SchemaBuilder();
  set schema(SchemaBuilder? schema) => _$this._schema = schema;

  ParameterBuilder();

  ParameterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$in = $v.$in;
      _description = $v.description;
      _required = $v.required;
      _schema = $v.schema?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Parameter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Parameter;
  }

  @override
  void update(void Function(ParameterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Parameter build() => _build();

  _$Parameter _build() {
    Parameter._defaults(this);
    _$Parameter _$result;
    try {
      _$result = _$v ??
          _$Parameter._(
              name: BuiltValueNullFieldError.checkNotNull(name, r'Parameter', 'name'),
              $in: BuiltValueNullFieldError.checkNotNull($in, r'Parameter', '\$in'),
              description: description,
              required: BuiltValueNullFieldError.checkNotNull(required, r'Parameter', 'required'),
              schema: _schema?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schema';
        _schema?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Parameter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
