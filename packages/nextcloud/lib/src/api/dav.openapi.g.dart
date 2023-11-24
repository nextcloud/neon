// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dav.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OCSMeta> _$oCSMetaSerializer = _$OCSMetaSerializer();
Serializer<DirectGetUrlResponseApplicationJson_Ocs_Data> _$directGetUrlResponseApplicationJsonOcsDataSerializer =
    _$DirectGetUrlResponseApplicationJson_Ocs_DataSerializer();
Serializer<DirectGetUrlResponseApplicationJson_Ocs> _$directGetUrlResponseApplicationJsonOcsSerializer =
    _$DirectGetUrlResponseApplicationJson_OcsSerializer();
Serializer<DirectGetUrlResponseApplicationJson> _$directGetUrlResponseApplicationJsonSerializer =
    _$DirectGetUrlResponseApplicationJsonSerializer();
Serializer<Capabilities_Dav> _$capabilitiesDavSerializer = _$Capabilities_DavSerializer();
Serializer<Capabilities> _$capabilitiesSerializer = _$CapabilitiesSerializer();

class _$OCSMetaSerializer implements StructuredSerializer<OCSMeta> {
  @override
  final Iterable<Type> types = const [OCSMeta, _$OCSMeta];
  @override
  final String wireName = 'OCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, OCSMeta object,
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
  OCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = OCSMetaBuilder();

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

class _$DirectGetUrlResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<DirectGetUrlResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    DirectGetUrlResponseApplicationJson_Ocs_Data,
    _$DirectGetUrlResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'DirectGetUrlResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, DirectGetUrlResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DirectGetUrlResponseApplicationJson_Ocs_DataBuilder();

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

class _$DirectGetUrlResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DirectGetUrlResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    DirectGetUrlResponseApplicationJson_Ocs,
    _$DirectGetUrlResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'DirectGetUrlResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, DirectGetUrlResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DirectGetUrlResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs_Data))!
              as DirectGetUrlResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$DirectGetUrlResponseApplicationJsonSerializer
    implements StructuredSerializer<DirectGetUrlResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [DirectGetUrlResponseApplicationJson, _$DirectGetUrlResponseApplicationJson];
  @override
  final String wireName = 'DirectGetUrlResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, DirectGetUrlResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  DirectGetUrlResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DirectGetUrlResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(DirectGetUrlResponseApplicationJson_Ocs))!
                  as DirectGetUrlResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$Capabilities_DavSerializer implements StructuredSerializer<Capabilities_Dav> {
  @override
  final Iterable<Type> types = const [Capabilities_Dav, _$Capabilities_Dav];
  @override
  final String wireName = 'Capabilities_Dav';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_Dav object,
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
  Capabilities_Dav deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_DavBuilder();

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

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  @override
  final Iterable<Type> types = const [Capabilities, _$Capabilities];
  @override
  final String wireName = 'Capabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dav',
      serializers.serialize(object.dav, specifiedType: const FullType(Capabilities_Dav)),
    ];

    return result;
  }

  @override
  Capabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dav':
          result.dav.replace(
              serializers.deserialize(value, specifiedType: const FullType(Capabilities_Dav))! as Capabilities_Dav);
          break;
      }
    }

    return result.build();
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

abstract mixin class DirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(DirectGetUrlResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(DirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get url;
  set url(String? url);
}

class _$DirectGetUrlResponseApplicationJson_Ocs_Data extends DirectGetUrlResponseApplicationJson_Ocs_Data {
  @override
  final String url;

  factory _$DirectGetUrlResponseApplicationJson_Ocs_Data(
          [void Function(DirectGetUrlResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (DirectGetUrlResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$DirectGetUrlResponseApplicationJson_Ocs_Data._({required this.url}) : super._() {
    BuiltValueNullFieldError.checkNotNull(url, r'DirectGetUrlResponseApplicationJson_Ocs_Data', 'url');
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs_Data rebuild(
          void Function(DirectGetUrlResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectGetUrlResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      DirectGetUrlResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectGetUrlResponseApplicationJson_Ocs_Data && url == other.url;
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
    return (newBuiltValueToStringHelper(r'DirectGetUrlResponseApplicationJson_Ocs_Data')..add('url', url)).toString();
  }
}

class DirectGetUrlResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<DirectGetUrlResponseApplicationJson_Ocs_Data, DirectGetUrlResponseApplicationJson_Ocs_DataBuilder>,
        DirectGetUrlResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$DirectGetUrlResponseApplicationJson_Ocs_Data? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(covariant String? url) => _$this._url = url;

  DirectGetUrlResponseApplicationJson_Ocs_DataBuilder();

  DirectGetUrlResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectGetUrlResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectGetUrlResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(DirectGetUrlResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs_Data build() => _build();

  _$DirectGetUrlResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$DirectGetUrlResponseApplicationJson_Ocs_Data._(
            url: BuiltValueNullFieldError.checkNotNull(url, r'DirectGetUrlResponseApplicationJson_Ocs_Data', 'url'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectGetUrlResponseApplicationJson_OcsInterfaceBuilder {
  void replace(DirectGetUrlResponseApplicationJson_OcsInterface other);
  void update(void Function(DirectGetUrlResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  DirectGetUrlResponseApplicationJson_Ocs_DataBuilder get data;
  set data(DirectGetUrlResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$DirectGetUrlResponseApplicationJson_Ocs extends DirectGetUrlResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final DirectGetUrlResponseApplicationJson_Ocs_Data data;

  factory _$DirectGetUrlResponseApplicationJson_Ocs(
          [void Function(DirectGetUrlResponseApplicationJson_OcsBuilder)? updates]) =>
      (DirectGetUrlResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$DirectGetUrlResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'DirectGetUrlResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'DirectGetUrlResponseApplicationJson_Ocs', 'data');
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs rebuild(
          void Function(DirectGetUrlResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectGetUrlResponseApplicationJson_OcsBuilder toBuilder() =>
      DirectGetUrlResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectGetUrlResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'DirectGetUrlResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DirectGetUrlResponseApplicationJson_OcsBuilder
    implements
        Builder<DirectGetUrlResponseApplicationJson_Ocs, DirectGetUrlResponseApplicationJson_OcsBuilder>,
        DirectGetUrlResponseApplicationJson_OcsInterfaceBuilder {
  _$DirectGetUrlResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  DirectGetUrlResponseApplicationJson_Ocs_DataBuilder? _data;
  DirectGetUrlResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= DirectGetUrlResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant DirectGetUrlResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  DirectGetUrlResponseApplicationJson_OcsBuilder();

  DirectGetUrlResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectGetUrlResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectGetUrlResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(DirectGetUrlResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectGetUrlResponseApplicationJson_Ocs build() => _build();

  _$DirectGetUrlResponseApplicationJson_Ocs _build() {
    _$DirectGetUrlResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$DirectGetUrlResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectGetUrlResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DirectGetUrlResponseApplicationJsonInterfaceBuilder {
  void replace(DirectGetUrlResponseApplicationJsonInterface other);
  void update(void Function(DirectGetUrlResponseApplicationJsonInterfaceBuilder) updates);
  DirectGetUrlResponseApplicationJson_OcsBuilder get ocs;
  set ocs(DirectGetUrlResponseApplicationJson_OcsBuilder? ocs);
}

class _$DirectGetUrlResponseApplicationJson extends DirectGetUrlResponseApplicationJson {
  @override
  final DirectGetUrlResponseApplicationJson_Ocs ocs;

  factory _$DirectGetUrlResponseApplicationJson([void Function(DirectGetUrlResponseApplicationJsonBuilder)? updates]) =>
      (DirectGetUrlResponseApplicationJsonBuilder()..update(updates))._build();

  _$DirectGetUrlResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DirectGetUrlResponseApplicationJson', 'ocs');
  }

  @override
  DirectGetUrlResponseApplicationJson rebuild(void Function(DirectGetUrlResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectGetUrlResponseApplicationJsonBuilder toBuilder() => DirectGetUrlResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectGetUrlResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DirectGetUrlResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class DirectGetUrlResponseApplicationJsonBuilder
    implements
        Builder<DirectGetUrlResponseApplicationJson, DirectGetUrlResponseApplicationJsonBuilder>,
        DirectGetUrlResponseApplicationJsonInterfaceBuilder {
  _$DirectGetUrlResponseApplicationJson? _$v;

  DirectGetUrlResponseApplicationJson_OcsBuilder? _ocs;
  DirectGetUrlResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DirectGetUrlResponseApplicationJson_OcsBuilder();
  set ocs(covariant DirectGetUrlResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DirectGetUrlResponseApplicationJsonBuilder();

  DirectGetUrlResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DirectGetUrlResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectGetUrlResponseApplicationJson;
  }

  @override
  void update(void Function(DirectGetUrlResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectGetUrlResponseApplicationJson build() => _build();

  _$DirectGetUrlResponseApplicationJson _build() {
    _$DirectGetUrlResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$DirectGetUrlResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DirectGetUrlResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class Capabilities_DavInterfaceBuilder {
  void replace(Capabilities_DavInterface other);
  void update(void Function(Capabilities_DavInterfaceBuilder) updates);
  String? get chunking;
  set chunking(String? chunking);

  String? get bulkupload;
  set bulkupload(String? bulkupload);
}

class _$Capabilities_Dav extends Capabilities_Dav {
  @override
  final String chunking;
  @override
  final String? bulkupload;

  factory _$Capabilities_Dav([void Function(Capabilities_DavBuilder)? updates]) =>
      (Capabilities_DavBuilder()..update(updates))._build();

  _$Capabilities_Dav._({required this.chunking, this.bulkupload}) : super._() {
    BuiltValueNullFieldError.checkNotNull(chunking, r'Capabilities_Dav', 'chunking');
  }

  @override
  Capabilities_Dav rebuild(void Function(Capabilities_DavBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  Capabilities_DavBuilder toBuilder() => Capabilities_DavBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_Dav && chunking == other.chunking && bulkupload == other.bulkupload;
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
    return (newBuiltValueToStringHelper(r'Capabilities_Dav')
          ..add('chunking', chunking)
          ..add('bulkupload', bulkupload))
        .toString();
  }
}

class Capabilities_DavBuilder
    implements Builder<Capabilities_Dav, Capabilities_DavBuilder>, Capabilities_DavInterfaceBuilder {
  _$Capabilities_Dav? _$v;

  String? _chunking;
  String? get chunking => _$this._chunking;
  set chunking(covariant String? chunking) => _$this._chunking = chunking;

  String? _bulkupload;
  String? get bulkupload => _$this._bulkupload;
  set bulkupload(covariant String? bulkupload) => _$this._bulkupload = bulkupload;

  Capabilities_DavBuilder();

  Capabilities_DavBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chunking = $v.chunking;
      _bulkupload = $v.bulkupload;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_Dav other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_Dav;
  }

  @override
  void update(void Function(Capabilities_DavBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_Dav build() => _build();

  _$Capabilities_Dav _build() {
    final _$result = _$v ??
        _$Capabilities_Dav._(
            chunking: BuiltValueNullFieldError.checkNotNull(chunking, r'Capabilities_Dav', 'chunking'),
            bulkupload: bulkupload);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class CapabilitiesInterfaceBuilder {
  void replace(CapabilitiesInterface other);
  void update(void Function(CapabilitiesInterfaceBuilder) updates);
  Capabilities_DavBuilder get dav;
  set dav(Capabilities_DavBuilder? dav);
}

class _$Capabilities extends Capabilities {
  @override
  final Capabilities_Dav dav;

  factory _$Capabilities([void Function(CapabilitiesBuilder)? updates]) =>
      (CapabilitiesBuilder()..update(updates))._build();

  _$Capabilities._({required this.dav}) : super._() {
    BuiltValueNullFieldError.checkNotNull(dav, r'Capabilities', 'dav');
  }

  @override
  Capabilities rebuild(void Function(CapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CapabilitiesBuilder toBuilder() => CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities && dav == other.dav;
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
    return (newBuiltValueToStringHelper(r'Capabilities')..add('dav', dav)).toString();
  }
}

class CapabilitiesBuilder implements Builder<Capabilities, CapabilitiesBuilder>, CapabilitiesInterfaceBuilder {
  _$Capabilities? _$v;

  Capabilities_DavBuilder? _dav;
  Capabilities_DavBuilder get dav => _$this._dav ??= Capabilities_DavBuilder();
  set dav(covariant Capabilities_DavBuilder? dav) => _$this._dav = dav;

  CapabilitiesBuilder();

  CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dav = $v.dav.toBuilder();
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
      _$result = _$v ?? _$Capabilities._(dav: dav.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dav';
        dav.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Capabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
