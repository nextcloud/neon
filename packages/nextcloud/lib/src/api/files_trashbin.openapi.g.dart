// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_trashbin.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FilesTrashbinCapabilities_Files> _$filesTrashbinCapabilitiesFilesSerializer =
    _$FilesTrashbinCapabilities_FilesSerializer();
Serializer<FilesTrashbinCapabilities> _$filesTrashbinCapabilitiesSerializer = _$FilesTrashbinCapabilitiesSerializer();

class _$FilesTrashbinCapabilities_FilesSerializer implements StructuredSerializer<FilesTrashbinCapabilities_Files> {
  @override
  final Iterable<Type> types = const [FilesTrashbinCapabilities_Files, _$FilesTrashbinCapabilities_Files];
  @override
  final String wireName = 'FilesTrashbinCapabilities_Files';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesTrashbinCapabilities_Files object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'undelete',
      serializers.serialize(object.undelete, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  FilesTrashbinCapabilities_Files deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesTrashbinCapabilities_FilesBuilder();

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

class _$FilesTrashbinCapabilitiesSerializer implements StructuredSerializer<FilesTrashbinCapabilities> {
  @override
  final Iterable<Type> types = const [FilesTrashbinCapabilities, _$FilesTrashbinCapabilities];
  @override
  final String wireName = 'FilesTrashbinCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesTrashbinCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(FilesTrashbinCapabilities_Files)),
    ];

    return result;
  }

  @override
  FilesTrashbinCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesTrashbinCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(serializers.deserialize(value,
              specifiedType: const FullType(FilesTrashbinCapabilities_Files))! as FilesTrashbinCapabilities_Files);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesTrashbinCapabilities_Files extends FilesTrashbinCapabilities_Files {
  @override
  final bool undelete;

  factory _$FilesTrashbinCapabilities_Files([void Function(FilesTrashbinCapabilities_FilesBuilder)? updates]) =>
      (FilesTrashbinCapabilities_FilesBuilder()..update(updates))._build();

  _$FilesTrashbinCapabilities_Files._({required this.undelete}) : super._() {
    BuiltValueNullFieldError.checkNotNull(undelete, r'FilesTrashbinCapabilities_Files', 'undelete');
  }

  @override
  FilesTrashbinCapabilities_Files rebuild(void Function(FilesTrashbinCapabilities_FilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesTrashbinCapabilities_FilesBuilder toBuilder() => FilesTrashbinCapabilities_FilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesTrashbinCapabilities_Files && undelete == other.undelete;
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
    return (newBuiltValueToStringHelper(r'FilesTrashbinCapabilities_Files')..add('undelete', undelete)).toString();
  }
}

class FilesTrashbinCapabilities_FilesBuilder
    implements Builder<FilesTrashbinCapabilities_Files, FilesTrashbinCapabilities_FilesBuilder> {
  _$FilesTrashbinCapabilities_Files? _$v;

  bool? _undelete;
  bool? get undelete => _$this._undelete;
  set undelete(bool? undelete) => _$this._undelete = undelete;

  FilesTrashbinCapabilities_FilesBuilder();

  FilesTrashbinCapabilities_FilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _undelete = $v.undelete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesTrashbinCapabilities_Files other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesTrashbinCapabilities_Files;
  }

  @override
  void update(void Function(FilesTrashbinCapabilities_FilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesTrashbinCapabilities_Files build() => _build();

  _$FilesTrashbinCapabilities_Files _build() {
    final _$result = _$v ??
        _$FilesTrashbinCapabilities_Files._(
            undelete: BuiltValueNullFieldError.checkNotNull(undelete, r'FilesTrashbinCapabilities_Files', 'undelete'));
    replace(_$result);
    return _$result;
  }
}

class _$FilesTrashbinCapabilities extends FilesTrashbinCapabilities {
  @override
  final FilesTrashbinCapabilities_Files files;

  factory _$FilesTrashbinCapabilities([void Function(FilesTrashbinCapabilitiesBuilder)? updates]) =>
      (FilesTrashbinCapabilitiesBuilder()..update(updates))._build();

  _$FilesTrashbinCapabilities._({required this.files}) : super._() {
    BuiltValueNullFieldError.checkNotNull(files, r'FilesTrashbinCapabilities', 'files');
  }

  @override
  FilesTrashbinCapabilities rebuild(void Function(FilesTrashbinCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesTrashbinCapabilitiesBuilder toBuilder() => FilesTrashbinCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesTrashbinCapabilities && files == other.files;
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
    return (newBuiltValueToStringHelper(r'FilesTrashbinCapabilities')..add('files', files)).toString();
  }
}

class FilesTrashbinCapabilitiesBuilder implements Builder<FilesTrashbinCapabilities, FilesTrashbinCapabilitiesBuilder> {
  _$FilesTrashbinCapabilities? _$v;

  FilesTrashbinCapabilities_FilesBuilder? _files;
  FilesTrashbinCapabilities_FilesBuilder get files => _$this._files ??= FilesTrashbinCapabilities_FilesBuilder();
  set files(FilesTrashbinCapabilities_FilesBuilder? files) => _$this._files = files;

  FilesTrashbinCapabilitiesBuilder();

  FilesTrashbinCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _files = $v.files.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesTrashbinCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesTrashbinCapabilities;
  }

  @override
  void update(void Function(FilesTrashbinCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesTrashbinCapabilities build() => _build();

  _$FilesTrashbinCapabilities _build() {
    _$FilesTrashbinCapabilities _$result;
    try {
      _$result = _$v ?? _$FilesTrashbinCapabilities._(files: files.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        files.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesTrashbinCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
