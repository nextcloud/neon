// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class StatusInterfaceBuilder {
  void replace(StatusInterface other);
  void update(void Function(StatusInterfaceBuilder) updates);
  bool? get installed;
  set installed(bool? installed);

  bool? get maintenance;
  set maintenance(bool? maintenance);

  bool? get needsDbUpgrade;
  set needsDbUpgrade(bool? needsDbUpgrade);

  String? get version;
  set version(String? version);

  String? get versionstring;
  set versionstring(String? versionstring);

  String? get edition;
  set edition(String? edition);

  String? get productname;
  set productname(String? productname);

  bool? get extendedSupport;
  set extendedSupport(bool? extendedSupport);
}

class _$Status extends Status {
  @override
  final bool installed;
  @override
  final bool maintenance;
  @override
  final bool needsDbUpgrade;
  @override
  final String version;
  @override
  final String versionstring;
  @override
  final String edition;
  @override
  final String productname;
  @override
  final bool extendedSupport;

  factory _$Status([void Function(StatusBuilder)? updates]) => (StatusBuilder()..update(updates))._build();

  _$Status._(
      {required this.installed,
      required this.maintenance,
      required this.needsDbUpgrade,
      required this.version,
      required this.versionstring,
      required this.edition,
      required this.productname,
      required this.extendedSupport})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(installed, r'Status', 'installed');
    BuiltValueNullFieldError.checkNotNull(maintenance, r'Status', 'maintenance');
    BuiltValueNullFieldError.checkNotNull(needsDbUpgrade, r'Status', 'needsDbUpgrade');
    BuiltValueNullFieldError.checkNotNull(version, r'Status', 'version');
    BuiltValueNullFieldError.checkNotNull(versionstring, r'Status', 'versionstring');
    BuiltValueNullFieldError.checkNotNull(edition, r'Status', 'edition');
    BuiltValueNullFieldError.checkNotNull(productname, r'Status', 'productname');
    BuiltValueNullFieldError.checkNotNull(extendedSupport, r'Status', 'extendedSupport');
  }

  @override
  Status rebuild(void Function(StatusBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  StatusBuilder toBuilder() => StatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Status &&
        installed == other.installed &&
        maintenance == other.maintenance &&
        needsDbUpgrade == other.needsDbUpgrade &&
        version == other.version &&
        versionstring == other.versionstring &&
        edition == other.edition &&
        productname == other.productname &&
        extendedSupport == other.extendedSupport;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, installed.hashCode);
    _$hash = $jc(_$hash, maintenance.hashCode);
    _$hash = $jc(_$hash, needsDbUpgrade.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, versionstring.hashCode);
    _$hash = $jc(_$hash, edition.hashCode);
    _$hash = $jc(_$hash, productname.hashCode);
    _$hash = $jc(_$hash, extendedSupport.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Status')
          ..add('installed', installed)
          ..add('maintenance', maintenance)
          ..add('needsDbUpgrade', needsDbUpgrade)
          ..add('version', version)
          ..add('versionstring', versionstring)
          ..add('edition', edition)
          ..add('productname', productname)
          ..add('extendedSupport', extendedSupport))
        .toString();
  }
}

class StatusBuilder implements Builder<Status, StatusBuilder>, StatusInterfaceBuilder {
  _$Status? _$v;

  bool? _installed;
  bool? get installed => _$this._installed;
  set installed(covariant bool? installed) => _$this._installed = installed;

  bool? _maintenance;
  bool? get maintenance => _$this._maintenance;
  set maintenance(covariant bool? maintenance) => _$this._maintenance = maintenance;

  bool? _needsDbUpgrade;
  bool? get needsDbUpgrade => _$this._needsDbUpgrade;
  set needsDbUpgrade(covariant bool? needsDbUpgrade) => _$this._needsDbUpgrade = needsDbUpgrade;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  String? _versionstring;
  String? get versionstring => _$this._versionstring;
  set versionstring(covariant String? versionstring) => _$this._versionstring = versionstring;

  String? _edition;
  String? get edition => _$this._edition;
  set edition(covariant String? edition) => _$this._edition = edition;

  String? _productname;
  String? get productname => _$this._productname;
  set productname(covariant String? productname) => _$this._productname = productname;

  bool? _extendedSupport;
  bool? get extendedSupport => _$this._extendedSupport;
  set extendedSupport(covariant bool? extendedSupport) => _$this._extendedSupport = extendedSupport;

  StatusBuilder();

  StatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _installed = $v.installed;
      _maintenance = $v.maintenance;
      _needsDbUpgrade = $v.needsDbUpgrade;
      _version = $v.version;
      _versionstring = $v.versionstring;
      _edition = $v.edition;
      _productname = $v.productname;
      _extendedSupport = $v.extendedSupport;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Status other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Status;
  }

  @override
  void update(void Function(StatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Status build() => _build();

  _$Status _build() {
    final _$result = _$v ??
        _$Status._(
            installed: BuiltValueNullFieldError.checkNotNull(installed, r'Status', 'installed'),
            maintenance: BuiltValueNullFieldError.checkNotNull(maintenance, r'Status', 'maintenance'),
            needsDbUpgrade: BuiltValueNullFieldError.checkNotNull(needsDbUpgrade, r'Status', 'needsDbUpgrade'),
            version: BuiltValueNullFieldError.checkNotNull(version, r'Status', 'version'),
            versionstring: BuiltValueNullFieldError.checkNotNull(versionstring, r'Status', 'versionstring'),
            edition: BuiltValueNullFieldError.checkNotNull(edition, r'Status', 'edition'),
            productname: BuiltValueNullFieldError.checkNotNull(productname, r'Status', 'productname'),
            extendedSupport: BuiltValueNullFieldError.checkNotNull(extendedSupport, r'Status', 'extendedSupport'));
    replace(_$result);
    return _$result;
  }
}

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

abstract mixin class AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get apppassword;
  set apppassword(String? apppassword);
}

class _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data
    extends AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data {
  @override
  final String apppassword;

  factory _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data(
          [void Function(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data._({required this.apppassword}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        apppassword, r'AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data', 'apppassword');
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data rebuild(
          void Function(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data && apppassword == other.apppassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apppassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data')
          ..add('apppassword', apppassword))
        .toString();
  }
}

class AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data,
            AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder>,
        AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data? _$v;

  String? _apppassword;
  String? get apppassword => _$this._apppassword;
  set apppassword(covariant String? apppassword) => _$this._apppassword = apppassword;

  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder();

  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apppassword = $v.apppassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data build() => _build();

  _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data._(
            apppassword: BuiltValueNullFieldError.checkNotNull(
                apppassword, r'AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data', 'apppassword'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AppPasswordGetAppPasswordResponseApplicationJson_OcsInterfaceBuilder {
  void replace(AppPasswordGetAppPasswordResponseApplicationJson_OcsInterface other);
  void update(void Function(AppPasswordGetAppPasswordResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder get data;
  set data(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs
    extends AppPasswordGetAppPasswordResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data data;

  factory _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs(
          [void Function(AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder)? updates]) =>
      (AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'AppPasswordGetAppPasswordResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'AppPasswordGetAppPasswordResponseApplicationJson_Ocs', 'data');
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs rebuild(
          void Function(AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder toBuilder() =>
      AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordGetAppPasswordResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'AppPasswordGetAppPasswordResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder
    implements
        Builder<AppPasswordGetAppPasswordResponseApplicationJson_Ocs,
            AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder>,
        AppPasswordGetAppPasswordResponseApplicationJson_OcsInterfaceBuilder {
  _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder? _data;
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder();

  AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordGetAppPasswordResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs build() => _build();

  _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs _build() {
    _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AppPasswordGetAppPasswordResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AppPasswordGetAppPasswordResponseApplicationJsonInterfaceBuilder {
  void replace(AppPasswordGetAppPasswordResponseApplicationJsonInterface other);
  void update(void Function(AppPasswordGetAppPasswordResponseApplicationJsonInterfaceBuilder) updates);
  AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder get ocs;
  set ocs(AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder? ocs);
}

class _$AppPasswordGetAppPasswordResponseApplicationJson extends AppPasswordGetAppPasswordResponseApplicationJson {
  @override
  final AppPasswordGetAppPasswordResponseApplicationJson_Ocs ocs;

  factory _$AppPasswordGetAppPasswordResponseApplicationJson(
          [void Function(AppPasswordGetAppPasswordResponseApplicationJsonBuilder)? updates]) =>
      (AppPasswordGetAppPasswordResponseApplicationJsonBuilder()..update(updates))._build();

  _$AppPasswordGetAppPasswordResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'AppPasswordGetAppPasswordResponseApplicationJson', 'ocs');
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson rebuild(
          void Function(AppPasswordGetAppPasswordResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordGetAppPasswordResponseApplicationJsonBuilder toBuilder() =>
      AppPasswordGetAppPasswordResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordGetAppPasswordResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'AppPasswordGetAppPasswordResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class AppPasswordGetAppPasswordResponseApplicationJsonBuilder
    implements
        Builder<AppPasswordGetAppPasswordResponseApplicationJson,
            AppPasswordGetAppPasswordResponseApplicationJsonBuilder>,
        AppPasswordGetAppPasswordResponseApplicationJsonInterfaceBuilder {
  _$AppPasswordGetAppPasswordResponseApplicationJson? _$v;

  AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder? _ocs;
  AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder();
  set ocs(covariant AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  AppPasswordGetAppPasswordResponseApplicationJsonBuilder();

  AppPasswordGetAppPasswordResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordGetAppPasswordResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordGetAppPasswordResponseApplicationJson;
  }

  @override
  void update(void Function(AppPasswordGetAppPasswordResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson build() => _build();

  _$AppPasswordGetAppPasswordResponseApplicationJson _build() {
    _$AppPasswordGetAppPasswordResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$AppPasswordGetAppPasswordResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AppPasswordGetAppPasswordResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get apppassword;
  set apppassword(String? apppassword);
}

class _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data
    extends AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data {
  @override
  final String apppassword;

  factory _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data(
          [void Function(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data._({required this.apppassword}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        apppassword, r'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data', 'apppassword');
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data rebuild(
          void Function(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data && apppassword == other.apppassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apppassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data')
          ..add('apppassword', apppassword))
        .toString();
  }
}

class AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data,
            AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder>,
        AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data? _$v;

  String? _apppassword;
  String? get apppassword => _$this._apppassword;
  set apppassword(covariant String? apppassword) => _$this._apppassword = apppassword;

  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder();

  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apppassword = $v.apppassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data build() => _build();

  _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data._(
            apppassword: BuiltValueNullFieldError.checkNotNull(
                apppassword, r'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data', 'apppassword'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterfaceBuilder {
  void replace(AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface other);
  void update(void Function(AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder get data;
  set data(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs
    extends AppPasswordRotateAppPasswordResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data data;

  factory _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs(
          [void Function(AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder)? updates]) =>
      (AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs', 'data');
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs rebuild(
          void Function(AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder toBuilder() =>
      AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordRotateAppPasswordResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder
    implements
        Builder<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs,
            AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder>,
        AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterfaceBuilder {
  _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder? _data;
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder();

  AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordRotateAppPasswordResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs build() => _build();

  _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs _build() {
    _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AppPasswordRotateAppPasswordResponseApplicationJsonInterfaceBuilder {
  void replace(AppPasswordRotateAppPasswordResponseApplicationJsonInterface other);
  void update(void Function(AppPasswordRotateAppPasswordResponseApplicationJsonInterfaceBuilder) updates);
  AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder get ocs;
  set ocs(AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder? ocs);
}

class _$AppPasswordRotateAppPasswordResponseApplicationJson
    extends AppPasswordRotateAppPasswordResponseApplicationJson {
  @override
  final AppPasswordRotateAppPasswordResponseApplicationJson_Ocs ocs;

  factory _$AppPasswordRotateAppPasswordResponseApplicationJson(
          [void Function(AppPasswordRotateAppPasswordResponseApplicationJsonBuilder)? updates]) =>
      (AppPasswordRotateAppPasswordResponseApplicationJsonBuilder()..update(updates))._build();

  _$AppPasswordRotateAppPasswordResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'AppPasswordRotateAppPasswordResponseApplicationJson', 'ocs');
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson rebuild(
          void Function(AppPasswordRotateAppPasswordResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordRotateAppPasswordResponseApplicationJsonBuilder toBuilder() =>
      AppPasswordRotateAppPasswordResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordRotateAppPasswordResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'AppPasswordRotateAppPasswordResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class AppPasswordRotateAppPasswordResponseApplicationJsonBuilder
    implements
        Builder<AppPasswordRotateAppPasswordResponseApplicationJson,
            AppPasswordRotateAppPasswordResponseApplicationJsonBuilder>,
        AppPasswordRotateAppPasswordResponseApplicationJsonInterfaceBuilder {
  _$AppPasswordRotateAppPasswordResponseApplicationJson? _$v;

  AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder? _ocs;
  AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder();
  set ocs(covariant AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  AppPasswordRotateAppPasswordResponseApplicationJsonBuilder();

  AppPasswordRotateAppPasswordResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordRotateAppPasswordResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordRotateAppPasswordResponseApplicationJson;
  }

  @override
  void update(void Function(AppPasswordRotateAppPasswordResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson build() => _build();

  _$AppPasswordRotateAppPasswordResponseApplicationJson _build() {
    _$AppPasswordRotateAppPasswordResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$AppPasswordRotateAppPasswordResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AppPasswordRotateAppPasswordResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterfaceBuilder {
  void replace(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface other);
  void update(void Function(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs
    extends AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs(
          [void Function(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder)? updates]) =>
      (AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs', 'data');
  }

  @override
  AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs rebuild(
          void Function(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder toBuilder() =>
      AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder
    implements
        Builder<AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs,
            AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder>,
        AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterfaceBuilder {
  _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder();

  AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs build() => _build();

  _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs _build() {
    _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AppPasswordDeleteAppPasswordResponseApplicationJsonInterfaceBuilder {
  void replace(AppPasswordDeleteAppPasswordResponseApplicationJsonInterface other);
  void update(void Function(AppPasswordDeleteAppPasswordResponseApplicationJsonInterfaceBuilder) updates);
  AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder get ocs;
  set ocs(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder? ocs);
}

class _$AppPasswordDeleteAppPasswordResponseApplicationJson
    extends AppPasswordDeleteAppPasswordResponseApplicationJson {
  @override
  final AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs ocs;

  factory _$AppPasswordDeleteAppPasswordResponseApplicationJson(
          [void Function(AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder)? updates]) =>
      (AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder()..update(updates))._build();

  _$AppPasswordDeleteAppPasswordResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'AppPasswordDeleteAppPasswordResponseApplicationJson', 'ocs');
  }

  @override
  AppPasswordDeleteAppPasswordResponseApplicationJson rebuild(
          void Function(AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder toBuilder() =>
      AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPasswordDeleteAppPasswordResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'AppPasswordDeleteAppPasswordResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder
    implements
        Builder<AppPasswordDeleteAppPasswordResponseApplicationJson,
            AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder>,
        AppPasswordDeleteAppPasswordResponseApplicationJsonInterfaceBuilder {
  _$AppPasswordDeleteAppPasswordResponseApplicationJson? _$v;

  AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder? _ocs;
  AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder();
  set ocs(covariant AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder();

  AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AppPasswordDeleteAppPasswordResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPasswordDeleteAppPasswordResponseApplicationJson;
  }

  @override
  void update(void Function(AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppPasswordDeleteAppPasswordResponseApplicationJson build() => _build();

  _$AppPasswordDeleteAppPasswordResponseApplicationJson _build() {
    _$AppPasswordDeleteAppPasswordResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$AppPasswordDeleteAppPasswordResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AppPasswordDeleteAppPasswordResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AutocompleteResult_Status0InterfaceBuilder {
  void replace(AutocompleteResult_Status0Interface other);
  void update(void Function(AutocompleteResult_Status0InterfaceBuilder) updates);
  String? get status;
  set status(String? status);

  String? get message;
  set message(String? message);

  String? get icon;
  set icon(String? icon);

  int? get clearAt;
  set clearAt(int? clearAt);
}

class _$AutocompleteResult_Status0 extends AutocompleteResult_Status0 {
  @override
  final String status;
  @override
  final String? message;
  @override
  final String? icon;
  @override
  final int? clearAt;

  factory _$AutocompleteResult_Status0([void Function(AutocompleteResult_Status0Builder)? updates]) =>
      (AutocompleteResult_Status0Builder()..update(updates))._build();

  _$AutocompleteResult_Status0._({required this.status, this.message, this.icon, this.clearAt}) : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'AutocompleteResult_Status0', 'status');
  }

  @override
  AutocompleteResult_Status0 rebuild(void Function(AutocompleteResult_Status0Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AutocompleteResult_Status0Builder toBuilder() => AutocompleteResult_Status0Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutocompleteResult_Status0 &&
        status == other.status &&
        message == other.message &&
        icon == other.icon &&
        clearAt == other.clearAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AutocompleteResult_Status0')
          ..add('status', status)
          ..add('message', message)
          ..add('icon', icon)
          ..add('clearAt', clearAt))
        .toString();
  }
}

class AutocompleteResult_Status0Builder
    implements
        Builder<AutocompleteResult_Status0, AutocompleteResult_Status0Builder>,
        AutocompleteResult_Status0InterfaceBuilder {
  _$AutocompleteResult_Status0? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(covariant String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  int? _clearAt;
  int? get clearAt => _$this._clearAt;
  set clearAt(covariant int? clearAt) => _$this._clearAt = clearAt;

  AutocompleteResult_Status0Builder();

  AutocompleteResult_Status0Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _icon = $v.icon;
      _clearAt = $v.clearAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AutocompleteResult_Status0 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AutocompleteResult_Status0;
  }

  @override
  void update(void Function(AutocompleteResult_Status0Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AutocompleteResult_Status0 build() => _build();

  _$AutocompleteResult_Status0 _build() {
    final _$result = _$v ??
        _$AutocompleteResult_Status0._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'AutocompleteResult_Status0', 'status'),
            message: message,
            icon: icon,
            clearAt: clearAt);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AutocompleteResult_StatusInterfaceBuilder {
  void replace(AutocompleteResult_StatusInterface other);
  void update(void Function(AutocompleteResult_StatusInterfaceBuilder) updates);
  AutocompleteResult_Status0Builder get autocompleteResultStatus0;
  set autocompleteResultStatus0(AutocompleteResult_Status0Builder? autocompleteResultStatus0);

  String? get string;
  set string(String? string);
}

class _$AutocompleteResult_Status extends AutocompleteResult_Status {
  @override
  final JsonObject data;
  @override
  final AutocompleteResult_Status0? autocompleteResultStatus0;
  @override
  final String? string;

  factory _$AutocompleteResult_Status([void Function(AutocompleteResult_StatusBuilder)? updates]) =>
      (AutocompleteResult_StatusBuilder()..update(updates))._build();

  _$AutocompleteResult_Status._({required this.data, this.autocompleteResultStatus0, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'AutocompleteResult_Status', 'data');
  }

  @override
  AutocompleteResult_Status rebuild(void Function(AutocompleteResult_StatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AutocompleteResult_StatusBuilder toBuilder() => AutocompleteResult_StatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutocompleteResult_Status &&
        data == other.data &&
        autocompleteResultStatus0 == other.autocompleteResultStatus0 &&
        string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, autocompleteResultStatus0.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AutocompleteResult_Status')
          ..add('data', data)
          ..add('autocompleteResultStatus0', autocompleteResultStatus0)
          ..add('string', string))
        .toString();
  }
}

class AutocompleteResult_StatusBuilder
    implements
        Builder<AutocompleteResult_Status, AutocompleteResult_StatusBuilder>,
        AutocompleteResult_StatusInterfaceBuilder {
  _$AutocompleteResult_Status? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  AutocompleteResult_Status0Builder? _autocompleteResultStatus0;
  AutocompleteResult_Status0Builder get autocompleteResultStatus0 =>
      _$this._autocompleteResultStatus0 ??= AutocompleteResult_Status0Builder();
  set autocompleteResultStatus0(covariant AutocompleteResult_Status0Builder? autocompleteResultStatus0) =>
      _$this._autocompleteResultStatus0 = autocompleteResultStatus0;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  AutocompleteResult_StatusBuilder();

  AutocompleteResult_StatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _autocompleteResultStatus0 = $v.autocompleteResultStatus0?.toBuilder();
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AutocompleteResult_Status other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AutocompleteResult_Status;
  }

  @override
  void update(void Function(AutocompleteResult_StatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AutocompleteResult_Status build() => _build();

  _$AutocompleteResult_Status _build() {
    AutocompleteResult_Status._validate(this);
    _$AutocompleteResult_Status _$result;
    try {
      _$result = _$v ??
          _$AutocompleteResult_Status._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'AutocompleteResult_Status', 'data'),
              autocompleteResultStatus0: _autocompleteResultStatus0?.build(),
              string: string);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'autocompleteResultStatus0';
        _autocompleteResultStatus0?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'AutocompleteResult_Status', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AutocompleteResultInterfaceBuilder {
  void replace(AutocompleteResultInterface other);
  void update(void Function(AutocompleteResultInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get label;
  set label(String? label);

  String? get icon;
  set icon(String? icon);

  String? get source;
  set source(String? source);

  AutocompleteResult_StatusBuilder get status;
  set status(AutocompleteResult_StatusBuilder? status);

  String? get subline;
  set subline(String? subline);

  String? get shareWithDisplayNameUnique;
  set shareWithDisplayNameUnique(String? shareWithDisplayNameUnique);
}

class _$AutocompleteResult extends AutocompleteResult {
  @override
  final String id;
  @override
  final String label;
  @override
  final String icon;
  @override
  final String source;
  @override
  final AutocompleteResult_Status status;
  @override
  final String subline;
  @override
  final String shareWithDisplayNameUnique;

  factory _$AutocompleteResult([void Function(AutocompleteResultBuilder)? updates]) =>
      (AutocompleteResultBuilder()..update(updates))._build();

  _$AutocompleteResult._(
      {required this.id,
      required this.label,
      required this.icon,
      required this.source,
      required this.status,
      required this.subline,
      required this.shareWithDisplayNameUnique})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'AutocompleteResult', 'id');
    BuiltValueNullFieldError.checkNotNull(label, r'AutocompleteResult', 'label');
    BuiltValueNullFieldError.checkNotNull(icon, r'AutocompleteResult', 'icon');
    BuiltValueNullFieldError.checkNotNull(source, r'AutocompleteResult', 'source');
    BuiltValueNullFieldError.checkNotNull(status, r'AutocompleteResult', 'status');
    BuiltValueNullFieldError.checkNotNull(subline, r'AutocompleteResult', 'subline');
    BuiltValueNullFieldError.checkNotNull(
        shareWithDisplayNameUnique, r'AutocompleteResult', 'shareWithDisplayNameUnique');
  }

  @override
  AutocompleteResult rebuild(void Function(AutocompleteResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AutocompleteResultBuilder toBuilder() => AutocompleteResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutocompleteResult &&
        id == other.id &&
        label == other.label &&
        icon == other.icon &&
        source == other.source &&
        status == other.status &&
        subline == other.subline &&
        shareWithDisplayNameUnique == other.shareWithDisplayNameUnique;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, source.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, subline.hashCode);
    _$hash = $jc(_$hash, shareWithDisplayNameUnique.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AutocompleteResult')
          ..add('id', id)
          ..add('label', label)
          ..add('icon', icon)
          ..add('source', source)
          ..add('status', status)
          ..add('subline', subline)
          ..add('shareWithDisplayNameUnique', shareWithDisplayNameUnique))
        .toString();
  }
}

class AutocompleteResultBuilder
    implements Builder<AutocompleteResult, AutocompleteResultBuilder>, AutocompleteResultInterfaceBuilder {
  _$AutocompleteResult? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _label;
  String? get label => _$this._label;
  set label(covariant String? label) => _$this._label = label;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  String? _source;
  String? get source => _$this._source;
  set source(covariant String? source) => _$this._source = source;

  AutocompleteResult_StatusBuilder? _status;
  AutocompleteResult_StatusBuilder get status => _$this._status ??= AutocompleteResult_StatusBuilder();
  set status(covariant AutocompleteResult_StatusBuilder? status) => _$this._status = status;

  String? _subline;
  String? get subline => _$this._subline;
  set subline(covariant String? subline) => _$this._subline = subline;

  String? _shareWithDisplayNameUnique;
  String? get shareWithDisplayNameUnique => _$this._shareWithDisplayNameUnique;
  set shareWithDisplayNameUnique(covariant String? shareWithDisplayNameUnique) =>
      _$this._shareWithDisplayNameUnique = shareWithDisplayNameUnique;

  AutocompleteResultBuilder();

  AutocompleteResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _label = $v.label;
      _icon = $v.icon;
      _source = $v.source;
      _status = $v.status.toBuilder();
      _subline = $v.subline;
      _shareWithDisplayNameUnique = $v.shareWithDisplayNameUnique;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AutocompleteResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AutocompleteResult;
  }

  @override
  void update(void Function(AutocompleteResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AutocompleteResult build() => _build();

  _$AutocompleteResult _build() {
    _$AutocompleteResult _$result;
    try {
      _$result = _$v ??
          _$AutocompleteResult._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'AutocompleteResult', 'id'),
              label: BuiltValueNullFieldError.checkNotNull(label, r'AutocompleteResult', 'label'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'AutocompleteResult', 'icon'),
              source: BuiltValueNullFieldError.checkNotNull(source, r'AutocompleteResult', 'source'),
              status: status.build(),
              subline: BuiltValueNullFieldError.checkNotNull(subline, r'AutocompleteResult', 'subline'),
              shareWithDisplayNameUnique: BuiltValueNullFieldError.checkNotNull(
                  shareWithDisplayNameUnique, r'AutocompleteResult', 'shareWithDisplayNameUnique'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'status';
        status.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'AutocompleteResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AutoCompleteGetResponseApplicationJson_OcsInterfaceBuilder {
  void replace(AutoCompleteGetResponseApplicationJson_OcsInterface other);
  void update(void Function(AutoCompleteGetResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<AutocompleteResult> get data;
  set data(ListBuilder<AutocompleteResult>? data);
}

class _$AutoCompleteGetResponseApplicationJson_Ocs extends AutoCompleteGetResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<AutocompleteResult> data;

  factory _$AutoCompleteGetResponseApplicationJson_Ocs(
          [void Function(AutoCompleteGetResponseApplicationJson_OcsBuilder)? updates]) =>
      (AutoCompleteGetResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$AutoCompleteGetResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'AutoCompleteGetResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'AutoCompleteGetResponseApplicationJson_Ocs', 'data');
  }

  @override
  AutoCompleteGetResponseApplicationJson_Ocs rebuild(
          void Function(AutoCompleteGetResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AutoCompleteGetResponseApplicationJson_OcsBuilder toBuilder() =>
      AutoCompleteGetResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutoCompleteGetResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'AutoCompleteGetResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class AutoCompleteGetResponseApplicationJson_OcsBuilder
    implements
        Builder<AutoCompleteGetResponseApplicationJson_Ocs, AutoCompleteGetResponseApplicationJson_OcsBuilder>,
        AutoCompleteGetResponseApplicationJson_OcsInterfaceBuilder {
  _$AutoCompleteGetResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<AutocompleteResult>? _data;
  ListBuilder<AutocompleteResult> get data => _$this._data ??= ListBuilder<AutocompleteResult>();
  set data(covariant ListBuilder<AutocompleteResult>? data) => _$this._data = data;

  AutoCompleteGetResponseApplicationJson_OcsBuilder();

  AutoCompleteGetResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AutoCompleteGetResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AutoCompleteGetResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(AutoCompleteGetResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AutoCompleteGetResponseApplicationJson_Ocs build() => _build();

  _$AutoCompleteGetResponseApplicationJson_Ocs _build() {
    _$AutoCompleteGetResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$AutoCompleteGetResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'AutoCompleteGetResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AutoCompleteGetResponseApplicationJsonInterfaceBuilder {
  void replace(AutoCompleteGetResponseApplicationJsonInterface other);
  void update(void Function(AutoCompleteGetResponseApplicationJsonInterfaceBuilder) updates);
  AutoCompleteGetResponseApplicationJson_OcsBuilder get ocs;
  set ocs(AutoCompleteGetResponseApplicationJson_OcsBuilder? ocs);
}

class _$AutoCompleteGetResponseApplicationJson extends AutoCompleteGetResponseApplicationJson {
  @override
  final AutoCompleteGetResponseApplicationJson_Ocs ocs;

  factory _$AutoCompleteGetResponseApplicationJson(
          [void Function(AutoCompleteGetResponseApplicationJsonBuilder)? updates]) =>
      (AutoCompleteGetResponseApplicationJsonBuilder()..update(updates))._build();

  _$AutoCompleteGetResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'AutoCompleteGetResponseApplicationJson', 'ocs');
  }

  @override
  AutoCompleteGetResponseApplicationJson rebuild(
          void Function(AutoCompleteGetResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AutoCompleteGetResponseApplicationJsonBuilder toBuilder() =>
      AutoCompleteGetResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutoCompleteGetResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'AutoCompleteGetResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class AutoCompleteGetResponseApplicationJsonBuilder
    implements
        Builder<AutoCompleteGetResponseApplicationJson, AutoCompleteGetResponseApplicationJsonBuilder>,
        AutoCompleteGetResponseApplicationJsonInterfaceBuilder {
  _$AutoCompleteGetResponseApplicationJson? _$v;

  AutoCompleteGetResponseApplicationJson_OcsBuilder? _ocs;
  AutoCompleteGetResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= AutoCompleteGetResponseApplicationJson_OcsBuilder();
  set ocs(covariant AutoCompleteGetResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  AutoCompleteGetResponseApplicationJsonBuilder();

  AutoCompleteGetResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AutoCompleteGetResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AutoCompleteGetResponseApplicationJson;
  }

  @override
  void update(void Function(AutoCompleteGetResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AutoCompleteGetResponseApplicationJson build() => _build();

  _$AutoCompleteGetResponseApplicationJson _build() {
    _$AutoCompleteGetResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$AutoCompleteGetResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'AutoCompleteGetResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AvatarAvatarGetAvatarDarkHeadersInterfaceBuilder {
  void replace(AvatarAvatarGetAvatarDarkHeadersInterface other);
  void update(void Function(AvatarAvatarGetAvatarDarkHeadersInterfaceBuilder) updates);
  int? get xNcIscustomavatar;
  set xNcIscustomavatar(int? xNcIscustomavatar);
}

class _$AvatarAvatarGetAvatarDarkHeaders extends AvatarAvatarGetAvatarDarkHeaders {
  @override
  final int? xNcIscustomavatar;

  factory _$AvatarAvatarGetAvatarDarkHeaders([void Function(AvatarAvatarGetAvatarDarkHeadersBuilder)? updates]) =>
      (AvatarAvatarGetAvatarDarkHeadersBuilder()..update(updates))._build();

  _$AvatarAvatarGetAvatarDarkHeaders._({this.xNcIscustomavatar}) : super._();

  @override
  AvatarAvatarGetAvatarDarkHeaders rebuild(void Function(AvatarAvatarGetAvatarDarkHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvatarAvatarGetAvatarDarkHeadersBuilder toBuilder() => AvatarAvatarGetAvatarDarkHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvatarAvatarGetAvatarDarkHeaders && xNcIscustomavatar == other.xNcIscustomavatar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, xNcIscustomavatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AvatarAvatarGetAvatarDarkHeaders')
          ..add('xNcIscustomavatar', xNcIscustomavatar))
        .toString();
  }
}

class AvatarAvatarGetAvatarDarkHeadersBuilder
    implements
        Builder<AvatarAvatarGetAvatarDarkHeaders, AvatarAvatarGetAvatarDarkHeadersBuilder>,
        AvatarAvatarGetAvatarDarkHeadersInterfaceBuilder {
  _$AvatarAvatarGetAvatarDarkHeaders? _$v;

  int? _xNcIscustomavatar;
  int? get xNcIscustomavatar => _$this._xNcIscustomavatar;
  set xNcIscustomavatar(covariant int? xNcIscustomavatar) => _$this._xNcIscustomavatar = xNcIscustomavatar;

  AvatarAvatarGetAvatarDarkHeadersBuilder();

  AvatarAvatarGetAvatarDarkHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _xNcIscustomavatar = $v.xNcIscustomavatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AvatarAvatarGetAvatarDarkHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AvatarAvatarGetAvatarDarkHeaders;
  }

  @override
  void update(void Function(AvatarAvatarGetAvatarDarkHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AvatarAvatarGetAvatarDarkHeaders build() => _build();

  _$AvatarAvatarGetAvatarDarkHeaders _build() {
    final _$result = _$v ?? _$AvatarAvatarGetAvatarDarkHeaders._(xNcIscustomavatar: xNcIscustomavatar);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class AvatarAvatarGetAvatarHeadersInterfaceBuilder {
  void replace(AvatarAvatarGetAvatarHeadersInterface other);
  void update(void Function(AvatarAvatarGetAvatarHeadersInterfaceBuilder) updates);
  int? get xNcIscustomavatar;
  set xNcIscustomavatar(int? xNcIscustomavatar);
}

class _$AvatarAvatarGetAvatarHeaders extends AvatarAvatarGetAvatarHeaders {
  @override
  final int? xNcIscustomavatar;

  factory _$AvatarAvatarGetAvatarHeaders([void Function(AvatarAvatarGetAvatarHeadersBuilder)? updates]) =>
      (AvatarAvatarGetAvatarHeadersBuilder()..update(updates))._build();

  _$AvatarAvatarGetAvatarHeaders._({this.xNcIscustomavatar}) : super._();

  @override
  AvatarAvatarGetAvatarHeaders rebuild(void Function(AvatarAvatarGetAvatarHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvatarAvatarGetAvatarHeadersBuilder toBuilder() => AvatarAvatarGetAvatarHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvatarAvatarGetAvatarHeaders && xNcIscustomavatar == other.xNcIscustomavatar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, xNcIscustomavatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AvatarAvatarGetAvatarHeaders')..add('xNcIscustomavatar', xNcIscustomavatar))
        .toString();
  }
}

class AvatarAvatarGetAvatarHeadersBuilder
    implements
        Builder<AvatarAvatarGetAvatarHeaders, AvatarAvatarGetAvatarHeadersBuilder>,
        AvatarAvatarGetAvatarHeadersInterfaceBuilder {
  _$AvatarAvatarGetAvatarHeaders? _$v;

  int? _xNcIscustomavatar;
  int? get xNcIscustomavatar => _$this._xNcIscustomavatar;
  set xNcIscustomavatar(covariant int? xNcIscustomavatar) => _$this._xNcIscustomavatar = xNcIscustomavatar;

  AvatarAvatarGetAvatarHeadersBuilder();

  AvatarAvatarGetAvatarHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _xNcIscustomavatar = $v.xNcIscustomavatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AvatarAvatarGetAvatarHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AvatarAvatarGetAvatarHeaders;
  }

  @override
  void update(void Function(AvatarAvatarGetAvatarHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AvatarAvatarGetAvatarHeaders build() => _build();

  _$AvatarAvatarGetAvatarHeaders _build() {
    final _$result = _$v ?? _$AvatarAvatarGetAvatarHeaders._(xNcIscustomavatar: xNcIscustomavatar);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class LoginFlowV2CredentialsInterfaceBuilder {
  void replace(LoginFlowV2CredentialsInterface other);
  void update(void Function(LoginFlowV2CredentialsInterfaceBuilder) updates);
  String? get server;
  set server(String? server);

  String? get loginName;
  set loginName(String? loginName);

  String? get appPassword;
  set appPassword(String? appPassword);
}

class _$LoginFlowV2Credentials extends LoginFlowV2Credentials {
  @override
  final String server;
  @override
  final String loginName;
  @override
  final String appPassword;

  factory _$LoginFlowV2Credentials([void Function(LoginFlowV2CredentialsBuilder)? updates]) =>
      (LoginFlowV2CredentialsBuilder()..update(updates))._build();

  _$LoginFlowV2Credentials._({required this.server, required this.loginName, required this.appPassword}) : super._() {
    BuiltValueNullFieldError.checkNotNull(server, r'LoginFlowV2Credentials', 'server');
    BuiltValueNullFieldError.checkNotNull(loginName, r'LoginFlowV2Credentials', 'loginName');
    BuiltValueNullFieldError.checkNotNull(appPassword, r'LoginFlowV2Credentials', 'appPassword');
  }

  @override
  LoginFlowV2Credentials rebuild(void Function(LoginFlowV2CredentialsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginFlowV2CredentialsBuilder toBuilder() => LoginFlowV2CredentialsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginFlowV2Credentials &&
        server == other.server &&
        loginName == other.loginName &&
        appPassword == other.appPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, server.hashCode);
    _$hash = $jc(_$hash, loginName.hashCode);
    _$hash = $jc(_$hash, appPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginFlowV2Credentials')
          ..add('server', server)
          ..add('loginName', loginName)
          ..add('appPassword', appPassword))
        .toString();
  }
}

class LoginFlowV2CredentialsBuilder
    implements Builder<LoginFlowV2Credentials, LoginFlowV2CredentialsBuilder>, LoginFlowV2CredentialsInterfaceBuilder {
  _$LoginFlowV2Credentials? _$v;

  String? _server;
  String? get server => _$this._server;
  set server(covariant String? server) => _$this._server = server;

  String? _loginName;
  String? get loginName => _$this._loginName;
  set loginName(covariant String? loginName) => _$this._loginName = loginName;

  String? _appPassword;
  String? get appPassword => _$this._appPassword;
  set appPassword(covariant String? appPassword) => _$this._appPassword = appPassword;

  LoginFlowV2CredentialsBuilder();

  LoginFlowV2CredentialsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _server = $v.server;
      _loginName = $v.loginName;
      _appPassword = $v.appPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LoginFlowV2Credentials other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginFlowV2Credentials;
  }

  @override
  void update(void Function(LoginFlowV2CredentialsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginFlowV2Credentials build() => _build();

  _$LoginFlowV2Credentials _build() {
    final _$result = _$v ??
        _$LoginFlowV2Credentials._(
            server: BuiltValueNullFieldError.checkNotNull(server, r'LoginFlowV2Credentials', 'server'),
            loginName: BuiltValueNullFieldError.checkNotNull(loginName, r'LoginFlowV2Credentials', 'loginName'),
            appPassword: BuiltValueNullFieldError.checkNotNull(appPassword, r'LoginFlowV2Credentials', 'appPassword'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class LoginFlowV2_PollInterfaceBuilder {
  void replace(LoginFlowV2_PollInterface other);
  void update(void Function(LoginFlowV2_PollInterfaceBuilder) updates);
  String? get token;
  set token(String? token);

  String? get endpoint;
  set endpoint(String? endpoint);
}

class _$LoginFlowV2_Poll extends LoginFlowV2_Poll {
  @override
  final String token;
  @override
  final String endpoint;

  factory _$LoginFlowV2_Poll([void Function(LoginFlowV2_PollBuilder)? updates]) =>
      (LoginFlowV2_PollBuilder()..update(updates))._build();

  _$LoginFlowV2_Poll._({required this.token, required this.endpoint}) : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'LoginFlowV2_Poll', 'token');
    BuiltValueNullFieldError.checkNotNull(endpoint, r'LoginFlowV2_Poll', 'endpoint');
  }

  @override
  LoginFlowV2_Poll rebuild(void Function(LoginFlowV2_PollBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  LoginFlowV2_PollBuilder toBuilder() => LoginFlowV2_PollBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginFlowV2_Poll && token == other.token && endpoint == other.endpoint;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, endpoint.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginFlowV2_Poll')
          ..add('token', token)
          ..add('endpoint', endpoint))
        .toString();
  }
}

class LoginFlowV2_PollBuilder
    implements Builder<LoginFlowV2_Poll, LoginFlowV2_PollBuilder>, LoginFlowV2_PollInterfaceBuilder {
  _$LoginFlowV2_Poll? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(covariant String? token) => _$this._token = token;

  String? _endpoint;
  String? get endpoint => _$this._endpoint;
  set endpoint(covariant String? endpoint) => _$this._endpoint = endpoint;

  LoginFlowV2_PollBuilder();

  LoginFlowV2_PollBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _endpoint = $v.endpoint;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LoginFlowV2_Poll other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginFlowV2_Poll;
  }

  @override
  void update(void Function(LoginFlowV2_PollBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginFlowV2_Poll build() => _build();

  _$LoginFlowV2_Poll _build() {
    final _$result = _$v ??
        _$LoginFlowV2_Poll._(
            token: BuiltValueNullFieldError.checkNotNull(token, r'LoginFlowV2_Poll', 'token'),
            endpoint: BuiltValueNullFieldError.checkNotNull(endpoint, r'LoginFlowV2_Poll', 'endpoint'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class LoginFlowV2InterfaceBuilder {
  void replace(LoginFlowV2Interface other);
  void update(void Function(LoginFlowV2InterfaceBuilder) updates);
  LoginFlowV2_PollBuilder get poll;
  set poll(LoginFlowV2_PollBuilder? poll);

  String? get login;
  set login(String? login);
}

class _$LoginFlowV2 extends LoginFlowV2 {
  @override
  final LoginFlowV2_Poll poll;
  @override
  final String login;

  factory _$LoginFlowV2([void Function(LoginFlowV2Builder)? updates]) =>
      (LoginFlowV2Builder()..update(updates))._build();

  _$LoginFlowV2._({required this.poll, required this.login}) : super._() {
    BuiltValueNullFieldError.checkNotNull(poll, r'LoginFlowV2', 'poll');
    BuiltValueNullFieldError.checkNotNull(login, r'LoginFlowV2', 'login');
  }

  @override
  LoginFlowV2 rebuild(void Function(LoginFlowV2Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  LoginFlowV2Builder toBuilder() => LoginFlowV2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginFlowV2 && poll == other.poll && login == other.login;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, poll.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginFlowV2')
          ..add('poll', poll)
          ..add('login', login))
        .toString();
  }
}

class LoginFlowV2Builder implements Builder<LoginFlowV2, LoginFlowV2Builder>, LoginFlowV2InterfaceBuilder {
  _$LoginFlowV2? _$v;

  LoginFlowV2_PollBuilder? _poll;
  LoginFlowV2_PollBuilder get poll => _$this._poll ??= LoginFlowV2_PollBuilder();
  set poll(covariant LoginFlowV2_PollBuilder? poll) => _$this._poll = poll;

  String? _login;
  String? get login => _$this._login;
  set login(covariant String? login) => _$this._login = login;

  LoginFlowV2Builder();

  LoginFlowV2Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _poll = $v.poll.toBuilder();
      _login = $v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LoginFlowV2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginFlowV2;
  }

  @override
  void update(void Function(LoginFlowV2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginFlowV2 build() => _build();

  _$LoginFlowV2 _build() {
    _$LoginFlowV2 _$result;
    try {
      _$result = _$v ??
          _$LoginFlowV2._(
              poll: poll.build(), login: BuiltValueNullFieldError.checkNotNull(login, r'LoginFlowV2', 'login'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'poll';
        poll.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'LoginFlowV2', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OpenGraphObjectInterfaceBuilder {
  void replace(OpenGraphObjectInterface other);
  void update(void Function(OpenGraphObjectInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get name;
  set name(String? name);

  String? get description;
  set description(String? description);

  String? get thumb;
  set thumb(String? thumb);

  String? get link;
  set link(String? link);
}

class _$OpenGraphObject extends OpenGraphObject {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? thumb;
  @override
  final String link;

  factory _$OpenGraphObject([void Function(OpenGraphObjectBuilder)? updates]) =>
      (OpenGraphObjectBuilder()..update(updates))._build();

  _$OpenGraphObject._({required this.id, required this.name, this.description, this.thumb, required this.link})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'OpenGraphObject', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'OpenGraphObject', 'name');
    BuiltValueNullFieldError.checkNotNull(link, r'OpenGraphObject', 'link');
  }

  @override
  OpenGraphObject rebuild(void Function(OpenGraphObjectBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OpenGraphObjectBuilder toBuilder() => OpenGraphObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenGraphObject &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        thumb == other.thumb &&
        link == other.link;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, thumb.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OpenGraphObject')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('thumb', thumb)
          ..add('link', link))
        .toString();
  }
}

class OpenGraphObjectBuilder
    implements Builder<OpenGraphObject, OpenGraphObjectBuilder>, OpenGraphObjectInterfaceBuilder {
  _$OpenGraphObject? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  String? _thumb;
  String? get thumb => _$this._thumb;
  set thumb(covariant String? thumb) => _$this._thumb = thumb;

  String? _link;
  String? get link => _$this._link;
  set link(covariant String? link) => _$this._link = link;

  OpenGraphObjectBuilder();

  OpenGraphObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _thumb = $v.thumb;
      _link = $v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OpenGraphObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenGraphObject;
  }

  @override
  void update(void Function(OpenGraphObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OpenGraphObject build() => _build();

  _$OpenGraphObject _build() {
    final _$result = _$v ??
        _$OpenGraphObject._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'OpenGraphObject', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name, r'OpenGraphObject', 'name'),
            description: description,
            thumb: thumb,
            link: BuiltValueNullFieldError.checkNotNull(link, r'OpenGraphObject', 'link'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ResourceInterfaceBuilder {
  void replace(ResourceInterface other);
  void update(void Function(ResourceInterfaceBuilder) updates);
  String? get richObjectType;
  set richObjectType(String? richObjectType);

  MapBuilder<String, JsonObject> get richObject;
  set richObject(MapBuilder<String, JsonObject>? richObject);

  OpenGraphObjectBuilder get openGraphObject;
  set openGraphObject(OpenGraphObjectBuilder? openGraphObject);

  bool? get accessible;
  set accessible(bool? accessible);
}

class _$Resource extends Resource {
  @override
  final String richObjectType;
  @override
  final BuiltMap<String, JsonObject> richObject;
  @override
  final OpenGraphObject openGraphObject;
  @override
  final bool accessible;

  factory _$Resource([void Function(ResourceBuilder)? updates]) => (ResourceBuilder()..update(updates))._build();

  _$Resource._(
      {required this.richObjectType, required this.richObject, required this.openGraphObject, required this.accessible})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(richObjectType, r'Resource', 'richObjectType');
    BuiltValueNullFieldError.checkNotNull(richObject, r'Resource', 'richObject');
    BuiltValueNullFieldError.checkNotNull(openGraphObject, r'Resource', 'openGraphObject');
    BuiltValueNullFieldError.checkNotNull(accessible, r'Resource', 'accessible');
  }

  @override
  Resource rebuild(void Function(ResourceBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ResourceBuilder toBuilder() => ResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Resource &&
        richObjectType == other.richObjectType &&
        richObject == other.richObject &&
        openGraphObject == other.openGraphObject &&
        accessible == other.accessible;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, richObjectType.hashCode);
    _$hash = $jc(_$hash, richObject.hashCode);
    _$hash = $jc(_$hash, openGraphObject.hashCode);
    _$hash = $jc(_$hash, accessible.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Resource')
          ..add('richObjectType', richObjectType)
          ..add('richObject', richObject)
          ..add('openGraphObject', openGraphObject)
          ..add('accessible', accessible))
        .toString();
  }
}

class ResourceBuilder implements Builder<Resource, ResourceBuilder>, ResourceInterfaceBuilder {
  _$Resource? _$v;

  String? _richObjectType;
  String? get richObjectType => _$this._richObjectType;
  set richObjectType(covariant String? richObjectType) => _$this._richObjectType = richObjectType;

  MapBuilder<String, JsonObject>? _richObject;
  MapBuilder<String, JsonObject> get richObject => _$this._richObject ??= MapBuilder<String, JsonObject>();
  set richObject(covariant MapBuilder<String, JsonObject>? richObject) => _$this._richObject = richObject;

  OpenGraphObjectBuilder? _openGraphObject;
  OpenGraphObjectBuilder get openGraphObject => _$this._openGraphObject ??= OpenGraphObjectBuilder();
  set openGraphObject(covariant OpenGraphObjectBuilder? openGraphObject) => _$this._openGraphObject = openGraphObject;

  bool? _accessible;
  bool? get accessible => _$this._accessible;
  set accessible(covariant bool? accessible) => _$this._accessible = accessible;

  ResourceBuilder();

  ResourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _richObjectType = $v.richObjectType;
      _richObject = $v.richObject.toBuilder();
      _openGraphObject = $v.openGraphObject.toBuilder();
      _accessible = $v.accessible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Resource other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Resource;
  }

  @override
  void update(void Function(ResourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Resource build() => _build();

  _$Resource _build() {
    _$Resource _$result;
    try {
      _$result = _$v ??
          _$Resource._(
              richObjectType: BuiltValueNullFieldError.checkNotNull(richObjectType, r'Resource', 'richObjectType'),
              richObject: richObject.build(),
              openGraphObject: openGraphObject.build(),
              accessible: BuiltValueNullFieldError.checkNotNull(accessible, r'Resource', 'accessible'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'richObject';
        richObject.build();
        _$failedField = 'openGraphObject';
        openGraphObject.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Resource', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollectionInterfaceBuilder {
  void replace(CollectionInterface other);
  void update(void Function(CollectionInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get name;
  set name(String? name);

  ListBuilder<Resource> get resources;
  set resources(ListBuilder<Resource>? resources);
}

class _$Collection extends Collection {
  @override
  final int id;
  @override
  final String name;
  @override
  final BuiltList<Resource> resources;

  factory _$Collection([void Function(CollectionBuilder)? updates]) => (CollectionBuilder()..update(updates))._build();

  _$Collection._({required this.id, required this.name, required this.resources}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Collection', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Collection', 'name');
    BuiltValueNullFieldError.checkNotNull(resources, r'Collection', 'resources');
  }

  @override
  Collection rebuild(void Function(CollectionBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CollectionBuilder toBuilder() => CollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Collection && id == other.id && name == other.name && resources == other.resources;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, resources.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Collection')
          ..add('id', id)
          ..add('name', name)
          ..add('resources', resources))
        .toString();
  }
}

class CollectionBuilder implements Builder<Collection, CollectionBuilder>, CollectionInterfaceBuilder {
  _$Collection? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  ListBuilder<Resource>? _resources;
  ListBuilder<Resource> get resources => _$this._resources ??= ListBuilder<Resource>();
  set resources(covariant ListBuilder<Resource>? resources) => _$this._resources = resources;

  CollectionBuilder();

  CollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _resources = $v.resources.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Collection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Collection;
  }

  @override
  void update(void Function(CollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Collection build() => _build();

  _$Collection _build() {
    _$Collection _$result;
    try {
      _$result = _$v ??
          _$Collection._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Collection', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(name, r'Collection', 'name'),
              resources: resources.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'resources';
        resources.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Collection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterfaceBuilder {
  void replace(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface other);
  void update(
      void Function(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<Collection> get data;
  set data(ListBuilder<Collection>? data);
}

class _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs
    extends CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<Collection> data;

  factory _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs(
          [void Function(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder)? updates]) =>
      (CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs', 'data');
  }

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs rebuild(
          void Function(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder toBuilder() =>
      CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder
    implements
        Builder<CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs,
            CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder>,
        CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterfaceBuilder {
  _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<Collection>? _data;
  ListBuilder<Collection> get data => _$this._data ??= ListBuilder<Collection>();
  set data(covariant ListBuilder<Collection>? data) => _$this._data = data;

  CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder();

  CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs build() => _build();

  _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs _build() {
    _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs._(
              meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesSearchCollectionsResponseApplicationJsonInterfaceBuilder {
  void replace(CollaborationResourcesSearchCollectionsResponseApplicationJsonInterface other);
  void update(void Function(CollaborationResourcesSearchCollectionsResponseApplicationJsonInterfaceBuilder) updates);
  CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder get ocs;
  set ocs(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder? ocs);
}

class _$CollaborationResourcesSearchCollectionsResponseApplicationJson
    extends CollaborationResourcesSearchCollectionsResponseApplicationJson {
  @override
  final CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs ocs;

  factory _$CollaborationResourcesSearchCollectionsResponseApplicationJson(
          [void Function(CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder)? updates]) =>
      (CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder()..update(updates))._build();

  _$CollaborationResourcesSearchCollectionsResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ocs, r'CollaborationResourcesSearchCollectionsResponseApplicationJson', 'ocs');
  }

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJson rebuild(
          void Function(CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder toBuilder() =>
      CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesSearchCollectionsResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesSearchCollectionsResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder
    implements
        Builder<CollaborationResourcesSearchCollectionsResponseApplicationJson,
            CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder>,
        CollaborationResourcesSearchCollectionsResponseApplicationJsonInterfaceBuilder {
  _$CollaborationResourcesSearchCollectionsResponseApplicationJson? _$v;

  CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder? _ocs;
  CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder();
  set ocs(covariant CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder? ocs) =>
      _$this._ocs = ocs;

  CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder();

  CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesSearchCollectionsResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesSearchCollectionsResponseApplicationJson;
  }

  @override
  void update(void Function(CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJson build() => _build();

  _$CollaborationResourcesSearchCollectionsResponseApplicationJson _build() {
    _$CollaborationResourcesSearchCollectionsResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$CollaborationResourcesSearchCollectionsResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesSearchCollectionsResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesListCollectionResponseApplicationJson_OcsInterfaceBuilder {
  void replace(CollaborationResourcesListCollectionResponseApplicationJson_OcsInterface other);
  void update(void Function(CollaborationResourcesListCollectionResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  CollectionBuilder get data;
  set data(CollectionBuilder? data);
}

class _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs
    extends CollaborationResourcesListCollectionResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Collection data;

  factory _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs(
          [void Function(CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder)? updates]) =>
      (CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'CollaborationResourcesListCollectionResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'CollaborationResourcesListCollectionResponseApplicationJson_Ocs', 'data');
  }

  @override
  CollaborationResourcesListCollectionResponseApplicationJson_Ocs rebuild(
          void Function(CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder toBuilder() =>
      CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesListCollectionResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesListCollectionResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder
    implements
        Builder<CollaborationResourcesListCollectionResponseApplicationJson_Ocs,
            CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder>,
        CollaborationResourcesListCollectionResponseApplicationJson_OcsInterfaceBuilder {
  _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  CollectionBuilder? _data;
  CollectionBuilder get data => _$this._data ??= CollectionBuilder();
  set data(covariant CollectionBuilder? data) => _$this._data = data;

  CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder();

  CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesListCollectionResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesListCollectionResponseApplicationJson_Ocs build() => _build();

  _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs _build() {
    _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesListCollectionResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesListCollectionResponseApplicationJsonInterfaceBuilder {
  void replace(CollaborationResourcesListCollectionResponseApplicationJsonInterface other);
  void update(void Function(CollaborationResourcesListCollectionResponseApplicationJsonInterfaceBuilder) updates);
  CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder get ocs;
  set ocs(CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder? ocs);
}

class _$CollaborationResourcesListCollectionResponseApplicationJson
    extends CollaborationResourcesListCollectionResponseApplicationJson {
  @override
  final CollaborationResourcesListCollectionResponseApplicationJson_Ocs ocs;

  factory _$CollaborationResourcesListCollectionResponseApplicationJson(
          [void Function(CollaborationResourcesListCollectionResponseApplicationJsonBuilder)? updates]) =>
      (CollaborationResourcesListCollectionResponseApplicationJsonBuilder()..update(updates))._build();

  _$CollaborationResourcesListCollectionResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'CollaborationResourcesListCollectionResponseApplicationJson', 'ocs');
  }

  @override
  CollaborationResourcesListCollectionResponseApplicationJson rebuild(
          void Function(CollaborationResourcesListCollectionResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesListCollectionResponseApplicationJsonBuilder toBuilder() =>
      CollaborationResourcesListCollectionResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesListCollectionResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesListCollectionResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class CollaborationResourcesListCollectionResponseApplicationJsonBuilder
    implements
        Builder<CollaborationResourcesListCollectionResponseApplicationJson,
            CollaborationResourcesListCollectionResponseApplicationJsonBuilder>,
        CollaborationResourcesListCollectionResponseApplicationJsonInterfaceBuilder {
  _$CollaborationResourcesListCollectionResponseApplicationJson? _$v;

  CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder? _ocs;
  CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder();
  set ocs(covariant CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  CollaborationResourcesListCollectionResponseApplicationJsonBuilder();

  CollaborationResourcesListCollectionResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesListCollectionResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesListCollectionResponseApplicationJson;
  }

  @override
  void update(void Function(CollaborationResourcesListCollectionResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesListCollectionResponseApplicationJson build() => _build();

  _$CollaborationResourcesListCollectionResponseApplicationJson _build() {
    _$CollaborationResourcesListCollectionResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$CollaborationResourcesListCollectionResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesListCollectionResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterfaceBuilder {
  void replace(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface other);
  void update(void Function(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  CollectionBuilder get data;
  set data(CollectionBuilder? data);
}

class _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs
    extends CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Collection data;

  factory _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs(
          [void Function(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder)? updates]) =>
      (CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs', 'data');
  }

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs rebuild(
          void Function(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder toBuilder() =>
      CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder
    implements
        Builder<CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs,
            CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder>,
        CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterfaceBuilder {
  _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  CollectionBuilder? _data;
  CollectionBuilder get data => _$this._data ??= CollectionBuilder();
  set data(covariant CollectionBuilder? data) => _$this._data = data;

  CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder();

  CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs build() => _build();

  _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs _build() {
    _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesRenameCollectionResponseApplicationJsonInterfaceBuilder {
  void replace(CollaborationResourcesRenameCollectionResponseApplicationJsonInterface other);
  void update(void Function(CollaborationResourcesRenameCollectionResponseApplicationJsonInterfaceBuilder) updates);
  CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder get ocs;
  set ocs(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder? ocs);
}

class _$CollaborationResourcesRenameCollectionResponseApplicationJson
    extends CollaborationResourcesRenameCollectionResponseApplicationJson {
  @override
  final CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs ocs;

  factory _$CollaborationResourcesRenameCollectionResponseApplicationJson(
          [void Function(CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder)? updates]) =>
      (CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder()..update(updates))._build();

  _$CollaborationResourcesRenameCollectionResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'CollaborationResourcesRenameCollectionResponseApplicationJson', 'ocs');
  }

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJson rebuild(
          void Function(CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder toBuilder() =>
      CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesRenameCollectionResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesRenameCollectionResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder
    implements
        Builder<CollaborationResourcesRenameCollectionResponseApplicationJson,
            CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder>,
        CollaborationResourcesRenameCollectionResponseApplicationJsonInterfaceBuilder {
  _$CollaborationResourcesRenameCollectionResponseApplicationJson? _$v;

  CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder? _ocs;
  CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder();
  set ocs(covariant CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder();

  CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesRenameCollectionResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesRenameCollectionResponseApplicationJson;
  }

  @override
  void update(void Function(CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJson build() => _build();

  _$CollaborationResourcesRenameCollectionResponseApplicationJson _build() {
    _$CollaborationResourcesRenameCollectionResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$CollaborationResourcesRenameCollectionResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesRenameCollectionResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesAddResourceResponseApplicationJson_OcsInterfaceBuilder {
  void replace(CollaborationResourcesAddResourceResponseApplicationJson_OcsInterface other);
  void update(void Function(CollaborationResourcesAddResourceResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  CollectionBuilder get data;
  set data(CollectionBuilder? data);
}

class _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs
    extends CollaborationResourcesAddResourceResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Collection data;

  factory _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs(
          [void Function(CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder)? updates]) =>
      (CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'CollaborationResourcesAddResourceResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'CollaborationResourcesAddResourceResponseApplicationJson_Ocs', 'data');
  }

  @override
  CollaborationResourcesAddResourceResponseApplicationJson_Ocs rebuild(
          void Function(CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder toBuilder() =>
      CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesAddResourceResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesAddResourceResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder
    implements
        Builder<CollaborationResourcesAddResourceResponseApplicationJson_Ocs,
            CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder>,
        CollaborationResourcesAddResourceResponseApplicationJson_OcsInterfaceBuilder {
  _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  CollectionBuilder? _data;
  CollectionBuilder get data => _$this._data ??= CollectionBuilder();
  set data(covariant CollectionBuilder? data) => _$this._data = data;

  CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder();

  CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesAddResourceResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesAddResourceResponseApplicationJson_Ocs build() => _build();

  _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs _build() {
    _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesAddResourceResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesAddResourceResponseApplicationJsonInterfaceBuilder {
  void replace(CollaborationResourcesAddResourceResponseApplicationJsonInterface other);
  void update(void Function(CollaborationResourcesAddResourceResponseApplicationJsonInterfaceBuilder) updates);
  CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder get ocs;
  set ocs(CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder? ocs);
}

class _$CollaborationResourcesAddResourceResponseApplicationJson
    extends CollaborationResourcesAddResourceResponseApplicationJson {
  @override
  final CollaborationResourcesAddResourceResponseApplicationJson_Ocs ocs;

  factory _$CollaborationResourcesAddResourceResponseApplicationJson(
          [void Function(CollaborationResourcesAddResourceResponseApplicationJsonBuilder)? updates]) =>
      (CollaborationResourcesAddResourceResponseApplicationJsonBuilder()..update(updates))._build();

  _$CollaborationResourcesAddResourceResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'CollaborationResourcesAddResourceResponseApplicationJson', 'ocs');
  }

  @override
  CollaborationResourcesAddResourceResponseApplicationJson rebuild(
          void Function(CollaborationResourcesAddResourceResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesAddResourceResponseApplicationJsonBuilder toBuilder() =>
      CollaborationResourcesAddResourceResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesAddResourceResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesAddResourceResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class CollaborationResourcesAddResourceResponseApplicationJsonBuilder
    implements
        Builder<CollaborationResourcesAddResourceResponseApplicationJson,
            CollaborationResourcesAddResourceResponseApplicationJsonBuilder>,
        CollaborationResourcesAddResourceResponseApplicationJsonInterfaceBuilder {
  _$CollaborationResourcesAddResourceResponseApplicationJson? _$v;

  CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder? _ocs;
  CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder();
  set ocs(covariant CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  CollaborationResourcesAddResourceResponseApplicationJsonBuilder();

  CollaborationResourcesAddResourceResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesAddResourceResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesAddResourceResponseApplicationJson;
  }

  @override
  void update(void Function(CollaborationResourcesAddResourceResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesAddResourceResponseApplicationJson build() => _build();

  _$CollaborationResourcesAddResourceResponseApplicationJson _build() {
    _$CollaborationResourcesAddResourceResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$CollaborationResourcesAddResourceResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesAddResourceResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterfaceBuilder {
  void replace(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface other);
  void update(void Function(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  CollectionBuilder get data;
  set data(CollectionBuilder? data);
}

class _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs
    extends CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Collection data;

  factory _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs(
          [void Function(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder)? updates]) =>
      (CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs', 'data');
  }

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs rebuild(
          void Function(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder toBuilder() =>
      CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder
    implements
        Builder<CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs,
            CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder>,
        CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterfaceBuilder {
  _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  CollectionBuilder? _data;
  CollectionBuilder get data => _$this._data ??= CollectionBuilder();
  set data(covariant CollectionBuilder? data) => _$this._data = data;

  CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder();

  CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs build() => _build();

  _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs _build() {
    _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesRemoveResourceResponseApplicationJsonInterfaceBuilder {
  void replace(CollaborationResourcesRemoveResourceResponseApplicationJsonInterface other);
  void update(void Function(CollaborationResourcesRemoveResourceResponseApplicationJsonInterfaceBuilder) updates);
  CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder get ocs;
  set ocs(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder? ocs);
}

class _$CollaborationResourcesRemoveResourceResponseApplicationJson
    extends CollaborationResourcesRemoveResourceResponseApplicationJson {
  @override
  final CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs ocs;

  factory _$CollaborationResourcesRemoveResourceResponseApplicationJson(
          [void Function(CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder)? updates]) =>
      (CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder()..update(updates))._build();

  _$CollaborationResourcesRemoveResourceResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'CollaborationResourcesRemoveResourceResponseApplicationJson', 'ocs');
  }

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJson rebuild(
          void Function(CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder toBuilder() =>
      CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesRemoveResourceResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesRemoveResourceResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder
    implements
        Builder<CollaborationResourcesRemoveResourceResponseApplicationJson,
            CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder>,
        CollaborationResourcesRemoveResourceResponseApplicationJsonInterfaceBuilder {
  _$CollaborationResourcesRemoveResourceResponseApplicationJson? _$v;

  CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder? _ocs;
  CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder();
  set ocs(covariant CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder();

  CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesRemoveResourceResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesRemoveResourceResponseApplicationJson;
  }

  @override
  void update(void Function(CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJson build() => _build();

  _$CollaborationResourcesRemoveResourceResponseApplicationJson _build() {
    _$CollaborationResourcesRemoveResourceResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$CollaborationResourcesRemoveResourceResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesRemoveResourceResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterfaceBuilder {
  void replace(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface other);
  void update(
      void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<Collection> get data;
  set data(ListBuilder<Collection>? data);
}

class _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs
    extends CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<Collection> data;

  factory _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs(
          [void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder)? updates]) =>
      (CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs._(
      {required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs', 'data');
  }

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs rebuild(
          void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder toBuilder() =>
      CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder
    implements
        Builder<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs,
            CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder>,
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterfaceBuilder {
  _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<Collection>? _data;
  ListBuilder<Collection> get data => _$this._data ??= ListBuilder<Collection>();
  set data(covariant ListBuilder<Collection>? data) => _$this._data = data;

  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder();

  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs;
  }

  @override
  void update(
      void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs build() => _build();

  _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs _build() {
    _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs._(
              meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterfaceBuilder {
  void replace(CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface other);
  void update(
      void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterfaceBuilder) updates);
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder get ocs;
  set ocs(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder? ocs);
}

class _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson
    extends CollaborationResourcesGetCollectionsByResourceResponseApplicationJson {
  @override
  final CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs ocs;

  factory _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson(
          [void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder)? updates]) =>
      (CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder()..update(updates))._build();

  _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ocs, r'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson', 'ocs');
  }

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson rebuild(
          void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder toBuilder() =>
      CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesGetCollectionsByResourceResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder
    implements
        Builder<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson,
            CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder>,
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterfaceBuilder {
  _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson? _$v;

  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder? _ocs;
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder();
  set ocs(covariant CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder? ocs) =>
      _$this._ocs = ocs;

  CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder();

  CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesGetCollectionsByResourceResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson;
  }

  @override
  void update(void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson build() => _build();

  _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson _build() {
    _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterfaceBuilder {
  void replace(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface other);
  void update(
      void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterfaceBuilder)
          updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  CollectionBuilder get data;
  set data(CollectionBuilder? data);
}

class _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs
    extends CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Collection data;

  factory _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs(
          [void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder)?
              updates]) =>
      (CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs._(
      {required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs', 'data');
  }

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs rebuild(
          void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder toBuilder() =>
      CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder
    implements
        Builder<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs,
            CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder>,
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterfaceBuilder {
  _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  CollectionBuilder? _data;
  CollectionBuilder get data => _$this._data ??= CollectionBuilder();
  set data(covariant CollectionBuilder? data) => _$this._data = data;

  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder();

  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs;
  }

  @override
  void update(
      void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs build() => _build();

  _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs _build() {
    _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs._(
              meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterfaceBuilder {
  void replace(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface other);
  void update(
      void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterfaceBuilder) updates);
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder get ocs;
  set ocs(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder? ocs);
}

class _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson
    extends CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson {
  @override
  final CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs ocs;

  factory _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson(
          [void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder)? updates]) =>
      (CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder()..update(updates))._build();

  _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ocs, r'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson', 'ocs');
  }

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson rebuild(
          void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder toBuilder() =>
      CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder
    implements
        Builder<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson,
            CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder>,
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterfaceBuilder {
  _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson? _$v;

  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder? _ocs;
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder();
  set ocs(covariant CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder? ocs) =>
      _$this._ocs = ocs;

  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder();

  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson;
  }

  @override
  void update(void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson build() => _build();

  _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson _build() {
    _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ContactsActionInterfaceBuilder {
  void replace(ContactsActionInterface other);
  void update(void Function(ContactsActionInterfaceBuilder) updates);
  String? get title;
  set title(String? title);

  String? get icon;
  set icon(String? icon);

  String? get hyperlink;
  set hyperlink(String? hyperlink);

  String? get appId;
  set appId(String? appId);
}

class _$ContactsAction extends ContactsAction {
  @override
  final String title;
  @override
  final String icon;
  @override
  final String hyperlink;
  @override
  final String appId;

  factory _$ContactsAction([void Function(ContactsActionBuilder)? updates]) =>
      (ContactsActionBuilder()..update(updates))._build();

  _$ContactsAction._({required this.title, required this.icon, required this.hyperlink, required this.appId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'ContactsAction', 'title');
    BuiltValueNullFieldError.checkNotNull(icon, r'ContactsAction', 'icon');
    BuiltValueNullFieldError.checkNotNull(hyperlink, r'ContactsAction', 'hyperlink');
    BuiltValueNullFieldError.checkNotNull(appId, r'ContactsAction', 'appId');
  }

  @override
  ContactsAction rebuild(void Function(ContactsActionBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ContactsActionBuilder toBuilder() => ContactsActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsAction &&
        title == other.title &&
        icon == other.icon &&
        hyperlink == other.hyperlink &&
        appId == other.appId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, hyperlink.hashCode);
    _$hash = $jc(_$hash, appId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactsAction')
          ..add('title', title)
          ..add('icon', icon)
          ..add('hyperlink', hyperlink)
          ..add('appId', appId))
        .toString();
  }
}

class ContactsActionBuilder implements Builder<ContactsAction, ContactsActionBuilder>, ContactsActionInterfaceBuilder {
  _$ContactsAction? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  String? _hyperlink;
  String? get hyperlink => _$this._hyperlink;
  set hyperlink(covariant String? hyperlink) => _$this._hyperlink = hyperlink;

  String? _appId;
  String? get appId => _$this._appId;
  set appId(covariant String? appId) => _$this._appId = appId;

  ContactsActionBuilder();

  ContactsActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _icon = $v.icon;
      _hyperlink = $v.hyperlink;
      _appId = $v.appId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ContactsAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactsAction;
  }

  @override
  void update(void Function(ContactsActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactsAction build() => _build();

  _$ContactsAction _build() {
    final _$result = _$v ??
        _$ContactsAction._(
            title: BuiltValueNullFieldError.checkNotNull(title, r'ContactsAction', 'title'),
            icon: BuiltValueNullFieldError.checkNotNull(icon, r'ContactsAction', 'icon'),
            hyperlink: BuiltValueNullFieldError.checkNotNull(hyperlink, r'ContactsAction', 'hyperlink'),
            appId: BuiltValueNullFieldError.checkNotNull(appId, r'ContactsAction', 'appId'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class HoverCardGetUserResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(HoverCardGetUserResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(HoverCardGetUserResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get userId;
  set userId(String? userId);

  String? get displayName;
  set displayName(String? displayName);

  ListBuilder<ContactsAction> get actions;
  set actions(ListBuilder<ContactsAction>? actions);
}

class _$HoverCardGetUserResponseApplicationJson_Ocs_Data extends HoverCardGetUserResponseApplicationJson_Ocs_Data {
  @override
  final String userId;
  @override
  final String displayName;
  @override
  final BuiltList<ContactsAction> actions;

  factory _$HoverCardGetUserResponseApplicationJson_Ocs_Data(
          [void Function(HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$HoverCardGetUserResponseApplicationJson_Ocs_Data._(
      {required this.userId, required this.displayName, required this.actions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'HoverCardGetUserResponseApplicationJson_Ocs_Data', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'HoverCardGetUserResponseApplicationJson_Ocs_Data', 'displayName');
    BuiltValueNullFieldError.checkNotNull(actions, r'HoverCardGetUserResponseApplicationJson_Ocs_Data', 'actions');
  }

  @override
  HoverCardGetUserResponseApplicationJson_Ocs_Data rebuild(
          void Function(HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HoverCardGetUserResponseApplicationJson_Ocs_Data &&
        userId == other.userId &&
        displayName == other.displayName &&
        actions == other.actions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, actions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HoverCardGetUserResponseApplicationJson_Ocs_Data')
          ..add('userId', userId)
          ..add('displayName', displayName)
          ..add('actions', actions))
        .toString();
  }
}

class HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<HoverCardGetUserResponseApplicationJson_Ocs_Data,
            HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder>,
        HoverCardGetUserResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$HoverCardGetUserResponseApplicationJson_Ocs_Data? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(covariant String? displayName) => _$this._displayName = displayName;

  ListBuilder<ContactsAction>? _actions;
  ListBuilder<ContactsAction> get actions => _$this._actions ??= ListBuilder<ContactsAction>();
  set actions(covariant ListBuilder<ContactsAction>? actions) => _$this._actions = actions;

  HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder();

  HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _displayName = $v.displayName;
      _actions = $v.actions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant HoverCardGetUserResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HoverCardGetUserResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HoverCardGetUserResponseApplicationJson_Ocs_Data build() => _build();

  _$HoverCardGetUserResponseApplicationJson_Ocs_Data _build() {
    _$HoverCardGetUserResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$HoverCardGetUserResponseApplicationJson_Ocs_Data._(
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'HoverCardGetUserResponseApplicationJson_Ocs_Data', 'userId'),
              displayName: BuiltValueNullFieldError.checkNotNull(
                  displayName, r'HoverCardGetUserResponseApplicationJson_Ocs_Data', 'displayName'),
              actions: actions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actions';
        actions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'HoverCardGetUserResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class HoverCardGetUserResponseApplicationJson_OcsInterfaceBuilder {
  void replace(HoverCardGetUserResponseApplicationJson_OcsInterface other);
  void update(void Function(HoverCardGetUserResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder get data;
  set data(HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$HoverCardGetUserResponseApplicationJson_Ocs extends HoverCardGetUserResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final HoverCardGetUserResponseApplicationJson_Ocs_Data data;

  factory _$HoverCardGetUserResponseApplicationJson_Ocs(
          [void Function(HoverCardGetUserResponseApplicationJson_OcsBuilder)? updates]) =>
      (HoverCardGetUserResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$HoverCardGetUserResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'HoverCardGetUserResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'HoverCardGetUserResponseApplicationJson_Ocs', 'data');
  }

  @override
  HoverCardGetUserResponseApplicationJson_Ocs rebuild(
          void Function(HoverCardGetUserResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HoverCardGetUserResponseApplicationJson_OcsBuilder toBuilder() =>
      HoverCardGetUserResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HoverCardGetUserResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'HoverCardGetUserResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class HoverCardGetUserResponseApplicationJson_OcsBuilder
    implements
        Builder<HoverCardGetUserResponseApplicationJson_Ocs, HoverCardGetUserResponseApplicationJson_OcsBuilder>,
        HoverCardGetUserResponseApplicationJson_OcsInterfaceBuilder {
  _$HoverCardGetUserResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder? _data;
  HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  HoverCardGetUserResponseApplicationJson_OcsBuilder();

  HoverCardGetUserResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant HoverCardGetUserResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HoverCardGetUserResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(HoverCardGetUserResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HoverCardGetUserResponseApplicationJson_Ocs build() => _build();

  _$HoverCardGetUserResponseApplicationJson_Ocs _build() {
    _$HoverCardGetUserResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$HoverCardGetUserResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'HoverCardGetUserResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class HoverCardGetUserResponseApplicationJsonInterfaceBuilder {
  void replace(HoverCardGetUserResponseApplicationJsonInterface other);
  void update(void Function(HoverCardGetUserResponseApplicationJsonInterfaceBuilder) updates);
  HoverCardGetUserResponseApplicationJson_OcsBuilder get ocs;
  set ocs(HoverCardGetUserResponseApplicationJson_OcsBuilder? ocs);
}

class _$HoverCardGetUserResponseApplicationJson extends HoverCardGetUserResponseApplicationJson {
  @override
  final HoverCardGetUserResponseApplicationJson_Ocs ocs;

  factory _$HoverCardGetUserResponseApplicationJson(
          [void Function(HoverCardGetUserResponseApplicationJsonBuilder)? updates]) =>
      (HoverCardGetUserResponseApplicationJsonBuilder()..update(updates))._build();

  _$HoverCardGetUserResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'HoverCardGetUserResponseApplicationJson', 'ocs');
  }

  @override
  HoverCardGetUserResponseApplicationJson rebuild(
          void Function(HoverCardGetUserResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HoverCardGetUserResponseApplicationJsonBuilder toBuilder() =>
      HoverCardGetUserResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HoverCardGetUserResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'HoverCardGetUserResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class HoverCardGetUserResponseApplicationJsonBuilder
    implements
        Builder<HoverCardGetUserResponseApplicationJson, HoverCardGetUserResponseApplicationJsonBuilder>,
        HoverCardGetUserResponseApplicationJsonInterfaceBuilder {
  _$HoverCardGetUserResponseApplicationJson? _$v;

  HoverCardGetUserResponseApplicationJson_OcsBuilder? _ocs;
  HoverCardGetUserResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= HoverCardGetUserResponseApplicationJson_OcsBuilder();
  set ocs(covariant HoverCardGetUserResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  HoverCardGetUserResponseApplicationJsonBuilder();

  HoverCardGetUserResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant HoverCardGetUserResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HoverCardGetUserResponseApplicationJson;
  }

  @override
  void update(void Function(HoverCardGetUserResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HoverCardGetUserResponseApplicationJson build() => _build();

  _$HoverCardGetUserResponseApplicationJson _build() {
    _$HoverCardGetUserResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$HoverCardGetUserResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'HoverCardGetUserResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NavigationEntry_OrderInterfaceBuilder {
  void replace(NavigationEntry_OrderInterface other);
  void update(void Function(NavigationEntry_OrderInterfaceBuilder) updates);
  int? get $int;
  set $int(int? $int);

  String? get string;
  set string(String? string);
}

class _$NavigationEntry_Order extends NavigationEntry_Order {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final String? string;

  factory _$NavigationEntry_Order([void Function(NavigationEntry_OrderBuilder)? updates]) =>
      (NavigationEntry_OrderBuilder()..update(updates))._build();

  _$NavigationEntry_Order._({required this.data, this.$int, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NavigationEntry_Order', 'data');
  }

  @override
  NavigationEntry_Order rebuild(void Function(NavigationEntry_OrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationEntry_OrderBuilder toBuilder() => NavigationEntry_OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationEntry_Order && data == other.data && $int == other.$int && string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NavigationEntry_Order')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('string', string))
        .toString();
  }
}

class NavigationEntry_OrderBuilder
    implements Builder<NavigationEntry_Order, NavigationEntry_OrderBuilder>, NavigationEntry_OrderInterfaceBuilder {
  _$NavigationEntry_Order? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(covariant int? $int) => _$this._$int = $int;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  NavigationEntry_OrderBuilder();

  NavigationEntry_OrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$int = $v.$int;
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigationEntry_Order other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationEntry_Order;
  }

  @override
  void update(void Function(NavigationEntry_OrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationEntry_Order build() => _build();

  _$NavigationEntry_Order _build() {
    NavigationEntry_Order._validate(this);
    final _$result = _$v ??
        _$NavigationEntry_Order._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'NavigationEntry_Order', 'data'),
            $int: $int,
            string: string);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NavigationEntryInterfaceBuilder {
  void replace(NavigationEntryInterface other);
  void update(void Function(NavigationEntryInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  NavigationEntry_OrderBuilder get order;
  set order(NavigationEntry_OrderBuilder? order);

  String? get href;
  set href(String? href);

  String? get icon;
  set icon(String? icon);

  String? get type;
  set type(String? type);

  String? get name;
  set name(String? name);

  bool? get active;
  set active(bool? active);

  String? get classes;
  set classes(String? classes);

  int? get unread;
  set unread(int? unread);
}

class _$NavigationEntry extends NavigationEntry {
  @override
  final String id;
  @override
  final NavigationEntry_Order order;
  @override
  final String href;
  @override
  final String icon;
  @override
  final String type;
  @override
  final String name;
  @override
  final bool active;
  @override
  final String classes;
  @override
  final int unread;

  factory _$NavigationEntry([void Function(NavigationEntryBuilder)? updates]) =>
      (NavigationEntryBuilder()..update(updates))._build();

  _$NavigationEntry._(
      {required this.id,
      required this.order,
      required this.href,
      required this.icon,
      required this.type,
      required this.name,
      required this.active,
      required this.classes,
      required this.unread})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NavigationEntry', 'id');
    BuiltValueNullFieldError.checkNotNull(order, r'NavigationEntry', 'order');
    BuiltValueNullFieldError.checkNotNull(href, r'NavigationEntry', 'href');
    BuiltValueNullFieldError.checkNotNull(icon, r'NavigationEntry', 'icon');
    BuiltValueNullFieldError.checkNotNull(type, r'NavigationEntry', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'NavigationEntry', 'name');
    BuiltValueNullFieldError.checkNotNull(active, r'NavigationEntry', 'active');
    BuiltValueNullFieldError.checkNotNull(classes, r'NavigationEntry', 'classes');
    BuiltValueNullFieldError.checkNotNull(unread, r'NavigationEntry', 'unread');
  }

  @override
  NavigationEntry rebuild(void Function(NavigationEntryBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NavigationEntryBuilder toBuilder() => NavigationEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationEntry &&
        id == other.id &&
        order == other.order &&
        href == other.href &&
        icon == other.icon &&
        type == other.type &&
        name == other.name &&
        active == other.active &&
        classes == other.classes &&
        unread == other.unread;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, href.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, classes.hashCode);
    _$hash = $jc(_$hash, unread.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NavigationEntry')
          ..add('id', id)
          ..add('order', order)
          ..add('href', href)
          ..add('icon', icon)
          ..add('type', type)
          ..add('name', name)
          ..add('active', active)
          ..add('classes', classes)
          ..add('unread', unread))
        .toString();
  }
}

class NavigationEntryBuilder
    implements Builder<NavigationEntry, NavigationEntryBuilder>, NavigationEntryInterfaceBuilder {
  _$NavigationEntry? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  NavigationEntry_OrderBuilder? _order;
  NavigationEntry_OrderBuilder get order => _$this._order ??= NavigationEntry_OrderBuilder();
  set order(covariant NavigationEntry_OrderBuilder? order) => _$this._order = order;

  String? _href;
  String? get href => _$this._href;
  set href(covariant String? href) => _$this._href = href;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  bool? _active;
  bool? get active => _$this._active;
  set active(covariant bool? active) => _$this._active = active;

  String? _classes;
  String? get classes => _$this._classes;
  set classes(covariant String? classes) => _$this._classes = classes;

  int? _unread;
  int? get unread => _$this._unread;
  set unread(covariant int? unread) => _$this._unread = unread;

  NavigationEntryBuilder();

  NavigationEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _order = $v.order.toBuilder();
      _href = $v.href;
      _icon = $v.icon;
      _type = $v.type;
      _name = $v.name;
      _active = $v.active;
      _classes = $v.classes;
      _unread = $v.unread;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigationEntry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationEntry;
  }

  @override
  void update(void Function(NavigationEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationEntry build() => _build();

  _$NavigationEntry _build() {
    _$NavigationEntry _$result;
    try {
      _$result = _$v ??
          _$NavigationEntry._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NavigationEntry', 'id'),
              order: order.build(),
              href: BuiltValueNullFieldError.checkNotNull(href, r'NavigationEntry', 'href'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'NavigationEntry', 'icon'),
              type: BuiltValueNullFieldError.checkNotNull(type, r'NavigationEntry', 'type'),
              name: BuiltValueNullFieldError.checkNotNull(name, r'NavigationEntry', 'name'),
              active: BuiltValueNullFieldError.checkNotNull(active, r'NavigationEntry', 'active'),
              classes: BuiltValueNullFieldError.checkNotNull(classes, r'NavigationEntry', 'classes'),
              unread: BuiltValueNullFieldError.checkNotNull(unread, r'NavigationEntry', 'unread'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'order';
        order.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NavigationEntry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NavigationGetAppsNavigationResponseApplicationJson_OcsInterfaceBuilder {
  void replace(NavigationGetAppsNavigationResponseApplicationJson_OcsInterface other);
  void update(void Function(NavigationGetAppsNavigationResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<NavigationEntry> get data;
  set data(ListBuilder<NavigationEntry>? data);
}

class _$NavigationGetAppsNavigationResponseApplicationJson_Ocs
    extends NavigationGetAppsNavigationResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<NavigationEntry> data;

  factory _$NavigationGetAppsNavigationResponseApplicationJson_Ocs(
          [void Function(NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder)? updates]) =>
      (NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$NavigationGetAppsNavigationResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NavigationGetAppsNavigationResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NavigationGetAppsNavigationResponseApplicationJson_Ocs', 'data');
  }

  @override
  NavigationGetAppsNavigationResponseApplicationJson_Ocs rebuild(
          void Function(NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder toBuilder() =>
      NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationGetAppsNavigationResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'NavigationGetAppsNavigationResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder
    implements
        Builder<NavigationGetAppsNavigationResponseApplicationJson_Ocs,
            NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder>,
        NavigationGetAppsNavigationResponseApplicationJson_OcsInterfaceBuilder {
  _$NavigationGetAppsNavigationResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NavigationEntry>? _data;
  ListBuilder<NavigationEntry> get data => _$this._data ??= ListBuilder<NavigationEntry>();
  set data(covariant ListBuilder<NavigationEntry>? data) => _$this._data = data;

  NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder();

  NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigationGetAppsNavigationResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationGetAppsNavigationResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationGetAppsNavigationResponseApplicationJson_Ocs build() => _build();

  _$NavigationGetAppsNavigationResponseApplicationJson_Ocs _build() {
    _$NavigationGetAppsNavigationResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$NavigationGetAppsNavigationResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NavigationGetAppsNavigationResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NavigationGetAppsNavigationResponseApplicationJsonInterfaceBuilder {
  void replace(NavigationGetAppsNavigationResponseApplicationJsonInterface other);
  void update(void Function(NavigationGetAppsNavigationResponseApplicationJsonInterfaceBuilder) updates);
  NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder get ocs;
  set ocs(NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder? ocs);
}

class _$NavigationGetAppsNavigationResponseApplicationJson extends NavigationGetAppsNavigationResponseApplicationJson {
  @override
  final NavigationGetAppsNavigationResponseApplicationJson_Ocs ocs;

  factory _$NavigationGetAppsNavigationResponseApplicationJson(
          [void Function(NavigationGetAppsNavigationResponseApplicationJsonBuilder)? updates]) =>
      (NavigationGetAppsNavigationResponseApplicationJsonBuilder()..update(updates))._build();

  _$NavigationGetAppsNavigationResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NavigationGetAppsNavigationResponseApplicationJson', 'ocs');
  }

  @override
  NavigationGetAppsNavigationResponseApplicationJson rebuild(
          void Function(NavigationGetAppsNavigationResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationGetAppsNavigationResponseApplicationJsonBuilder toBuilder() =>
      NavigationGetAppsNavigationResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationGetAppsNavigationResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'NavigationGetAppsNavigationResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class NavigationGetAppsNavigationResponseApplicationJsonBuilder
    implements
        Builder<NavigationGetAppsNavigationResponseApplicationJson,
            NavigationGetAppsNavigationResponseApplicationJsonBuilder>,
        NavigationGetAppsNavigationResponseApplicationJsonInterfaceBuilder {
  _$NavigationGetAppsNavigationResponseApplicationJson? _$v;

  NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder? _ocs;
  NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder();
  set ocs(covariant NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  NavigationGetAppsNavigationResponseApplicationJsonBuilder();

  NavigationGetAppsNavigationResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigationGetAppsNavigationResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationGetAppsNavigationResponseApplicationJson;
  }

  @override
  void update(void Function(NavigationGetAppsNavigationResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationGetAppsNavigationResponseApplicationJson build() => _build();

  _$NavigationGetAppsNavigationResponseApplicationJson _build() {
    _$NavigationGetAppsNavigationResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$NavigationGetAppsNavigationResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NavigationGetAppsNavigationResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NavigationGetSettingsNavigationResponseApplicationJson_OcsInterfaceBuilder {
  void replace(NavigationGetSettingsNavigationResponseApplicationJson_OcsInterface other);
  void update(void Function(NavigationGetSettingsNavigationResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<NavigationEntry> get data;
  set data(ListBuilder<NavigationEntry>? data);
}

class _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs
    extends NavigationGetSettingsNavigationResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<NavigationEntry> data;

  factory _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs(
          [void Function(NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder)? updates]) =>
      (NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NavigationGetSettingsNavigationResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NavigationGetSettingsNavigationResponseApplicationJson_Ocs', 'data');
  }

  @override
  NavigationGetSettingsNavigationResponseApplicationJson_Ocs rebuild(
          void Function(NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder toBuilder() =>
      NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationGetSettingsNavigationResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'NavigationGetSettingsNavigationResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder
    implements
        Builder<NavigationGetSettingsNavigationResponseApplicationJson_Ocs,
            NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder>,
        NavigationGetSettingsNavigationResponseApplicationJson_OcsInterfaceBuilder {
  _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NavigationEntry>? _data;
  ListBuilder<NavigationEntry> get data => _$this._data ??= ListBuilder<NavigationEntry>();
  set data(covariant ListBuilder<NavigationEntry>? data) => _$this._data = data;

  NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder();

  NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigationGetSettingsNavigationResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationGetSettingsNavigationResponseApplicationJson_Ocs build() => _build();

  _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs _build() {
    _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NavigationGetSettingsNavigationResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NavigationGetSettingsNavigationResponseApplicationJsonInterfaceBuilder {
  void replace(NavigationGetSettingsNavigationResponseApplicationJsonInterface other);
  void update(void Function(NavigationGetSettingsNavigationResponseApplicationJsonInterfaceBuilder) updates);
  NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder get ocs;
  set ocs(NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder? ocs);
}

class _$NavigationGetSettingsNavigationResponseApplicationJson
    extends NavigationGetSettingsNavigationResponseApplicationJson {
  @override
  final NavigationGetSettingsNavigationResponseApplicationJson_Ocs ocs;

  factory _$NavigationGetSettingsNavigationResponseApplicationJson(
          [void Function(NavigationGetSettingsNavigationResponseApplicationJsonBuilder)? updates]) =>
      (NavigationGetSettingsNavigationResponseApplicationJsonBuilder()..update(updates))._build();

  _$NavigationGetSettingsNavigationResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NavigationGetSettingsNavigationResponseApplicationJson', 'ocs');
  }

  @override
  NavigationGetSettingsNavigationResponseApplicationJson rebuild(
          void Function(NavigationGetSettingsNavigationResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationGetSettingsNavigationResponseApplicationJsonBuilder toBuilder() =>
      NavigationGetSettingsNavigationResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationGetSettingsNavigationResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'NavigationGetSettingsNavigationResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class NavigationGetSettingsNavigationResponseApplicationJsonBuilder
    implements
        Builder<NavigationGetSettingsNavigationResponseApplicationJson,
            NavigationGetSettingsNavigationResponseApplicationJsonBuilder>,
        NavigationGetSettingsNavigationResponseApplicationJsonInterfaceBuilder {
  _$NavigationGetSettingsNavigationResponseApplicationJson? _$v;

  NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder? _ocs;
  NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder();
  set ocs(covariant NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  NavigationGetSettingsNavigationResponseApplicationJsonBuilder();

  NavigationGetSettingsNavigationResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NavigationGetSettingsNavigationResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationGetSettingsNavigationResponseApplicationJson;
  }

  @override
  void update(void Function(NavigationGetSettingsNavigationResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationGetSettingsNavigationResponseApplicationJson build() => _build();

  _$NavigationGetSettingsNavigationResponseApplicationJson _build() {
    _$NavigationGetSettingsNavigationResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$NavigationGetSettingsNavigationResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NavigationGetSettingsNavigationResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcmOcmDiscoveryHeadersInterfaceBuilder {
  void replace(OcmOcmDiscoveryHeadersInterface other);
  void update(void Function(OcmOcmDiscoveryHeadersInterfaceBuilder) updates);
  bool? get xNextcloudOcmProviders;
  set xNextcloudOcmProviders(bool? xNextcloudOcmProviders);
}

class _$OcmOcmDiscoveryHeaders extends OcmOcmDiscoveryHeaders {
  @override
  final bool? xNextcloudOcmProviders;

  factory _$OcmOcmDiscoveryHeaders([void Function(OcmOcmDiscoveryHeadersBuilder)? updates]) =>
      (OcmOcmDiscoveryHeadersBuilder()..update(updates))._build();

  _$OcmOcmDiscoveryHeaders._({this.xNextcloudOcmProviders}) : super._();

  @override
  OcmOcmDiscoveryHeaders rebuild(void Function(OcmOcmDiscoveryHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcmOcmDiscoveryHeadersBuilder toBuilder() => OcmOcmDiscoveryHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcmOcmDiscoveryHeaders && xNextcloudOcmProviders == other.xNextcloudOcmProviders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, xNextcloudOcmProviders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OcmOcmDiscoveryHeaders')
          ..add('xNextcloudOcmProviders', xNextcloudOcmProviders))
        .toString();
  }
}

class OcmOcmDiscoveryHeadersBuilder
    implements Builder<OcmOcmDiscoveryHeaders, OcmOcmDiscoveryHeadersBuilder>, OcmOcmDiscoveryHeadersInterfaceBuilder {
  _$OcmOcmDiscoveryHeaders? _$v;

  bool? _xNextcloudOcmProviders;
  bool? get xNextcloudOcmProviders => _$this._xNextcloudOcmProviders;
  set xNextcloudOcmProviders(covariant bool? xNextcloudOcmProviders) =>
      _$this._xNextcloudOcmProviders = xNextcloudOcmProviders;

  OcmOcmDiscoveryHeadersBuilder();

  OcmOcmDiscoveryHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _xNextcloudOcmProviders = $v.xNextcloudOcmProviders;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcmOcmDiscoveryHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcmOcmDiscoveryHeaders;
  }

  @override
  void update(void Function(OcmOcmDiscoveryHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcmOcmDiscoveryHeaders build() => _build();

  _$OcmOcmDiscoveryHeaders _build() {
    final _$result = _$v ?? _$OcmOcmDiscoveryHeaders._(xNextcloudOcmProviders: xNextcloudOcmProviders);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterfaceBuilder {
  void replace(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface other);
  void update(void Function(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterfaceBuilder) updates);
  String? get webdav;
  set webdav(String? webdav);
}

class _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols
    extends OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols {
  @override
  final String webdav;

  factory _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols(
          [void Function(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder)? updates]) =>
      (OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder()..update(updates))._build();

  _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols._({required this.webdav}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        webdav, r'OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols', 'webdav');
  }

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols rebuild(
          void Function(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder toBuilder() =>
      OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols && webdav == other.webdav;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, webdav.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols')
          ..add('webdav', webdav))
        .toString();
  }
}

class OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder
    implements
        Builder<OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols,
            OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder>,
        OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterfaceBuilder {
  _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols? _$v;

  String? _webdav;
  String? get webdav => _$this._webdav;
  set webdav(covariant String? webdav) => _$this._webdav = webdav;

  OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder();

  OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _webdav = $v.webdav;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols;
  }

  @override
  void update(void Function(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols build() => _build();

  _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols _build() {
    final _$result = _$v ??
        _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols._(
            webdav: BuiltValueNullFieldError.checkNotNull(
                webdav, r'OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols', 'webdav'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcmDiscoveryResponseApplicationJson_ResourceTypesInterfaceBuilder {
  void replace(OcmDiscoveryResponseApplicationJson_ResourceTypesInterface other);
  void update(void Function(OcmDiscoveryResponseApplicationJson_ResourceTypesInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  ListBuilder<String> get shareTypes;
  set shareTypes(ListBuilder<String>? shareTypes);

  OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder get protocols;
  set protocols(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder? protocols);
}

class _$OcmDiscoveryResponseApplicationJson_ResourceTypes extends OcmDiscoveryResponseApplicationJson_ResourceTypes {
  @override
  final String name;
  @override
  final BuiltList<String> shareTypes;
  @override
  final OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols protocols;

  factory _$OcmDiscoveryResponseApplicationJson_ResourceTypes(
          [void Function(OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder)? updates]) =>
      (OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder()..update(updates))._build();

  _$OcmDiscoveryResponseApplicationJson_ResourceTypes._(
      {required this.name, required this.shareTypes, required this.protocols})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OcmDiscoveryResponseApplicationJson_ResourceTypes', 'name');
    BuiltValueNullFieldError.checkNotNull(
        shareTypes, r'OcmDiscoveryResponseApplicationJson_ResourceTypes', 'shareTypes');
    BuiltValueNullFieldError.checkNotNull(protocols, r'OcmDiscoveryResponseApplicationJson_ResourceTypes', 'protocols');
  }

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypes rebuild(
          void Function(OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder toBuilder() =>
      OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcmDiscoveryResponseApplicationJson_ResourceTypes &&
        name == other.name &&
        shareTypes == other.shareTypes &&
        protocols == other.protocols;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, shareTypes.hashCode);
    _$hash = $jc(_$hash, protocols.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OcmDiscoveryResponseApplicationJson_ResourceTypes')
          ..add('name', name)
          ..add('shareTypes', shareTypes)
          ..add('protocols', protocols))
        .toString();
  }
}

class OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder
    implements
        Builder<OcmDiscoveryResponseApplicationJson_ResourceTypes,
            OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder>,
        OcmDiscoveryResponseApplicationJson_ResourceTypesInterfaceBuilder {
  _$OcmDiscoveryResponseApplicationJson_ResourceTypes? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  ListBuilder<String>? _shareTypes;
  ListBuilder<String> get shareTypes => _$this._shareTypes ??= ListBuilder<String>();
  set shareTypes(covariant ListBuilder<String>? shareTypes) => _$this._shareTypes = shareTypes;

  OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder? _protocols;
  OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder get protocols =>
      _$this._protocols ??= OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder();
  set protocols(covariant OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder? protocols) =>
      _$this._protocols = protocols;

  OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder();

  OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _shareTypes = $v.shareTypes.toBuilder();
      _protocols = $v.protocols.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcmDiscoveryResponseApplicationJson_ResourceTypes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcmDiscoveryResponseApplicationJson_ResourceTypes;
  }

  @override
  void update(void Function(OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypes build() => _build();

  _$OcmDiscoveryResponseApplicationJson_ResourceTypes _build() {
    _$OcmDiscoveryResponseApplicationJson_ResourceTypes _$result;
    try {
      _$result = _$v ??
          _$OcmDiscoveryResponseApplicationJson_ResourceTypes._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'OcmDiscoveryResponseApplicationJson_ResourceTypes', 'name'),
              shareTypes: shareTypes.build(),
              protocols: protocols.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shareTypes';
        shareTypes.build();
        _$failedField = 'protocols';
        protocols.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OcmDiscoveryResponseApplicationJson_ResourceTypes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcmDiscoveryResponseApplicationJsonInterfaceBuilder {
  void replace(OcmDiscoveryResponseApplicationJsonInterface other);
  void update(void Function(OcmDiscoveryResponseApplicationJsonInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  String? get apiVersion;
  set apiVersion(String? apiVersion);

  String? get endPoint;
  set endPoint(String? endPoint);

  ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes> get resourceTypes;
  set resourceTypes(ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes>? resourceTypes);
}

class _$OcmDiscoveryResponseApplicationJson extends OcmDiscoveryResponseApplicationJson {
  @override
  final bool enabled;
  @override
  final String apiVersion;
  @override
  final String endPoint;
  @override
  final BuiltList<OcmDiscoveryResponseApplicationJson_ResourceTypes> resourceTypes;

  factory _$OcmDiscoveryResponseApplicationJson([void Function(OcmDiscoveryResponseApplicationJsonBuilder)? updates]) =>
      (OcmDiscoveryResponseApplicationJsonBuilder()..update(updates))._build();

  _$OcmDiscoveryResponseApplicationJson._(
      {required this.enabled, required this.apiVersion, required this.endPoint, required this.resourceTypes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'OcmDiscoveryResponseApplicationJson', 'enabled');
    BuiltValueNullFieldError.checkNotNull(apiVersion, r'OcmDiscoveryResponseApplicationJson', 'apiVersion');
    BuiltValueNullFieldError.checkNotNull(endPoint, r'OcmDiscoveryResponseApplicationJson', 'endPoint');
    BuiltValueNullFieldError.checkNotNull(resourceTypes, r'OcmDiscoveryResponseApplicationJson', 'resourceTypes');
  }

  @override
  OcmDiscoveryResponseApplicationJson rebuild(void Function(OcmDiscoveryResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcmDiscoveryResponseApplicationJsonBuilder toBuilder() => OcmDiscoveryResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcmDiscoveryResponseApplicationJson &&
        enabled == other.enabled &&
        apiVersion == other.apiVersion &&
        endPoint == other.endPoint &&
        resourceTypes == other.resourceTypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, endPoint.hashCode);
    _$hash = $jc(_$hash, resourceTypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OcmDiscoveryResponseApplicationJson')
          ..add('enabled', enabled)
          ..add('apiVersion', apiVersion)
          ..add('endPoint', endPoint)
          ..add('resourceTypes', resourceTypes))
        .toString();
  }
}

class OcmDiscoveryResponseApplicationJsonBuilder
    implements
        Builder<OcmDiscoveryResponseApplicationJson, OcmDiscoveryResponseApplicationJsonBuilder>,
        OcmDiscoveryResponseApplicationJsonInterfaceBuilder {
  _$OcmDiscoveryResponseApplicationJson? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  String? _apiVersion;
  String? get apiVersion => _$this._apiVersion;
  set apiVersion(covariant String? apiVersion) => _$this._apiVersion = apiVersion;

  String? _endPoint;
  String? get endPoint => _$this._endPoint;
  set endPoint(covariant String? endPoint) => _$this._endPoint = endPoint;

  ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes>? _resourceTypes;
  ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes> get resourceTypes =>
      _$this._resourceTypes ??= ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes>();
  set resourceTypes(covariant ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes>? resourceTypes) =>
      _$this._resourceTypes = resourceTypes;

  OcmDiscoveryResponseApplicationJsonBuilder();

  OcmDiscoveryResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _apiVersion = $v.apiVersion;
      _endPoint = $v.endPoint;
      _resourceTypes = $v.resourceTypes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcmDiscoveryResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcmDiscoveryResponseApplicationJson;
  }

  @override
  void update(void Function(OcmDiscoveryResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcmDiscoveryResponseApplicationJson build() => _build();

  _$OcmDiscoveryResponseApplicationJson _build() {
    _$OcmDiscoveryResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          _$OcmDiscoveryResponseApplicationJson._(
              enabled:
                  BuiltValueNullFieldError.checkNotNull(enabled, r'OcmDiscoveryResponseApplicationJson', 'enabled'),
              apiVersion: BuiltValueNullFieldError.checkNotNull(
                  apiVersion, r'OcmDiscoveryResponseApplicationJson', 'apiVersion'),
              endPoint:
                  BuiltValueNullFieldError.checkNotNull(endPoint, r'OcmDiscoveryResponseApplicationJson', 'endPoint'),
              resourceTypes: resourceTypes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'resourceTypes';
        resourceTypes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OcmDiscoveryResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterfaceBuilder {
  void replace(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface other);
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterfaceBuilder) updates);
  int? get major;
  set major(int? major);

  int? get minor;
  set minor(int? minor);

  int? get micro;
  set micro(int? micro);

  String? get string;
  set string(String? string);

  String? get edition;
  set edition(String? edition);

  bool? get extendedSupport;
  set extendedSupport(bool? extendedSupport);
}

class _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version
    extends OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version {
  @override
  final int major;
  @override
  final int minor;
  @override
  final int micro;
  @override
  final String string;
  @override
  final String edition;
  @override
  final bool extendedSupport;

  factory _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version(
          [void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder)? updates]) =>
      (OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder()..update(updates))._build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version._(
      {required this.major,
      required this.minor,
      required this.micro,
      required this.string,
      required this.edition,
      required this.extendedSupport})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        major, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'major');
    BuiltValueNullFieldError.checkNotNull(
        minor, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'minor');
    BuiltValueNullFieldError.checkNotNull(
        micro, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'micro');
    BuiltValueNullFieldError.checkNotNull(
        string, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'string');
    BuiltValueNullFieldError.checkNotNull(
        edition, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'edition');
    BuiltValueNullFieldError.checkNotNull(
        extendedSupport, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'extendedSupport');
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version rebuild(
          void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder toBuilder() =>
      OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version &&
        major == other.major &&
        minor == other.minor &&
        micro == other.micro &&
        string == other.string &&
        edition == other.edition &&
        extendedSupport == other.extendedSupport;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, major.hashCode);
    _$hash = $jc(_$hash, minor.hashCode);
    _$hash = $jc(_$hash, micro.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, edition.hashCode);
    _$hash = $jc(_$hash, extendedSupport.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version')
          ..add('major', major)
          ..add('minor', minor)
          ..add('micro', micro)
          ..add('string', string)
          ..add('edition', edition)
          ..add('extendedSupport', extendedSupport))
        .toString();
  }
}

class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder
    implements
        Builder<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder>,
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterfaceBuilder {
  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version? _$v;

  int? _major;
  int? get major => _$this._major;
  set major(covariant int? major) => _$this._major = major;

  int? _minor;
  int? get minor => _$this._minor;
  set minor(covariant int? minor) => _$this._minor = minor;

  int? _micro;
  int? get micro => _$this._micro;
  set micro(covariant int? micro) => _$this._micro = micro;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  String? _edition;
  String? get edition => _$this._edition;
  set edition(covariant String? edition) => _$this._edition = edition;

  bool? _extendedSupport;
  bool? get extendedSupport => _$this._extendedSupport;
  set extendedSupport(covariant bool? extendedSupport) => _$this._extendedSupport = extendedSupport;

  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder();

  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _major = $v.major;
      _minor = $v.minor;
      _micro = $v.micro;
      _string = $v.string;
      _edition = $v.edition;
      _extendedSupport = $v.extendedSupport;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version;
  }

  @override
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version build() => _build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version _build() {
    final _$result = _$v ??
        _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version._(
            major: BuiltValueNullFieldError.checkNotNull(
                major, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'major'),
            minor: BuiltValueNullFieldError.checkNotNull(
                minor, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'minor'),
            micro: BuiltValueNullFieldError.checkNotNull(
                micro, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'micro'),
            string: BuiltValueNullFieldError.checkNotNull(
                string, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'string'),
            edition: BuiltValueNullFieldError.checkNotNull(
                edition, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'edition'),
            extendedSupport: BuiltValueNullFieldError.checkNotNull(
                extendedSupport, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version', 'extendedSupport'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CommentsCapabilities_FilesInterfaceBuilder {
  void replace(CommentsCapabilities_FilesInterface other);
  void update(void Function(CommentsCapabilities_FilesInterfaceBuilder) updates);
  bool? get comments;
  set comments(bool? comments);
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
    implements
        Builder<CommentsCapabilities_Files, CommentsCapabilities_FilesBuilder>,
        CommentsCapabilities_FilesInterfaceBuilder {
  _$CommentsCapabilities_Files? _$v;

  bool? _comments;
  bool? get comments => _$this._comments;
  set comments(covariant bool? comments) => _$this._comments = comments;

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
  void replace(covariant CommentsCapabilities_Files other) {
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

abstract mixin class CommentsCapabilitiesInterfaceBuilder {
  void replace(CommentsCapabilitiesInterface other);
  void update(void Function(CommentsCapabilitiesInterfaceBuilder) updates);
  CommentsCapabilities_FilesBuilder get files;
  set files(CommentsCapabilities_FilesBuilder? files);
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

class CommentsCapabilitiesBuilder
    implements Builder<CommentsCapabilities, CommentsCapabilitiesBuilder>, CommentsCapabilitiesInterfaceBuilder {
  _$CommentsCapabilities? _$v;

  CommentsCapabilities_FilesBuilder? _files;
  CommentsCapabilities_FilesBuilder get files => _$this._files ??= CommentsCapabilities_FilesBuilder();
  set files(covariant CommentsCapabilities_FilesBuilder? files) => _$this._files = files;

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
  void replace(covariant CommentsCapabilities other) {
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

abstract mixin class DavCapabilities_DavInterfaceBuilder {
  void replace(DavCapabilities_DavInterface other);
  void update(void Function(DavCapabilities_DavInterfaceBuilder) updates);
  String? get chunking;
  set chunking(String? chunking);

  String? get bulkupload;
  set bulkupload(String? bulkupload);
}

class _$DavCapabilities_Dav extends DavCapabilities_Dav {
  @override
  final String chunking;
  @override
  final String? bulkupload;

  factory _$DavCapabilities_Dav([void Function(DavCapabilities_DavBuilder)? updates]) =>
      (DavCapabilities_DavBuilder()..update(updates))._build();

  _$DavCapabilities_Dav._({required this.chunking, this.bulkupload}) : super._() {
    BuiltValueNullFieldError.checkNotNull(chunking, r'DavCapabilities_Dav', 'chunking');
  }

  @override
  DavCapabilities_Dav rebuild(void Function(DavCapabilities_DavBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DavCapabilities_DavBuilder toBuilder() => DavCapabilities_DavBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DavCapabilities_Dav && chunking == other.chunking && bulkupload == other.bulkupload;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chunking.hashCode);
    _$hash = $jc(_$hash, bulkupload.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DavCapabilities_Dav')
          ..add('chunking', chunking)
          ..add('bulkupload', bulkupload))
        .toString();
  }
}

class DavCapabilities_DavBuilder
    implements Builder<DavCapabilities_Dav, DavCapabilities_DavBuilder>, DavCapabilities_DavInterfaceBuilder {
  _$DavCapabilities_Dav? _$v;

  String? _chunking;
  String? get chunking => _$this._chunking;
  set chunking(covariant String? chunking) => _$this._chunking = chunking;

  String? _bulkupload;
  String? get bulkupload => _$this._bulkupload;
  set bulkupload(covariant String? bulkupload) => _$this._bulkupload = bulkupload;

  DavCapabilities_DavBuilder();

  DavCapabilities_DavBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chunking = $v.chunking;
      _bulkupload = $v.bulkupload;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DavCapabilities_Dav other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DavCapabilities_Dav;
  }

  @override
  void update(void Function(DavCapabilities_DavBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DavCapabilities_Dav build() => _build();

  _$DavCapabilities_Dav _build() {
    final _$result = _$v ??
        _$DavCapabilities_Dav._(
            chunking: BuiltValueNullFieldError.checkNotNull(chunking, r'DavCapabilities_Dav', 'chunking'),
            bulkupload: bulkupload);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DavCapabilitiesInterfaceBuilder {
  void replace(DavCapabilitiesInterface other);
  void update(void Function(DavCapabilitiesInterfaceBuilder) updates);
  DavCapabilities_DavBuilder get dav;
  set dav(DavCapabilities_DavBuilder? dav);
}

class _$DavCapabilities extends DavCapabilities {
  @override
  final DavCapabilities_Dav dav;

  factory _$DavCapabilities([void Function(DavCapabilitiesBuilder)? updates]) =>
      (DavCapabilitiesBuilder()..update(updates))._build();

  _$DavCapabilities._({required this.dav}) : super._() {
    BuiltValueNullFieldError.checkNotNull(dav, r'DavCapabilities', 'dav');
  }

  @override
  DavCapabilities rebuild(void Function(DavCapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DavCapabilitiesBuilder toBuilder() => DavCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DavCapabilities && dav == other.dav;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dav.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DavCapabilities')..add('dav', dav)).toString();
  }
}

class DavCapabilitiesBuilder
    implements Builder<DavCapabilities, DavCapabilitiesBuilder>, DavCapabilitiesInterfaceBuilder {
  _$DavCapabilities? _$v;

  DavCapabilities_DavBuilder? _dav;
  DavCapabilities_DavBuilder get dav => _$this._dav ??= DavCapabilities_DavBuilder();
  set dav(covariant DavCapabilities_DavBuilder? dav) => _$this._dav = dav;

  DavCapabilitiesBuilder();

  DavCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dav = $v.dav.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DavCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DavCapabilities;
  }

  @override
  void update(void Function(DavCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DavCapabilities build() => _build();

  _$DavCapabilities _build() {
    _$DavCapabilities _$result;
    try {
      _$result = _$v ?? _$DavCapabilities._(dav: dav.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dav';
        dav.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DavCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesCapabilities_Files_DirectEditingInterfaceBuilder {
  void replace(FilesCapabilities_Files_DirectEditingInterface other);
  void update(void Function(FilesCapabilities_Files_DirectEditingInterfaceBuilder) updates);
  String? get url;
  set url(String? url);

  String? get etag;
  set etag(String? etag);

  bool? get supportsFileId;
  set supportsFileId(bool? supportsFileId);
}

class _$FilesCapabilities_Files_DirectEditing extends FilesCapabilities_Files_DirectEditing {
  @override
  final String url;
  @override
  final String etag;
  @override
  final bool supportsFileId;

  factory _$FilesCapabilities_Files_DirectEditing(
          [void Function(FilesCapabilities_Files_DirectEditingBuilder)? updates]) =>
      (FilesCapabilities_Files_DirectEditingBuilder()..update(updates))._build();

  _$FilesCapabilities_Files_DirectEditing._({required this.url, required this.etag, required this.supportsFileId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'FilesCapabilities_Files_DirectEditing', 'url');
    BuiltValueNullFieldError.checkNotNull(etag, r'FilesCapabilities_Files_DirectEditing', 'etag');
    BuiltValueNullFieldError.checkNotNull(supportsFileId, r'FilesCapabilities_Files_DirectEditing', 'supportsFileId');
  }

  @override
  FilesCapabilities_Files_DirectEditing rebuild(void Function(FilesCapabilities_Files_DirectEditingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesCapabilities_Files_DirectEditingBuilder toBuilder() =>
      FilesCapabilities_Files_DirectEditingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesCapabilities_Files_DirectEditing &&
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
    return (newBuiltValueToStringHelper(r'FilesCapabilities_Files_DirectEditing')
          ..add('url', url)
          ..add('etag', etag)
          ..add('supportsFileId', supportsFileId))
        .toString();
  }
}

class FilesCapabilities_Files_DirectEditingBuilder
    implements
        Builder<FilesCapabilities_Files_DirectEditing, FilesCapabilities_Files_DirectEditingBuilder>,
        FilesCapabilities_Files_DirectEditingInterfaceBuilder {
  _$FilesCapabilities_Files_DirectEditing? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(covariant String? etag) => _$this._etag = etag;

  bool? _supportsFileId;
  bool? get supportsFileId => _$this._supportsFileId;
  set supportsFileId(covariant bool? supportsFileId) => _$this._supportsFileId = supportsFileId;

  FilesCapabilities_Files_DirectEditingBuilder();

  FilesCapabilities_Files_DirectEditingBuilder get _$this {
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
  void replace(covariant FilesCapabilities_Files_DirectEditing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesCapabilities_Files_DirectEditing;
  }

  @override
  void update(void Function(FilesCapabilities_Files_DirectEditingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesCapabilities_Files_DirectEditing build() => _build();

  _$FilesCapabilities_Files_DirectEditing _build() {
    final _$result = _$v ??
        _$FilesCapabilities_Files_DirectEditing._(
            url: BuiltValueNullFieldError.checkNotNull(url, r'FilesCapabilities_Files_DirectEditing', 'url'),
            etag: BuiltValueNullFieldError.checkNotNull(etag, r'FilesCapabilities_Files_DirectEditing', 'etag'),
            supportsFileId: BuiltValueNullFieldError.checkNotNull(
                supportsFileId, r'FilesCapabilities_Files_DirectEditing', 'supportsFileId'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesCapabilities_FilesInterfaceBuilder {
  void replace(FilesCapabilities_FilesInterface other);
  void update(void Function(FilesCapabilities_FilesInterfaceBuilder) updates);
  bool? get bigfilechunking;
  set bigfilechunking(bool? bigfilechunking);

  ListBuilder<JsonObject> get blacklistedFiles;
  set blacklistedFiles(ListBuilder<JsonObject>? blacklistedFiles);

  FilesCapabilities_Files_DirectEditingBuilder get directEditing;
  set directEditing(FilesCapabilities_Files_DirectEditingBuilder? directEditing);
}

class _$FilesCapabilities_Files extends FilesCapabilities_Files {
  @override
  final bool bigfilechunking;
  @override
  final BuiltList<JsonObject> blacklistedFiles;
  @override
  final FilesCapabilities_Files_DirectEditing directEditing;

  factory _$FilesCapabilities_Files([void Function(FilesCapabilities_FilesBuilder)? updates]) =>
      (FilesCapabilities_FilesBuilder()..update(updates))._build();

  _$FilesCapabilities_Files._(
      {required this.bigfilechunking, required this.blacklistedFiles, required this.directEditing})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(bigfilechunking, r'FilesCapabilities_Files', 'bigfilechunking');
    BuiltValueNullFieldError.checkNotNull(blacklistedFiles, r'FilesCapabilities_Files', 'blacklistedFiles');
    BuiltValueNullFieldError.checkNotNull(directEditing, r'FilesCapabilities_Files', 'directEditing');
  }

  @override
  FilesCapabilities_Files rebuild(void Function(FilesCapabilities_FilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesCapabilities_FilesBuilder toBuilder() => FilesCapabilities_FilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesCapabilities_Files &&
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
    return (newBuiltValueToStringHelper(r'FilesCapabilities_Files')
          ..add('bigfilechunking', bigfilechunking)
          ..add('blacklistedFiles', blacklistedFiles)
          ..add('directEditing', directEditing))
        .toString();
  }
}

class FilesCapabilities_FilesBuilder
    implements
        Builder<FilesCapabilities_Files, FilesCapabilities_FilesBuilder>,
        FilesCapabilities_FilesInterfaceBuilder {
  _$FilesCapabilities_Files? _$v;

  bool? _bigfilechunking;
  bool? get bigfilechunking => _$this._bigfilechunking;
  set bigfilechunking(covariant bool? bigfilechunking) => _$this._bigfilechunking = bigfilechunking;

  ListBuilder<JsonObject>? _blacklistedFiles;
  ListBuilder<JsonObject> get blacklistedFiles => _$this._blacklistedFiles ??= ListBuilder<JsonObject>();
  set blacklistedFiles(covariant ListBuilder<JsonObject>? blacklistedFiles) =>
      _$this._blacklistedFiles = blacklistedFiles;

  FilesCapabilities_Files_DirectEditingBuilder? _directEditing;
  FilesCapabilities_Files_DirectEditingBuilder get directEditing =>
      _$this._directEditing ??= FilesCapabilities_Files_DirectEditingBuilder();
  set directEditing(covariant FilesCapabilities_Files_DirectEditingBuilder? directEditing) =>
      _$this._directEditing = directEditing;

  FilesCapabilities_FilesBuilder();

  FilesCapabilities_FilesBuilder get _$this {
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
  void replace(covariant FilesCapabilities_Files other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesCapabilities_Files;
  }

  @override
  void update(void Function(FilesCapabilities_FilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesCapabilities_Files build() => _build();

  _$FilesCapabilities_Files _build() {
    _$FilesCapabilities_Files _$result;
    try {
      _$result = _$v ??
          _$FilesCapabilities_Files._(
              bigfilechunking:
                  BuiltValueNullFieldError.checkNotNull(bigfilechunking, r'FilesCapabilities_Files', 'bigfilechunking'),
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
        throw BuiltValueNestedFieldError(r'FilesCapabilities_Files', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesCapabilitiesInterfaceBuilder {
  void replace(FilesCapabilitiesInterface other);
  void update(void Function(FilesCapabilitiesInterfaceBuilder) updates);
  FilesCapabilities_FilesBuilder get files;
  set files(FilesCapabilities_FilesBuilder? files);
}

class _$FilesCapabilities extends FilesCapabilities {
  @override
  final FilesCapabilities_Files files;

  factory _$FilesCapabilities([void Function(FilesCapabilitiesBuilder)? updates]) =>
      (FilesCapabilitiesBuilder()..update(updates))._build();

  _$FilesCapabilities._({required this.files}) : super._() {
    BuiltValueNullFieldError.checkNotNull(files, r'FilesCapabilities', 'files');
  }

  @override
  FilesCapabilities rebuild(void Function(FilesCapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  FilesCapabilitiesBuilder toBuilder() => FilesCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesCapabilities && files == other.files;
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
    return (newBuiltValueToStringHelper(r'FilesCapabilities')..add('files', files)).toString();
  }
}

class FilesCapabilitiesBuilder
    implements Builder<FilesCapabilities, FilesCapabilitiesBuilder>, FilesCapabilitiesInterfaceBuilder {
  _$FilesCapabilities? _$v;

  FilesCapabilities_FilesBuilder? _files;
  FilesCapabilities_FilesBuilder get files => _$this._files ??= FilesCapabilities_FilesBuilder();
  set files(covariant FilesCapabilities_FilesBuilder? files) => _$this._files = files;

  FilesCapabilitiesBuilder();

  FilesCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _files = $v.files.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesCapabilities;
  }

  @override
  void update(void Function(FilesCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesCapabilities build() => _build();

  _$FilesCapabilities _build() {
    _$FilesCapabilities _$result;
    try {
      _$result = _$v ?? _$FilesCapabilities._(files: files.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        files.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_Public_PasswordInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_Public_PasswordInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_PasswordInterfaceBuilder) updates);
  bool? get enforced;
  set enforced(bool? enforced);

  bool? get askForOptionalPassword;
  set askForOptionalPassword(bool? askForOptionalPassword);
}

class _$FilesSharingCapabilities_FilesSharing_Public_Password
    extends FilesSharingCapabilities_FilesSharing_Public_Password {
  @override
  final bool enforced;
  @override
  final bool askForOptionalPassword;

  factory _$FilesSharingCapabilities_FilesSharing_Public_Password(
          [void Function(FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Public_Password._(
      {required this.enforced, required this.askForOptionalPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enforced, r'FilesSharingCapabilities_FilesSharing_Public_Password', 'enforced');
    BuiltValueNullFieldError.checkNotNull(
        askForOptionalPassword, r'FilesSharingCapabilities_FilesSharing_Public_Password', 'askForOptionalPassword');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_Password rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Public_Password &&
        enforced == other.enforced &&
        askForOptionalPassword == other.askForOptionalPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jc(_$hash, askForOptionalPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Public_Password')
          ..add('enforced', enforced)
          ..add('askForOptionalPassword', askForOptionalPassword))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Public_Password,
            FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder>,
        FilesSharingCapabilities_FilesSharing_Public_PasswordInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Public_Password? _$v;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  bool? _askForOptionalPassword;
  bool? get askForOptionalPassword => _$this._askForOptionalPassword;
  set askForOptionalPassword(covariant bool? askForOptionalPassword) =>
      _$this._askForOptionalPassword = askForOptionalPassword;

  FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder();

  FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enforced = $v.enforced;
      _askForOptionalPassword = $v.askForOptionalPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Public_Password other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Public_Password;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_Password build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Public_Password _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Public_Password._(
            enforced: BuiltValueNullFieldError.checkNotNull(
                enforced, r'FilesSharingCapabilities_FilesSharing_Public_Password', 'enforced'),
            askForOptionalPassword: BuiltValueNullFieldError.checkNotNull(askForOptionalPassword,
                r'FilesSharingCapabilities_FilesSharing_Public_Password', 'askForOptionalPassword'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  int? get days;
  set days(int? days);

  bool? get enforced;
  set enforced(bool? enforced);
}

class _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate
    extends FilesSharingCapabilities_FilesSharing_Public_ExpireDate {
  @override
  final bool enabled;
  @override
  final int? days;
  @override
  final bool? enforced;

  factory _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate(
          [void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate._({required this.enabled, this.days, this.enforced})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'FilesSharingCapabilities_FilesSharing_Public_ExpireDate', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDate rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Public_ExpireDate &&
        enabled == other.enabled &&
        days == other.days &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, days.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Public_ExpireDate')
          ..add('enabled', enabled)
          ..add('days', days)
          ..add('enforced', enforced))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Public_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder>,
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  int? _days;
  int? get days => _$this._days;
  set days(covariant int? days) => _$this._days = days;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder();

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _days = $v.days;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Public_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDate build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'FilesSharingCapabilities_FilesSharing_Public_ExpireDate', 'enabled'),
            days: days,
            enforced: enforced);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  int? get days;
  set days(int? days);

  bool? get enforced;
  set enforced(bool? enforced);
}

class _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal
    extends FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal {
  @override
  final bool enabled;
  @override
  final int? days;
  @override
  final bool? enforced;

  factory _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal(
          [void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal._({required this.enabled, this.days, this.enforced})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal &&
        enabled == other.enabled &&
        days == other.days &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, days.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal')
          ..add('enabled', enabled)
          ..add('days', days)
          ..add('enforced', enforced))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder>,
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  int? _days;
  int? get days => _$this._days;
  set days(covariant int? days) => _$this._days = days;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder();

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _days = $v.days;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal', 'enabled'),
            days: days,
            enforced: enforced);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  int? get days;
  set days(int? days);

  bool? get enforced;
  set enforced(bool? enforced);
}

class _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote
    extends FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote {
  @override
  final bool enabled;
  @override
  final int? days;
  @override
  final bool? enforced;

  factory _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote(
          [void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote._({required this.enabled, this.days, this.enforced})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote &&
        enabled == other.enabled &&
        days == other.days &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, days.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote')
          ..add('enabled', enabled)
          ..add('days', days)
          ..add('enforced', enforced))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder>,
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  int? _days;
  int? get days => _$this._days;
  set days(covariant int? days) => _$this._days = days;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder();

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _days = $v.days;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote', 'enabled'),
            days: days,
            enforced: enforced);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_PublicInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_PublicInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_PublicInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder get password;
  set password(FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder? password);

  bool? get multipleLinks;
  set multipleLinks(bool? multipleLinks);

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder get expireDate;
  set expireDate(FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder? expireDate);

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder get expireDateInternal;
  set expireDateInternal(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder? expireDateInternal);

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder get expireDateRemote;
  set expireDateRemote(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder? expireDateRemote);

  bool? get sendMail;
  set sendMail(bool? sendMail);

  bool? get upload;
  set upload(bool? upload);

  bool? get uploadFilesDrop;
  set uploadFilesDrop(bool? uploadFilesDrop);
}

class _$FilesSharingCapabilities_FilesSharing_Public extends FilesSharingCapabilities_FilesSharing_Public {
  @override
  final bool enabled;
  @override
  final FilesSharingCapabilities_FilesSharing_Public_Password? password;
  @override
  final bool? multipleLinks;
  @override
  final FilesSharingCapabilities_FilesSharing_Public_ExpireDate? expireDate;
  @override
  final FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal? expireDateInternal;
  @override
  final FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote? expireDateRemote;
  @override
  final bool? sendMail;
  @override
  final bool? upload;
  @override
  final bool? uploadFilesDrop;

  factory _$FilesSharingCapabilities_FilesSharing_Public(
          [void Function(FilesSharingCapabilities_FilesSharing_PublicBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_PublicBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Public._(
      {required this.enabled,
      this.password,
      this.multipleLinks,
      this.expireDate,
      this.expireDateInternal,
      this.expireDateRemote,
      this.sendMail,
      this.upload,
      this.uploadFilesDrop})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'FilesSharingCapabilities_FilesSharing_Public', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_PublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_PublicBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_PublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Public &&
        enabled == other.enabled &&
        password == other.password &&
        multipleLinks == other.multipleLinks &&
        expireDate == other.expireDate &&
        expireDateInternal == other.expireDateInternal &&
        expireDateRemote == other.expireDateRemote &&
        sendMail == other.sendMail &&
        upload == other.upload &&
        uploadFilesDrop == other.uploadFilesDrop;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, multipleLinks.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jc(_$hash, expireDateInternal.hashCode);
    _$hash = $jc(_$hash, expireDateRemote.hashCode);
    _$hash = $jc(_$hash, sendMail.hashCode);
    _$hash = $jc(_$hash, upload.hashCode);
    _$hash = $jc(_$hash, uploadFilesDrop.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Public')
          ..add('enabled', enabled)
          ..add('password', password)
          ..add('multipleLinks', multipleLinks)
          ..add('expireDate', expireDate)
          ..add('expireDateInternal', expireDateInternal)
          ..add('expireDateRemote', expireDateRemote)
          ..add('sendMail', sendMail)
          ..add('upload', upload)
          ..add('uploadFilesDrop', uploadFilesDrop))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_PublicBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Public, FilesSharingCapabilities_FilesSharing_PublicBuilder>,
        FilesSharingCapabilities_FilesSharing_PublicInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Public? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder? _password;
  FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder get password =>
      _$this._password ??= FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder();
  set password(covariant FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder? password) =>
      _$this._password = password;

  bool? _multipleLinks;
  bool? get multipleLinks => _$this._multipleLinks;
  set multipleLinks(covariant bool? multipleLinks) => _$this._multipleLinks = multipleLinks;

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder? _expireDate;
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??= FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder();
  set expireDate(covariant FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder? _expireDateInternal;
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder get expireDateInternal =>
      _$this._expireDateInternal ??= FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder();
  set expireDateInternal(
          covariant FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder? expireDateInternal) =>
      _$this._expireDateInternal = expireDateInternal;

  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder? _expireDateRemote;
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder get expireDateRemote =>
      _$this._expireDateRemote ??= FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder();
  set expireDateRemote(
          covariant FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder? expireDateRemote) =>
      _$this._expireDateRemote = expireDateRemote;

  bool? _sendMail;
  bool? get sendMail => _$this._sendMail;
  set sendMail(covariant bool? sendMail) => _$this._sendMail = sendMail;

  bool? _upload;
  bool? get upload => _$this._upload;
  set upload(covariant bool? upload) => _$this._upload = upload;

  bool? _uploadFilesDrop;
  bool? get uploadFilesDrop => _$this._uploadFilesDrop;
  set uploadFilesDrop(covariant bool? uploadFilesDrop) => _$this._uploadFilesDrop = uploadFilesDrop;

  FilesSharingCapabilities_FilesSharing_PublicBuilder();

  FilesSharingCapabilities_FilesSharing_PublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _password = $v.password?.toBuilder();
      _multipleLinks = $v.multipleLinks;
      _expireDate = $v.expireDate?.toBuilder();
      _expireDateInternal = $v.expireDateInternal?.toBuilder();
      _expireDateRemote = $v.expireDateRemote?.toBuilder();
      _sendMail = $v.sendMail;
      _upload = $v.upload;
      _uploadFilesDrop = $v.uploadFilesDrop;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Public other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Public;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_PublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Public _build() {
    _$FilesSharingCapabilities_FilesSharing_Public _$result;
    try {
      _$result = _$v ??
          _$FilesSharingCapabilities_FilesSharing_Public._(
              enabled: BuiltValueNullFieldError.checkNotNull(
                  enabled, r'FilesSharingCapabilities_FilesSharing_Public', 'enabled'),
              password: _password?.build(),
              multipleLinks: multipleLinks,
              expireDate: _expireDate?.build(),
              expireDateInternal: _expireDateInternal?.build(),
              expireDateRemote: _expireDateRemote?.build(),
              sendMail: sendMail,
              upload: upload,
              uploadFilesDrop: uploadFilesDrop);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'password';
        _password?.build();

        _$failedField = 'expireDate';
        _expireDate?.build();
        _$failedField = 'expireDateInternal';
        _expireDateInternal?.build();
        _$failedField = 'expireDateRemote';
        _expireDateRemote?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesSharingCapabilities_FilesSharing_Public', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_User_ExpireDateInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_User_ExpireDateInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_User_ExpireDateInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$FilesSharingCapabilities_FilesSharing_User_ExpireDate
    extends FilesSharingCapabilities_FilesSharing_User_ExpireDate {
  @override
  final bool enabled;

  factory _$FilesSharingCapabilities_FilesSharing_User_ExpireDate(
          [void Function(FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_User_ExpireDate._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'FilesSharingCapabilities_FilesSharing_User_ExpireDate', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_User_ExpireDate rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_User_ExpireDate && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_User_ExpireDate')
          ..add('enabled', enabled))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_User_ExpireDate,
            FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder>,
        FilesSharingCapabilities_FilesSharing_User_ExpireDateInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_User_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder();

  FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_User_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_User_ExpireDate;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_User_ExpireDate build() => _build();

  _$FilesSharingCapabilities_FilesSharing_User_ExpireDate _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_User_ExpireDate._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'FilesSharingCapabilities_FilesSharing_User_ExpireDate', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_UserInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_UserInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_UserInterfaceBuilder) updates);
  bool? get sendMail;
  set sendMail(bool? sendMail);

  FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder get expireDate;
  set expireDate(FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder? expireDate);
}

class _$FilesSharingCapabilities_FilesSharing_User extends FilesSharingCapabilities_FilesSharing_User {
  @override
  final bool sendMail;
  @override
  final FilesSharingCapabilities_FilesSharing_User_ExpireDate? expireDate;

  factory _$FilesSharingCapabilities_FilesSharing_User(
          [void Function(FilesSharingCapabilities_FilesSharing_UserBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_UserBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_User._({required this.sendMail, this.expireDate}) : super._() {
    BuiltValueNullFieldError.checkNotNull(sendMail, r'FilesSharingCapabilities_FilesSharing_User', 'sendMail');
  }

  @override
  FilesSharingCapabilities_FilesSharing_User rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_UserBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_User &&
        sendMail == other.sendMail &&
        expireDate == other.expireDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sendMail.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_User')
          ..add('sendMail', sendMail)
          ..add('expireDate', expireDate))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_UserBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_User, FilesSharingCapabilities_FilesSharing_UserBuilder>,
        FilesSharingCapabilities_FilesSharing_UserInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_User? _$v;

  bool? _sendMail;
  bool? get sendMail => _$this._sendMail;
  set sendMail(covariant bool? sendMail) => _$this._sendMail = sendMail;

  FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder? _expireDate;
  FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??= FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder();
  set expireDate(covariant FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  FilesSharingCapabilities_FilesSharing_UserBuilder();

  FilesSharingCapabilities_FilesSharing_UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sendMail = $v.sendMail;
      _expireDate = $v.expireDate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_User;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_User build() => _build();

  _$FilesSharingCapabilities_FilesSharing_User _build() {
    _$FilesSharingCapabilities_FilesSharing_User _$result;
    try {
      _$result = _$v ??
          _$FilesSharingCapabilities_FilesSharing_User._(
              sendMail: BuiltValueNullFieldError.checkNotNull(
                  sendMail, r'FilesSharingCapabilities_FilesSharing_User', 'sendMail'),
              expireDate: _expireDate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expireDate';
        _expireDate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesSharingCapabilities_FilesSharing_User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate
    extends FilesSharingCapabilities_FilesSharing_Group_ExpireDate {
  @override
  final bool enabled;

  factory _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate(
          [void Function(FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'FilesSharingCapabilities_FilesSharing_Group_ExpireDate', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Group_ExpireDate rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Group_ExpireDate && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Group_ExpireDate')
          ..add('enabled', enabled))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Group_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder>,
        FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder();

  FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Group_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Group_ExpireDate build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'FilesSharingCapabilities_FilesSharing_Group_ExpireDate', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_GroupInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_GroupInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_GroupInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder get expireDate;
  set expireDate(FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder? expireDate);
}

class _$FilesSharingCapabilities_FilesSharing_Group extends FilesSharingCapabilities_FilesSharing_Group {
  @override
  final bool enabled;
  @override
  final FilesSharingCapabilities_FilesSharing_Group_ExpireDate? expireDate;

  factory _$FilesSharingCapabilities_FilesSharing_Group(
          [void Function(FilesSharingCapabilities_FilesSharing_GroupBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_GroupBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Group._({required this.enabled, this.expireDate}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'FilesSharingCapabilities_FilesSharing_Group', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Group rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_GroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_GroupBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_GroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Group &&
        enabled == other.enabled &&
        expireDate == other.expireDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Group')
          ..add('enabled', enabled)
          ..add('expireDate', expireDate))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_GroupBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Group, FilesSharingCapabilities_FilesSharing_GroupBuilder>,
        FilesSharingCapabilities_FilesSharing_GroupInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Group? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder? _expireDate;
  FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??= FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder();
  set expireDate(covariant FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  FilesSharingCapabilities_FilesSharing_GroupBuilder();

  FilesSharingCapabilities_FilesSharing_GroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _expireDate = $v.expireDate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Group other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Group;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_GroupBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Group build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Group _build() {
    _$FilesSharingCapabilities_FilesSharing_Group _$result;
    try {
      _$result = _$v ??
          _$FilesSharingCapabilities_FilesSharing_Group._(
              enabled: BuiltValueNullFieldError.checkNotNull(
                  enabled, r'FilesSharingCapabilities_FilesSharing_Group', 'enabled'),
              expireDate: _expireDate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expireDate';
        _expireDate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesSharingCapabilities_FilesSharing_Group', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate
    extends FilesSharingCapabilities_FilesSharing_Federation_ExpireDate {
  @override
  final bool enabled;

  factory _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate(
          [void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'FilesSharingCapabilities_FilesSharing_Federation_ExpireDate', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDate rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Federation_ExpireDate && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Federation_ExpireDate')
          ..add('enabled', enabled))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder>,
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder();

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Federation_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDate build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'FilesSharingCapabilities_FilesSharing_Federation_ExpireDate', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface other);
  void update(
      void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported
    extends FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported {
  @override
  final bool enabled;

  factory _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported(
          [void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported', 'enabled');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported')
          ..add('enabled', enabled))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported,
            FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder>,
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder();

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_FederationInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_FederationInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_FederationInterfaceBuilder) updates);
  bool? get outgoing;
  set outgoing(bool? outgoing);

  bool? get incoming;
  set incoming(bool? incoming);

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder get expireDate;
  set expireDate(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder? expireDate);

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder get expireDateSupported;
  set expireDateSupported(
      FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder? expireDateSupported);
}

class _$FilesSharingCapabilities_FilesSharing_Federation extends FilesSharingCapabilities_FilesSharing_Federation {
  @override
  final bool outgoing;
  @override
  final bool incoming;
  @override
  final FilesSharingCapabilities_FilesSharing_Federation_ExpireDate expireDate;
  @override
  final FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported expireDateSupported;

  factory _$FilesSharingCapabilities_FilesSharing_Federation(
          [void Function(FilesSharingCapabilities_FilesSharing_FederationBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_FederationBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Federation._(
      {required this.outgoing, required this.incoming, required this.expireDate, required this.expireDateSupported})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(outgoing, r'FilesSharingCapabilities_FilesSharing_Federation', 'outgoing');
    BuiltValueNullFieldError.checkNotNull(incoming, r'FilesSharingCapabilities_FilesSharing_Federation', 'incoming');
    BuiltValueNullFieldError.checkNotNull(
        expireDate, r'FilesSharingCapabilities_FilesSharing_Federation', 'expireDate');
    BuiltValueNullFieldError.checkNotNull(
        expireDateSupported, r'FilesSharingCapabilities_FilesSharing_Federation', 'expireDateSupported');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_FederationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_FederationBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_FederationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Federation &&
        outgoing == other.outgoing &&
        incoming == other.incoming &&
        expireDate == other.expireDate &&
        expireDateSupported == other.expireDateSupported;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, outgoing.hashCode);
    _$hash = $jc(_$hash, incoming.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jc(_$hash, expireDateSupported.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Federation')
          ..add('outgoing', outgoing)
          ..add('incoming', incoming)
          ..add('expireDate', expireDate)
          ..add('expireDateSupported', expireDateSupported))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_FederationBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Federation,
            FilesSharingCapabilities_FilesSharing_FederationBuilder>,
        FilesSharingCapabilities_FilesSharing_FederationInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Federation? _$v;

  bool? _outgoing;
  bool? get outgoing => _$this._outgoing;
  set outgoing(covariant bool? outgoing) => _$this._outgoing = outgoing;

  bool? _incoming;
  bool? get incoming => _$this._incoming;
  set incoming(covariant bool? incoming) => _$this._incoming = incoming;

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder? _expireDate;
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??= FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder();
  set expireDate(covariant FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder? _expireDateSupported;
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder get expireDateSupported =>
      _$this._expireDateSupported ??= FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder();
  set expireDateSupported(
          covariant FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder? expireDateSupported) =>
      _$this._expireDateSupported = expireDateSupported;

  FilesSharingCapabilities_FilesSharing_FederationBuilder();

  FilesSharingCapabilities_FilesSharing_FederationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _outgoing = $v.outgoing;
      _incoming = $v.incoming;
      _expireDate = $v.expireDate.toBuilder();
      _expireDateSupported = $v.expireDateSupported.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Federation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Federation;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_FederationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Federation _build() {
    _$FilesSharingCapabilities_FilesSharing_Federation _$result;
    try {
      _$result = _$v ??
          _$FilesSharingCapabilities_FilesSharing_Federation._(
              outgoing: BuiltValueNullFieldError.checkNotNull(
                  outgoing, r'FilesSharingCapabilities_FilesSharing_Federation', 'outgoing'),
              incoming: BuiltValueNullFieldError.checkNotNull(
                  incoming, r'FilesSharingCapabilities_FilesSharing_Federation', 'incoming'),
              expireDate: expireDate.build(),
              expireDateSupported: expireDateSupported.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expireDate';
        expireDate.build();
        _$failedField = 'expireDateSupported';
        expireDateSupported.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesSharingCapabilities_FilesSharing_Federation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharing_ShareeInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharing_ShareeInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharing_ShareeInterfaceBuilder) updates);
  bool? get queryLookupDefault;
  set queryLookupDefault(bool? queryLookupDefault);

  bool? get alwaysShowUnique;
  set alwaysShowUnique(bool? alwaysShowUnique);
}

class _$FilesSharingCapabilities_FilesSharing_Sharee extends FilesSharingCapabilities_FilesSharing_Sharee {
  @override
  final bool queryLookupDefault;
  @override
  final bool alwaysShowUnique;

  factory _$FilesSharingCapabilities_FilesSharing_Sharee(
          [void Function(FilesSharingCapabilities_FilesSharing_ShareeBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharing_ShareeBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing_Sharee._({required this.queryLookupDefault, required this.alwaysShowUnique})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        queryLookupDefault, r'FilesSharingCapabilities_FilesSharing_Sharee', 'queryLookupDefault');
    BuiltValueNullFieldError.checkNotNull(
        alwaysShowUnique, r'FilesSharingCapabilities_FilesSharing_Sharee', 'alwaysShowUnique');
  }

  @override
  FilesSharingCapabilities_FilesSharing_Sharee rebuild(
          void Function(FilesSharingCapabilities_FilesSharing_ShareeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharing_ShareeBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharing_ShareeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing_Sharee &&
        queryLookupDefault == other.queryLookupDefault &&
        alwaysShowUnique == other.alwaysShowUnique;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, queryLookupDefault.hashCode);
    _$hash = $jc(_$hash, alwaysShowUnique.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing_Sharee')
          ..add('queryLookupDefault', queryLookupDefault)
          ..add('alwaysShowUnique', alwaysShowUnique))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharing_ShareeBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing_Sharee, FilesSharingCapabilities_FilesSharing_ShareeBuilder>,
        FilesSharingCapabilities_FilesSharing_ShareeInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing_Sharee? _$v;

  bool? _queryLookupDefault;
  bool? get queryLookupDefault => _$this._queryLookupDefault;
  set queryLookupDefault(covariant bool? queryLookupDefault) => _$this._queryLookupDefault = queryLookupDefault;

  bool? _alwaysShowUnique;
  bool? get alwaysShowUnique => _$this._alwaysShowUnique;
  set alwaysShowUnique(covariant bool? alwaysShowUnique) => _$this._alwaysShowUnique = alwaysShowUnique;

  FilesSharingCapabilities_FilesSharing_ShareeBuilder();

  FilesSharingCapabilities_FilesSharing_ShareeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _queryLookupDefault = $v.queryLookupDefault;
      _alwaysShowUnique = $v.alwaysShowUnique;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing_Sharee other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing_Sharee;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharing_ShareeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing_Sharee build() => _build();

  _$FilesSharingCapabilities_FilesSharing_Sharee _build() {
    final _$result = _$v ??
        _$FilesSharingCapabilities_FilesSharing_Sharee._(
            queryLookupDefault: BuiltValueNullFieldError.checkNotNull(
                queryLookupDefault, r'FilesSharingCapabilities_FilesSharing_Sharee', 'queryLookupDefault'),
            alwaysShowUnique: BuiltValueNullFieldError.checkNotNull(
                alwaysShowUnique, r'FilesSharingCapabilities_FilesSharing_Sharee', 'alwaysShowUnique'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilities_FilesSharingInterfaceBuilder {
  void replace(FilesSharingCapabilities_FilesSharingInterface other);
  void update(void Function(FilesSharingCapabilities_FilesSharingInterfaceBuilder) updates);
  bool? get apiEnabled;
  set apiEnabled(bool? apiEnabled);

  FilesSharingCapabilities_FilesSharing_PublicBuilder get public;
  set public(FilesSharingCapabilities_FilesSharing_PublicBuilder? public);

  FilesSharingCapabilities_FilesSharing_UserBuilder get user;
  set user(FilesSharingCapabilities_FilesSharing_UserBuilder? user);

  bool? get resharing;
  set resharing(bool? resharing);

  bool? get groupSharing;
  set groupSharing(bool? groupSharing);

  FilesSharingCapabilities_FilesSharing_GroupBuilder get group;
  set group(FilesSharingCapabilities_FilesSharing_GroupBuilder? group);

  int? get defaultPermissions;
  set defaultPermissions(int? defaultPermissions);

  FilesSharingCapabilities_FilesSharing_FederationBuilder get federation;
  set federation(FilesSharingCapabilities_FilesSharing_FederationBuilder? federation);

  FilesSharingCapabilities_FilesSharing_ShareeBuilder get sharee;
  set sharee(FilesSharingCapabilities_FilesSharing_ShareeBuilder? sharee);
}

class _$FilesSharingCapabilities_FilesSharing extends FilesSharingCapabilities_FilesSharing {
  @override
  final bool apiEnabled;
  @override
  final FilesSharingCapabilities_FilesSharing_Public public;
  @override
  final FilesSharingCapabilities_FilesSharing_User user;
  @override
  final bool resharing;
  @override
  final bool? groupSharing;
  @override
  final FilesSharingCapabilities_FilesSharing_Group? group;
  @override
  final int? defaultPermissions;
  @override
  final FilesSharingCapabilities_FilesSharing_Federation federation;
  @override
  final FilesSharingCapabilities_FilesSharing_Sharee sharee;

  factory _$FilesSharingCapabilities_FilesSharing(
          [void Function(FilesSharingCapabilities_FilesSharingBuilder)? updates]) =>
      (FilesSharingCapabilities_FilesSharingBuilder()..update(updates))._build();

  _$FilesSharingCapabilities_FilesSharing._(
      {required this.apiEnabled,
      required this.public,
      required this.user,
      required this.resharing,
      this.groupSharing,
      this.group,
      this.defaultPermissions,
      required this.federation,
      required this.sharee})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(apiEnabled, r'FilesSharingCapabilities_FilesSharing', 'apiEnabled');
    BuiltValueNullFieldError.checkNotNull(public, r'FilesSharingCapabilities_FilesSharing', 'public');
    BuiltValueNullFieldError.checkNotNull(user, r'FilesSharingCapabilities_FilesSharing', 'user');
    BuiltValueNullFieldError.checkNotNull(resharing, r'FilesSharingCapabilities_FilesSharing', 'resharing');
    BuiltValueNullFieldError.checkNotNull(federation, r'FilesSharingCapabilities_FilesSharing', 'federation');
    BuiltValueNullFieldError.checkNotNull(sharee, r'FilesSharingCapabilities_FilesSharing', 'sharee');
  }

  @override
  FilesSharingCapabilities_FilesSharing rebuild(void Function(FilesSharingCapabilities_FilesSharingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilities_FilesSharingBuilder toBuilder() =>
      FilesSharingCapabilities_FilesSharingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities_FilesSharing &&
        apiEnabled == other.apiEnabled &&
        public == other.public &&
        user == other.user &&
        resharing == other.resharing &&
        groupSharing == other.groupSharing &&
        group == other.group &&
        defaultPermissions == other.defaultPermissions &&
        federation == other.federation &&
        sharee == other.sharee;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiEnabled.hashCode);
    _$hash = $jc(_$hash, public.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, resharing.hashCode);
    _$hash = $jc(_$hash, groupSharing.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, defaultPermissions.hashCode);
    _$hash = $jc(_$hash, federation.hashCode);
    _$hash = $jc(_$hash, sharee.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities_FilesSharing')
          ..add('apiEnabled', apiEnabled)
          ..add('public', public)
          ..add('user', user)
          ..add('resharing', resharing)
          ..add('groupSharing', groupSharing)
          ..add('group', group)
          ..add('defaultPermissions', defaultPermissions)
          ..add('federation', federation)
          ..add('sharee', sharee))
        .toString();
  }
}

class FilesSharingCapabilities_FilesSharingBuilder
    implements
        Builder<FilesSharingCapabilities_FilesSharing, FilesSharingCapabilities_FilesSharingBuilder>,
        FilesSharingCapabilities_FilesSharingInterfaceBuilder {
  _$FilesSharingCapabilities_FilesSharing? _$v;

  bool? _apiEnabled;
  bool? get apiEnabled => _$this._apiEnabled;
  set apiEnabled(covariant bool? apiEnabled) => _$this._apiEnabled = apiEnabled;

  FilesSharingCapabilities_FilesSharing_PublicBuilder? _public;
  FilesSharingCapabilities_FilesSharing_PublicBuilder get public =>
      _$this._public ??= FilesSharingCapabilities_FilesSharing_PublicBuilder();
  set public(covariant FilesSharingCapabilities_FilesSharing_PublicBuilder? public) => _$this._public = public;

  FilesSharingCapabilities_FilesSharing_UserBuilder? _user;
  FilesSharingCapabilities_FilesSharing_UserBuilder get user =>
      _$this._user ??= FilesSharingCapabilities_FilesSharing_UserBuilder();
  set user(covariant FilesSharingCapabilities_FilesSharing_UserBuilder? user) => _$this._user = user;

  bool? _resharing;
  bool? get resharing => _$this._resharing;
  set resharing(covariant bool? resharing) => _$this._resharing = resharing;

  bool? _groupSharing;
  bool? get groupSharing => _$this._groupSharing;
  set groupSharing(covariant bool? groupSharing) => _$this._groupSharing = groupSharing;

  FilesSharingCapabilities_FilesSharing_GroupBuilder? _group;
  FilesSharingCapabilities_FilesSharing_GroupBuilder get group =>
      _$this._group ??= FilesSharingCapabilities_FilesSharing_GroupBuilder();
  set group(covariant FilesSharingCapabilities_FilesSharing_GroupBuilder? group) => _$this._group = group;

  int? _defaultPermissions;
  int? get defaultPermissions => _$this._defaultPermissions;
  set defaultPermissions(covariant int? defaultPermissions) => _$this._defaultPermissions = defaultPermissions;

  FilesSharingCapabilities_FilesSharing_FederationBuilder? _federation;
  FilesSharingCapabilities_FilesSharing_FederationBuilder get federation =>
      _$this._federation ??= FilesSharingCapabilities_FilesSharing_FederationBuilder();
  set federation(covariant FilesSharingCapabilities_FilesSharing_FederationBuilder? federation) =>
      _$this._federation = federation;

  FilesSharingCapabilities_FilesSharing_ShareeBuilder? _sharee;
  FilesSharingCapabilities_FilesSharing_ShareeBuilder get sharee =>
      _$this._sharee ??= FilesSharingCapabilities_FilesSharing_ShareeBuilder();
  set sharee(covariant FilesSharingCapabilities_FilesSharing_ShareeBuilder? sharee) => _$this._sharee = sharee;

  FilesSharingCapabilities_FilesSharingBuilder();

  FilesSharingCapabilities_FilesSharingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiEnabled = $v.apiEnabled;
      _public = $v.public.toBuilder();
      _user = $v.user.toBuilder();
      _resharing = $v.resharing;
      _groupSharing = $v.groupSharing;
      _group = $v.group?.toBuilder();
      _defaultPermissions = $v.defaultPermissions;
      _federation = $v.federation.toBuilder();
      _sharee = $v.sharee.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities_FilesSharing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities_FilesSharing;
  }

  @override
  void update(void Function(FilesSharingCapabilities_FilesSharingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities_FilesSharing build() => _build();

  _$FilesSharingCapabilities_FilesSharing _build() {
    _$FilesSharingCapabilities_FilesSharing _$result;
    try {
      _$result = _$v ??
          _$FilesSharingCapabilities_FilesSharing._(
              apiEnabled: BuiltValueNullFieldError.checkNotNull(
                  apiEnabled, r'FilesSharingCapabilities_FilesSharing', 'apiEnabled'),
              public: public.build(),
              user: user.build(),
              resharing: BuiltValueNullFieldError.checkNotNull(
                  resharing, r'FilesSharingCapabilities_FilesSharing', 'resharing'),
              groupSharing: groupSharing,
              group: _group?.build(),
              defaultPermissions: defaultPermissions,
              federation: federation.build(),
              sharee: sharee.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'public';
        public.build();
        _$failedField = 'user';
        user.build();

        _$failedField = 'group';
        _group?.build();

        _$failedField = 'federation';
        federation.build();
        _$failedField = 'sharee';
        sharee.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesSharingCapabilities_FilesSharing', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesSharingCapabilitiesInterfaceBuilder {
  void replace(FilesSharingCapabilitiesInterface other);
  void update(void Function(FilesSharingCapabilitiesInterfaceBuilder) updates);
  FilesSharingCapabilities_FilesSharingBuilder get filesSharing;
  set filesSharing(FilesSharingCapabilities_FilesSharingBuilder? filesSharing);
}

class _$FilesSharingCapabilities extends FilesSharingCapabilities {
  @override
  final FilesSharingCapabilities_FilesSharing filesSharing;

  factory _$FilesSharingCapabilities([void Function(FilesSharingCapabilitiesBuilder)? updates]) =>
      (FilesSharingCapabilitiesBuilder()..update(updates))._build();

  _$FilesSharingCapabilities._({required this.filesSharing}) : super._() {
    BuiltValueNullFieldError.checkNotNull(filesSharing, r'FilesSharingCapabilities', 'filesSharing');
  }

  @override
  FilesSharingCapabilities rebuild(void Function(FilesSharingCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesSharingCapabilitiesBuilder toBuilder() => FilesSharingCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesSharingCapabilities && filesSharing == other.filesSharing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, filesSharing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesSharingCapabilities')..add('filesSharing', filesSharing)).toString();
  }
}

class FilesSharingCapabilitiesBuilder
    implements
        Builder<FilesSharingCapabilities, FilesSharingCapabilitiesBuilder>,
        FilesSharingCapabilitiesInterfaceBuilder {
  _$FilesSharingCapabilities? _$v;

  FilesSharingCapabilities_FilesSharingBuilder? _filesSharing;
  FilesSharingCapabilities_FilesSharingBuilder get filesSharing =>
      _$this._filesSharing ??= FilesSharingCapabilities_FilesSharingBuilder();
  set filesSharing(covariant FilesSharingCapabilities_FilesSharingBuilder? filesSharing) =>
      _$this._filesSharing = filesSharing;

  FilesSharingCapabilitiesBuilder();

  FilesSharingCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _filesSharing = $v.filesSharing.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesSharingCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesSharingCapabilities;
  }

  @override
  void update(void Function(FilesSharingCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesSharingCapabilities build() => _build();

  _$FilesSharingCapabilities _build() {
    _$FilesSharingCapabilities _$result;
    try {
      _$result = _$v ?? _$FilesSharingCapabilities._(filesSharing: filesSharing.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filesSharing';
        filesSharing.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesSharingCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesTrashbinCapabilities_FilesInterfaceBuilder {
  void replace(FilesTrashbinCapabilities_FilesInterface other);
  void update(void Function(FilesTrashbinCapabilities_FilesInterfaceBuilder) updates);
  bool? get undelete;
  set undelete(bool? undelete);
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
    implements
        Builder<FilesTrashbinCapabilities_Files, FilesTrashbinCapabilities_FilesBuilder>,
        FilesTrashbinCapabilities_FilesInterfaceBuilder {
  _$FilesTrashbinCapabilities_Files? _$v;

  bool? _undelete;
  bool? get undelete => _$this._undelete;
  set undelete(covariant bool? undelete) => _$this._undelete = undelete;

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
  void replace(covariant FilesTrashbinCapabilities_Files other) {
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

abstract mixin class FilesTrashbinCapabilitiesInterfaceBuilder {
  void replace(FilesTrashbinCapabilitiesInterface other);
  void update(void Function(FilesTrashbinCapabilitiesInterfaceBuilder) updates);
  FilesTrashbinCapabilities_FilesBuilder get files;
  set files(FilesTrashbinCapabilities_FilesBuilder? files);
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

class FilesTrashbinCapabilitiesBuilder
    implements
        Builder<FilesTrashbinCapabilities, FilesTrashbinCapabilitiesBuilder>,
        FilesTrashbinCapabilitiesInterfaceBuilder {
  _$FilesTrashbinCapabilities? _$v;

  FilesTrashbinCapabilities_FilesBuilder? _files;
  FilesTrashbinCapabilities_FilesBuilder get files => _$this._files ??= FilesTrashbinCapabilities_FilesBuilder();
  set files(covariant FilesTrashbinCapabilities_FilesBuilder? files) => _$this._files = files;

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
  void replace(covariant FilesTrashbinCapabilities other) {
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

abstract mixin class NotificationsCapabilities_NotificationsInterfaceBuilder {
  void replace(NotificationsCapabilities_NotificationsInterface other);
  void update(void Function(NotificationsCapabilities_NotificationsInterfaceBuilder) updates);
  ListBuilder<String> get ocsEndpoints;
  set ocsEndpoints(ListBuilder<String>? ocsEndpoints);

  ListBuilder<String> get push;
  set push(ListBuilder<String>? push);

  ListBuilder<String> get adminNotifications;
  set adminNotifications(ListBuilder<String>? adminNotifications);
}

class _$NotificationsCapabilities_Notifications extends NotificationsCapabilities_Notifications {
  @override
  final BuiltList<String> ocsEndpoints;
  @override
  final BuiltList<String> push;
  @override
  final BuiltList<String> adminNotifications;

  factory _$NotificationsCapabilities_Notifications(
          [void Function(NotificationsCapabilities_NotificationsBuilder)? updates]) =>
      (NotificationsCapabilities_NotificationsBuilder()..update(updates))._build();

  _$NotificationsCapabilities_Notifications._(
      {required this.ocsEndpoints, required this.push, required this.adminNotifications})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(ocsEndpoints, r'NotificationsCapabilities_Notifications', 'ocsEndpoints');
    BuiltValueNullFieldError.checkNotNull(push, r'NotificationsCapabilities_Notifications', 'push');
    BuiltValueNullFieldError.checkNotNull(
        adminNotifications, r'NotificationsCapabilities_Notifications', 'adminNotifications');
  }

  @override
  NotificationsCapabilities_Notifications rebuild(
          void Function(NotificationsCapabilities_NotificationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsCapabilities_NotificationsBuilder toBuilder() =>
      NotificationsCapabilities_NotificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsCapabilities_Notifications &&
        ocsEndpoints == other.ocsEndpoints &&
        push == other.push &&
        adminNotifications == other.adminNotifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocsEndpoints.hashCode);
    _$hash = $jc(_$hash, push.hashCode);
    _$hash = $jc(_$hash, adminNotifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsCapabilities_Notifications')
          ..add('ocsEndpoints', ocsEndpoints)
          ..add('push', push)
          ..add('adminNotifications', adminNotifications))
        .toString();
  }
}

class NotificationsCapabilities_NotificationsBuilder
    implements
        Builder<NotificationsCapabilities_Notifications, NotificationsCapabilities_NotificationsBuilder>,
        NotificationsCapabilities_NotificationsInterfaceBuilder {
  _$NotificationsCapabilities_Notifications? _$v;

  ListBuilder<String>? _ocsEndpoints;
  ListBuilder<String> get ocsEndpoints => _$this._ocsEndpoints ??= ListBuilder<String>();
  set ocsEndpoints(covariant ListBuilder<String>? ocsEndpoints) => _$this._ocsEndpoints = ocsEndpoints;

  ListBuilder<String>? _push;
  ListBuilder<String> get push => _$this._push ??= ListBuilder<String>();
  set push(covariant ListBuilder<String>? push) => _$this._push = push;

  ListBuilder<String>? _adminNotifications;
  ListBuilder<String> get adminNotifications => _$this._adminNotifications ??= ListBuilder<String>();
  set adminNotifications(covariant ListBuilder<String>? adminNotifications) =>
      _$this._adminNotifications = adminNotifications;

  NotificationsCapabilities_NotificationsBuilder();

  NotificationsCapabilities_NotificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocsEndpoints = $v.ocsEndpoints.toBuilder();
      _push = $v.push.toBuilder();
      _adminNotifications = $v.adminNotifications.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsCapabilities_Notifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsCapabilities_Notifications;
  }

  @override
  void update(void Function(NotificationsCapabilities_NotificationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsCapabilities_Notifications build() => _build();

  _$NotificationsCapabilities_Notifications _build() {
    _$NotificationsCapabilities_Notifications _$result;
    try {
      _$result = _$v ??
          _$NotificationsCapabilities_Notifications._(
              ocsEndpoints: ocsEndpoints.build(), push: push.build(), adminNotifications: adminNotifications.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocsEndpoints';
        ocsEndpoints.build();
        _$failedField = 'push';
        push.build();
        _$failedField = 'adminNotifications';
        adminNotifications.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsCapabilities_Notifications', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsCapabilitiesInterfaceBuilder {
  void replace(NotificationsCapabilitiesInterface other);
  void update(void Function(NotificationsCapabilitiesInterfaceBuilder) updates);
  NotificationsCapabilities_NotificationsBuilder get notifications;
  set notifications(NotificationsCapabilities_NotificationsBuilder? notifications);
}

class _$NotificationsCapabilities extends NotificationsCapabilities {
  @override
  final NotificationsCapabilities_Notifications notifications;

  factory _$NotificationsCapabilities([void Function(NotificationsCapabilitiesBuilder)? updates]) =>
      (NotificationsCapabilitiesBuilder()..update(updates))._build();

  _$NotificationsCapabilities._({required this.notifications}) : super._() {
    BuiltValueNullFieldError.checkNotNull(notifications, r'NotificationsCapabilities', 'notifications');
  }

  @override
  NotificationsCapabilities rebuild(void Function(NotificationsCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsCapabilitiesBuilder toBuilder() => NotificationsCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsCapabilities && notifications == other.notifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsCapabilities')..add('notifications', notifications)).toString();
  }
}

class NotificationsCapabilitiesBuilder
    implements
        Builder<NotificationsCapabilities, NotificationsCapabilitiesBuilder>,
        NotificationsCapabilitiesInterfaceBuilder {
  _$NotificationsCapabilities? _$v;

  NotificationsCapabilities_NotificationsBuilder? _notifications;
  NotificationsCapabilities_NotificationsBuilder get notifications =>
      _$this._notifications ??= NotificationsCapabilities_NotificationsBuilder();
  set notifications(covariant NotificationsCapabilities_NotificationsBuilder? notifications) =>
      _$this._notifications = notifications;

  NotificationsCapabilitiesBuilder();

  NotificationsCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notifications = $v.notifications.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsCapabilities;
  }

  @override
  void update(void Function(NotificationsCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsCapabilities build() => _build();

  _$NotificationsCapabilities _build() {
    _$NotificationsCapabilities _$result;
    try {
      _$result = _$v ?? _$NotificationsCapabilities._(notifications: notifications.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notifications';
        notifications.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ProvisioningApiCapabilities_ProvisioningApiInterfaceBuilder {
  void replace(ProvisioningApiCapabilities_ProvisioningApiInterface other);
  void update(void Function(ProvisioningApiCapabilities_ProvisioningApiInterfaceBuilder) updates);
  String? get version;
  set version(String? version);

  int? get accountPropertyScopesVersion;
  set accountPropertyScopesVersion(int? accountPropertyScopesVersion);

  bool? get accountPropertyScopesFederatedEnabled;
  set accountPropertyScopesFederatedEnabled(bool? accountPropertyScopesFederatedEnabled);

  bool? get accountPropertyScopesPublishedEnabled;
  set accountPropertyScopesPublishedEnabled(bool? accountPropertyScopesPublishedEnabled);
}

class _$ProvisioningApiCapabilities_ProvisioningApi extends ProvisioningApiCapabilities_ProvisioningApi {
  @override
  final String version;
  @override
  final int accountPropertyScopesVersion;
  @override
  final bool accountPropertyScopesFederatedEnabled;
  @override
  final bool accountPropertyScopesPublishedEnabled;

  factory _$ProvisioningApiCapabilities_ProvisioningApi(
          [void Function(ProvisioningApiCapabilities_ProvisioningApiBuilder)? updates]) =>
      (ProvisioningApiCapabilities_ProvisioningApiBuilder()..update(updates))._build();

  _$ProvisioningApiCapabilities_ProvisioningApi._(
      {required this.version,
      required this.accountPropertyScopesVersion,
      required this.accountPropertyScopesFederatedEnabled,
      required this.accountPropertyScopesPublishedEnabled})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(version, r'ProvisioningApiCapabilities_ProvisioningApi', 'version');
    BuiltValueNullFieldError.checkNotNull(
        accountPropertyScopesVersion, r'ProvisioningApiCapabilities_ProvisioningApi', 'accountPropertyScopesVersion');
    BuiltValueNullFieldError.checkNotNull(accountPropertyScopesFederatedEnabled,
        r'ProvisioningApiCapabilities_ProvisioningApi', 'accountPropertyScopesFederatedEnabled');
    BuiltValueNullFieldError.checkNotNull(accountPropertyScopesPublishedEnabled,
        r'ProvisioningApiCapabilities_ProvisioningApi', 'accountPropertyScopesPublishedEnabled');
  }

  @override
  ProvisioningApiCapabilities_ProvisioningApi rebuild(
          void Function(ProvisioningApiCapabilities_ProvisioningApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiCapabilities_ProvisioningApiBuilder toBuilder() =>
      ProvisioningApiCapabilities_ProvisioningApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiCapabilities_ProvisioningApi &&
        version == other.version &&
        accountPropertyScopesVersion == other.accountPropertyScopesVersion &&
        accountPropertyScopesFederatedEnabled == other.accountPropertyScopesFederatedEnabled &&
        accountPropertyScopesPublishedEnabled == other.accountPropertyScopesPublishedEnabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, accountPropertyScopesVersion.hashCode);
    _$hash = $jc(_$hash, accountPropertyScopesFederatedEnabled.hashCode);
    _$hash = $jc(_$hash, accountPropertyScopesPublishedEnabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProvisioningApiCapabilities_ProvisioningApi')
          ..add('version', version)
          ..add('accountPropertyScopesVersion', accountPropertyScopesVersion)
          ..add('accountPropertyScopesFederatedEnabled', accountPropertyScopesFederatedEnabled)
          ..add('accountPropertyScopesPublishedEnabled', accountPropertyScopesPublishedEnabled))
        .toString();
  }
}

class ProvisioningApiCapabilities_ProvisioningApiBuilder
    implements
        Builder<ProvisioningApiCapabilities_ProvisioningApi, ProvisioningApiCapabilities_ProvisioningApiBuilder>,
        ProvisioningApiCapabilities_ProvisioningApiInterfaceBuilder {
  _$ProvisioningApiCapabilities_ProvisioningApi? _$v;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  int? _accountPropertyScopesVersion;
  int? get accountPropertyScopesVersion => _$this._accountPropertyScopesVersion;
  set accountPropertyScopesVersion(covariant int? accountPropertyScopesVersion) =>
      _$this._accountPropertyScopesVersion = accountPropertyScopesVersion;

  bool? _accountPropertyScopesFederatedEnabled;
  bool? get accountPropertyScopesFederatedEnabled => _$this._accountPropertyScopesFederatedEnabled;
  set accountPropertyScopesFederatedEnabled(covariant bool? accountPropertyScopesFederatedEnabled) =>
      _$this._accountPropertyScopesFederatedEnabled = accountPropertyScopesFederatedEnabled;

  bool? _accountPropertyScopesPublishedEnabled;
  bool? get accountPropertyScopesPublishedEnabled => _$this._accountPropertyScopesPublishedEnabled;
  set accountPropertyScopesPublishedEnabled(covariant bool? accountPropertyScopesPublishedEnabled) =>
      _$this._accountPropertyScopesPublishedEnabled = accountPropertyScopesPublishedEnabled;

  ProvisioningApiCapabilities_ProvisioningApiBuilder();

  ProvisioningApiCapabilities_ProvisioningApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _accountPropertyScopesVersion = $v.accountPropertyScopesVersion;
      _accountPropertyScopesFederatedEnabled = $v.accountPropertyScopesFederatedEnabled;
      _accountPropertyScopesPublishedEnabled = $v.accountPropertyScopesPublishedEnabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ProvisioningApiCapabilities_ProvisioningApi other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiCapabilities_ProvisioningApi;
  }

  @override
  void update(void Function(ProvisioningApiCapabilities_ProvisioningApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiCapabilities_ProvisioningApi build() => _build();

  _$ProvisioningApiCapabilities_ProvisioningApi _build() {
    final _$result = _$v ??
        _$ProvisioningApiCapabilities_ProvisioningApi._(
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'ProvisioningApiCapabilities_ProvisioningApi', 'version'),
            accountPropertyScopesVersion: BuiltValueNullFieldError.checkNotNull(accountPropertyScopesVersion,
                r'ProvisioningApiCapabilities_ProvisioningApi', 'accountPropertyScopesVersion'),
            accountPropertyScopesFederatedEnabled: BuiltValueNullFieldError.checkNotNull(
                accountPropertyScopesFederatedEnabled,
                r'ProvisioningApiCapabilities_ProvisioningApi',
                'accountPropertyScopesFederatedEnabled'),
            accountPropertyScopesPublishedEnabled: BuiltValueNullFieldError.checkNotNull(
                accountPropertyScopesPublishedEnabled,
                r'ProvisioningApiCapabilities_ProvisioningApi',
                'accountPropertyScopesPublishedEnabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ProvisioningApiCapabilitiesInterfaceBuilder {
  void replace(ProvisioningApiCapabilitiesInterface other);
  void update(void Function(ProvisioningApiCapabilitiesInterfaceBuilder) updates);
  ProvisioningApiCapabilities_ProvisioningApiBuilder get provisioningApi;
  set provisioningApi(ProvisioningApiCapabilities_ProvisioningApiBuilder? provisioningApi);
}

class _$ProvisioningApiCapabilities extends ProvisioningApiCapabilities {
  @override
  final ProvisioningApiCapabilities_ProvisioningApi provisioningApi;

  factory _$ProvisioningApiCapabilities([void Function(ProvisioningApiCapabilitiesBuilder)? updates]) =>
      (ProvisioningApiCapabilitiesBuilder()..update(updates))._build();

  _$ProvisioningApiCapabilities._({required this.provisioningApi}) : super._() {
    BuiltValueNullFieldError.checkNotNull(provisioningApi, r'ProvisioningApiCapabilities', 'provisioningApi');
  }

  @override
  ProvisioningApiCapabilities rebuild(void Function(ProvisioningApiCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiCapabilitiesBuilder toBuilder() => ProvisioningApiCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiCapabilities && provisioningApi == other.provisioningApi;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, provisioningApi.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProvisioningApiCapabilities')..add('provisioningApi', provisioningApi))
        .toString();
  }
}

class ProvisioningApiCapabilitiesBuilder
    implements
        Builder<ProvisioningApiCapabilities, ProvisioningApiCapabilitiesBuilder>,
        ProvisioningApiCapabilitiesInterfaceBuilder {
  _$ProvisioningApiCapabilities? _$v;

  ProvisioningApiCapabilities_ProvisioningApiBuilder? _provisioningApi;
  ProvisioningApiCapabilities_ProvisioningApiBuilder get provisioningApi =>
      _$this._provisioningApi ??= ProvisioningApiCapabilities_ProvisioningApiBuilder();
  set provisioningApi(covariant ProvisioningApiCapabilities_ProvisioningApiBuilder? provisioningApi) =>
      _$this._provisioningApi = provisioningApi;

  ProvisioningApiCapabilitiesBuilder();

  ProvisioningApiCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _provisioningApi = $v.provisioningApi.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ProvisioningApiCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiCapabilities;
  }

  @override
  void update(void Function(ProvisioningApiCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiCapabilities build() => _build();

  _$ProvisioningApiCapabilities _build() {
    _$ProvisioningApiCapabilities _$result;
    try {
      _$result = _$v ?? _$ProvisioningApiCapabilities._(provisioningApi: provisioningApi.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'provisioningApi';
        provisioningApi.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ProvisioningApiCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder {
  void replace(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface other);
  void update(void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop
    extends SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop {
  @override
  final bool enabled;

  factory _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop(
          [void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder)? updates]) =>
      (SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder()..update(updates))._build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop', 'enabled');
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop rebuild(
          void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder toBuilder() =>
      SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop')
          ..add('enabled', enabled))
        .toString();
  }
}

class SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder
    implements
        Builder<SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
            SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder>,
        SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder {
  _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder();

  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop;
  }

  @override
  void update(void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop build() => _build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop _build() {
    final _$result = _$v ??
        _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterfaceBuilder {
  void replace(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterface other);
  void update(void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get enforced;
  set enforced(bool? enforced);
}

class _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password
    extends SharebymailCapabilities0_FilesSharing_Sharebymail_Password {
  @override
  final bool enabled;
  @override
  final bool enforced;

  factory _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password(
          [void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder)? updates]) =>
      (SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder()..update(updates))._build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password._({required this.enabled, required this.enforced})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail_Password', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        enforced, r'SharebymailCapabilities0_FilesSharing_Sharebymail_Password', 'enforced');
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_Password rebuild(
          void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder toBuilder() =>
      SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities0_FilesSharing_Sharebymail_Password &&
        enabled == other.enabled &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities0_FilesSharing_Sharebymail_Password')
          ..add('enabled', enabled)
          ..add('enforced', enforced))
        .toString();
  }
}

class SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder
    implements
        Builder<SharebymailCapabilities0_FilesSharing_Sharebymail_Password,
            SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder>,
        SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterfaceBuilder {
  _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder();

  SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities0_FilesSharing_Sharebymail_Password other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password;
  }

  @override
  void update(void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_Password build() => _build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password _build() {
    final _$result = _$v ??
        _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail_Password', 'enabled'),
            enforced: BuiltValueNullFieldError.checkNotNull(
                enforced, r'SharebymailCapabilities0_FilesSharing_Sharebymail_Password', 'enforced'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder {
  void replace(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterface other);
  void update(void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get enforced;
  set enforced(bool? enforced);
}

class _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate
    extends SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate {
  @override
  final bool enabled;
  @override
  final bool enforced;

  factory _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate(
          [void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder)? updates]) =>
      (SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder()..update(updates))._build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate._({required this.enabled, required this.enforced})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        enforced, r'SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate', 'enforced');
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate rebuild(
          void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder toBuilder() =>
      SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate &&
        enabled == other.enabled &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate')
          ..add('enabled', enabled)
          ..add('enforced', enforced))
        .toString();
  }
}

class SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder
    implements
        Builder<SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate,
            SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder>,
        SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder {
  _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(covariant bool? enforced) => _$this._enforced = enforced;

  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder();

  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate;
  }

  @override
  void update(void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate build() => _build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate _build() {
    final _$result = _$v ??
        _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate', 'enabled'),
            enforced: BuiltValueNullFieldError.checkNotNull(
                enforced, r'SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate', 'enforced'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities0_FilesSharing_SharebymailInterfaceBuilder {
  void replace(SharebymailCapabilities0_FilesSharing_SharebymailInterface other);
  void update(void Function(SharebymailCapabilities0_FilesSharing_SharebymailInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get sendPasswordByMail;
  set sendPasswordByMail(bool? sendPasswordByMail);

  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder get uploadFilesDrop;
  set uploadFilesDrop(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder? uploadFilesDrop);

  SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder get password;
  set password(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder? password);

  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder get expireDate;
  set expireDate(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder? expireDate);
}

class _$SharebymailCapabilities0_FilesSharing_Sharebymail extends SharebymailCapabilities0_FilesSharing_Sharebymail {
  @override
  final bool enabled;
  @override
  final bool sendPasswordByMail;
  @override
  final SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop uploadFilesDrop;
  @override
  final SharebymailCapabilities0_FilesSharing_Sharebymail_Password password;
  @override
  final SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate expireDate;

  factory _$SharebymailCapabilities0_FilesSharing_Sharebymail(
          [void Function(SharebymailCapabilities0_FilesSharing_SharebymailBuilder)? updates]) =>
      (SharebymailCapabilities0_FilesSharing_SharebymailBuilder()..update(updates))._build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail._(
      {required this.enabled,
      required this.sendPasswordByMail,
      required this.uploadFilesDrop,
      required this.password,
      required this.expireDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        sendPasswordByMail, r'SharebymailCapabilities0_FilesSharing_Sharebymail', 'sendPasswordByMail');
    BuiltValueNullFieldError.checkNotNull(
        uploadFilesDrop, r'SharebymailCapabilities0_FilesSharing_Sharebymail', 'uploadFilesDrop');
    BuiltValueNullFieldError.checkNotNull(password, r'SharebymailCapabilities0_FilesSharing_Sharebymail', 'password');
    BuiltValueNullFieldError.checkNotNull(
        expireDate, r'SharebymailCapabilities0_FilesSharing_Sharebymail', 'expireDate');
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail rebuild(
          void Function(SharebymailCapabilities0_FilesSharing_SharebymailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities0_FilesSharing_SharebymailBuilder toBuilder() =>
      SharebymailCapabilities0_FilesSharing_SharebymailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities0_FilesSharing_Sharebymail &&
        enabled == other.enabled &&
        sendPasswordByMail == other.sendPasswordByMail &&
        uploadFilesDrop == other.uploadFilesDrop &&
        password == other.password &&
        expireDate == other.expireDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, sendPasswordByMail.hashCode);
    _$hash = $jc(_$hash, uploadFilesDrop.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities0_FilesSharing_Sharebymail')
          ..add('enabled', enabled)
          ..add('sendPasswordByMail', sendPasswordByMail)
          ..add('uploadFilesDrop', uploadFilesDrop)
          ..add('password', password)
          ..add('expireDate', expireDate))
        .toString();
  }
}

class SharebymailCapabilities0_FilesSharing_SharebymailBuilder
    implements
        Builder<SharebymailCapabilities0_FilesSharing_Sharebymail,
            SharebymailCapabilities0_FilesSharing_SharebymailBuilder>,
        SharebymailCapabilities0_FilesSharing_SharebymailInterfaceBuilder {
  _$SharebymailCapabilities0_FilesSharing_Sharebymail? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _sendPasswordByMail;
  bool? get sendPasswordByMail => _$this._sendPasswordByMail;
  set sendPasswordByMail(covariant bool? sendPasswordByMail) => _$this._sendPasswordByMail = sendPasswordByMail;

  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder? _uploadFilesDrop;
  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder get uploadFilesDrop =>
      _$this._uploadFilesDrop ??= SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder();
  set uploadFilesDrop(
          covariant SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder? uploadFilesDrop) =>
      _$this._uploadFilesDrop = uploadFilesDrop;

  SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder? _password;
  SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder get password =>
      _$this._password ??= SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder();
  set password(covariant SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder? password) =>
      _$this._password = password;

  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder? _expireDate;
  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??= SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder();
  set expireDate(covariant SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  SharebymailCapabilities0_FilesSharing_SharebymailBuilder();

  SharebymailCapabilities0_FilesSharing_SharebymailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _sendPasswordByMail = $v.sendPasswordByMail;
      _uploadFilesDrop = $v.uploadFilesDrop.toBuilder();
      _password = $v.password.toBuilder();
      _expireDate = $v.expireDate.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities0_FilesSharing_Sharebymail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities0_FilesSharing_Sharebymail;
  }

  @override
  void update(void Function(SharebymailCapabilities0_FilesSharing_SharebymailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail build() => _build();

  _$SharebymailCapabilities0_FilesSharing_Sharebymail _build() {
    _$SharebymailCapabilities0_FilesSharing_Sharebymail _$result;
    try {
      _$result = _$v ??
          _$SharebymailCapabilities0_FilesSharing_Sharebymail._(
              enabled: BuiltValueNullFieldError.checkNotNull(
                  enabled, r'SharebymailCapabilities0_FilesSharing_Sharebymail', 'enabled'),
              sendPasswordByMail: BuiltValueNullFieldError.checkNotNull(
                  sendPasswordByMail, r'SharebymailCapabilities0_FilesSharing_Sharebymail', 'sendPasswordByMail'),
              uploadFilesDrop: uploadFilesDrop.build(),
              password: password.build(),
              expireDate: expireDate.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'uploadFilesDrop';
        uploadFilesDrop.build();
        _$failedField = 'password';
        password.build();
        _$failedField = 'expireDate';
        expireDate.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SharebymailCapabilities0_FilesSharing_Sharebymail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities0_FilesSharingInterfaceBuilder {
  void replace(SharebymailCapabilities0_FilesSharingInterface other);
  void update(void Function(SharebymailCapabilities0_FilesSharingInterfaceBuilder) updates);
  SharebymailCapabilities0_FilesSharing_SharebymailBuilder get sharebymail;
  set sharebymail(SharebymailCapabilities0_FilesSharing_SharebymailBuilder? sharebymail);
}

class _$SharebymailCapabilities0_FilesSharing extends SharebymailCapabilities0_FilesSharing {
  @override
  final SharebymailCapabilities0_FilesSharing_Sharebymail sharebymail;

  factory _$SharebymailCapabilities0_FilesSharing(
          [void Function(SharebymailCapabilities0_FilesSharingBuilder)? updates]) =>
      (SharebymailCapabilities0_FilesSharingBuilder()..update(updates))._build();

  _$SharebymailCapabilities0_FilesSharing._({required this.sharebymail}) : super._() {
    BuiltValueNullFieldError.checkNotNull(sharebymail, r'SharebymailCapabilities0_FilesSharing', 'sharebymail');
  }

  @override
  SharebymailCapabilities0_FilesSharing rebuild(void Function(SharebymailCapabilities0_FilesSharingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities0_FilesSharingBuilder toBuilder() =>
      SharebymailCapabilities0_FilesSharingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities0_FilesSharing && sharebymail == other.sharebymail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sharebymail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities0_FilesSharing')..add('sharebymail', sharebymail))
        .toString();
  }
}

class SharebymailCapabilities0_FilesSharingBuilder
    implements
        Builder<SharebymailCapabilities0_FilesSharing, SharebymailCapabilities0_FilesSharingBuilder>,
        SharebymailCapabilities0_FilesSharingInterfaceBuilder {
  _$SharebymailCapabilities0_FilesSharing? _$v;

  SharebymailCapabilities0_FilesSharing_SharebymailBuilder? _sharebymail;
  SharebymailCapabilities0_FilesSharing_SharebymailBuilder get sharebymail =>
      _$this._sharebymail ??= SharebymailCapabilities0_FilesSharing_SharebymailBuilder();
  set sharebymail(covariant SharebymailCapabilities0_FilesSharing_SharebymailBuilder? sharebymail) =>
      _$this._sharebymail = sharebymail;

  SharebymailCapabilities0_FilesSharingBuilder();

  SharebymailCapabilities0_FilesSharingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sharebymail = $v.sharebymail.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities0_FilesSharing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities0_FilesSharing;
  }

  @override
  void update(void Function(SharebymailCapabilities0_FilesSharingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities0_FilesSharing build() => _build();

  _$SharebymailCapabilities0_FilesSharing _build() {
    _$SharebymailCapabilities0_FilesSharing _$result;
    try {
      _$result = _$v ?? _$SharebymailCapabilities0_FilesSharing._(sharebymail: sharebymail.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sharebymail';
        sharebymail.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SharebymailCapabilities0_FilesSharing', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilities0InterfaceBuilder {
  void replace(SharebymailCapabilities0Interface other);
  void update(void Function(SharebymailCapabilities0InterfaceBuilder) updates);
  SharebymailCapabilities0_FilesSharingBuilder get filesSharing;
  set filesSharing(SharebymailCapabilities0_FilesSharingBuilder? filesSharing);
}

class _$SharebymailCapabilities0 extends SharebymailCapabilities0 {
  @override
  final SharebymailCapabilities0_FilesSharing filesSharing;

  factory _$SharebymailCapabilities0([void Function(SharebymailCapabilities0Builder)? updates]) =>
      (SharebymailCapabilities0Builder()..update(updates))._build();

  _$SharebymailCapabilities0._({required this.filesSharing}) : super._() {
    BuiltValueNullFieldError.checkNotNull(filesSharing, r'SharebymailCapabilities0', 'filesSharing');
  }

  @override
  SharebymailCapabilities0 rebuild(void Function(SharebymailCapabilities0Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilities0Builder toBuilder() => SharebymailCapabilities0Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities0 && filesSharing == other.filesSharing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, filesSharing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities0')..add('filesSharing', filesSharing)).toString();
  }
}

class SharebymailCapabilities0Builder
    implements
        Builder<SharebymailCapabilities0, SharebymailCapabilities0Builder>,
        SharebymailCapabilities0InterfaceBuilder {
  _$SharebymailCapabilities0? _$v;

  SharebymailCapabilities0_FilesSharingBuilder? _filesSharing;
  SharebymailCapabilities0_FilesSharingBuilder get filesSharing =>
      _$this._filesSharing ??= SharebymailCapabilities0_FilesSharingBuilder();
  set filesSharing(covariant SharebymailCapabilities0_FilesSharingBuilder? filesSharing) =>
      _$this._filesSharing = filesSharing;

  SharebymailCapabilities0Builder();

  SharebymailCapabilities0Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _filesSharing = $v.filesSharing.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities0 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities0;
  }

  @override
  void update(void Function(SharebymailCapabilities0Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities0 build() => _build();

  _$SharebymailCapabilities0 _build() {
    _$SharebymailCapabilities0 _$result;
    try {
      _$result = _$v ?? _$SharebymailCapabilities0._(filesSharing: filesSharing.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filesSharing';
        filesSharing.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SharebymailCapabilities0', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SharebymailCapabilitiesInterfaceBuilder {
  void replace(SharebymailCapabilitiesInterface other);
  void update(void Function(SharebymailCapabilitiesInterfaceBuilder) updates);
  SharebymailCapabilities0Builder get sharebymailCapabilities0;
  set sharebymailCapabilities0(SharebymailCapabilities0Builder? sharebymailCapabilities0);

  ListBuilder<JsonObject> get builtListJsonObject;
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject);
}

class _$SharebymailCapabilities extends SharebymailCapabilities {
  @override
  final JsonObject data;
  @override
  final SharebymailCapabilities0? sharebymailCapabilities0;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;

  factory _$SharebymailCapabilities([void Function(SharebymailCapabilitiesBuilder)? updates]) =>
      (SharebymailCapabilitiesBuilder()..update(updates))._build();

  _$SharebymailCapabilities._({required this.data, this.sharebymailCapabilities0, this.builtListJsonObject})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'SharebymailCapabilities', 'data');
  }

  @override
  SharebymailCapabilities rebuild(void Function(SharebymailCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SharebymailCapabilitiesBuilder toBuilder() => SharebymailCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SharebymailCapabilities &&
        data == other.data &&
        sharebymailCapabilities0 == other.sharebymailCapabilities0 &&
        builtListJsonObject == other.builtListJsonObject;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, sharebymailCapabilities0.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SharebymailCapabilities')
          ..add('data', data)
          ..add('sharebymailCapabilities0', sharebymailCapabilities0)
          ..add('builtListJsonObject', builtListJsonObject))
        .toString();
  }
}

class SharebymailCapabilitiesBuilder
    implements
        Builder<SharebymailCapabilities, SharebymailCapabilitiesBuilder>,
        SharebymailCapabilitiesInterfaceBuilder {
  _$SharebymailCapabilities? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  SharebymailCapabilities0Builder? _sharebymailCapabilities0;
  SharebymailCapabilities0Builder get sharebymailCapabilities0 =>
      _$this._sharebymailCapabilities0 ??= SharebymailCapabilities0Builder();
  set sharebymailCapabilities0(covariant SharebymailCapabilities0Builder? sharebymailCapabilities0) =>
      _$this._sharebymailCapabilities0 = sharebymailCapabilities0;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(covariant ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  SharebymailCapabilitiesBuilder();

  SharebymailCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _sharebymailCapabilities0 = $v.sharebymailCapabilities0?.toBuilder();
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SharebymailCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SharebymailCapabilities;
  }

  @override
  void update(void Function(SharebymailCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SharebymailCapabilities build() => _build();

  _$SharebymailCapabilities _build() {
    SharebymailCapabilities._validate(this);
    _$SharebymailCapabilities _$result;
    try {
      _$result = _$v ??
          _$SharebymailCapabilities._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'SharebymailCapabilities', 'data'),
              sharebymailCapabilities0: _sharebymailCapabilities0?.build(),
              builtListJsonObject: _builtListJsonObject?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sharebymailCapabilities0';
        _sharebymailCapabilities0?.build();
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SharebymailCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterface other);
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterfaceBuilder) updates);
  bool? get allowed;
  set allowed(bool? allowed);

  String? get folder;
  set folder(String? folder);
}

class _$SpreedPublicCapabilities0_Spreed_Config_Attachments
    extends SpreedPublicCapabilities0_Spreed_Config_Attachments {
  @override
  final bool allowed;
  @override
  final String? folder;

  factory _$SpreedPublicCapabilities0_Spreed_Config_Attachments(
          [void Function(SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder)? updates]) =>
      (SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed_Config_Attachments._({required this.allowed, this.folder}) : super._() {
    BuiltValueNullFieldError.checkNotNull(allowed, r'SpreedPublicCapabilities0_Spreed_Config_Attachments', 'allowed');
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Attachments rebuild(
          void Function(SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder toBuilder() =>
      SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed_Config_Attachments &&
        allowed == other.allowed &&
        folder == other.folder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, allowed.hashCode);
    _$hash = $jc(_$hash, folder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed_Config_Attachments')
          ..add('allowed', allowed)
          ..add('folder', folder))
        .toString();
  }
}

class SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed_Config_Attachments,
            SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder>,
        SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed_Config_Attachments? _$v;

  bool? _allowed;
  bool? get allowed => _$this._allowed;
  set allowed(covariant bool? allowed) => _$this._allowed = allowed;

  String? _folder;
  String? get folder => _$this._folder;
  set folder(covariant String? folder) => _$this._folder = folder;

  SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder();

  SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _allowed = $v.allowed;
      _folder = $v.folder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed_Config_Attachments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed_Config_Attachments;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Attachments build() => _build();

  _$SpreedPublicCapabilities0_Spreed_Config_Attachments _build() {
    final _$result = _$v ??
        _$SpreedPublicCapabilities0_Spreed_Config_Attachments._(
            allowed: BuiltValueNullFieldError.checkNotNull(
                allowed, r'SpreedPublicCapabilities0_Spreed_Config_Attachments', 'allowed'),
            folder: folder);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_Spreed_Config_CallInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_Spreed_Config_CallInterface other);
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_CallInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get breakoutRooms;
  set breakoutRooms(bool? breakoutRooms);

  bool? get recording;
  set recording(bool? recording);

  int? get recordingConsent;
  set recordingConsent(int? recordingConsent);

  ListBuilder<String> get supportedReactions;
  set supportedReactions(ListBuilder<String>? supportedReactions);

  ListBuilder<String> get predefinedBackgrounds;
  set predefinedBackgrounds(ListBuilder<String>? predefinedBackgrounds);

  bool? get canUploadBackground;
  set canUploadBackground(bool? canUploadBackground);

  bool? get sipEnabled;
  set sipEnabled(bool? sipEnabled);

  bool? get sipDialoutEnabled;
  set sipDialoutEnabled(bool? sipDialoutEnabled);

  bool? get canEnableSip;
  set canEnableSip(bool? canEnableSip);
}

class _$SpreedPublicCapabilities0_Spreed_Config_Call extends SpreedPublicCapabilities0_Spreed_Config_Call {
  @override
  final bool enabled;
  @override
  final bool breakoutRooms;
  @override
  final bool recording;
  @override
  final int? recordingConsent;
  @override
  final BuiltList<String> supportedReactions;
  @override
  final BuiltList<String> predefinedBackgrounds;
  @override
  final bool canUploadBackground;
  @override
  final bool? sipEnabled;
  @override
  final bool? sipDialoutEnabled;
  @override
  final bool? canEnableSip;

  factory _$SpreedPublicCapabilities0_Spreed_Config_Call(
          [void Function(SpreedPublicCapabilities0_Spreed_Config_CallBuilder)? updates]) =>
      (SpreedPublicCapabilities0_Spreed_Config_CallBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed_Config_Call._(
      {required this.enabled,
      required this.breakoutRooms,
      required this.recording,
      this.recordingConsent,
      required this.supportedReactions,
      required this.predefinedBackgrounds,
      required this.canUploadBackground,
      this.sipEnabled,
      this.sipDialoutEnabled,
      this.canEnableSip})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'enabled');
    BuiltValueNullFieldError.checkNotNull(
        breakoutRooms, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'breakoutRooms');
    BuiltValueNullFieldError.checkNotNull(recording, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'recording');
    BuiltValueNullFieldError.checkNotNull(
        supportedReactions, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'supportedReactions');
    BuiltValueNullFieldError.checkNotNull(
        predefinedBackgrounds, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'predefinedBackgrounds');
    BuiltValueNullFieldError.checkNotNull(
        canUploadBackground, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'canUploadBackground');
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Call rebuild(
          void Function(SpreedPublicCapabilities0_Spreed_Config_CallBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_Spreed_Config_CallBuilder toBuilder() =>
      SpreedPublicCapabilities0_Spreed_Config_CallBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed_Config_Call &&
        enabled == other.enabled &&
        breakoutRooms == other.breakoutRooms &&
        recording == other.recording &&
        recordingConsent == other.recordingConsent &&
        supportedReactions == other.supportedReactions &&
        predefinedBackgrounds == other.predefinedBackgrounds &&
        canUploadBackground == other.canUploadBackground &&
        sipEnabled == other.sipEnabled &&
        sipDialoutEnabled == other.sipDialoutEnabled &&
        canEnableSip == other.canEnableSip;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, breakoutRooms.hashCode);
    _$hash = $jc(_$hash, recording.hashCode);
    _$hash = $jc(_$hash, recordingConsent.hashCode);
    _$hash = $jc(_$hash, supportedReactions.hashCode);
    _$hash = $jc(_$hash, predefinedBackgrounds.hashCode);
    _$hash = $jc(_$hash, canUploadBackground.hashCode);
    _$hash = $jc(_$hash, sipEnabled.hashCode);
    _$hash = $jc(_$hash, sipDialoutEnabled.hashCode);
    _$hash = $jc(_$hash, canEnableSip.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed_Config_Call')
          ..add('enabled', enabled)
          ..add('breakoutRooms', breakoutRooms)
          ..add('recording', recording)
          ..add('recordingConsent', recordingConsent)
          ..add('supportedReactions', supportedReactions)
          ..add('predefinedBackgrounds', predefinedBackgrounds)
          ..add('canUploadBackground', canUploadBackground)
          ..add('sipEnabled', sipEnabled)
          ..add('sipDialoutEnabled', sipDialoutEnabled)
          ..add('canEnableSip', canEnableSip))
        .toString();
  }
}

class SpreedPublicCapabilities0_Spreed_Config_CallBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed_Config_Call, SpreedPublicCapabilities0_Spreed_Config_CallBuilder>,
        SpreedPublicCapabilities0_Spreed_Config_CallInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed_Config_Call? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _breakoutRooms;
  bool? get breakoutRooms => _$this._breakoutRooms;
  set breakoutRooms(covariant bool? breakoutRooms) => _$this._breakoutRooms = breakoutRooms;

  bool? _recording;
  bool? get recording => _$this._recording;
  set recording(covariant bool? recording) => _$this._recording = recording;

  int? _recordingConsent;
  int? get recordingConsent => _$this._recordingConsent;
  set recordingConsent(covariant int? recordingConsent) => _$this._recordingConsent = recordingConsent;

  ListBuilder<String>? _supportedReactions;
  ListBuilder<String> get supportedReactions => _$this._supportedReactions ??= ListBuilder<String>();
  set supportedReactions(covariant ListBuilder<String>? supportedReactions) =>
      _$this._supportedReactions = supportedReactions;

  ListBuilder<String>? _predefinedBackgrounds;
  ListBuilder<String> get predefinedBackgrounds => _$this._predefinedBackgrounds ??= ListBuilder<String>();
  set predefinedBackgrounds(covariant ListBuilder<String>? predefinedBackgrounds) =>
      _$this._predefinedBackgrounds = predefinedBackgrounds;

  bool? _canUploadBackground;
  bool? get canUploadBackground => _$this._canUploadBackground;
  set canUploadBackground(covariant bool? canUploadBackground) => _$this._canUploadBackground = canUploadBackground;

  bool? _sipEnabled;
  bool? get sipEnabled => _$this._sipEnabled;
  set sipEnabled(covariant bool? sipEnabled) => _$this._sipEnabled = sipEnabled;

  bool? _sipDialoutEnabled;
  bool? get sipDialoutEnabled => _$this._sipDialoutEnabled;
  set sipDialoutEnabled(covariant bool? sipDialoutEnabled) => _$this._sipDialoutEnabled = sipDialoutEnabled;

  bool? _canEnableSip;
  bool? get canEnableSip => _$this._canEnableSip;
  set canEnableSip(covariant bool? canEnableSip) => _$this._canEnableSip = canEnableSip;

  SpreedPublicCapabilities0_Spreed_Config_CallBuilder();

  SpreedPublicCapabilities0_Spreed_Config_CallBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _breakoutRooms = $v.breakoutRooms;
      _recording = $v.recording;
      _recordingConsent = $v.recordingConsent;
      _supportedReactions = $v.supportedReactions.toBuilder();
      _predefinedBackgrounds = $v.predefinedBackgrounds.toBuilder();
      _canUploadBackground = $v.canUploadBackground;
      _sipEnabled = $v.sipEnabled;
      _sipDialoutEnabled = $v.sipDialoutEnabled;
      _canEnableSip = $v.canEnableSip;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed_Config_Call other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed_Config_Call;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_CallBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Call build() => _build();

  _$SpreedPublicCapabilities0_Spreed_Config_Call _build() {
    _$SpreedPublicCapabilities0_Spreed_Config_Call _$result;
    try {
      _$result = _$v ??
          _$SpreedPublicCapabilities0_Spreed_Config_Call._(
              enabled: BuiltValueNullFieldError.checkNotNull(
                  enabled, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'enabled'),
              breakoutRooms: BuiltValueNullFieldError.checkNotNull(
                  breakoutRooms, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'breakoutRooms'),
              recording: BuiltValueNullFieldError.checkNotNull(
                  recording, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'recording'),
              recordingConsent: recordingConsent,
              supportedReactions: supportedReactions.build(),
              predefinedBackgrounds: predefinedBackgrounds.build(),
              canUploadBackground: BuiltValueNullFieldError.checkNotNull(
                  canUploadBackground, r'SpreedPublicCapabilities0_Spreed_Config_Call', 'canUploadBackground'),
              sipEnabled: sipEnabled,
              sipDialoutEnabled: sipDialoutEnabled,
              canEnableSip: canEnableSip);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'supportedReactions';
        supportedReactions.build();
        _$failedField = 'predefinedBackgrounds';
        predefinedBackgrounds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SpreedPublicCapabilities0_Spreed_Config_Call', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_Spreed_Config_ChatInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_Spreed_Config_ChatInterface other);
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_ChatInterfaceBuilder) updates);
  int? get maxLength;
  set maxLength(int? maxLength);

  int? get readPrivacy;
  set readPrivacy(int? readPrivacy);

  bool? get hasTranslationProviders;
  set hasTranslationProviders(bool? hasTranslationProviders);

  int? get typingPrivacy;
  set typingPrivacy(int? typingPrivacy);

  ListBuilder<String> get translations;
  set translations(ListBuilder<String>? translations);
}

class _$SpreedPublicCapabilities0_Spreed_Config_Chat extends SpreedPublicCapabilities0_Spreed_Config_Chat {
  @override
  final int maxLength;
  @override
  final int readPrivacy;
  @override
  final bool? hasTranslationProviders;
  @override
  final int typingPrivacy;
  @override
  final BuiltList<String>? translations;

  factory _$SpreedPublicCapabilities0_Spreed_Config_Chat(
          [void Function(SpreedPublicCapabilities0_Spreed_Config_ChatBuilder)? updates]) =>
      (SpreedPublicCapabilities0_Spreed_Config_ChatBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed_Config_Chat._(
      {required this.maxLength,
      required this.readPrivacy,
      this.hasTranslationProviders,
      required this.typingPrivacy,
      this.translations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(maxLength, r'SpreedPublicCapabilities0_Spreed_Config_Chat', 'maxLength');
    BuiltValueNullFieldError.checkNotNull(readPrivacy, r'SpreedPublicCapabilities0_Spreed_Config_Chat', 'readPrivacy');
    BuiltValueNullFieldError.checkNotNull(
        typingPrivacy, r'SpreedPublicCapabilities0_Spreed_Config_Chat', 'typingPrivacy');
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Chat rebuild(
          void Function(SpreedPublicCapabilities0_Spreed_Config_ChatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_Spreed_Config_ChatBuilder toBuilder() =>
      SpreedPublicCapabilities0_Spreed_Config_ChatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed_Config_Chat &&
        maxLength == other.maxLength &&
        readPrivacy == other.readPrivacy &&
        hasTranslationProviders == other.hasTranslationProviders &&
        typingPrivacy == other.typingPrivacy &&
        translations == other.translations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, maxLength.hashCode);
    _$hash = $jc(_$hash, readPrivacy.hashCode);
    _$hash = $jc(_$hash, hasTranslationProviders.hashCode);
    _$hash = $jc(_$hash, typingPrivacy.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed_Config_Chat')
          ..add('maxLength', maxLength)
          ..add('readPrivacy', readPrivacy)
          ..add('hasTranslationProviders', hasTranslationProviders)
          ..add('typingPrivacy', typingPrivacy)
          ..add('translations', translations))
        .toString();
  }
}

class SpreedPublicCapabilities0_Spreed_Config_ChatBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed_Config_Chat, SpreedPublicCapabilities0_Spreed_Config_ChatBuilder>,
        SpreedPublicCapabilities0_Spreed_Config_ChatInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed_Config_Chat? _$v;

  int? _maxLength;
  int? get maxLength => _$this._maxLength;
  set maxLength(covariant int? maxLength) => _$this._maxLength = maxLength;

  int? _readPrivacy;
  int? get readPrivacy => _$this._readPrivacy;
  set readPrivacy(covariant int? readPrivacy) => _$this._readPrivacy = readPrivacy;

  bool? _hasTranslationProviders;
  bool? get hasTranslationProviders => _$this._hasTranslationProviders;
  set hasTranslationProviders(covariant bool? hasTranslationProviders) =>
      _$this._hasTranslationProviders = hasTranslationProviders;

  int? _typingPrivacy;
  int? get typingPrivacy => _$this._typingPrivacy;
  set typingPrivacy(covariant int? typingPrivacy) => _$this._typingPrivacy = typingPrivacy;

  ListBuilder<String>? _translations;
  ListBuilder<String> get translations => _$this._translations ??= ListBuilder<String>();
  set translations(covariant ListBuilder<String>? translations) => _$this._translations = translations;

  SpreedPublicCapabilities0_Spreed_Config_ChatBuilder();

  SpreedPublicCapabilities0_Spreed_Config_ChatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _maxLength = $v.maxLength;
      _readPrivacy = $v.readPrivacy;
      _hasTranslationProviders = $v.hasTranslationProviders;
      _typingPrivacy = $v.typingPrivacy;
      _translations = $v.translations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed_Config_Chat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed_Config_Chat;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_ChatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Chat build() => _build();

  _$SpreedPublicCapabilities0_Spreed_Config_Chat _build() {
    _$SpreedPublicCapabilities0_Spreed_Config_Chat _$result;
    try {
      _$result = _$v ??
          _$SpreedPublicCapabilities0_Spreed_Config_Chat._(
              maxLength: BuiltValueNullFieldError.checkNotNull(
                  maxLength, r'SpreedPublicCapabilities0_Spreed_Config_Chat', 'maxLength'),
              readPrivacy: BuiltValueNullFieldError.checkNotNull(
                  readPrivacy, r'SpreedPublicCapabilities0_Spreed_Config_Chat', 'readPrivacy'),
              hasTranslationProviders: hasTranslationProviders,
              typingPrivacy: BuiltValueNullFieldError.checkNotNull(
                  typingPrivacy, r'SpreedPublicCapabilities0_Spreed_Config_Chat', 'typingPrivacy'),
              translations: _translations?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        _translations?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SpreedPublicCapabilities0_Spreed_Config_Chat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_Spreed_Config_ConversationsInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_Spreed_Config_ConversationsInterface other);
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_ConversationsInterfaceBuilder) updates);
  bool? get canCreate;
  set canCreate(bool? canCreate);
}

class _$SpreedPublicCapabilities0_Spreed_Config_Conversations
    extends SpreedPublicCapabilities0_Spreed_Config_Conversations {
  @override
  final bool canCreate;

  factory _$SpreedPublicCapabilities0_Spreed_Config_Conversations(
          [void Function(SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder)? updates]) =>
      (SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed_Config_Conversations._({required this.canCreate}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        canCreate, r'SpreedPublicCapabilities0_Spreed_Config_Conversations', 'canCreate');
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Conversations rebuild(
          void Function(SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder toBuilder() =>
      SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed_Config_Conversations && canCreate == other.canCreate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, canCreate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed_Config_Conversations')
          ..add('canCreate', canCreate))
        .toString();
  }
}

class SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed_Config_Conversations,
            SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder>,
        SpreedPublicCapabilities0_Spreed_Config_ConversationsInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed_Config_Conversations? _$v;

  bool? _canCreate;
  bool? get canCreate => _$this._canCreate;
  set canCreate(covariant bool? canCreate) => _$this._canCreate = canCreate;

  SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder();

  SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _canCreate = $v.canCreate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed_Config_Conversations other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed_Config_Conversations;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Conversations build() => _build();

  _$SpreedPublicCapabilities0_Spreed_Config_Conversations _build() {
    final _$result = _$v ??
        _$SpreedPublicCapabilities0_Spreed_Config_Conversations._(
            canCreate: BuiltValueNullFieldError.checkNotNull(
                canCreate, r'SpreedPublicCapabilities0_Spreed_Config_Conversations', 'canCreate'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_Spreed_Config_PreviewsInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_Spreed_Config_PreviewsInterface other);
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_PreviewsInterfaceBuilder) updates);
  int? get maxGifSize;
  set maxGifSize(int? maxGifSize);
}

class _$SpreedPublicCapabilities0_Spreed_Config_Previews extends SpreedPublicCapabilities0_Spreed_Config_Previews {
  @override
  final int maxGifSize;

  factory _$SpreedPublicCapabilities0_Spreed_Config_Previews(
          [void Function(SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder)? updates]) =>
      (SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed_Config_Previews._({required this.maxGifSize}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        maxGifSize, r'SpreedPublicCapabilities0_Spreed_Config_Previews', 'maxGifSize');
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Previews rebuild(
          void Function(SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder toBuilder() =>
      SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed_Config_Previews && maxGifSize == other.maxGifSize;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, maxGifSize.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed_Config_Previews')
          ..add('maxGifSize', maxGifSize))
        .toString();
  }
}

class SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed_Config_Previews,
            SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder>,
        SpreedPublicCapabilities0_Spreed_Config_PreviewsInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed_Config_Previews? _$v;

  int? _maxGifSize;
  int? get maxGifSize => _$this._maxGifSize;
  set maxGifSize(covariant int? maxGifSize) => _$this._maxGifSize = maxGifSize;

  SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder();

  SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _maxGifSize = $v.maxGifSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed_Config_Previews other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed_Config_Previews;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Previews build() => _build();

  _$SpreedPublicCapabilities0_Spreed_Config_Previews _build() {
    final _$result = _$v ??
        _$SpreedPublicCapabilities0_Spreed_Config_Previews._(
            maxGifSize: BuiltValueNullFieldError.checkNotNull(
                maxGifSize, r'SpreedPublicCapabilities0_Spreed_Config_Previews', 'maxGifSize'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_Spreed_Config_SignalingInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_Spreed_Config_SignalingInterface other);
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_SignalingInterfaceBuilder) updates);
  int? get sessionPingLimit;
  set sessionPingLimit(int? sessionPingLimit);

  String? get helloV2TokenKey;
  set helloV2TokenKey(String? helloV2TokenKey);
}

class _$SpreedPublicCapabilities0_Spreed_Config_Signaling extends SpreedPublicCapabilities0_Spreed_Config_Signaling {
  @override
  final int sessionPingLimit;
  @override
  final String? helloV2TokenKey;

  factory _$SpreedPublicCapabilities0_Spreed_Config_Signaling(
          [void Function(SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder)? updates]) =>
      (SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed_Config_Signaling._({required this.sessionPingLimit, this.helloV2TokenKey})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        sessionPingLimit, r'SpreedPublicCapabilities0_Spreed_Config_Signaling', 'sessionPingLimit');
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Signaling rebuild(
          void Function(SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder toBuilder() =>
      SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed_Config_Signaling &&
        sessionPingLimit == other.sessionPingLimit &&
        helloV2TokenKey == other.helloV2TokenKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sessionPingLimit.hashCode);
    _$hash = $jc(_$hash, helloV2TokenKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed_Config_Signaling')
          ..add('sessionPingLimit', sessionPingLimit)
          ..add('helloV2TokenKey', helloV2TokenKey))
        .toString();
  }
}

class SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed_Config_Signaling,
            SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder>,
        SpreedPublicCapabilities0_Spreed_Config_SignalingInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed_Config_Signaling? _$v;

  int? _sessionPingLimit;
  int? get sessionPingLimit => _$this._sessionPingLimit;
  set sessionPingLimit(covariant int? sessionPingLimit) => _$this._sessionPingLimit = sessionPingLimit;

  String? _helloV2TokenKey;
  String? get helloV2TokenKey => _$this._helloV2TokenKey;
  set helloV2TokenKey(covariant String? helloV2TokenKey) => _$this._helloV2TokenKey = helloV2TokenKey;

  SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder();

  SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessionPingLimit = $v.sessionPingLimit;
      _helloV2TokenKey = $v.helloV2TokenKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed_Config_Signaling other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed_Config_Signaling;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Signaling build() => _build();

  _$SpreedPublicCapabilities0_Spreed_Config_Signaling _build() {
    final _$result = _$v ??
        _$SpreedPublicCapabilities0_Spreed_Config_Signaling._(
            sessionPingLimit: BuiltValueNullFieldError.checkNotNull(
                sessionPingLimit, r'SpreedPublicCapabilities0_Spreed_Config_Signaling', 'sessionPingLimit'),
            helloV2TokenKey: helloV2TokenKey);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_Spreed_ConfigInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_Spreed_ConfigInterface other);
  void update(void Function(SpreedPublicCapabilities0_Spreed_ConfigInterfaceBuilder) updates);
  SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder get attachments;
  set attachments(SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder? attachments);

  SpreedPublicCapabilities0_Spreed_Config_CallBuilder get call;
  set call(SpreedPublicCapabilities0_Spreed_Config_CallBuilder? call);

  SpreedPublicCapabilities0_Spreed_Config_ChatBuilder get chat;
  set chat(SpreedPublicCapabilities0_Spreed_Config_ChatBuilder? chat);

  SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder get conversations;
  set conversations(SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder? conversations);

  SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder get previews;
  set previews(SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder? previews);

  SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder get signaling;
  set signaling(SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder? signaling);
}

class _$SpreedPublicCapabilities0_Spreed_Config extends SpreedPublicCapabilities0_Spreed_Config {
  @override
  final SpreedPublicCapabilities0_Spreed_Config_Attachments attachments;
  @override
  final SpreedPublicCapabilities0_Spreed_Config_Call call;
  @override
  final SpreedPublicCapabilities0_Spreed_Config_Chat chat;
  @override
  final SpreedPublicCapabilities0_Spreed_Config_Conversations conversations;
  @override
  final SpreedPublicCapabilities0_Spreed_Config_Previews previews;
  @override
  final SpreedPublicCapabilities0_Spreed_Config_Signaling signaling;

  factory _$SpreedPublicCapabilities0_Spreed_Config(
          [void Function(SpreedPublicCapabilities0_Spreed_ConfigBuilder)? updates]) =>
      (SpreedPublicCapabilities0_Spreed_ConfigBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed_Config._(
      {required this.attachments,
      required this.call,
      required this.chat,
      required this.conversations,
      required this.previews,
      required this.signaling})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(attachments, r'SpreedPublicCapabilities0_Spreed_Config', 'attachments');
    BuiltValueNullFieldError.checkNotNull(call, r'SpreedPublicCapabilities0_Spreed_Config', 'call');
    BuiltValueNullFieldError.checkNotNull(chat, r'SpreedPublicCapabilities0_Spreed_Config', 'chat');
    BuiltValueNullFieldError.checkNotNull(conversations, r'SpreedPublicCapabilities0_Spreed_Config', 'conversations');
    BuiltValueNullFieldError.checkNotNull(previews, r'SpreedPublicCapabilities0_Spreed_Config', 'previews');
    BuiltValueNullFieldError.checkNotNull(signaling, r'SpreedPublicCapabilities0_Spreed_Config', 'signaling');
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config rebuild(
          void Function(SpreedPublicCapabilities0_Spreed_ConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_Spreed_ConfigBuilder toBuilder() =>
      SpreedPublicCapabilities0_Spreed_ConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed_Config &&
        attachments == other.attachments &&
        call == other.call &&
        chat == other.chat &&
        conversations == other.conversations &&
        previews == other.previews &&
        signaling == other.signaling;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attachments.hashCode);
    _$hash = $jc(_$hash, call.hashCode);
    _$hash = $jc(_$hash, chat.hashCode);
    _$hash = $jc(_$hash, conversations.hashCode);
    _$hash = $jc(_$hash, previews.hashCode);
    _$hash = $jc(_$hash, signaling.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed_Config')
          ..add('attachments', attachments)
          ..add('call', call)
          ..add('chat', chat)
          ..add('conversations', conversations)
          ..add('previews', previews)
          ..add('signaling', signaling))
        .toString();
  }
}

class SpreedPublicCapabilities0_Spreed_ConfigBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed_Config, SpreedPublicCapabilities0_Spreed_ConfigBuilder>,
        SpreedPublicCapabilities0_Spreed_ConfigInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed_Config? _$v;

  SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder? _attachments;
  SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder get attachments =>
      _$this._attachments ??= SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder();
  set attachments(covariant SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder? attachments) =>
      _$this._attachments = attachments;

  SpreedPublicCapabilities0_Spreed_Config_CallBuilder? _call;
  SpreedPublicCapabilities0_Spreed_Config_CallBuilder get call =>
      _$this._call ??= SpreedPublicCapabilities0_Spreed_Config_CallBuilder();
  set call(covariant SpreedPublicCapabilities0_Spreed_Config_CallBuilder? call) => _$this._call = call;

  SpreedPublicCapabilities0_Spreed_Config_ChatBuilder? _chat;
  SpreedPublicCapabilities0_Spreed_Config_ChatBuilder get chat =>
      _$this._chat ??= SpreedPublicCapabilities0_Spreed_Config_ChatBuilder();
  set chat(covariant SpreedPublicCapabilities0_Spreed_Config_ChatBuilder? chat) => _$this._chat = chat;

  SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder? _conversations;
  SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder get conversations =>
      _$this._conversations ??= SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder();
  set conversations(covariant SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder? conversations) =>
      _$this._conversations = conversations;

  SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder? _previews;
  SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder get previews =>
      _$this._previews ??= SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder();
  set previews(covariant SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder? previews) =>
      _$this._previews = previews;

  SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder? _signaling;
  SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder get signaling =>
      _$this._signaling ??= SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder();
  set signaling(covariant SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder? signaling) =>
      _$this._signaling = signaling;

  SpreedPublicCapabilities0_Spreed_ConfigBuilder();

  SpreedPublicCapabilities0_Spreed_ConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attachments = $v.attachments.toBuilder();
      _call = $v.call.toBuilder();
      _chat = $v.chat.toBuilder();
      _conversations = $v.conversations.toBuilder();
      _previews = $v.previews.toBuilder();
      _signaling = $v.signaling.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed_Config other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed_Config;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_Spreed_ConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config build() => _build();

  _$SpreedPublicCapabilities0_Spreed_Config _build() {
    _$SpreedPublicCapabilities0_Spreed_Config _$result;
    try {
      _$result = _$v ??
          _$SpreedPublicCapabilities0_Spreed_Config._(
              attachments: attachments.build(),
              call: call.build(),
              chat: chat.build(),
              conversations: conversations.build(),
              previews: previews.build(),
              signaling: signaling.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attachments';
        attachments.build();
        _$failedField = 'call';
        call.build();
        _$failedField = 'chat';
        chat.build();
        _$failedField = 'conversations';
        conversations.build();
        _$failedField = 'previews';
        previews.build();
        _$failedField = 'signaling';
        signaling.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SpreedPublicCapabilities0_Spreed_Config', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0_SpreedInterfaceBuilder {
  void replace(SpreedPublicCapabilities0_SpreedInterface other);
  void update(void Function(SpreedPublicCapabilities0_SpreedInterfaceBuilder) updates);
  ListBuilder<String> get features;
  set features(ListBuilder<String>? features);

  SpreedPublicCapabilities0_Spreed_ConfigBuilder get config;
  set config(SpreedPublicCapabilities0_Spreed_ConfigBuilder? config);

  String? get version;
  set version(String? version);
}

class _$SpreedPublicCapabilities0_Spreed extends SpreedPublicCapabilities0_Spreed {
  @override
  final BuiltList<String> features;
  @override
  final SpreedPublicCapabilities0_Spreed_Config config;
  @override
  final String version;

  factory _$SpreedPublicCapabilities0_Spreed([void Function(SpreedPublicCapabilities0_SpreedBuilder)? updates]) =>
      (SpreedPublicCapabilities0_SpreedBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities0_Spreed._({required this.features, required this.config, required this.version})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(features, r'SpreedPublicCapabilities0_Spreed', 'features');
    BuiltValueNullFieldError.checkNotNull(config, r'SpreedPublicCapabilities0_Spreed', 'config');
    BuiltValueNullFieldError.checkNotNull(version, r'SpreedPublicCapabilities0_Spreed', 'version');
  }

  @override
  SpreedPublicCapabilities0_Spreed rebuild(void Function(SpreedPublicCapabilities0_SpreedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0_SpreedBuilder toBuilder() => SpreedPublicCapabilities0_SpreedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0_Spreed &&
        features == other.features &&
        config == other.config &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, features.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0_Spreed')
          ..add('features', features)
          ..add('config', config)
          ..add('version', version))
        .toString();
  }
}

class SpreedPublicCapabilities0_SpreedBuilder
    implements
        Builder<SpreedPublicCapabilities0_Spreed, SpreedPublicCapabilities0_SpreedBuilder>,
        SpreedPublicCapabilities0_SpreedInterfaceBuilder {
  _$SpreedPublicCapabilities0_Spreed? _$v;

  ListBuilder<String>? _features;
  ListBuilder<String> get features => _$this._features ??= ListBuilder<String>();
  set features(covariant ListBuilder<String>? features) => _$this._features = features;

  SpreedPublicCapabilities0_Spreed_ConfigBuilder? _config;
  SpreedPublicCapabilities0_Spreed_ConfigBuilder get config =>
      _$this._config ??= SpreedPublicCapabilities0_Spreed_ConfigBuilder();
  set config(covariant SpreedPublicCapabilities0_Spreed_ConfigBuilder? config) => _$this._config = config;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  SpreedPublicCapabilities0_SpreedBuilder();

  SpreedPublicCapabilities0_SpreedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _features = $v.features.toBuilder();
      _config = $v.config.toBuilder();
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0_Spreed other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0_Spreed;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0_SpreedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0_Spreed build() => _build();

  _$SpreedPublicCapabilities0_Spreed _build() {
    _$SpreedPublicCapabilities0_Spreed _$result;
    try {
      _$result = _$v ??
          _$SpreedPublicCapabilities0_Spreed._(
              features: features.build(),
              config: config.build(),
              version: BuiltValueNullFieldError.checkNotNull(version, r'SpreedPublicCapabilities0_Spreed', 'version'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'features';
        features.build();
        _$failedField = 'config';
        config.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SpreedPublicCapabilities0_Spreed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilities0InterfaceBuilder {
  void replace(SpreedPublicCapabilities0Interface other);
  void update(void Function(SpreedPublicCapabilities0InterfaceBuilder) updates);
  SpreedPublicCapabilities0_SpreedBuilder get spreed;
  set spreed(SpreedPublicCapabilities0_SpreedBuilder? spreed);
}

class _$SpreedPublicCapabilities0 extends SpreedPublicCapabilities0 {
  @override
  final SpreedPublicCapabilities0_Spreed spreed;

  factory _$SpreedPublicCapabilities0([void Function(SpreedPublicCapabilities0Builder)? updates]) =>
      (SpreedPublicCapabilities0Builder()..update(updates))._build();

  _$SpreedPublicCapabilities0._({required this.spreed}) : super._() {
    BuiltValueNullFieldError.checkNotNull(spreed, r'SpreedPublicCapabilities0', 'spreed');
  }

  @override
  SpreedPublicCapabilities0 rebuild(void Function(SpreedPublicCapabilities0Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilities0Builder toBuilder() => SpreedPublicCapabilities0Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities0 && spreed == other.spreed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, spreed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities0')..add('spreed', spreed)).toString();
  }
}

class SpreedPublicCapabilities0Builder
    implements
        Builder<SpreedPublicCapabilities0, SpreedPublicCapabilities0Builder>,
        SpreedPublicCapabilities0InterfaceBuilder {
  _$SpreedPublicCapabilities0? _$v;

  SpreedPublicCapabilities0_SpreedBuilder? _spreed;
  SpreedPublicCapabilities0_SpreedBuilder get spreed => _$this._spreed ??= SpreedPublicCapabilities0_SpreedBuilder();
  set spreed(covariant SpreedPublicCapabilities0_SpreedBuilder? spreed) => _$this._spreed = spreed;

  SpreedPublicCapabilities0Builder();

  SpreedPublicCapabilities0Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _spreed = $v.spreed.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities0 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities0;
  }

  @override
  void update(void Function(SpreedPublicCapabilities0Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities0 build() => _build();

  _$SpreedPublicCapabilities0 _build() {
    _$SpreedPublicCapabilities0 _$result;
    try {
      _$result = _$v ?? _$SpreedPublicCapabilities0._(spreed: spreed.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'spreed';
        spreed.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SpreedPublicCapabilities0', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SpreedPublicCapabilitiesInterfaceBuilder {
  void replace(SpreedPublicCapabilitiesInterface other);
  void update(void Function(SpreedPublicCapabilitiesInterfaceBuilder) updates);
  SpreedPublicCapabilities0Builder get spreedPublicCapabilities0;
  set spreedPublicCapabilities0(SpreedPublicCapabilities0Builder? spreedPublicCapabilities0);

  ListBuilder<JsonObject> get builtListJsonObject;
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject);
}

class _$SpreedPublicCapabilities extends SpreedPublicCapabilities {
  @override
  final JsonObject data;
  @override
  final SpreedPublicCapabilities0? spreedPublicCapabilities0;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;

  factory _$SpreedPublicCapabilities([void Function(SpreedPublicCapabilitiesBuilder)? updates]) =>
      (SpreedPublicCapabilitiesBuilder()..update(updates))._build();

  _$SpreedPublicCapabilities._({required this.data, this.spreedPublicCapabilities0, this.builtListJsonObject})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'SpreedPublicCapabilities', 'data');
  }

  @override
  SpreedPublicCapabilities rebuild(void Function(SpreedPublicCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpreedPublicCapabilitiesBuilder toBuilder() => SpreedPublicCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpreedPublicCapabilities &&
        data == other.data &&
        spreedPublicCapabilities0 == other.spreedPublicCapabilities0 &&
        builtListJsonObject == other.builtListJsonObject;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, spreedPublicCapabilities0.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpreedPublicCapabilities')
          ..add('data', data)
          ..add('spreedPublicCapabilities0', spreedPublicCapabilities0)
          ..add('builtListJsonObject', builtListJsonObject))
        .toString();
  }
}

class SpreedPublicCapabilitiesBuilder
    implements
        Builder<SpreedPublicCapabilities, SpreedPublicCapabilitiesBuilder>,
        SpreedPublicCapabilitiesInterfaceBuilder {
  _$SpreedPublicCapabilities? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  SpreedPublicCapabilities0Builder? _spreedPublicCapabilities0;
  SpreedPublicCapabilities0Builder get spreedPublicCapabilities0 =>
      _$this._spreedPublicCapabilities0 ??= SpreedPublicCapabilities0Builder();
  set spreedPublicCapabilities0(covariant SpreedPublicCapabilities0Builder? spreedPublicCapabilities0) =>
      _$this._spreedPublicCapabilities0 = spreedPublicCapabilities0;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(covariant ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  SpreedPublicCapabilitiesBuilder();

  SpreedPublicCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _spreedPublicCapabilities0 = $v.spreedPublicCapabilities0?.toBuilder();
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SpreedPublicCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpreedPublicCapabilities;
  }

  @override
  void update(void Function(SpreedPublicCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpreedPublicCapabilities build() => _build();

  _$SpreedPublicCapabilities _build() {
    SpreedPublicCapabilities._validate(this);
    _$SpreedPublicCapabilities _$result;
    try {
      _$result = _$v ??
          _$SpreedPublicCapabilities._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'SpreedPublicCapabilities', 'data'),
              spreedPublicCapabilities0: _spreedPublicCapabilities0?.build(),
              builtListJsonObject: _builtListJsonObject?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'spreedPublicCapabilities0';
        _spreedPublicCapabilities0?.build();
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'SpreedPublicCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingPublicCapabilities_ThemingInterfaceBuilder {
  void replace(ThemingPublicCapabilities_ThemingInterface other);
  void update(void Function(ThemingPublicCapabilities_ThemingInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get url;
  set url(String? url);

  String? get slogan;
  set slogan(String? slogan);

  String? get color;
  set color(String? color);

  String? get colorText;
  set colorText(String? colorText);

  String? get colorElement;
  set colorElement(String? colorElement);

  String? get colorElementBright;
  set colorElementBright(String? colorElementBright);

  String? get colorElementDark;
  set colorElementDark(String? colorElementDark);

  String? get logo;
  set logo(String? logo);

  String? get background;
  set background(String? background);

  bool? get backgroundPlain;
  set backgroundPlain(bool? backgroundPlain);

  bool? get backgroundDefault;
  set backgroundDefault(bool? backgroundDefault);

  String? get logoheader;
  set logoheader(String? logoheader);

  String? get favicon;
  set favicon(String? favicon);
}

class _$ThemingPublicCapabilities_Theming extends ThemingPublicCapabilities_Theming {
  @override
  final String name;
  @override
  final String url;
  @override
  final String slogan;
  @override
  final String color;
  @override
  final String colorText;
  @override
  final String colorElement;
  @override
  final String colorElementBright;
  @override
  final String colorElementDark;
  @override
  final String logo;
  @override
  final String background;
  @override
  final bool backgroundPlain;
  @override
  final bool backgroundDefault;
  @override
  final String logoheader;
  @override
  final String favicon;

  factory _$ThemingPublicCapabilities_Theming([void Function(ThemingPublicCapabilities_ThemingBuilder)? updates]) =>
      (ThemingPublicCapabilities_ThemingBuilder()..update(updates))._build();

  _$ThemingPublicCapabilities_Theming._(
      {required this.name,
      required this.url,
      required this.slogan,
      required this.color,
      required this.colorText,
      required this.colorElement,
      required this.colorElementBright,
      required this.colorElementDark,
      required this.logo,
      required this.background,
      required this.backgroundPlain,
      required this.backgroundDefault,
      required this.logoheader,
      required this.favicon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ThemingPublicCapabilities_Theming', 'name');
    BuiltValueNullFieldError.checkNotNull(url, r'ThemingPublicCapabilities_Theming', 'url');
    BuiltValueNullFieldError.checkNotNull(slogan, r'ThemingPublicCapabilities_Theming', 'slogan');
    BuiltValueNullFieldError.checkNotNull(color, r'ThemingPublicCapabilities_Theming', 'color');
    BuiltValueNullFieldError.checkNotNull(colorText, r'ThemingPublicCapabilities_Theming', 'colorText');
    BuiltValueNullFieldError.checkNotNull(colorElement, r'ThemingPublicCapabilities_Theming', 'colorElement');
    BuiltValueNullFieldError.checkNotNull(
        colorElementBright, r'ThemingPublicCapabilities_Theming', 'colorElementBright');
    BuiltValueNullFieldError.checkNotNull(colorElementDark, r'ThemingPublicCapabilities_Theming', 'colorElementDark');
    BuiltValueNullFieldError.checkNotNull(logo, r'ThemingPublicCapabilities_Theming', 'logo');
    BuiltValueNullFieldError.checkNotNull(background, r'ThemingPublicCapabilities_Theming', 'background');
    BuiltValueNullFieldError.checkNotNull(backgroundPlain, r'ThemingPublicCapabilities_Theming', 'backgroundPlain');
    BuiltValueNullFieldError.checkNotNull(backgroundDefault, r'ThemingPublicCapabilities_Theming', 'backgroundDefault');
    BuiltValueNullFieldError.checkNotNull(logoheader, r'ThemingPublicCapabilities_Theming', 'logoheader');
    BuiltValueNullFieldError.checkNotNull(favicon, r'ThemingPublicCapabilities_Theming', 'favicon');
  }

  @override
  ThemingPublicCapabilities_Theming rebuild(void Function(ThemingPublicCapabilities_ThemingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingPublicCapabilities_ThemingBuilder toBuilder() => ThemingPublicCapabilities_ThemingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingPublicCapabilities_Theming &&
        name == other.name &&
        url == other.url &&
        slogan == other.slogan &&
        color == other.color &&
        colorText == other.colorText &&
        colorElement == other.colorElement &&
        colorElementBright == other.colorElementBright &&
        colorElementDark == other.colorElementDark &&
        logo == other.logo &&
        background == other.background &&
        backgroundPlain == other.backgroundPlain &&
        backgroundDefault == other.backgroundDefault &&
        logoheader == other.logoheader &&
        favicon == other.favicon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, slogan.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, colorText.hashCode);
    _$hash = $jc(_$hash, colorElement.hashCode);
    _$hash = $jc(_$hash, colorElementBright.hashCode);
    _$hash = $jc(_$hash, colorElementDark.hashCode);
    _$hash = $jc(_$hash, logo.hashCode);
    _$hash = $jc(_$hash, background.hashCode);
    _$hash = $jc(_$hash, backgroundPlain.hashCode);
    _$hash = $jc(_$hash, backgroundDefault.hashCode);
    _$hash = $jc(_$hash, logoheader.hashCode);
    _$hash = $jc(_$hash, favicon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingPublicCapabilities_Theming')
          ..add('name', name)
          ..add('url', url)
          ..add('slogan', slogan)
          ..add('color', color)
          ..add('colorText', colorText)
          ..add('colorElement', colorElement)
          ..add('colorElementBright', colorElementBright)
          ..add('colorElementDark', colorElementDark)
          ..add('logo', logo)
          ..add('background', background)
          ..add('backgroundPlain', backgroundPlain)
          ..add('backgroundDefault', backgroundDefault)
          ..add('logoheader', logoheader)
          ..add('favicon', favicon))
        .toString();
  }
}

class ThemingPublicCapabilities_ThemingBuilder
    implements
        Builder<ThemingPublicCapabilities_Theming, ThemingPublicCapabilities_ThemingBuilder>,
        ThemingPublicCapabilities_ThemingInterfaceBuilder {
  _$ThemingPublicCapabilities_Theming? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  String? _slogan;
  String? get slogan => _$this._slogan;
  set slogan(covariant String? slogan) => _$this._slogan = slogan;

  String? _color;
  String? get color => _$this._color;
  set color(covariant String? color) => _$this._color = color;

  String? _colorText;
  String? get colorText => _$this._colorText;
  set colorText(covariant String? colorText) => _$this._colorText = colorText;

  String? _colorElement;
  String? get colorElement => _$this._colorElement;
  set colorElement(covariant String? colorElement) => _$this._colorElement = colorElement;

  String? _colorElementBright;
  String? get colorElementBright => _$this._colorElementBright;
  set colorElementBright(covariant String? colorElementBright) => _$this._colorElementBright = colorElementBright;

  String? _colorElementDark;
  String? get colorElementDark => _$this._colorElementDark;
  set colorElementDark(covariant String? colorElementDark) => _$this._colorElementDark = colorElementDark;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(covariant String? logo) => _$this._logo = logo;

  String? _background;
  String? get background => _$this._background;
  set background(covariant String? background) => _$this._background = background;

  bool? _backgroundPlain;
  bool? get backgroundPlain => _$this._backgroundPlain;
  set backgroundPlain(covariant bool? backgroundPlain) => _$this._backgroundPlain = backgroundPlain;

  bool? _backgroundDefault;
  bool? get backgroundDefault => _$this._backgroundDefault;
  set backgroundDefault(covariant bool? backgroundDefault) => _$this._backgroundDefault = backgroundDefault;

  String? _logoheader;
  String? get logoheader => _$this._logoheader;
  set logoheader(covariant String? logoheader) => _$this._logoheader = logoheader;

  String? _favicon;
  String? get favicon => _$this._favicon;
  set favicon(covariant String? favicon) => _$this._favicon = favicon;

  ThemingPublicCapabilities_ThemingBuilder();

  ThemingPublicCapabilities_ThemingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _url = $v.url;
      _slogan = $v.slogan;
      _color = $v.color;
      _colorText = $v.colorText;
      _colorElement = $v.colorElement;
      _colorElementBright = $v.colorElementBright;
      _colorElementDark = $v.colorElementDark;
      _logo = $v.logo;
      _background = $v.background;
      _backgroundPlain = $v.backgroundPlain;
      _backgroundDefault = $v.backgroundDefault;
      _logoheader = $v.logoheader;
      _favicon = $v.favicon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingPublicCapabilities_Theming other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingPublicCapabilities_Theming;
  }

  @override
  void update(void Function(ThemingPublicCapabilities_ThemingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingPublicCapabilities_Theming build() => _build();

  _$ThemingPublicCapabilities_Theming _build() {
    final _$result = _$v ??
        _$ThemingPublicCapabilities_Theming._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'ThemingPublicCapabilities_Theming', 'name'),
            url: BuiltValueNullFieldError.checkNotNull(url, r'ThemingPublicCapabilities_Theming', 'url'),
            slogan: BuiltValueNullFieldError.checkNotNull(slogan, r'ThemingPublicCapabilities_Theming', 'slogan'),
            color: BuiltValueNullFieldError.checkNotNull(color, r'ThemingPublicCapabilities_Theming', 'color'),
            colorText:
                BuiltValueNullFieldError.checkNotNull(colorText, r'ThemingPublicCapabilities_Theming', 'colorText'),
            colorElement: BuiltValueNullFieldError.checkNotNull(
                colorElement, r'ThemingPublicCapabilities_Theming', 'colorElement'),
            colorElementBright: BuiltValueNullFieldError.checkNotNull(
                colorElementBright, r'ThemingPublicCapabilities_Theming', 'colorElementBright'),
            colorElementDark: BuiltValueNullFieldError.checkNotNull(
                colorElementDark, r'ThemingPublicCapabilities_Theming', 'colorElementDark'),
            logo: BuiltValueNullFieldError.checkNotNull(logo, r'ThemingPublicCapabilities_Theming', 'logo'),
            background:
                BuiltValueNullFieldError.checkNotNull(background, r'ThemingPublicCapabilities_Theming', 'background'),
            backgroundPlain: BuiltValueNullFieldError.checkNotNull(
                backgroundPlain, r'ThemingPublicCapabilities_Theming', 'backgroundPlain'),
            backgroundDefault: BuiltValueNullFieldError.checkNotNull(
                backgroundDefault, r'ThemingPublicCapabilities_Theming', 'backgroundDefault'),
            logoheader:
                BuiltValueNullFieldError.checkNotNull(logoheader, r'ThemingPublicCapabilities_Theming', 'logoheader'),
            favicon: BuiltValueNullFieldError.checkNotNull(favicon, r'ThemingPublicCapabilities_Theming', 'favicon'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingPublicCapabilitiesInterfaceBuilder {
  void replace(ThemingPublicCapabilitiesInterface other);
  void update(void Function(ThemingPublicCapabilitiesInterfaceBuilder) updates);
  ThemingPublicCapabilities_ThemingBuilder get theming;
  set theming(ThemingPublicCapabilities_ThemingBuilder? theming);
}

class _$ThemingPublicCapabilities extends ThemingPublicCapabilities {
  @override
  final ThemingPublicCapabilities_Theming theming;

  factory _$ThemingPublicCapabilities([void Function(ThemingPublicCapabilitiesBuilder)? updates]) =>
      (ThemingPublicCapabilitiesBuilder()..update(updates))._build();

  _$ThemingPublicCapabilities._({required this.theming}) : super._() {
    BuiltValueNullFieldError.checkNotNull(theming, r'ThemingPublicCapabilities', 'theming');
  }

  @override
  ThemingPublicCapabilities rebuild(void Function(ThemingPublicCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingPublicCapabilitiesBuilder toBuilder() => ThemingPublicCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingPublicCapabilities && theming == other.theming;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, theming.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingPublicCapabilities')..add('theming', theming)).toString();
  }
}

class ThemingPublicCapabilitiesBuilder
    implements
        Builder<ThemingPublicCapabilities, ThemingPublicCapabilitiesBuilder>,
        ThemingPublicCapabilitiesInterfaceBuilder {
  _$ThemingPublicCapabilities? _$v;

  ThemingPublicCapabilities_ThemingBuilder? _theming;
  ThemingPublicCapabilities_ThemingBuilder get theming =>
      _$this._theming ??= ThemingPublicCapabilities_ThemingBuilder();
  set theming(covariant ThemingPublicCapabilities_ThemingBuilder? theming) => _$this._theming = theming;

  ThemingPublicCapabilitiesBuilder();

  ThemingPublicCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _theming = $v.theming.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingPublicCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingPublicCapabilities;
  }

  @override
  void update(void Function(ThemingPublicCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingPublicCapabilities build() => _build();

  _$ThemingPublicCapabilities _build() {
    _$ThemingPublicCapabilities _$result;
    try {
      _$result = _$v ?? _$ThemingPublicCapabilities._(theming: theming.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'theming';
        theming.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ThemingPublicCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusCapabilities_UserStatusInterfaceBuilder {
  void replace(UserStatusCapabilities_UserStatusInterface other);
  void update(void Function(UserStatusCapabilities_UserStatusInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  bool? get restore;
  set restore(bool? restore);

  bool? get supportsEmoji;
  set supportsEmoji(bool? supportsEmoji);
}

class _$UserStatusCapabilities_UserStatus extends UserStatusCapabilities_UserStatus {
  @override
  final bool enabled;
  @override
  final bool restore;
  @override
  final bool supportsEmoji;

  factory _$UserStatusCapabilities_UserStatus([void Function(UserStatusCapabilities_UserStatusBuilder)? updates]) =>
      (UserStatusCapabilities_UserStatusBuilder()..update(updates))._build();

  _$UserStatusCapabilities_UserStatus._({required this.enabled, required this.restore, required this.supportsEmoji})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'UserStatusCapabilities_UserStatus', 'enabled');
    BuiltValueNullFieldError.checkNotNull(restore, r'UserStatusCapabilities_UserStatus', 'restore');
    BuiltValueNullFieldError.checkNotNull(supportsEmoji, r'UserStatusCapabilities_UserStatus', 'supportsEmoji');
  }

  @override
  UserStatusCapabilities_UserStatus rebuild(void Function(UserStatusCapabilities_UserStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusCapabilities_UserStatusBuilder toBuilder() => UserStatusCapabilities_UserStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusCapabilities_UserStatus &&
        enabled == other.enabled &&
        restore == other.restore &&
        supportsEmoji == other.supportsEmoji;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, restore.hashCode);
    _$hash = $jc(_$hash, supportsEmoji.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusCapabilities_UserStatus')
          ..add('enabled', enabled)
          ..add('restore', restore)
          ..add('supportsEmoji', supportsEmoji))
        .toString();
  }
}

class UserStatusCapabilities_UserStatusBuilder
    implements
        Builder<UserStatusCapabilities_UserStatus, UserStatusCapabilities_UserStatusBuilder>,
        UserStatusCapabilities_UserStatusInterfaceBuilder {
  _$UserStatusCapabilities_UserStatus? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  bool? _restore;
  bool? get restore => _$this._restore;
  set restore(covariant bool? restore) => _$this._restore = restore;

  bool? _supportsEmoji;
  bool? get supportsEmoji => _$this._supportsEmoji;
  set supportsEmoji(covariant bool? supportsEmoji) => _$this._supportsEmoji = supportsEmoji;

  UserStatusCapabilities_UserStatusBuilder();

  UserStatusCapabilities_UserStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _restore = $v.restore;
      _supportsEmoji = $v.supportsEmoji;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusCapabilities_UserStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusCapabilities_UserStatus;
  }

  @override
  void update(void Function(UserStatusCapabilities_UserStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusCapabilities_UserStatus build() => _build();

  _$UserStatusCapabilities_UserStatus _build() {
    final _$result = _$v ??
        _$UserStatusCapabilities_UserStatus._(
            enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'UserStatusCapabilities_UserStatus', 'enabled'),
            restore: BuiltValueNullFieldError.checkNotNull(restore, r'UserStatusCapabilities_UserStatus', 'restore'),
            supportsEmoji: BuiltValueNullFieldError.checkNotNull(
                supportsEmoji, r'UserStatusCapabilities_UserStatus', 'supportsEmoji'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusCapabilitiesInterfaceBuilder {
  void replace(UserStatusCapabilitiesInterface other);
  void update(void Function(UserStatusCapabilitiesInterfaceBuilder) updates);
  UserStatusCapabilities_UserStatusBuilder get userStatus;
  set userStatus(UserStatusCapabilities_UserStatusBuilder? userStatus);
}

class _$UserStatusCapabilities extends UserStatusCapabilities {
  @override
  final UserStatusCapabilities_UserStatus userStatus;

  factory _$UserStatusCapabilities([void Function(UserStatusCapabilitiesBuilder)? updates]) =>
      (UserStatusCapabilitiesBuilder()..update(updates))._build();

  _$UserStatusCapabilities._({required this.userStatus}) : super._() {
    BuiltValueNullFieldError.checkNotNull(userStatus, r'UserStatusCapabilities', 'userStatus');
  }

  @override
  UserStatusCapabilities rebuild(void Function(UserStatusCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusCapabilitiesBuilder toBuilder() => UserStatusCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusCapabilities && userStatus == other.userStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusCapabilities')..add('userStatus', userStatus)).toString();
  }
}

class UserStatusCapabilitiesBuilder
    implements Builder<UserStatusCapabilities, UserStatusCapabilitiesBuilder>, UserStatusCapabilitiesInterfaceBuilder {
  _$UserStatusCapabilities? _$v;

  UserStatusCapabilities_UserStatusBuilder? _userStatus;
  UserStatusCapabilities_UserStatusBuilder get userStatus =>
      _$this._userStatus ??= UserStatusCapabilities_UserStatusBuilder();
  set userStatus(covariant UserStatusCapabilities_UserStatusBuilder? userStatus) => _$this._userStatus = userStatus;

  UserStatusCapabilitiesBuilder();

  UserStatusCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userStatus = $v.userStatus.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusCapabilities;
  }

  @override
  void update(void Function(UserStatusCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusCapabilities build() => _build();

  _$UserStatusCapabilities _build() {
    _$UserStatusCapabilities _$result;
    try {
      _$result = _$v ?? _$UserStatusCapabilities._(userStatus: userStatus.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userStatus';
        userStatus.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WeatherStatusCapabilities_WeatherStatusInterfaceBuilder {
  void replace(WeatherStatusCapabilities_WeatherStatusInterface other);
  void update(void Function(WeatherStatusCapabilities_WeatherStatusInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);
}

class _$WeatherStatusCapabilities_WeatherStatus extends WeatherStatusCapabilities_WeatherStatus {
  @override
  final bool enabled;

  factory _$WeatherStatusCapabilities_WeatherStatus(
          [void Function(WeatherStatusCapabilities_WeatherStatusBuilder)? updates]) =>
      (WeatherStatusCapabilities_WeatherStatusBuilder()..update(updates))._build();

  _$WeatherStatusCapabilities_WeatherStatus._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'WeatherStatusCapabilities_WeatherStatus', 'enabled');
  }

  @override
  WeatherStatusCapabilities_WeatherStatus rebuild(
          void Function(WeatherStatusCapabilities_WeatherStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusCapabilities_WeatherStatusBuilder toBuilder() =>
      WeatherStatusCapabilities_WeatherStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusCapabilities_WeatherStatus && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherStatusCapabilities_WeatherStatus')..add('enabled', enabled))
        .toString();
  }
}

class WeatherStatusCapabilities_WeatherStatusBuilder
    implements
        Builder<WeatherStatusCapabilities_WeatherStatus, WeatherStatusCapabilities_WeatherStatusBuilder>,
        WeatherStatusCapabilities_WeatherStatusInterfaceBuilder {
  _$WeatherStatusCapabilities_WeatherStatus? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  WeatherStatusCapabilities_WeatherStatusBuilder();

  WeatherStatusCapabilities_WeatherStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusCapabilities_WeatherStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusCapabilities_WeatherStatus;
  }

  @override
  void update(void Function(WeatherStatusCapabilities_WeatherStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusCapabilities_WeatherStatus build() => _build();

  _$WeatherStatusCapabilities_WeatherStatus _build() {
    final _$result = _$v ??
        _$WeatherStatusCapabilities_WeatherStatus._(
            enabled:
                BuiltValueNullFieldError.checkNotNull(enabled, r'WeatherStatusCapabilities_WeatherStatus', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WeatherStatusCapabilitiesInterfaceBuilder {
  void replace(WeatherStatusCapabilitiesInterface other);
  void update(void Function(WeatherStatusCapabilitiesInterfaceBuilder) updates);
  WeatherStatusCapabilities_WeatherStatusBuilder get weatherStatus;
  set weatherStatus(WeatherStatusCapabilities_WeatherStatusBuilder? weatherStatus);
}

class _$WeatherStatusCapabilities extends WeatherStatusCapabilities {
  @override
  final WeatherStatusCapabilities_WeatherStatus weatherStatus;

  factory _$WeatherStatusCapabilities([void Function(WeatherStatusCapabilitiesBuilder)? updates]) =>
      (WeatherStatusCapabilitiesBuilder()..update(updates))._build();

  _$WeatherStatusCapabilities._({required this.weatherStatus}) : super._() {
    BuiltValueNullFieldError.checkNotNull(weatherStatus, r'WeatherStatusCapabilities', 'weatherStatus');
  }

  @override
  WeatherStatusCapabilities rebuild(void Function(WeatherStatusCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStatusCapabilitiesBuilder toBuilder() => WeatherStatusCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherStatusCapabilities && weatherStatus == other.weatherStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weatherStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherStatusCapabilities')..add('weatherStatus', weatherStatus)).toString();
  }
}

class WeatherStatusCapabilitiesBuilder
    implements
        Builder<WeatherStatusCapabilities, WeatherStatusCapabilitiesBuilder>,
        WeatherStatusCapabilitiesInterfaceBuilder {
  _$WeatherStatusCapabilities? _$v;

  WeatherStatusCapabilities_WeatherStatusBuilder? _weatherStatus;
  WeatherStatusCapabilities_WeatherStatusBuilder get weatherStatus =>
      _$this._weatherStatus ??= WeatherStatusCapabilities_WeatherStatusBuilder();
  set weatherStatus(covariant WeatherStatusCapabilities_WeatherStatusBuilder? weatherStatus) =>
      _$this._weatherStatus = weatherStatus;

  WeatherStatusCapabilitiesBuilder();

  WeatherStatusCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weatherStatus = $v.weatherStatus.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WeatherStatusCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherStatusCapabilities;
  }

  @override
  void update(void Function(WeatherStatusCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherStatusCapabilities build() => _build();

  _$WeatherStatusCapabilities _build() {
    _$WeatherStatusCapabilities _$result;
    try {
      _$result = _$v ?? _$WeatherStatusCapabilities._(weatherStatus: weatherStatus.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'weatherStatus';
        weatherStatus.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WeatherStatusCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesInterfaceBuilder {
  void replace(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesInterface other);
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesInterfaceBuilder) updates);
  CommentsCapabilitiesBuilder get commentsCapabilities;
  set commentsCapabilities(CommentsCapabilitiesBuilder? commentsCapabilities);

  DavCapabilitiesBuilder get davCapabilities;
  set davCapabilities(DavCapabilitiesBuilder? davCapabilities);

  FilesCapabilitiesBuilder get filesCapabilities;
  set filesCapabilities(FilesCapabilitiesBuilder? filesCapabilities);

  FilesSharingCapabilitiesBuilder get filesSharingCapabilities;
  set filesSharingCapabilities(FilesSharingCapabilitiesBuilder? filesSharingCapabilities);

  FilesTrashbinCapabilitiesBuilder get filesTrashbinCapabilities;
  set filesTrashbinCapabilities(FilesTrashbinCapabilitiesBuilder? filesTrashbinCapabilities);

  FilesVersionsCapabilitiesBuilder get filesVersionsCapabilities;
  set filesVersionsCapabilities(FilesVersionsCapabilitiesBuilder? filesVersionsCapabilities);

  NotesCapabilitiesBuilder get notesCapabilities;
  set notesCapabilities(NotesCapabilitiesBuilder? notesCapabilities);

  NotificationsCapabilitiesBuilder get notificationsCapabilities;
  set notificationsCapabilities(NotificationsCapabilitiesBuilder? notificationsCapabilities);

  ProvisioningApiCapabilitiesBuilder get provisioningApiCapabilities;
  set provisioningApiCapabilities(ProvisioningApiCapabilitiesBuilder? provisioningApiCapabilities);

  SharebymailCapabilitiesBuilder get sharebymailCapabilities;
  set sharebymailCapabilities(SharebymailCapabilitiesBuilder? sharebymailCapabilities);

  SpreedPublicCapabilitiesBuilder get spreedPublicCapabilities;
  set spreedPublicCapabilities(SpreedPublicCapabilitiesBuilder? spreedPublicCapabilities);

  ThemingPublicCapabilitiesBuilder get themingPublicCapabilities;
  set themingPublicCapabilities(ThemingPublicCapabilitiesBuilder? themingPublicCapabilities);

  UserStatusCapabilitiesBuilder get userStatusCapabilities;
  set userStatusCapabilities(UserStatusCapabilitiesBuilder? userStatusCapabilities);

  WeatherStatusCapabilitiesBuilder get weatherStatusCapabilities;
  set weatherStatusCapabilities(WeatherStatusCapabilitiesBuilder? weatherStatusCapabilities);
}

class _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities
    extends OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities {
  @override
  final JsonObject data;
  @override
  final CommentsCapabilities? commentsCapabilities;
  @override
  final DavCapabilities? davCapabilities;
  @override
  final FilesCapabilities? filesCapabilities;
  @override
  final FilesSharingCapabilities? filesSharingCapabilities;
  @override
  final FilesTrashbinCapabilities? filesTrashbinCapabilities;
  @override
  final FilesVersionsCapabilities? filesVersionsCapabilities;
  @override
  final NotesCapabilities? notesCapabilities;
  @override
  final NotificationsCapabilities? notificationsCapabilities;
  @override
  final ProvisioningApiCapabilities? provisioningApiCapabilities;
  @override
  final SharebymailCapabilities? sharebymailCapabilities;
  @override
  final SpreedPublicCapabilities? spreedPublicCapabilities;
  @override
  final ThemingPublicCapabilities? themingPublicCapabilities;
  @override
  final UserStatusCapabilities? userStatusCapabilities;
  @override
  final WeatherStatusCapabilities? weatherStatusCapabilities;

  factory _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities(
          [void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder)? updates]) =>
      (OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder()..update(updates))._build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities._(
      {required this.data,
      this.commentsCapabilities,
      this.davCapabilities,
      this.filesCapabilities,
      this.filesSharingCapabilities,
      this.filesTrashbinCapabilities,
      this.filesVersionsCapabilities,
      this.notesCapabilities,
      this.notificationsCapabilities,
      this.provisioningApiCapabilities,
      this.sharebymailCapabilities,
      this.spreedPublicCapabilities,
      this.themingPublicCapabilities,
      this.userStatusCapabilities,
      this.weatherStatusCapabilities})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities', 'data');
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities rebuild(
          void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder toBuilder() =>
      OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities &&
        data == other.data &&
        commentsCapabilities == other.commentsCapabilities &&
        davCapabilities == other.davCapabilities &&
        filesCapabilities == other.filesCapabilities &&
        filesSharingCapabilities == other.filesSharingCapabilities &&
        filesTrashbinCapabilities == other.filesTrashbinCapabilities &&
        filesVersionsCapabilities == other.filesVersionsCapabilities &&
        notesCapabilities == other.notesCapabilities &&
        notificationsCapabilities == other.notificationsCapabilities &&
        provisioningApiCapabilities == other.provisioningApiCapabilities &&
        sharebymailCapabilities == other.sharebymailCapabilities &&
        spreedPublicCapabilities == other.spreedPublicCapabilities &&
        themingPublicCapabilities == other.themingPublicCapabilities &&
        userStatusCapabilities == other.userStatusCapabilities &&
        weatherStatusCapabilities == other.weatherStatusCapabilities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, commentsCapabilities.hashCode);
    _$hash = $jc(_$hash, davCapabilities.hashCode);
    _$hash = $jc(_$hash, filesCapabilities.hashCode);
    _$hash = $jc(_$hash, filesSharingCapabilities.hashCode);
    _$hash = $jc(_$hash, filesTrashbinCapabilities.hashCode);
    _$hash = $jc(_$hash, filesVersionsCapabilities.hashCode);
    _$hash = $jc(_$hash, notesCapabilities.hashCode);
    _$hash = $jc(_$hash, notificationsCapabilities.hashCode);
    _$hash = $jc(_$hash, provisioningApiCapabilities.hashCode);
    _$hash = $jc(_$hash, sharebymailCapabilities.hashCode);
    _$hash = $jc(_$hash, spreedPublicCapabilities.hashCode);
    _$hash = $jc(_$hash, themingPublicCapabilities.hashCode);
    _$hash = $jc(_$hash, userStatusCapabilities.hashCode);
    _$hash = $jc(_$hash, weatherStatusCapabilities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities')
          ..add('data', data)
          ..add('commentsCapabilities', commentsCapabilities)
          ..add('davCapabilities', davCapabilities)
          ..add('filesCapabilities', filesCapabilities)
          ..add('filesSharingCapabilities', filesSharingCapabilities)
          ..add('filesTrashbinCapabilities', filesTrashbinCapabilities)
          ..add('filesVersionsCapabilities', filesVersionsCapabilities)
          ..add('notesCapabilities', notesCapabilities)
          ..add('notificationsCapabilities', notificationsCapabilities)
          ..add('provisioningApiCapabilities', provisioningApiCapabilities)
          ..add('sharebymailCapabilities', sharebymailCapabilities)
          ..add('spreedPublicCapabilities', spreedPublicCapabilities)
          ..add('themingPublicCapabilities', themingPublicCapabilities)
          ..add('userStatusCapabilities', userStatusCapabilities)
          ..add('weatherStatusCapabilities', weatherStatusCapabilities))
        .toString();
  }
}

class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder
    implements
        Builder<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder>,
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesInterfaceBuilder {
  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  CommentsCapabilitiesBuilder? _commentsCapabilities;
  CommentsCapabilitiesBuilder get commentsCapabilities =>
      _$this._commentsCapabilities ??= CommentsCapabilitiesBuilder();
  set commentsCapabilities(covariant CommentsCapabilitiesBuilder? commentsCapabilities) =>
      _$this._commentsCapabilities = commentsCapabilities;

  DavCapabilitiesBuilder? _davCapabilities;
  DavCapabilitiesBuilder get davCapabilities => _$this._davCapabilities ??= DavCapabilitiesBuilder();
  set davCapabilities(covariant DavCapabilitiesBuilder? davCapabilities) => _$this._davCapabilities = davCapabilities;

  FilesCapabilitiesBuilder? _filesCapabilities;
  FilesCapabilitiesBuilder get filesCapabilities => _$this._filesCapabilities ??= FilesCapabilitiesBuilder();
  set filesCapabilities(covariant FilesCapabilitiesBuilder? filesCapabilities) =>
      _$this._filesCapabilities = filesCapabilities;

  FilesSharingCapabilitiesBuilder? _filesSharingCapabilities;
  FilesSharingCapabilitiesBuilder get filesSharingCapabilities =>
      _$this._filesSharingCapabilities ??= FilesSharingCapabilitiesBuilder();
  set filesSharingCapabilities(covariant FilesSharingCapabilitiesBuilder? filesSharingCapabilities) =>
      _$this._filesSharingCapabilities = filesSharingCapabilities;

  FilesTrashbinCapabilitiesBuilder? _filesTrashbinCapabilities;
  FilesTrashbinCapabilitiesBuilder get filesTrashbinCapabilities =>
      _$this._filesTrashbinCapabilities ??= FilesTrashbinCapabilitiesBuilder();
  set filesTrashbinCapabilities(covariant FilesTrashbinCapabilitiesBuilder? filesTrashbinCapabilities) =>
      _$this._filesTrashbinCapabilities = filesTrashbinCapabilities;

  FilesVersionsCapabilitiesBuilder? _filesVersionsCapabilities;
  FilesVersionsCapabilitiesBuilder get filesVersionsCapabilities =>
      _$this._filesVersionsCapabilities ??= FilesVersionsCapabilitiesBuilder();
  set filesVersionsCapabilities(covariant FilesVersionsCapabilitiesBuilder? filesVersionsCapabilities) =>
      _$this._filesVersionsCapabilities = filesVersionsCapabilities;

  NotesCapabilitiesBuilder? _notesCapabilities;
  NotesCapabilitiesBuilder get notesCapabilities => _$this._notesCapabilities ??= NotesCapabilitiesBuilder();
  set notesCapabilities(covariant NotesCapabilitiesBuilder? notesCapabilities) =>
      _$this._notesCapabilities = notesCapabilities;

  NotificationsCapabilitiesBuilder? _notificationsCapabilities;
  NotificationsCapabilitiesBuilder get notificationsCapabilities =>
      _$this._notificationsCapabilities ??= NotificationsCapabilitiesBuilder();
  set notificationsCapabilities(covariant NotificationsCapabilitiesBuilder? notificationsCapabilities) =>
      _$this._notificationsCapabilities = notificationsCapabilities;

  ProvisioningApiCapabilitiesBuilder? _provisioningApiCapabilities;
  ProvisioningApiCapabilitiesBuilder get provisioningApiCapabilities =>
      _$this._provisioningApiCapabilities ??= ProvisioningApiCapabilitiesBuilder();
  set provisioningApiCapabilities(covariant ProvisioningApiCapabilitiesBuilder? provisioningApiCapabilities) =>
      _$this._provisioningApiCapabilities = provisioningApiCapabilities;

  SharebymailCapabilitiesBuilder? _sharebymailCapabilities;
  SharebymailCapabilitiesBuilder get sharebymailCapabilities =>
      _$this._sharebymailCapabilities ??= SharebymailCapabilitiesBuilder();
  set sharebymailCapabilities(covariant SharebymailCapabilitiesBuilder? sharebymailCapabilities) =>
      _$this._sharebymailCapabilities = sharebymailCapabilities;

  SpreedPublicCapabilitiesBuilder? _spreedPublicCapabilities;
  SpreedPublicCapabilitiesBuilder get spreedPublicCapabilities =>
      _$this._spreedPublicCapabilities ??= SpreedPublicCapabilitiesBuilder();
  set spreedPublicCapabilities(covariant SpreedPublicCapabilitiesBuilder? spreedPublicCapabilities) =>
      _$this._spreedPublicCapabilities = spreedPublicCapabilities;

  ThemingPublicCapabilitiesBuilder? _themingPublicCapabilities;
  ThemingPublicCapabilitiesBuilder get themingPublicCapabilities =>
      _$this._themingPublicCapabilities ??= ThemingPublicCapabilitiesBuilder();
  set themingPublicCapabilities(covariant ThemingPublicCapabilitiesBuilder? themingPublicCapabilities) =>
      _$this._themingPublicCapabilities = themingPublicCapabilities;

  UserStatusCapabilitiesBuilder? _userStatusCapabilities;
  UserStatusCapabilitiesBuilder get userStatusCapabilities =>
      _$this._userStatusCapabilities ??= UserStatusCapabilitiesBuilder();
  set userStatusCapabilities(covariant UserStatusCapabilitiesBuilder? userStatusCapabilities) =>
      _$this._userStatusCapabilities = userStatusCapabilities;

  WeatherStatusCapabilitiesBuilder? _weatherStatusCapabilities;
  WeatherStatusCapabilitiesBuilder get weatherStatusCapabilities =>
      _$this._weatherStatusCapabilities ??= WeatherStatusCapabilitiesBuilder();
  set weatherStatusCapabilities(covariant WeatherStatusCapabilitiesBuilder? weatherStatusCapabilities) =>
      _$this._weatherStatusCapabilities = weatherStatusCapabilities;

  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder();

  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _commentsCapabilities = $v.commentsCapabilities?.toBuilder();
      _davCapabilities = $v.davCapabilities?.toBuilder();
      _filesCapabilities = $v.filesCapabilities?.toBuilder();
      _filesSharingCapabilities = $v.filesSharingCapabilities?.toBuilder();
      _filesTrashbinCapabilities = $v.filesTrashbinCapabilities?.toBuilder();
      _filesVersionsCapabilities = $v.filesVersionsCapabilities?.toBuilder();
      _notesCapabilities = $v.notesCapabilities?.toBuilder();
      _notificationsCapabilities = $v.notificationsCapabilities?.toBuilder();
      _provisioningApiCapabilities = $v.provisioningApiCapabilities?.toBuilder();
      _sharebymailCapabilities = $v.sharebymailCapabilities?.toBuilder();
      _spreedPublicCapabilities = $v.spreedPublicCapabilities?.toBuilder();
      _themingPublicCapabilities = $v.themingPublicCapabilities?.toBuilder();
      _userStatusCapabilities = $v.userStatusCapabilities?.toBuilder();
      _weatherStatusCapabilities = $v.weatherStatusCapabilities?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities;
  }

  @override
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities build() => _build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities _build() {
    OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities._validate(this);
    _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities _$result;
    try {
      _$result = _$v ??
          _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities._(
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities', 'data'),
              commentsCapabilities: _commentsCapabilities?.build(),
              davCapabilities: _davCapabilities?.build(),
              filesCapabilities: _filesCapabilities?.build(),
              filesSharingCapabilities: _filesSharingCapabilities?.build(),
              filesTrashbinCapabilities: _filesTrashbinCapabilities?.build(),
              filesVersionsCapabilities: _filesVersionsCapabilities?.build(),
              notesCapabilities: _notesCapabilities?.build(),
              notificationsCapabilities: _notificationsCapabilities?.build(),
              provisioningApiCapabilities: _provisioningApiCapabilities?.build(),
              sharebymailCapabilities: _sharebymailCapabilities?.build(),
              spreedPublicCapabilities: _spreedPublicCapabilities?.build(),
              themingPublicCapabilities: _themingPublicCapabilities?.build(),
              userStatusCapabilities: _userStatusCapabilities?.build(),
              weatherStatusCapabilities: _weatherStatusCapabilities?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'commentsCapabilities';
        _commentsCapabilities?.build();
        _$failedField = 'davCapabilities';
        _davCapabilities?.build();
        _$failedField = 'filesCapabilities';
        _filesCapabilities?.build();
        _$failedField = 'filesSharingCapabilities';
        _filesSharingCapabilities?.build();
        _$failedField = 'filesTrashbinCapabilities';
        _filesTrashbinCapabilities?.build();
        _$failedField = 'filesVersionsCapabilities';
        _filesVersionsCapabilities?.build();
        _$failedField = 'notesCapabilities';
        _notesCapabilities?.build();
        _$failedField = 'notificationsCapabilities';
        _notificationsCapabilities?.build();
        _$failedField = 'provisioningApiCapabilities';
        _provisioningApiCapabilities?.build();
        _$failedField = 'sharebymailCapabilities';
        _sharebymailCapabilities?.build();
        _$failedField = 'spreedPublicCapabilities';
        _spreedPublicCapabilities?.build();
        _$failedField = 'themingPublicCapabilities';
        _themingPublicCapabilities?.build();
        _$failedField = 'userStatusCapabilities';
        _userStatusCapabilities?.build();
        _$failedField = 'weatherStatusCapabilities';
        _weatherStatusCapabilities?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder get version;
  set version(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder? version);

  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder get capabilities;
  set capabilities(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder? capabilities);
}

class _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data extends OcsGetCapabilitiesResponseApplicationJson_Ocs_Data {
  @override
  final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version version;
  @override
  final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities capabilities;

  factory _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data(
          [void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data._({required this.version, required this.capabilities})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(version, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data', 'version');
    BuiltValueNullFieldError.checkNotNull(
        capabilities, r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data', 'capabilities');
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data rebuild(
          void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcsGetCapabilitiesResponseApplicationJson_Ocs_Data &&
        version == other.version &&
        capabilities == other.capabilities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, capabilities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data')
          ..add('version', version)
          ..add('capabilities', capabilities))
        .toString();
  }
}

class OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder>,
        OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data? _$v;

  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder? _version;
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder get version =>
      _$this._version ??= OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder();
  set version(covariant OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder? version) =>
      _$this._version = version;

  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder? _capabilities;
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder get capabilities =>
      _$this._capabilities ??= OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder();
  set capabilities(covariant OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder? capabilities) =>
      _$this._capabilities = capabilities;

  OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder();

  OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version.toBuilder();
      _capabilities = $v.capabilities.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcsGetCapabilitiesResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data build() => _build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data _build() {
    _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data._(
              version: version.build(), capabilities: capabilities.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'version';
        version.build();
        _$failedField = 'capabilities';
        capabilities.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcsGetCapabilitiesResponseApplicationJson_OcsInterfaceBuilder {
  void replace(OcsGetCapabilitiesResponseApplicationJson_OcsInterface other);
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder get data;
  set data(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$OcsGetCapabilitiesResponseApplicationJson_Ocs extends OcsGetCapabilitiesResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data data;

  factory _$OcsGetCapabilitiesResponseApplicationJson_Ocs(
          [void Function(OcsGetCapabilitiesResponseApplicationJson_OcsBuilder)? updates]) =>
      (OcsGetCapabilitiesResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'OcsGetCapabilitiesResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'OcsGetCapabilitiesResponseApplicationJson_Ocs', 'data');
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs rebuild(
          void Function(OcsGetCapabilitiesResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcsGetCapabilitiesResponseApplicationJson_OcsBuilder toBuilder() =>
      OcsGetCapabilitiesResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcsGetCapabilitiesResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'OcsGetCapabilitiesResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class OcsGetCapabilitiesResponseApplicationJson_OcsBuilder
    implements
        Builder<OcsGetCapabilitiesResponseApplicationJson_Ocs, OcsGetCapabilitiesResponseApplicationJson_OcsBuilder>,
        OcsGetCapabilitiesResponseApplicationJson_OcsInterfaceBuilder {
  _$OcsGetCapabilitiesResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder? _data;
  OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  OcsGetCapabilitiesResponseApplicationJson_OcsBuilder();

  OcsGetCapabilitiesResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcsGetCapabilitiesResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcsGetCapabilitiesResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(OcsGetCapabilitiesResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs build() => _build();

  _$OcsGetCapabilitiesResponseApplicationJson_Ocs _build() {
    _$OcsGetCapabilitiesResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$OcsGetCapabilitiesResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OcsGetCapabilitiesResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class OcsGetCapabilitiesResponseApplicationJsonInterfaceBuilder {
  void replace(OcsGetCapabilitiesResponseApplicationJsonInterface other);
  void update(void Function(OcsGetCapabilitiesResponseApplicationJsonInterfaceBuilder) updates);
  OcsGetCapabilitiesResponseApplicationJson_OcsBuilder get ocs;
  set ocs(OcsGetCapabilitiesResponseApplicationJson_OcsBuilder? ocs);
}

class _$OcsGetCapabilitiesResponseApplicationJson extends OcsGetCapabilitiesResponseApplicationJson {
  @override
  final OcsGetCapabilitiesResponseApplicationJson_Ocs ocs;

  factory _$OcsGetCapabilitiesResponseApplicationJson(
          [void Function(OcsGetCapabilitiesResponseApplicationJsonBuilder)? updates]) =>
      (OcsGetCapabilitiesResponseApplicationJsonBuilder()..update(updates))._build();

  _$OcsGetCapabilitiesResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'OcsGetCapabilitiesResponseApplicationJson', 'ocs');
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson rebuild(
          void Function(OcsGetCapabilitiesResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OcsGetCapabilitiesResponseApplicationJsonBuilder toBuilder() =>
      OcsGetCapabilitiesResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OcsGetCapabilitiesResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'OcsGetCapabilitiesResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class OcsGetCapabilitiesResponseApplicationJsonBuilder
    implements
        Builder<OcsGetCapabilitiesResponseApplicationJson, OcsGetCapabilitiesResponseApplicationJsonBuilder>,
        OcsGetCapabilitiesResponseApplicationJsonInterfaceBuilder {
  _$OcsGetCapabilitiesResponseApplicationJson? _$v;

  OcsGetCapabilitiesResponseApplicationJson_OcsBuilder? _ocs;
  OcsGetCapabilitiesResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= OcsGetCapabilitiesResponseApplicationJson_OcsBuilder();
  set ocs(covariant OcsGetCapabilitiesResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  OcsGetCapabilitiesResponseApplicationJsonBuilder();

  OcsGetCapabilitiesResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant OcsGetCapabilitiesResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OcsGetCapabilitiesResponseApplicationJson;
  }

  @override
  void update(void Function(OcsGetCapabilitiesResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson build() => _build();

  _$OcsGetCapabilitiesResponseApplicationJson _build() {
    _$OcsGetCapabilitiesResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$OcsGetCapabilitiesResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'OcsGetCapabilitiesResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ProfileApiSetVisibilityResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ProfileApiSetVisibilityResponseApplicationJson_OcsInterface other);
  void update(void Function(ProfileApiSetVisibilityResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$ProfileApiSetVisibilityResponseApplicationJson_Ocs extends ProfileApiSetVisibilityResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$ProfileApiSetVisibilityResponseApplicationJson_Ocs(
          [void Function(ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder)? updates]) =>
      (ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ProfileApiSetVisibilityResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ProfileApiSetVisibilityResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ProfileApiSetVisibilityResponseApplicationJson_Ocs', 'data');
  }

  @override
  ProfileApiSetVisibilityResponseApplicationJson_Ocs rebuild(
          void Function(ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder toBuilder() =>
      ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileApiSetVisibilityResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ProfileApiSetVisibilityResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder
    implements
        Builder<ProfileApiSetVisibilityResponseApplicationJson_Ocs,
            ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder>,
        ProfileApiSetVisibilityResponseApplicationJson_OcsInterfaceBuilder {
  _$ProfileApiSetVisibilityResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder();

  ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ProfileApiSetVisibilityResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileApiSetVisibilityResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileApiSetVisibilityResponseApplicationJson_Ocs build() => _build();

  _$ProfileApiSetVisibilityResponseApplicationJson_Ocs _build() {
    _$ProfileApiSetVisibilityResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ProfileApiSetVisibilityResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'ProfileApiSetVisibilityResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProfileApiSetVisibilityResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ProfileApiSetVisibilityResponseApplicationJsonInterfaceBuilder {
  void replace(ProfileApiSetVisibilityResponseApplicationJsonInterface other);
  void update(void Function(ProfileApiSetVisibilityResponseApplicationJsonInterfaceBuilder) updates);
  ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder? ocs);
}

class _$ProfileApiSetVisibilityResponseApplicationJson extends ProfileApiSetVisibilityResponseApplicationJson {
  @override
  final ProfileApiSetVisibilityResponseApplicationJson_Ocs ocs;

  factory _$ProfileApiSetVisibilityResponseApplicationJson(
          [void Function(ProfileApiSetVisibilityResponseApplicationJsonBuilder)? updates]) =>
      (ProfileApiSetVisibilityResponseApplicationJsonBuilder()..update(updates))._build();

  _$ProfileApiSetVisibilityResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ProfileApiSetVisibilityResponseApplicationJson', 'ocs');
  }

  @override
  ProfileApiSetVisibilityResponseApplicationJson rebuild(
          void Function(ProfileApiSetVisibilityResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileApiSetVisibilityResponseApplicationJsonBuilder toBuilder() =>
      ProfileApiSetVisibilityResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileApiSetVisibilityResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ProfileApiSetVisibilityResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ProfileApiSetVisibilityResponseApplicationJsonBuilder
    implements
        Builder<ProfileApiSetVisibilityResponseApplicationJson, ProfileApiSetVisibilityResponseApplicationJsonBuilder>,
        ProfileApiSetVisibilityResponseApplicationJsonInterfaceBuilder {
  _$ProfileApiSetVisibilityResponseApplicationJson? _$v;

  ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder? _ocs;
  ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder();
  set ocs(covariant ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ProfileApiSetVisibilityResponseApplicationJsonBuilder();

  ProfileApiSetVisibilityResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ProfileApiSetVisibilityResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileApiSetVisibilityResponseApplicationJson;
  }

  @override
  void update(void Function(ProfileApiSetVisibilityResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileApiSetVisibilityResponseApplicationJson build() => _build();

  _$ProfileApiSetVisibilityResponseApplicationJson _build() {
    _$ProfileApiSetVisibilityResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ProfileApiSetVisibilityResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProfileApiSetVisibilityResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceInterfaceBuilder {
  void replace(ReferenceInterface other);
  void update(void Function(ReferenceInterfaceBuilder) updates);
  String? get richObjectType;
  set richObjectType(String? richObjectType);

  MapBuilder<String, JsonObject> get richObject;
  set richObject(MapBuilder<String, JsonObject>? richObject);

  OpenGraphObjectBuilder get openGraphObject;
  set openGraphObject(OpenGraphObjectBuilder? openGraphObject);

  bool? get accessible;
  set accessible(bool? accessible);
}

class _$Reference extends Reference {
  @override
  final String richObjectType;
  @override
  final BuiltMap<String, JsonObject> richObject;
  @override
  final OpenGraphObject openGraphObject;
  @override
  final bool accessible;

  factory _$Reference([void Function(ReferenceBuilder)? updates]) => (ReferenceBuilder()..update(updates))._build();

  _$Reference._(
      {required this.richObjectType, required this.richObject, required this.openGraphObject, required this.accessible})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(richObjectType, r'Reference', 'richObjectType');
    BuiltValueNullFieldError.checkNotNull(richObject, r'Reference', 'richObject');
    BuiltValueNullFieldError.checkNotNull(openGraphObject, r'Reference', 'openGraphObject');
    BuiltValueNullFieldError.checkNotNull(accessible, r'Reference', 'accessible');
  }

  @override
  Reference rebuild(void Function(ReferenceBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ReferenceBuilder toBuilder() => ReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reference &&
        richObjectType == other.richObjectType &&
        richObject == other.richObject &&
        openGraphObject == other.openGraphObject &&
        accessible == other.accessible;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, richObjectType.hashCode);
    _$hash = $jc(_$hash, richObject.hashCode);
    _$hash = $jc(_$hash, openGraphObject.hashCode);
    _$hash = $jc(_$hash, accessible.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Reference')
          ..add('richObjectType', richObjectType)
          ..add('richObject', richObject)
          ..add('openGraphObject', openGraphObject)
          ..add('accessible', accessible))
        .toString();
  }
}

class ReferenceBuilder implements Builder<Reference, ReferenceBuilder>, ReferenceInterfaceBuilder {
  _$Reference? _$v;

  String? _richObjectType;
  String? get richObjectType => _$this._richObjectType;
  set richObjectType(covariant String? richObjectType) => _$this._richObjectType = richObjectType;

  MapBuilder<String, JsonObject>? _richObject;
  MapBuilder<String, JsonObject> get richObject => _$this._richObject ??= MapBuilder<String, JsonObject>();
  set richObject(covariant MapBuilder<String, JsonObject>? richObject) => _$this._richObject = richObject;

  OpenGraphObjectBuilder? _openGraphObject;
  OpenGraphObjectBuilder get openGraphObject => _$this._openGraphObject ??= OpenGraphObjectBuilder();
  set openGraphObject(covariant OpenGraphObjectBuilder? openGraphObject) => _$this._openGraphObject = openGraphObject;

  bool? _accessible;
  bool? get accessible => _$this._accessible;
  set accessible(covariant bool? accessible) => _$this._accessible = accessible;

  ReferenceBuilder();

  ReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _richObjectType = $v.richObjectType;
      _richObject = $v.richObject.toBuilder();
      _openGraphObject = $v.openGraphObject.toBuilder();
      _accessible = $v.accessible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Reference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Reference;
  }

  @override
  void update(void Function(ReferenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Reference build() => _build();

  _$Reference _build() {
    _$Reference _$result;
    try {
      _$result = _$v ??
          _$Reference._(
              richObjectType: BuiltValueNullFieldError.checkNotNull(richObjectType, r'Reference', 'richObjectType'),
              richObject: richObject.build(),
              openGraphObject: openGraphObject.build(),
              accessible: BuiltValueNullFieldError.checkNotNull(accessible, r'Reference', 'accessible'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'richObject';
        richObject.build();
        _$failedField = 'openGraphObject';
        openGraphObject.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Reference', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  MapBuilder<String, Reference> get references;
  set references(MapBuilder<String, Reference>? references);
}

class _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data
    extends ReferenceApiResolveOneResponseApplicationJson_Ocs_Data {
  @override
  final BuiltMap<String, Reference> references;

  factory _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data(
          [void Function(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data._({required this.references}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        references, r'ReferenceApiResolveOneResponseApplicationJson_Ocs_Data', 'references');
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson_Ocs_Data rebuild(
          void Function(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiResolveOneResponseApplicationJson_Ocs_Data && references == other.references;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, references.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferenceApiResolveOneResponseApplicationJson_Ocs_Data')
          ..add('references', references))
        .toString();
  }
}

class ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ReferenceApiResolveOneResponseApplicationJson_Ocs_Data,
            ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder>,
        ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data? _$v;

  MapBuilder<String, Reference>? _references;
  MapBuilder<String, Reference> get references => _$this._references ??= MapBuilder<String, Reference>();
  set references(covariant MapBuilder<String, Reference>? references) => _$this._references = references;

  ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder();

  ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _references = $v.references.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiResolveOneResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson_Ocs_Data build() => _build();

  _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data _build() {
    _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data._(references: references.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'references';
        references.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiResolveOneResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiResolveOneResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ReferenceApiResolveOneResponseApplicationJson_OcsInterface other);
  void update(void Function(ReferenceApiResolveOneResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ReferenceApiResolveOneResponseApplicationJson_Ocs extends ReferenceApiResolveOneResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ReferenceApiResolveOneResponseApplicationJson_Ocs_Data data;

  factory _$ReferenceApiResolveOneResponseApplicationJson_Ocs(
          [void Function(ReferenceApiResolveOneResponseApplicationJson_OcsBuilder)? updates]) =>
      (ReferenceApiResolveOneResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ReferenceApiResolveOneResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ReferenceApiResolveOneResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ReferenceApiResolveOneResponseApplicationJson_Ocs', 'data');
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson_Ocs rebuild(
          void Function(ReferenceApiResolveOneResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiResolveOneResponseApplicationJson_OcsBuilder toBuilder() =>
      ReferenceApiResolveOneResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiResolveOneResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiResolveOneResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ReferenceApiResolveOneResponseApplicationJson_OcsBuilder
    implements
        Builder<ReferenceApiResolveOneResponseApplicationJson_Ocs,
            ReferenceApiResolveOneResponseApplicationJson_OcsBuilder>,
        ReferenceApiResolveOneResponseApplicationJson_OcsInterfaceBuilder {
  _$ReferenceApiResolveOneResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder? _data;
  ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ReferenceApiResolveOneResponseApplicationJson_OcsBuilder();

  ReferenceApiResolveOneResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiResolveOneResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiResolveOneResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ReferenceApiResolveOneResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson_Ocs build() => _build();

  _$ReferenceApiResolveOneResponseApplicationJson_Ocs _build() {
    _$ReferenceApiResolveOneResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ReferenceApiResolveOneResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiResolveOneResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiResolveOneResponseApplicationJsonInterfaceBuilder {
  void replace(ReferenceApiResolveOneResponseApplicationJsonInterface other);
  void update(void Function(ReferenceApiResolveOneResponseApplicationJsonInterfaceBuilder) updates);
  ReferenceApiResolveOneResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ReferenceApiResolveOneResponseApplicationJson_OcsBuilder? ocs);
}

class _$ReferenceApiResolveOneResponseApplicationJson extends ReferenceApiResolveOneResponseApplicationJson {
  @override
  final ReferenceApiResolveOneResponseApplicationJson_Ocs ocs;

  factory _$ReferenceApiResolveOneResponseApplicationJson(
          [void Function(ReferenceApiResolveOneResponseApplicationJsonBuilder)? updates]) =>
      (ReferenceApiResolveOneResponseApplicationJsonBuilder()..update(updates))._build();

  _$ReferenceApiResolveOneResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ReferenceApiResolveOneResponseApplicationJson', 'ocs');
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson rebuild(
          void Function(ReferenceApiResolveOneResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiResolveOneResponseApplicationJsonBuilder toBuilder() =>
      ReferenceApiResolveOneResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiResolveOneResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiResolveOneResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ReferenceApiResolveOneResponseApplicationJsonBuilder
    implements
        Builder<ReferenceApiResolveOneResponseApplicationJson, ReferenceApiResolveOneResponseApplicationJsonBuilder>,
        ReferenceApiResolveOneResponseApplicationJsonInterfaceBuilder {
  _$ReferenceApiResolveOneResponseApplicationJson? _$v;

  ReferenceApiResolveOneResponseApplicationJson_OcsBuilder? _ocs;
  ReferenceApiResolveOneResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ReferenceApiResolveOneResponseApplicationJson_OcsBuilder();
  set ocs(covariant ReferenceApiResolveOneResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ReferenceApiResolveOneResponseApplicationJsonBuilder();

  ReferenceApiResolveOneResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiResolveOneResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiResolveOneResponseApplicationJson;
  }

  @override
  void update(void Function(ReferenceApiResolveOneResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson build() => _build();

  _$ReferenceApiResolveOneResponseApplicationJson _build() {
    _$ReferenceApiResolveOneResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ReferenceApiResolveOneResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ReferenceApiResolveOneResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiResolveResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(ReferenceApiResolveResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(ReferenceApiResolveResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  MapBuilder<String, Reference> get references;
  set references(MapBuilder<String, Reference>? references);
}

class _$ReferenceApiResolveResponseApplicationJson_Ocs_Data
    extends ReferenceApiResolveResponseApplicationJson_Ocs_Data {
  @override
  final BuiltMap<String, Reference> references;

  factory _$ReferenceApiResolveResponseApplicationJson_Ocs_Data(
          [void Function(ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ReferenceApiResolveResponseApplicationJson_Ocs_Data._({required this.references}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        references, r'ReferenceApiResolveResponseApplicationJson_Ocs_Data', 'references');
  }

  @override
  ReferenceApiResolveResponseApplicationJson_Ocs_Data rebuild(
          void Function(ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiResolveResponseApplicationJson_Ocs_Data && references == other.references;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, references.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferenceApiResolveResponseApplicationJson_Ocs_Data')
          ..add('references', references))
        .toString();
  }
}

class ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ReferenceApiResolveResponseApplicationJson_Ocs_Data,
            ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder>,
        ReferenceApiResolveResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ReferenceApiResolveResponseApplicationJson_Ocs_Data? _$v;

  MapBuilder<String, Reference>? _references;
  MapBuilder<String, Reference> get references => _$this._references ??= MapBuilder<String, Reference>();
  set references(covariant MapBuilder<String, Reference>? references) => _$this._references = references;

  ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder();

  ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _references = $v.references.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiResolveResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiResolveResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiResolveResponseApplicationJson_Ocs_Data build() => _build();

  _$ReferenceApiResolveResponseApplicationJson_Ocs_Data _build() {
    _$ReferenceApiResolveResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$ReferenceApiResolveResponseApplicationJson_Ocs_Data._(references: references.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'references';
        references.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiResolveResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiResolveResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ReferenceApiResolveResponseApplicationJson_OcsInterface other);
  void update(void Function(ReferenceApiResolveResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ReferenceApiResolveResponseApplicationJson_Ocs extends ReferenceApiResolveResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ReferenceApiResolveResponseApplicationJson_Ocs_Data data;

  factory _$ReferenceApiResolveResponseApplicationJson_Ocs(
          [void Function(ReferenceApiResolveResponseApplicationJson_OcsBuilder)? updates]) =>
      (ReferenceApiResolveResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ReferenceApiResolveResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ReferenceApiResolveResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ReferenceApiResolveResponseApplicationJson_Ocs', 'data');
  }

  @override
  ReferenceApiResolveResponseApplicationJson_Ocs rebuild(
          void Function(ReferenceApiResolveResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiResolveResponseApplicationJson_OcsBuilder toBuilder() =>
      ReferenceApiResolveResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiResolveResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiResolveResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ReferenceApiResolveResponseApplicationJson_OcsBuilder
    implements
        Builder<ReferenceApiResolveResponseApplicationJson_Ocs, ReferenceApiResolveResponseApplicationJson_OcsBuilder>,
        ReferenceApiResolveResponseApplicationJson_OcsInterfaceBuilder {
  _$ReferenceApiResolveResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder? _data;
  ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ReferenceApiResolveResponseApplicationJson_OcsBuilder();

  ReferenceApiResolveResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiResolveResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiResolveResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ReferenceApiResolveResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiResolveResponseApplicationJson_Ocs build() => _build();

  _$ReferenceApiResolveResponseApplicationJson_Ocs _build() {
    _$ReferenceApiResolveResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ReferenceApiResolveResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiResolveResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiResolveResponseApplicationJsonInterfaceBuilder {
  void replace(ReferenceApiResolveResponseApplicationJsonInterface other);
  void update(void Function(ReferenceApiResolveResponseApplicationJsonInterfaceBuilder) updates);
  ReferenceApiResolveResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ReferenceApiResolveResponseApplicationJson_OcsBuilder? ocs);
}

class _$ReferenceApiResolveResponseApplicationJson extends ReferenceApiResolveResponseApplicationJson {
  @override
  final ReferenceApiResolveResponseApplicationJson_Ocs ocs;

  factory _$ReferenceApiResolveResponseApplicationJson(
          [void Function(ReferenceApiResolveResponseApplicationJsonBuilder)? updates]) =>
      (ReferenceApiResolveResponseApplicationJsonBuilder()..update(updates))._build();

  _$ReferenceApiResolveResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ReferenceApiResolveResponseApplicationJson', 'ocs');
  }

  @override
  ReferenceApiResolveResponseApplicationJson rebuild(
          void Function(ReferenceApiResolveResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiResolveResponseApplicationJsonBuilder toBuilder() =>
      ReferenceApiResolveResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiResolveResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiResolveResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ReferenceApiResolveResponseApplicationJsonBuilder
    implements
        Builder<ReferenceApiResolveResponseApplicationJson, ReferenceApiResolveResponseApplicationJsonBuilder>,
        ReferenceApiResolveResponseApplicationJsonInterfaceBuilder {
  _$ReferenceApiResolveResponseApplicationJson? _$v;

  ReferenceApiResolveResponseApplicationJson_OcsBuilder? _ocs;
  ReferenceApiResolveResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ReferenceApiResolveResponseApplicationJson_OcsBuilder();
  set ocs(covariant ReferenceApiResolveResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ReferenceApiResolveResponseApplicationJsonBuilder();

  ReferenceApiResolveResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiResolveResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiResolveResponseApplicationJson;
  }

  @override
  void update(void Function(ReferenceApiResolveResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiResolveResponseApplicationJson build() => _build();

  _$ReferenceApiResolveResponseApplicationJson _build() {
    _$ReferenceApiResolveResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ReferenceApiResolveResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ReferenceApiResolveResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiExtractResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(ReferenceApiExtractResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(ReferenceApiExtractResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  MapBuilder<String, Reference> get references;
  set references(MapBuilder<String, Reference>? references);
}

class _$ReferenceApiExtractResponseApplicationJson_Ocs_Data
    extends ReferenceApiExtractResponseApplicationJson_Ocs_Data {
  @override
  final BuiltMap<String, Reference> references;

  factory _$ReferenceApiExtractResponseApplicationJson_Ocs_Data(
          [void Function(ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ReferenceApiExtractResponseApplicationJson_Ocs_Data._({required this.references}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        references, r'ReferenceApiExtractResponseApplicationJson_Ocs_Data', 'references');
  }

  @override
  ReferenceApiExtractResponseApplicationJson_Ocs_Data rebuild(
          void Function(ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiExtractResponseApplicationJson_Ocs_Data && references == other.references;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, references.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferenceApiExtractResponseApplicationJson_Ocs_Data')
          ..add('references', references))
        .toString();
  }
}

class ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ReferenceApiExtractResponseApplicationJson_Ocs_Data,
            ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder>,
        ReferenceApiExtractResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ReferenceApiExtractResponseApplicationJson_Ocs_Data? _$v;

  MapBuilder<String, Reference>? _references;
  MapBuilder<String, Reference> get references => _$this._references ??= MapBuilder<String, Reference>();
  set references(covariant MapBuilder<String, Reference>? references) => _$this._references = references;

  ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder();

  ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _references = $v.references.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiExtractResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiExtractResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiExtractResponseApplicationJson_Ocs_Data build() => _build();

  _$ReferenceApiExtractResponseApplicationJson_Ocs_Data _build() {
    _$ReferenceApiExtractResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$ReferenceApiExtractResponseApplicationJson_Ocs_Data._(references: references.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'references';
        references.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiExtractResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiExtractResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ReferenceApiExtractResponseApplicationJson_OcsInterface other);
  void update(void Function(ReferenceApiExtractResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ReferenceApiExtractResponseApplicationJson_Ocs extends ReferenceApiExtractResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ReferenceApiExtractResponseApplicationJson_Ocs_Data data;

  factory _$ReferenceApiExtractResponseApplicationJson_Ocs(
          [void Function(ReferenceApiExtractResponseApplicationJson_OcsBuilder)? updates]) =>
      (ReferenceApiExtractResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ReferenceApiExtractResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ReferenceApiExtractResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ReferenceApiExtractResponseApplicationJson_Ocs', 'data');
  }

  @override
  ReferenceApiExtractResponseApplicationJson_Ocs rebuild(
          void Function(ReferenceApiExtractResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiExtractResponseApplicationJson_OcsBuilder toBuilder() =>
      ReferenceApiExtractResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiExtractResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiExtractResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ReferenceApiExtractResponseApplicationJson_OcsBuilder
    implements
        Builder<ReferenceApiExtractResponseApplicationJson_Ocs, ReferenceApiExtractResponseApplicationJson_OcsBuilder>,
        ReferenceApiExtractResponseApplicationJson_OcsInterfaceBuilder {
  _$ReferenceApiExtractResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder? _data;
  ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ReferenceApiExtractResponseApplicationJson_OcsBuilder();

  ReferenceApiExtractResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiExtractResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiExtractResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ReferenceApiExtractResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiExtractResponseApplicationJson_Ocs build() => _build();

  _$ReferenceApiExtractResponseApplicationJson_Ocs _build() {
    _$ReferenceApiExtractResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ReferenceApiExtractResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiExtractResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiExtractResponseApplicationJsonInterfaceBuilder {
  void replace(ReferenceApiExtractResponseApplicationJsonInterface other);
  void update(void Function(ReferenceApiExtractResponseApplicationJsonInterfaceBuilder) updates);
  ReferenceApiExtractResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ReferenceApiExtractResponseApplicationJson_OcsBuilder? ocs);
}

class _$ReferenceApiExtractResponseApplicationJson extends ReferenceApiExtractResponseApplicationJson {
  @override
  final ReferenceApiExtractResponseApplicationJson_Ocs ocs;

  factory _$ReferenceApiExtractResponseApplicationJson(
          [void Function(ReferenceApiExtractResponseApplicationJsonBuilder)? updates]) =>
      (ReferenceApiExtractResponseApplicationJsonBuilder()..update(updates))._build();

  _$ReferenceApiExtractResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ReferenceApiExtractResponseApplicationJson', 'ocs');
  }

  @override
  ReferenceApiExtractResponseApplicationJson rebuild(
          void Function(ReferenceApiExtractResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiExtractResponseApplicationJsonBuilder toBuilder() =>
      ReferenceApiExtractResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiExtractResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiExtractResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ReferenceApiExtractResponseApplicationJsonBuilder
    implements
        Builder<ReferenceApiExtractResponseApplicationJson, ReferenceApiExtractResponseApplicationJsonBuilder>,
        ReferenceApiExtractResponseApplicationJsonInterfaceBuilder {
  _$ReferenceApiExtractResponseApplicationJson? _$v;

  ReferenceApiExtractResponseApplicationJson_OcsBuilder? _ocs;
  ReferenceApiExtractResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ReferenceApiExtractResponseApplicationJson_OcsBuilder();
  set ocs(covariant ReferenceApiExtractResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ReferenceApiExtractResponseApplicationJsonBuilder();

  ReferenceApiExtractResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiExtractResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiExtractResponseApplicationJson;
  }

  @override
  void update(void Function(ReferenceApiExtractResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiExtractResponseApplicationJson build() => _build();

  _$ReferenceApiExtractResponseApplicationJson _build() {
    _$ReferenceApiExtractResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ReferenceApiExtractResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ReferenceApiExtractResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceProviderInterfaceBuilder {
  void replace(ReferenceProviderInterface other);
  void update(void Function(ReferenceProviderInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get title;
  set title(String? title);

  String? get iconUrl;
  set iconUrl(String? iconUrl);

  int? get order;
  set order(int? order);

  ListBuilder<String> get searchProvidersIds;
  set searchProvidersIds(ListBuilder<String>? searchProvidersIds);
}

class _$ReferenceProvider extends ReferenceProvider {
  @override
  final String id;
  @override
  final String title;
  @override
  final String iconUrl;
  @override
  final int order;
  @override
  final BuiltList<String>? searchProvidersIds;

  factory _$ReferenceProvider([void Function(ReferenceProviderBuilder)? updates]) =>
      (ReferenceProviderBuilder()..update(updates))._build();

  _$ReferenceProvider._(
      {required this.id, required this.title, required this.iconUrl, required this.order, this.searchProvidersIds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ReferenceProvider', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'ReferenceProvider', 'title');
    BuiltValueNullFieldError.checkNotNull(iconUrl, r'ReferenceProvider', 'iconUrl');
    BuiltValueNullFieldError.checkNotNull(order, r'ReferenceProvider', 'order');
  }

  @override
  ReferenceProvider rebuild(void Function(ReferenceProviderBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ReferenceProviderBuilder toBuilder() => ReferenceProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceProvider &&
        id == other.id &&
        title == other.title &&
        iconUrl == other.iconUrl &&
        order == other.order &&
        searchProvidersIds == other.searchProvidersIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, searchProvidersIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferenceProvider')
          ..add('id', id)
          ..add('title', title)
          ..add('iconUrl', iconUrl)
          ..add('order', order)
          ..add('searchProvidersIds', searchProvidersIds))
        .toString();
  }
}

class ReferenceProviderBuilder
    implements Builder<ReferenceProvider, ReferenceProviderBuilder>, ReferenceProviderInterfaceBuilder {
  _$ReferenceProvider? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(covariant String? iconUrl) => _$this._iconUrl = iconUrl;

  int? _order;
  int? get order => _$this._order;
  set order(covariant int? order) => _$this._order = order;

  ListBuilder<String>? _searchProvidersIds;
  ListBuilder<String> get searchProvidersIds => _$this._searchProvidersIds ??= ListBuilder<String>();
  set searchProvidersIds(covariant ListBuilder<String>? searchProvidersIds) =>
      _$this._searchProvidersIds = searchProvidersIds;

  ReferenceProviderBuilder();

  ReferenceProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _iconUrl = $v.iconUrl;
      _order = $v.order;
      _searchProvidersIds = $v.searchProvidersIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceProvider;
  }

  @override
  void update(void Function(ReferenceProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceProvider build() => _build();

  _$ReferenceProvider _build() {
    _$ReferenceProvider _$result;
    try {
      _$result = _$v ??
          _$ReferenceProvider._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'ReferenceProvider', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'ReferenceProvider', 'title'),
              iconUrl: BuiltValueNullFieldError.checkNotNull(iconUrl, r'ReferenceProvider', 'iconUrl'),
              order: BuiltValueNullFieldError.checkNotNull(order, r'ReferenceProvider', 'order'),
              searchProvidersIds: _searchProvidersIds?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'searchProvidersIds';
        _searchProvidersIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ReferenceProvider', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface other);
  void update(void Function(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<ReferenceProvider> get data;
  set data(ListBuilder<ReferenceProvider>? data);
}

class _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs
    extends ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<ReferenceProvider> data;

  factory _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs(
          [void Function(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder)? updates]) =>
      (ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs', 'data');
  }

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs rebuild(
          void Function(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder toBuilder() =>
      ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder
    implements
        Builder<ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs,
            ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder>,
        ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterfaceBuilder {
  _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<ReferenceProvider>? _data;
  ListBuilder<ReferenceProvider> get data => _$this._data ??= ListBuilder<ReferenceProvider>();
  set data(covariant ListBuilder<ReferenceProvider>? data) => _$this._data = data;

  ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder();

  ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs build() => _build();

  _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs _build() {
    _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiGetProvidersInfoResponseApplicationJsonInterfaceBuilder {
  void replace(ReferenceApiGetProvidersInfoResponseApplicationJsonInterface other);
  void update(void Function(ReferenceApiGetProvidersInfoResponseApplicationJsonInterfaceBuilder) updates);
  ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder? ocs);
}

class _$ReferenceApiGetProvidersInfoResponseApplicationJson
    extends ReferenceApiGetProvidersInfoResponseApplicationJson {
  @override
  final ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs ocs;

  factory _$ReferenceApiGetProvidersInfoResponseApplicationJson(
          [void Function(ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder)? updates]) =>
      (ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder()..update(updates))._build();

  _$ReferenceApiGetProvidersInfoResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ReferenceApiGetProvidersInfoResponseApplicationJson', 'ocs');
  }

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJson rebuild(
          void Function(ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder toBuilder() =>
      ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiGetProvidersInfoResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiGetProvidersInfoResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder
    implements
        Builder<ReferenceApiGetProvidersInfoResponseApplicationJson,
            ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder>,
        ReferenceApiGetProvidersInfoResponseApplicationJsonInterfaceBuilder {
  _$ReferenceApiGetProvidersInfoResponseApplicationJson? _$v;

  ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder? _ocs;
  ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder();
  set ocs(covariant ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder();

  ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiGetProvidersInfoResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiGetProvidersInfoResponseApplicationJson;
  }

  @override
  void update(void Function(ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJson build() => _build();

  _$ReferenceApiGetProvidersInfoResponseApplicationJson _build() {
    _$ReferenceApiGetProvidersInfoResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ReferenceApiGetProvidersInfoResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiGetProvidersInfoResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  bool? get success;
  set success(bool? success);
}

class _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data
    extends ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data {
  @override
  final bool success;

  factory _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data(
          [void Function(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data', 'success');
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data rebuild(
          void Function(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data')
          ..add('success', success))
        .toString();
  }
}

class ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data,
            ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder>,
        ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(covariant bool? success) => _$this._success = success;

  ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder();

  ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data build() => _build();

  _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data', 'success'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiTouchProviderResponseApplicationJson_OcsInterfaceBuilder {
  void replace(ReferenceApiTouchProviderResponseApplicationJson_OcsInterface other);
  void update(void Function(ReferenceApiTouchProviderResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ReferenceApiTouchProviderResponseApplicationJson_Ocs
    extends ReferenceApiTouchProviderResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data data;

  factory _$ReferenceApiTouchProviderResponseApplicationJson_Ocs(
          [void Function(ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder)? updates]) =>
      (ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ReferenceApiTouchProviderResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ReferenceApiTouchProviderResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ReferenceApiTouchProviderResponseApplicationJson_Ocs', 'data');
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson_Ocs rebuild(
          void Function(ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder toBuilder() =>
      ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiTouchProviderResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiTouchProviderResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder
    implements
        Builder<ReferenceApiTouchProviderResponseApplicationJson_Ocs,
            ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder>,
        ReferenceApiTouchProviderResponseApplicationJson_OcsInterfaceBuilder {
  _$ReferenceApiTouchProviderResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder? _data;
  ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder();

  ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiTouchProviderResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiTouchProviderResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson_Ocs build() => _build();

  _$ReferenceApiTouchProviderResponseApplicationJson_Ocs _build() {
    _$ReferenceApiTouchProviderResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$ReferenceApiTouchProviderResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiTouchProviderResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ReferenceApiTouchProviderResponseApplicationJsonInterfaceBuilder {
  void replace(ReferenceApiTouchProviderResponseApplicationJsonInterface other);
  void update(void Function(ReferenceApiTouchProviderResponseApplicationJsonInterfaceBuilder) updates);
  ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder? ocs);
}

class _$ReferenceApiTouchProviderResponseApplicationJson extends ReferenceApiTouchProviderResponseApplicationJson {
  @override
  final ReferenceApiTouchProviderResponseApplicationJson_Ocs ocs;

  factory _$ReferenceApiTouchProviderResponseApplicationJson(
          [void Function(ReferenceApiTouchProviderResponseApplicationJsonBuilder)? updates]) =>
      (ReferenceApiTouchProviderResponseApplicationJsonBuilder()..update(updates))._build();

  _$ReferenceApiTouchProviderResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ReferenceApiTouchProviderResponseApplicationJson', 'ocs');
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson rebuild(
          void Function(ReferenceApiTouchProviderResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferenceApiTouchProviderResponseApplicationJsonBuilder toBuilder() =>
      ReferenceApiTouchProviderResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferenceApiTouchProviderResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ReferenceApiTouchProviderResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class ReferenceApiTouchProviderResponseApplicationJsonBuilder
    implements
        Builder<ReferenceApiTouchProviderResponseApplicationJson,
            ReferenceApiTouchProviderResponseApplicationJsonBuilder>,
        ReferenceApiTouchProviderResponseApplicationJsonInterfaceBuilder {
  _$ReferenceApiTouchProviderResponseApplicationJson? _$v;

  ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder? _ocs;
  ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder();
  set ocs(covariant ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ReferenceApiTouchProviderResponseApplicationJsonBuilder();

  ReferenceApiTouchProviderResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReferenceApiTouchProviderResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferenceApiTouchProviderResponseApplicationJson;
  }

  @override
  void update(void Function(ReferenceApiTouchProviderResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson build() => _build();

  _$ReferenceApiTouchProviderResponseApplicationJson _build() {
    _$ReferenceApiTouchProviderResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ReferenceApiTouchProviderResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReferenceApiTouchProviderResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterfaceBuilder {
  void replace(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface other);
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get name;
  set name(String? name);

  String? get description;
  set description(String? description);
}

class _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types
    extends TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  factory _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types(
          [void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder)? updates]) =>
      (TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder()..update(updates))._build();

  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types._(
      {required this.id, required this.name, required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types', 'description');
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types rebuild(
          void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder toBuilder() =>
      TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types &&
        id == other.id &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder
    implements
        Builder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types,
            TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder>,
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterfaceBuilder {
  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder();

  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types;
  }

  @override
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types build() => _build();

  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types _build() {
    final _$result = _$v ??
        _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types', 'name'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types', 'description'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get types;
  set types(ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>? types);
}

class _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data
    extends TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data {
  @override
  final BuiltList<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> types;

  factory _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data(
          [void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data._({required this.types}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        types, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data', 'types');
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data && types == other.types;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data')
          ..add('types', types))
        .toString();
  }
}

class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data,
            TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder>,
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data? _$v;

  ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>? _types;
  ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get types =>
      _$this._types ??= ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>();
  set types(covariant ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>? types) =>
      _$this._types = types;

  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder();

  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _types = $v.types.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data build() => _build();

  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data _build() {
    _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data._(types: types.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'types';
        types.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiTaskTypesResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextProcessingApiTaskTypesResponseApplicationJson_OcsInterface other);
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs
    extends TextProcessingApiTaskTypesResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data data;

  factory _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs(
          [void Function(TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs rebuild(
          void Function(TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder toBuilder() =>
      TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiTaskTypesResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder
    implements
        Builder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs,
            TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder>,
        TextProcessingApiTaskTypesResponseApplicationJson_OcsInterfaceBuilder {
  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder? _data;
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder();

  TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiTaskTypesResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs build() => _build();

  _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs _build() {
    _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiTaskTypesResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiTaskTypesResponseApplicationJsonInterfaceBuilder {
  void replace(TextProcessingApiTaskTypesResponseApplicationJsonInterface other);
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJsonInterfaceBuilder) updates);
  TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextProcessingApiTaskTypesResponseApplicationJson extends TextProcessingApiTaskTypesResponseApplicationJson {
  @override
  final TextProcessingApiTaskTypesResponseApplicationJson_Ocs ocs;

  factory _$TextProcessingApiTaskTypesResponseApplicationJson(
          [void Function(TextProcessingApiTaskTypesResponseApplicationJsonBuilder)? updates]) =>
      (TextProcessingApiTaskTypesResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextProcessingApiTaskTypesResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextProcessingApiTaskTypesResponseApplicationJson', 'ocs');
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson rebuild(
          void Function(TextProcessingApiTaskTypesResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiTaskTypesResponseApplicationJsonBuilder toBuilder() =>
      TextProcessingApiTaskTypesResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiTaskTypesResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiTaskTypesResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextProcessingApiTaskTypesResponseApplicationJsonBuilder
    implements
        Builder<TextProcessingApiTaskTypesResponseApplicationJson,
            TextProcessingApiTaskTypesResponseApplicationJsonBuilder>,
        TextProcessingApiTaskTypesResponseApplicationJsonInterfaceBuilder {
  _$TextProcessingApiTaskTypesResponseApplicationJson? _$v;

  TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder? _ocs;
  TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextProcessingApiTaskTypesResponseApplicationJsonBuilder();

  TextProcessingApiTaskTypesResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiTaskTypesResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiTaskTypesResponseApplicationJson;
  }

  @override
  void update(void Function(TextProcessingApiTaskTypesResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson build() => _build();

  _$TextProcessingApiTaskTypesResponseApplicationJson _build() {
    _$TextProcessingApiTaskTypesResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiTaskTypesResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiTaskTypesResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingTaskInterfaceBuilder {
  void replace(TextProcessingTaskInterface other);
  void update(void Function(TextProcessingTaskInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get type;
  set type(String? type);

  int? get status;
  set status(int? status);

  String? get userId;
  set userId(String? userId);

  String? get appId;
  set appId(String? appId);

  String? get input;
  set input(String? input);

  String? get output;
  set output(String? output);

  String? get identifier;
  set identifier(String? identifier);
}

class _$TextProcessingTask extends TextProcessingTask {
  @override
  final int? id;
  @override
  final String type;
  @override
  final int status;
  @override
  final String? userId;
  @override
  final String appId;
  @override
  final String input;
  @override
  final String? output;
  @override
  final String identifier;

  factory _$TextProcessingTask([void Function(TextProcessingTaskBuilder)? updates]) =>
      (TextProcessingTaskBuilder()..update(updates))._build();

  _$TextProcessingTask._(
      {this.id,
      required this.type,
      required this.status,
      this.userId,
      required this.appId,
      required this.input,
      this.output,
      required this.identifier})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'TextProcessingTask', 'type');
    BuiltValueNullFieldError.checkNotNull(status, r'TextProcessingTask', 'status');
    BuiltValueNullFieldError.checkNotNull(appId, r'TextProcessingTask', 'appId');
    BuiltValueNullFieldError.checkNotNull(input, r'TextProcessingTask', 'input');
    BuiltValueNullFieldError.checkNotNull(identifier, r'TextProcessingTask', 'identifier');
  }

  @override
  TextProcessingTask rebuild(void Function(TextProcessingTaskBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingTaskBuilder toBuilder() => TextProcessingTaskBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingTask &&
        id == other.id &&
        type == other.type &&
        status == other.status &&
        userId == other.userId &&
        appId == other.appId &&
        input == other.input &&
        output == other.output &&
        identifier == other.identifier;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, appId.hashCode);
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jc(_$hash, output.hashCode);
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextProcessingTask')
          ..add('id', id)
          ..add('type', type)
          ..add('status', status)
          ..add('userId', userId)
          ..add('appId', appId)
          ..add('input', input)
          ..add('output', output)
          ..add('identifier', identifier))
        .toString();
  }
}

class TextProcessingTaskBuilder
    implements Builder<TextProcessingTask, TextProcessingTaskBuilder>, TextProcessingTaskInterfaceBuilder {
  _$TextProcessingTask? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _appId;
  String? get appId => _$this._appId;
  set appId(covariant String? appId) => _$this._appId = appId;

  String? _input;
  String? get input => _$this._input;
  set input(covariant String? input) => _$this._input = input;

  String? _output;
  String? get output => _$this._output;
  set output(covariant String? output) => _$this._output = output;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(covariant String? identifier) => _$this._identifier = identifier;

  TextProcessingTaskBuilder();

  TextProcessingTaskBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _status = $v.status;
      _userId = $v.userId;
      _appId = $v.appId;
      _input = $v.input;
      _output = $v.output;
      _identifier = $v.identifier;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingTask other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingTask;
  }

  @override
  void update(void Function(TextProcessingTaskBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingTask build() => _build();

  _$TextProcessingTask _build() {
    final _$result = _$v ??
        _$TextProcessingTask._(
            id: id,
            type: BuiltValueNullFieldError.checkNotNull(type, r'TextProcessingTask', 'type'),
            status: BuiltValueNullFieldError.checkNotNull(status, r'TextProcessingTask', 'status'),
            userId: userId,
            appId: BuiltValueNullFieldError.checkNotNull(appId, r'TextProcessingTask', 'appId'),
            input: BuiltValueNullFieldError.checkNotNull(input, r'TextProcessingTask', 'input'),
            output: output,
            identifier: BuiltValueNullFieldError.checkNotNull(identifier, r'TextProcessingTask', 'identifier'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  TextProcessingTaskBuilder get task;
  set task(TextProcessingTaskBuilder? task);
}

class _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data
    extends TextProcessingApiScheduleResponseApplicationJson_Ocs_Data {
  @override
  final TextProcessingTask task;

  factory _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data(
          [void Function(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data._({required this.task}) : super._() {
    BuiltValueNullFieldError.checkNotNull(task, r'TextProcessingApiScheduleResponseApplicationJson_Ocs_Data', 'task');
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiScheduleResponseApplicationJson_Ocs_Data && task == other.task;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, task.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextProcessingApiScheduleResponseApplicationJson_Ocs_Data')
          ..add('task', task))
        .toString();
  }
}

class TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextProcessingApiScheduleResponseApplicationJson_Ocs_Data,
            TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder>,
        TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data? _$v;

  TextProcessingTaskBuilder? _task;
  TextProcessingTaskBuilder get task => _$this._task ??= TextProcessingTaskBuilder();
  set task(covariant TextProcessingTaskBuilder? task) => _$this._task = task;

  TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder();

  TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _task = $v.task.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiScheduleResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson_Ocs_Data build() => _build();

  _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data _build() {
    _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data._(task: task.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'task';
        task.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiScheduleResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiScheduleResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextProcessingApiScheduleResponseApplicationJson_OcsInterface other);
  void update(void Function(TextProcessingApiScheduleResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextProcessingApiScheduleResponseApplicationJson_Ocs
    extends TextProcessingApiScheduleResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextProcessingApiScheduleResponseApplicationJson_Ocs_Data data;

  factory _$TextProcessingApiScheduleResponseApplicationJson_Ocs(
          [void Function(TextProcessingApiScheduleResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextProcessingApiScheduleResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextProcessingApiScheduleResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextProcessingApiScheduleResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextProcessingApiScheduleResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson_Ocs rebuild(
          void Function(TextProcessingApiScheduleResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiScheduleResponseApplicationJson_OcsBuilder toBuilder() =>
      TextProcessingApiScheduleResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiScheduleResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiScheduleResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextProcessingApiScheduleResponseApplicationJson_OcsBuilder
    implements
        Builder<TextProcessingApiScheduleResponseApplicationJson_Ocs,
            TextProcessingApiScheduleResponseApplicationJson_OcsBuilder>,
        TextProcessingApiScheduleResponseApplicationJson_OcsInterfaceBuilder {
  _$TextProcessingApiScheduleResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder? _data;
  TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextProcessingApiScheduleResponseApplicationJson_OcsBuilder();

  TextProcessingApiScheduleResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiScheduleResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiScheduleResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextProcessingApiScheduleResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson_Ocs build() => _build();

  _$TextProcessingApiScheduleResponseApplicationJson_Ocs _build() {
    _$TextProcessingApiScheduleResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$TextProcessingApiScheduleResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiScheduleResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiScheduleResponseApplicationJsonInterfaceBuilder {
  void replace(TextProcessingApiScheduleResponseApplicationJsonInterface other);
  void update(void Function(TextProcessingApiScheduleResponseApplicationJsonInterfaceBuilder) updates);
  TextProcessingApiScheduleResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextProcessingApiScheduleResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextProcessingApiScheduleResponseApplicationJson extends TextProcessingApiScheduleResponseApplicationJson {
  @override
  final TextProcessingApiScheduleResponseApplicationJson_Ocs ocs;

  factory _$TextProcessingApiScheduleResponseApplicationJson(
          [void Function(TextProcessingApiScheduleResponseApplicationJsonBuilder)? updates]) =>
      (TextProcessingApiScheduleResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextProcessingApiScheduleResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextProcessingApiScheduleResponseApplicationJson', 'ocs');
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson rebuild(
          void Function(TextProcessingApiScheduleResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiScheduleResponseApplicationJsonBuilder toBuilder() =>
      TextProcessingApiScheduleResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiScheduleResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiScheduleResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextProcessingApiScheduleResponseApplicationJsonBuilder
    implements
        Builder<TextProcessingApiScheduleResponseApplicationJson,
            TextProcessingApiScheduleResponseApplicationJsonBuilder>,
        TextProcessingApiScheduleResponseApplicationJsonInterfaceBuilder {
  _$TextProcessingApiScheduleResponseApplicationJson? _$v;

  TextProcessingApiScheduleResponseApplicationJson_OcsBuilder? _ocs;
  TextProcessingApiScheduleResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextProcessingApiScheduleResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextProcessingApiScheduleResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextProcessingApiScheduleResponseApplicationJsonBuilder();

  TextProcessingApiScheduleResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiScheduleResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiScheduleResponseApplicationJson;
  }

  @override
  void update(void Function(TextProcessingApiScheduleResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson build() => _build();

  _$TextProcessingApiScheduleResponseApplicationJson _build() {
    _$TextProcessingApiScheduleResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiScheduleResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiScheduleResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  TextProcessingTaskBuilder get task;
  set task(TextProcessingTaskBuilder? task);
}

class _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data
    extends TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data {
  @override
  final TextProcessingTask task;

  factory _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data(
          [void Function(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data._({required this.task}) : super._() {
    BuiltValueNullFieldError.checkNotNull(task, r'TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data', 'task');
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data && task == other.task;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, task.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data')..add('task', task))
        .toString();
  }
}

class TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data,
            TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder>,
        TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data? _$v;

  TextProcessingTaskBuilder? _task;
  TextProcessingTaskBuilder get task => _$this._task ??= TextProcessingTaskBuilder();
  set task(covariant TextProcessingTaskBuilder? task) => _$this._task = task;

  TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder();

  TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _task = $v.task.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data build() => _build();

  _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data _build() {
    _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data._(task: task.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'task';
        task.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiGetTaskResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextProcessingApiGetTaskResponseApplicationJson_OcsInterface other);
  void update(void Function(TextProcessingApiGetTaskResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextProcessingApiGetTaskResponseApplicationJson_Ocs
    extends TextProcessingApiGetTaskResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data data;

  factory _$TextProcessingApiGetTaskResponseApplicationJson_Ocs(
          [void Function(TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextProcessingApiGetTaskResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextProcessingApiGetTaskResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextProcessingApiGetTaskResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson_Ocs rebuild(
          void Function(TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder toBuilder() =>
      TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiGetTaskResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiGetTaskResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder
    implements
        Builder<TextProcessingApiGetTaskResponseApplicationJson_Ocs,
            TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder>,
        TextProcessingApiGetTaskResponseApplicationJson_OcsInterfaceBuilder {
  _$TextProcessingApiGetTaskResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder? _data;
  TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder();

  TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiGetTaskResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiGetTaskResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson_Ocs build() => _build();

  _$TextProcessingApiGetTaskResponseApplicationJson_Ocs _build() {
    _$TextProcessingApiGetTaskResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiGetTaskResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiGetTaskResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiGetTaskResponseApplicationJsonInterfaceBuilder {
  void replace(TextProcessingApiGetTaskResponseApplicationJsonInterface other);
  void update(void Function(TextProcessingApiGetTaskResponseApplicationJsonInterfaceBuilder) updates);
  TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextProcessingApiGetTaskResponseApplicationJson extends TextProcessingApiGetTaskResponseApplicationJson {
  @override
  final TextProcessingApiGetTaskResponseApplicationJson_Ocs ocs;

  factory _$TextProcessingApiGetTaskResponseApplicationJson(
          [void Function(TextProcessingApiGetTaskResponseApplicationJsonBuilder)? updates]) =>
      (TextProcessingApiGetTaskResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextProcessingApiGetTaskResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextProcessingApiGetTaskResponseApplicationJson', 'ocs');
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson rebuild(
          void Function(TextProcessingApiGetTaskResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiGetTaskResponseApplicationJsonBuilder toBuilder() =>
      TextProcessingApiGetTaskResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiGetTaskResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiGetTaskResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextProcessingApiGetTaskResponseApplicationJsonBuilder
    implements
        Builder<TextProcessingApiGetTaskResponseApplicationJson,
            TextProcessingApiGetTaskResponseApplicationJsonBuilder>,
        TextProcessingApiGetTaskResponseApplicationJsonInterfaceBuilder {
  _$TextProcessingApiGetTaskResponseApplicationJson? _$v;

  TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder? _ocs;
  TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextProcessingApiGetTaskResponseApplicationJsonBuilder();

  TextProcessingApiGetTaskResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiGetTaskResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiGetTaskResponseApplicationJson;
  }

  @override
  void update(void Function(TextProcessingApiGetTaskResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson build() => _build();

  _$TextProcessingApiGetTaskResponseApplicationJson _build() {
    _$TextProcessingApiGetTaskResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiGetTaskResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiGetTaskResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  TextProcessingTaskBuilder get task;
  set task(TextProcessingTaskBuilder? task);
}

class _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data
    extends TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data {
  @override
  final TextProcessingTask task;

  factory _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data(
          [void Function(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data._({required this.task}) : super._() {
    BuiltValueNullFieldError.checkNotNull(task, r'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data', 'task');
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data && task == other.task;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, task.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data')
          ..add('task', task))
        .toString();
  }
}

class TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data,
            TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder>,
        TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data? _$v;

  TextProcessingTaskBuilder? _task;
  TextProcessingTaskBuilder get task => _$this._task ??= TextProcessingTaskBuilder();
  set task(covariant TextProcessingTaskBuilder? task) => _$this._task = task;

  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder();

  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _task = $v.task.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data build() => _build();

  _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data _build() {
    _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data._(task: task.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'task';
        task.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface other);
  void update(void Function(TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs
    extends TextProcessingApiDeleteTaskResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data data;

  factory _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs(
          [void Function(TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs rebuild(
          void Function(TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder toBuilder() =>
      TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiDeleteTaskResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder
    implements
        Builder<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs,
            TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder>,
        TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder {
  _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder? _data;
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder();

  TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiDeleteTaskResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs build() => _build();

  _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs _build() {
    _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiDeleteTaskResponseApplicationJsonInterfaceBuilder {
  void replace(TextProcessingApiDeleteTaskResponseApplicationJsonInterface other);
  void update(void Function(TextProcessingApiDeleteTaskResponseApplicationJsonInterfaceBuilder) updates);
  TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextProcessingApiDeleteTaskResponseApplicationJson extends TextProcessingApiDeleteTaskResponseApplicationJson {
  @override
  final TextProcessingApiDeleteTaskResponseApplicationJson_Ocs ocs;

  factory _$TextProcessingApiDeleteTaskResponseApplicationJson(
          [void Function(TextProcessingApiDeleteTaskResponseApplicationJsonBuilder)? updates]) =>
      (TextProcessingApiDeleteTaskResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextProcessingApiDeleteTaskResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextProcessingApiDeleteTaskResponseApplicationJson', 'ocs');
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson rebuild(
          void Function(TextProcessingApiDeleteTaskResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiDeleteTaskResponseApplicationJsonBuilder toBuilder() =>
      TextProcessingApiDeleteTaskResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiDeleteTaskResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiDeleteTaskResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextProcessingApiDeleteTaskResponseApplicationJsonBuilder
    implements
        Builder<TextProcessingApiDeleteTaskResponseApplicationJson,
            TextProcessingApiDeleteTaskResponseApplicationJsonBuilder>,
        TextProcessingApiDeleteTaskResponseApplicationJsonInterfaceBuilder {
  _$TextProcessingApiDeleteTaskResponseApplicationJson? _$v;

  TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder? _ocs;
  TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextProcessingApiDeleteTaskResponseApplicationJsonBuilder();

  TextProcessingApiDeleteTaskResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiDeleteTaskResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiDeleteTaskResponseApplicationJson;
  }

  @override
  void update(void Function(TextProcessingApiDeleteTaskResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson build() => _build();

  _$TextProcessingApiDeleteTaskResponseApplicationJson _build() {
    _$TextProcessingApiDeleteTaskResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiDeleteTaskResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiDeleteTaskResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  ListBuilder<TextProcessingTask> get tasks;
  set tasks(ListBuilder<TextProcessingTask>? tasks);
}

class _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data
    extends TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data {
  @override
  final BuiltList<TextProcessingTask> tasks;

  factory _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data(
          [void Function(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data._({required this.tasks}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        tasks, r'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data', 'tasks');
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data && tasks == other.tasks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tasks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data')
          ..add('tasks', tasks))
        .toString();
  }
}

class TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data,
            TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder>,
        TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data? _$v;

  ListBuilder<TextProcessingTask>? _tasks;
  ListBuilder<TextProcessingTask> get tasks => _$this._tasks ??= ListBuilder<TextProcessingTask>();
  set tasks(covariant ListBuilder<TextProcessingTask>? tasks) => _$this._tasks = tasks;

  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder();

  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tasks = $v.tasks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data build() => _build();

  _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data _build() {
    _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data._(tasks: tasks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tasks';
        tasks.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface other);
  void update(void Function(TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs
    extends TextProcessingApiListTasksByAppResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data data;

  factory _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs(
          [void Function(TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs rebuild(
          void Function(TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder toBuilder() =>
      TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiListTasksByAppResponseApplicationJson_Ocs &&
        meta == other.meta &&
        data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder
    implements
        Builder<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs,
            TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder>,
        TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder {
  _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder? _data;
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder? data) =>
      _$this._data = data;

  TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder();

  TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiListTasksByAppResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs build() => _build();

  _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs _build() {
    _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextProcessingApiListTasksByAppResponseApplicationJsonInterfaceBuilder {
  void replace(TextProcessingApiListTasksByAppResponseApplicationJsonInterface other);
  void update(void Function(TextProcessingApiListTasksByAppResponseApplicationJsonInterfaceBuilder) updates);
  TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextProcessingApiListTasksByAppResponseApplicationJson
    extends TextProcessingApiListTasksByAppResponseApplicationJson {
  @override
  final TextProcessingApiListTasksByAppResponseApplicationJson_Ocs ocs;

  factory _$TextProcessingApiListTasksByAppResponseApplicationJson(
          [void Function(TextProcessingApiListTasksByAppResponseApplicationJsonBuilder)? updates]) =>
      (TextProcessingApiListTasksByAppResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextProcessingApiListTasksByAppResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextProcessingApiListTasksByAppResponseApplicationJson', 'ocs');
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson rebuild(
          void Function(TextProcessingApiListTasksByAppResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextProcessingApiListTasksByAppResponseApplicationJsonBuilder toBuilder() =>
      TextProcessingApiListTasksByAppResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextProcessingApiListTasksByAppResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextProcessingApiListTasksByAppResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextProcessingApiListTasksByAppResponseApplicationJsonBuilder
    implements
        Builder<TextProcessingApiListTasksByAppResponseApplicationJson,
            TextProcessingApiListTasksByAppResponseApplicationJsonBuilder>,
        TextProcessingApiListTasksByAppResponseApplicationJsonInterfaceBuilder {
  _$TextProcessingApiListTasksByAppResponseApplicationJson? _$v;

  TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder? _ocs;
  TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextProcessingApiListTasksByAppResponseApplicationJsonBuilder();

  TextProcessingApiListTasksByAppResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextProcessingApiListTasksByAppResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextProcessingApiListTasksByAppResponseApplicationJson;
  }

  @override
  void update(void Function(TextProcessingApiListTasksByAppResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson build() => _build();

  _$TextProcessingApiListTasksByAppResponseApplicationJson _build() {
    _$TextProcessingApiListTasksByAppResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextProcessingApiListTasksByAppResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextProcessingApiListTasksByAppResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  bool? get isAvailable;
  set isAvailable(bool? isAvailable);
}

class _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data
    extends TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data {
  @override
  final bool isAvailable;

  factory _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data(
          [void Function(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data._({required this.isAvailable}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isAvailable, r'TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data', 'isAvailable');
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data && isAvailable == other.isAvailable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isAvailable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data')
          ..add('isAvailable', isAvailable))
        .toString();
  }
}

class TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data,
            TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder>,
        TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data? _$v;

  bool? _isAvailable;
  bool? get isAvailable => _$this._isAvailable;
  set isAvailable(covariant bool? isAvailable) => _$this._isAvailable = isAvailable;

  TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder();

  TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isAvailable = $v.isAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data build() => _build();

  _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data._(
            isAvailable: BuiltValueNullFieldError.checkNotNull(
                isAvailable, r'TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data', 'isAvailable'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiIsAvailableResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextToImageApiIsAvailableResponseApplicationJson_OcsInterface other);
  void update(void Function(TextToImageApiIsAvailableResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextToImageApiIsAvailableResponseApplicationJson_Ocs
    extends TextToImageApiIsAvailableResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data data;

  factory _$TextToImageApiIsAvailableResponseApplicationJson_Ocs(
          [void Function(TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextToImageApiIsAvailableResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextToImageApiIsAvailableResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextToImageApiIsAvailableResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson_Ocs rebuild(
          void Function(TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder toBuilder() =>
      TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiIsAvailableResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiIsAvailableResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder
    implements
        Builder<TextToImageApiIsAvailableResponseApplicationJson_Ocs,
            TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder>,
        TextToImageApiIsAvailableResponseApplicationJson_OcsInterfaceBuilder {
  _$TextToImageApiIsAvailableResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder? _data;
  TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder();

  TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiIsAvailableResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiIsAvailableResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson_Ocs build() => _build();

  _$TextToImageApiIsAvailableResponseApplicationJson_Ocs _build() {
    _$TextToImageApiIsAvailableResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$TextToImageApiIsAvailableResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiIsAvailableResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiIsAvailableResponseApplicationJsonInterfaceBuilder {
  void replace(TextToImageApiIsAvailableResponseApplicationJsonInterface other);
  void update(void Function(TextToImageApiIsAvailableResponseApplicationJsonInterfaceBuilder) updates);
  TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextToImageApiIsAvailableResponseApplicationJson extends TextToImageApiIsAvailableResponseApplicationJson {
  @override
  final TextToImageApiIsAvailableResponseApplicationJson_Ocs ocs;

  factory _$TextToImageApiIsAvailableResponseApplicationJson(
          [void Function(TextToImageApiIsAvailableResponseApplicationJsonBuilder)? updates]) =>
      (TextToImageApiIsAvailableResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextToImageApiIsAvailableResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextToImageApiIsAvailableResponseApplicationJson', 'ocs');
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson rebuild(
          void Function(TextToImageApiIsAvailableResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiIsAvailableResponseApplicationJsonBuilder toBuilder() =>
      TextToImageApiIsAvailableResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiIsAvailableResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiIsAvailableResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextToImageApiIsAvailableResponseApplicationJsonBuilder
    implements
        Builder<TextToImageApiIsAvailableResponseApplicationJson,
            TextToImageApiIsAvailableResponseApplicationJsonBuilder>,
        TextToImageApiIsAvailableResponseApplicationJsonInterfaceBuilder {
  _$TextToImageApiIsAvailableResponseApplicationJson? _$v;

  TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder? _ocs;
  TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextToImageApiIsAvailableResponseApplicationJsonBuilder();

  TextToImageApiIsAvailableResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiIsAvailableResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiIsAvailableResponseApplicationJson;
  }

  @override
  void update(void Function(TextToImageApiIsAvailableResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson build() => _build();

  _$TextToImageApiIsAvailableResponseApplicationJson _build() {
    _$TextToImageApiIsAvailableResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextToImageApiIsAvailableResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiIsAvailableResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageTaskInterfaceBuilder {
  void replace(TextToImageTaskInterface other);
  void update(void Function(TextToImageTaskInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  int? get status;
  set status(int? status);

  String? get userId;
  set userId(String? userId);

  String? get appId;
  set appId(String? appId);

  String? get input;
  set input(String? input);

  String? get identifier;
  set identifier(String? identifier);

  int? get numberOfImages;
  set numberOfImages(int? numberOfImages);

  int? get completionExpectedAt;
  set completionExpectedAt(int? completionExpectedAt);
}

class _$TextToImageTask extends TextToImageTask {
  @override
  final int? id;
  @override
  final int status;
  @override
  final String? userId;
  @override
  final String appId;
  @override
  final String input;
  @override
  final String? identifier;
  @override
  final int numberOfImages;
  @override
  final int? completionExpectedAt;

  factory _$TextToImageTask([void Function(TextToImageTaskBuilder)? updates]) =>
      (TextToImageTaskBuilder()..update(updates))._build();

  _$TextToImageTask._(
      {this.id,
      required this.status,
      this.userId,
      required this.appId,
      required this.input,
      this.identifier,
      required this.numberOfImages,
      this.completionExpectedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'TextToImageTask', 'status');
    BuiltValueNullFieldError.checkNotNull(appId, r'TextToImageTask', 'appId');
    BuiltValueNullFieldError.checkNotNull(input, r'TextToImageTask', 'input');
    BuiltValueNullFieldError.checkNotNull(numberOfImages, r'TextToImageTask', 'numberOfImages');
  }

  @override
  TextToImageTask rebuild(void Function(TextToImageTaskBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  TextToImageTaskBuilder toBuilder() => TextToImageTaskBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageTask &&
        id == other.id &&
        status == other.status &&
        userId == other.userId &&
        appId == other.appId &&
        input == other.input &&
        identifier == other.identifier &&
        numberOfImages == other.numberOfImages &&
        completionExpectedAt == other.completionExpectedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, appId.hashCode);
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jc(_$hash, numberOfImages.hashCode);
    _$hash = $jc(_$hash, completionExpectedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextToImageTask')
          ..add('id', id)
          ..add('status', status)
          ..add('userId', userId)
          ..add('appId', appId)
          ..add('input', input)
          ..add('identifier', identifier)
          ..add('numberOfImages', numberOfImages)
          ..add('completionExpectedAt', completionExpectedAt))
        .toString();
  }
}

class TextToImageTaskBuilder
    implements Builder<TextToImageTask, TextToImageTaskBuilder>, TextToImageTaskInterfaceBuilder {
  _$TextToImageTask? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _appId;
  String? get appId => _$this._appId;
  set appId(covariant String? appId) => _$this._appId = appId;

  String? _input;
  String? get input => _$this._input;
  set input(covariant String? input) => _$this._input = input;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(covariant String? identifier) => _$this._identifier = identifier;

  int? _numberOfImages;
  int? get numberOfImages => _$this._numberOfImages;
  set numberOfImages(covariant int? numberOfImages) => _$this._numberOfImages = numberOfImages;

  int? _completionExpectedAt;
  int? get completionExpectedAt => _$this._completionExpectedAt;
  set completionExpectedAt(covariant int? completionExpectedAt) => _$this._completionExpectedAt = completionExpectedAt;

  TextToImageTaskBuilder();

  TextToImageTaskBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _userId = $v.userId;
      _appId = $v.appId;
      _input = $v.input;
      _identifier = $v.identifier;
      _numberOfImages = $v.numberOfImages;
      _completionExpectedAt = $v.completionExpectedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageTask other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageTask;
  }

  @override
  void update(void Function(TextToImageTaskBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageTask build() => _build();

  _$TextToImageTask _build() {
    final _$result = _$v ??
        _$TextToImageTask._(
            id: id,
            status: BuiltValueNullFieldError.checkNotNull(status, r'TextToImageTask', 'status'),
            userId: userId,
            appId: BuiltValueNullFieldError.checkNotNull(appId, r'TextToImageTask', 'appId'),
            input: BuiltValueNullFieldError.checkNotNull(input, r'TextToImageTask', 'input'),
            identifier: identifier,
            numberOfImages: BuiltValueNullFieldError.checkNotNull(numberOfImages, r'TextToImageTask', 'numberOfImages'),
            completionExpectedAt: completionExpectedAt);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  TextToImageTaskBuilder get task;
  set task(TextToImageTaskBuilder? task);
}

class _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data
    extends TextToImageApiScheduleResponseApplicationJson_Ocs_Data {
  @override
  final TextToImageTask task;

  factory _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data(
          [void Function(TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data._({required this.task}) : super._() {
    BuiltValueNullFieldError.checkNotNull(task, r'TextToImageApiScheduleResponseApplicationJson_Ocs_Data', 'task');
  }

  @override
  TextToImageApiScheduleResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiScheduleResponseApplicationJson_Ocs_Data && task == other.task;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, task.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextToImageApiScheduleResponseApplicationJson_Ocs_Data')..add('task', task))
        .toString();
  }
}

class TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextToImageApiScheduleResponseApplicationJson_Ocs_Data,
            TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder>,
        TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data? _$v;

  TextToImageTaskBuilder? _task;
  TextToImageTaskBuilder get task => _$this._task ??= TextToImageTaskBuilder();
  set task(covariant TextToImageTaskBuilder? task) => _$this._task = task;

  TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder();

  TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _task = $v.task.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiScheduleResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiScheduleResponseApplicationJson_Ocs_Data build() => _build();

  _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data _build() {
    _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data._(task: task.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'task';
        task.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiScheduleResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiScheduleResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextToImageApiScheduleResponseApplicationJson_OcsInterface other);
  void update(void Function(TextToImageApiScheduleResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextToImageApiScheduleResponseApplicationJson_Ocs extends TextToImageApiScheduleResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextToImageApiScheduleResponseApplicationJson_Ocs_Data data;

  factory _$TextToImageApiScheduleResponseApplicationJson_Ocs(
          [void Function(TextToImageApiScheduleResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextToImageApiScheduleResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextToImageApiScheduleResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextToImageApiScheduleResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextToImageApiScheduleResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextToImageApiScheduleResponseApplicationJson_Ocs rebuild(
          void Function(TextToImageApiScheduleResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiScheduleResponseApplicationJson_OcsBuilder toBuilder() =>
      TextToImageApiScheduleResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiScheduleResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiScheduleResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextToImageApiScheduleResponseApplicationJson_OcsBuilder
    implements
        Builder<TextToImageApiScheduleResponseApplicationJson_Ocs,
            TextToImageApiScheduleResponseApplicationJson_OcsBuilder>,
        TextToImageApiScheduleResponseApplicationJson_OcsInterfaceBuilder {
  _$TextToImageApiScheduleResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder? _data;
  TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextToImageApiScheduleResponseApplicationJson_OcsBuilder();

  TextToImageApiScheduleResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiScheduleResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiScheduleResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextToImageApiScheduleResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiScheduleResponseApplicationJson_Ocs build() => _build();

  _$TextToImageApiScheduleResponseApplicationJson_Ocs _build() {
    _$TextToImageApiScheduleResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TextToImageApiScheduleResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiScheduleResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiScheduleResponseApplicationJsonInterfaceBuilder {
  void replace(TextToImageApiScheduleResponseApplicationJsonInterface other);
  void update(void Function(TextToImageApiScheduleResponseApplicationJsonInterfaceBuilder) updates);
  TextToImageApiScheduleResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextToImageApiScheduleResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextToImageApiScheduleResponseApplicationJson extends TextToImageApiScheduleResponseApplicationJson {
  @override
  final TextToImageApiScheduleResponseApplicationJson_Ocs ocs;

  factory _$TextToImageApiScheduleResponseApplicationJson(
          [void Function(TextToImageApiScheduleResponseApplicationJsonBuilder)? updates]) =>
      (TextToImageApiScheduleResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextToImageApiScheduleResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextToImageApiScheduleResponseApplicationJson', 'ocs');
  }

  @override
  TextToImageApiScheduleResponseApplicationJson rebuild(
          void Function(TextToImageApiScheduleResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiScheduleResponseApplicationJsonBuilder toBuilder() =>
      TextToImageApiScheduleResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiScheduleResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiScheduleResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TextToImageApiScheduleResponseApplicationJsonBuilder
    implements
        Builder<TextToImageApiScheduleResponseApplicationJson, TextToImageApiScheduleResponseApplicationJsonBuilder>,
        TextToImageApiScheduleResponseApplicationJsonInterfaceBuilder {
  _$TextToImageApiScheduleResponseApplicationJson? _$v;

  TextToImageApiScheduleResponseApplicationJson_OcsBuilder? _ocs;
  TextToImageApiScheduleResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextToImageApiScheduleResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextToImageApiScheduleResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextToImageApiScheduleResponseApplicationJsonBuilder();

  TextToImageApiScheduleResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiScheduleResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiScheduleResponseApplicationJson;
  }

  @override
  void update(void Function(TextToImageApiScheduleResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiScheduleResponseApplicationJson build() => _build();

  _$TextToImageApiScheduleResponseApplicationJson _build() {
    _$TextToImageApiScheduleResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextToImageApiScheduleResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TextToImageApiScheduleResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  TextToImageTaskBuilder get task;
  set task(TextToImageTaskBuilder? task);
}

class _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data
    extends TextToImageApiGetTaskResponseApplicationJson_Ocs_Data {
  @override
  final TextToImageTask task;

  factory _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data(
          [void Function(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data._({required this.task}) : super._() {
    BuiltValueNullFieldError.checkNotNull(task, r'TextToImageApiGetTaskResponseApplicationJson_Ocs_Data', 'task');
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiGetTaskResponseApplicationJson_Ocs_Data && task == other.task;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, task.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextToImageApiGetTaskResponseApplicationJson_Ocs_Data')..add('task', task))
        .toString();
  }
}

class TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextToImageApiGetTaskResponseApplicationJson_Ocs_Data,
            TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder>,
        TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data? _$v;

  TextToImageTaskBuilder? _task;
  TextToImageTaskBuilder get task => _$this._task ??= TextToImageTaskBuilder();
  set task(covariant TextToImageTaskBuilder? task) => _$this._task = task;

  TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder();

  TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _task = $v.task.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiGetTaskResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson_Ocs_Data build() => _build();

  _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data _build() {
    _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data._(task: task.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'task';
        task.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiGetTaskResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiGetTaskResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextToImageApiGetTaskResponseApplicationJson_OcsInterface other);
  void update(void Function(TextToImageApiGetTaskResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextToImageApiGetTaskResponseApplicationJson_Ocs extends TextToImageApiGetTaskResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextToImageApiGetTaskResponseApplicationJson_Ocs_Data data;

  factory _$TextToImageApiGetTaskResponseApplicationJson_Ocs(
          [void Function(TextToImageApiGetTaskResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextToImageApiGetTaskResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextToImageApiGetTaskResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextToImageApiGetTaskResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextToImageApiGetTaskResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson_Ocs rebuild(
          void Function(TextToImageApiGetTaskResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiGetTaskResponseApplicationJson_OcsBuilder toBuilder() =>
      TextToImageApiGetTaskResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiGetTaskResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiGetTaskResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextToImageApiGetTaskResponseApplicationJson_OcsBuilder
    implements
        Builder<TextToImageApiGetTaskResponseApplicationJson_Ocs,
            TextToImageApiGetTaskResponseApplicationJson_OcsBuilder>,
        TextToImageApiGetTaskResponseApplicationJson_OcsInterfaceBuilder {
  _$TextToImageApiGetTaskResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder? _data;
  TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextToImageApiGetTaskResponseApplicationJson_OcsBuilder();

  TextToImageApiGetTaskResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiGetTaskResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiGetTaskResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextToImageApiGetTaskResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson_Ocs build() => _build();

  _$TextToImageApiGetTaskResponseApplicationJson_Ocs _build() {
    _$TextToImageApiGetTaskResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TextToImageApiGetTaskResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiGetTaskResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiGetTaskResponseApplicationJsonInterfaceBuilder {
  void replace(TextToImageApiGetTaskResponseApplicationJsonInterface other);
  void update(void Function(TextToImageApiGetTaskResponseApplicationJsonInterfaceBuilder) updates);
  TextToImageApiGetTaskResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextToImageApiGetTaskResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextToImageApiGetTaskResponseApplicationJson extends TextToImageApiGetTaskResponseApplicationJson {
  @override
  final TextToImageApiGetTaskResponseApplicationJson_Ocs ocs;

  factory _$TextToImageApiGetTaskResponseApplicationJson(
          [void Function(TextToImageApiGetTaskResponseApplicationJsonBuilder)? updates]) =>
      (TextToImageApiGetTaskResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextToImageApiGetTaskResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextToImageApiGetTaskResponseApplicationJson', 'ocs');
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson rebuild(
          void Function(TextToImageApiGetTaskResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiGetTaskResponseApplicationJsonBuilder toBuilder() =>
      TextToImageApiGetTaskResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiGetTaskResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiGetTaskResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TextToImageApiGetTaskResponseApplicationJsonBuilder
    implements
        Builder<TextToImageApiGetTaskResponseApplicationJson, TextToImageApiGetTaskResponseApplicationJsonBuilder>,
        TextToImageApiGetTaskResponseApplicationJsonInterfaceBuilder {
  _$TextToImageApiGetTaskResponseApplicationJson? _$v;

  TextToImageApiGetTaskResponseApplicationJson_OcsBuilder? _ocs;
  TextToImageApiGetTaskResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextToImageApiGetTaskResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextToImageApiGetTaskResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextToImageApiGetTaskResponseApplicationJsonBuilder();

  TextToImageApiGetTaskResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiGetTaskResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiGetTaskResponseApplicationJson;
  }

  @override
  void update(void Function(TextToImageApiGetTaskResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson build() => _build();

  _$TextToImageApiGetTaskResponseApplicationJson _build() {
    _$TextToImageApiGetTaskResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextToImageApiGetTaskResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'TextToImageApiGetTaskResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  TextToImageTaskBuilder get task;
  set task(TextToImageTaskBuilder? task);
}

class _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data
    extends TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data {
  @override
  final TextToImageTask task;

  factory _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data(
          [void Function(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data._({required this.task}) : super._() {
    BuiltValueNullFieldError.checkNotNull(task, r'TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data', 'task');
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data && task == other.task;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, task.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data')..add('task', task))
        .toString();
  }
}

class TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data,
            TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder>,
        TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data? _$v;

  TextToImageTaskBuilder? _task;
  TextToImageTaskBuilder get task => _$this._task ??= TextToImageTaskBuilder();
  set task(covariant TextToImageTaskBuilder? task) => _$this._task = task;

  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder();

  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _task = $v.task.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data build() => _build();

  _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data _build() {
    _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data._(task: task.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'task';
        task.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextToImageApiDeleteTaskResponseApplicationJson_OcsInterface other);
  void update(void Function(TextToImageApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs
    extends TextToImageApiDeleteTaskResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data data;

  factory _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs(
          [void Function(TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextToImageApiDeleteTaskResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextToImageApiDeleteTaskResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs rebuild(
          void Function(TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder toBuilder() =>
      TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiDeleteTaskResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiDeleteTaskResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder
    implements
        Builder<TextToImageApiDeleteTaskResponseApplicationJson_Ocs,
            TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder>,
        TextToImageApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder {
  _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder? _data;
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder();

  TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiDeleteTaskResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs build() => _build();

  _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs _build() {
    _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiDeleteTaskResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiDeleteTaskResponseApplicationJsonInterfaceBuilder {
  void replace(TextToImageApiDeleteTaskResponseApplicationJsonInterface other);
  void update(void Function(TextToImageApiDeleteTaskResponseApplicationJsonInterfaceBuilder) updates);
  TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextToImageApiDeleteTaskResponseApplicationJson extends TextToImageApiDeleteTaskResponseApplicationJson {
  @override
  final TextToImageApiDeleteTaskResponseApplicationJson_Ocs ocs;

  factory _$TextToImageApiDeleteTaskResponseApplicationJson(
          [void Function(TextToImageApiDeleteTaskResponseApplicationJsonBuilder)? updates]) =>
      (TextToImageApiDeleteTaskResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextToImageApiDeleteTaskResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextToImageApiDeleteTaskResponseApplicationJson', 'ocs');
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson rebuild(
          void Function(TextToImageApiDeleteTaskResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiDeleteTaskResponseApplicationJsonBuilder toBuilder() =>
      TextToImageApiDeleteTaskResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiDeleteTaskResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiDeleteTaskResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextToImageApiDeleteTaskResponseApplicationJsonBuilder
    implements
        Builder<TextToImageApiDeleteTaskResponseApplicationJson,
            TextToImageApiDeleteTaskResponseApplicationJsonBuilder>,
        TextToImageApiDeleteTaskResponseApplicationJsonInterfaceBuilder {
  _$TextToImageApiDeleteTaskResponseApplicationJson? _$v;

  TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder? _ocs;
  TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextToImageApiDeleteTaskResponseApplicationJsonBuilder();

  TextToImageApiDeleteTaskResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiDeleteTaskResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiDeleteTaskResponseApplicationJson;
  }

  @override
  void update(void Function(TextToImageApiDeleteTaskResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson build() => _build();

  _$TextToImageApiDeleteTaskResponseApplicationJson _build() {
    _$TextToImageApiDeleteTaskResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextToImageApiDeleteTaskResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiDeleteTaskResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  ListBuilder<TextToImageTask> get tasks;
  set tasks(ListBuilder<TextToImageTask>? tasks);
}

class _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data
    extends TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data {
  @override
  final BuiltList<TextToImageTask> tasks;

  factory _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data(
          [void Function(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data._({required this.tasks}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        tasks, r'TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data', 'tasks');
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data rebuild(
          void Function(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data && tasks == other.tasks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tasks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data')
          ..add('tasks', tasks))
        .toString();
  }
}

class TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data,
            TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder>,
        TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data? _$v;

  ListBuilder<TextToImageTask>? _tasks;
  ListBuilder<TextToImageTask> get tasks => _$this._tasks ??= ListBuilder<TextToImageTask>();
  set tasks(covariant ListBuilder<TextToImageTask>? tasks) => _$this._tasks = tasks;

  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder();

  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tasks = $v.tasks.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data build() => _build();

  _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data _build() {
    _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ?? _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data._(tasks: tasks.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tasks';
        tasks.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TextToImageApiListTasksByAppResponseApplicationJson_OcsInterface other);
  void update(void Function(TextToImageApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs
    extends TextToImageApiListTasksByAppResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data data;

  factory _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs(
          [void Function(TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder)? updates]) =>
      (TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TextToImageApiListTasksByAppResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TextToImageApiListTasksByAppResponseApplicationJson_Ocs', 'data');
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs rebuild(
          void Function(TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder toBuilder() =>
      TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiListTasksByAppResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiListTasksByAppResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder
    implements
        Builder<TextToImageApiListTasksByAppResponseApplicationJson_Ocs,
            TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder>,
        TextToImageApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder {
  _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder? _data;
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder();

  TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiListTasksByAppResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs build() => _build();

  _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs _build() {
    _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiListTasksByAppResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TextToImageApiListTasksByAppResponseApplicationJsonInterfaceBuilder {
  void replace(TextToImageApiListTasksByAppResponseApplicationJsonInterface other);
  void update(void Function(TextToImageApiListTasksByAppResponseApplicationJsonInterfaceBuilder) updates);
  TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder? ocs);
}

class _$TextToImageApiListTasksByAppResponseApplicationJson
    extends TextToImageApiListTasksByAppResponseApplicationJson {
  @override
  final TextToImageApiListTasksByAppResponseApplicationJson_Ocs ocs;

  factory _$TextToImageApiListTasksByAppResponseApplicationJson(
          [void Function(TextToImageApiListTasksByAppResponseApplicationJsonBuilder)? updates]) =>
      (TextToImageApiListTasksByAppResponseApplicationJsonBuilder()..update(updates))._build();

  _$TextToImageApiListTasksByAppResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TextToImageApiListTasksByAppResponseApplicationJson', 'ocs');
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson rebuild(
          void Function(TextToImageApiListTasksByAppResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextToImageApiListTasksByAppResponseApplicationJsonBuilder toBuilder() =>
      TextToImageApiListTasksByAppResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextToImageApiListTasksByAppResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TextToImageApiListTasksByAppResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class TextToImageApiListTasksByAppResponseApplicationJsonBuilder
    implements
        Builder<TextToImageApiListTasksByAppResponseApplicationJson,
            TextToImageApiListTasksByAppResponseApplicationJsonBuilder>,
        TextToImageApiListTasksByAppResponseApplicationJsonInterfaceBuilder {
  _$TextToImageApiListTasksByAppResponseApplicationJson? _$v;

  TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder? _ocs;
  TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder();
  set ocs(covariant TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TextToImageApiListTasksByAppResponseApplicationJsonBuilder();

  TextToImageApiListTasksByAppResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextToImageApiListTasksByAppResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextToImageApiListTasksByAppResponseApplicationJson;
  }

  @override
  void update(void Function(TextToImageApiListTasksByAppResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson build() => _build();

  _$TextToImageApiListTasksByAppResponseApplicationJson _build() {
    _$TextToImageApiListTasksByAppResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TextToImageApiListTasksByAppResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TextToImageApiListTasksByAppResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterfaceBuilder {
  void replace(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface other);
  void update(void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterfaceBuilder) updates);
  String? get from;
  set from(String? from);

  String? get fromLabel;
  set fromLabel(String? fromLabel);

  String? get to;
  set to(String? to);

  String? get toLabel;
  set toLabel(String? toLabel);
}

class _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages
    extends TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages {
  @override
  final String from;
  @override
  final String fromLabel;
  @override
  final String to;
  @override
  final String toLabel;

  factory _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages(
          [void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder)? updates]) =>
      (TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder()..update(updates))._build();

  _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages._(
      {required this.from, required this.fromLabel, required this.to, required this.toLabel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        from, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'from');
    BuiltValueNullFieldError.checkNotNull(
        fromLabel, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'fromLabel');
    BuiltValueNullFieldError.checkNotNull(
        to, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'to');
    BuiltValueNullFieldError.checkNotNull(
        toLabel, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'toLabel');
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages rebuild(
          void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder toBuilder() =>
      TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages &&
        from == other.from &&
        fromLabel == other.fromLabel &&
        to == other.to &&
        toLabel == other.toLabel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, fromLabel.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, toLabel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages')
          ..add('from', from)
          ..add('fromLabel', fromLabel)
          ..add('to', to)
          ..add('toLabel', toLabel))
        .toString();
  }
}

class TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder
    implements
        Builder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages,
            TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder>,
        TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterfaceBuilder {
  _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages? _$v;

  String? _from;
  String? get from => _$this._from;
  set from(covariant String? from) => _$this._from = from;

  String? _fromLabel;
  String? get fromLabel => _$this._fromLabel;
  set fromLabel(covariant String? fromLabel) => _$this._fromLabel = fromLabel;

  String? _to;
  String? get to => _$this._to;
  set to(covariant String? to) => _$this._to = to;

  String? _toLabel;
  String? get toLabel => _$this._toLabel;
  set toLabel(covariant String? toLabel) => _$this._toLabel = toLabel;

  TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder();

  TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from;
      _fromLabel = $v.fromLabel;
      _to = $v.to;
      _toLabel = $v.toLabel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages;
  }

  @override
  void update(void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages build() => _build();

  _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages _build() {
    final _$result = _$v ??
        _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages._(
            from: BuiltValueNullFieldError.checkNotNull(
                from, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'from'),
            fromLabel: BuiltValueNullFieldError.checkNotNull(
                fromLabel, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'fromLabel'),
            to: BuiltValueNullFieldError.checkNotNull(
                to, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'to'),
            toLabel: BuiltValueNullFieldError.checkNotNull(
                toLabel, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages', 'toLabel'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get languages;
  set languages(ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>? languages);

  bool? get languageDetection;
  set languageDetection(bool? languageDetection);
}

class _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data
    extends TranslationApiLanguagesResponseApplicationJson_Ocs_Data {
  @override
  final BuiltList<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> languages;
  @override
  final bool languageDetection;

  factory _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data(
          [void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data._(
      {required this.languages, required this.languageDetection})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        languages, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data', 'languages');
    BuiltValueNullFieldError.checkNotNull(
        languageDetection, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data', 'languageDetection');
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data rebuild(
          void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationApiLanguagesResponseApplicationJson_Ocs_Data &&
        languages == other.languages &&
        languageDetection == other.languageDetection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, languageDetection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data')
          ..add('languages', languages)
          ..add('languageDetection', languageDetection))
        .toString();
  }
}

class TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data,
            TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder>,
        TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data? _$v;

  ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>? _languages;
  ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get languages =>
      _$this._languages ??= ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>();
  set languages(covariant ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>? languages) =>
      _$this._languages = languages;

  bool? _languageDetection;
  bool? get languageDetection => _$this._languageDetection;
  set languageDetection(covariant bool? languageDetection) => _$this._languageDetection = languageDetection;

  TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder();

  TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _languages = $v.languages.toBuilder();
      _languageDetection = $v.languageDetection;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TranslationApiLanguagesResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data build() => _build();

  _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data _build() {
    _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data._(
              languages: languages.build(),
              languageDetection: BuiltValueNullFieldError.checkNotNull(
                  languageDetection, r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data', 'languageDetection'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'languages';
        languages.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TranslationApiLanguagesResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TranslationApiLanguagesResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TranslationApiLanguagesResponseApplicationJson_OcsInterface other);
  void update(void Function(TranslationApiLanguagesResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TranslationApiLanguagesResponseApplicationJson_Ocs extends TranslationApiLanguagesResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TranslationApiLanguagesResponseApplicationJson_Ocs_Data data;

  factory _$TranslationApiLanguagesResponseApplicationJson_Ocs(
          [void Function(TranslationApiLanguagesResponseApplicationJson_OcsBuilder)? updates]) =>
      (TranslationApiLanguagesResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TranslationApiLanguagesResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TranslationApiLanguagesResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TranslationApiLanguagesResponseApplicationJson_Ocs', 'data');
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs rebuild(
          void Function(TranslationApiLanguagesResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationApiLanguagesResponseApplicationJson_OcsBuilder toBuilder() =>
      TranslationApiLanguagesResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationApiLanguagesResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TranslationApiLanguagesResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TranslationApiLanguagesResponseApplicationJson_OcsBuilder
    implements
        Builder<TranslationApiLanguagesResponseApplicationJson_Ocs,
            TranslationApiLanguagesResponseApplicationJson_OcsBuilder>,
        TranslationApiLanguagesResponseApplicationJson_OcsInterfaceBuilder {
  _$TranslationApiLanguagesResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder? _data;
  TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TranslationApiLanguagesResponseApplicationJson_OcsBuilder();

  TranslationApiLanguagesResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TranslationApiLanguagesResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslationApiLanguagesResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TranslationApiLanguagesResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs build() => _build();

  _$TranslationApiLanguagesResponseApplicationJson_Ocs _build() {
    _$TranslationApiLanguagesResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TranslationApiLanguagesResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TranslationApiLanguagesResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TranslationApiLanguagesResponseApplicationJsonInterfaceBuilder {
  void replace(TranslationApiLanguagesResponseApplicationJsonInterface other);
  void update(void Function(TranslationApiLanguagesResponseApplicationJsonInterfaceBuilder) updates);
  TranslationApiLanguagesResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TranslationApiLanguagesResponseApplicationJson_OcsBuilder? ocs);
}

class _$TranslationApiLanguagesResponseApplicationJson extends TranslationApiLanguagesResponseApplicationJson {
  @override
  final TranslationApiLanguagesResponseApplicationJson_Ocs ocs;

  factory _$TranslationApiLanguagesResponseApplicationJson(
          [void Function(TranslationApiLanguagesResponseApplicationJsonBuilder)? updates]) =>
      (TranslationApiLanguagesResponseApplicationJsonBuilder()..update(updates))._build();

  _$TranslationApiLanguagesResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TranslationApiLanguagesResponseApplicationJson', 'ocs');
  }

  @override
  TranslationApiLanguagesResponseApplicationJson rebuild(
          void Function(TranslationApiLanguagesResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationApiLanguagesResponseApplicationJsonBuilder toBuilder() =>
      TranslationApiLanguagesResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationApiLanguagesResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TranslationApiLanguagesResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TranslationApiLanguagesResponseApplicationJsonBuilder
    implements
        Builder<TranslationApiLanguagesResponseApplicationJson, TranslationApiLanguagesResponseApplicationJsonBuilder>,
        TranslationApiLanguagesResponseApplicationJsonInterfaceBuilder {
  _$TranslationApiLanguagesResponseApplicationJson? _$v;

  TranslationApiLanguagesResponseApplicationJson_OcsBuilder? _ocs;
  TranslationApiLanguagesResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TranslationApiLanguagesResponseApplicationJson_OcsBuilder();
  set ocs(covariant TranslationApiLanguagesResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TranslationApiLanguagesResponseApplicationJsonBuilder();

  TranslationApiLanguagesResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TranslationApiLanguagesResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslationApiLanguagesResponseApplicationJson;
  }

  @override
  void update(void Function(TranslationApiLanguagesResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationApiLanguagesResponseApplicationJson build() => _build();

  _$TranslationApiLanguagesResponseApplicationJson _build() {
    _$TranslationApiLanguagesResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TranslationApiLanguagesResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TranslationApiLanguagesResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TranslationApiTranslateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(TranslationApiTranslateResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(TranslationApiTranslateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get text;
  set text(String? text);

  String? get from;
  set from(String? from);
}

class _$TranslationApiTranslateResponseApplicationJson_Ocs_Data
    extends TranslationApiTranslateResponseApplicationJson_Ocs_Data {
  @override
  final String text;
  @override
  final String? from;

  factory _$TranslationApiTranslateResponseApplicationJson_Ocs_Data(
          [void Function(TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TranslationApiTranslateResponseApplicationJson_Ocs_Data._({required this.text, this.from}) : super._() {
    BuiltValueNullFieldError.checkNotNull(text, r'TranslationApiTranslateResponseApplicationJson_Ocs_Data', 'text');
  }

  @override
  TranslationApiTranslateResponseApplicationJson_Ocs_Data rebuild(
          void Function(TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationApiTranslateResponseApplicationJson_Ocs_Data && text == other.text && from == other.from;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslationApiTranslateResponseApplicationJson_Ocs_Data')
          ..add('text', text)
          ..add('from', from))
        .toString();
  }
}

class TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TranslationApiTranslateResponseApplicationJson_Ocs_Data,
            TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder>,
        TranslationApiTranslateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TranslationApiTranslateResponseApplicationJson_Ocs_Data? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(covariant String? text) => _$this._text = text;

  String? _from;
  String? get from => _$this._from;
  set from(covariant String? from) => _$this._from = from;

  TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder();

  TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _from = $v.from;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TranslationApiTranslateResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslationApiTranslateResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationApiTranslateResponseApplicationJson_Ocs_Data build() => _build();

  _$TranslationApiTranslateResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$TranslationApiTranslateResponseApplicationJson_Ocs_Data._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'TranslationApiTranslateResponseApplicationJson_Ocs_Data', 'text'),
            from: from);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TranslationApiTranslateResponseApplicationJson_OcsInterfaceBuilder {
  void replace(TranslationApiTranslateResponseApplicationJson_OcsInterface other);
  void update(void Function(TranslationApiTranslateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TranslationApiTranslateResponseApplicationJson_Ocs extends TranslationApiTranslateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TranslationApiTranslateResponseApplicationJson_Ocs_Data data;

  factory _$TranslationApiTranslateResponseApplicationJson_Ocs(
          [void Function(TranslationApiTranslateResponseApplicationJson_OcsBuilder)? updates]) =>
      (TranslationApiTranslateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TranslationApiTranslateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TranslationApiTranslateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TranslationApiTranslateResponseApplicationJson_Ocs', 'data');
  }

  @override
  TranslationApiTranslateResponseApplicationJson_Ocs rebuild(
          void Function(TranslationApiTranslateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationApiTranslateResponseApplicationJson_OcsBuilder toBuilder() =>
      TranslationApiTranslateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationApiTranslateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TranslationApiTranslateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TranslationApiTranslateResponseApplicationJson_OcsBuilder
    implements
        Builder<TranslationApiTranslateResponseApplicationJson_Ocs,
            TranslationApiTranslateResponseApplicationJson_OcsBuilder>,
        TranslationApiTranslateResponseApplicationJson_OcsInterfaceBuilder {
  _$TranslationApiTranslateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder? _data;
  TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TranslationApiTranslateResponseApplicationJson_OcsBuilder();

  TranslationApiTranslateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TranslationApiTranslateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslationApiTranslateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TranslationApiTranslateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationApiTranslateResponseApplicationJson_Ocs build() => _build();

  _$TranslationApiTranslateResponseApplicationJson_Ocs _build() {
    _$TranslationApiTranslateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$TranslationApiTranslateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TranslationApiTranslateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class TranslationApiTranslateResponseApplicationJsonInterfaceBuilder {
  void replace(TranslationApiTranslateResponseApplicationJsonInterface other);
  void update(void Function(TranslationApiTranslateResponseApplicationJsonInterfaceBuilder) updates);
  TranslationApiTranslateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TranslationApiTranslateResponseApplicationJson_OcsBuilder? ocs);
}

class _$TranslationApiTranslateResponseApplicationJson extends TranslationApiTranslateResponseApplicationJson {
  @override
  final TranslationApiTranslateResponseApplicationJson_Ocs ocs;

  factory _$TranslationApiTranslateResponseApplicationJson(
          [void Function(TranslationApiTranslateResponseApplicationJsonBuilder)? updates]) =>
      (TranslationApiTranslateResponseApplicationJsonBuilder()..update(updates))._build();

  _$TranslationApiTranslateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TranslationApiTranslateResponseApplicationJson', 'ocs');
  }

  @override
  TranslationApiTranslateResponseApplicationJson rebuild(
          void Function(TranslationApiTranslateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationApiTranslateResponseApplicationJsonBuilder toBuilder() =>
      TranslationApiTranslateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationApiTranslateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TranslationApiTranslateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TranslationApiTranslateResponseApplicationJsonBuilder
    implements
        Builder<TranslationApiTranslateResponseApplicationJson, TranslationApiTranslateResponseApplicationJsonBuilder>,
        TranslationApiTranslateResponseApplicationJsonInterfaceBuilder {
  _$TranslationApiTranslateResponseApplicationJson? _$v;

  TranslationApiTranslateResponseApplicationJson_OcsBuilder? _ocs;
  TranslationApiTranslateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= TranslationApiTranslateResponseApplicationJson_OcsBuilder();
  set ocs(covariant TranslationApiTranslateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TranslationApiTranslateResponseApplicationJsonBuilder();

  TranslationApiTranslateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TranslationApiTranslateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TranslationApiTranslateResponseApplicationJson;
  }

  @override
  void update(void Function(TranslationApiTranslateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationApiTranslateResponseApplicationJson build() => _build();

  _$TranslationApiTranslateResponseApplicationJson _build() {
    _$TranslationApiTranslateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$TranslationApiTranslateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TranslationApiTranslateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchProviderInterfaceBuilder {
  void replace(UnifiedSearchProviderInterface other);
  void update(void Function(UnifiedSearchProviderInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get name;
  set name(String? name);

  int? get order;
  set order(int? order);
}

class _$UnifiedSearchProvider extends UnifiedSearchProvider {
  @override
  final String id;
  @override
  final String name;
  @override
  final int order;

  factory _$UnifiedSearchProvider([void Function(UnifiedSearchProviderBuilder)? updates]) =>
      (UnifiedSearchProviderBuilder()..update(updates))._build();

  _$UnifiedSearchProvider._({required this.id, required this.name, required this.order}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UnifiedSearchProvider', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'UnifiedSearchProvider', 'name');
    BuiltValueNullFieldError.checkNotNull(order, r'UnifiedSearchProvider', 'order');
  }

  @override
  UnifiedSearchProvider rebuild(void Function(UnifiedSearchProviderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchProviderBuilder toBuilder() => UnifiedSearchProviderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchProvider && id == other.id && name == other.name && order == other.order;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnifiedSearchProvider')
          ..add('id', id)
          ..add('name', name)
          ..add('order', order))
        .toString();
  }
}

class UnifiedSearchProviderBuilder
    implements Builder<UnifiedSearchProvider, UnifiedSearchProviderBuilder>, UnifiedSearchProviderInterfaceBuilder {
  _$UnifiedSearchProvider? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  int? _order;
  int? get order => _$this._order;
  set order(covariant int? order) => _$this._order = order;

  UnifiedSearchProviderBuilder();

  UnifiedSearchProviderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _order = $v.order;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchProvider other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchProvider;
  }

  @override
  void update(void Function(UnifiedSearchProviderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchProvider build() => _build();

  _$UnifiedSearchProvider _build() {
    final _$result = _$v ??
        _$UnifiedSearchProvider._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'UnifiedSearchProvider', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(name, r'UnifiedSearchProvider', 'name'),
            order: BuiltValueNullFieldError.checkNotNull(order, r'UnifiedSearchProvider', 'order'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchGetProvidersResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UnifiedSearchGetProvidersResponseApplicationJson_OcsInterface other);
  void update(void Function(UnifiedSearchGetProvidersResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<UnifiedSearchProvider> get data;
  set data(ListBuilder<UnifiedSearchProvider>? data);
}

class _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs
    extends UnifiedSearchGetProvidersResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<UnifiedSearchProvider> data;

  factory _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs(
          [void Function(UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder)? updates]) =>
      (UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UnifiedSearchGetProvidersResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UnifiedSearchGetProvidersResponseApplicationJson_Ocs', 'data');
  }

  @override
  UnifiedSearchGetProvidersResponseApplicationJson_Ocs rebuild(
          void Function(UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder toBuilder() =>
      UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchGetProvidersResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UnifiedSearchGetProvidersResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder
    implements
        Builder<UnifiedSearchGetProvidersResponseApplicationJson_Ocs,
            UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder>,
        UnifiedSearchGetProvidersResponseApplicationJson_OcsInterfaceBuilder {
  _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<UnifiedSearchProvider>? _data;
  ListBuilder<UnifiedSearchProvider> get data => _$this._data ??= ListBuilder<UnifiedSearchProvider>();
  set data(covariant ListBuilder<UnifiedSearchProvider>? data) => _$this._data = data;

  UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder();

  UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchGetProvidersResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchGetProvidersResponseApplicationJson_Ocs build() => _build();

  _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs _build() {
    _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UnifiedSearchGetProvidersResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchGetProvidersResponseApplicationJsonInterfaceBuilder {
  void replace(UnifiedSearchGetProvidersResponseApplicationJsonInterface other);
  void update(void Function(UnifiedSearchGetProvidersResponseApplicationJsonInterfaceBuilder) updates);
  UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder? ocs);
}

class _$UnifiedSearchGetProvidersResponseApplicationJson extends UnifiedSearchGetProvidersResponseApplicationJson {
  @override
  final UnifiedSearchGetProvidersResponseApplicationJson_Ocs ocs;

  factory _$UnifiedSearchGetProvidersResponseApplicationJson(
          [void Function(UnifiedSearchGetProvidersResponseApplicationJsonBuilder)? updates]) =>
      (UnifiedSearchGetProvidersResponseApplicationJsonBuilder()..update(updates))._build();

  _$UnifiedSearchGetProvidersResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UnifiedSearchGetProvidersResponseApplicationJson', 'ocs');
  }

  @override
  UnifiedSearchGetProvidersResponseApplicationJson rebuild(
          void Function(UnifiedSearchGetProvidersResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchGetProvidersResponseApplicationJsonBuilder toBuilder() =>
      UnifiedSearchGetProvidersResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchGetProvidersResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UnifiedSearchGetProvidersResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UnifiedSearchGetProvidersResponseApplicationJsonBuilder
    implements
        Builder<UnifiedSearchGetProvidersResponseApplicationJson,
            UnifiedSearchGetProvidersResponseApplicationJsonBuilder>,
        UnifiedSearchGetProvidersResponseApplicationJsonInterfaceBuilder {
  _$UnifiedSearchGetProvidersResponseApplicationJson? _$v;

  UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder? _ocs;
  UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder();
  set ocs(covariant UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UnifiedSearchGetProvidersResponseApplicationJsonBuilder();

  UnifiedSearchGetProvidersResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchGetProvidersResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchGetProvidersResponseApplicationJson;
  }

  @override
  void update(void Function(UnifiedSearchGetProvidersResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchGetProvidersResponseApplicationJson build() => _build();

  _$UnifiedSearchGetProvidersResponseApplicationJson _build() {
    _$UnifiedSearchGetProvidersResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UnifiedSearchGetProvidersResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UnifiedSearchGetProvidersResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchSearchCursorInterfaceBuilder {
  void replace(UnifiedSearchSearchCursorInterface other);
  void update(void Function(UnifiedSearchSearchCursorInterfaceBuilder) updates);
  int? get $int;
  set $int(int? $int);

  String? get string;
  set string(String? string);
}

class _$UnifiedSearchSearchCursor extends UnifiedSearchSearchCursor {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final String? string;

  factory _$UnifiedSearchSearchCursor([void Function(UnifiedSearchSearchCursorBuilder)? updates]) =>
      (UnifiedSearchSearchCursorBuilder()..update(updates))._build();

  _$UnifiedSearchSearchCursor._({required this.data, this.$int, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UnifiedSearchSearchCursor', 'data');
  }

  @override
  UnifiedSearchSearchCursor rebuild(void Function(UnifiedSearchSearchCursorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchSearchCursorBuilder toBuilder() => UnifiedSearchSearchCursorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchSearchCursor && data == other.data && $int == other.$int && string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnifiedSearchSearchCursor')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('string', string))
        .toString();
  }
}

class UnifiedSearchSearchCursorBuilder
    implements
        Builder<UnifiedSearchSearchCursor, UnifiedSearchSearchCursorBuilder>,
        UnifiedSearchSearchCursorInterfaceBuilder {
  _$UnifiedSearchSearchCursor? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(covariant int? $int) => _$this._$int = $int;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  UnifiedSearchSearchCursorBuilder();

  UnifiedSearchSearchCursorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$int = $v.$int;
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchSearchCursor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchSearchCursor;
  }

  @override
  void update(void Function(UnifiedSearchSearchCursorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchSearchCursor build() => _build();

  _$UnifiedSearchSearchCursor _build() {
    UnifiedSearchSearchCursor._validate(this);
    final _$result = _$v ??
        _$UnifiedSearchSearchCursor._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'UnifiedSearchSearchCursor', 'data'),
            $int: $int,
            string: string);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchResultEntryInterfaceBuilder {
  void replace(UnifiedSearchResultEntryInterface other);
  void update(void Function(UnifiedSearchResultEntryInterfaceBuilder) updates);
  String? get thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl);

  String? get title;
  set title(String? title);

  String? get subline;
  set subline(String? subline);

  String? get resourceUrl;
  set resourceUrl(String? resourceUrl);

  String? get icon;
  set icon(String? icon);

  bool? get rounded;
  set rounded(bool? rounded);

  ListBuilder<String> get attributes;
  set attributes(ListBuilder<String>? attributes);
}

class _$UnifiedSearchResultEntry extends UnifiedSearchResultEntry {
  @override
  final String thumbnailUrl;
  @override
  final String title;
  @override
  final String subline;
  @override
  final String resourceUrl;
  @override
  final String icon;
  @override
  final bool rounded;
  @override
  final BuiltList<String> attributes;

  factory _$UnifiedSearchResultEntry([void Function(UnifiedSearchResultEntryBuilder)? updates]) =>
      (UnifiedSearchResultEntryBuilder()..update(updates))._build();

  _$UnifiedSearchResultEntry._(
      {required this.thumbnailUrl,
      required this.title,
      required this.subline,
      required this.resourceUrl,
      required this.icon,
      required this.rounded,
      required this.attributes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(thumbnailUrl, r'UnifiedSearchResultEntry', 'thumbnailUrl');
    BuiltValueNullFieldError.checkNotNull(title, r'UnifiedSearchResultEntry', 'title');
    BuiltValueNullFieldError.checkNotNull(subline, r'UnifiedSearchResultEntry', 'subline');
    BuiltValueNullFieldError.checkNotNull(resourceUrl, r'UnifiedSearchResultEntry', 'resourceUrl');
    BuiltValueNullFieldError.checkNotNull(icon, r'UnifiedSearchResultEntry', 'icon');
    BuiltValueNullFieldError.checkNotNull(rounded, r'UnifiedSearchResultEntry', 'rounded');
    BuiltValueNullFieldError.checkNotNull(attributes, r'UnifiedSearchResultEntry', 'attributes');
  }

  @override
  UnifiedSearchResultEntry rebuild(void Function(UnifiedSearchResultEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchResultEntryBuilder toBuilder() => UnifiedSearchResultEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchResultEntry &&
        thumbnailUrl == other.thumbnailUrl &&
        title == other.title &&
        subline == other.subline &&
        resourceUrl == other.resourceUrl &&
        icon == other.icon &&
        rounded == other.rounded &&
        attributes == other.attributes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, thumbnailUrl.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, subline.hashCode);
    _$hash = $jc(_$hash, resourceUrl.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, rounded.hashCode);
    _$hash = $jc(_$hash, attributes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnifiedSearchResultEntry')
          ..add('thumbnailUrl', thumbnailUrl)
          ..add('title', title)
          ..add('subline', subline)
          ..add('resourceUrl', resourceUrl)
          ..add('icon', icon)
          ..add('rounded', rounded)
          ..add('attributes', attributes))
        .toString();
  }
}

class UnifiedSearchResultEntryBuilder
    implements
        Builder<UnifiedSearchResultEntry, UnifiedSearchResultEntryBuilder>,
        UnifiedSearchResultEntryInterfaceBuilder {
  _$UnifiedSearchResultEntry? _$v;

  String? _thumbnailUrl;
  String? get thumbnailUrl => _$this._thumbnailUrl;
  set thumbnailUrl(covariant String? thumbnailUrl) => _$this._thumbnailUrl = thumbnailUrl;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _subline;
  String? get subline => _$this._subline;
  set subline(covariant String? subline) => _$this._subline = subline;

  String? _resourceUrl;
  String? get resourceUrl => _$this._resourceUrl;
  set resourceUrl(covariant String? resourceUrl) => _$this._resourceUrl = resourceUrl;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  bool? _rounded;
  bool? get rounded => _$this._rounded;
  set rounded(covariant bool? rounded) => _$this._rounded = rounded;

  ListBuilder<String>? _attributes;
  ListBuilder<String> get attributes => _$this._attributes ??= ListBuilder<String>();
  set attributes(covariant ListBuilder<String>? attributes) => _$this._attributes = attributes;

  UnifiedSearchResultEntryBuilder();

  UnifiedSearchResultEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _thumbnailUrl = $v.thumbnailUrl;
      _title = $v.title;
      _subline = $v.subline;
      _resourceUrl = $v.resourceUrl;
      _icon = $v.icon;
      _rounded = $v.rounded;
      _attributes = $v.attributes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchResultEntry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchResultEntry;
  }

  @override
  void update(void Function(UnifiedSearchResultEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchResultEntry build() => _build();

  _$UnifiedSearchResultEntry _build() {
    _$UnifiedSearchResultEntry _$result;
    try {
      _$result = _$v ??
          _$UnifiedSearchResultEntry._(
              thumbnailUrl:
                  BuiltValueNullFieldError.checkNotNull(thumbnailUrl, r'UnifiedSearchResultEntry', 'thumbnailUrl'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'UnifiedSearchResultEntry', 'title'),
              subline: BuiltValueNullFieldError.checkNotNull(subline, r'UnifiedSearchResultEntry', 'subline'),
              resourceUrl:
                  BuiltValueNullFieldError.checkNotNull(resourceUrl, r'UnifiedSearchResultEntry', 'resourceUrl'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'UnifiedSearchResultEntry', 'icon'),
              rounded: BuiltValueNullFieldError.checkNotNull(rounded, r'UnifiedSearchResultEntry', 'rounded'),
              attributes: attributes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attributes';
        attributes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UnifiedSearchResultEntry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchResult_CursorInterfaceBuilder {
  void replace(UnifiedSearchResult_CursorInterface other);
  void update(void Function(UnifiedSearchResult_CursorInterfaceBuilder) updates);
  int? get $int;
  set $int(int? $int);

  String? get string;
  set string(String? string);
}

class _$UnifiedSearchResult_Cursor extends UnifiedSearchResult_Cursor {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final String? string;

  factory _$UnifiedSearchResult_Cursor([void Function(UnifiedSearchResult_CursorBuilder)? updates]) =>
      (UnifiedSearchResult_CursorBuilder()..update(updates))._build();

  _$UnifiedSearchResult_Cursor._({required this.data, this.$int, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UnifiedSearchResult_Cursor', 'data');
  }

  @override
  UnifiedSearchResult_Cursor rebuild(void Function(UnifiedSearchResult_CursorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchResult_CursorBuilder toBuilder() => UnifiedSearchResult_CursorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchResult_Cursor && data == other.data && $int == other.$int && string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnifiedSearchResult_Cursor')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('string', string))
        .toString();
  }
}

class UnifiedSearchResult_CursorBuilder
    implements
        Builder<UnifiedSearchResult_Cursor, UnifiedSearchResult_CursorBuilder>,
        UnifiedSearchResult_CursorInterfaceBuilder {
  _$UnifiedSearchResult_Cursor? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(covariant int? $int) => _$this._$int = $int;

  String? _string;
  String? get string => _$this._string;
  set string(covariant String? string) => _$this._string = string;

  UnifiedSearchResult_CursorBuilder();

  UnifiedSearchResult_CursorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$int = $v.$int;
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchResult_Cursor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchResult_Cursor;
  }

  @override
  void update(void Function(UnifiedSearchResult_CursorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchResult_Cursor build() => _build();

  _$UnifiedSearchResult_Cursor _build() {
    UnifiedSearchResult_Cursor._validate(this);
    final _$result = _$v ??
        _$UnifiedSearchResult_Cursor._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'UnifiedSearchResult_Cursor', 'data'),
            $int: $int,
            string: string);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchResultInterfaceBuilder {
  void replace(UnifiedSearchResultInterface other);
  void update(void Function(UnifiedSearchResultInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  bool? get isPaginated;
  set isPaginated(bool? isPaginated);

  ListBuilder<UnifiedSearchResultEntry> get entries;
  set entries(ListBuilder<UnifiedSearchResultEntry>? entries);

  UnifiedSearchResult_CursorBuilder get cursor;
  set cursor(UnifiedSearchResult_CursorBuilder? cursor);
}

class _$UnifiedSearchResult extends UnifiedSearchResult {
  @override
  final String name;
  @override
  final bool isPaginated;
  @override
  final BuiltList<UnifiedSearchResultEntry> entries;
  @override
  final UnifiedSearchResult_Cursor? cursor;

  factory _$UnifiedSearchResult([void Function(UnifiedSearchResultBuilder)? updates]) =>
      (UnifiedSearchResultBuilder()..update(updates))._build();

  _$UnifiedSearchResult._({required this.name, required this.isPaginated, required this.entries, this.cursor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'UnifiedSearchResult', 'name');
    BuiltValueNullFieldError.checkNotNull(isPaginated, r'UnifiedSearchResult', 'isPaginated');
    BuiltValueNullFieldError.checkNotNull(entries, r'UnifiedSearchResult', 'entries');
  }

  @override
  UnifiedSearchResult rebuild(void Function(UnifiedSearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchResultBuilder toBuilder() => UnifiedSearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchResult &&
        name == other.name &&
        isPaginated == other.isPaginated &&
        entries == other.entries &&
        cursor == other.cursor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isPaginated.hashCode);
    _$hash = $jc(_$hash, entries.hashCode);
    _$hash = $jc(_$hash, cursor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnifiedSearchResult')
          ..add('name', name)
          ..add('isPaginated', isPaginated)
          ..add('entries', entries)
          ..add('cursor', cursor))
        .toString();
  }
}

class UnifiedSearchResultBuilder
    implements Builder<UnifiedSearchResult, UnifiedSearchResultBuilder>, UnifiedSearchResultInterfaceBuilder {
  _$UnifiedSearchResult? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  bool? _isPaginated;
  bool? get isPaginated => _$this._isPaginated;
  set isPaginated(covariant bool? isPaginated) => _$this._isPaginated = isPaginated;

  ListBuilder<UnifiedSearchResultEntry>? _entries;
  ListBuilder<UnifiedSearchResultEntry> get entries => _$this._entries ??= ListBuilder<UnifiedSearchResultEntry>();
  set entries(covariant ListBuilder<UnifiedSearchResultEntry>? entries) => _$this._entries = entries;

  UnifiedSearchResult_CursorBuilder? _cursor;
  UnifiedSearchResult_CursorBuilder get cursor => _$this._cursor ??= UnifiedSearchResult_CursorBuilder();
  set cursor(covariant UnifiedSearchResult_CursorBuilder? cursor) => _$this._cursor = cursor;

  UnifiedSearchResultBuilder();

  UnifiedSearchResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _isPaginated = $v.isPaginated;
      _entries = $v.entries.toBuilder();
      _cursor = $v.cursor?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchResult;
  }

  @override
  void update(void Function(UnifiedSearchResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchResult build() => _build();

  _$UnifiedSearchResult _build() {
    _$UnifiedSearchResult _$result;
    try {
      _$result = _$v ??
          _$UnifiedSearchResult._(
              name: BuiltValueNullFieldError.checkNotNull(name, r'UnifiedSearchResult', 'name'),
              isPaginated: BuiltValueNullFieldError.checkNotNull(isPaginated, r'UnifiedSearchResult', 'isPaginated'),
              entries: entries.build(),
              cursor: _cursor?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entries';
        entries.build();
        _$failedField = 'cursor';
        _cursor?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UnifiedSearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchSearchResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UnifiedSearchSearchResponseApplicationJson_OcsInterface other);
  void update(void Function(UnifiedSearchSearchResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  UnifiedSearchResultBuilder get data;
  set data(UnifiedSearchResultBuilder? data);
}

class _$UnifiedSearchSearchResponseApplicationJson_Ocs extends UnifiedSearchSearchResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final UnifiedSearchResult data;

  factory _$UnifiedSearchSearchResponseApplicationJson_Ocs(
          [void Function(UnifiedSearchSearchResponseApplicationJson_OcsBuilder)? updates]) =>
      (UnifiedSearchSearchResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UnifiedSearchSearchResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UnifiedSearchSearchResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UnifiedSearchSearchResponseApplicationJson_Ocs', 'data');
  }

  @override
  UnifiedSearchSearchResponseApplicationJson_Ocs rebuild(
          void Function(UnifiedSearchSearchResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchSearchResponseApplicationJson_OcsBuilder toBuilder() =>
      UnifiedSearchSearchResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchSearchResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UnifiedSearchSearchResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UnifiedSearchSearchResponseApplicationJson_OcsBuilder
    implements
        Builder<UnifiedSearchSearchResponseApplicationJson_Ocs, UnifiedSearchSearchResponseApplicationJson_OcsBuilder>,
        UnifiedSearchSearchResponseApplicationJson_OcsInterfaceBuilder {
  _$UnifiedSearchSearchResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  UnifiedSearchResultBuilder? _data;
  UnifiedSearchResultBuilder get data => _$this._data ??= UnifiedSearchResultBuilder();
  set data(covariant UnifiedSearchResultBuilder? data) => _$this._data = data;

  UnifiedSearchSearchResponseApplicationJson_OcsBuilder();

  UnifiedSearchSearchResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchSearchResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchSearchResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UnifiedSearchSearchResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchSearchResponseApplicationJson_Ocs build() => _build();

  _$UnifiedSearchSearchResponseApplicationJson_Ocs _build() {
    _$UnifiedSearchSearchResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$UnifiedSearchSearchResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UnifiedSearchSearchResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UnifiedSearchSearchResponseApplicationJsonInterfaceBuilder {
  void replace(UnifiedSearchSearchResponseApplicationJsonInterface other);
  void update(void Function(UnifiedSearchSearchResponseApplicationJsonInterfaceBuilder) updates);
  UnifiedSearchSearchResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UnifiedSearchSearchResponseApplicationJson_OcsBuilder? ocs);
}

class _$UnifiedSearchSearchResponseApplicationJson extends UnifiedSearchSearchResponseApplicationJson {
  @override
  final UnifiedSearchSearchResponseApplicationJson_Ocs ocs;

  factory _$UnifiedSearchSearchResponseApplicationJson(
          [void Function(UnifiedSearchSearchResponseApplicationJsonBuilder)? updates]) =>
      (UnifiedSearchSearchResponseApplicationJsonBuilder()..update(updates))._build();

  _$UnifiedSearchSearchResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UnifiedSearchSearchResponseApplicationJson', 'ocs');
  }

  @override
  UnifiedSearchSearchResponseApplicationJson rebuild(
          void Function(UnifiedSearchSearchResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnifiedSearchSearchResponseApplicationJsonBuilder toBuilder() =>
      UnifiedSearchSearchResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnifiedSearchSearchResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UnifiedSearchSearchResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class UnifiedSearchSearchResponseApplicationJsonBuilder
    implements
        Builder<UnifiedSearchSearchResponseApplicationJson, UnifiedSearchSearchResponseApplicationJsonBuilder>,
        UnifiedSearchSearchResponseApplicationJsonInterfaceBuilder {
  _$UnifiedSearchSearchResponseApplicationJson? _$v;

  UnifiedSearchSearchResponseApplicationJson_OcsBuilder? _ocs;
  UnifiedSearchSearchResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UnifiedSearchSearchResponseApplicationJson_OcsBuilder();
  set ocs(covariant UnifiedSearchSearchResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UnifiedSearchSearchResponseApplicationJsonBuilder();

  UnifiedSearchSearchResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UnifiedSearchSearchResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnifiedSearchSearchResponseApplicationJson;
  }

  @override
  void update(void Function(UnifiedSearchSearchResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnifiedSearchSearchResponseApplicationJson build() => _build();

  _$UnifiedSearchSearchResponseApplicationJson _build() {
    _$UnifiedSearchSearchResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UnifiedSearchSearchResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UnifiedSearchSearchResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterfaceBuilder {
  void replace(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface other);
  void update(void Function(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterfaceBuilder) updates);
  ListBuilder<String> get regular;
  set regular(ListBuilder<String>? regular);

  ListBuilder<String> get admin;
  set admin(ListBuilder<String>? admin);
}

class _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew
    extends WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew {
  @override
  final BuiltList<String> regular;
  @override
  final BuiltList<String> admin;

  factory _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew(
          [void Function(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder)? updates]) =>
      (WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder()..update(updates))._build();

  _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew._({required this.regular, required this.admin}) : super._() {
    BuiltValueNullFieldError.checkNotNull(regular, r'WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew', 'regular');
    BuiltValueNullFieldError.checkNotNull(admin, r'WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew', 'admin');
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew rebuild(
          void Function(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder toBuilder() =>
      WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew &&
        regular == other.regular &&
        admin == other.admin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, regular.hashCode);
    _$hash = $jc(_$hash, admin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew')
          ..add('regular', regular)
          ..add('admin', admin))
        .toString();
  }
}

class WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder
    implements
        Builder<WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew,
            WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder>,
        WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterfaceBuilder {
  _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew? _$v;

  ListBuilder<String>? _regular;
  ListBuilder<String> get regular => _$this._regular ??= ListBuilder<String>();
  set regular(covariant ListBuilder<String>? regular) => _$this._regular = regular;

  ListBuilder<String>? _admin;
  ListBuilder<String> get admin => _$this._admin ??= ListBuilder<String>();
  set admin(covariant ListBuilder<String>? admin) => _$this._admin = admin;

  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder();

  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _regular = $v.regular.toBuilder();
      _admin = $v.admin.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew;
  }

  @override
  void update(void Function(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew build() => _build();

  _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew _build() {
    _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew _$result;
    try {
      _$result = _$v ??
          _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew._(regular: regular.build(), admin: admin.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'regular';
        regular.build();
        _$failedField = 'admin';
        admin.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WhatsNewGetResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(WhatsNewGetResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(WhatsNewGetResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get changelogURL;
  set changelogURL(String? changelogURL);

  String? get product;
  set product(String? product);

  String? get version;
  set version(String? version);

  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder get whatsNew;
  set whatsNew(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder? whatsNew);
}

class _$WhatsNewGetResponseApplicationJson_Ocs_Data extends WhatsNewGetResponseApplicationJson_Ocs_Data {
  @override
  final String changelogURL;
  @override
  final String product;
  @override
  final String version;
  @override
  final WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew? whatsNew;

  factory _$WhatsNewGetResponseApplicationJson_Ocs_Data(
          [void Function(WhatsNewGetResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (WhatsNewGetResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$WhatsNewGetResponseApplicationJson_Ocs_Data._(
      {required this.changelogURL, required this.product, required this.version, this.whatsNew})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(changelogURL, r'WhatsNewGetResponseApplicationJson_Ocs_Data', 'changelogURL');
    BuiltValueNullFieldError.checkNotNull(product, r'WhatsNewGetResponseApplicationJson_Ocs_Data', 'product');
    BuiltValueNullFieldError.checkNotNull(version, r'WhatsNewGetResponseApplicationJson_Ocs_Data', 'version');
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs_Data rebuild(
          void Function(WhatsNewGetResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhatsNewGetResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      WhatsNewGetResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhatsNewGetResponseApplicationJson_Ocs_Data &&
        changelogURL == other.changelogURL &&
        product == other.product &&
        version == other.version &&
        whatsNew == other.whatsNew;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, changelogURL.hashCode);
    _$hash = $jc(_$hash, product.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, whatsNew.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WhatsNewGetResponseApplicationJson_Ocs_Data')
          ..add('changelogURL', changelogURL)
          ..add('product', product)
          ..add('version', version)
          ..add('whatsNew', whatsNew))
        .toString();
  }
}

class WhatsNewGetResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<WhatsNewGetResponseApplicationJson_Ocs_Data, WhatsNewGetResponseApplicationJson_Ocs_DataBuilder>,
        WhatsNewGetResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$WhatsNewGetResponseApplicationJson_Ocs_Data? _$v;

  String? _changelogURL;
  String? get changelogURL => _$this._changelogURL;
  set changelogURL(covariant String? changelogURL) => _$this._changelogURL = changelogURL;

  String? _product;
  String? get product => _$this._product;
  set product(covariant String? product) => _$this._product = product;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder? _whatsNew;
  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder get whatsNew =>
      _$this._whatsNew ??= WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder();
  set whatsNew(covariant WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder? whatsNew) =>
      _$this._whatsNew = whatsNew;

  WhatsNewGetResponseApplicationJson_Ocs_DataBuilder();

  WhatsNewGetResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _changelogURL = $v.changelogURL;
      _product = $v.product;
      _version = $v.version;
      _whatsNew = $v.whatsNew?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WhatsNewGetResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WhatsNewGetResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(WhatsNewGetResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs_Data build() => _build();

  _$WhatsNewGetResponseApplicationJson_Ocs_Data _build() {
    _$WhatsNewGetResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$WhatsNewGetResponseApplicationJson_Ocs_Data._(
              changelogURL: BuiltValueNullFieldError.checkNotNull(
                  changelogURL, r'WhatsNewGetResponseApplicationJson_Ocs_Data', 'changelogURL'),
              product: BuiltValueNullFieldError.checkNotNull(
                  product, r'WhatsNewGetResponseApplicationJson_Ocs_Data', 'product'),
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'WhatsNewGetResponseApplicationJson_Ocs_Data', 'version'),
              whatsNew: _whatsNew?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'whatsNew';
        _whatsNew?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WhatsNewGetResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WhatsNewGetResponseApplicationJson_OcsInterfaceBuilder {
  void replace(WhatsNewGetResponseApplicationJson_OcsInterface other);
  void update(void Function(WhatsNewGetResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  WhatsNewGetResponseApplicationJson_Ocs_DataBuilder get data;
  set data(WhatsNewGetResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$WhatsNewGetResponseApplicationJson_Ocs extends WhatsNewGetResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final WhatsNewGetResponseApplicationJson_Ocs_Data data;

  factory _$WhatsNewGetResponseApplicationJson_Ocs(
          [void Function(WhatsNewGetResponseApplicationJson_OcsBuilder)? updates]) =>
      (WhatsNewGetResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WhatsNewGetResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WhatsNewGetResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WhatsNewGetResponseApplicationJson_Ocs', 'data');
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs rebuild(
          void Function(WhatsNewGetResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhatsNewGetResponseApplicationJson_OcsBuilder toBuilder() =>
      WhatsNewGetResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhatsNewGetResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WhatsNewGetResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WhatsNewGetResponseApplicationJson_OcsBuilder
    implements
        Builder<WhatsNewGetResponseApplicationJson_Ocs, WhatsNewGetResponseApplicationJson_OcsBuilder>,
        WhatsNewGetResponseApplicationJson_OcsInterfaceBuilder {
  _$WhatsNewGetResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  WhatsNewGetResponseApplicationJson_Ocs_DataBuilder? _data;
  WhatsNewGetResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= WhatsNewGetResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant WhatsNewGetResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  WhatsNewGetResponseApplicationJson_OcsBuilder();

  WhatsNewGetResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WhatsNewGetResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WhatsNewGetResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WhatsNewGetResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs build() => _build();

  _$WhatsNewGetResponseApplicationJson_Ocs _build() {
    _$WhatsNewGetResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WhatsNewGetResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WhatsNewGetResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WhatsNewGetResponseApplicationJsonInterfaceBuilder {
  void replace(WhatsNewGetResponseApplicationJsonInterface other);
  void update(void Function(WhatsNewGetResponseApplicationJsonInterfaceBuilder) updates);
  WhatsNewGetResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WhatsNewGetResponseApplicationJson_OcsBuilder? ocs);
}

class _$WhatsNewGetResponseApplicationJson extends WhatsNewGetResponseApplicationJson {
  @override
  final WhatsNewGetResponseApplicationJson_Ocs ocs;

  factory _$WhatsNewGetResponseApplicationJson([void Function(WhatsNewGetResponseApplicationJsonBuilder)? updates]) =>
      (WhatsNewGetResponseApplicationJsonBuilder()..update(updates))._build();

  _$WhatsNewGetResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WhatsNewGetResponseApplicationJson', 'ocs');
  }

  @override
  WhatsNewGetResponseApplicationJson rebuild(void Function(WhatsNewGetResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhatsNewGetResponseApplicationJsonBuilder toBuilder() => WhatsNewGetResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhatsNewGetResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WhatsNewGetResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WhatsNewGetResponseApplicationJsonBuilder
    implements
        Builder<WhatsNewGetResponseApplicationJson, WhatsNewGetResponseApplicationJsonBuilder>,
        WhatsNewGetResponseApplicationJsonInterfaceBuilder {
  _$WhatsNewGetResponseApplicationJson? _$v;

  WhatsNewGetResponseApplicationJson_OcsBuilder? _ocs;
  WhatsNewGetResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WhatsNewGetResponseApplicationJson_OcsBuilder();
  set ocs(covariant WhatsNewGetResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WhatsNewGetResponseApplicationJsonBuilder();

  WhatsNewGetResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WhatsNewGetResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WhatsNewGetResponseApplicationJson;
  }

  @override
  void update(void Function(WhatsNewGetResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WhatsNewGetResponseApplicationJson build() => _build();

  _$WhatsNewGetResponseApplicationJson _build() {
    _$WhatsNewGetResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WhatsNewGetResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WhatsNewGetResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WhatsNewDismissResponseApplicationJson_OcsInterfaceBuilder {
  void replace(WhatsNewDismissResponseApplicationJson_OcsInterface other);
  void update(void Function(WhatsNewDismissResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$WhatsNewDismissResponseApplicationJson_Ocs extends WhatsNewDismissResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$WhatsNewDismissResponseApplicationJson_Ocs(
          [void Function(WhatsNewDismissResponseApplicationJson_OcsBuilder)? updates]) =>
      (WhatsNewDismissResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WhatsNewDismissResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WhatsNewDismissResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WhatsNewDismissResponseApplicationJson_Ocs', 'data');
  }

  @override
  WhatsNewDismissResponseApplicationJson_Ocs rebuild(
          void Function(WhatsNewDismissResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhatsNewDismissResponseApplicationJson_OcsBuilder toBuilder() =>
      WhatsNewDismissResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhatsNewDismissResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WhatsNewDismissResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WhatsNewDismissResponseApplicationJson_OcsBuilder
    implements
        Builder<WhatsNewDismissResponseApplicationJson_Ocs, WhatsNewDismissResponseApplicationJson_OcsBuilder>,
        WhatsNewDismissResponseApplicationJson_OcsInterfaceBuilder {
  _$WhatsNewDismissResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  WhatsNewDismissResponseApplicationJson_OcsBuilder();

  WhatsNewDismissResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WhatsNewDismissResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WhatsNewDismissResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WhatsNewDismissResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WhatsNewDismissResponseApplicationJson_Ocs build() => _build();

  _$WhatsNewDismissResponseApplicationJson_Ocs _build() {
    _$WhatsNewDismissResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$WhatsNewDismissResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(data, r'WhatsNewDismissResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WhatsNewDismissResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WhatsNewDismissResponseApplicationJsonInterfaceBuilder {
  void replace(WhatsNewDismissResponseApplicationJsonInterface other);
  void update(void Function(WhatsNewDismissResponseApplicationJsonInterfaceBuilder) updates);
  WhatsNewDismissResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WhatsNewDismissResponseApplicationJson_OcsBuilder? ocs);
}

class _$WhatsNewDismissResponseApplicationJson extends WhatsNewDismissResponseApplicationJson {
  @override
  final WhatsNewDismissResponseApplicationJson_Ocs ocs;

  factory _$WhatsNewDismissResponseApplicationJson(
          [void Function(WhatsNewDismissResponseApplicationJsonBuilder)? updates]) =>
      (WhatsNewDismissResponseApplicationJsonBuilder()..update(updates))._build();

  _$WhatsNewDismissResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WhatsNewDismissResponseApplicationJson', 'ocs');
  }

  @override
  WhatsNewDismissResponseApplicationJson rebuild(
          void Function(WhatsNewDismissResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhatsNewDismissResponseApplicationJsonBuilder toBuilder() =>
      WhatsNewDismissResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhatsNewDismissResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WhatsNewDismissResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WhatsNewDismissResponseApplicationJsonBuilder
    implements
        Builder<WhatsNewDismissResponseApplicationJson, WhatsNewDismissResponseApplicationJsonBuilder>,
        WhatsNewDismissResponseApplicationJsonInterfaceBuilder {
  _$WhatsNewDismissResponseApplicationJson? _$v;

  WhatsNewDismissResponseApplicationJson_OcsBuilder? _ocs;
  WhatsNewDismissResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WhatsNewDismissResponseApplicationJson_OcsBuilder();
  set ocs(covariant WhatsNewDismissResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WhatsNewDismissResponseApplicationJsonBuilder();

  WhatsNewDismissResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WhatsNewDismissResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WhatsNewDismissResponseApplicationJson;
  }

  @override
  void update(void Function(WhatsNewDismissResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WhatsNewDismissResponseApplicationJson build() => _build();

  _$WhatsNewDismissResponseApplicationJson _build() {
    _$WhatsNewDismissResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WhatsNewDismissResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WhatsNewDismissResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class WipeCheckWipeResponseApplicationJsonInterfaceBuilder {
  void replace(WipeCheckWipeResponseApplicationJsonInterface other);
  void update(void Function(WipeCheckWipeResponseApplicationJsonInterfaceBuilder) updates);
  bool? get wipe;
  set wipe(bool? wipe);
}

class _$WipeCheckWipeResponseApplicationJson extends WipeCheckWipeResponseApplicationJson {
  @override
  final bool wipe;

  factory _$WipeCheckWipeResponseApplicationJson(
          [void Function(WipeCheckWipeResponseApplicationJsonBuilder)? updates]) =>
      (WipeCheckWipeResponseApplicationJsonBuilder()..update(updates))._build();

  _$WipeCheckWipeResponseApplicationJson._({required this.wipe}) : super._() {
    BuiltValueNullFieldError.checkNotNull(wipe, r'WipeCheckWipeResponseApplicationJson', 'wipe');
  }

  @override
  WipeCheckWipeResponseApplicationJson rebuild(void Function(WipeCheckWipeResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WipeCheckWipeResponseApplicationJsonBuilder toBuilder() =>
      WipeCheckWipeResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WipeCheckWipeResponseApplicationJson && wipe == other.wipe;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, wipe.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WipeCheckWipeResponseApplicationJson')..add('wipe', wipe)).toString();
  }
}

class WipeCheckWipeResponseApplicationJsonBuilder
    implements
        Builder<WipeCheckWipeResponseApplicationJson, WipeCheckWipeResponseApplicationJsonBuilder>,
        WipeCheckWipeResponseApplicationJsonInterfaceBuilder {
  _$WipeCheckWipeResponseApplicationJson? _$v;

  bool? _wipe;
  bool? get wipe => _$this._wipe;
  set wipe(covariant bool? wipe) => _$this._wipe = wipe;

  WipeCheckWipeResponseApplicationJsonBuilder();

  WipeCheckWipeResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _wipe = $v.wipe;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WipeCheckWipeResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WipeCheckWipeResponseApplicationJson;
  }

  @override
  void update(void Function(WipeCheckWipeResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WipeCheckWipeResponseApplicationJson build() => _build();

  _$WipeCheckWipeResponseApplicationJson _build() {
    final _$result = _$v ??
        _$WipeCheckWipeResponseApplicationJson._(
            wipe: BuiltValueNullFieldError.checkNotNull(wipe, r'WipeCheckWipeResponseApplicationJson', 'wipe'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
