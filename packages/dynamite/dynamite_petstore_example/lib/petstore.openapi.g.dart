// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petstore.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pet> _$petSerializer = _$PetSerializer();

class _$PetSerializer implements StructuredSerializer<Pet> {
  @override
  final Iterable<Type> types = const [Pet, _$Pet];
  @override
  final String wireName = 'Pet';

  @override
  Iterable<Object?> serialize(Serializers serializers, Pet object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.tag;
    if (value != null) {
      result
        ..add('tag')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Pet deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'tag':
          result.tag = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class NewPetInterfaceBuilder {
  void replace(NewPetInterface other);
  void update(void Function(NewPetInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get tag;
  set tag(String? tag);
}

class _$NewPet extends NewPet {
  @override
  final String name;
  @override
  final String? tag;

  factory _$NewPet([void Function(NewPetBuilder)? updates]) => (NewPetBuilder()..update(updates))._build();

  _$NewPet._({required this.name, this.tag}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'NewPet', 'name');
  }

  @override
  NewPet rebuild(void Function(NewPetBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NewPetBuilder toBuilder() => NewPetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewPet && name == other.name && tag == other.tag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, tag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewPet')
          ..add('name', name)
          ..add('tag', tag))
        .toString();
  }
}

class NewPetBuilder implements Builder<NewPet, NewPetBuilder>, NewPetInterfaceBuilder {
  _$NewPet? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _tag;
  String? get tag => _$this._tag;
  set tag(covariant String? tag) => _$this._tag = tag;

  NewPetBuilder();

  NewPetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _tag = $v.tag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NewPet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewPet;
  }

  @override
  void update(void Function(NewPetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewPet build() => _build();

  _$NewPet _build() {
    final _$result = _$v ?? _$NewPet._(name: BuiltValueNullFieldError.checkNotNull(name, r'NewPet', 'name'), tag: tag);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class Pet_1InterfaceBuilder {
  void replace(Pet_1Interface other);
  void update(void Function(Pet_1InterfaceBuilder) updates);
  int? get id;
  set id(int? id);
}

abstract mixin class PetInterfaceBuilder implements NewPetInterfaceBuilder, Pet_1InterfaceBuilder {
  void replace(covariant PetInterface other);
  void update(void Function(PetInterfaceBuilder) updates);
  String? get name;
  set name(covariant String? name);

  String? get tag;
  set tag(covariant String? tag);

  int? get id;
  set id(covariant int? id);
}

class _$Pet extends Pet {
  @override
  final String name;
  @override
  final String? tag;
  @override
  final int id;

  factory _$Pet([void Function(PetBuilder)? updates]) => (PetBuilder()..update(updates))._build();

  _$Pet._({required this.name, this.tag, required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Pet', 'name');
    BuiltValueNullFieldError.checkNotNull(id, r'Pet', 'id');
  }

  @override
  Pet rebuild(void Function(PetBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  PetBuilder toBuilder() => PetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pet && name == other.name && tag == other.tag && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, tag.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Pet')
          ..add('name', name)
          ..add('tag', tag)
          ..add('id', id))
        .toString();
  }
}

class PetBuilder implements Builder<Pet, PetBuilder>, PetInterfaceBuilder {
  _$Pet? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _tag;
  String? get tag => _$this._tag;
  set tag(covariant String? tag) => _$this._tag = tag;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  PetBuilder();

  PetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _tag = $v.tag;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Pet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Pet;
  }

  @override
  void update(void Function(PetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Pet build() => _build();

  _$Pet _build() {
    final _$result = _$v ??
        _$Pet._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'Pet', 'name'),
            tag: tag,
            id: BuiltValueNullFieldError.checkNotNull(id, r'Pet', 'id'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ErrorInterfaceBuilder {
  void replace(ErrorInterface other);
  void update(void Function(ErrorInterfaceBuilder) updates);
  int? get code;
  set code(int? code);

  String? get message;
  set message(String? message);
}

class _$Error extends Error {
  @override
  final int code;
  @override
  final String message;

  factory _$Error([void Function(ErrorBuilder)? updates]) => (ErrorBuilder()..update(updates))._build();

  _$Error._({required this.code, required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'Error', 'code');
    BuiltValueNullFieldError.checkNotNull(message, r'Error', 'message');
  }

  @override
  Error rebuild(void Function(ErrorBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ErrorBuilder toBuilder() => ErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Error && code == other.code && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Error')
          ..add('code', code)
          ..add('message', message))
        .toString();
  }
}

class ErrorBuilder implements Builder<Error, ErrorBuilder>, ErrorInterfaceBuilder {
  _$Error? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(covariant int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  ErrorBuilder();

  ErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Error other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Error;
  }

  @override
  void update(void Function(ErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Error build() => _build();

  _$Error _build() {
    final _$result = _$v ??
        _$Error._(
            code: BuiltValueNullFieldError.checkNotNull(code, r'Error', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(message, r'Error', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
