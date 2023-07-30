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

class NotesNoteBuilder implements Builder<NotesNote, NotesNoteBuilder> {
  _$NotesNote? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(String? etag) => _$this._etag = etag;

  bool? _readonly;
  bool? get readonly => _$this._readonly;
  set readonly(bool? readonly) => _$this._readonly = readonly;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(bool? favorite) => _$this._favorite = favorite;

  int? _modified;
  int? get modified => _$this._modified;
  set modified(int? modified) => _$this._modified = modified;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _errorType;
  String? get errorType => _$this._errorType;
  set errorType(String? errorType) => _$this._errorType = errorType;

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
  void replace(NotesNote other) {
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

class NotesSettingsBuilder implements Builder<NotesSettings, NotesSettingsBuilder> {
  _$NotesSettings? _$v;

  String? _notesPath;
  String? get notesPath => _$this._notesPath;
  set notesPath(String? notesPath) => _$this._notesPath = notesPath;

  String? _fileSuffix;
  String? get fileSuffix => _$this._fileSuffix;
  set fileSuffix(String? fileSuffix) => _$this._fileSuffix = fileSuffix;

  NotesSettings_NoteMode? _noteMode;
  NotesSettings_NoteMode? get noteMode => _$this._noteMode;
  set noteMode(NotesSettings_NoteMode? noteMode) => _$this._noteMode = noteMode;

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
  void replace(NotesSettings other) {
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

class NotesOCSMetaBuilder implements Builder<NotesOCSMeta, NotesOCSMetaBuilder> {
  _$NotesOCSMeta? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _totalitems;
  String? get totalitems => _$this._totalitems;
  set totalitems(String? totalitems) => _$this._totalitems = totalitems;

  String? _itemsperpage;
  String? get itemsperpage => _$this._itemsperpage;
  set itemsperpage(String? itemsperpage) => _$this._itemsperpage = itemsperpage;

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
  void replace(NotesOCSMeta other) {
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

class NotesEmptyOCS_OcsBuilder implements Builder<NotesEmptyOCS_Ocs, NotesEmptyOCS_OcsBuilder> {
  _$NotesEmptyOCS_Ocs? _$v;

  NotesOCSMetaBuilder? _meta;
  NotesOCSMetaBuilder get meta => _$this._meta ??= NotesOCSMetaBuilder();
  set meta(NotesOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(ListBuilder<JsonObject>? data) => _$this._data = data;

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
  void replace(NotesEmptyOCS_Ocs other) {
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

class NotesEmptyOCSBuilder implements Builder<NotesEmptyOCS, NotesEmptyOCSBuilder> {
  _$NotesEmptyOCS? _$v;

  NotesEmptyOCS_OcsBuilder? _ocs;
  NotesEmptyOCS_OcsBuilder get ocs => _$this._ocs ??= NotesEmptyOCS_OcsBuilder();
  set ocs(NotesEmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

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
  void replace(NotesEmptyOCS other) {
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
