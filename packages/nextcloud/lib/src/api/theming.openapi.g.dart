// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theming.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class ThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder {
  void replace(ThemingGetManifestResponseApplicationJson_IconsInterface other);
  void update(void Function(ThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder) updates);
  String? get src;
  set src(String? src);

  String? get type;
  set type(String? type);

  String? get sizes;
  set sizes(String? sizes);
}

class _$ThemingGetManifestResponseApplicationJson_Icons extends ThemingGetManifestResponseApplicationJson_Icons {
  @override
  final String src;
  @override
  final String type;
  @override
  final String sizes;

  factory _$ThemingGetManifestResponseApplicationJson_Icons(
          [void Function(ThemingGetManifestResponseApplicationJson_IconsBuilder)? updates]) =>
      (ThemingGetManifestResponseApplicationJson_IconsBuilder()..update(updates))._build();

  _$ThemingGetManifestResponseApplicationJson_Icons._({required this.src, required this.type, required this.sizes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(src, r'ThemingGetManifestResponseApplicationJson_Icons', 'src');
    BuiltValueNullFieldError.checkNotNull(type, r'ThemingGetManifestResponseApplicationJson_Icons', 'type');
    BuiltValueNullFieldError.checkNotNull(sizes, r'ThemingGetManifestResponseApplicationJson_Icons', 'sizes');
  }

  @override
  ThemingGetManifestResponseApplicationJson_Icons rebuild(
          void Function(ThemingGetManifestResponseApplicationJson_IconsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingGetManifestResponseApplicationJson_IconsBuilder toBuilder() =>
      ThemingGetManifestResponseApplicationJson_IconsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingGetManifestResponseApplicationJson_Icons &&
        src == other.src &&
        type == other.type &&
        sizes == other.sizes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, src.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, sizes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingGetManifestResponseApplicationJson_Icons')
          ..add('src', src)
          ..add('type', type)
          ..add('sizes', sizes))
        .toString();
  }
}

class ThemingGetManifestResponseApplicationJson_IconsBuilder
    implements
        Builder<ThemingGetManifestResponseApplicationJson_Icons,
            ThemingGetManifestResponseApplicationJson_IconsBuilder>,
        ThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder {
  _$ThemingGetManifestResponseApplicationJson_Icons? _$v;

  String? _src;
  String? get src => _$this._src;
  set src(covariant String? src) => _$this._src = src;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _sizes;
  String? get sizes => _$this._sizes;
  set sizes(covariant String? sizes) => _$this._sizes = sizes;

  ThemingGetManifestResponseApplicationJson_IconsBuilder();

  ThemingGetManifestResponseApplicationJson_IconsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _src = $v.src;
      _type = $v.type;
      _sizes = $v.sizes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingGetManifestResponseApplicationJson_Icons other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingGetManifestResponseApplicationJson_Icons;
  }

  @override
  void update(void Function(ThemingGetManifestResponseApplicationJson_IconsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingGetManifestResponseApplicationJson_Icons build() => _build();

  _$ThemingGetManifestResponseApplicationJson_Icons _build() {
    final _$result = _$v ??
        _$ThemingGetManifestResponseApplicationJson_Icons._(
            src: BuiltValueNullFieldError.checkNotNull(src, r'ThemingGetManifestResponseApplicationJson_Icons', 'src'),
            type:
                BuiltValueNullFieldError.checkNotNull(type, r'ThemingGetManifestResponseApplicationJson_Icons', 'type'),
            sizes: BuiltValueNullFieldError.checkNotNull(
                sizes, r'ThemingGetManifestResponseApplicationJson_Icons', 'sizes'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ThemingGetManifestResponseApplicationJsonInterfaceBuilder {
  void replace(ThemingGetManifestResponseApplicationJsonInterface other);
  void update(void Function(ThemingGetManifestResponseApplicationJsonInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get shortName;
  set shortName(String? shortName);

  String? get startUrl;
  set startUrl(String? startUrl);

  String? get themeColor;
  set themeColor(String? themeColor);

  String? get backgroundColor;
  set backgroundColor(String? backgroundColor);

  String? get description;
  set description(String? description);

  ListBuilder<ThemingGetManifestResponseApplicationJson_Icons> get icons;
  set icons(ListBuilder<ThemingGetManifestResponseApplicationJson_Icons>? icons);

  String? get display;
  set display(String? display);
}

class _$ThemingGetManifestResponseApplicationJson extends ThemingGetManifestResponseApplicationJson {
  @override
  final String name;
  @override
  final String shortName;
  @override
  final String startUrl;
  @override
  final String themeColor;
  @override
  final String backgroundColor;
  @override
  final String description;
  @override
  final BuiltList<ThemingGetManifestResponseApplicationJson_Icons> icons;
  @override
  final String display;

  factory _$ThemingGetManifestResponseApplicationJson(
          [void Function(ThemingGetManifestResponseApplicationJsonBuilder)? updates]) =>
      (ThemingGetManifestResponseApplicationJsonBuilder()..update(updates))._build();

  _$ThemingGetManifestResponseApplicationJson._(
      {required this.name,
      required this.shortName,
      required this.startUrl,
      required this.themeColor,
      required this.backgroundColor,
      required this.description,
      required this.icons,
      required this.display})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ThemingGetManifestResponseApplicationJson', 'name');
    BuiltValueNullFieldError.checkNotNull(shortName, r'ThemingGetManifestResponseApplicationJson', 'shortName');
    BuiltValueNullFieldError.checkNotNull(startUrl, r'ThemingGetManifestResponseApplicationJson', 'startUrl');
    BuiltValueNullFieldError.checkNotNull(themeColor, r'ThemingGetManifestResponseApplicationJson', 'themeColor');
    BuiltValueNullFieldError.checkNotNull(
        backgroundColor, r'ThemingGetManifestResponseApplicationJson', 'backgroundColor');
    BuiltValueNullFieldError.checkNotNull(description, r'ThemingGetManifestResponseApplicationJson', 'description');
    BuiltValueNullFieldError.checkNotNull(icons, r'ThemingGetManifestResponseApplicationJson', 'icons');
    BuiltValueNullFieldError.checkNotNull(display, r'ThemingGetManifestResponseApplicationJson', 'display');
  }

  @override
  ThemingGetManifestResponseApplicationJson rebuild(
          void Function(ThemingGetManifestResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemingGetManifestResponseApplicationJsonBuilder toBuilder() =>
      ThemingGetManifestResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemingGetManifestResponseApplicationJson &&
        name == other.name &&
        shortName == other.shortName &&
        startUrl == other.startUrl &&
        themeColor == other.themeColor &&
        backgroundColor == other.backgroundColor &&
        description == other.description &&
        icons == other.icons &&
        display == other.display;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, shortName.hashCode);
    _$hash = $jc(_$hash, startUrl.hashCode);
    _$hash = $jc(_$hash, themeColor.hashCode);
    _$hash = $jc(_$hash, backgroundColor.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icons.hashCode);
    _$hash = $jc(_$hash, display.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ThemingGetManifestResponseApplicationJson')
          ..add('name', name)
          ..add('shortName', shortName)
          ..add('startUrl', startUrl)
          ..add('themeColor', themeColor)
          ..add('backgroundColor', backgroundColor)
          ..add('description', description)
          ..add('icons', icons)
          ..add('display', display))
        .toString();
  }
}

class ThemingGetManifestResponseApplicationJsonBuilder
    implements
        Builder<ThemingGetManifestResponseApplicationJson, ThemingGetManifestResponseApplicationJsonBuilder>,
        ThemingGetManifestResponseApplicationJsonInterfaceBuilder {
  _$ThemingGetManifestResponseApplicationJson? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _shortName;
  String? get shortName => _$this._shortName;
  set shortName(covariant String? shortName) => _$this._shortName = shortName;

  String? _startUrl;
  String? get startUrl => _$this._startUrl;
  set startUrl(covariant String? startUrl) => _$this._startUrl = startUrl;

  String? _themeColor;
  String? get themeColor => _$this._themeColor;
  set themeColor(covariant String? themeColor) => _$this._themeColor = themeColor;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(covariant String? backgroundColor) => _$this._backgroundColor = backgroundColor;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  ListBuilder<ThemingGetManifestResponseApplicationJson_Icons>? _icons;
  ListBuilder<ThemingGetManifestResponseApplicationJson_Icons> get icons =>
      _$this._icons ??= ListBuilder<ThemingGetManifestResponseApplicationJson_Icons>();
  set icons(covariant ListBuilder<ThemingGetManifestResponseApplicationJson_Icons>? icons) => _$this._icons = icons;

  String? _display;
  String? get display => _$this._display;
  set display(covariant String? display) => _$this._display = display;

  ThemingGetManifestResponseApplicationJsonBuilder();

  ThemingGetManifestResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _shortName = $v.shortName;
      _startUrl = $v.startUrl;
      _themeColor = $v.themeColor;
      _backgroundColor = $v.backgroundColor;
      _description = $v.description;
      _icons = $v.icons.toBuilder();
      _display = $v.display;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ThemingGetManifestResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemingGetManifestResponseApplicationJson;
  }

  @override
  void update(void Function(ThemingGetManifestResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThemingGetManifestResponseApplicationJson build() => _build();

  _$ThemingGetManifestResponseApplicationJson _build() {
    _$ThemingGetManifestResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          _$ThemingGetManifestResponseApplicationJson._(
              name: BuiltValueNullFieldError.checkNotNull(name, r'ThemingGetManifestResponseApplicationJson', 'name'),
              shortName: BuiltValueNullFieldError.checkNotNull(
                  shortName, r'ThemingGetManifestResponseApplicationJson', 'shortName'),
              startUrl: BuiltValueNullFieldError.checkNotNull(
                  startUrl, r'ThemingGetManifestResponseApplicationJson', 'startUrl'),
              themeColor: BuiltValueNullFieldError.checkNotNull(
                  themeColor, r'ThemingGetManifestResponseApplicationJson', 'themeColor'),
              backgroundColor: BuiltValueNullFieldError.checkNotNull(
                  backgroundColor, r'ThemingGetManifestResponseApplicationJson', 'backgroundColor'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'ThemingGetManifestResponseApplicationJson', 'description'),
              icons: icons.build(),
              display: BuiltValueNullFieldError.checkNotNull(
                  display, r'ThemingGetManifestResponseApplicationJson', 'display'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'icons';
        icons.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ThemingGetManifestResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class BackgroundInterfaceBuilder {
  void replace(BackgroundInterface other);
  void update(void Function(BackgroundInterfaceBuilder) updates);
  String? get backgroundImage;
  set backgroundImage(String? backgroundImage);

  String? get backgroundColor;
  set backgroundColor(String? backgroundColor);

  int? get version;
  set version(int? version);
}

class _$Background extends Background {
  @override
  final String? backgroundImage;
  @override
  final String backgroundColor;
  @override
  final int version;

  factory _$Background([void Function(BackgroundBuilder)? updates]) => (BackgroundBuilder()..update(updates))._build();

  _$Background._({this.backgroundImage, required this.backgroundColor, required this.version}) : super._() {
    BuiltValueNullFieldError.checkNotNull(backgroundColor, r'Background', 'backgroundColor');
    BuiltValueNullFieldError.checkNotNull(version, r'Background', 'version');
  }

  @override
  Background rebuild(void Function(BackgroundBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BackgroundBuilder toBuilder() => BackgroundBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Background &&
        backgroundImage == other.backgroundImage &&
        backgroundColor == other.backgroundColor &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, backgroundImage.hashCode);
    _$hash = $jc(_$hash, backgroundColor.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Background')
          ..add('backgroundImage', backgroundImage)
          ..add('backgroundColor', backgroundColor)
          ..add('version', version))
        .toString();
  }
}

class BackgroundBuilder implements Builder<Background, BackgroundBuilder>, BackgroundInterfaceBuilder {
  _$Background? _$v;

  String? _backgroundImage;
  String? get backgroundImage => _$this._backgroundImage;
  set backgroundImage(covariant String? backgroundImage) => _$this._backgroundImage = backgroundImage;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(covariant String? backgroundColor) => _$this._backgroundColor = backgroundColor;

  int? _version;
  int? get version => _$this._version;
  set version(covariant int? version) => _$this._version = version;

  BackgroundBuilder();

  BackgroundBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _backgroundImage = $v.backgroundImage;
      _backgroundColor = $v.backgroundColor;
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Background other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Background;
  }

  @override
  void update(void Function(BackgroundBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Background build() => _build();

  _$Background _build() {
    final _$result = _$v ??
        _$Background._(
            backgroundImage: backgroundImage,
            backgroundColor: BuiltValueNullFieldError.checkNotNull(backgroundColor, r'Background', 'backgroundColor'),
            version: BuiltValueNullFieldError.checkNotNull(version, r'Background', 'version'));
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

abstract mixin class UserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserThemeEnableThemeResponseApplicationJson_OcsInterface other);
  void update(void Function(UserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$UserThemeEnableThemeResponseApplicationJson_Ocs extends UserThemeEnableThemeResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$UserThemeEnableThemeResponseApplicationJson_Ocs(
          [void Function(UserThemeEnableThemeResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserThemeEnableThemeResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserThemeEnableThemeResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserThemeEnableThemeResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserThemeEnableThemeResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserThemeEnableThemeResponseApplicationJson_Ocs rebuild(
          void Function(UserThemeEnableThemeResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserThemeEnableThemeResponseApplicationJson_OcsBuilder toBuilder() =>
      UserThemeEnableThemeResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserThemeEnableThemeResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserThemeEnableThemeResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserThemeEnableThemeResponseApplicationJson_OcsBuilder
    implements
        Builder<UserThemeEnableThemeResponseApplicationJson_Ocs,
            UserThemeEnableThemeResponseApplicationJson_OcsBuilder>,
        UserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder {
  _$UserThemeEnableThemeResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  UserThemeEnableThemeResponseApplicationJson_OcsBuilder();

  UserThemeEnableThemeResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserThemeEnableThemeResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserThemeEnableThemeResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserThemeEnableThemeResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserThemeEnableThemeResponseApplicationJson_Ocs build() => _build();

  _$UserThemeEnableThemeResponseApplicationJson_Ocs _build() {
    _$UserThemeEnableThemeResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserThemeEnableThemeResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'UserThemeEnableThemeResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserThemeEnableThemeResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserThemeEnableThemeResponseApplicationJsonInterfaceBuilder {
  void replace(UserThemeEnableThemeResponseApplicationJsonInterface other);
  void update(void Function(UserThemeEnableThemeResponseApplicationJsonInterfaceBuilder) updates);
  UserThemeEnableThemeResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserThemeEnableThemeResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserThemeEnableThemeResponseApplicationJson extends UserThemeEnableThemeResponseApplicationJson {
  @override
  final UserThemeEnableThemeResponseApplicationJson_Ocs ocs;

  factory _$UserThemeEnableThemeResponseApplicationJson(
          [void Function(UserThemeEnableThemeResponseApplicationJsonBuilder)? updates]) =>
      (UserThemeEnableThemeResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserThemeEnableThemeResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserThemeEnableThemeResponseApplicationJson', 'ocs');
  }

  @override
  UserThemeEnableThemeResponseApplicationJson rebuild(
          void Function(UserThemeEnableThemeResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserThemeEnableThemeResponseApplicationJsonBuilder toBuilder() =>
      UserThemeEnableThemeResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserThemeEnableThemeResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserThemeEnableThemeResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class UserThemeEnableThemeResponseApplicationJsonBuilder
    implements
        Builder<UserThemeEnableThemeResponseApplicationJson, UserThemeEnableThemeResponseApplicationJsonBuilder>,
        UserThemeEnableThemeResponseApplicationJsonInterfaceBuilder {
  _$UserThemeEnableThemeResponseApplicationJson? _$v;

  UserThemeEnableThemeResponseApplicationJson_OcsBuilder? _ocs;
  UserThemeEnableThemeResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserThemeEnableThemeResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserThemeEnableThemeResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserThemeEnableThemeResponseApplicationJsonBuilder();

  UserThemeEnableThemeResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserThemeEnableThemeResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserThemeEnableThemeResponseApplicationJson;
  }

  @override
  void update(void Function(UserThemeEnableThemeResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserThemeEnableThemeResponseApplicationJson build() => _build();

  _$UserThemeEnableThemeResponseApplicationJson _build() {
    _$UserThemeEnableThemeResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserThemeEnableThemeResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserThemeEnableThemeResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserThemeDisableThemeResponseApplicationJson_OcsInterface other);
  void update(void Function(UserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$UserThemeDisableThemeResponseApplicationJson_Ocs extends UserThemeDisableThemeResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$UserThemeDisableThemeResponseApplicationJson_Ocs(
          [void Function(UserThemeDisableThemeResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserThemeDisableThemeResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserThemeDisableThemeResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserThemeDisableThemeResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserThemeDisableThemeResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserThemeDisableThemeResponseApplicationJson_Ocs rebuild(
          void Function(UserThemeDisableThemeResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserThemeDisableThemeResponseApplicationJson_OcsBuilder toBuilder() =>
      UserThemeDisableThemeResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserThemeDisableThemeResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserThemeDisableThemeResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserThemeDisableThemeResponseApplicationJson_OcsBuilder
    implements
        Builder<UserThemeDisableThemeResponseApplicationJson_Ocs,
            UserThemeDisableThemeResponseApplicationJson_OcsBuilder>,
        UserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder {
  _$UserThemeDisableThemeResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  UserThemeDisableThemeResponseApplicationJson_OcsBuilder();

  UserThemeDisableThemeResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserThemeDisableThemeResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserThemeDisableThemeResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserThemeDisableThemeResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserThemeDisableThemeResponseApplicationJson_Ocs build() => _build();

  _$UserThemeDisableThemeResponseApplicationJson_Ocs _build() {
    _$UserThemeDisableThemeResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserThemeDisableThemeResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'UserThemeDisableThemeResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserThemeDisableThemeResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserThemeDisableThemeResponseApplicationJsonInterfaceBuilder {
  void replace(UserThemeDisableThemeResponseApplicationJsonInterface other);
  void update(void Function(UserThemeDisableThemeResponseApplicationJsonInterfaceBuilder) updates);
  UserThemeDisableThemeResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserThemeDisableThemeResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserThemeDisableThemeResponseApplicationJson extends UserThemeDisableThemeResponseApplicationJson {
  @override
  final UserThemeDisableThemeResponseApplicationJson_Ocs ocs;

  factory _$UserThemeDisableThemeResponseApplicationJson(
          [void Function(UserThemeDisableThemeResponseApplicationJsonBuilder)? updates]) =>
      (UserThemeDisableThemeResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserThemeDisableThemeResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserThemeDisableThemeResponseApplicationJson', 'ocs');
  }

  @override
  UserThemeDisableThemeResponseApplicationJson rebuild(
          void Function(UserThemeDisableThemeResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserThemeDisableThemeResponseApplicationJsonBuilder toBuilder() =>
      UserThemeDisableThemeResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserThemeDisableThemeResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserThemeDisableThemeResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class UserThemeDisableThemeResponseApplicationJsonBuilder
    implements
        Builder<UserThemeDisableThemeResponseApplicationJson, UserThemeDisableThemeResponseApplicationJsonBuilder>,
        UserThemeDisableThemeResponseApplicationJsonInterfaceBuilder {
  _$UserThemeDisableThemeResponseApplicationJson? _$v;

  UserThemeDisableThemeResponseApplicationJson_OcsBuilder? _ocs;
  UserThemeDisableThemeResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserThemeDisableThemeResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserThemeDisableThemeResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserThemeDisableThemeResponseApplicationJsonBuilder();

  UserThemeDisableThemeResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserThemeDisableThemeResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserThemeDisableThemeResponseApplicationJson;
  }

  @override
  void update(void Function(UserThemeDisableThemeResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserThemeDisableThemeResponseApplicationJson build() => _build();

  _$UserThemeDisableThemeResponseApplicationJson _build() {
    _$UserThemeDisableThemeResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserThemeDisableThemeResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserThemeDisableThemeResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class PublicCapabilities_ThemingInterfaceBuilder {
  void replace(PublicCapabilities_ThemingInterface other);
  void update(void Function(PublicCapabilities_ThemingInterfaceBuilder) updates);
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

class _$PublicCapabilities_Theming extends PublicCapabilities_Theming {
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

  factory _$PublicCapabilities_Theming([void Function(PublicCapabilities_ThemingBuilder)? updates]) =>
      (PublicCapabilities_ThemingBuilder()..update(updates))._build();

  _$PublicCapabilities_Theming._(
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
    BuiltValueNullFieldError.checkNotNull(name, r'PublicCapabilities_Theming', 'name');
    BuiltValueNullFieldError.checkNotNull(url, r'PublicCapabilities_Theming', 'url');
    BuiltValueNullFieldError.checkNotNull(slogan, r'PublicCapabilities_Theming', 'slogan');
    BuiltValueNullFieldError.checkNotNull(color, r'PublicCapabilities_Theming', 'color');
    BuiltValueNullFieldError.checkNotNull(colorText, r'PublicCapabilities_Theming', 'colorText');
    BuiltValueNullFieldError.checkNotNull(colorElement, r'PublicCapabilities_Theming', 'colorElement');
    BuiltValueNullFieldError.checkNotNull(colorElementBright, r'PublicCapabilities_Theming', 'colorElementBright');
    BuiltValueNullFieldError.checkNotNull(colorElementDark, r'PublicCapabilities_Theming', 'colorElementDark');
    BuiltValueNullFieldError.checkNotNull(logo, r'PublicCapabilities_Theming', 'logo');
    BuiltValueNullFieldError.checkNotNull(background, r'PublicCapabilities_Theming', 'background');
    BuiltValueNullFieldError.checkNotNull(backgroundPlain, r'PublicCapabilities_Theming', 'backgroundPlain');
    BuiltValueNullFieldError.checkNotNull(backgroundDefault, r'PublicCapabilities_Theming', 'backgroundDefault');
    BuiltValueNullFieldError.checkNotNull(logoheader, r'PublicCapabilities_Theming', 'logoheader');
    BuiltValueNullFieldError.checkNotNull(favicon, r'PublicCapabilities_Theming', 'favicon');
  }

  @override
  PublicCapabilities_Theming rebuild(void Function(PublicCapabilities_ThemingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicCapabilities_ThemingBuilder toBuilder() => PublicCapabilities_ThemingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicCapabilities_Theming &&
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
    return (newBuiltValueToStringHelper(r'PublicCapabilities_Theming')
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

class PublicCapabilities_ThemingBuilder
    implements
        Builder<PublicCapabilities_Theming, PublicCapabilities_ThemingBuilder>,
        PublicCapabilities_ThemingInterfaceBuilder {
  _$PublicCapabilities_Theming? _$v;

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

  PublicCapabilities_ThemingBuilder();

  PublicCapabilities_ThemingBuilder get _$this {
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
  void replace(covariant PublicCapabilities_Theming other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicCapabilities_Theming;
  }

  @override
  void update(void Function(PublicCapabilities_ThemingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicCapabilities_Theming build() => _build();

  _$PublicCapabilities_Theming _build() {
    final _$result = _$v ??
        _$PublicCapabilities_Theming._(
            name: BuiltValueNullFieldError.checkNotNull(name, r'PublicCapabilities_Theming', 'name'),
            url: BuiltValueNullFieldError.checkNotNull(url, r'PublicCapabilities_Theming', 'url'),
            slogan: BuiltValueNullFieldError.checkNotNull(slogan, r'PublicCapabilities_Theming', 'slogan'),
            color: BuiltValueNullFieldError.checkNotNull(color, r'PublicCapabilities_Theming', 'color'),
            colorText: BuiltValueNullFieldError.checkNotNull(colorText, r'PublicCapabilities_Theming', 'colorText'),
            colorElement:
                BuiltValueNullFieldError.checkNotNull(colorElement, r'PublicCapabilities_Theming', 'colorElement'),
            colorElementBright: BuiltValueNullFieldError.checkNotNull(
                colorElementBright, r'PublicCapabilities_Theming', 'colorElementBright'),
            colorElementDark: BuiltValueNullFieldError.checkNotNull(
                colorElementDark, r'PublicCapabilities_Theming', 'colorElementDark'),
            logo: BuiltValueNullFieldError.checkNotNull(logo, r'PublicCapabilities_Theming', 'logo'),
            background: BuiltValueNullFieldError.checkNotNull(background, r'PublicCapabilities_Theming', 'background'),
            backgroundPlain: BuiltValueNullFieldError.checkNotNull(
                backgroundPlain, r'PublicCapabilities_Theming', 'backgroundPlain'),
            backgroundDefault: BuiltValueNullFieldError.checkNotNull(
                backgroundDefault, r'PublicCapabilities_Theming', 'backgroundDefault'),
            logoheader: BuiltValueNullFieldError.checkNotNull(logoheader, r'PublicCapabilities_Theming', 'logoheader'),
            favicon: BuiltValueNullFieldError.checkNotNull(favicon, r'PublicCapabilities_Theming', 'favicon'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class PublicCapabilitiesInterfaceBuilder {
  void replace(PublicCapabilitiesInterface other);
  void update(void Function(PublicCapabilitiesInterfaceBuilder) updates);
  PublicCapabilities_ThemingBuilder get theming;
  set theming(PublicCapabilities_ThemingBuilder? theming);
}

class _$PublicCapabilities extends PublicCapabilities {
  @override
  final PublicCapabilities_Theming theming;

  factory _$PublicCapabilities([void Function(PublicCapabilitiesBuilder)? updates]) =>
      (PublicCapabilitiesBuilder()..update(updates))._build();

  _$PublicCapabilities._({required this.theming}) : super._() {
    BuiltValueNullFieldError.checkNotNull(theming, r'PublicCapabilities', 'theming');
  }

  @override
  PublicCapabilities rebuild(void Function(PublicCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicCapabilitiesBuilder toBuilder() => PublicCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicCapabilities && theming == other.theming;
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
    return (newBuiltValueToStringHelper(r'PublicCapabilities')..add('theming', theming)).toString();
  }
}

class PublicCapabilitiesBuilder
    implements Builder<PublicCapabilities, PublicCapabilitiesBuilder>, PublicCapabilitiesInterfaceBuilder {
  _$PublicCapabilities? _$v;

  PublicCapabilities_ThemingBuilder? _theming;
  PublicCapabilities_ThemingBuilder get theming => _$this._theming ??= PublicCapabilities_ThemingBuilder();
  set theming(covariant PublicCapabilities_ThemingBuilder? theming) => _$this._theming = theming;

  PublicCapabilitiesBuilder();

  PublicCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _theming = $v.theming.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PublicCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicCapabilities;
  }

  @override
  void update(void Function(PublicCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicCapabilities build() => _build();

  _$PublicCapabilities _build() {
    _$PublicCapabilities _$result;
    try {
      _$result = _$v ?? _$PublicCapabilities._(theming: theming.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'theming';
        theming.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'PublicCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
