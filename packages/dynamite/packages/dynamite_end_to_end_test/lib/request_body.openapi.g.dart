// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetObjectRequestApplicationJson> _$getObjectRequestApplicationJsonSerializer =
    _$GetObjectRequestApplicationJsonSerializer();
Serializer<PutObjectRequestApplicationJson> _$putObjectRequestApplicationJsonSerializer =
    _$PutObjectRequestApplicationJsonSerializer();
Serializer<PostObjectRequestApplicationJson> _$postObjectRequestApplicationJsonSerializer =
    _$PostObjectRequestApplicationJsonSerializer();
Serializer<DeleteObjectRequestApplicationJson> _$deleteObjectRequestApplicationJsonSerializer =
    _$DeleteObjectRequestApplicationJsonSerializer();

class _$GetObjectRequestApplicationJsonSerializer implements StructuredSerializer<GetObjectRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [GetObjectRequestApplicationJson, _$GetObjectRequestApplicationJson];
  @override
  final String wireName = 'GetObjectRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetObjectRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.test;
    if (value != null) {
      result
        ..add('test')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GetObjectRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GetObjectRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'test':
          result.test = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PutObjectRequestApplicationJsonSerializer implements StructuredSerializer<PutObjectRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [PutObjectRequestApplicationJson, _$PutObjectRequestApplicationJson];
  @override
  final String wireName = 'PutObjectRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, PutObjectRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'test',
      serializers.serialize(object.test, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PutObjectRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PutObjectRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'test':
          result.test = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PostObjectRequestApplicationJsonSerializer implements StructuredSerializer<PostObjectRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [PostObjectRequestApplicationJson, _$PostObjectRequestApplicationJson];
  @override
  final String wireName = 'PostObjectRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostObjectRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.test;
    if (value != null) {
      result
        ..add('test')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PostObjectRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PostObjectRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'test':
          result.test = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DeleteObjectRequestApplicationJsonSerializer
    implements StructuredSerializer<DeleteObjectRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [DeleteObjectRequestApplicationJson, _$DeleteObjectRequestApplicationJson];
  @override
  final String wireName = 'DeleteObjectRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, DeleteObjectRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.test;
    if (value != null) {
      result
        ..add('test')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DeleteObjectRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeleteObjectRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'test':
          result.test = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $GetObjectRequestApplicationJsonInterfaceBuilder {
  void replace($GetObjectRequestApplicationJsonInterface other);
  void update(void Function($GetObjectRequestApplicationJsonInterfaceBuilder) updates);
  String? get test;
  set test(String? test);
}

class _$GetObjectRequestApplicationJson extends GetObjectRequestApplicationJson {
  @override
  final String? test;

  factory _$GetObjectRequestApplicationJson([void Function(GetObjectRequestApplicationJsonBuilder)? updates]) =>
      (GetObjectRequestApplicationJsonBuilder()..update(updates))._build();

  _$GetObjectRequestApplicationJson._({this.test}) : super._();

  @override
  GetObjectRequestApplicationJson rebuild(void Function(GetObjectRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetObjectRequestApplicationJsonBuilder toBuilder() => GetObjectRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetObjectRequestApplicationJson && test == other.test;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, test.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetObjectRequestApplicationJson')..add('test', test)).toString();
  }
}

class GetObjectRequestApplicationJsonBuilder
    implements
        Builder<GetObjectRequestApplicationJson, GetObjectRequestApplicationJsonBuilder>,
        $GetObjectRequestApplicationJsonInterfaceBuilder {
  _$GetObjectRequestApplicationJson? _$v;

  String? _test;
  String? get test => _$this._test;
  set test(covariant String? test) => _$this._test = test;

  GetObjectRequestApplicationJsonBuilder() {
    GetObjectRequestApplicationJson._defaults(this);
  }

  GetObjectRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _test = $v.test;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GetObjectRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetObjectRequestApplicationJson;
  }

  @override
  void update(void Function(GetObjectRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetObjectRequestApplicationJson build() => _build();

  _$GetObjectRequestApplicationJson _build() {
    GetObjectRequestApplicationJson._validate(this);
    final _$result = _$v ?? _$GetObjectRequestApplicationJson._(test: test);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $PutObjectRequestApplicationJsonInterfaceBuilder {
  void replace($PutObjectRequestApplicationJsonInterface other);
  void update(void Function($PutObjectRequestApplicationJsonInterfaceBuilder) updates);
  String? get test;
  set test(String? test);
}

class _$PutObjectRequestApplicationJson extends PutObjectRequestApplicationJson {
  @override
  final String test;

  factory _$PutObjectRequestApplicationJson([void Function(PutObjectRequestApplicationJsonBuilder)? updates]) =>
      (PutObjectRequestApplicationJsonBuilder()..update(updates))._build();

  _$PutObjectRequestApplicationJson._({required this.test}) : super._() {
    BuiltValueNullFieldError.checkNotNull(test, r'PutObjectRequestApplicationJson', 'test');
  }

  @override
  PutObjectRequestApplicationJson rebuild(void Function(PutObjectRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PutObjectRequestApplicationJsonBuilder toBuilder() => PutObjectRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PutObjectRequestApplicationJson && test == other.test;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, test.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PutObjectRequestApplicationJson')..add('test', test)).toString();
  }
}

class PutObjectRequestApplicationJsonBuilder
    implements
        Builder<PutObjectRequestApplicationJson, PutObjectRequestApplicationJsonBuilder>,
        $PutObjectRequestApplicationJsonInterfaceBuilder {
  _$PutObjectRequestApplicationJson? _$v;

  String? _test;
  String? get test => _$this._test;
  set test(covariant String? test) => _$this._test = test;

  PutObjectRequestApplicationJsonBuilder() {
    PutObjectRequestApplicationJson._defaults(this);
  }

  PutObjectRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _test = $v.test;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PutObjectRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PutObjectRequestApplicationJson;
  }

  @override
  void update(void Function(PutObjectRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PutObjectRequestApplicationJson build() => _build();

  _$PutObjectRequestApplicationJson _build() {
    PutObjectRequestApplicationJson._validate(this);
    final _$result = _$v ??
        _$PutObjectRequestApplicationJson._(
            test: BuiltValueNullFieldError.checkNotNull(test, r'PutObjectRequestApplicationJson', 'test'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $PostObjectRequestApplicationJsonInterfaceBuilder {
  void replace($PostObjectRequestApplicationJsonInterface other);
  void update(void Function($PostObjectRequestApplicationJsonInterfaceBuilder) updates);
  String? get test;
  set test(String? test);
}

class _$PostObjectRequestApplicationJson extends PostObjectRequestApplicationJson {
  @override
  final String? test;

  factory _$PostObjectRequestApplicationJson([void Function(PostObjectRequestApplicationJsonBuilder)? updates]) =>
      (PostObjectRequestApplicationJsonBuilder()..update(updates))._build();

  _$PostObjectRequestApplicationJson._({this.test}) : super._();

  @override
  PostObjectRequestApplicationJson rebuild(void Function(PostObjectRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostObjectRequestApplicationJsonBuilder toBuilder() => PostObjectRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostObjectRequestApplicationJson && test == other.test;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, test.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostObjectRequestApplicationJson')..add('test', test)).toString();
  }
}

class PostObjectRequestApplicationJsonBuilder
    implements
        Builder<PostObjectRequestApplicationJson, PostObjectRequestApplicationJsonBuilder>,
        $PostObjectRequestApplicationJsonInterfaceBuilder {
  _$PostObjectRequestApplicationJson? _$v;

  String? _test;
  String? get test => _$this._test;
  set test(covariant String? test) => _$this._test = test;

  PostObjectRequestApplicationJsonBuilder() {
    PostObjectRequestApplicationJson._defaults(this);
  }

  PostObjectRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _test = $v.test;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PostObjectRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostObjectRequestApplicationJson;
  }

  @override
  void update(void Function(PostObjectRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostObjectRequestApplicationJson build() => _build();

  _$PostObjectRequestApplicationJson _build() {
    PostObjectRequestApplicationJson._validate(this);
    final _$result = _$v ?? _$PostObjectRequestApplicationJson._(test: test);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $DeleteObjectRequestApplicationJsonInterfaceBuilder {
  void replace($DeleteObjectRequestApplicationJsonInterface other);
  void update(void Function($DeleteObjectRequestApplicationJsonInterfaceBuilder) updates);
  String? get test;
  set test(String? test);
}

class _$DeleteObjectRequestApplicationJson extends DeleteObjectRequestApplicationJson {
  @override
  final String? test;

  factory _$DeleteObjectRequestApplicationJson([void Function(DeleteObjectRequestApplicationJsonBuilder)? updates]) =>
      (DeleteObjectRequestApplicationJsonBuilder()..update(updates))._build();

  _$DeleteObjectRequestApplicationJson._({this.test}) : super._();

  @override
  DeleteObjectRequestApplicationJson rebuild(void Function(DeleteObjectRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteObjectRequestApplicationJsonBuilder toBuilder() => DeleteObjectRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteObjectRequestApplicationJson && test == other.test;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, test.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteObjectRequestApplicationJson')..add('test', test)).toString();
  }
}

class DeleteObjectRequestApplicationJsonBuilder
    implements
        Builder<DeleteObjectRequestApplicationJson, DeleteObjectRequestApplicationJsonBuilder>,
        $DeleteObjectRequestApplicationJsonInterfaceBuilder {
  _$DeleteObjectRequestApplicationJson? _$v;

  String? _test;
  String? get test => _$this._test;
  set test(covariant String? test) => _$this._test = test;

  DeleteObjectRequestApplicationJsonBuilder() {
    DeleteObjectRequestApplicationJson._defaults(this);
  }

  DeleteObjectRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _test = $v.test;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DeleteObjectRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteObjectRequestApplicationJson;
  }

  @override
  void update(void Function(DeleteObjectRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteObjectRequestApplicationJson build() => _build();

  _$DeleteObjectRequestApplicationJson _build() {
    DeleteObjectRequestApplicationJson._validate(this);
    final _$result = _$v ?? _$DeleteObjectRequestApplicationJson._(test: test);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
