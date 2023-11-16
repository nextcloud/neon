// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class OCSMetaInterfaceBuilder {
  void replace(OCSMetaInterface other);
  void update(void Function(OCSMetaInterfaceBuilder) updates);
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

class _$OCSMeta extends OCSMeta {
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

  factory _$OCSMeta([void Function(OCSMetaBuilder)? updates]) => (OCSMetaBuilder()..update(updates))._build();

  _$OCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode');
  }

  @override
  OCSMeta rebuild(void Function(OCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OCSMetaBuilder toBuilder() => OCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OCSMeta &&
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
    return (newBuiltValueToStringHelper(r'OCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class OCSMetaBuilder implements Builder<OCSMeta, OCSMetaBuilder>, OCSMetaInterfaceBuilder {
  _$OCSMeta? _$v;

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

  OCSMetaBuilder();

  OCSMetaBuilder get _$this {
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
  void replace(covariant OCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OCSMeta;
  }

  @override
  void update(void Function(OCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OCSMeta build() => _build();

  _$OCSMeta _build() {
    final _$result = _$v ??
        _$OCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterfaceBuilder {
  void replace(DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface other);
  void update(void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get name;
  set name(String? name);

  ListBuilder<String> get mimetypes;
  set mimetypes(ListBuilder<String>? mimetypes);

  ListBuilder<String> get optionalMimetypes;
  set optionalMimetypes(ListBuilder<String>? optionalMimetypes);

  bool? get secure;
  set secure(bool? secure);
}

class _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors
    extends DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors {
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<String> mimetypes;
  @override
  final BuiltList<String> optionalMimetypes;
  @override
  final bool secure;

  factory _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors(
          [void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder)? updates]) =>
      (DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder()..update(updates))._build();

  _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors._(
      {required this.id,
      required this.name,
      required this.mimetypes,
      required this.optionalMimetypes,
      required this.secure})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'name');
    BuiltValueNullFieldError.checkNotNull(
        mimetypes, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'mimetypes');
    BuiltValueNullFieldError.checkNotNull(
        optionalMimetypes, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'optionalMimetypes');
    BuiltValueNullFieldError.checkNotNull(
        secure, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'secure');
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors rebuild(
          void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder toBuilder() =>
      DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors &&
        id == other.id &&
        name == other.name &&
        mimetypes == other.mimetypes &&
        optionalMimetypes == other.optionalMimetypes &&
        secure == other.secure;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, mimetypes.hashCode);
    _$hash = $jc(_$hash, optionalMimetypes.hashCode);
    _$hash = $jc(_$hash, secure.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors')
          ..add('id', id)
          ..add('name', name)
          ..add('mimetypes', mimetypes)
          ..add('optionalMimetypes', optionalMimetypes)
          ..add('secure', secure))
        .toString();
  }
}

class DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder
    implements
        Builder<DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors,
            DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder>,
        DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterfaceBuilder {
  _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  ListBuilder<String>? _mimetypes;
  ListBuilder<String> get mimetypes => _$this._mimetypes ??= ListBuilder<String>();
  set mimetypes(covariant ListBuilder<String>? mimetypes) => _$this._mimetypes = mimetypes;

  ListBuilder<String>? _optionalMimetypes;
  ListBuilder<String> get optionalMimetypes => _$this._optionalMimetypes ??= ListBuilder<String>();
  set optionalMimetypes(covariant ListBuilder<String>? optionalMimetypes) =>
      _$this._optionalMimetypes = optionalMimetypes;

  bool? _secure;
  bool? get secure => _$this._secure;
  set secure(covariant bool? secure) => _$this._secure = secure;

  DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder();

  DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _mimetypes = $v.mimetypes.toBuilder();
      _optionalMimetypes = $v.optionalMimetypes.toBuilder();
      _secure = $v.secure;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors;
  }

  @override
  void update(void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors build() => _build();

  _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors _build() {
    _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors _$result;
    try {
      _$result = _$v ??
          _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'name'),
              mimetypes: mimetypes.build(),
              optionalMimetypes: optionalMimetypes.build(),
              secure: BuiltValueNullFieldError.checkNotNull(
                  secure, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', 'secure'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mimetypes';
        mimetypes.build();
        _$failedField = 'optionalMimetypes';
        optionalMimetypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterfaceBuilder {
  void replace(DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface other);
  void update(void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get editor;
  set editor(String? editor);

  String? get name;
  set name(String? name);

  String? get $extension;
  set $extension(String? $extension);

  bool? get templates;
  set templates(bool? templates);

  ListBuilder<String> get mimetypes;
  set mimetypes(ListBuilder<String>? mimetypes);
}

class _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators
    extends DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators {
  @override
  final String id;
  @override
  final String editor;
  @override
  final String name;
  @override
  final String $extension;
  @override
  final bool templates;
  @override
  final BuiltList<String> mimetypes;

  factory _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators(
          [void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder)? updates]) =>
      (DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder()..update(updates))._build();

  _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators._(
      {required this.id,
      required this.editor,
      required this.name,
      required this.$extension,
      required this.templates,
      required this.mimetypes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'id');
    BuiltValueNullFieldError.checkNotNull(
        editor, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'editor');
    BuiltValueNullFieldError.checkNotNull(name, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'name');
    BuiltValueNullFieldError.checkNotNull(
        $extension, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', '\$extension');
    BuiltValueNullFieldError.checkNotNull(
        templates, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'templates');
    BuiltValueNullFieldError.checkNotNull(
        mimetypes, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'mimetypes');
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators rebuild(
          void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder toBuilder() =>
      DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators &&
        id == other.id &&
        editor == other.editor &&
        name == other.name &&
        $extension == other.$extension &&
        templates == other.templates &&
        mimetypes == other.mimetypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, editor.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, $extension.hashCode);
    _$hash = $jc(_$hash, templates.hashCode);
    _$hash = $jc(_$hash, mimetypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators')
          ..add('id', id)
          ..add('editor', editor)
          ..add('name', name)
          ..add('\$extension', $extension)
          ..add('templates', templates)
          ..add('mimetypes', mimetypes))
        .toString();
  }
}

class DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder
    implements
        Builder<DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators,
            DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder>,
        DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterfaceBuilder {
  _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _editor;
  String? get editor => _$this._editor;
  set editor(covariant String? editor) => _$this._editor = editor;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _$extension;
  String? get $extension => _$this._$extension;
  set $extension(covariant String? $extension) => _$this._$extension = $extension;

  bool? _templates;
  bool? get templates => _$this._templates;
  set templates(covariant bool? templates) => _$this._templates = templates;

  ListBuilder<String>? _mimetypes;
  ListBuilder<String> get mimetypes => _$this._mimetypes ??= ListBuilder<String>();
  set mimetypes(covariant ListBuilder<String>? mimetypes) => _$this._mimetypes = mimetypes;

  DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder();

  DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _editor = $v.editor;
      _name = $v.name;
      _$extension = $v.$extension;
      _templates = $v.templates;
      _mimetypes = $v.mimetypes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators;
  }

  @override
  void update(void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators build() => _build();

  _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators _build() {
    _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators _$result;
    try {
      _$result = _$v ??
          _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'id'),
              editor: BuiltValueNullFieldError.checkNotNull(
                  editor, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'editor'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'name'),
              $extension: BuiltValueNullFieldError.checkNotNull(
                  $extension, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', '\$extension'),
              templates: BuiltValueNullFieldError.checkNotNull(
                  templates, r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', 'templates'),
              mimetypes: mimetypes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mimetypes';
        mimetypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingInfoResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(DirectEditingInfoResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(DirectEditingInfoResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get editors;
  set editors(MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors>? editors);

  MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get creators;
  set creators(MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators>? creators);
}

class _$DirectEditingInfoResponseApplicationJson_Ocs_Data extends DirectEditingInfoResponseApplicationJson_Ocs_Data {
  @override
  final BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> editors;
  @override
  final BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> creators;

  factory _$DirectEditingInfoResponseApplicationJson_Ocs_Data(
          [void Function(DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$DirectEditingInfoResponseApplicationJson_Ocs_Data._({required this.editors, required this.creators}) : super._() {
    BuiltValueNullFieldError.checkNotNull(editors, r'DirectEditingInfoResponseApplicationJson_Ocs_Data', 'editors');
    BuiltValueNullFieldError.checkNotNull(creators, r'DirectEditingInfoResponseApplicationJson_Ocs_Data', 'creators');
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data rebuild(
          void Function(DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingInfoResponseApplicationJson_Ocs_Data &&
        editors == other.editors &&
        creators == other.creators;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, editors.hashCode);
    _$hash = $jc(_$hash, creators.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectEditingInfoResponseApplicationJson_Ocs_Data')
          ..add('editors', editors)
          ..add('creators', creators))
        .toString();
  }
}

class DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<DirectEditingInfoResponseApplicationJson_Ocs_Data,
            DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder>,
        DirectEditingInfoResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$DirectEditingInfoResponseApplicationJson_Ocs_Data? _$v;

  MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors>? _editors;
  MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get editors =>
      _$this._editors ??= MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors>();
  set editors(covariant MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors>? editors) =>
      _$this._editors = editors;

  MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators>? _creators;
  MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get creators =>
      _$this._creators ??= MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators>();
  set creators(covariant MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators>? creators) =>
      _$this._creators = creators;

  DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder();

  DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _editors = $v.editors.toBuilder();
      _creators = $v.creators.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingInfoResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingInfoResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data build() => _build();

  _$DirectEditingInfoResponseApplicationJson_Ocs_Data _build() {
    _$DirectEditingInfoResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$DirectEditingInfoResponseApplicationJson_Ocs_Data._(editors: editors.build(), creators: creators.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'editors';
        editors.build();
        _$failedField = 'creators';
        creators.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DirectEditingInfoResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingInfoResponseApplicationJson_OcsInterfaceBuilder {
  void replace(DirectEditingInfoResponseApplicationJson_OcsInterface other);
  void update(void Function(DirectEditingInfoResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder get data;
  set data(DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$DirectEditingInfoResponseApplicationJson_Ocs extends DirectEditingInfoResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final DirectEditingInfoResponseApplicationJson_Ocs_Data data;

  factory _$DirectEditingInfoResponseApplicationJson_Ocs(
          [void Function(DirectEditingInfoResponseApplicationJson_OcsBuilder)? updates]) =>
      (DirectEditingInfoResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DirectEditingInfoResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DirectEditingInfoResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'DirectEditingInfoResponseApplicationJson_Ocs', 'data');
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs rebuild(
          void Function(DirectEditingInfoResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingInfoResponseApplicationJson_OcsBuilder toBuilder() =>
      DirectEditingInfoResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingInfoResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DirectEditingInfoResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DirectEditingInfoResponseApplicationJson_OcsBuilder
    implements
        Builder<DirectEditingInfoResponseApplicationJson_Ocs, DirectEditingInfoResponseApplicationJson_OcsBuilder>,
        DirectEditingInfoResponseApplicationJson_OcsInterfaceBuilder {
  _$DirectEditingInfoResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder? _data;
  DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  DirectEditingInfoResponseApplicationJson_OcsBuilder();

  DirectEditingInfoResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingInfoResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingInfoResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DirectEditingInfoResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs build() => _build();

  _$DirectEditingInfoResponseApplicationJson_Ocs _build() {
    _$DirectEditingInfoResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$DirectEditingInfoResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectEditingInfoResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingInfoResponseApplicationJsonInterfaceBuilder {
  void replace(DirectEditingInfoResponseApplicationJsonInterface other);
  void update(void Function(DirectEditingInfoResponseApplicationJsonInterfaceBuilder) updates);
  DirectEditingInfoResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DirectEditingInfoResponseApplicationJson_OcsBuilder? ocs);
}

class _$DirectEditingInfoResponseApplicationJson extends DirectEditingInfoResponseApplicationJson {
  @override
  final DirectEditingInfoResponseApplicationJson_Ocs ocs;

  factory _$DirectEditingInfoResponseApplicationJson(
          [void Function(DirectEditingInfoResponseApplicationJsonBuilder)? updates]) =>
      (DirectEditingInfoResponseApplicationJsonBuilder()..update(updates))._build();

  _$DirectEditingInfoResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DirectEditingInfoResponseApplicationJson', 'ocs');
  }

  @override
  DirectEditingInfoResponseApplicationJson rebuild(
          void Function(DirectEditingInfoResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingInfoResponseApplicationJsonBuilder toBuilder() =>
      DirectEditingInfoResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingInfoResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DirectEditingInfoResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class DirectEditingInfoResponseApplicationJsonBuilder
    implements
        Builder<DirectEditingInfoResponseApplicationJson, DirectEditingInfoResponseApplicationJsonBuilder>,
        DirectEditingInfoResponseApplicationJsonInterfaceBuilder {
  _$DirectEditingInfoResponseApplicationJson? _$v;

  DirectEditingInfoResponseApplicationJson_OcsBuilder? _ocs;
  DirectEditingInfoResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DirectEditingInfoResponseApplicationJson_OcsBuilder();
  set ocs(covariant DirectEditingInfoResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DirectEditingInfoResponseApplicationJsonBuilder();

  DirectEditingInfoResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingInfoResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingInfoResponseApplicationJson;
  }

  @override
  void update(void Function(DirectEditingInfoResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingInfoResponseApplicationJson build() => _build();

  _$DirectEditingInfoResponseApplicationJson _build() {
    _$DirectEditingInfoResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DirectEditingInfoResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectEditingInfoResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterfaceBuilder {
  void replace(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface other);
  void update(void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get title;
  set title(String? title);

  String? get preview;
  set preview(String? preview);

  String? get $extension;
  set $extension(String? $extension);

  String? get mimetype;
  set mimetype(String? mimetype);
}

class _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates
    extends DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates {
  @override
  final String id;
  @override
  final String title;
  @override
  final String? preview;
  @override
  final String $extension;
  @override
  final String mimetype;

  factory _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates(
          [void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder)? updates]) =>
      (DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder()..update(updates))._build();

  _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates._(
      {required this.id, required this.title, this.preview, required this.$extension, required this.mimetype})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', 'title');
    BuiltValueNullFieldError.checkNotNull(
        $extension, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', '\$extension');
    BuiltValueNullFieldError.checkNotNull(
        mimetype, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', 'mimetype');
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates rebuild(
          void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder toBuilder() =>
      DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates &&
        id == other.id &&
        title == other.title &&
        preview == other.preview &&
        $extension == other.$extension &&
        mimetype == other.mimetype;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, preview.hashCode);
    _$hash = $jc(_$hash, $extension.hashCode);
    _$hash = $jc(_$hash, mimetype.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates')
          ..add('id', id)
          ..add('title', title)
          ..add('preview', preview)
          ..add('\$extension', $extension)
          ..add('mimetype', mimetype))
        .toString();
  }
}

class DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder
    implements
        Builder<DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates,
            DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder>,
        DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterfaceBuilder {
  _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _preview;
  String? get preview => _$this._preview;
  set preview(covariant String? preview) => _$this._preview = preview;

  String? _$extension;
  String? get $extension => _$this._$extension;
  set $extension(covariant String? $extension) => _$this._$extension = $extension;

  String? _mimetype;
  String? get mimetype => _$this._mimetype;
  set mimetype(covariant String? mimetype) => _$this._mimetype = mimetype;

  DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder();

  DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _preview = $v.preview;
      _$extension = $v.$extension;
      _mimetype = $v.mimetype;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates;
  }

  @override
  void update(void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates build() => _build();

  _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates _build() {
    final _$result = _$v ??
        _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', 'title'),
            preview: preview,
            $extension: BuiltValueNullFieldError.checkNotNull(
                $extension, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', '\$extension'),
            mimetype: BuiltValueNullFieldError.checkNotNull(
                mimetype, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates', 'mimetype'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  MapBuilder<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get templates;
  set templates(MapBuilder<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates>? templates);
}

class _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data
    extends DirectEditingTemplatesResponseApplicationJson_Ocs_Data {
  @override
  final BuiltMap<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> templates;

  factory _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data(
          [void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data._({required this.templates}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        templates, r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data', 'templates');
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data rebuild(
          void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingTemplatesResponseApplicationJson_Ocs_Data && templates == other.templates;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, templates.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data')
          ..add('templates', templates))
        .toString();
  }
}

class DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<DirectEditingTemplatesResponseApplicationJson_Ocs_Data,
            DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder>,
        DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data? _$v;

  MapBuilder<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates>? _templates;
  MapBuilder<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get templates =>
      _$this._templates ??= MapBuilder<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates>();
  set templates(
          covariant MapBuilder<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates>? templates) =>
      _$this._templates = templates;

  DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder();

  DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _templates = $v.templates.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingTemplatesResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data build() => _build();

  _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data _build() {
    _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data._(templates: templates.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'templates';
        templates.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DirectEditingTemplatesResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingTemplatesResponseApplicationJson_OcsInterfaceBuilder {
  void replace(DirectEditingTemplatesResponseApplicationJson_OcsInterface other);
  void update(void Function(DirectEditingTemplatesResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder get data;
  set data(DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$DirectEditingTemplatesResponseApplicationJson_Ocs extends DirectEditingTemplatesResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final DirectEditingTemplatesResponseApplicationJson_Ocs_Data data;

  factory _$DirectEditingTemplatesResponseApplicationJson_Ocs(
          [void Function(DirectEditingTemplatesResponseApplicationJson_OcsBuilder)? updates]) =>
      (DirectEditingTemplatesResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DirectEditingTemplatesResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DirectEditingTemplatesResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'DirectEditingTemplatesResponseApplicationJson_Ocs', 'data');
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs rebuild(
          void Function(DirectEditingTemplatesResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingTemplatesResponseApplicationJson_OcsBuilder toBuilder() =>
      DirectEditingTemplatesResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingTemplatesResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DirectEditingTemplatesResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DirectEditingTemplatesResponseApplicationJson_OcsBuilder
    implements
        Builder<DirectEditingTemplatesResponseApplicationJson_Ocs,
            DirectEditingTemplatesResponseApplicationJson_OcsBuilder>,
        DirectEditingTemplatesResponseApplicationJson_OcsInterfaceBuilder {
  _$DirectEditingTemplatesResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder? _data;
  DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  DirectEditingTemplatesResponseApplicationJson_OcsBuilder();

  DirectEditingTemplatesResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingTemplatesResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingTemplatesResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DirectEditingTemplatesResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs build() => _build();

  _$DirectEditingTemplatesResponseApplicationJson_Ocs _build() {
    _$DirectEditingTemplatesResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$DirectEditingTemplatesResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DirectEditingTemplatesResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingTemplatesResponseApplicationJsonInterfaceBuilder {
  void replace(DirectEditingTemplatesResponseApplicationJsonInterface other);
  void update(void Function(DirectEditingTemplatesResponseApplicationJsonInterfaceBuilder) updates);
  DirectEditingTemplatesResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DirectEditingTemplatesResponseApplicationJson_OcsBuilder? ocs);
}

class _$DirectEditingTemplatesResponseApplicationJson extends DirectEditingTemplatesResponseApplicationJson {
  @override
  final DirectEditingTemplatesResponseApplicationJson_Ocs ocs;

  factory _$DirectEditingTemplatesResponseApplicationJson(
          [void Function(DirectEditingTemplatesResponseApplicationJsonBuilder)? updates]) =>
      (DirectEditingTemplatesResponseApplicationJsonBuilder()..update(updates))._build();

  _$DirectEditingTemplatesResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DirectEditingTemplatesResponseApplicationJson', 'ocs');
  }

  @override
  DirectEditingTemplatesResponseApplicationJson rebuild(
          void Function(DirectEditingTemplatesResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingTemplatesResponseApplicationJsonBuilder toBuilder() =>
      DirectEditingTemplatesResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingTemplatesResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DirectEditingTemplatesResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class DirectEditingTemplatesResponseApplicationJsonBuilder
    implements
        Builder<DirectEditingTemplatesResponseApplicationJson, DirectEditingTemplatesResponseApplicationJsonBuilder>,
        DirectEditingTemplatesResponseApplicationJsonInterfaceBuilder {
  _$DirectEditingTemplatesResponseApplicationJson? _$v;

  DirectEditingTemplatesResponseApplicationJson_OcsBuilder? _ocs;
  DirectEditingTemplatesResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DirectEditingTemplatesResponseApplicationJson_OcsBuilder();
  set ocs(covariant DirectEditingTemplatesResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DirectEditingTemplatesResponseApplicationJsonBuilder();

  DirectEditingTemplatesResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingTemplatesResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingTemplatesResponseApplicationJson;
  }

  @override
  void update(void Function(DirectEditingTemplatesResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingTemplatesResponseApplicationJson build() => _build();

  _$DirectEditingTemplatesResponseApplicationJson _build() {
    _$DirectEditingTemplatesResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DirectEditingTemplatesResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectEditingTemplatesResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingOpenResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(DirectEditingOpenResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(DirectEditingOpenResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get url;
  set url(String? url);
}

class _$DirectEditingOpenResponseApplicationJson_Ocs_Data extends DirectEditingOpenResponseApplicationJson_Ocs_Data {
  @override
  final String url;

  factory _$DirectEditingOpenResponseApplicationJson_Ocs_Data(
          [void Function(DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$DirectEditingOpenResponseApplicationJson_Ocs_Data._({required this.url}) : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'DirectEditingOpenResponseApplicationJson_Ocs_Data', 'url');
  }

  @override
  DirectEditingOpenResponseApplicationJson_Ocs_Data rebuild(
          void Function(DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingOpenResponseApplicationJson_Ocs_Data && url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectEditingOpenResponseApplicationJson_Ocs_Data')..add('url', url))
        .toString();
  }
}

class DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<DirectEditingOpenResponseApplicationJson_Ocs_Data,
            DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder>,
        DirectEditingOpenResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$DirectEditingOpenResponseApplicationJson_Ocs_Data? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder();

  DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingOpenResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingOpenResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingOpenResponseApplicationJson_Ocs_Data build() => _build();

  _$DirectEditingOpenResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$DirectEditingOpenResponseApplicationJson_Ocs_Data._(
            url: BuiltValueNullFieldError.checkNotNull(
                url, r'DirectEditingOpenResponseApplicationJson_Ocs_Data', 'url'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingOpenResponseApplicationJson_OcsInterfaceBuilder {
  void replace(DirectEditingOpenResponseApplicationJson_OcsInterface other);
  void update(void Function(DirectEditingOpenResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder get data;
  set data(DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$DirectEditingOpenResponseApplicationJson_Ocs extends DirectEditingOpenResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final DirectEditingOpenResponseApplicationJson_Ocs_Data data;

  factory _$DirectEditingOpenResponseApplicationJson_Ocs(
          [void Function(DirectEditingOpenResponseApplicationJson_OcsBuilder)? updates]) =>
      (DirectEditingOpenResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DirectEditingOpenResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DirectEditingOpenResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'DirectEditingOpenResponseApplicationJson_Ocs', 'data');
  }

  @override
  DirectEditingOpenResponseApplicationJson_Ocs rebuild(
          void Function(DirectEditingOpenResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingOpenResponseApplicationJson_OcsBuilder toBuilder() =>
      DirectEditingOpenResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingOpenResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DirectEditingOpenResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DirectEditingOpenResponseApplicationJson_OcsBuilder
    implements
        Builder<DirectEditingOpenResponseApplicationJson_Ocs, DirectEditingOpenResponseApplicationJson_OcsBuilder>,
        DirectEditingOpenResponseApplicationJson_OcsInterfaceBuilder {
  _$DirectEditingOpenResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder? _data;
  DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  DirectEditingOpenResponseApplicationJson_OcsBuilder();

  DirectEditingOpenResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingOpenResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingOpenResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DirectEditingOpenResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingOpenResponseApplicationJson_Ocs build() => _build();

  _$DirectEditingOpenResponseApplicationJson_Ocs _build() {
    _$DirectEditingOpenResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$DirectEditingOpenResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectEditingOpenResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingOpenResponseApplicationJsonInterfaceBuilder {
  void replace(DirectEditingOpenResponseApplicationJsonInterface other);
  void update(void Function(DirectEditingOpenResponseApplicationJsonInterfaceBuilder) updates);
  DirectEditingOpenResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DirectEditingOpenResponseApplicationJson_OcsBuilder? ocs);
}

class _$DirectEditingOpenResponseApplicationJson extends DirectEditingOpenResponseApplicationJson {
  @override
  final DirectEditingOpenResponseApplicationJson_Ocs ocs;

  factory _$DirectEditingOpenResponseApplicationJson(
          [void Function(DirectEditingOpenResponseApplicationJsonBuilder)? updates]) =>
      (DirectEditingOpenResponseApplicationJsonBuilder()..update(updates))._build();

  _$DirectEditingOpenResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DirectEditingOpenResponseApplicationJson', 'ocs');
  }

  @override
  DirectEditingOpenResponseApplicationJson rebuild(
          void Function(DirectEditingOpenResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingOpenResponseApplicationJsonBuilder toBuilder() =>
      DirectEditingOpenResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingOpenResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DirectEditingOpenResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class DirectEditingOpenResponseApplicationJsonBuilder
    implements
        Builder<DirectEditingOpenResponseApplicationJson, DirectEditingOpenResponseApplicationJsonBuilder>,
        DirectEditingOpenResponseApplicationJsonInterfaceBuilder {
  _$DirectEditingOpenResponseApplicationJson? _$v;

  DirectEditingOpenResponseApplicationJson_OcsBuilder? _ocs;
  DirectEditingOpenResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DirectEditingOpenResponseApplicationJson_OcsBuilder();
  set ocs(covariant DirectEditingOpenResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DirectEditingOpenResponseApplicationJsonBuilder();

  DirectEditingOpenResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingOpenResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingOpenResponseApplicationJson;
  }

  @override
  void update(void Function(DirectEditingOpenResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingOpenResponseApplicationJson build() => _build();

  _$DirectEditingOpenResponseApplicationJson _build() {
    _$DirectEditingOpenResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DirectEditingOpenResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectEditingOpenResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingCreateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(DirectEditingCreateResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(DirectEditingCreateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get url;
  set url(String? url);
}

class _$DirectEditingCreateResponseApplicationJson_Ocs_Data
    extends DirectEditingCreateResponseApplicationJson_Ocs_Data {
  @override
  final String url;

  factory _$DirectEditingCreateResponseApplicationJson_Ocs_Data(
          [void Function(DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$DirectEditingCreateResponseApplicationJson_Ocs_Data._({required this.url}) : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'DirectEditingCreateResponseApplicationJson_Ocs_Data', 'url');
  }

  @override
  DirectEditingCreateResponseApplicationJson_Ocs_Data rebuild(
          void Function(DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingCreateResponseApplicationJson_Ocs_Data && url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectEditingCreateResponseApplicationJson_Ocs_Data')..add('url', url))
        .toString();
  }
}

class DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<DirectEditingCreateResponseApplicationJson_Ocs_Data,
            DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder>,
        DirectEditingCreateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$DirectEditingCreateResponseApplicationJson_Ocs_Data? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder();

  DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingCreateResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingCreateResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingCreateResponseApplicationJson_Ocs_Data build() => _build();

  _$DirectEditingCreateResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$DirectEditingCreateResponseApplicationJson_Ocs_Data._(
            url: BuiltValueNullFieldError.checkNotNull(
                url, r'DirectEditingCreateResponseApplicationJson_Ocs_Data', 'url'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingCreateResponseApplicationJson_OcsInterfaceBuilder {
  void replace(DirectEditingCreateResponseApplicationJson_OcsInterface other);
  void update(void Function(DirectEditingCreateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder get data;
  set data(DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$DirectEditingCreateResponseApplicationJson_Ocs extends DirectEditingCreateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final DirectEditingCreateResponseApplicationJson_Ocs_Data data;

  factory _$DirectEditingCreateResponseApplicationJson_Ocs(
          [void Function(DirectEditingCreateResponseApplicationJson_OcsBuilder)? updates]) =>
      (DirectEditingCreateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DirectEditingCreateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DirectEditingCreateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'DirectEditingCreateResponseApplicationJson_Ocs', 'data');
  }

  @override
  DirectEditingCreateResponseApplicationJson_Ocs rebuild(
          void Function(DirectEditingCreateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingCreateResponseApplicationJson_OcsBuilder toBuilder() =>
      DirectEditingCreateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingCreateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DirectEditingCreateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DirectEditingCreateResponseApplicationJson_OcsBuilder
    implements
        Builder<DirectEditingCreateResponseApplicationJson_Ocs, DirectEditingCreateResponseApplicationJson_OcsBuilder>,
        DirectEditingCreateResponseApplicationJson_OcsInterfaceBuilder {
  _$DirectEditingCreateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder? _data;
  DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  DirectEditingCreateResponseApplicationJson_OcsBuilder();

  DirectEditingCreateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingCreateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingCreateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DirectEditingCreateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingCreateResponseApplicationJson_Ocs build() => _build();

  _$DirectEditingCreateResponseApplicationJson_Ocs _build() {
    _$DirectEditingCreateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$DirectEditingCreateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DirectEditingCreateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectEditingCreateResponseApplicationJsonInterfaceBuilder {
  void replace(DirectEditingCreateResponseApplicationJsonInterface other);
  void update(void Function(DirectEditingCreateResponseApplicationJsonInterfaceBuilder) updates);
  DirectEditingCreateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DirectEditingCreateResponseApplicationJson_OcsBuilder? ocs);
}

class _$DirectEditingCreateResponseApplicationJson extends DirectEditingCreateResponseApplicationJson {
  @override
  final DirectEditingCreateResponseApplicationJson_Ocs ocs;

  factory _$DirectEditingCreateResponseApplicationJson(
          [void Function(DirectEditingCreateResponseApplicationJsonBuilder)? updates]) =>
      (DirectEditingCreateResponseApplicationJsonBuilder()..update(updates))._build();

  _$DirectEditingCreateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DirectEditingCreateResponseApplicationJson', 'ocs');
  }

  @override
  DirectEditingCreateResponseApplicationJson rebuild(
          void Function(DirectEditingCreateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectEditingCreateResponseApplicationJsonBuilder toBuilder() =>
      DirectEditingCreateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectEditingCreateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DirectEditingCreateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class DirectEditingCreateResponseApplicationJsonBuilder
    implements
        Builder<DirectEditingCreateResponseApplicationJson, DirectEditingCreateResponseApplicationJsonBuilder>,
        DirectEditingCreateResponseApplicationJsonInterfaceBuilder {
  _$DirectEditingCreateResponseApplicationJson? _$v;

  DirectEditingCreateResponseApplicationJson_OcsBuilder? _ocs;
  DirectEditingCreateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DirectEditingCreateResponseApplicationJson_OcsBuilder();
  set ocs(covariant DirectEditingCreateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DirectEditingCreateResponseApplicationJsonBuilder();

  DirectEditingCreateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectEditingCreateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectEditingCreateResponseApplicationJson;
  }

  @override
  void update(void Function(DirectEditingCreateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectEditingCreateResponseApplicationJson build() => _build();

  _$DirectEditingCreateResponseApplicationJson _build() {
    _$DirectEditingCreateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DirectEditingCreateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectEditingCreateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get userId;
  set userId(String? userId);

  String? get pathHash;
  set pathHash(String? pathHash);

  int? get expirationTime;
  set expirationTime(int? expirationTime);

  String? get token;
  set token(String? token);
}

class _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data
    extends OpenLocalEditorCreateResponseApplicationJson_Ocs_Data {
  @override
  final String? userId;
  @override
  final String pathHash;
  @override
  final int expirationTime;
  @override
  final String token;

  factory _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data(
          [void Function(OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data._(
      {this.userId, required this.pathHash, required this.expirationTime, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pathHash, r'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data', 'pathHash');
    BuiltValueNullFieldError.checkNotNull(
        expirationTime, r'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data', 'expirationTime');
    BuiltValueNullFieldError.checkNotNull(token, r'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data', 'token');
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson_Ocs_Data rebuild(
          void Function(OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenLocalEditorCreateResponseApplicationJson_Ocs_Data &&
        userId == other.userId &&
        pathHash == other.pathHash &&
        expirationTime == other.expirationTime &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, pathHash.hashCode);
    _$hash = $jc(_$hash, expirationTime.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data')
          ..add('userId', userId)
          ..add('pathHash', pathHash)
          ..add('expirationTime', expirationTime)
          ..add('token', token))
        .toString();
  }
}

class OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<OpenLocalEditorCreateResponseApplicationJson_Ocs_Data,
            OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder>,
        OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _pathHash;
  String? get pathHash => _$this._pathHash;
  set pathHash(covariant String? pathHash) => _$this._pathHash = pathHash;

  int? _expirationTime;
  int? get expirationTime => _$this._expirationTime;
  set expirationTime(covariant int? expirationTime) => _$this._expirationTime = expirationTime;

  String? _token;
  String? get token => _$this._token;
  set token(covariant String? token) => _$this._token = token;

  OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder();

  OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _pathHash = $v.pathHash;
      _expirationTime = $v.expirationTime;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenLocalEditorCreateResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson_Ocs_Data build() => _build();

  _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data._(
            userId: userId,
            pathHash: BuiltValueNullFieldError.checkNotNull(
                pathHash, r'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data', 'pathHash'),
            expirationTime: BuiltValueNullFieldError.checkNotNull(
                expirationTime, r'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data', 'expirationTime'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data', 'token'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OpenLocalEditorCreateResponseApplicationJson_OcsInterfaceBuilder {
  void replace(OpenLocalEditorCreateResponseApplicationJson_OcsInterface other);
  void update(void Function(OpenLocalEditorCreateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder get data;
  set data(OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$OpenLocalEditorCreateResponseApplicationJson_Ocs extends OpenLocalEditorCreateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final OpenLocalEditorCreateResponseApplicationJson_Ocs_Data data;

  factory _$OpenLocalEditorCreateResponseApplicationJson_Ocs(
          [void Function(OpenLocalEditorCreateResponseApplicationJson_OcsBuilder)? updates]) =>
      (OpenLocalEditorCreateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$OpenLocalEditorCreateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'OpenLocalEditorCreateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'OpenLocalEditorCreateResponseApplicationJson_Ocs', 'data');
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson_Ocs rebuild(
          void Function(OpenLocalEditorCreateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenLocalEditorCreateResponseApplicationJson_OcsBuilder toBuilder() =>
      OpenLocalEditorCreateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenLocalEditorCreateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'OpenLocalEditorCreateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class OpenLocalEditorCreateResponseApplicationJson_OcsBuilder
    implements
        Builder<OpenLocalEditorCreateResponseApplicationJson_Ocs,
            OpenLocalEditorCreateResponseApplicationJson_OcsBuilder>,
        OpenLocalEditorCreateResponseApplicationJson_OcsInterfaceBuilder {
  _$OpenLocalEditorCreateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder? _data;
  OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  OpenLocalEditorCreateResponseApplicationJson_OcsBuilder();

  OpenLocalEditorCreateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenLocalEditorCreateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenLocalEditorCreateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(OpenLocalEditorCreateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson_Ocs build() => _build();

  _$OpenLocalEditorCreateResponseApplicationJson_Ocs _build() {
    _$OpenLocalEditorCreateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$OpenLocalEditorCreateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OpenLocalEditorCreateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OpenLocalEditorCreateResponseApplicationJsonInterfaceBuilder {
  void replace(OpenLocalEditorCreateResponseApplicationJsonInterface other);
  void update(void Function(OpenLocalEditorCreateResponseApplicationJsonInterfaceBuilder) updates);
  OpenLocalEditorCreateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(OpenLocalEditorCreateResponseApplicationJson_OcsBuilder? ocs);
}

class _$OpenLocalEditorCreateResponseApplicationJson extends OpenLocalEditorCreateResponseApplicationJson {
  @override
  final OpenLocalEditorCreateResponseApplicationJson_Ocs ocs;

  factory _$OpenLocalEditorCreateResponseApplicationJson(
          [void Function(OpenLocalEditorCreateResponseApplicationJsonBuilder)? updates]) =>
      (OpenLocalEditorCreateResponseApplicationJsonBuilder()..update(updates))._build();

  _$OpenLocalEditorCreateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'OpenLocalEditorCreateResponseApplicationJson', 'ocs');
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson rebuild(
          void Function(OpenLocalEditorCreateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenLocalEditorCreateResponseApplicationJsonBuilder toBuilder() =>
      OpenLocalEditorCreateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenLocalEditorCreateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'OpenLocalEditorCreateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class OpenLocalEditorCreateResponseApplicationJsonBuilder
    implements
        Builder<OpenLocalEditorCreateResponseApplicationJson, OpenLocalEditorCreateResponseApplicationJsonBuilder>,
        OpenLocalEditorCreateResponseApplicationJsonInterfaceBuilder {
  _$OpenLocalEditorCreateResponseApplicationJson? _$v;

  OpenLocalEditorCreateResponseApplicationJson_OcsBuilder? _ocs;
  OpenLocalEditorCreateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= OpenLocalEditorCreateResponseApplicationJson_OcsBuilder();
  set ocs(covariant OpenLocalEditorCreateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  OpenLocalEditorCreateResponseApplicationJsonBuilder();

  OpenLocalEditorCreateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenLocalEditorCreateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenLocalEditorCreateResponseApplicationJson;
  }

  @override
  void update(void Function(OpenLocalEditorCreateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson build() => _build();

  _$OpenLocalEditorCreateResponseApplicationJson _build() {
    _$OpenLocalEditorCreateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$OpenLocalEditorCreateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OpenLocalEditorCreateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get userId;
  set userId(String? userId);

  String? get pathHash;
  set pathHash(String? pathHash);

  int? get expirationTime;
  set expirationTime(int? expirationTime);

  String? get token;
  set token(String? token);
}

class _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data
    extends OpenLocalEditorValidateResponseApplicationJson_Ocs_Data {
  @override
  final String userId;
  @override
  final String pathHash;
  @override
  final int expirationTime;
  @override
  final String token;

  factory _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data(
          [void Function(OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data._(
      {required this.userId, required this.pathHash, required this.expirationTime, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        pathHash, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'pathHash');
    BuiltValueNullFieldError.checkNotNull(
        expirationTime, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'expirationTime');
    BuiltValueNullFieldError.checkNotNull(token, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'token');
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson_Ocs_Data rebuild(
          void Function(OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenLocalEditorValidateResponseApplicationJson_Ocs_Data &&
        userId == other.userId &&
        pathHash == other.pathHash &&
        expirationTime == other.expirationTime &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, pathHash.hashCode);
    _$hash = $jc(_$hash, expirationTime.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data')
          ..add('userId', userId)
          ..add('pathHash', pathHash)
          ..add('expirationTime', expirationTime)
          ..add('token', token))
        .toString();
  }
}

class OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<OpenLocalEditorValidateResponseApplicationJson_Ocs_Data,
            OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder>,
        OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _pathHash;
  String? get pathHash => _$this._pathHash;
  set pathHash(covariant String? pathHash) => _$this._pathHash = pathHash;

  int? _expirationTime;
  int? get expirationTime => _$this._expirationTime;
  set expirationTime(covariant int? expirationTime) => _$this._expirationTime = expirationTime;

  String? _token;
  String? get token => _$this._token;
  set token(covariant String? token) => _$this._token = token;

  OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder();

  OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _pathHash = $v.pathHash;
      _expirationTime = $v.expirationTime;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenLocalEditorValidateResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson_Ocs_Data build() => _build();

  _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'userId'),
            pathHash: BuiltValueNullFieldError.checkNotNull(
                pathHash, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'pathHash'),
            expirationTime: BuiltValueNullFieldError.checkNotNull(
                expirationTime, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'expirationTime'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data', 'token'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OpenLocalEditorValidateResponseApplicationJson_OcsInterfaceBuilder {
  void replace(OpenLocalEditorValidateResponseApplicationJson_OcsInterface other);
  void update(void Function(OpenLocalEditorValidateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder get data;
  set data(OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$OpenLocalEditorValidateResponseApplicationJson_Ocs extends OpenLocalEditorValidateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final OpenLocalEditorValidateResponseApplicationJson_Ocs_Data data;

  factory _$OpenLocalEditorValidateResponseApplicationJson_Ocs(
          [void Function(OpenLocalEditorValidateResponseApplicationJson_OcsBuilder)? updates]) =>
      (OpenLocalEditorValidateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$OpenLocalEditorValidateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'OpenLocalEditorValidateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'OpenLocalEditorValidateResponseApplicationJson_Ocs', 'data');
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson_Ocs rebuild(
          void Function(OpenLocalEditorValidateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenLocalEditorValidateResponseApplicationJson_OcsBuilder toBuilder() =>
      OpenLocalEditorValidateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenLocalEditorValidateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'OpenLocalEditorValidateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class OpenLocalEditorValidateResponseApplicationJson_OcsBuilder
    implements
        Builder<OpenLocalEditorValidateResponseApplicationJson_Ocs,
            OpenLocalEditorValidateResponseApplicationJson_OcsBuilder>,
        OpenLocalEditorValidateResponseApplicationJson_OcsInterfaceBuilder {
  _$OpenLocalEditorValidateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder? _data;
  OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  OpenLocalEditorValidateResponseApplicationJson_OcsBuilder();

  OpenLocalEditorValidateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenLocalEditorValidateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenLocalEditorValidateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(OpenLocalEditorValidateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson_Ocs build() => _build();

  _$OpenLocalEditorValidateResponseApplicationJson_Ocs _build() {
    _$OpenLocalEditorValidateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$OpenLocalEditorValidateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OpenLocalEditorValidateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OpenLocalEditorValidateResponseApplicationJsonInterfaceBuilder {
  void replace(OpenLocalEditorValidateResponseApplicationJsonInterface other);
  void update(void Function(OpenLocalEditorValidateResponseApplicationJsonInterfaceBuilder) updates);
  OpenLocalEditorValidateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(OpenLocalEditorValidateResponseApplicationJson_OcsBuilder? ocs);
}

class _$OpenLocalEditorValidateResponseApplicationJson extends OpenLocalEditorValidateResponseApplicationJson {
  @override
  final OpenLocalEditorValidateResponseApplicationJson_Ocs ocs;

  factory _$OpenLocalEditorValidateResponseApplicationJson(
          [void Function(OpenLocalEditorValidateResponseApplicationJsonBuilder)? updates]) =>
      (OpenLocalEditorValidateResponseApplicationJsonBuilder()..update(updates))._build();

  _$OpenLocalEditorValidateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'OpenLocalEditorValidateResponseApplicationJson', 'ocs');
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson rebuild(
          void Function(OpenLocalEditorValidateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenLocalEditorValidateResponseApplicationJsonBuilder toBuilder() =>
      OpenLocalEditorValidateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenLocalEditorValidateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'OpenLocalEditorValidateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class OpenLocalEditorValidateResponseApplicationJsonBuilder
    implements
        Builder<OpenLocalEditorValidateResponseApplicationJson, OpenLocalEditorValidateResponseApplicationJsonBuilder>,
        OpenLocalEditorValidateResponseApplicationJsonInterfaceBuilder {
  _$OpenLocalEditorValidateResponseApplicationJson? _$v;

  OpenLocalEditorValidateResponseApplicationJson_OcsBuilder? _ocs;
  OpenLocalEditorValidateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= OpenLocalEditorValidateResponseApplicationJson_OcsBuilder();
  set ocs(covariant OpenLocalEditorValidateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  OpenLocalEditorValidateResponseApplicationJsonBuilder();

  OpenLocalEditorValidateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenLocalEditorValidateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenLocalEditorValidateResponseApplicationJson;
  }

  @override
  void update(void Function(OpenLocalEditorValidateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson build() => _build();

  _$OpenLocalEditorValidateResponseApplicationJson _build() {
    _$OpenLocalEditorValidateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$OpenLocalEditorValidateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OpenLocalEditorValidateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplateFileCreatorInterfaceBuilder {
  void replace(TemplateFileCreatorInterface other);
  void update(void Function(TemplateFileCreatorInterfaceBuilder) updates);
  String? get app;
  set app(String? app);

  String? get label;
  set label(String? label);

  String? get $extension;
  set $extension(String? $extension);

  String? get iconClass;
  set iconClass(String? iconClass);

  ListBuilder<String> get mimetypes;
  set mimetypes(ListBuilder<String>? mimetypes);

  double? get ratio;
  set ratio(double? ratio);

  String? get actionLabel;
  set actionLabel(String? actionLabel);
}

class _$TemplateFileCreator extends TemplateFileCreator {
  @override
  final String app;
  @override
  final String label;
  @override
  final String $extension;
  @override
  final String? iconClass;
  @override
  final BuiltList<String> mimetypes;
  @override
  final double? ratio;
  @override
  final String actionLabel;

  factory _$TemplateFileCreator([void Function(TemplateFileCreatorBuilder)? updates]) =>
      (TemplateFileCreatorBuilder()..update(updates))._build();

  _$TemplateFileCreator._(
      {required this.app,
      required this.label,
      required this.$extension,
      this.iconClass,
      required this.mimetypes,
      this.ratio,
      required this.actionLabel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(app, r'TemplateFileCreator', 'app');
    BuiltValueNullFieldError.checkNotNull(label, r'TemplateFileCreator', 'label');
    BuiltValueNullFieldError.checkNotNull($extension, r'TemplateFileCreator', '\$extension');
    BuiltValueNullFieldError.checkNotNull(mimetypes, r'TemplateFileCreator', 'mimetypes');
    BuiltValueNullFieldError.checkNotNull(actionLabel, r'TemplateFileCreator', 'actionLabel');
  }

  @override
  TemplateFileCreator rebuild(void Function(TemplateFileCreatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplateFileCreatorBuilder toBuilder() => TemplateFileCreatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplateFileCreator &&
        app == other.app &&
        label == other.label &&
        $extension == other.$extension &&
        iconClass == other.iconClass &&
        mimetypes == other.mimetypes &&
        ratio == other.ratio &&
        actionLabel == other.actionLabel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, app.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, $extension.hashCode);
    _$hash = $jc(_$hash, iconClass.hashCode);
    _$hash = $jc(_$hash, mimetypes.hashCode);
    _$hash = $jc(_$hash, ratio.hashCode);
    _$hash = $jc(_$hash, actionLabel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TemplateFileCreator')
          ..add('app', app)
          ..add('label', label)
          ..add('\$extension', $extension)
          ..add('iconClass', iconClass)
          ..add('mimetypes', mimetypes)
          ..add('ratio', ratio)
          ..add('actionLabel', actionLabel))
        .toString();
  }
}

class TemplateFileCreatorBuilder
    implements Builder<TemplateFileCreator, TemplateFileCreatorBuilder>, TemplateFileCreatorInterfaceBuilder {
  _$TemplateFileCreator? _$v;

  String? _app;
  String? get app => _$this._app;
  set app(covariant String? app) => _$this._app = app;

  String? _label;
  String? get label => _$this._label;
  set label(covariant String? label) => _$this._label = label;

  String? _$extension;
  String? get $extension => _$this._$extension;
  set $extension(covariant String? $extension) => _$this._$extension = $extension;

  String? _iconClass;
  String? get iconClass => _$this._iconClass;
  set iconClass(covariant String? iconClass) => _$this._iconClass = iconClass;

  ListBuilder<String>? _mimetypes;
  ListBuilder<String> get mimetypes => _$this._mimetypes ??= ListBuilder<String>();
  set mimetypes(covariant ListBuilder<String>? mimetypes) => _$this._mimetypes = mimetypes;

  double? _ratio;
  double? get ratio => _$this._ratio;
  set ratio(covariant double? ratio) => _$this._ratio = ratio;

  String? _actionLabel;
  String? get actionLabel => _$this._actionLabel;
  set actionLabel(covariant String? actionLabel) => _$this._actionLabel = actionLabel;

  TemplateFileCreatorBuilder();

  TemplateFileCreatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _app = $v.app;
      _label = $v.label;
      _$extension = $v.$extension;
      _iconClass = $v.iconClass;
      _mimetypes = $v.mimetypes.toBuilder();
      _ratio = $v.ratio;
      _actionLabel = $v.actionLabel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplateFileCreator other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplateFileCreator;
  }

  @override
  void update(void Function(TemplateFileCreatorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplateFileCreator build() => _build();

  _$TemplateFileCreator _build() {
    _$TemplateFileCreator _$result;
    try {
      _$result = _$v ??
          _$TemplateFileCreator._(
              app: BuiltValueNullFieldError.checkNotNull(app, r'TemplateFileCreator', 'app'),
              label: BuiltValueNullFieldError.checkNotNull(label, r'TemplateFileCreator', 'label'),
              $extension: BuiltValueNullFieldError.checkNotNull($extension, r'TemplateFileCreator', '\$extension'),
              iconClass: iconClass,
              mimetypes: mimetypes.build(),
              ratio: ratio,
              actionLabel: BuiltValueNullFieldError.checkNotNull(actionLabel, r'TemplateFileCreator', 'actionLabel'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mimetypes';
        mimetypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplateFileCreator', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplateListResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TemplateListResponseApplicationJson_OcsInterface other);
  void update(void Function(TemplateListResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<TemplateFileCreator> get data;
  set data(ListBuilder<TemplateFileCreator>? data);
}

class _$TemplateListResponseApplicationJson_Ocs extends TemplateListResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<TemplateFileCreator> data;

  factory _$TemplateListResponseApplicationJson_Ocs(
          [void Function(TemplateListResponseApplicationJson_OcsBuilder)? updates]) =>
      (TemplateListResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TemplateListResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TemplateListResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TemplateListResponseApplicationJson_Ocs', 'data');
  }

  @override
  TemplateListResponseApplicationJson_Ocs rebuild(
          void Function(TemplateListResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplateListResponseApplicationJson_OcsBuilder toBuilder() =>
      TemplateListResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplateListResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TemplateListResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TemplateListResponseApplicationJson_OcsBuilder
    implements
        Builder<TemplateListResponseApplicationJson_Ocs, TemplateListResponseApplicationJson_OcsBuilder>,
        TemplateListResponseApplicationJson_OcsInterfaceBuilder {
  _$TemplateListResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<TemplateFileCreator>? _data;
  ListBuilder<TemplateFileCreator> get data => _$this._data ??= ListBuilder<TemplateFileCreator>();
  set data(covariant ListBuilder<TemplateFileCreator>? data) => _$this._data = data;

  TemplateListResponseApplicationJson_OcsBuilder();

  TemplateListResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplateListResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplateListResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TemplateListResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplateListResponseApplicationJson_Ocs build() => _build();

  _$TemplateListResponseApplicationJson_Ocs _build() {
    _$TemplateListResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TemplateListResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplateListResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplateListResponseApplicationJsonInterfaceBuilder {
  void replace(TemplateListResponseApplicationJsonInterface other);
  void update(void Function(TemplateListResponseApplicationJsonInterfaceBuilder) updates);
  TemplateListResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TemplateListResponseApplicationJson_OcsBuilder? ocs);
}

class _$TemplateListResponseApplicationJson extends TemplateListResponseApplicationJson {
  @override
  final TemplateListResponseApplicationJson_Ocs ocs;

  factory _$TemplateListResponseApplicationJson([void Function(TemplateListResponseApplicationJsonBuilder)? updates]) =>
      (TemplateListResponseApplicationJsonBuilder()..update(updates))._build();

  _$TemplateListResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TemplateListResponseApplicationJson', 'ocs');
  }

  @override
  TemplateListResponseApplicationJson rebuild(void Function(TemplateListResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplateListResponseApplicationJsonBuilder toBuilder() => TemplateListResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplateListResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TemplateListResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TemplateListResponseApplicationJsonBuilder
    implements
        Builder<TemplateListResponseApplicationJson, TemplateListResponseApplicationJsonBuilder>,
        TemplateListResponseApplicationJsonInterfaceBuilder {
  _$TemplateListResponseApplicationJson? _$v;

  TemplateListResponseApplicationJson_OcsBuilder? _ocs;
  TemplateListResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TemplateListResponseApplicationJson_OcsBuilder();
  set ocs(covariant TemplateListResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TemplateListResponseApplicationJsonBuilder();

  TemplateListResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplateListResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplateListResponseApplicationJson;
  }

  @override
  void update(void Function(TemplateListResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplateListResponseApplicationJson build() => _build();

  _$TemplateListResponseApplicationJson _build() {
    _$TemplateListResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TemplateListResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplateListResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplateFileInterfaceBuilder {
  void replace(TemplateFileInterface other);
  void update(void Function(TemplateFileInterfaceBuilder) updates);
  String? get basename;
  set basename(String? basename);

  String? get etag;
  set etag(String? etag);

  int? get fileid;
  set fileid(int? fileid);

  String? get filename;
  set filename(String? filename);

  int? get lastmod;
  set lastmod(int? lastmod);

  String? get mime;
  set mime(String? mime);

  int? get size;
  set size(int? size);

  String? get type;
  set type(String? type);

  bool? get hasPreview;
  set hasPreview(bool? hasPreview);
}

class _$TemplateFile extends TemplateFile {
  @override
  final String basename;
  @override
  final String etag;
  @override
  final int fileid;
  @override
  final String? filename;
  @override
  final int lastmod;
  @override
  final String mime;
  @override
  final int size;
  @override
  final String type;
  @override
  final bool hasPreview;

  factory _$TemplateFile([void Function(TemplateFileBuilder)? updates]) =>
      (TemplateFileBuilder()..update(updates))._build();

  _$TemplateFile._(
      {required this.basename,
      required this.etag,
      required this.fileid,
      this.filename,
      required this.lastmod,
      required this.mime,
      required this.size,
      required this.type,
      required this.hasPreview})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(basename, r'TemplateFile', 'basename');
    BuiltValueNullFieldError.checkNotNull(etag, r'TemplateFile', 'etag');
    BuiltValueNullFieldError.checkNotNull(fileid, r'TemplateFile', 'fileid');
    BuiltValueNullFieldError.checkNotNull(lastmod, r'TemplateFile', 'lastmod');
    BuiltValueNullFieldError.checkNotNull(mime, r'TemplateFile', 'mime');
    BuiltValueNullFieldError.checkNotNull(size, r'TemplateFile', 'size');
    BuiltValueNullFieldError.checkNotNull(type, r'TemplateFile', 'type');
    BuiltValueNullFieldError.checkNotNull(hasPreview, r'TemplateFile', 'hasPreview');
  }

  @override
  TemplateFile rebuild(void Function(TemplateFileBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  TemplateFileBuilder toBuilder() => TemplateFileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplateFile &&
        basename == other.basename &&
        etag == other.etag &&
        fileid == other.fileid &&
        filename == other.filename &&
        lastmod == other.lastmod &&
        mime == other.mime &&
        size == other.size &&
        type == other.type &&
        hasPreview == other.hasPreview;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, basename.hashCode);
    _$hash = $jc(_$hash, etag.hashCode);
    _$hash = $jc(_$hash, fileid.hashCode);
    _$hash = $jc(_$hash, filename.hashCode);
    _$hash = $jc(_$hash, lastmod.hashCode);
    _$hash = $jc(_$hash, mime.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, hasPreview.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TemplateFile')
          ..add('basename', basename)
          ..add('etag', etag)
          ..add('fileid', fileid)
          ..add('filename', filename)
          ..add('lastmod', lastmod)
          ..add('mime', mime)
          ..add('size', size)
          ..add('type', type)
          ..add('hasPreview', hasPreview))
        .toString();
  }
}

class TemplateFileBuilder implements Builder<TemplateFile, TemplateFileBuilder>, TemplateFileInterfaceBuilder {
  _$TemplateFile? _$v;

  String? _basename;
  String? get basename => _$this._basename;
  set basename(covariant String? basename) => _$this._basename = basename;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(covariant String? etag) => _$this._etag = etag;

  int? _fileid;
  int? get fileid => _$this._fileid;
  set fileid(covariant int? fileid) => _$this._fileid = fileid;

  String? _filename;
  String? get filename => _$this._filename;
  set filename(covariant String? filename) => _$this._filename = filename;

  int? _lastmod;
  int? get lastmod => _$this._lastmod;
  set lastmod(covariant int? lastmod) => _$this._lastmod = lastmod;

  String? _mime;
  String? get mime => _$this._mime;
  set mime(covariant String? mime) => _$this._mime = mime;

  int? _size;
  int? get size => _$this._size;
  set size(covariant int? size) => _$this._size = size;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  bool? _hasPreview;
  bool? get hasPreview => _$this._hasPreview;
  set hasPreview(covariant bool? hasPreview) => _$this._hasPreview = hasPreview;

  TemplateFileBuilder();

  TemplateFileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _basename = $v.basename;
      _etag = $v.etag;
      _fileid = $v.fileid;
      _filename = $v.filename;
      _lastmod = $v.lastmod;
      _mime = $v.mime;
      _size = $v.size;
      _type = $v.type;
      _hasPreview = $v.hasPreview;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplateFile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplateFile;
  }

  @override
  void update(void Function(TemplateFileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplateFile build() => _build();

  _$TemplateFile _build() {
    final _$result = _$v ??
        _$TemplateFile._(
            basename: BuiltValueNullFieldError.checkNotNull(basename, r'TemplateFile', 'basename'),
            etag: BuiltValueNullFieldError.checkNotNull(etag, r'TemplateFile', 'etag'),
            fileid: BuiltValueNullFieldError.checkNotNull(fileid, r'TemplateFile', 'fileid'),
            filename: filename,
            lastmod: BuiltValueNullFieldError.checkNotNull(lastmod, r'TemplateFile', 'lastmod'),
            mime: BuiltValueNullFieldError.checkNotNull(mime, r'TemplateFile', 'mime'),
            size: BuiltValueNullFieldError.checkNotNull(size, r'TemplateFile', 'size'),
            type: BuiltValueNullFieldError.checkNotNull(type, r'TemplateFile', 'type'),
            hasPreview: BuiltValueNullFieldError.checkNotNull(hasPreview, r'TemplateFile', 'hasPreview'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplateCreateResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TemplateCreateResponseApplicationJson_OcsInterface other);
  void update(void Function(TemplateCreateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TemplateFileBuilder get data;
  set data(TemplateFileBuilder? data);
}

class _$TemplateCreateResponseApplicationJson_Ocs extends TemplateCreateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TemplateFile data;

  factory _$TemplateCreateResponseApplicationJson_Ocs(
          [void Function(TemplateCreateResponseApplicationJson_OcsBuilder)? updates]) =>
      (TemplateCreateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TemplateCreateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TemplateCreateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TemplateCreateResponseApplicationJson_Ocs', 'data');
  }

  @override
  TemplateCreateResponseApplicationJson_Ocs rebuild(
          void Function(TemplateCreateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplateCreateResponseApplicationJson_OcsBuilder toBuilder() =>
      TemplateCreateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplateCreateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TemplateCreateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TemplateCreateResponseApplicationJson_OcsBuilder
    implements
        Builder<TemplateCreateResponseApplicationJson_Ocs, TemplateCreateResponseApplicationJson_OcsBuilder>,
        TemplateCreateResponseApplicationJson_OcsInterfaceBuilder {
  _$TemplateCreateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TemplateFileBuilder? _data;
  TemplateFileBuilder get data => _$this._data ??= TemplateFileBuilder();
  set data(covariant TemplateFileBuilder? data) => _$this._data = data;

  TemplateCreateResponseApplicationJson_OcsBuilder();

  TemplateCreateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplateCreateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplateCreateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TemplateCreateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplateCreateResponseApplicationJson_Ocs build() => _build();

  _$TemplateCreateResponseApplicationJson_Ocs _build() {
    _$TemplateCreateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TemplateCreateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplateCreateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplateCreateResponseApplicationJsonInterfaceBuilder {
  void replace(TemplateCreateResponseApplicationJsonInterface other);
  void update(void Function(TemplateCreateResponseApplicationJsonInterfaceBuilder) updates);
  TemplateCreateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TemplateCreateResponseApplicationJson_OcsBuilder? ocs);
}

class _$TemplateCreateResponseApplicationJson extends TemplateCreateResponseApplicationJson {
  @override
  final TemplateCreateResponseApplicationJson_Ocs ocs;

  factory _$TemplateCreateResponseApplicationJson(
          [void Function(TemplateCreateResponseApplicationJsonBuilder)? updates]) =>
      (TemplateCreateResponseApplicationJsonBuilder()..update(updates))._build();

  _$TemplateCreateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TemplateCreateResponseApplicationJson', 'ocs');
  }

  @override
  TemplateCreateResponseApplicationJson rebuild(void Function(TemplateCreateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplateCreateResponseApplicationJsonBuilder toBuilder() =>
      TemplateCreateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplateCreateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TemplateCreateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TemplateCreateResponseApplicationJsonBuilder
    implements
        Builder<TemplateCreateResponseApplicationJson, TemplateCreateResponseApplicationJsonBuilder>,
        TemplateCreateResponseApplicationJsonInterfaceBuilder {
  _$TemplateCreateResponseApplicationJson? _$v;

  TemplateCreateResponseApplicationJson_OcsBuilder? _ocs;
  TemplateCreateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TemplateCreateResponseApplicationJson_OcsBuilder();
  set ocs(covariant TemplateCreateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TemplateCreateResponseApplicationJsonBuilder();

  TemplateCreateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplateCreateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplateCreateResponseApplicationJson;
  }

  @override
  void update(void Function(TemplateCreateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplateCreateResponseApplicationJson build() => _build();

  _$TemplateCreateResponseApplicationJson _build() {
    _$TemplateCreateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TemplateCreateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplateCreateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplatePathResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TemplatePathResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TemplatePathResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get templatePath;
  set templatePath(String? templatePath);

  ListBuilder<TemplateFileCreator> get templates;
  set templates(ListBuilder<TemplateFileCreator>? templates);
}

class _$TemplatePathResponseApplicationJson_Ocs_Data extends TemplatePathResponseApplicationJson_Ocs_Data {
  @override
  final String templatePath;
  @override
  final BuiltList<TemplateFileCreator> templates;

  factory _$TemplatePathResponseApplicationJson_Ocs_Data(
          [void Function(TemplatePathResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TemplatePathResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TemplatePathResponseApplicationJson_Ocs_Data._({required this.templatePath, required this.templates}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        templatePath, r'TemplatePathResponseApplicationJson_Ocs_Data', 'templatePath');
    BuiltValueNullFieldError.checkNotNull(templates, r'TemplatePathResponseApplicationJson_Ocs_Data', 'templates');
  }

  @override
  TemplatePathResponseApplicationJson_Ocs_Data rebuild(
          void Function(TemplatePathResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplatePathResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TemplatePathResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplatePathResponseApplicationJson_Ocs_Data &&
        templatePath == other.templatePath &&
        templates == other.templates;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, templatePath.hashCode);
    _$hash = $jc(_$hash, templates.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TemplatePathResponseApplicationJson_Ocs_Data')
          ..add('templatePath', templatePath)
          ..add('templates', templates))
        .toString();
  }
}

class TemplatePathResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TemplatePathResponseApplicationJson_Ocs_Data, TemplatePathResponseApplicationJson_Ocs_DataBuilder>,
        TemplatePathResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TemplatePathResponseApplicationJson_Ocs_Data? _$v;

  String? _templatePath;
  String? get templatePath => _$this._templatePath;
  set templatePath(covariant String? templatePath) => _$this._templatePath = templatePath;

  ListBuilder<TemplateFileCreator>? _templates;
  ListBuilder<TemplateFileCreator> get templates => _$this._templates ??= ListBuilder<TemplateFileCreator>();
  set templates(covariant ListBuilder<TemplateFileCreator>? templates) => _$this._templates = templates;

  TemplatePathResponseApplicationJson_Ocs_DataBuilder();

  TemplatePathResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _templatePath = $v.templatePath;
      _templates = $v.templates.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplatePathResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplatePathResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TemplatePathResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplatePathResponseApplicationJson_Ocs_Data build() => _build();

  _$TemplatePathResponseApplicationJson_Ocs_Data _build() {
    _$TemplatePathResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$TemplatePathResponseApplicationJson_Ocs_Data._(
              templatePath: BuiltValueNullFieldError.checkNotNull(
                  templatePath, r'TemplatePathResponseApplicationJson_Ocs_Data', 'templatePath'),
              templates: templates.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'templates';
        templates.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplatePathResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplatePathResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TemplatePathResponseApplicationJson_OcsInterface other);
  void update(void Function(TemplatePathResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TemplatePathResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TemplatePathResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TemplatePathResponseApplicationJson_Ocs extends TemplatePathResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TemplatePathResponseApplicationJson_Ocs_Data data;

  factory _$TemplatePathResponseApplicationJson_Ocs(
          [void Function(TemplatePathResponseApplicationJson_OcsBuilder)? updates]) =>
      (TemplatePathResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TemplatePathResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TemplatePathResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TemplatePathResponseApplicationJson_Ocs', 'data');
  }

  @override
  TemplatePathResponseApplicationJson_Ocs rebuild(
          void Function(TemplatePathResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplatePathResponseApplicationJson_OcsBuilder toBuilder() =>
      TemplatePathResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplatePathResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TemplatePathResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TemplatePathResponseApplicationJson_OcsBuilder
    implements
        Builder<TemplatePathResponseApplicationJson_Ocs, TemplatePathResponseApplicationJson_OcsBuilder>,
        TemplatePathResponseApplicationJson_OcsInterfaceBuilder {
  _$TemplatePathResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TemplatePathResponseApplicationJson_Ocs_DataBuilder? _data;
  TemplatePathResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TemplatePathResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TemplatePathResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TemplatePathResponseApplicationJson_OcsBuilder();

  TemplatePathResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplatePathResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplatePathResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TemplatePathResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplatePathResponseApplicationJson_Ocs build() => _build();

  _$TemplatePathResponseApplicationJson_Ocs _build() {
    _$TemplatePathResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TemplatePathResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplatePathResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TemplatePathResponseApplicationJsonInterfaceBuilder {
  void replace(TemplatePathResponseApplicationJsonInterface other);
  void update(void Function(TemplatePathResponseApplicationJsonInterfaceBuilder) updates);
  TemplatePathResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TemplatePathResponseApplicationJson_OcsBuilder? ocs);
}

class _$TemplatePathResponseApplicationJson extends TemplatePathResponseApplicationJson {
  @override
  final TemplatePathResponseApplicationJson_Ocs ocs;

  factory _$TemplatePathResponseApplicationJson([void Function(TemplatePathResponseApplicationJsonBuilder)? updates]) =>
      (TemplatePathResponseApplicationJsonBuilder()..update(updates))._build();

  _$TemplatePathResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TemplatePathResponseApplicationJson', 'ocs');
  }

  @override
  TemplatePathResponseApplicationJson rebuild(void Function(TemplatePathResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TemplatePathResponseApplicationJsonBuilder toBuilder() => TemplatePathResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TemplatePathResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TemplatePathResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TemplatePathResponseApplicationJsonBuilder
    implements
        Builder<TemplatePathResponseApplicationJson, TemplatePathResponseApplicationJsonBuilder>,
        TemplatePathResponseApplicationJsonInterfaceBuilder {
  _$TemplatePathResponseApplicationJson? _$v;

  TemplatePathResponseApplicationJson_OcsBuilder? _ocs;
  TemplatePathResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TemplatePathResponseApplicationJson_OcsBuilder();
  set ocs(covariant TemplatePathResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TemplatePathResponseApplicationJsonBuilder();

  TemplatePathResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TemplatePathResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TemplatePathResponseApplicationJson;
  }

  @override
  void update(void Function(TemplatePathResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TemplatePathResponseApplicationJson build() => _build();

  _$TemplatePathResponseApplicationJson _build() {
    _$TemplatePathResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TemplatePathResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TemplatePathResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TransferOwnershipTransferResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TransferOwnershipTransferResponseApplicationJson_OcsInterface other);
  void update(void Function(TransferOwnershipTransferResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$TransferOwnershipTransferResponseApplicationJson_Ocs
    extends TransferOwnershipTransferResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$TransferOwnershipTransferResponseApplicationJson_Ocs(
          [void Function(TransferOwnershipTransferResponseApplicationJson_OcsBuilder)? updates]) =>
      (TransferOwnershipTransferResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TransferOwnershipTransferResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TransferOwnershipTransferResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TransferOwnershipTransferResponseApplicationJson_Ocs', 'data');
  }

  @override
  TransferOwnershipTransferResponseApplicationJson_Ocs rebuild(
          void Function(TransferOwnershipTransferResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOwnershipTransferResponseApplicationJson_OcsBuilder toBuilder() =>
      TransferOwnershipTransferResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOwnershipTransferResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TransferOwnershipTransferResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TransferOwnershipTransferResponseApplicationJson_OcsBuilder
    implements
        Builder<TransferOwnershipTransferResponseApplicationJson_Ocs,
            TransferOwnershipTransferResponseApplicationJson_OcsBuilder>,
        TransferOwnershipTransferResponseApplicationJson_OcsInterfaceBuilder {
  _$TransferOwnershipTransferResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  TransferOwnershipTransferResponseApplicationJson_OcsBuilder();

  TransferOwnershipTransferResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TransferOwnershipTransferResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOwnershipTransferResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TransferOwnershipTransferResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOwnershipTransferResponseApplicationJson_Ocs build() => _build();

  _$TransferOwnershipTransferResponseApplicationJson_Ocs _build() {
    _$TransferOwnershipTransferResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$TransferOwnershipTransferResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'TransferOwnershipTransferResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TransferOwnershipTransferResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TransferOwnershipTransferResponseApplicationJsonInterfaceBuilder {
  void replace(TransferOwnershipTransferResponseApplicationJsonInterface other);
  void update(void Function(TransferOwnershipTransferResponseApplicationJsonInterfaceBuilder) updates);
  TransferOwnershipTransferResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TransferOwnershipTransferResponseApplicationJson_OcsBuilder? ocs);
}

class _$TransferOwnershipTransferResponseApplicationJson extends TransferOwnershipTransferResponseApplicationJson {
  @override
  final TransferOwnershipTransferResponseApplicationJson_Ocs ocs;

  factory _$TransferOwnershipTransferResponseApplicationJson(
          [void Function(TransferOwnershipTransferResponseApplicationJsonBuilder)? updates]) =>
      (TransferOwnershipTransferResponseApplicationJsonBuilder()..update(updates))._build();

  _$TransferOwnershipTransferResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TransferOwnershipTransferResponseApplicationJson', 'ocs');
  }

  @override
  TransferOwnershipTransferResponseApplicationJson rebuild(
          void Function(TransferOwnershipTransferResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOwnershipTransferResponseApplicationJsonBuilder toBuilder() =>
      TransferOwnershipTransferResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOwnershipTransferResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TransferOwnershipTransferResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TransferOwnershipTransferResponseApplicationJsonBuilder
    implements
        Builder<TransferOwnershipTransferResponseApplicationJson,
            TransferOwnershipTransferResponseApplicationJsonBuilder>,
        TransferOwnershipTransferResponseApplicationJsonInterfaceBuilder {
  _$TransferOwnershipTransferResponseApplicationJson? _$v;

  TransferOwnershipTransferResponseApplicationJson_OcsBuilder? _ocs;
  TransferOwnershipTransferResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TransferOwnershipTransferResponseApplicationJson_OcsBuilder();
  set ocs(covariant TransferOwnershipTransferResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TransferOwnershipTransferResponseApplicationJsonBuilder();

  TransferOwnershipTransferResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TransferOwnershipTransferResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOwnershipTransferResponseApplicationJson;
  }

  @override
  void update(void Function(TransferOwnershipTransferResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOwnershipTransferResponseApplicationJson build() => _build();

  _$TransferOwnershipTransferResponseApplicationJson _build() {
    _$TransferOwnershipTransferResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TransferOwnershipTransferResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TransferOwnershipTransferResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TransferOwnershipAcceptResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TransferOwnershipAcceptResponseApplicationJson_OcsInterface other);
  void update(void Function(TransferOwnershipAcceptResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$TransferOwnershipAcceptResponseApplicationJson_Ocs extends TransferOwnershipAcceptResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$TransferOwnershipAcceptResponseApplicationJson_Ocs(
          [void Function(TransferOwnershipAcceptResponseApplicationJson_OcsBuilder)? updates]) =>
      (TransferOwnershipAcceptResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TransferOwnershipAcceptResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TransferOwnershipAcceptResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TransferOwnershipAcceptResponseApplicationJson_Ocs', 'data');
  }

  @override
  TransferOwnershipAcceptResponseApplicationJson_Ocs rebuild(
          void Function(TransferOwnershipAcceptResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOwnershipAcceptResponseApplicationJson_OcsBuilder toBuilder() =>
      TransferOwnershipAcceptResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOwnershipAcceptResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TransferOwnershipAcceptResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TransferOwnershipAcceptResponseApplicationJson_OcsBuilder
    implements
        Builder<TransferOwnershipAcceptResponseApplicationJson_Ocs,
            TransferOwnershipAcceptResponseApplicationJson_OcsBuilder>,
        TransferOwnershipAcceptResponseApplicationJson_OcsInterfaceBuilder {
  _$TransferOwnershipAcceptResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  TransferOwnershipAcceptResponseApplicationJson_OcsBuilder();

  TransferOwnershipAcceptResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TransferOwnershipAcceptResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOwnershipAcceptResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TransferOwnershipAcceptResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOwnershipAcceptResponseApplicationJson_Ocs build() => _build();

  _$TransferOwnershipAcceptResponseApplicationJson_Ocs _build() {
    _$TransferOwnershipAcceptResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$TransferOwnershipAcceptResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'TransferOwnershipAcceptResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TransferOwnershipAcceptResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TransferOwnershipAcceptResponseApplicationJsonInterfaceBuilder {
  void replace(TransferOwnershipAcceptResponseApplicationJsonInterface other);
  void update(void Function(TransferOwnershipAcceptResponseApplicationJsonInterfaceBuilder) updates);
  TransferOwnershipAcceptResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TransferOwnershipAcceptResponseApplicationJson_OcsBuilder? ocs);
}

class _$TransferOwnershipAcceptResponseApplicationJson extends TransferOwnershipAcceptResponseApplicationJson {
  @override
  final TransferOwnershipAcceptResponseApplicationJson_Ocs ocs;

  factory _$TransferOwnershipAcceptResponseApplicationJson(
          [void Function(TransferOwnershipAcceptResponseApplicationJsonBuilder)? updates]) =>
      (TransferOwnershipAcceptResponseApplicationJsonBuilder()..update(updates))._build();

  _$TransferOwnershipAcceptResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TransferOwnershipAcceptResponseApplicationJson', 'ocs');
  }

  @override
  TransferOwnershipAcceptResponseApplicationJson rebuild(
          void Function(TransferOwnershipAcceptResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOwnershipAcceptResponseApplicationJsonBuilder toBuilder() =>
      TransferOwnershipAcceptResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOwnershipAcceptResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TransferOwnershipAcceptResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TransferOwnershipAcceptResponseApplicationJsonBuilder
    implements
        Builder<TransferOwnershipAcceptResponseApplicationJson, TransferOwnershipAcceptResponseApplicationJsonBuilder>,
        TransferOwnershipAcceptResponseApplicationJsonInterfaceBuilder {
  _$TransferOwnershipAcceptResponseApplicationJson? _$v;

  TransferOwnershipAcceptResponseApplicationJson_OcsBuilder? _ocs;
  TransferOwnershipAcceptResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TransferOwnershipAcceptResponseApplicationJson_OcsBuilder();
  set ocs(covariant TransferOwnershipAcceptResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TransferOwnershipAcceptResponseApplicationJsonBuilder();

  TransferOwnershipAcceptResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TransferOwnershipAcceptResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOwnershipAcceptResponseApplicationJson;
  }

  @override
  void update(void Function(TransferOwnershipAcceptResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOwnershipAcceptResponseApplicationJson build() => _build();

  _$TransferOwnershipAcceptResponseApplicationJson _build() {
    _$TransferOwnershipAcceptResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TransferOwnershipAcceptResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TransferOwnershipAcceptResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TransferOwnershipRejectResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TransferOwnershipRejectResponseApplicationJson_OcsInterface other);
  void update(void Function(TransferOwnershipRejectResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$TransferOwnershipRejectResponseApplicationJson_Ocs extends TransferOwnershipRejectResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$TransferOwnershipRejectResponseApplicationJson_Ocs(
          [void Function(TransferOwnershipRejectResponseApplicationJson_OcsBuilder)? updates]) =>
      (TransferOwnershipRejectResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TransferOwnershipRejectResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TransferOwnershipRejectResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TransferOwnershipRejectResponseApplicationJson_Ocs', 'data');
  }

  @override
  TransferOwnershipRejectResponseApplicationJson_Ocs rebuild(
          void Function(TransferOwnershipRejectResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOwnershipRejectResponseApplicationJson_OcsBuilder toBuilder() =>
      TransferOwnershipRejectResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOwnershipRejectResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TransferOwnershipRejectResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TransferOwnershipRejectResponseApplicationJson_OcsBuilder
    implements
        Builder<TransferOwnershipRejectResponseApplicationJson_Ocs,
            TransferOwnershipRejectResponseApplicationJson_OcsBuilder>,
        TransferOwnershipRejectResponseApplicationJson_OcsInterfaceBuilder {
  _$TransferOwnershipRejectResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  TransferOwnershipRejectResponseApplicationJson_OcsBuilder();

  TransferOwnershipRejectResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TransferOwnershipRejectResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOwnershipRejectResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TransferOwnershipRejectResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOwnershipRejectResponseApplicationJson_Ocs build() => _build();

  _$TransferOwnershipRejectResponseApplicationJson_Ocs _build() {
    _$TransferOwnershipRejectResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$TransferOwnershipRejectResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'TransferOwnershipRejectResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TransferOwnershipRejectResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TransferOwnershipRejectResponseApplicationJsonInterfaceBuilder {
  void replace(TransferOwnershipRejectResponseApplicationJsonInterface other);
  void update(void Function(TransferOwnershipRejectResponseApplicationJsonInterfaceBuilder) updates);
  TransferOwnershipRejectResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TransferOwnershipRejectResponseApplicationJson_OcsBuilder? ocs);
}

class _$TransferOwnershipRejectResponseApplicationJson extends TransferOwnershipRejectResponseApplicationJson {
  @override
  final TransferOwnershipRejectResponseApplicationJson_Ocs ocs;

  factory _$TransferOwnershipRejectResponseApplicationJson(
          [void Function(TransferOwnershipRejectResponseApplicationJsonBuilder)? updates]) =>
      (TransferOwnershipRejectResponseApplicationJsonBuilder()..update(updates))._build();

  _$TransferOwnershipRejectResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TransferOwnershipRejectResponseApplicationJson', 'ocs');
  }

  @override
  TransferOwnershipRejectResponseApplicationJson rebuild(
          void Function(TransferOwnershipRejectResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOwnershipRejectResponseApplicationJsonBuilder toBuilder() =>
      TransferOwnershipRejectResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOwnershipRejectResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TransferOwnershipRejectResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TransferOwnershipRejectResponseApplicationJsonBuilder
    implements
        Builder<TransferOwnershipRejectResponseApplicationJson, TransferOwnershipRejectResponseApplicationJsonBuilder>,
        TransferOwnershipRejectResponseApplicationJsonInterfaceBuilder {
  _$TransferOwnershipRejectResponseApplicationJson? _$v;

  TransferOwnershipRejectResponseApplicationJson_OcsBuilder? _ocs;
  TransferOwnershipRejectResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TransferOwnershipRejectResponseApplicationJson_OcsBuilder();
  set ocs(covariant TransferOwnershipRejectResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TransferOwnershipRejectResponseApplicationJsonBuilder();

  TransferOwnershipRejectResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TransferOwnershipRejectResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOwnershipRejectResponseApplicationJson;
  }

  @override
  void update(void Function(TransferOwnershipRejectResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOwnershipRejectResponseApplicationJson build() => _build();

  _$TransferOwnershipRejectResponseApplicationJson _build() {
    _$TransferOwnershipRejectResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TransferOwnershipRejectResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TransferOwnershipRejectResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class Capabilities_Files_DirectEditingInterfaceBuilder {
  void replace(Capabilities_Files_DirectEditingInterface other);
  void update(void Function(Capabilities_Files_DirectEditingInterfaceBuilder) updates);
  String? get url;
  set url(String? url);

  String? get etag;
  set etag(String? etag);

  bool? get supportsFileId;
  set supportsFileId(bool? supportsFileId);
}

class _$Capabilities_Files_DirectEditing extends Capabilities_Files_DirectEditing {
  @override
  final String url;
  @override
  final String etag;
  @override
  final bool supportsFileId;

  factory _$Capabilities_Files_DirectEditing([void Function(Capabilities_Files_DirectEditingBuilder)? updates]) =>
      (Capabilities_Files_DirectEditingBuilder()..update(updates))._build();

  _$Capabilities_Files_DirectEditing._({required this.url, required this.etag, required this.supportsFileId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'Capabilities_Files_DirectEditing', 'url');
    BuiltValueNullFieldError.checkNotNull(etag, r'Capabilities_Files_DirectEditing', 'etag');
    BuiltValueNullFieldError.checkNotNull(supportsFileId, r'Capabilities_Files_DirectEditing', 'supportsFileId');
  }

  @override
  Capabilities_Files_DirectEditing rebuild(void Function(Capabilities_Files_DirectEditingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_Files_DirectEditingBuilder toBuilder() => Capabilities_Files_DirectEditingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_Files_DirectEditing &&
        url == other.url &&
        etag == other.etag &&
        supportsFileId == other.supportsFileId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, etag.hashCode);
    _$hash = $jc(_$hash, supportsFileId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_Files_DirectEditing')
          ..add('url', url)
          ..add('etag', etag)
          ..add('supportsFileId', supportsFileId))
        .toString();
  }
}

class Capabilities_Files_DirectEditingBuilder
    implements
        Builder<Capabilities_Files_DirectEditing, Capabilities_Files_DirectEditingBuilder>,
        Capabilities_Files_DirectEditingInterfaceBuilder {
  _$Capabilities_Files_DirectEditing? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(covariant String? etag) => _$this._etag = etag;

  bool? _supportsFileId;
  bool? get supportsFileId => _$this._supportsFileId;
  set supportsFileId(covariant bool? supportsFileId) => _$this._supportsFileId = supportsFileId;

  Capabilities_Files_DirectEditingBuilder();

  Capabilities_Files_DirectEditingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _etag = $v.etag;
      _supportsFileId = $v.supportsFileId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_Files_DirectEditing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_Files_DirectEditing;
  }

  @override
  void update(void Function(Capabilities_Files_DirectEditingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_Files_DirectEditing build() => _build();

  _$Capabilities_Files_DirectEditing _build() {
    final _$result = _$v ??
        _$Capabilities_Files_DirectEditing._(
            url: BuiltValueNullFieldError.checkNotNull(url, r'Capabilities_Files_DirectEditing', 'url'),
            etag: BuiltValueNullFieldError.checkNotNull(etag, r'Capabilities_Files_DirectEditing', 'etag'),
            supportsFileId: BuiltValueNullFieldError.checkNotNull(
                supportsFileId, r'Capabilities_Files_DirectEditing', 'supportsFileId'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class Capabilities_FilesInterfaceBuilder {
  void replace(Capabilities_FilesInterface other);
  void update(void Function(Capabilities_FilesInterfaceBuilder) updates);
  bool? get bigfilechunking;
  set bigfilechunking(bool? bigfilechunking);

  ListBuilder<JsonObject> get blacklistedFiles;
  set blacklistedFiles(ListBuilder<JsonObject>? blacklistedFiles);

  Capabilities_Files_DirectEditingBuilder get directEditing;
  set directEditing(Capabilities_Files_DirectEditingBuilder? directEditing);
}

class _$Capabilities_Files extends Capabilities_Files {
  @override
  final bool bigfilechunking;
  @override
  final BuiltList<JsonObject> blacklistedFiles;
  @override
  final Capabilities_Files_DirectEditing directEditing;

  factory _$Capabilities_Files([void Function(Capabilities_FilesBuilder)? updates]) =>
      (Capabilities_FilesBuilder()..update(updates))._build();

  _$Capabilities_Files._({required this.bigfilechunking, required this.blacklistedFiles, required this.directEditing})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(bigfilechunking, r'Capabilities_Files', 'bigfilechunking');
    BuiltValueNullFieldError.checkNotNull(blacklistedFiles, r'Capabilities_Files', 'blacklistedFiles');
    BuiltValueNullFieldError.checkNotNull(directEditing, r'Capabilities_Files', 'directEditing');
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
        bigfilechunking == other.bigfilechunking &&
        blacklistedFiles == other.blacklistedFiles &&
        directEditing == other.directEditing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bigfilechunking.hashCode);
    _$hash = $jc(_$hash, blacklistedFiles.hashCode);
    _$hash = $jc(_$hash, directEditing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_Files')
          ..add('bigfilechunking', bigfilechunking)
          ..add('blacklistedFiles', blacklistedFiles)
          ..add('directEditing', directEditing))
        .toString();
  }
}

class Capabilities_FilesBuilder
    implements Builder<Capabilities_Files, Capabilities_FilesBuilder>, Capabilities_FilesInterfaceBuilder {
  _$Capabilities_Files? _$v;

  bool? _bigfilechunking;
  bool? get bigfilechunking => _$this._bigfilechunking;
  set bigfilechunking(covariant bool? bigfilechunking) => _$this._bigfilechunking = bigfilechunking;

  ListBuilder<JsonObject>? _blacklistedFiles;
  ListBuilder<JsonObject> get blacklistedFiles => _$this._blacklistedFiles ??= ListBuilder<JsonObject>();
  set blacklistedFiles(covariant ListBuilder<JsonObject>? blacklistedFiles) =>
      _$this._blacklistedFiles = blacklistedFiles;

  Capabilities_Files_DirectEditingBuilder? _directEditing;
  Capabilities_Files_DirectEditingBuilder get directEditing =>
      _$this._directEditing ??= Capabilities_Files_DirectEditingBuilder();
  set directEditing(covariant Capabilities_Files_DirectEditingBuilder? directEditing) =>
      _$this._directEditing = directEditing;

  Capabilities_FilesBuilder();

  Capabilities_FilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bigfilechunking = $v.bigfilechunking;
      _blacklistedFiles = $v.blacklistedFiles.toBuilder();
      _directEditing = $v.directEditing.toBuilder();
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
    _$Capabilities_Files _$result;
    try {
      _$result = _$v ??
          _$Capabilities_Files._(
              bigfilechunking:
                  BuiltValueNullFieldError.checkNotNull(bigfilechunking, r'Capabilities_Files', 'bigfilechunking'),
              blacklistedFiles: blacklistedFiles.build(),
              directEditing: directEditing.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blacklistedFiles';
        blacklistedFiles.build();
        _$failedField = 'directEditing';
        directEditing.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Capabilities_Files', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CapabilitiesInterfaceBuilder {
  void replace(CapabilitiesInterface other);
  void update(void Function(CapabilitiesInterfaceBuilder) updates);
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

class CapabilitiesBuilder implements Builder<Capabilities, CapabilitiesBuilder>, CapabilitiesInterfaceBuilder {
  _$Capabilities? _$v;

  Capabilities_FilesBuilder? _files;
  Capabilities_FilesBuilder get files => _$this._files ??= Capabilities_FilesBuilder();
  set files(covariant Capabilities_FilesBuilder? files) => _$this._files = files;

  CapabilitiesBuilder();

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

abstract mixin class TemplateInterfaceBuilder {
  void replace(TemplateInterface other);
  void update(void Function(TemplateInterfaceBuilder) updates);
  String? get templateType;
  set templateType(String? templateType);

  String? get templateId;
  set templateId(String? templateId);

  String? get basename;
  set basename(String? basename);

  String? get etag;
  set etag(String? etag);

  int? get fileid;
  set fileid(int? fileid);

  String? get filename;
  set filename(String? filename);

  int? get lastmod;
  set lastmod(int? lastmod);

  String? get mime;
  set mime(String? mime);

  int? get size;
  set size(int? size);

  String? get type;
  set type(String? type);

  bool? get hasPreview;
  set hasPreview(bool? hasPreview);

  String? get previewUrl;
  set previewUrl(String? previewUrl);
}

class _$Template extends Template {
  @override
  final String templateType;
  @override
  final String templateId;
  @override
  final String basename;
  @override
  final String etag;
  @override
  final int fileid;
  @override
  final String filename;
  @override
  final int lastmod;
  @override
  final String mime;
  @override
  final int size;
  @override
  final String type;
  @override
  final bool hasPreview;
  @override
  final String? previewUrl;

  factory _$Template([void Function(TemplateBuilder)? updates]) => (TemplateBuilder()..update(updates))._build();

  _$Template._(
      {required this.templateType,
      required this.templateId,
      required this.basename,
      required this.etag,
      required this.fileid,
      required this.filename,
      required this.lastmod,
      required this.mime,
      required this.size,
      required this.type,
      required this.hasPreview,
      this.previewUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(templateType, r'Template', 'templateType');
    BuiltValueNullFieldError.checkNotNull(templateId, r'Template', 'templateId');
    BuiltValueNullFieldError.checkNotNull(basename, r'Template', 'basename');
    BuiltValueNullFieldError.checkNotNull(etag, r'Template', 'etag');
    BuiltValueNullFieldError.checkNotNull(fileid, r'Template', 'fileid');
    BuiltValueNullFieldError.checkNotNull(filename, r'Template', 'filename');
    BuiltValueNullFieldError.checkNotNull(lastmod, r'Template', 'lastmod');
    BuiltValueNullFieldError.checkNotNull(mime, r'Template', 'mime');
    BuiltValueNullFieldError.checkNotNull(size, r'Template', 'size');
    BuiltValueNullFieldError.checkNotNull(type, r'Template', 'type');
    BuiltValueNullFieldError.checkNotNull(hasPreview, r'Template', 'hasPreview');
  }

  @override
  Template rebuild(void Function(TemplateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  TemplateBuilder toBuilder() => TemplateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Template &&
        templateType == other.templateType &&
        templateId == other.templateId &&
        basename == other.basename &&
        etag == other.etag &&
        fileid == other.fileid &&
        filename == other.filename &&
        lastmod == other.lastmod &&
        mime == other.mime &&
        size == other.size &&
        type == other.type &&
        hasPreview == other.hasPreview &&
        previewUrl == other.previewUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, templateType.hashCode);
    _$hash = $jc(_$hash, templateId.hashCode);
    _$hash = $jc(_$hash, basename.hashCode);
    _$hash = $jc(_$hash, etag.hashCode);
    _$hash = $jc(_$hash, fileid.hashCode);
    _$hash = $jc(_$hash, filename.hashCode);
    _$hash = $jc(_$hash, lastmod.hashCode);
    _$hash = $jc(_$hash, mime.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, hasPreview.hashCode);
    _$hash = $jc(_$hash, previewUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Template')
          ..add('templateType', templateType)
          ..add('templateId', templateId)
          ..add('basename', basename)
          ..add('etag', etag)
          ..add('fileid', fileid)
          ..add('filename', filename)
          ..add('lastmod', lastmod)
          ..add('mime', mime)
          ..add('size', size)
          ..add('type', type)
          ..add('hasPreview', hasPreview)
          ..add('previewUrl', previewUrl))
        .toString();
  }
}

class TemplateBuilder implements Builder<Template, TemplateBuilder>, TemplateInterfaceBuilder {
  _$Template? _$v;

  String? _templateType;
  String? get templateType => _$this._templateType;
  set templateType(covariant String? templateType) => _$this._templateType = templateType;

  String? _templateId;
  String? get templateId => _$this._templateId;
  set templateId(covariant String? templateId) => _$this._templateId = templateId;

  String? _basename;
  String? get basename => _$this._basename;
  set basename(covariant String? basename) => _$this._basename = basename;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(covariant String? etag) => _$this._etag = etag;

  int? _fileid;
  int? get fileid => _$this._fileid;
  set fileid(covariant int? fileid) => _$this._fileid = fileid;

  String? _filename;
  String? get filename => _$this._filename;
  set filename(covariant String? filename) => _$this._filename = filename;

  int? _lastmod;
  int? get lastmod => _$this._lastmod;
  set lastmod(covariant int? lastmod) => _$this._lastmod = lastmod;

  String? _mime;
  String? get mime => _$this._mime;
  set mime(covariant String? mime) => _$this._mime = mime;

  int? _size;
  int? get size => _$this._size;
  set size(covariant int? size) => _$this._size = size;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  bool? _hasPreview;
  bool? get hasPreview => _$this._hasPreview;
  set hasPreview(covariant bool? hasPreview) => _$this._hasPreview = hasPreview;

  String? _previewUrl;
  String? get previewUrl => _$this._previewUrl;
  set previewUrl(covariant String? previewUrl) => _$this._previewUrl = previewUrl;

  TemplateBuilder();

  TemplateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _templateType = $v.templateType;
      _templateId = $v.templateId;
      _basename = $v.basename;
      _etag = $v.etag;
      _fileid = $v.fileid;
      _filename = $v.filename;
      _lastmod = $v.lastmod;
      _mime = $v.mime;
      _size = $v.size;
      _type = $v.type;
      _hasPreview = $v.hasPreview;
      _previewUrl = $v.previewUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Template other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Template;
  }

  @override
  void update(void Function(TemplateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Template build() => _build();

  _$Template _build() {
    final _$result = _$v ??
        _$Template._(
            templateType: BuiltValueNullFieldError.checkNotNull(templateType, r'Template', 'templateType'),
            templateId: BuiltValueNullFieldError.checkNotNull(templateId, r'Template', 'templateId'),
            basename: BuiltValueNullFieldError.checkNotNull(basename, r'Template', 'basename'),
            etag: BuiltValueNullFieldError.checkNotNull(etag, r'Template', 'etag'),
            fileid: BuiltValueNullFieldError.checkNotNull(fileid, r'Template', 'fileid'),
            filename: BuiltValueNullFieldError.checkNotNull(filename, r'Template', 'filename'),
            lastmod: BuiltValueNullFieldError.checkNotNull(lastmod, r'Template', 'lastmod'),
            mime: BuiltValueNullFieldError.checkNotNull(mime, r'Template', 'mime'),
            size: BuiltValueNullFieldError.checkNotNull(size, r'Template', 'size'),
            type: BuiltValueNullFieldError.checkNotNull(type, r'Template', 'type'),
            hasPreview: BuiltValueNullFieldError.checkNotNull(hasPreview, r'Template', 'hasPreview'),
            previewUrl: previewUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
