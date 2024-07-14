// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_account.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OCSMeta> _$oCSMetaSerializer = _$OCSMetaSerializer();
Serializer<ApiDeleteResponseApplicationJson_Ocs_Data> _$apiDeleteResponseApplicationJsonOcsDataSerializer =
    _$ApiDeleteResponseApplicationJson_Ocs_DataSerializer();
Serializer<ApiDeleteResponseApplicationJson_Ocs> _$apiDeleteResponseApplicationJsonOcsSerializer =
    _$ApiDeleteResponseApplicationJson_OcsSerializer();
Serializer<ApiDeleteResponseApplicationJson> _$apiDeleteResponseApplicationJsonSerializer =
    _$ApiDeleteResponseApplicationJsonSerializer();
Serializer<Capabilities_DropAccount_Delay> _$capabilitiesDropAccountDelaySerializer =
    _$Capabilities_DropAccount_DelaySerializer();
Serializer<Capabilities_DropAccount> _$capabilitiesDropAccountSerializer = _$Capabilities_DropAccountSerializer();
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

class _$ApiDeleteResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ApiDeleteResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    ApiDeleteResponseApplicationJson_Ocs_Data,
    _$ApiDeleteResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'ApiDeleteResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiDeleteResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ApiDeleteResponseApplicationJson_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiDeleteResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiDeleteResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ApiDeleteResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [ApiDeleteResponseApplicationJson_Ocs, _$ApiDeleteResponseApplicationJson_Ocs];
  @override
  final String wireName = 'ApiDeleteResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiDeleteResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(ApiDeleteResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  ApiDeleteResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiDeleteResponseApplicationJson_OcsBuilder();

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
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(ApiDeleteResponseApplicationJson_Ocs_Data))!
                  as ApiDeleteResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiDeleteResponseApplicationJsonSerializer implements StructuredSerializer<ApiDeleteResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [ApiDeleteResponseApplicationJson, _$ApiDeleteResponseApplicationJson];
  @override
  final String wireName = 'ApiDeleteResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiDeleteResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ApiDeleteResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ApiDeleteResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiDeleteResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(ApiDeleteResponseApplicationJson_Ocs))!
                  as ApiDeleteResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$Capabilities_DropAccount_DelaySerializer implements StructuredSerializer<Capabilities_DropAccount_Delay> {
  @override
  final Iterable<Type> types = const [Capabilities_DropAccount_Delay, _$Capabilities_DropAccount_Delay];
  @override
  final String wireName = 'Capabilities_DropAccount_Delay';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_DropAccount_Delay object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'hours',
      serializers.serialize(object.hours, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Capabilities_DropAccount_Delay deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_DropAccount_DelayBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'hours':
          result.hours = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Capabilities_DropAccountSerializer implements StructuredSerializer<Capabilities_DropAccount> {
  @override
  final Iterable<Type> types = const [Capabilities_DropAccount, _$Capabilities_DropAccount];
  @override
  final String wireName = 'Capabilities_DropAccount';

  @override
  Iterable<Object?> serialize(Serializers serializers, Capabilities_DropAccount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'api-version',
      serializers.serialize(object.apiVersion, specifiedType: const FullType(String)),
      'delay',
      serializers.serialize(object.delay, specifiedType: const FullType(Capabilities_DropAccount_Delay)),
    ];
    Object? value;
    value = object.details;
    if (value != null) {
      result
        ..add('details')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Capabilities_DropAccount deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = Capabilities_DropAccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'api-version':
          result.apiVersion = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'delay':
          result.delay.replace(serializers.deserialize(value,
              specifiedType: const FullType(Capabilities_DropAccount_Delay))! as Capabilities_DropAccount_Delay);
          break;
        case 'details':
          result.details = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
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
      'drop-account',
      serializers.serialize(object.dropAccount, specifiedType: const FullType(Capabilities_DropAccount)),
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
        case 'drop-account':
          result.dropAccount.replace(serializers.deserialize(value,
              specifiedType: const FullType(Capabilities_DropAccount))! as Capabilities_DropAccount);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $OCSMetaInterfaceBuilder {
  void replace($OCSMetaInterface other);
  void update(void Function($OCSMetaInterfaceBuilder) updates);
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

class OCSMetaBuilder implements Builder<OCSMeta, OCSMetaBuilder>, $OCSMetaInterfaceBuilder {
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

  OCSMetaBuilder() {
    OCSMeta._defaults(this);
  }

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
    OCSMeta._validate(this);
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

abstract mixin class $ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace($ApiDeleteResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function($ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get message;
  set message(String? message);
}

class _$ApiDeleteResponseApplicationJson_Ocs_Data extends ApiDeleteResponseApplicationJson_Ocs_Data {
  @override
  final String message;

  factory _$ApiDeleteResponseApplicationJson_Ocs_Data(
          [void Function(ApiDeleteResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ApiDeleteResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ApiDeleteResponseApplicationJson_Ocs_Data._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(message, r'ApiDeleteResponseApplicationJson_Ocs_Data', 'message');
  }

  @override
  ApiDeleteResponseApplicationJson_Ocs_Data rebuild(
          void Function(ApiDeleteResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiDeleteResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ApiDeleteResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiDeleteResponseApplicationJson_Ocs_Data && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiDeleteResponseApplicationJson_Ocs_Data')..add('message', message))
        .toString();
  }
}

class ApiDeleteResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ApiDeleteResponseApplicationJson_Ocs_Data, ApiDeleteResponseApplicationJson_Ocs_DataBuilder>,
        $ApiDeleteResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ApiDeleteResponseApplicationJson_Ocs_Data? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  ApiDeleteResponseApplicationJson_Ocs_DataBuilder() {
    ApiDeleteResponseApplicationJson_Ocs_Data._defaults(this);
  }

  ApiDeleteResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiDeleteResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiDeleteResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ApiDeleteResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiDeleteResponseApplicationJson_Ocs_Data build() => _build();

  _$ApiDeleteResponseApplicationJson_Ocs_Data _build() {
    ApiDeleteResponseApplicationJson_Ocs_Data._validate(this);
    final _$result = _$v ??
        _$ApiDeleteResponseApplicationJson_Ocs_Data._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ApiDeleteResponseApplicationJson_Ocs_Data', 'message'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiDeleteResponseApplicationJson_OcsInterfaceBuilder {
  void replace($ApiDeleteResponseApplicationJson_OcsInterface other);
  void update(void Function($ApiDeleteResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ApiDeleteResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ApiDeleteResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ApiDeleteResponseApplicationJson_Ocs extends ApiDeleteResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ApiDeleteResponseApplicationJson_Ocs_Data data;

  factory _$ApiDeleteResponseApplicationJson_Ocs(
          [void Function(ApiDeleteResponseApplicationJson_OcsBuilder)? updates]) =>
      (ApiDeleteResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ApiDeleteResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ApiDeleteResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ApiDeleteResponseApplicationJson_Ocs', 'data');
  }

  @override
  ApiDeleteResponseApplicationJson_Ocs rebuild(void Function(ApiDeleteResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiDeleteResponseApplicationJson_OcsBuilder toBuilder() =>
      ApiDeleteResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiDeleteResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ApiDeleteResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ApiDeleteResponseApplicationJson_OcsBuilder
    implements
        Builder<ApiDeleteResponseApplicationJson_Ocs, ApiDeleteResponseApplicationJson_OcsBuilder>,
        $ApiDeleteResponseApplicationJson_OcsInterfaceBuilder {
  _$ApiDeleteResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ApiDeleteResponseApplicationJson_Ocs_DataBuilder? _data;
  ApiDeleteResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ApiDeleteResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ApiDeleteResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ApiDeleteResponseApplicationJson_OcsBuilder() {
    ApiDeleteResponseApplicationJson_Ocs._defaults(this);
  }

  ApiDeleteResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiDeleteResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiDeleteResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ApiDeleteResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiDeleteResponseApplicationJson_Ocs build() => _build();

  _$ApiDeleteResponseApplicationJson_Ocs _build() {
    ApiDeleteResponseApplicationJson_Ocs._validate(this);
    _$ApiDeleteResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ApiDeleteResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiDeleteResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiDeleteResponseApplicationJsonInterfaceBuilder {
  void replace($ApiDeleteResponseApplicationJsonInterface other);
  void update(void Function($ApiDeleteResponseApplicationJsonInterfaceBuilder) updates);
  ApiDeleteResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ApiDeleteResponseApplicationJson_OcsBuilder? ocs);
}

class _$ApiDeleteResponseApplicationJson extends ApiDeleteResponseApplicationJson {
  @override
  final ApiDeleteResponseApplicationJson_Ocs ocs;

  factory _$ApiDeleteResponseApplicationJson([void Function(ApiDeleteResponseApplicationJsonBuilder)? updates]) =>
      (ApiDeleteResponseApplicationJsonBuilder()..update(updates))._build();

  _$ApiDeleteResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ApiDeleteResponseApplicationJson', 'ocs');
  }

  @override
  ApiDeleteResponseApplicationJson rebuild(void Function(ApiDeleteResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiDeleteResponseApplicationJsonBuilder toBuilder() => ApiDeleteResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiDeleteResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ApiDeleteResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ApiDeleteResponseApplicationJsonBuilder
    implements
        Builder<ApiDeleteResponseApplicationJson, ApiDeleteResponseApplicationJsonBuilder>,
        $ApiDeleteResponseApplicationJsonInterfaceBuilder {
  _$ApiDeleteResponseApplicationJson? _$v;

  ApiDeleteResponseApplicationJson_OcsBuilder? _ocs;
  ApiDeleteResponseApplicationJson_OcsBuilder get ocs => _$this._ocs ??= ApiDeleteResponseApplicationJson_OcsBuilder();
  set ocs(covariant ApiDeleteResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ApiDeleteResponseApplicationJsonBuilder() {
    ApiDeleteResponseApplicationJson._defaults(this);
  }

  ApiDeleteResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiDeleteResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiDeleteResponseApplicationJson;
  }

  @override
  void update(void Function(ApiDeleteResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiDeleteResponseApplicationJson build() => _build();

  _$ApiDeleteResponseApplicationJson _build() {
    ApiDeleteResponseApplicationJson._validate(this);
    _$ApiDeleteResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ApiDeleteResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiDeleteResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Capabilities_DropAccount_DelayInterfaceBuilder {
  void replace($Capabilities_DropAccount_DelayInterface other);
  void update(void Function($Capabilities_DropAccount_DelayInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  int? get hours;
  set hours(int? hours);
}

class _$Capabilities_DropAccount_Delay extends Capabilities_DropAccount_Delay {
  @override
  final bool enabled;
  @override
  final int hours;

  factory _$Capabilities_DropAccount_Delay([void Function(Capabilities_DropAccount_DelayBuilder)? updates]) =>
      (Capabilities_DropAccount_DelayBuilder()..update(updates))._build();

  _$Capabilities_DropAccount_Delay._({required this.enabled, required this.hours}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount_Delay', 'enabled');
    BuiltValueNullFieldError.checkNotNull(hours, r'Capabilities_DropAccount_Delay', 'hours');
  }

  @override
  Capabilities_DropAccount_Delay rebuild(void Function(Capabilities_DropAccount_DelayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_DropAccount_DelayBuilder toBuilder() => Capabilities_DropAccount_DelayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_DropAccount_Delay && enabled == other.enabled && hours == other.hours;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, hours.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_DropAccount_Delay')
          ..add('enabled', enabled)
          ..add('hours', hours))
        .toString();
  }
}

class Capabilities_DropAccount_DelayBuilder
    implements
        Builder<Capabilities_DropAccount_Delay, Capabilities_DropAccount_DelayBuilder>,
        $Capabilities_DropAccount_DelayInterfaceBuilder {
  _$Capabilities_DropAccount_Delay? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  int? _hours;
  int? get hours => _$this._hours;
  set hours(covariant int? hours) => _$this._hours = hours;

  Capabilities_DropAccount_DelayBuilder() {
    Capabilities_DropAccount_Delay._defaults(this);
  }

  Capabilities_DropAccount_DelayBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _hours = $v.hours;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_DropAccount_Delay other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_DropAccount_Delay;
  }

  @override
  void update(void Function(Capabilities_DropAccount_DelayBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_DropAccount_Delay build() => _build();

  _$Capabilities_DropAccount_Delay _build() {
    Capabilities_DropAccount_Delay._validate(this);
    final _$result = _$v ??
        _$Capabilities_DropAccount_Delay._(
            enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount_Delay', 'enabled'),
            hours: BuiltValueNullFieldError.checkNotNull(hours, r'Capabilities_DropAccount_Delay', 'hours'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $Capabilities_DropAccountInterfaceBuilder {
  void replace($Capabilities_DropAccountInterface other);
  void update(void Function($Capabilities_DropAccountInterfaceBuilder) updates);
  bool? get enabled;
  set enabled(bool? enabled);

  String? get apiVersion;
  set apiVersion(String? apiVersion);

  Capabilities_DropAccount_DelayBuilder get delay;
  set delay(Capabilities_DropAccount_DelayBuilder? delay);

  String? get details;
  set details(String? details);
}

class _$Capabilities_DropAccount extends Capabilities_DropAccount {
  @override
  final bool enabled;
  @override
  final String apiVersion;
  @override
  final Capabilities_DropAccount_Delay delay;
  @override
  final String? details;

  factory _$Capabilities_DropAccount([void Function(Capabilities_DropAccountBuilder)? updates]) =>
      (Capabilities_DropAccountBuilder()..update(updates))._build();

  _$Capabilities_DropAccount._({required this.enabled, required this.apiVersion, required this.delay, this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount', 'enabled');
    BuiltValueNullFieldError.checkNotNull(apiVersion, r'Capabilities_DropAccount', 'apiVersion');
    BuiltValueNullFieldError.checkNotNull(delay, r'Capabilities_DropAccount', 'delay');
  }

  @override
  Capabilities_DropAccount rebuild(void Function(Capabilities_DropAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Capabilities_DropAccountBuilder toBuilder() => Capabilities_DropAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities_DropAccount &&
        enabled == other.enabled &&
        apiVersion == other.apiVersion &&
        delay == other.delay &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, delay.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities_DropAccount')
          ..add('enabled', enabled)
          ..add('apiVersion', apiVersion)
          ..add('delay', delay)
          ..add('details', details))
        .toString();
  }
}

class Capabilities_DropAccountBuilder
    implements
        Builder<Capabilities_DropAccount, Capabilities_DropAccountBuilder>,
        $Capabilities_DropAccountInterfaceBuilder {
  _$Capabilities_DropAccount? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(covariant bool? enabled) => _$this._enabled = enabled;

  String? _apiVersion;
  String? get apiVersion => _$this._apiVersion;
  set apiVersion(covariant String? apiVersion) => _$this._apiVersion = apiVersion;

  Capabilities_DropAccount_DelayBuilder? _delay;
  Capabilities_DropAccount_DelayBuilder get delay => _$this._delay ??= Capabilities_DropAccount_DelayBuilder();
  set delay(covariant Capabilities_DropAccount_DelayBuilder? delay) => _$this._delay = delay;

  String? _details;
  String? get details => _$this._details;
  set details(covariant String? details) => _$this._details = details;

  Capabilities_DropAccountBuilder() {
    Capabilities_DropAccount._defaults(this);
  }

  Capabilities_DropAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _apiVersion = $v.apiVersion;
      _delay = $v.delay.toBuilder();
      _details = $v.details;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Capabilities_DropAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Capabilities_DropAccount;
  }

  @override
  void update(void Function(Capabilities_DropAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Capabilities_DropAccount build() => _build();

  _$Capabilities_DropAccount _build() {
    Capabilities_DropAccount._validate(this);
    _$Capabilities_DropAccount _$result;
    try {
      _$result = _$v ??
          _$Capabilities_DropAccount._(
              enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'Capabilities_DropAccount', 'enabled'),
              apiVersion: BuiltValueNullFieldError.checkNotNull(apiVersion, r'Capabilities_DropAccount', 'apiVersion'),
              delay: delay.build(),
              details: details);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'delay';
        delay.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Capabilities_DropAccount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $CapabilitiesInterfaceBuilder {
  void replace($CapabilitiesInterface other);
  void update(void Function($CapabilitiesInterfaceBuilder) updates);
  Capabilities_DropAccountBuilder get dropAccount;
  set dropAccount(Capabilities_DropAccountBuilder? dropAccount);
}

class _$Capabilities extends Capabilities {
  @override
  final Capabilities_DropAccount dropAccount;

  factory _$Capabilities([void Function(CapabilitiesBuilder)? updates]) =>
      (CapabilitiesBuilder()..update(updates))._build();

  _$Capabilities._({required this.dropAccount}) : super._() {
    BuiltValueNullFieldError.checkNotNull(dropAccount, r'Capabilities', 'dropAccount');
  }

  @override
  Capabilities rebuild(void Function(CapabilitiesBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  CapabilitiesBuilder toBuilder() => CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Capabilities && dropAccount == other.dropAccount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dropAccount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Capabilities')..add('dropAccount', dropAccount)).toString();
  }
}

class CapabilitiesBuilder implements Builder<Capabilities, CapabilitiesBuilder>, $CapabilitiesInterfaceBuilder {
  _$Capabilities? _$v;

  Capabilities_DropAccountBuilder? _dropAccount;
  Capabilities_DropAccountBuilder get dropAccount => _$this._dropAccount ??= Capabilities_DropAccountBuilder();
  set dropAccount(covariant Capabilities_DropAccountBuilder? dropAccount) => _$this._dropAccount = dropAccount;

  CapabilitiesBuilder() {
    Capabilities._defaults(this);
  }

  CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dropAccount = $v.dropAccount.toBuilder();
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
    Capabilities._validate(this);
    _$Capabilities _$result;
    try {
      _$result = _$v ?? _$Capabilities._(dropAccount: dropAccount.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dropAccount';
        dropAccount.build();
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
