// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dav.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DavOCSMeta> _$davOCSMetaSerializer = _$DavOCSMetaSerializer();
Serializer<DavDirectGetUrlResponseApplicationJson_Ocs_Data> _$davDirectGetUrlResponseApplicationJsonOcsDataSerializer =
    _$DavDirectGetUrlResponseApplicationJson_Ocs_DataSerializer();
Serializer<DavDirectGetUrlResponseApplicationJson_Ocs> _$davDirectGetUrlResponseApplicationJsonOcsSerializer =
    _$DavDirectGetUrlResponseApplicationJson_OcsSerializer();
Serializer<DavDirectGetUrlResponseApplicationJson> _$davDirectGetUrlResponseApplicationJsonSerializer =
    _$DavDirectGetUrlResponseApplicationJsonSerializer();
Serializer<DavCapabilities_Dav> _$davCapabilitiesDavSerializer = _$DavCapabilities_DavSerializer();
Serializer<DavCapabilities> _$davCapabilitiesSerializer = _$DavCapabilitiesSerializer();

class _$DavOCSMetaSerializer implements StructuredSerializer<DavOCSMeta> {
  @override
  final Iterable<Type> types = const [DavOCSMeta, _$DavOCSMeta];
  @override
  final String wireName = 'DavOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, DavOCSMeta object,
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
  DavOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DavOCSMetaBuilder();

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

class _$DavDirectGetUrlResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<DavDirectGetUrlResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    DavDirectGetUrlResponseApplicationJson_Ocs_Data,
    _$DavDirectGetUrlResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'DavDirectGetUrlResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, DavDirectGetUrlResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DavDirectGetUrlResponseApplicationJson_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DavDirectGetUrlResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DavDirectGetUrlResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    DavDirectGetUrlResponseApplicationJson_Ocs,
    _$DavDirectGetUrlResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'DavDirectGetUrlResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, DavDirectGetUrlResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(DavOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(DavDirectGetUrlResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  DavDirectGetUrlResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DavDirectGetUrlResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(DavOCSMeta))! as DavOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DavDirectGetUrlResponseApplicationJson_Ocs_Data))!
              as DavDirectGetUrlResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$DavDirectGetUrlResponseApplicationJsonSerializer
    implements StructuredSerializer<DavDirectGetUrlResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [DavDirectGetUrlResponseApplicationJson, _$DavDirectGetUrlResponseApplicationJson];
  @override
  final String wireName = 'DavDirectGetUrlResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, DavDirectGetUrlResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(DavDirectGetUrlResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  DavDirectGetUrlResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DavDirectGetUrlResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(DavDirectGetUrlResponseApplicationJson_Ocs))!
                  as DavDirectGetUrlResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$DavCapabilities_DavSerializer implements StructuredSerializer<DavCapabilities_Dav> {
  @override
  final Iterable<Type> types = const [DavCapabilities_Dav, _$DavCapabilities_Dav];
  @override
  final String wireName = 'DavCapabilities_Dav';

  @override
  Iterable<Object?> serialize(Serializers serializers, DavCapabilities_Dav object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'chunking',
      serializers.serialize(object.chunking, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.bulkupload;
    if (value != null) {
      result
        ..add('bulkupload')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DavCapabilities_Dav deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DavCapabilities_DavBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chunking':
          result.chunking = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'bulkupload':
          result.bulkupload = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DavCapabilitiesSerializer implements StructuredSerializer<DavCapabilities> {
  @override
  final Iterable<Type> types = const [DavCapabilities, _$DavCapabilities];
  @override
  final String wireName = 'DavCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, DavCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dav',
      serializers.serialize(object.dav, specifiedType: const FullType(DavCapabilities_Dav)),
    ];

    return result;
  }

  @override
  DavCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DavCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dav':
          result.dav.replace(serializers.deserialize(value, specifiedType: const FullType(DavCapabilities_Dav))!
              as DavCapabilities_Dav);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class DavOCSMetaInterfaceBuilder {
  void replace(DavOCSMetaInterface other);
  void update(void Function(DavOCSMetaInterfaceBuilder) updates);
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

class _$DavOCSMeta extends DavOCSMeta {
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

  factory _$DavOCSMeta([void Function(DavOCSMetaBuilder)? updates]) => (DavOCSMetaBuilder()..update(updates))._build();

  _$DavOCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'DavOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'DavOCSMeta', 'statuscode');
  }

  @override
  DavOCSMeta rebuild(void Function(DavOCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DavOCSMetaBuilder toBuilder() => DavOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DavOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'DavOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class DavOCSMetaBuilder implements Builder<DavOCSMeta, DavOCSMetaBuilder>, DavOCSMetaInterfaceBuilder {
  _$DavOCSMeta? _$v;

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

  DavOCSMetaBuilder();

  DavOCSMetaBuilder get _$this {
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
  void replace(covariant DavOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DavOCSMeta;
  }

  @override
  void update(void Function(DavOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DavOCSMeta build() => _build();

  _$DavOCSMeta _build() {
    final _$result = _$v ??
        _$DavOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'DavOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'DavOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DavDirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(DavDirectGetUrlResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(DavDirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get url;
  set url(String? url);
}

class _$DavDirectGetUrlResponseApplicationJson_Ocs_Data extends DavDirectGetUrlResponseApplicationJson_Ocs_Data {
  @override
  final String url;

  factory _$DavDirectGetUrlResponseApplicationJson_Ocs_Data(
          [void Function(DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$DavDirectGetUrlResponseApplicationJson_Ocs_Data._({required this.url}) : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'DavDirectGetUrlResponseApplicationJson_Ocs_Data', 'url');
  }

  @override
  DavDirectGetUrlResponseApplicationJson_Ocs_Data rebuild(
          void Function(DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DavDirectGetUrlResponseApplicationJson_Ocs_Data && url == other.url;
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
    return (newBuiltValueToStringHelper(r'DavDirectGetUrlResponseApplicationJson_Ocs_Data')..add('url', url))
        .toString();
  }
}

class DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<DavDirectGetUrlResponseApplicationJson_Ocs_Data,
            DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder>,
        DavDirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$DavDirectGetUrlResponseApplicationJson_Ocs_Data? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder();

  DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DavDirectGetUrlResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DavDirectGetUrlResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DavDirectGetUrlResponseApplicationJson_Ocs_Data build() => _build();

  _$DavDirectGetUrlResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$DavDirectGetUrlResponseApplicationJson_Ocs_Data._(
            url: BuiltValueNullFieldError.checkNotNull(url, r'DavDirectGetUrlResponseApplicationJson_Ocs_Data', 'url'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DavDirectGetUrlResponseApplicationJson_OcsInterfaceBuilder {
  void replace(DavDirectGetUrlResponseApplicationJson_OcsInterface other);
  void update(void Function(DavDirectGetUrlResponseApplicationJson_OcsInterfaceBuilder) updates);
  DavOCSMetaBuilder get meta;
  set meta(DavOCSMetaBuilder? meta);

  DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder get data;
  set data(DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$DavDirectGetUrlResponseApplicationJson_Ocs extends DavDirectGetUrlResponseApplicationJson_Ocs {
  @override
  final DavOCSMeta meta;
  @override
  final DavDirectGetUrlResponseApplicationJson_Ocs_Data data;

  factory _$DavDirectGetUrlResponseApplicationJson_Ocs(
          [void Function(DavDirectGetUrlResponseApplicationJson_OcsBuilder)? updates]) =>
      (DavDirectGetUrlResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DavDirectGetUrlResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DavDirectGetUrlResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'DavDirectGetUrlResponseApplicationJson_Ocs', 'data');
  }

  @override
  DavDirectGetUrlResponseApplicationJson_Ocs rebuild(
          void Function(DavDirectGetUrlResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DavDirectGetUrlResponseApplicationJson_OcsBuilder toBuilder() =>
      DavDirectGetUrlResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DavDirectGetUrlResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DavDirectGetUrlResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DavDirectGetUrlResponseApplicationJson_OcsBuilder
    implements
        Builder<DavDirectGetUrlResponseApplicationJson_Ocs, DavDirectGetUrlResponseApplicationJson_OcsBuilder>,
        DavDirectGetUrlResponseApplicationJson_OcsInterfaceBuilder {
  _$DavDirectGetUrlResponseApplicationJson_Ocs? _$v;

  DavOCSMetaBuilder? _meta;
  DavOCSMetaBuilder get meta => _$this._meta ??= DavOCSMetaBuilder();
  set meta(covariant DavOCSMetaBuilder? meta) => _$this._meta = meta;

  DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder? _data;
  DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant DavDirectGetUrlResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  DavDirectGetUrlResponseApplicationJson_OcsBuilder();

  DavDirectGetUrlResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DavDirectGetUrlResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DavDirectGetUrlResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DavDirectGetUrlResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DavDirectGetUrlResponseApplicationJson_Ocs build() => _build();

  _$DavDirectGetUrlResponseApplicationJson_Ocs _build() {
    _$DavDirectGetUrlResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$DavDirectGetUrlResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DavDirectGetUrlResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DavDirectGetUrlResponseApplicationJsonInterfaceBuilder {
  void replace(DavDirectGetUrlResponseApplicationJsonInterface other);
  void update(void Function(DavDirectGetUrlResponseApplicationJsonInterfaceBuilder) updates);
  DavDirectGetUrlResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DavDirectGetUrlResponseApplicationJson_OcsBuilder? ocs);
}

class _$DavDirectGetUrlResponseApplicationJson extends DavDirectGetUrlResponseApplicationJson {
  @override
  final DavDirectGetUrlResponseApplicationJson_Ocs ocs;

  factory _$DavDirectGetUrlResponseApplicationJson(
          [void Function(DavDirectGetUrlResponseApplicationJsonBuilder)? updates]) =>
      (DavDirectGetUrlResponseApplicationJsonBuilder()..update(updates))._build();

  _$DavDirectGetUrlResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DavDirectGetUrlResponseApplicationJson', 'ocs');
  }

  @override
  DavDirectGetUrlResponseApplicationJson rebuild(
          void Function(DavDirectGetUrlResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DavDirectGetUrlResponseApplicationJsonBuilder toBuilder() =>
      DavDirectGetUrlResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DavDirectGetUrlResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DavDirectGetUrlResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class DavDirectGetUrlResponseApplicationJsonBuilder
    implements
        Builder<DavDirectGetUrlResponseApplicationJson, DavDirectGetUrlResponseApplicationJsonBuilder>,
        DavDirectGetUrlResponseApplicationJsonInterfaceBuilder {
  _$DavDirectGetUrlResponseApplicationJson? _$v;

  DavDirectGetUrlResponseApplicationJson_OcsBuilder? _ocs;
  DavDirectGetUrlResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DavDirectGetUrlResponseApplicationJson_OcsBuilder();
  set ocs(covariant DavDirectGetUrlResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DavDirectGetUrlResponseApplicationJsonBuilder();

  DavDirectGetUrlResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DavDirectGetUrlResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DavDirectGetUrlResponseApplicationJson;
  }

  @override
  void update(void Function(DavDirectGetUrlResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DavDirectGetUrlResponseApplicationJson build() => _build();

  _$DavDirectGetUrlResponseApplicationJson _build() {
    _$DavDirectGetUrlResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DavDirectGetUrlResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DavDirectGetUrlResponseApplicationJson', _$failedField, e.toString());
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
