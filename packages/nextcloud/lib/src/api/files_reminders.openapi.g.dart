// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_reminders.openapi.dart';

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

abstract mixin class ApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(ApiGetResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(ApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get dueDate;
  set dueDate(String? dueDate);
}

class _$ApiGetResponseApplicationJson_Ocs_Data extends ApiGetResponseApplicationJson_Ocs_Data {
  @override
  final String? dueDate;

  factory _$ApiGetResponseApplicationJson_Ocs_Data(
          [void Function(ApiGetResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ApiGetResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ApiGetResponseApplicationJson_Ocs_Data._({this.dueDate}) : super._();

  @override
  ApiGetResponseApplicationJson_Ocs_Data rebuild(
          void Function(ApiGetResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ApiGetResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetResponseApplicationJson_Ocs_Data && dueDate == other.dueDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dueDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiGetResponseApplicationJson_Ocs_Data')..add('dueDate', dueDate)).toString();
  }
}

class ApiGetResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ApiGetResponseApplicationJson_Ocs_Data, ApiGetResponseApplicationJson_Ocs_DataBuilder>,
        ApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ApiGetResponseApplicationJson_Ocs_Data? _$v;

  String? _dueDate;
  String? get dueDate => _$this._dueDate;
  set dueDate(covariant String? dueDate) => _$this._dueDate = dueDate;

  ApiGetResponseApplicationJson_Ocs_DataBuilder();

  ApiGetResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dueDate = $v.dueDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ApiGetResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetResponseApplicationJson_Ocs_Data build() => _build();

  _$ApiGetResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ?? _$ApiGetResponseApplicationJson_Ocs_Data._(dueDate: dueDate);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ApiGetResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ApiGetResponseApplicationJson_OcsInterface other);
  void update(void Function(ApiGetResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ApiGetResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ApiGetResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ApiGetResponseApplicationJson_Ocs extends ApiGetResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ApiGetResponseApplicationJson_Ocs_Data data;

  factory _$ApiGetResponseApplicationJson_Ocs([void Function(ApiGetResponseApplicationJson_OcsBuilder)? updates]) =>
      (ApiGetResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ApiGetResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ApiGetResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ApiGetResponseApplicationJson_Ocs', 'data');
  }

  @override
  ApiGetResponseApplicationJson_Ocs rebuild(void Function(ApiGetResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetResponseApplicationJson_OcsBuilder toBuilder() => ApiGetResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ApiGetResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ApiGetResponseApplicationJson_OcsBuilder
    implements
        Builder<ApiGetResponseApplicationJson_Ocs, ApiGetResponseApplicationJson_OcsBuilder>,
        ApiGetResponseApplicationJson_OcsInterfaceBuilder {
  _$ApiGetResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ApiGetResponseApplicationJson_Ocs_DataBuilder? _data;
  ApiGetResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ApiGetResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ApiGetResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ApiGetResponseApplicationJson_OcsBuilder();

  ApiGetResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ApiGetResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetResponseApplicationJson_Ocs build() => _build();

  _$ApiGetResponseApplicationJson_Ocs _build() {
    _$ApiGetResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ApiGetResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiGetResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ApiGetResponseApplicationJsonInterfaceBuilder {
  void replace(ApiGetResponseApplicationJsonInterface other);
  void update(void Function(ApiGetResponseApplicationJsonInterfaceBuilder) updates);
  ApiGetResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ApiGetResponseApplicationJson_OcsBuilder? ocs);
}

class _$ApiGetResponseApplicationJson extends ApiGetResponseApplicationJson {
  @override
  final ApiGetResponseApplicationJson_Ocs ocs;

  factory _$ApiGetResponseApplicationJson([void Function(ApiGetResponseApplicationJsonBuilder)? updates]) =>
      (ApiGetResponseApplicationJsonBuilder()..update(updates))._build();

  _$ApiGetResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ApiGetResponseApplicationJson', 'ocs');
  }

  @override
  ApiGetResponseApplicationJson rebuild(void Function(ApiGetResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetResponseApplicationJsonBuilder toBuilder() => ApiGetResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ApiGetResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ApiGetResponseApplicationJsonBuilder
    implements
        Builder<ApiGetResponseApplicationJson, ApiGetResponseApplicationJsonBuilder>,
        ApiGetResponseApplicationJsonInterfaceBuilder {
  _$ApiGetResponseApplicationJson? _$v;

  ApiGetResponseApplicationJson_OcsBuilder? _ocs;
  ApiGetResponseApplicationJson_OcsBuilder get ocs => _$this._ocs ??= ApiGetResponseApplicationJson_OcsBuilder();
  set ocs(covariant ApiGetResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ApiGetResponseApplicationJsonBuilder();

  ApiGetResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetResponseApplicationJson;
  }

  @override
  void update(void Function(ApiGetResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetResponseApplicationJson build() => _build();

  _$ApiGetResponseApplicationJson _build() {
    _$ApiGetResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ApiGetResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiGetResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ApiSetResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ApiSetResponseApplicationJson_OcsInterface other);
  void update(void Function(ApiSetResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$ApiSetResponseApplicationJson_Ocs extends ApiSetResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$ApiSetResponseApplicationJson_Ocs([void Function(ApiSetResponseApplicationJson_OcsBuilder)? updates]) =>
      (ApiSetResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ApiSetResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ApiSetResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ApiSetResponseApplicationJson_Ocs', 'data');
  }

  @override
  ApiSetResponseApplicationJson_Ocs rebuild(void Function(ApiSetResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiSetResponseApplicationJson_OcsBuilder toBuilder() => ApiSetResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiSetResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ApiSetResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ApiSetResponseApplicationJson_OcsBuilder
    implements
        Builder<ApiSetResponseApplicationJson_Ocs, ApiSetResponseApplicationJson_OcsBuilder>,
        ApiSetResponseApplicationJson_OcsInterfaceBuilder {
  _$ApiSetResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ApiSetResponseApplicationJson_OcsBuilder();

  ApiSetResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiSetResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiSetResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ApiSetResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiSetResponseApplicationJson_Ocs build() => _build();

  _$ApiSetResponseApplicationJson_Ocs _build() {
    _$ApiSetResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ApiSetResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(data, r'ApiSetResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiSetResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ApiSetResponseApplicationJsonInterfaceBuilder {
  void replace(ApiSetResponseApplicationJsonInterface other);
  void update(void Function(ApiSetResponseApplicationJsonInterfaceBuilder) updates);
  ApiSetResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ApiSetResponseApplicationJson_OcsBuilder? ocs);
}

class _$ApiSetResponseApplicationJson extends ApiSetResponseApplicationJson {
  @override
  final ApiSetResponseApplicationJson_Ocs ocs;

  factory _$ApiSetResponseApplicationJson([void Function(ApiSetResponseApplicationJsonBuilder)? updates]) =>
      (ApiSetResponseApplicationJsonBuilder()..update(updates))._build();

  _$ApiSetResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ApiSetResponseApplicationJson', 'ocs');
  }

  @override
  ApiSetResponseApplicationJson rebuild(void Function(ApiSetResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiSetResponseApplicationJsonBuilder toBuilder() => ApiSetResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiSetResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ApiSetResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ApiSetResponseApplicationJsonBuilder
    implements
        Builder<ApiSetResponseApplicationJson, ApiSetResponseApplicationJsonBuilder>,
        ApiSetResponseApplicationJsonInterfaceBuilder {
  _$ApiSetResponseApplicationJson? _$v;

  ApiSetResponseApplicationJson_OcsBuilder? _ocs;
  ApiSetResponseApplicationJson_OcsBuilder get ocs => _$this._ocs ??= ApiSetResponseApplicationJson_OcsBuilder();
  set ocs(covariant ApiSetResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ApiSetResponseApplicationJsonBuilder();

  ApiSetResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiSetResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiSetResponseApplicationJson;
  }

  @override
  void update(void Function(ApiSetResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiSetResponseApplicationJson build() => _build();

  _$ApiSetResponseApplicationJson _build() {
    _$ApiSetResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ApiSetResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiSetResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ApiRemoveResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ApiRemoveResponseApplicationJson_OcsInterface other);
  void update(void Function(ApiRemoveResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$ApiRemoveResponseApplicationJson_Ocs extends ApiRemoveResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$ApiRemoveResponseApplicationJson_Ocs(
          [void Function(ApiRemoveResponseApplicationJson_OcsBuilder)? updates]) =>
      (ApiRemoveResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ApiRemoveResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ApiRemoveResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ApiRemoveResponseApplicationJson_Ocs', 'data');
  }

  @override
  ApiRemoveResponseApplicationJson_Ocs rebuild(void Function(ApiRemoveResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiRemoveResponseApplicationJson_OcsBuilder toBuilder() =>
      ApiRemoveResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiRemoveResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ApiRemoveResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ApiRemoveResponseApplicationJson_OcsBuilder
    implements
        Builder<ApiRemoveResponseApplicationJson_Ocs, ApiRemoveResponseApplicationJson_OcsBuilder>,
        ApiRemoveResponseApplicationJson_OcsInterfaceBuilder {
  _$ApiRemoveResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ApiRemoveResponseApplicationJson_OcsBuilder();

  ApiRemoveResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiRemoveResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiRemoveResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ApiRemoveResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiRemoveResponseApplicationJson_Ocs build() => _build();

  _$ApiRemoveResponseApplicationJson_Ocs _build() {
    _$ApiRemoveResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ApiRemoveResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(data, r'ApiRemoveResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiRemoveResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ApiRemoveResponseApplicationJsonInterfaceBuilder {
  void replace(ApiRemoveResponseApplicationJsonInterface other);
  void update(void Function(ApiRemoveResponseApplicationJsonInterfaceBuilder) updates);
  ApiRemoveResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ApiRemoveResponseApplicationJson_OcsBuilder? ocs);
}

class _$ApiRemoveResponseApplicationJson extends ApiRemoveResponseApplicationJson {
  @override
  final ApiRemoveResponseApplicationJson_Ocs ocs;

  factory _$ApiRemoveResponseApplicationJson([void Function(ApiRemoveResponseApplicationJsonBuilder)? updates]) =>
      (ApiRemoveResponseApplicationJsonBuilder()..update(updates))._build();

  _$ApiRemoveResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ApiRemoveResponseApplicationJson', 'ocs');
  }

  @override
  ApiRemoveResponseApplicationJson rebuild(void Function(ApiRemoveResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiRemoveResponseApplicationJsonBuilder toBuilder() => ApiRemoveResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiRemoveResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ApiRemoveResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ApiRemoveResponseApplicationJsonBuilder
    implements
        Builder<ApiRemoveResponseApplicationJson, ApiRemoveResponseApplicationJsonBuilder>,
        ApiRemoveResponseApplicationJsonInterfaceBuilder {
  _$ApiRemoveResponseApplicationJson? _$v;

  ApiRemoveResponseApplicationJson_OcsBuilder? _ocs;
  ApiRemoveResponseApplicationJson_OcsBuilder get ocs => _$this._ocs ??= ApiRemoveResponseApplicationJson_OcsBuilder();
  set ocs(covariant ApiRemoveResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ApiRemoveResponseApplicationJsonBuilder();

  ApiRemoveResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiRemoveResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiRemoveResponseApplicationJson;
  }

  @override
  void update(void Function(ApiRemoveResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiRemoveResponseApplicationJson build() => _build();

  _$ApiRemoveResponseApplicationJson _build() {
    _$ApiRemoveResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ApiRemoveResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiRemoveResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
