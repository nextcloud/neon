// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_versions.openapi.dart';

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
      'file',
      serializers.serialize(object.file, specifiedType: const FullType(String)),
      'x',
      serializers.serialize(object.x, specifiedType: const FullType(int)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(int)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
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
        case 'file':
          result.file = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'x':
          result.x = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'y':
          result.y = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
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
      'versioning',
      serializers.serialize(object.versioning, specifiedType: const FullType(bool)),
      'version_labeling',
      serializers.serialize(object.versionLabeling, specifiedType: const FullType(bool)),
      'version_deletion',
      serializers.serialize(object.versionDeletion, specifiedType: const FullType(bool)),
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
        case 'versioning':
          result.versioning = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'version_labeling':
          result.versionLabeling = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'version_deletion':
          result.versionDeletion = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
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
  String? get file;
  set file(String? file);

  int? get x;
  set x(int? x);

  int? get y;
  set y(int? y);

  String? get version;
  set version(String? version);
}

class _$PreviewGetPreviewRequestApplicationJson extends PreviewGetPreviewRequestApplicationJson {
  @override
  final String file;
  @override
  final int x;
  @override
  final int y;
  @override
  final String version;

  factory _$PreviewGetPreviewRequestApplicationJson(
          [void Function(PreviewGetPreviewRequestApplicationJsonBuilder)? updates]) =>
      (PreviewGetPreviewRequestApplicationJsonBuilder()..update(updates))._build();

  _$PreviewGetPreviewRequestApplicationJson._(
      {required this.file, required this.x, required this.y, required this.version})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(file, r'PreviewGetPreviewRequestApplicationJson', 'file');
    BuiltValueNullFieldError.checkNotNull(x, r'PreviewGetPreviewRequestApplicationJson', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'PreviewGetPreviewRequestApplicationJson', 'y');
    BuiltValueNullFieldError.checkNotNull(version, r'PreviewGetPreviewRequestApplicationJson', 'version');
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
        file == other.file &&
        x == other.x &&
        y == other.y &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, file.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PreviewGetPreviewRequestApplicationJson')
          ..add('file', file)
          ..add('x', x)
          ..add('y', y)
          ..add('version', version))
        .toString();
  }
}

class PreviewGetPreviewRequestApplicationJsonBuilder
    implements
        Builder<PreviewGetPreviewRequestApplicationJson, PreviewGetPreviewRequestApplicationJsonBuilder>,
        $PreviewGetPreviewRequestApplicationJsonInterfaceBuilder {
  _$PreviewGetPreviewRequestApplicationJson? _$v;

  String? _file;
  String? get file => _$this._file;
  set file(covariant String? file) => _$this._file = file;

  int? _x;
  int? get x => _$this._x;
  set x(covariant int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(covariant int? y) => _$this._y = y;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  PreviewGetPreviewRequestApplicationJsonBuilder() {
    PreviewGetPreviewRequestApplicationJson._defaults(this);
  }

  PreviewGetPreviewRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _file = $v.file;
      _x = $v.x;
      _y = $v.y;
      _version = $v.version;
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
            file: BuiltValueNullFieldError.checkNotNull(file, r'PreviewGetPreviewRequestApplicationJson', 'file'),
            x: BuiltValueNullFieldError.checkNotNull(x, r'PreviewGetPreviewRequestApplicationJson', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, r'PreviewGetPreviewRequestApplicationJson', 'y'),
            version:
                BuiltValueNullFieldError.checkNotNull(version, r'PreviewGetPreviewRequestApplicationJson', 'version'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Capabilities_FilesInterfaceBuilder {
  void replace($Capabilities_FilesInterface other);
  void update(void Function($Capabilities_FilesInterfaceBuilder) updates);
  bool? get versioning;
  set versioning(bool? versioning);

  bool? get versionLabeling;
  set versionLabeling(bool? versionLabeling);

  bool? get versionDeletion;
  set versionDeletion(bool? versionDeletion);
}

class _$Capabilities_Files extends Capabilities_Files {
  @override
  final bool versioning;
  @override
  final bool versionLabeling;
  @override
  final bool versionDeletion;

  factory _$Capabilities_Files([void Function(Capabilities_FilesBuilder)? updates]) =>
      (Capabilities_FilesBuilder()..update(updates))._build();

  _$Capabilities_Files._({required this.versioning, required this.versionLabeling, required this.versionDeletion})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(versioning, r'Capabilities_Files', 'versioning');
    BuiltValueNullFieldError.checkNotNull(versionLabeling, r'Capabilities_Files', 'versionLabeling');
    BuiltValueNullFieldError.checkNotNull(versionDeletion, r'Capabilities_Files', 'versionDeletion');
  }

  @override
  Capabilities_Files rebuild(void Function(Capabilities_FilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_FilesBuilder toBuilder() => Capabilities_FilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_Files &&
        versioning == other.versioning &&
        versionLabeling == other.versionLabeling &&
        versionDeletion == other.versionDeletion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, versioning.hashCode);
    _$hash = $jc(_$hash, versionLabeling.hashCode);
    _$hash = $jc(_$hash, versionDeletion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_Files')
          ..add('versioning', versioning)
          ..add('versionLabeling', versionLabeling)
          ..add('versionDeletion', versionDeletion))
        .toString();
  }
}

class Capabilities_FilesBuilder
    implements Builder<Capabilities_Files, Capabilities_FilesBuilder>, $Capabilities_FilesInterfaceBuilder {
  _$Capabilities_Files? _$v;

  bool? _versioning;
  bool? get versioning => _$this._versioning;
  set versioning(covariant bool? versioning) => _$this._versioning = versioning;

  bool? _versionLabeling;
  bool? get versionLabeling => _$this._versionLabeling;
  set versionLabeling(covariant bool? versionLabeling) => _$this._versionLabeling = versionLabeling;

  bool? _versionDeletion;
  bool? get versionDeletion => _$this._versionDeletion;
  set versionDeletion(covariant bool? versionDeletion) => _$this._versionDeletion = versionDeletion;

  Capabilities_FilesBuilder() {
    Capabilities_Files._defaults(this);
  }

  Capabilities_FilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _versioning = $v.versioning;
      _versionLabeling = $v.versionLabeling;
      _versionDeletion = $v.versionDeletion;
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
            versioning: BuiltValueNullFieldError.checkNotNull(versioning, r'Capabilities_Files', 'versioning'),
            versionLabeling:
                BuiltValueNullFieldError.checkNotNull(versionLabeling, r'Capabilities_Files', 'versionLabeling'),
            versionDeletion:
                BuiltValueNullFieldError.checkNotNull(versionDeletion, r'Capabilities_Files', 'versionDeletion'));
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
