// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_versions.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FilesVersionsCapabilities_Files> _$filesVersionsCapabilitiesFilesSerializer =
    _$FilesVersionsCapabilities_FilesSerializer();
Serializer<FilesVersionsCapabilities> _$filesVersionsCapabilitiesSerializer = _$FilesVersionsCapabilitiesSerializer();

class _$FilesVersionsCapabilities_FilesSerializer implements StructuredSerializer<FilesVersionsCapabilities_Files> {
  @override
  final Iterable<Type> types = const [FilesVersionsCapabilities_Files, _$FilesVersionsCapabilities_Files];
  @override
  final String wireName = 'FilesVersionsCapabilities_Files';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesVersionsCapabilities_Files object,
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
  FilesVersionsCapabilities_Files deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesVersionsCapabilities_FilesBuilder();

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

class _$FilesVersionsCapabilitiesSerializer implements StructuredSerializer<FilesVersionsCapabilities> {
  @override
  final Iterable<Type> types = const [FilesVersionsCapabilities, _$FilesVersionsCapabilities];
  @override
  final String wireName = 'FilesVersionsCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesVersionsCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(FilesVersionsCapabilities_Files)),
    ];

    return result;
  }

  @override
  FilesVersionsCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesVersionsCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(serializers.deserialize(value,
              specifiedType: const FullType(FilesVersionsCapabilities_Files))! as FilesVersionsCapabilities_Files);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class FilesVersionsCapabilities_FilesInterfaceBuilder {
  void replace(FilesVersionsCapabilities_FilesInterface other);
  void update(void Function(FilesVersionsCapabilities_FilesInterfaceBuilder) updates);
  bool? get versioning;
  set versioning(bool? versioning);

  bool? get versionLabeling;
  set versionLabeling(bool? versionLabeling);

  bool? get versionDeletion;
  set versionDeletion(bool? versionDeletion);
}

class _$FilesVersionsCapabilities_Files extends FilesVersionsCapabilities_Files {
  @override
  final bool versioning;
  @override
  final bool versionLabeling;
  @override
  final bool versionDeletion;

  factory _$FilesVersionsCapabilities_Files([void Function(FilesVersionsCapabilities_FilesBuilder)? updates]) =>
      (FilesVersionsCapabilities_FilesBuilder()..update(updates))._build();

  _$FilesVersionsCapabilities_Files._(
      {required this.versioning, required this.versionLabeling, required this.versionDeletion})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(versioning, r'FilesVersionsCapabilities_Files', 'versioning');
    BuiltValueNullFieldError.checkNotNull(versionLabeling, r'FilesVersionsCapabilities_Files', 'versionLabeling');
    BuiltValueNullFieldError.checkNotNull(versionDeletion, r'FilesVersionsCapabilities_Files', 'versionDeletion');
  }

  @override
  FilesVersionsCapabilities_Files rebuild(void Function(FilesVersionsCapabilities_FilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesVersionsCapabilities_FilesBuilder toBuilder() => FilesVersionsCapabilities_FilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesVersionsCapabilities_Files &&
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
    return (newBuiltValueToStringHelper(r'FilesVersionsCapabilities_Files')
          ..add('versioning', versioning)
          ..add('versionLabeling', versionLabeling)
          ..add('versionDeletion', versionDeletion))
        .toString();
  }
}

class FilesVersionsCapabilities_FilesBuilder
    implements
        Builder<FilesVersionsCapabilities_Files, FilesVersionsCapabilities_FilesBuilder>,
        FilesVersionsCapabilities_FilesInterfaceBuilder {
  _$FilesVersionsCapabilities_Files? _$v;

  bool? _versioning;
  bool? get versioning => _$this._versioning;
  set versioning(covariant bool? versioning) => _$this._versioning = versioning;

  bool? _versionLabeling;
  bool? get versionLabeling => _$this._versionLabeling;
  set versionLabeling(covariant bool? versionLabeling) => _$this._versionLabeling = versionLabeling;

  bool? _versionDeletion;
  bool? get versionDeletion => _$this._versionDeletion;
  set versionDeletion(covariant bool? versionDeletion) => _$this._versionDeletion = versionDeletion;

  FilesVersionsCapabilities_FilesBuilder();

  FilesVersionsCapabilities_FilesBuilder get _$this {
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
  void replace(covariant FilesVersionsCapabilities_Files other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesVersionsCapabilities_Files;
  }

  @override
  void update(void Function(FilesVersionsCapabilities_FilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesVersionsCapabilities_Files build() => _build();

  _$FilesVersionsCapabilities_Files _build() {
    final _$result = _$v ??
        _$FilesVersionsCapabilities_Files._(
            versioning:
                BuiltValueNullFieldError.checkNotNull(versioning, r'FilesVersionsCapabilities_Files', 'versioning'),
            versionLabeling: BuiltValueNullFieldError.checkNotNull(
                versionLabeling, r'FilesVersionsCapabilities_Files', 'versionLabeling'),
            versionDeletion: BuiltValueNullFieldError.checkNotNull(
                versionDeletion, r'FilesVersionsCapabilities_Files', 'versionDeletion'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesVersionsCapabilitiesInterfaceBuilder {
  void replace(FilesVersionsCapabilitiesInterface other);
  void update(void Function(FilesVersionsCapabilitiesInterfaceBuilder) updates);
  FilesVersionsCapabilities_FilesBuilder get files;
  set files(FilesVersionsCapabilities_FilesBuilder? files);
}

class _$FilesVersionsCapabilities extends FilesVersionsCapabilities {
  @override
  final FilesVersionsCapabilities_Files files;

  factory _$FilesVersionsCapabilities([void Function(FilesVersionsCapabilitiesBuilder)? updates]) =>
      (FilesVersionsCapabilitiesBuilder()..update(updates))._build();

  _$FilesVersionsCapabilities._({required this.files}) : super._() {
    BuiltValueNullFieldError.checkNotNull(files, r'FilesVersionsCapabilities', 'files');
  }

  @override
  FilesVersionsCapabilities rebuild(void Function(FilesVersionsCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesVersionsCapabilitiesBuilder toBuilder() => FilesVersionsCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesVersionsCapabilities && files == other.files;
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
    return (newBuiltValueToStringHelper(r'FilesVersionsCapabilities')..add('files', files)).toString();
  }
}

class FilesVersionsCapabilitiesBuilder
    implements
        Builder<FilesVersionsCapabilities, FilesVersionsCapabilitiesBuilder>,
        FilesVersionsCapabilitiesInterfaceBuilder {
  _$FilesVersionsCapabilities? _$v;

  FilesVersionsCapabilities_FilesBuilder? _files;
  FilesVersionsCapabilities_FilesBuilder get files => _$this._files ??= FilesVersionsCapabilities_FilesBuilder();
  set files(covariant FilesVersionsCapabilities_FilesBuilder? files) => _$this._files = files;

  FilesVersionsCapabilitiesBuilder();

  FilesVersionsCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _files = $v.files.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesVersionsCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesVersionsCapabilities;
  }

  @override
  void update(void Function(FilesVersionsCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesVersionsCapabilities build() => _build();

  _$FilesVersionsCapabilities _build() {
    _$FilesVersionsCapabilities _$result;
    try {
      _$result = _$v ?? _$FilesVersionsCapabilities._(files: files.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        files.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesVersionsCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
