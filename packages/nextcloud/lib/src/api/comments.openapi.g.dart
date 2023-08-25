// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsCapabilities_Files> _$commentsCapabilitiesFilesSerializer = _$CommentsCapabilities_FilesSerializer();
Serializer<CommentsCapabilities> _$commentsCapabilitiesSerializer = _$CommentsCapabilitiesSerializer();

class _$CommentsCapabilities_FilesSerializer implements StructuredSerializer<CommentsCapabilities_Files> {
  @override
  final Iterable<Type> types = const [CommentsCapabilities_Files, _$CommentsCapabilities_Files];
  @override
  final String wireName = 'CommentsCapabilities_Files';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentsCapabilities_Files object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'comments',
      serializers.serialize(object.comments, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  CommentsCapabilities_Files deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CommentsCapabilities_FilesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'comments':
          result.comments = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentsCapabilitiesSerializer implements StructuredSerializer<CommentsCapabilities> {
  @override
  final Iterable<Type> types = const [CommentsCapabilities, _$CommentsCapabilities];
  @override
  final String wireName = 'CommentsCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentsCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(CommentsCapabilities_Files)),
    ];

    return result;
  }

  @override
  CommentsCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CommentsCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(serializers.deserialize(value,
              specifiedType: const FullType(CommentsCapabilities_Files))! as CommentsCapabilities_Files);
          break;
      }
    }

    return result.build();
  }
}

class _$CommentsNotificationsNotificationsViewHeaders extends CommentsNotificationsNotificationsViewHeaders {
  @override
  final String? location;

  factory _$CommentsNotificationsNotificationsViewHeaders(
          [void Function(CommentsNotificationsNotificationsViewHeadersBuilder)? updates]) =>
      (CommentsNotificationsNotificationsViewHeadersBuilder()..update(updates))._build();

  _$CommentsNotificationsNotificationsViewHeaders._({this.location}) : super._();

  @override
  CommentsNotificationsNotificationsViewHeaders rebuild(
          void Function(CommentsNotificationsNotificationsViewHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsNotificationsNotificationsViewHeadersBuilder toBuilder() =>
      CommentsNotificationsNotificationsViewHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsNotificationsNotificationsViewHeaders && location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentsNotificationsNotificationsViewHeaders')..add('location', location))
        .toString();
  }
}

class CommentsNotificationsNotificationsViewHeadersBuilder
    implements
        Builder<CommentsNotificationsNotificationsViewHeaders, CommentsNotificationsNotificationsViewHeadersBuilder> {
  _$CommentsNotificationsNotificationsViewHeaders? _$v;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  CommentsNotificationsNotificationsViewHeadersBuilder();

  CommentsNotificationsNotificationsViewHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsNotificationsNotificationsViewHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsNotificationsNotificationsViewHeaders;
  }

  @override
  void update(void Function(CommentsNotificationsNotificationsViewHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsNotificationsNotificationsViewHeaders build() => _build();

  _$CommentsNotificationsNotificationsViewHeaders _build() {
    final _$result = _$v ?? _$CommentsNotificationsNotificationsViewHeaders._(location: location);
    replace(_$result);
    return _$result;
  }
}

class _$CommentsCapabilities_Files extends CommentsCapabilities_Files {
  @override
  final bool comments;

  factory _$CommentsCapabilities_Files([void Function(CommentsCapabilities_FilesBuilder)? updates]) =>
      (CommentsCapabilities_FilesBuilder()..update(updates))._build();

  _$CommentsCapabilities_Files._({required this.comments}) : super._() {
    BuiltValueNullFieldError.checkNotNull(comments, r'CommentsCapabilities_Files', 'comments');
  }

  @override
  CommentsCapabilities_Files rebuild(void Function(CommentsCapabilities_FilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsCapabilities_FilesBuilder toBuilder() => CommentsCapabilities_FilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsCapabilities_Files && comments == other.comments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentsCapabilities_Files')..add('comments', comments)).toString();
  }
}

class CommentsCapabilities_FilesBuilder
    implements Builder<CommentsCapabilities_Files, CommentsCapabilities_FilesBuilder> {
  _$CommentsCapabilities_Files? _$v;

  bool? _comments;
  bool? get comments => _$this._comments;
  set comments(bool? comments) => _$this._comments = comments;

  CommentsCapabilities_FilesBuilder();

  CommentsCapabilities_FilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comments = $v.comments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsCapabilities_Files other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsCapabilities_Files;
  }

  @override
  void update(void Function(CommentsCapabilities_FilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsCapabilities_Files build() => _build();

  _$CommentsCapabilities_Files _build() {
    final _$result = _$v ??
        _$CommentsCapabilities_Files._(
            comments: BuiltValueNullFieldError.checkNotNull(comments, r'CommentsCapabilities_Files', 'comments'));
    replace(_$result);
    return _$result;
  }
}

class _$CommentsCapabilities extends CommentsCapabilities {
  @override
  final CommentsCapabilities_Files files;

  factory _$CommentsCapabilities([void Function(CommentsCapabilitiesBuilder)? updates]) =>
      (CommentsCapabilitiesBuilder()..update(updates))._build();

  _$CommentsCapabilities._({required this.files}) : super._() {
    BuiltValueNullFieldError.checkNotNull(files, r'CommentsCapabilities', 'files');
  }

  @override
  CommentsCapabilities rebuild(void Function(CommentsCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsCapabilitiesBuilder toBuilder() => CommentsCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsCapabilities && files == other.files;
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
    return (newBuiltValueToStringHelper(r'CommentsCapabilities')..add('files', files)).toString();
  }
}

class CommentsCapabilitiesBuilder implements Builder<CommentsCapabilities, CommentsCapabilitiesBuilder> {
  _$CommentsCapabilities? _$v;

  CommentsCapabilities_FilesBuilder? _files;
  CommentsCapabilities_FilesBuilder get files => _$this._files ??= CommentsCapabilities_FilesBuilder();
  set files(CommentsCapabilities_FilesBuilder? files) => _$this._files = files;

  CommentsCapabilitiesBuilder();

  CommentsCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _files = $v.files.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsCapabilities;
  }

  @override
  void update(void Function(CommentsCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsCapabilities build() => _build();

  _$CommentsCapabilities _build() {
    _$CommentsCapabilities _$result;
    try {
      _$result = _$v ?? _$CommentsCapabilities._(files: files.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        files.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'CommentsCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
