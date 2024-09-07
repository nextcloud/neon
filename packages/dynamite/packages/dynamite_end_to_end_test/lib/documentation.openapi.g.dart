// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documentation.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HuntingSkill _$huntingSkillClueless = HuntingSkill._('clueless');
const HuntingSkill _$huntingSkillLazy = HuntingSkill._('lazy');
const HuntingSkill _$huntingSkillAdventurous = HuntingSkill._('adventurous');
const HuntingSkill _$huntingSkillAggressive = HuntingSkill._('aggressive');

HuntingSkill _$valueOfHuntingSkill(String name) {
  switch (name) {
    case 'clueless':
      return _$huntingSkillClueless;
    case 'lazy':
      return _$huntingSkillLazy;
    case 'adventurous':
      return _$huntingSkillAdventurous;
    case 'aggressive':
      return _$huntingSkillAggressive;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<HuntingSkill> _$huntingSkillValues = BuiltSet<HuntingSkill>(const <HuntingSkill>[
  _$huntingSkillClueless,
  _$huntingSkillLazy,
  _$huntingSkillAdventurous,
  _$huntingSkillAggressive,
]);

Serializer<Object2> _$object2Serializer = _$Object2Serializer();
Serializer<Object1> _$object1Serializer = _$Object1Serializer();
Serializer<NonRootClientSetModeRequestApplicationJson> _$nonRootClientSetModeRequestApplicationJsonSerializer =
    _$NonRootClientSetModeRequestApplicationJsonSerializer();
Serializer<Object4> _$object4Serializer = _$Object4Serializer();

class _$Object2Serializer implements StructuredSerializer<Object2> {
  @override
  final Iterable<Type> types = const [Object2, _$Object2];
  @override
  final String wireName = 'Object2';

  @override
  Iterable<Object?> serialize(Serializers serializers, Object2 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
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
  Object2 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Object2Builder();

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
      }
    }

    return result.build();
  }
}

class _$Object1Serializer implements StructuredSerializer<Object1> {
  @override
  final Iterable<Type> types = const [Object1, _$Object1];
  @override
  final String wireName = 'Object1';

  @override
  Iterable<Object?> serialize(Serializers serializers, Object1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
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
  Object1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Object1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'tag':
          result.tag = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NonRootClientSetModeRequestApplicationJsonSerializer
    implements StructuredSerializer<NonRootClientSetModeRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NonRootClientSetModeRequestApplicationJson,
    _$NonRootClientSetModeRequestApplicationJson
  ];
  @override
  final String wireName = 'NonRootClientSetModeRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, NonRootClientSetModeRequestApplicationJson object,
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
  NonRootClientSetModeRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NonRootClientSetModeRequestApplicationJsonBuilder();

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

class _$Object4Serializer implements StructuredSerializer<Object4> {
  @override
  final Iterable<Type> types = const [Object4, _$Object4];
  @override
  final String wireName = 'Object4';

  @override
  Iterable<Object?> serialize(Serializers serializers, Object4 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.html;
    if (value != null) {
      result
        ..add('html')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.htmlInCodeblock;
    if (value != null) {
      result
        ..add('html-in-codeblock')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.htmlAfterCodeBlock;
    if (value != null) {
      result
        ..add('html-after-code-block')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.htmlInCodeBlockAfterCodeBlock;
    if (value != null) {
      result
        ..add('html-in-code-block-after-code-block')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Object4 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Object4Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'html':
          result.html = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'html-in-codeblock':
          result.htmlInCodeblock = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'html-after-code-block':
          result.htmlAfterCodeBlock = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'html-in-code-block-after-code-block':
          result.htmlInCodeBlockAfterCodeBlock =
              serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $Object2InterfaceBuilder {
  void replace($Object2Interface other);
  void update(void Function($Object2InterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get tag;
  set tag(String? tag);
}

class _$Object2 extends Object2 {
  @override
  final String name;
  @override
  final String? tag;

  factory _$Object2([void Function(Object2Builder)? updates]) => (Object2Builder()..update(updates))._build();

  _$Object2._({required this.name, this.tag}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Object2', 'name');
  }

  @override
  Object2 rebuild(void Function(Object2Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  Object2Builder toBuilder() => Object2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Object2 && name == other.name && tag == other.tag;
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
    return (newBuiltValueToStringHelper(r'Object2')
          ..add('name', name)
          ..add('tag', tag))
        .toString();
  }
}

class Object2Builder implements Builder<Object2, Object2Builder>, $Object2InterfaceBuilder {
  _$Object2? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _tag;
  String? get tag => _$this._tag;
  set tag(covariant String? tag) => _$this._tag = tag;

  Object2Builder() {
    Object2._defaults(this);
  }

  Object2Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _tag = $v.tag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Object2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Object2;
  }

  @override
  void update(void Function(Object2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Object2 build() => _build();

  _$Object2 _build() {
    Object2._validate(this);
    final _$result =
        _$v ?? _$Object2._(name: BuiltValueNullFieldError.checkNotNull(name, r'Object2', 'name'), tag: tag);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Object1InterfaceBuilder implements $Object2InterfaceBuilder {
  void replace(covariant $Object1Interface other);
  void update(void Function($Object1InterfaceBuilder) updates);
  int? get id;
  set id(covariant int? id);

  String? get name;
  set name(covariant String? name);

  String? get tag;
  set tag(covariant String? tag);
}

class _$Object1 extends Object1 {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? tag;

  factory _$Object1([void Function(Object1Builder)? updates]) => (Object1Builder()..update(updates))._build();

  _$Object1._({required this.id, required this.name, this.tag}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Object1', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Object1', 'name');
  }

  @override
  Object1 rebuild(void Function(Object1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  Object1Builder toBuilder() => Object1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Object1 && id == other.id && name == other.name && tag == other.tag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, tag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Object1')
          ..add('id', id)
          ..add('name', name)
          ..add('tag', tag))
        .toString();
  }
}

class Object1Builder implements Builder<Object1, Object1Builder>, $Object1InterfaceBuilder {
  _$Object1? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _tag;
  String? get tag => _$this._tag;
  set tag(covariant String? tag) => _$this._tag = tag;

  Object1Builder() {
    Object1._defaults(this);
  }

  Object1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _tag = $v.tag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Object1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Object1;
  }

  @override
  void update(void Function(Object1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Object1 build() => _build();

  _$Object1 _build() {
    Object1._validate(this);
    final _$result = _$v ??
        _$Object1._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Object1', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name, r'Object1', 'name'),
            tag: tag);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $NonRootClientSetModeRequestApplicationJsonInterfaceBuilder {
  void replace($NonRootClientSetModeRequestApplicationJsonInterface other);
  void update(void Function($NonRootClientSetModeRequestApplicationJsonInterfaceBuilder) updates);
  String? get test;
  set test(String? test);
}

class _$NonRootClientSetModeRequestApplicationJson extends NonRootClientSetModeRequestApplicationJson {
  @override
  final String? test;

  factory _$NonRootClientSetModeRequestApplicationJson(
          [void Function(NonRootClientSetModeRequestApplicationJsonBuilder)? updates]) =>
      (NonRootClientSetModeRequestApplicationJsonBuilder()..update(updates))._build();

  _$NonRootClientSetModeRequestApplicationJson._({this.test}) : super._();

  @override
  NonRootClientSetModeRequestApplicationJson rebuild(
          void Function(NonRootClientSetModeRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NonRootClientSetModeRequestApplicationJsonBuilder toBuilder() =>
      NonRootClientSetModeRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NonRootClientSetModeRequestApplicationJson && test == other.test;
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
    return (newBuiltValueToStringHelper(r'NonRootClientSetModeRequestApplicationJson')..add('test', test)).toString();
  }
}

class NonRootClientSetModeRequestApplicationJsonBuilder
    implements
        Builder<NonRootClientSetModeRequestApplicationJson, NonRootClientSetModeRequestApplicationJsonBuilder>,
        $NonRootClientSetModeRequestApplicationJsonInterfaceBuilder {
  _$NonRootClientSetModeRequestApplicationJson? _$v;

  String? _test;
  String? get test => _$this._test;
  set test(covariant String? test) => _$this._test = test;

  NonRootClientSetModeRequestApplicationJsonBuilder() {
    NonRootClientSetModeRequestApplicationJson._defaults(this);
  }

  NonRootClientSetModeRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _test = $v.test;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NonRootClientSetModeRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NonRootClientSetModeRequestApplicationJson;
  }

  @override
  void update(void Function(NonRootClientSetModeRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NonRootClientSetModeRequestApplicationJson build() => _build();

  _$NonRootClientSetModeRequestApplicationJson _build() {
    NonRootClientSetModeRequestApplicationJson._validate(this);
    final _$result = _$v ?? _$NonRootClientSetModeRequestApplicationJson._(test: test);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Object4InterfaceBuilder {
  void replace($Object4Interface other);
  void update(void Function($Object4InterfaceBuilder) updates);
  String? get html;
  set html(String? html);

  String? get htmlInCodeblock;
  set htmlInCodeblock(String? htmlInCodeblock);

  String? get htmlAfterCodeBlock;
  set htmlAfterCodeBlock(String? htmlAfterCodeBlock);

  String? get htmlInCodeBlockAfterCodeBlock;
  set htmlInCodeBlockAfterCodeBlock(String? htmlInCodeBlockAfterCodeBlock);
}

class _$Object4 extends Object4 {
  @override
  final String? html;
  @override
  final String? htmlInCodeblock;
  @override
  final String? htmlAfterCodeBlock;
  @override
  final String? htmlInCodeBlockAfterCodeBlock;

  factory _$Object4([void Function(Object4Builder)? updates]) => (Object4Builder()..update(updates))._build();

  _$Object4._({this.html, this.htmlInCodeblock, this.htmlAfterCodeBlock, this.htmlInCodeBlockAfterCodeBlock})
      : super._();

  @override
  Object4 rebuild(void Function(Object4Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  Object4Builder toBuilder() => Object4Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Object4 &&
        html == other.html &&
        htmlInCodeblock == other.htmlInCodeblock &&
        htmlAfterCodeBlock == other.htmlAfterCodeBlock &&
        htmlInCodeBlockAfterCodeBlock == other.htmlInCodeBlockAfterCodeBlock;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, html.hashCode);
    _$hash = $jc(_$hash, htmlInCodeblock.hashCode);
    _$hash = $jc(_$hash, htmlAfterCodeBlock.hashCode);
    _$hash = $jc(_$hash, htmlInCodeBlockAfterCodeBlock.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Object4')
          ..add('html', html)
          ..add('htmlInCodeblock', htmlInCodeblock)
          ..add('htmlAfterCodeBlock', htmlAfterCodeBlock)
          ..add('htmlInCodeBlockAfterCodeBlock', htmlInCodeBlockAfterCodeBlock))
        .toString();
  }
}

class Object4Builder implements Builder<Object4, Object4Builder>, $Object4InterfaceBuilder {
  _$Object4? _$v;

  String? _html;
  String? get html => _$this._html;
  set html(covariant String? html) => _$this._html = html;

  String? _htmlInCodeblock;
  String? get htmlInCodeblock => _$this._htmlInCodeblock;
  set htmlInCodeblock(covariant String? htmlInCodeblock) => _$this._htmlInCodeblock = htmlInCodeblock;

  String? _htmlAfterCodeBlock;
  String? get htmlAfterCodeBlock => _$this._htmlAfterCodeBlock;
  set htmlAfterCodeBlock(covariant String? htmlAfterCodeBlock) => _$this._htmlAfterCodeBlock = htmlAfterCodeBlock;

  String? _htmlInCodeBlockAfterCodeBlock;
  String? get htmlInCodeBlockAfterCodeBlock => _$this._htmlInCodeBlockAfterCodeBlock;
  set htmlInCodeBlockAfterCodeBlock(covariant String? htmlInCodeBlockAfterCodeBlock) =>
      _$this._htmlInCodeBlockAfterCodeBlock = htmlInCodeBlockAfterCodeBlock;

  Object4Builder() {
    Object4._defaults(this);
  }

  Object4Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _html = $v.html;
      _htmlInCodeblock = $v.htmlInCodeblock;
      _htmlAfterCodeBlock = $v.htmlAfterCodeBlock;
      _htmlInCodeBlockAfterCodeBlock = $v.htmlInCodeBlockAfterCodeBlock;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Object4 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Object4;
  }

  @override
  void update(void Function(Object4Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Object4 build() => _build();

  _$Object4 _build() {
    Object4._validate(this);
    final _$result = _$v ??
        _$Object4._(
            html: html,
            htmlInCodeblock: htmlInCodeblock,
            htmlAfterCodeBlock: htmlAfterCodeBlock,
            htmlInCodeBlockAfterCodeBlock: htmlInCodeBlockAfterCodeBlock);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
