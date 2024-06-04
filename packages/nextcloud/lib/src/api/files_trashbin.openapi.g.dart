// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_trashbin.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PreviewGetPreviewRequestApplicationJson> _$previewGetPreviewRequestApplicationJsonSerializer =
    _$PreviewGetPreviewRequestApplicationJsonSerializer();
Serializer<Capabilities_Files> _$capabilitiesFilesSerializer = _$Capabilities_FilesSerializer();
Serializer<Capabilities> _$capabilitiesSerializer = _$CapabilitiesSerializer();

class _$PreviewGetPreviewRequestApplicationJsonSerializer
    implements StructuredSerializer<PreviewGetPreviewRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [
    PreviewGetPreviewRequestApplicationJson,
    _$PreviewGetPreviewRequestApplicationJson
  ];
  @override
  final String wireName = 'PreviewGetPreviewRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, PreviewGetPreviewRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fileId',
      serializers.serialize(object.fileId, specifiedType: const FullType(int)),
      'x',
      serializers.serialize(object.x, specifiedType: const FullType(int)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(int)),
      'a',
      serializers.serialize(object.a, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  PreviewGetPreviewRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PreviewGetPreviewRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fileId':
          result.fileId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'x':
          result.x = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'y':
          result.y = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'a':
          result.a = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Capabilities_FilesSerializer implements StructuredSerializer<Capabilities_Files> {
  @override
  final Iterable<Type> types = const [Capabilities_Files, _$Capabilities_Files];
  @override
  final String wireName = 'Capabilities_Files';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_Files object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'undelete',
      serializers.serialize(object.undelete, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Capabilities_Files deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_FilesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'undelete':
          result.undelete = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  @override
  final Iterable<Type> types = const [Capabilities, _$Capabilities];
  @override
  final String wireName = 'Capabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(Capabilities_Files)),
    ];

    return result;
  }

  @override
  Capabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(
              serializers.deserialize(value, specifiedType: const FullType(Capabilities_Files))! as Capabilities_Files);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $PreviewGetPreviewRequestApplicationJsonInterfaceBuilder {
  void replace($PreviewGetPreviewRequestApplicationJsonInterface other);
  void update(void Function($PreviewGetPreviewRequestApplicationJsonInterfaceBuilder) updates);
  int? get fileId;
  set fileId(int? fileId);

  int? get x;
  set x(int? x);

  int? get y;
  set y(int? y);

  bool? get a;
  set a(bool? a);
}

class _$PreviewGetPreviewRequestApplicationJson extends PreviewGetPreviewRequestApplicationJson {
  @override
  final int fileId;
  @override
  final int x;
  @override
  final int y;
  @override
  final bool a;

  factory _$PreviewGetPreviewRequestApplicationJson(
          [void Function(PreviewGetPreviewRequestApplicationJsonBuilder)? updates]) =>
      (PreviewGetPreviewRequestApplicationJsonBuilder()..update(updates))._build();

  _$PreviewGetPreviewRequestApplicationJson._({required this.fileId, required this.x, required this.y, required this.a})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(fileId, r'PreviewGetPreviewRequestApplicationJson', 'fileId');
    BuiltValueNullFieldError.checkNotNull(x, r'PreviewGetPreviewRequestApplicationJson', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'PreviewGetPreviewRequestApplicationJson', 'y');
    BuiltValueNullFieldError.checkNotNull(a, r'PreviewGetPreviewRequestApplicationJson', 'a');
  }

  @override
  PreviewGetPreviewRequestApplicationJson rebuild(
          void Function(PreviewGetPreviewRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PreviewGetPreviewRequestApplicationJsonBuilder toBuilder() =>
      PreviewGetPreviewRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PreviewGetPreviewRequestApplicationJson &&
        fileId == other.fileId &&
        x == other.x &&
        y == other.y &&
        a == other.a;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fileId.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, a.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PreviewGetPreviewRequestApplicationJson')
          ..add('fileId', fileId)
          ..add('x', x)
          ..add('y', y)
          ..add('a', a))
        .toString();
  }
}

class PreviewGetPreviewRequestApplicationJsonBuilder
    implements
        Builder<PreviewGetPreviewRequestApplicationJson, PreviewGetPreviewRequestApplicationJsonBuilder>,
        $PreviewGetPreviewRequestApplicationJsonInterfaceBuilder {
  _$PreviewGetPreviewRequestApplicationJson? _$v;

  int? _fileId;
  int? get fileId => _$this._fileId;
  set fileId(covariant int? fileId) => _$this._fileId = fileId;

  int? _x;
  int? get x => _$this._x;
  set x(covariant int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(covariant int? y) => _$this._y = y;

  bool? _a;
  bool? get a => _$this._a;
  set a(covariant bool? a) => _$this._a = a;

  PreviewGetPreviewRequestApplicationJsonBuilder() {
    PreviewGetPreviewRequestApplicationJson._defaults(this);
  }

  PreviewGetPreviewRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fileId = $v.fileId;
      _x = $v.x;
      _y = $v.y;
      _a = $v.a;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PreviewGetPreviewRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PreviewGetPreviewRequestApplicationJson;
  }

  @override
  void update(void Function(PreviewGetPreviewRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PreviewGetPreviewRequestApplicationJson build() => _build();

  _$PreviewGetPreviewRequestApplicationJson _build() {
    PreviewGetPreviewRequestApplicationJson._validate(this);
    final _$result = _$v ??
        _$PreviewGetPreviewRequestApplicationJson._(
            fileId: BuiltValueNullFieldError.checkNotNull(fileId, r'PreviewGetPreviewRequestApplicationJson', 'fileId'),
            x: BuiltValueNullFieldError.checkNotNull(x, r'PreviewGetPreviewRequestApplicationJson', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, r'PreviewGetPreviewRequestApplicationJson', 'y'),
            a: BuiltValueNullFieldError.checkNotNull(a, r'PreviewGetPreviewRequestApplicationJson', 'a'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Capabilities_FilesInterfaceBuilder {
  void replace($Capabilities_FilesInterface other);
  void update(void Function($Capabilities_FilesInterfaceBuilder) updates);
  bool? get undelete;
  set undelete(bool? undelete);
}

class _$Capabilities_Files extends Capabilities_Files {
  @override
  final bool undelete;

  factory _$Capabilities_Files([void Function(Capabilities_FilesBuilder)? updates]) =>
      (Capabilities_FilesBuilder()..update(updates))._build();

  _$Capabilities_Files._({required this.undelete}) : super._() {
    BuiltValueNullFieldError.checkNotNull(undelete, r'Capabilities_Files', 'undelete');
  }

  @override
  Capabilities_Files rebuild(void Function(Capabilities_FilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_FilesBuilder toBuilder() => Capabilities_FilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_Files && undelete == other.undelete;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, undelete.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_Files')..add('undelete', undelete)).toString();
  }
}

class Capabilities_FilesBuilder
    implements Builder<Capabilities_Files, Capabilities_FilesBuilder>, $Capabilities_FilesInterfaceBuilder {
  _$Capabilities_Files? _$v;

  bool? _undelete;
  bool? get undelete => _$this._undelete;
  set undelete(covariant bool? undelete) => _$this._undelete = undelete;

  Capabilities_FilesBuilder() {
    Capabilities_Files._defaults(this);
  }

  Capabilities_FilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _undelete = $v.undelete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_Files other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_Files;
  }

  @override
  void update(void Function(Capabilities_FilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_Files build() => _build();

  _$Capabilities_Files _build() {
    Capabilities_Files._validate(this);
    final _$result = _$v ??
        _$Capabilities_Files._(
            undelete: BuiltValueNullFieldError.checkNotNull(undelete, r'Capabilities_Files', 'undelete'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $CapabilitiesInterfaceBuilder {
  void replace($CapabilitiesInterface other);
  void update(void Function($CapabilitiesInterfaceBuilder) updates);
  Capabilities_FilesBuilder get files;
  set files(Capabilities_FilesBuilder? files);
}

class _$Capabilities extends Capabilities {
  @override
  final Capabilities_Files files;

  factory _$Capabilities([void Function(CapabilitiesBuilder)? updates]) =>
      (CapabilitiesBuilder()..update(updates))._build();

  _$Capabilities._({required this.files}) : super._() {
    BuiltValueNullFieldError.checkNotNull(files, r'Capabilities', 'files');
  }

  @override
  Capabilities rebuild(void Function(CapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CapabilitiesBuilder toBuilder() => CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities && files == other.files;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, files.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities')..add('files', files)).toString();
  }
}

class CapabilitiesBuilder implements Builder<Capabilities, CapabilitiesBuilder>, $CapabilitiesInterfaceBuilder {
  _$Capabilities? _$v;

  Capabilities_FilesBuilder? _files;
  Capabilities_FilesBuilder get files => _$this._files ??= Capabilities_FilesBuilder();
  set files(covariant Capabilities_FilesBuilder? files) => _$this._files = files;

  CapabilitiesBuilder() {
    Capabilities._defaults(this);
  }

  CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _files = $v.files.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities;
  }

  @override
  void update(void Function(CapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities build() => _build();

  _$Capabilities _build() {
    Capabilities._validate(this);
    _$Capabilities _$result;
    try {
      _$result = _$v ?? _$Capabilities._(files: files.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        files.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Capabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
