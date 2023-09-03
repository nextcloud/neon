// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NotesSettings_NoteMode _$notesSettingsNoteModeEdit = NotesSettings_NoteMode._('edit');
const NotesSettings_NoteMode _$notesSettingsNoteModePreview = NotesSettings_NoteMode._('preview');
const NotesSettings_NoteMode _$notesSettingsNoteModeRich = NotesSettings_NoteMode._('rich');

NotesSettings_NoteMode _$valueOfNotesSettings_NoteMode(String name) {
  switch (name) {
    case 'edit':
      return _$notesSettingsNoteModeEdit;
    case 'preview':
      return _$notesSettingsNoteModePreview;
    case 'rich':
      return _$notesSettingsNoteModeRich;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NotesSettings_NoteMode> _$notesSettingsNoteModeValues =
    BuiltSet<NotesSettings_NoteMode>(const <NotesSettings_NoteMode>[
  _$notesSettingsNoteModeEdit,
  _$notesSettingsNoteModePreview,
  _$notesSettingsNoteModeRich,
]);

Serializer<NotesNote> _$notesNoteSerializer = _$NotesNoteSerializer();
Serializer<NotesSettings_NoteMode> _$notesSettingsNoteModeSerializer = _$NotesSettings_NoteModeSerializer();
Serializer<NotesSettings> _$notesSettingsSerializer = _$NotesSettingsSerializer();
Serializer<NotesCapabilities_Notes> _$notesCapabilitiesNotesSerializer = _$NotesCapabilities_NotesSerializer();
Serializer<NotesCapabilities> _$notesCapabilitiesSerializer = _$NotesCapabilitiesSerializer();
Serializer<NotesOCSMeta> _$notesOCSMetaSerializer = _$NotesOCSMetaSerializer();
Serializer<NotesEmptyOCS_Ocs> _$notesEmptyOCSOcsSerializer = _$NotesEmptyOCS_OcsSerializer();
Serializer<NotesEmptyOCS> _$notesEmptyOCSSerializer = _$NotesEmptyOCSSerializer();

class _$NotesNoteSerializer implements StructuredSerializer<NotesNote> {
  @override
  final Iterable<Type> types = const [NotesNote, _$NotesNote];
  @override
  final String wireName = 'NotesNote';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesNote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'etag',
      serializers.serialize(object.etag, specifiedType: const FullType(String)),
      'readonly',
      serializers.serialize(object.readonly, specifiedType: const FullType(bool)),
      'content',
      serializers.serialize(object.content, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category, specifiedType: const FullType(String)),
      'favorite',
      serializers.serialize(object.favorite, specifiedType: const FullType(bool)),
      'modified',
      serializers.serialize(object.modified, specifiedType: const FullType(int)),
      'error',
      serializers.serialize(object.error, specifiedType: const FullType(bool)),
      'errorType',
      serializers.serialize(object.errorType, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NotesNote deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotesNoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'readonly':
          result.readonly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'content':
          result.content = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'favorite':
          result.favorite = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'modified':
          result.modified = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'error':
          result.error = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'errorType':
          result.errorType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NotesSettings_NoteModeSerializer implements PrimitiveSerializer<NotesSettings_NoteMode> {
  @override
  final Iterable<Type> types = const <Type>[NotesSettings_NoteMode];
  @override
  final String wireName = 'NotesSettings_NoteMode';

  @override
  Object serialize(Serializers serializers, NotesSettings_NoteMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NotesSettings_NoteMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NotesSettings_NoteMode.valueOf(serialized as String);
}

class _$NotesSettingsSerializer implements StructuredSerializer<NotesSettings> {
  @override
  final Iterable<Type> types = const [NotesSettings, _$NotesSettings];
  @override
  final String wireName = 'NotesSettings';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'notesPath',
      serializers.serialize(object.notesPath, specifiedType: const FullType(String)),
      'fileSuffix',
      serializers.serialize(object.fileSuffix, specifiedType: const FullType(String)),
      'noteMode',
      serializers.serialize(object.noteMode, specifiedType: const FullType(NotesSettings_NoteMode)),
    ];

    return result;
  }

  @override
  NotesSettings deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotesSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notesPath':
          result.notesPath = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'fileSuffix':
          result.fileSuffix = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'noteMode':
          result.noteMode = serializers.deserialize(value, specifiedType: const FullType(NotesSettings_NoteMode))!
              as NotesSettings_NoteMode;
          break;
      }
    }

    return result.build();
  }
}

class _$NotesCapabilities_NotesSerializer implements StructuredSerializer<NotesCapabilities_Notes> {
  @override
  final Iterable<Type> types = const [NotesCapabilities_Notes, _$NotesCapabilities_Notes];
  @override
  final String wireName = 'NotesCapabilities_Notes';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesCapabilities_Notes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.apiVersion;
    if (value != null) {
      result
        ..add('api_version')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotesCapabilities_Notes deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotesCapabilities_NotesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'api_version':
          result.apiVersion.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotesCapabilitiesSerializer implements StructuredSerializer<NotesCapabilities> {
  @override
  final Iterable<Type> types = const [NotesCapabilities, _$NotesCapabilities];
  @override
  final String wireName = 'NotesCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'notes',
      serializers.serialize(object.notes, specifiedType: const FullType(NotesCapabilities_Notes)),
    ];

    return result;
  }

  @override
  NotesCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotesCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notes':
          result.notes.replace(serializers.deserialize(value, specifiedType: const FullType(NotesCapabilities_Notes))!
              as NotesCapabilities_Notes);
          break;
      }
    }

    return result.build();
  }
}

class _$NotesOCSMetaSerializer implements StructuredSerializer<NotesOCSMeta> {
  @override
  final Iterable<Type> types = const [NotesOCSMeta, _$NotesOCSMeta];
  @override
  final String wireName = 'NotesOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesOCSMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotesOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotesOCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotesEmptyOCS_OcsSerializer implements StructuredSerializer<NotesEmptyOCS_Ocs> {
  @override
  final Iterable<Type> types = const [NotesEmptyOCS_Ocs, _$NotesEmptyOCS_Ocs];
  @override
  final String wireName = 'NotesEmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesEmptyOCS_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NotesOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  NotesEmptyOCS_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotesEmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta
              .replace(serializers.deserialize(value, specifiedType: const FullType(NotesOCSMeta))! as NotesOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NotesEmptyOCSSerializer implements StructuredSerializer<NotesEmptyOCS> {
  @override
  final Iterable<Type> types = const [NotesEmptyOCS, _$NotesEmptyOCS];
  @override
  final String wireName = 'NotesEmptyOCS';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesEmptyOCS object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NotesEmptyOCS_Ocs)),
    ];

    return result;
  }

  @override
  NotesEmptyOCS deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotesEmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NotesEmptyOCS_Ocs))! as NotesEmptyOCS_Ocs);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class NotesNoteInterfaceBuilder {
  void replace(NotesNoteInterface other);
  void update(void Function(NotesNoteInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get etag;
  set etag(String? etag);

  bool? get readonly;
  set readonly(bool? readonly);

  String? get content;
  set content(String? content);

  String? get title;
  set title(String? title);

  String? get category;
  set category(String? category);

  bool? get favorite;
  set favorite(bool? favorite);

  int? get modified;
  set modified(int? modified);

  bool? get error;
  set error(bool? error);

  String? get errorType;
  set errorType(String? errorType);
}

class _$NotesNote extends NotesNote {
  @override
  final int id;
  @override
  final String etag;
  @override
  final bool readonly;
  @override
  final String content;
  @override
  final String title;
  @override
  final String category;
  @override
  final bool favorite;
  @override
  final int modified;
  @override
  final bool error;
  @override
  final String errorType;

  factory _$NotesNote([void Function(NotesNoteBuilder)? updates]) => (NotesNoteBuilder()..update(updates))._build();

  _$NotesNote._(
      {required this.id,
      required this.etag,
      required this.readonly,
      required this.content,
      required this.title,
      required this.category,
      required this.favorite,
      required this.modified,
      required this.error,
      required this.errorType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NotesNote', 'id');
    BuiltValueNullFieldError.checkNotNull(etag, r'NotesNote', 'etag');
    BuiltValueNullFieldError.checkNotNull(readonly, r'NotesNote', 'readonly');
    BuiltValueNullFieldError.checkNotNull(content, r'NotesNote', 'content');
    BuiltValueNullFieldError.checkNotNull(title, r'NotesNote', 'title');
    BuiltValueNullFieldError.checkNotNull(category, r'NotesNote', 'category');
    BuiltValueNullFieldError.checkNotNull(favorite, r'NotesNote', 'favorite');
    BuiltValueNullFieldError.checkNotNull(modified, r'NotesNote', 'modified');
    BuiltValueNullFieldError.checkNotNull(error, r'NotesNote', 'error');
    BuiltValueNullFieldError.checkNotNull(errorType, r'NotesNote', 'errorType');
  }

  @override
  NotesNote rebuild(void Function(NotesNoteBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NotesNoteBuilder toBuilder() => NotesNoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesNote &&
        id == other.id &&
        etag == other.etag &&
        readonly == other.readonly &&
        content == other.content &&
        title == other.title &&
        category == other.category &&
        favorite == other.favorite &&
        modified == other.modified &&
        error == other.error &&
        errorType == other.errorType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, etag.hashCode);
    _$hash = $jc(_$hash, readonly.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, favorite.hashCode);
    _$hash = $jc(_$hash, modified.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, errorType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesNote')
          ..add('id', id)
          ..add('etag', etag)
          ..add('readonly', readonly)
          ..add('content', content)
          ..add('title', title)
          ..add('category', category)
          ..add('favorite', favorite)
          ..add('modified', modified)
          ..add('error', error)
          ..add('errorType', errorType))
        .toString();
  }
}

class NotesNoteBuilder implements Builder<NotesNote, NotesNoteBuilder>, NotesNoteInterfaceBuilder {
  _$NotesNote? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(covariant String? etag) => _$this._etag = etag;

  bool? _readonly;
  bool? get readonly => _$this._readonly;
  set readonly(covariant bool? readonly) => _$this._readonly = readonly;

  String? _content;
  String? get content => _$this._content;
  set content(covariant String? content) => _$this._content = content;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _category;
  String? get category => _$this._category;
  set category(covariant String? category) => _$this._category = category;

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(covariant bool? favorite) => _$this._favorite = favorite;

  int? _modified;
  int? get modified => _$this._modified;
  set modified(covariant int? modified) => _$this._modified = modified;

  bool? _error;
  bool? get error => _$this._error;
  set error(covariant bool? error) => _$this._error = error;

  String? _errorType;
  String? get errorType => _$this._errorType;
  set errorType(covariant String? errorType) => _$this._errorType = errorType;

  NotesNoteBuilder();

  NotesNoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _etag = $v.etag;
      _readonly = $v.readonly;
      _content = $v.content;
      _title = $v.title;
      _category = $v.category;
      _favorite = $v.favorite;
      _modified = $v.modified;
      _error = $v.error;
      _errorType = $v.errorType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotesNote other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesNote;
  }

  @override
  void update(void Function(NotesNoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesNote build() => _build();

  _$NotesNote _build() {
    final _$result = _$v ??
        _$NotesNote._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'NotesNote', 'id'),
            etag: BuiltValueNullFieldError.checkNotNull(etag, r'NotesNote', 'etag'),
            readonly: BuiltValueNullFieldError.checkNotNull(readonly, r'NotesNote', 'readonly'),
            content: BuiltValueNullFieldError.checkNotNull(content, r'NotesNote', 'content'),
            title: BuiltValueNullFieldError.checkNotNull(title, r'NotesNote', 'title'),
            category: BuiltValueNullFieldError.checkNotNull(category, r'NotesNote', 'category'),
            favorite: BuiltValueNullFieldError.checkNotNull(favorite, r'NotesNote', 'favorite'),
            modified: BuiltValueNullFieldError.checkNotNull(modified, r'NotesNote', 'modified'),
            error: BuiltValueNullFieldError.checkNotNull(error, r'NotesNote', 'error'),
            errorType: BuiltValueNullFieldError.checkNotNull(errorType, r'NotesNote', 'errorType'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotesSettingsInterfaceBuilder {
  void replace(NotesSettingsInterface other);
  void update(void Function(NotesSettingsInterfaceBuilder) updates);
  String? get notesPath;
  set notesPath(String? notesPath);

  String? get fileSuffix;
  set fileSuffix(String? fileSuffix);

  NotesSettings_NoteMode? get noteMode;
  set noteMode(NotesSettings_NoteMode? noteMode);
}

class _$NotesSettings extends NotesSettings {
  @override
  final String notesPath;
  @override
  final String fileSuffix;
  @override
  final NotesSettings_NoteMode noteMode;

  factory _$NotesSettings([void Function(NotesSettingsBuilder)? updates]) =>
      (NotesSettingsBuilder()..update(updates))._build();

  _$NotesSettings._({required this.notesPath, required this.fileSuffix, required this.noteMode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(notesPath, r'NotesSettings', 'notesPath');
    BuiltValueNullFieldError.checkNotNull(fileSuffix, r'NotesSettings', 'fileSuffix');
    BuiltValueNullFieldError.checkNotNull(noteMode, r'NotesSettings', 'noteMode');
  }

  @override
  NotesSettings rebuild(void Function(NotesSettingsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NotesSettingsBuilder toBuilder() => NotesSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesSettings &&
        notesPath == other.notesPath &&
        fileSuffix == other.fileSuffix &&
        noteMode == other.noteMode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notesPath.hashCode);
    _$hash = $jc(_$hash, fileSuffix.hashCode);
    _$hash = $jc(_$hash, noteMode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesSettings')
          ..add('notesPath', notesPath)
          ..add('fileSuffix', fileSuffix)
          ..add('noteMode', noteMode))
        .toString();
  }
}

class NotesSettingsBuilder implements Builder<NotesSettings, NotesSettingsBuilder>, NotesSettingsInterfaceBuilder {
  _$NotesSettings? _$v;

  String? _notesPath;
  String? get notesPath => _$this._notesPath;
  set notesPath(covariant String? notesPath) => _$this._notesPath = notesPath;

  String? _fileSuffix;
  String? get fileSuffix => _$this._fileSuffix;
  set fileSuffix(covariant String? fileSuffix) => _$this._fileSuffix = fileSuffix;

  NotesSettings_NoteMode? _noteMode;
  NotesSettings_NoteMode? get noteMode => _$this._noteMode;
  set noteMode(covariant NotesSettings_NoteMode? noteMode) => _$this._noteMode = noteMode;

  NotesSettingsBuilder();

  NotesSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notesPath = $v.notesPath;
      _fileSuffix = $v.fileSuffix;
      _noteMode = $v.noteMode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotesSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesSettings;
  }

  @override
  void update(void Function(NotesSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesSettings build() => _build();

  _$NotesSettings _build() {
    final _$result = _$v ??
        _$NotesSettings._(
            notesPath: BuiltValueNullFieldError.checkNotNull(notesPath, r'NotesSettings', 'notesPath'),
            fileSuffix: BuiltValueNullFieldError.checkNotNull(fileSuffix, r'NotesSettings', 'fileSuffix'),
            noteMode: BuiltValueNullFieldError.checkNotNull(noteMode, r'NotesSettings', 'noteMode'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotesCapabilities_NotesInterfaceBuilder {
  void replace(NotesCapabilities_NotesInterface other);
  void update(void Function(NotesCapabilities_NotesInterfaceBuilder) updates);
  ListBuilder<String> get apiVersion;
  set apiVersion(ListBuilder<String>? apiVersion);

  String? get version;
  set version(String? version);
}

class _$NotesCapabilities_Notes extends NotesCapabilities_Notes {
  @override
  final BuiltList<String>? apiVersion;
  @override
  final String? version;

  factory _$NotesCapabilities_Notes([void Function(NotesCapabilities_NotesBuilder)? updates]) =>
      (NotesCapabilities_NotesBuilder()..update(updates))._build();

  _$NotesCapabilities_Notes._({this.apiVersion, this.version}) : super._();

  @override
  NotesCapabilities_Notes rebuild(void Function(NotesCapabilities_NotesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesCapabilities_NotesBuilder toBuilder() => NotesCapabilities_NotesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesCapabilities_Notes && apiVersion == other.apiVersion && version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesCapabilities_Notes')
          ..add('apiVersion', apiVersion)
          ..add('version', version))
        .toString();
  }
}

class NotesCapabilities_NotesBuilder
    implements
        Builder<NotesCapabilities_Notes, NotesCapabilities_NotesBuilder>,
        NotesCapabilities_NotesInterfaceBuilder {
  _$NotesCapabilities_Notes? _$v;

  ListBuilder<String>? _apiVersion;
  ListBuilder<String> get apiVersion => _$this._apiVersion ??= ListBuilder<String>();
  set apiVersion(covariant ListBuilder<String>? apiVersion) => _$this._apiVersion = apiVersion;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  NotesCapabilities_NotesBuilder();

  NotesCapabilities_NotesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiVersion = $v.apiVersion?.toBuilder();
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotesCapabilities_Notes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesCapabilities_Notes;
  }

  @override
  void update(void Function(NotesCapabilities_NotesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesCapabilities_Notes build() => _build();

  _$NotesCapabilities_Notes _build() {
    _$NotesCapabilities_Notes _$result;
    try {
      _$result = _$v ?? _$NotesCapabilities_Notes._(apiVersion: _apiVersion?.build(), version: version);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apiVersion';
        _apiVersion?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotesCapabilities_Notes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotesCapabilitiesInterfaceBuilder {
  void replace(NotesCapabilitiesInterface other);
  void update(void Function(NotesCapabilitiesInterfaceBuilder) updates);
  NotesCapabilities_NotesBuilder get notes;
  set notes(NotesCapabilities_NotesBuilder? notes);
}

class _$NotesCapabilities extends NotesCapabilities {
  @override
  final NotesCapabilities_Notes notes;

  factory _$NotesCapabilities([void Function(NotesCapabilitiesBuilder)? updates]) =>
      (NotesCapabilitiesBuilder()..update(updates))._build();

  _$NotesCapabilities._({required this.notes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(notes, r'NotesCapabilities', 'notes');
  }

  @override
  NotesCapabilities rebuild(void Function(NotesCapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NotesCapabilitiesBuilder toBuilder() => NotesCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesCapabilities && notes == other.notes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesCapabilities')..add('notes', notes)).toString();
  }
}

class NotesCapabilitiesBuilder
    implements Builder<NotesCapabilities, NotesCapabilitiesBuilder>, NotesCapabilitiesInterfaceBuilder {
  _$NotesCapabilities? _$v;

  NotesCapabilities_NotesBuilder? _notes;
  NotesCapabilities_NotesBuilder get notes => _$this._notes ??= NotesCapabilities_NotesBuilder();
  set notes(covariant NotesCapabilities_NotesBuilder? notes) => _$this._notes = notes;

  NotesCapabilitiesBuilder();

  NotesCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notes = $v.notes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotesCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesCapabilities;
  }

  @override
  void update(void Function(NotesCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesCapabilities build() => _build();

  _$NotesCapabilities _build() {
    _$NotesCapabilities _$result;
    try {
      _$result = _$v ?? _$NotesCapabilities._(notes: notes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notes';
        notes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotesCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotesOCSMetaInterfaceBuilder {
  void replace(NotesOCSMetaInterface other);
  void update(void Function(NotesOCSMetaInterfaceBuilder) updates);
  String? get status;
  set status(String? status);

  int? get statuscode;
  set statuscode(int? statuscode);

  String? get message;
  set message(String? message);

  String? get totalitems;
  set totalitems(String? totalitems);

  String? get itemsperpage;
  set itemsperpage(String? itemsperpage);
}

class _$NotesOCSMeta extends NotesOCSMeta {
  @override
  final String status;
  @override
  final int statuscode;
  @override
  final String? message;
  @override
  final String? totalitems;
  @override
  final String? itemsperpage;

  factory _$NotesOCSMeta([void Function(NotesOCSMetaBuilder)? updates]) =>
      (NotesOCSMetaBuilder()..update(updates))._build();

  _$NotesOCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'NotesOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'NotesOCSMeta', 'statuscode');
  }

  @override
  NotesOCSMeta rebuild(void Function(NotesOCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NotesOCSMetaBuilder toBuilder() => NotesOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesOCSMeta &&
        status == other.status &&
        statuscode == other.statuscode &&
        message == other.message &&
        totalitems == other.totalitems &&
        itemsperpage == other.itemsperpage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, statuscode.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, totalitems.hashCode);
    _$hash = $jc(_$hash, itemsperpage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class NotesOCSMetaBuilder implements Builder<NotesOCSMeta, NotesOCSMetaBuilder>, NotesOCSMetaInterfaceBuilder {
  _$NotesOCSMeta? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(covariant String? status) => _$this._status = status;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(covariant int? statuscode) => _$this._statuscode = statuscode;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  String? _totalitems;
  String? get totalitems => _$this._totalitems;
  set totalitems(covariant String? totalitems) => _$this._totalitems = totalitems;

  String? _itemsperpage;
  String? get itemsperpage => _$this._itemsperpage;
  set itemsperpage(covariant String? itemsperpage) => _$this._itemsperpage = itemsperpage;

  NotesOCSMetaBuilder();

  NotesOCSMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _statuscode = $v.statuscode;
      _message = $v.message;
      _totalitems = $v.totalitems;
      _itemsperpage = $v.itemsperpage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotesOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesOCSMeta;
  }

  @override
  void update(void Function(NotesOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesOCSMeta build() => _build();

  _$NotesOCSMeta _build() {
    final _$result = _$v ??
        _$NotesOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'NotesOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'NotesOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotesEmptyOCS_OcsInterfaceBuilder {
  void replace(NotesEmptyOCS_OcsInterface other);
  void update(void Function(NotesEmptyOCS_OcsInterfaceBuilder) updates);
  NotesOCSMetaBuilder get meta;
  set meta(NotesOCSMetaBuilder? meta);

  ListBuilder<JsonObject> get data;
  set data(ListBuilder<JsonObject>? data);
}

class _$NotesEmptyOCS_Ocs extends NotesEmptyOCS_Ocs {
  @override
  final NotesOCSMeta meta;
  @override
  final BuiltList<JsonObject> data;

  factory _$NotesEmptyOCS_Ocs([void Function(NotesEmptyOCS_OcsBuilder)? updates]) =>
      (NotesEmptyOCS_OcsBuilder()..update(updates))._build();

  _$NotesEmptyOCS_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NotesEmptyOCS_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NotesEmptyOCS_Ocs', 'data');
  }

  @override
  NotesEmptyOCS_Ocs rebuild(void Function(NotesEmptyOCS_OcsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NotesEmptyOCS_OcsBuilder toBuilder() => NotesEmptyOCS_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesEmptyOCS_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesEmptyOCS_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NotesEmptyOCS_OcsBuilder
    implements Builder<NotesEmptyOCS_Ocs, NotesEmptyOCS_OcsBuilder>, NotesEmptyOCS_OcsInterfaceBuilder {
  _$NotesEmptyOCS_Ocs? _$v;

  NotesOCSMetaBuilder? _meta;
  NotesOCSMetaBuilder get meta => _$this._meta ??= NotesOCSMetaBuilder();
  set meta(covariant NotesOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(covariant ListBuilder<JsonObject>? data) => _$this._data = data;

  NotesEmptyOCS_OcsBuilder();

  NotesEmptyOCS_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotesEmptyOCS_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesEmptyOCS_Ocs;
  }

  @override
  void update(void Function(NotesEmptyOCS_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesEmptyOCS_Ocs build() => _build();

  _$NotesEmptyOCS_Ocs _build() {
    _$NotesEmptyOCS_Ocs _$result;
    try {
      _$result = _$v ?? _$NotesEmptyOCS_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotesEmptyOCS_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotesEmptyOCSInterfaceBuilder {
  void replace(NotesEmptyOCSInterface other);
  void update(void Function(NotesEmptyOCSInterfaceBuilder) updates);
  NotesEmptyOCS_OcsBuilder get ocs;
  set ocs(NotesEmptyOCS_OcsBuilder? ocs);
}

class _$NotesEmptyOCS extends NotesEmptyOCS {
  @override
  final NotesEmptyOCS_Ocs ocs;

  factory _$NotesEmptyOCS([void Function(NotesEmptyOCSBuilder)? updates]) =>
      (NotesEmptyOCSBuilder()..update(updates))._build();

  _$NotesEmptyOCS._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NotesEmptyOCS', 'ocs');
  }

  @override
  NotesEmptyOCS rebuild(void Function(NotesEmptyOCSBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NotesEmptyOCSBuilder toBuilder() => NotesEmptyOCSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesEmptyOCS && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesEmptyOCS')..add('ocs', ocs)).toString();
  }
}

class NotesEmptyOCSBuilder implements Builder<NotesEmptyOCS, NotesEmptyOCSBuilder>, NotesEmptyOCSInterfaceBuilder {
  _$NotesEmptyOCS? _$v;

  NotesEmptyOCS_OcsBuilder? _ocs;
  NotesEmptyOCS_OcsBuilder get ocs => _$this._ocs ??= NotesEmptyOCS_OcsBuilder();
  set ocs(covariant NotesEmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

  NotesEmptyOCSBuilder();

  NotesEmptyOCSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotesEmptyOCS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesEmptyOCS;
  }

  @override
  void update(void Function(NotesEmptyOCSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesEmptyOCS build() => _build();

  _$NotesEmptyOCS _build() {
    _$NotesEmptyOCS _$result;
    try {
      _$result = _$v ?? _$NotesEmptyOCS._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotesEmptyOCS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
