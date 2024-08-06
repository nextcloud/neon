// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updatenotification.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ApiGetAppListApiVersion _$apiGetAppListApiVersionV1 = ApiGetAppListApiVersion._('v1');

ApiGetAppListApiVersion _$valueOfApiGetAppListApiVersion(String name) {
  switch (name) {
    case 'v1':
      return _$apiGetAppListApiVersionV1;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ApiGetAppListApiVersion> _$apiGetAppListApiVersionValues =
    BuiltSet<ApiGetAppListApiVersion>(const <ApiGetAppListApiVersion>[
  _$apiGetAppListApiVersionV1,
]);

const ApiGetAppChangelogEntryApiVersion _$apiGetAppChangelogEntryApiVersionV1 =
    ApiGetAppChangelogEntryApiVersion._('v1');

ApiGetAppChangelogEntryApiVersion _$valueOfApiGetAppChangelogEntryApiVersion(String name) {
  switch (name) {
    case 'v1':
      return _$apiGetAppChangelogEntryApiVersionV1;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ApiGetAppChangelogEntryApiVersion> _$apiGetAppChangelogEntryApiVersionValues =
    BuiltSet<ApiGetAppChangelogEntryApiVersion>(const <ApiGetAppChangelogEntryApiVersion>[
  _$apiGetAppChangelogEntryApiVersionV1,
]);

Serializer<OCSMeta> _$oCSMetaSerializer = _$OCSMetaSerializer();
Serializer<App> _$appSerializer = _$AppSerializer();
Serializer<ApiGetAppListResponseApplicationJson_Ocs_Data> _$apiGetAppListResponseApplicationJsonOcsDataSerializer =
    _$ApiGetAppListResponseApplicationJson_Ocs_DataSerializer();
Serializer<ApiGetAppListResponseApplicationJson_Ocs> _$apiGetAppListResponseApplicationJsonOcsSerializer =
    _$ApiGetAppListResponseApplicationJson_OcsSerializer();
Serializer<ApiGetAppListResponseApplicationJson> _$apiGetAppListResponseApplicationJsonSerializer =
    _$ApiGetAppListResponseApplicationJsonSerializer();
Serializer<ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data>
    _$apiGetAppChangelogEntryResponseApplicationJsonOcsDataSerializer =
    _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataSerializer();
Serializer<ApiGetAppChangelogEntryResponseApplicationJson_Ocs>
    _$apiGetAppChangelogEntryResponseApplicationJsonOcsSerializer =
    _$ApiGetAppChangelogEntryResponseApplicationJson_OcsSerializer();
Serializer<ApiGetAppChangelogEntryResponseApplicationJson> _$apiGetAppChangelogEntryResponseApplicationJsonSerializer =
    _$ApiGetAppChangelogEntryResponseApplicationJsonSerializer();

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

class _$AppSerializer implements StructuredSerializer<App> {
  @override
  final Iterable<Type> types = const [App, _$App];
  @override
  final String wireName = 'App';

  @override
  Iterable<Object?> serialize(Serializers serializers, App object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'appId',
      serializers.serialize(object.appId, specifiedType: const FullType(String)),
      'appName',
      serializers.serialize(object.appName, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  App deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AppBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'appId':
          result.appId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'appName':
          result.appName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiGetAppListResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ApiGetAppListResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    ApiGetAppListResponseApplicationJson_Ocs_Data,
    _$ApiGetAppListResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'ApiGetAppListResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiGetAppListResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'missing',
      serializers.serialize(object.missing, specifiedType: const FullType(BuiltList, [FullType(App)])),
      'available',
      serializers.serialize(object.available, specifiedType: const FullType(BuiltList, [FullType(App)])),
    ];

    return result;
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiGetAppListResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'missing':
          result.missing.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(App)]))! as BuiltList<Object?>);
          break;
        case 'available':
          result.available.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(App)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiGetAppListResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ApiGetAppListResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ApiGetAppListResponseApplicationJson_Ocs,
    _$ApiGetAppListResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ApiGetAppListResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiGetAppListResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiGetAppListResponseApplicationJson_OcsBuilder();

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
                  specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs_Data))!
              as ApiGetAppListResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiGetAppListResponseApplicationJsonSerializer
    implements StructuredSerializer<ApiGetAppListResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [ApiGetAppListResponseApplicationJson, _$ApiGetAppListResponseApplicationJson];
  @override
  final String wireName = 'ApiGetAppListResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiGetAppListResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ApiGetAppListResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiGetAppListResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(ApiGetAppListResponseApplicationJson_Ocs))!
                  as ApiGetAppListResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data,
    _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'appName',
      serializers.serialize(object.appName, specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content, specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'appName':
          result.appName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiGetAppChangelogEntryResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ApiGetAppChangelogEntryResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ApiGetAppChangelogEntryResponseApplicationJson_Ocs,
    _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ApiGetAppChangelogEntryResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiGetAppChangelogEntryResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder();

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
                  specifiedType: const FullType(ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data))!
              as ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiGetAppChangelogEntryResponseApplicationJsonSerializer
    implements StructuredSerializer<ApiGetAppChangelogEntryResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    ApiGetAppChangelogEntryResponseApplicationJson,
    _$ApiGetAppChangelogEntryResponseApplicationJson
  ];
  @override
  final String wireName = 'ApiGetAppChangelogEntryResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiGetAppChangelogEntryResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(ApiGetAppChangelogEntryResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ApiGetAppChangelogEntryResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ApiGetAppChangelogEntryResponseApplicationJson_Ocs))!
              as ApiGetAppChangelogEntryResponseApplicationJson_Ocs);
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

abstract mixin class $AppInterfaceBuilder {
  void replace($AppInterface other);
  void update(void Function($AppInterfaceBuilder) updates);
  String? get appId;
  set appId(String? appId);

  String? get appName;
  set appName(String? appName);
}

class _$App extends App {
  @override
  final String appId;
  @override
  final String appName;

  factory _$App([void Function(AppBuilder)? updates]) => (AppBuilder()..update(updates))._build();

  _$App._({required this.appId, required this.appName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(appId, r'App', 'appId');
    BuiltValueNullFieldError.checkNotNull(appName, r'App', 'appName');
  }

  @override
  App rebuild(void Function(AppBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AppBuilder toBuilder() => AppBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is App && appId == other.appId && appName == other.appName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appId.hashCode);
    _$hash = $jc(_$hash, appName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'App')
          ..add('appId', appId)
          ..add('appName', appName))
        .toString();
  }
}

class AppBuilder implements Builder<App, AppBuilder>, $AppInterfaceBuilder {
  _$App? _$v;

  String? _appId;
  String? get appId => _$this._appId;
  set appId(covariant String? appId) => _$this._appId = appId;

  String? _appName;
  String? get appName => _$this._appName;
  set appName(covariant String? appName) => _$this._appName = appName;

  AppBuilder() {
    App._defaults(this);
  }

  AppBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appId = $v.appId;
      _appName = $v.appName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant App other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$App;
  }

  @override
  void update(void Function(AppBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  App build() => _build();

  _$App _build() {
    App._validate(this);
    final _$result = _$v ??
        _$App._(
            appId: BuiltValueNullFieldError.checkNotNull(appId, r'App', 'appId'),
            appName: BuiltValueNullFieldError.checkNotNull(appName, r'App', 'appName'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace($ApiGetAppListResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function($ApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  ListBuilder<App> get missing;
  set missing(ListBuilder<App>? missing);

  ListBuilder<App> get available;
  set available(ListBuilder<App>? available);
}

class _$ApiGetAppListResponseApplicationJson_Ocs_Data extends ApiGetAppListResponseApplicationJson_Ocs_Data {
  @override
  final BuiltList<App> missing;
  @override
  final BuiltList<App> available;

  factory _$ApiGetAppListResponseApplicationJson_Ocs_Data(
          [void Function(ApiGetAppListResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ApiGetAppListResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ApiGetAppListResponseApplicationJson_Ocs_Data._({required this.missing, required this.available}) : super._() {
    BuiltValueNullFieldError.checkNotNull(missing, r'ApiGetAppListResponseApplicationJson_Ocs_Data', 'missing');
    BuiltValueNullFieldError.checkNotNull(available, r'ApiGetAppListResponseApplicationJson_Ocs_Data', 'available');
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs_Data rebuild(
          void Function(ApiGetAppListResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetAppListResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ApiGetAppListResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetAppListResponseApplicationJson_Ocs_Data &&
        missing == other.missing &&
        available == other.available;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, missing.hashCode);
    _$hash = $jc(_$hash, available.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiGetAppListResponseApplicationJson_Ocs_Data')
          ..add('missing', missing)
          ..add('available', available))
        .toString();
  }
}

class ApiGetAppListResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ApiGetAppListResponseApplicationJson_Ocs_Data, ApiGetAppListResponseApplicationJson_Ocs_DataBuilder>,
        $ApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ApiGetAppListResponseApplicationJson_Ocs_Data? _$v;

  ListBuilder<App>? _missing;
  ListBuilder<App> get missing => _$this._missing ??= ListBuilder<App>();
  set missing(covariant ListBuilder<App>? missing) => _$this._missing = missing;

  ListBuilder<App>? _available;
  ListBuilder<App> get available => _$this._available ??= ListBuilder<App>();
  set available(covariant ListBuilder<App>? available) => _$this._available = available;

  ApiGetAppListResponseApplicationJson_Ocs_DataBuilder() {
    ApiGetAppListResponseApplicationJson_Ocs_Data._defaults(this);
  }

  ApiGetAppListResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _missing = $v.missing.toBuilder();
      _available = $v.available.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetAppListResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetAppListResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ApiGetAppListResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs_Data build() => _build();

  _$ApiGetAppListResponseApplicationJson_Ocs_Data _build() {
    ApiGetAppListResponseApplicationJson_Ocs_Data._validate(this);
    _$ApiGetAppListResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$ApiGetAppListResponseApplicationJson_Ocs_Data._(missing: missing.build(), available: available.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'missing';
        missing.build();
        _$failedField = 'available';
        available.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiGetAppListResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiGetAppListResponseApplicationJson_OcsInterfaceBuilder {
  void replace($ApiGetAppListResponseApplicationJson_OcsInterface other);
  void update(void Function($ApiGetAppListResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ApiGetAppListResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ApiGetAppListResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ApiGetAppListResponseApplicationJson_Ocs extends ApiGetAppListResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ApiGetAppListResponseApplicationJson_Ocs_Data data;

  factory _$ApiGetAppListResponseApplicationJson_Ocs(
          [void Function(ApiGetAppListResponseApplicationJson_OcsBuilder)? updates]) =>
      (ApiGetAppListResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ApiGetAppListResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ApiGetAppListResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ApiGetAppListResponseApplicationJson_Ocs', 'data');
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs rebuild(
          void Function(ApiGetAppListResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetAppListResponseApplicationJson_OcsBuilder toBuilder() =>
      ApiGetAppListResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetAppListResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ApiGetAppListResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ApiGetAppListResponseApplicationJson_OcsBuilder
    implements
        Builder<ApiGetAppListResponseApplicationJson_Ocs, ApiGetAppListResponseApplicationJson_OcsBuilder>,
        $ApiGetAppListResponseApplicationJson_OcsInterfaceBuilder {
  _$ApiGetAppListResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ApiGetAppListResponseApplicationJson_Ocs_DataBuilder? _data;
  ApiGetAppListResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ApiGetAppListResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ApiGetAppListResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ApiGetAppListResponseApplicationJson_OcsBuilder() {
    ApiGetAppListResponseApplicationJson_Ocs._defaults(this);
  }

  ApiGetAppListResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetAppListResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetAppListResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ApiGetAppListResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetAppListResponseApplicationJson_Ocs build() => _build();

  _$ApiGetAppListResponseApplicationJson_Ocs _build() {
    ApiGetAppListResponseApplicationJson_Ocs._validate(this);
    _$ApiGetAppListResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ApiGetAppListResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiGetAppListResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiGetAppListResponseApplicationJsonInterfaceBuilder {
  void replace($ApiGetAppListResponseApplicationJsonInterface other);
  void update(void Function($ApiGetAppListResponseApplicationJsonInterfaceBuilder) updates);
  ApiGetAppListResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ApiGetAppListResponseApplicationJson_OcsBuilder? ocs);
}

class _$ApiGetAppListResponseApplicationJson extends ApiGetAppListResponseApplicationJson {
  @override
  final ApiGetAppListResponseApplicationJson_Ocs ocs;

  factory _$ApiGetAppListResponseApplicationJson(
          [void Function(ApiGetAppListResponseApplicationJsonBuilder)? updates]) =>
      (ApiGetAppListResponseApplicationJsonBuilder()..update(updates))._build();

  _$ApiGetAppListResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ApiGetAppListResponseApplicationJson', 'ocs');
  }

  @override
  ApiGetAppListResponseApplicationJson rebuild(void Function(ApiGetAppListResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetAppListResponseApplicationJsonBuilder toBuilder() =>
      ApiGetAppListResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetAppListResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ApiGetAppListResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ApiGetAppListResponseApplicationJsonBuilder
    implements
        Builder<ApiGetAppListResponseApplicationJson, ApiGetAppListResponseApplicationJsonBuilder>,
        $ApiGetAppListResponseApplicationJsonInterfaceBuilder {
  _$ApiGetAppListResponseApplicationJson? _$v;

  ApiGetAppListResponseApplicationJson_OcsBuilder? _ocs;
  ApiGetAppListResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ApiGetAppListResponseApplicationJson_OcsBuilder();
  set ocs(covariant ApiGetAppListResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ApiGetAppListResponseApplicationJsonBuilder() {
    ApiGetAppListResponseApplicationJson._defaults(this);
  }

  ApiGetAppListResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetAppListResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetAppListResponseApplicationJson;
  }

  @override
  void update(void Function(ApiGetAppListResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetAppListResponseApplicationJson build() => _build();

  _$ApiGetAppListResponseApplicationJson _build() {
    ApiGetAppListResponseApplicationJson._validate(this);
    _$ApiGetAppListResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ApiGetAppListResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ApiGetAppListResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace($ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function($ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get appName;
  set appName(String? appName);

  String? get content;
  set content(String? content);

  String? get version;
  set version(String? version);
}

class _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data
    extends ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data {
  @override
  final String appName;
  @override
  final String content;
  @override
  final String version;

  factory _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data(
          [void Function(ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data._(
      {required this.appName, required this.content, required this.version})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        appName, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data', 'appName');
    BuiltValueNullFieldError.checkNotNull(
        content, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data', 'content');
    BuiltValueNullFieldError.checkNotNull(
        version, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data', 'version');
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data rebuild(
          void Function(ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data &&
        appName == other.appName &&
        content == other.content &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appName.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data')
          ..add('appName', appName)
          ..add('content', content)
          ..add('version', version))
        .toString();
  }
}

class ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data,
            ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder>,
        $ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data? _$v;

  String? _appName;
  String? get appName => _$this._appName;
  set appName(covariant String? appName) => _$this._appName = appName;

  String? _content;
  String? get content => _$this._content;
  set content(covariant String? content) => _$this._content = content;

  String? _version;
  String? get version => _$this._version;
  set version(covariant String? version) => _$this._version = version;

  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder() {
    ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data._defaults(this);
  }

  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appName = $v.appName;
      _content = $v.content;
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data build() => _build();

  _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data _build() {
    ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data._validate(this);
    final _$result = _$v ??
        _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data._(
            appName: BuiltValueNullFieldError.checkNotNull(
                appName, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data', 'appName'),
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data', 'content'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data', 'version'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiGetAppChangelogEntryResponseApplicationJson_OcsInterfaceBuilder {
  void replace($ApiGetAppChangelogEntryResponseApplicationJson_OcsInterface other);
  void update(void Function($ApiGetAppChangelogEntryResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs extends ApiGetAppChangelogEntryResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ApiGetAppChangelogEntryResponseApplicationJson_Ocs_Data data;

  factory _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs(
          [void Function(ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder)? updates]) =>
      (ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs', 'data');
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs rebuild(
          void Function(ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder toBuilder() =>
      ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetAppChangelogEntryResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder
    implements
        Builder<ApiGetAppChangelogEntryResponseApplicationJson_Ocs,
            ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder>,
        $ApiGetAppChangelogEntryResponseApplicationJson_OcsInterfaceBuilder {
  _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder? _data;
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ApiGetAppChangelogEntryResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder() {
    ApiGetAppChangelogEntryResponseApplicationJson_Ocs._defaults(this);
  }

  ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetAppChangelogEntryResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson_Ocs build() => _build();

  _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs _build() {
    ApiGetAppChangelogEntryResponseApplicationJson_Ocs._validate(this);
    _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ApiGetAppChangelogEntryResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiGetAppChangelogEntryResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ApiGetAppChangelogEntryResponseApplicationJsonInterfaceBuilder {
  void replace($ApiGetAppChangelogEntryResponseApplicationJsonInterface other);
  void update(void Function($ApiGetAppChangelogEntryResponseApplicationJsonInterfaceBuilder) updates);
  ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder? ocs);
}

class _$ApiGetAppChangelogEntryResponseApplicationJson extends ApiGetAppChangelogEntryResponseApplicationJson {
  @override
  final ApiGetAppChangelogEntryResponseApplicationJson_Ocs ocs;

  factory _$ApiGetAppChangelogEntryResponseApplicationJson(
          [void Function(ApiGetAppChangelogEntryResponseApplicationJsonBuilder)? updates]) =>
      (ApiGetAppChangelogEntryResponseApplicationJsonBuilder()..update(updates))._build();

  _$ApiGetAppChangelogEntryResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ApiGetAppChangelogEntryResponseApplicationJson', 'ocs');
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson rebuild(
          void Function(ApiGetAppChangelogEntryResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiGetAppChangelogEntryResponseApplicationJsonBuilder toBuilder() =>
      ApiGetAppChangelogEntryResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiGetAppChangelogEntryResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ApiGetAppChangelogEntryResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ApiGetAppChangelogEntryResponseApplicationJsonBuilder
    implements
        Builder<ApiGetAppChangelogEntryResponseApplicationJson, ApiGetAppChangelogEntryResponseApplicationJsonBuilder>,
        $ApiGetAppChangelogEntryResponseApplicationJsonInterfaceBuilder {
  _$ApiGetAppChangelogEntryResponseApplicationJson? _$v;

  ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder? _ocs;
  ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder();
  set ocs(covariant ApiGetAppChangelogEntryResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ApiGetAppChangelogEntryResponseApplicationJsonBuilder() {
    ApiGetAppChangelogEntryResponseApplicationJson._defaults(this);
  }

  ApiGetAppChangelogEntryResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ApiGetAppChangelogEntryResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiGetAppChangelogEntryResponseApplicationJson;
  }

  @override
  void update(void Function(ApiGetAppChangelogEntryResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiGetAppChangelogEntryResponseApplicationJson build() => _build();

  _$ApiGetAppChangelogEntryResponseApplicationJson _build() {
    ApiGetAppChangelogEntryResponseApplicationJson._validate(this);
    _$ApiGetAppChangelogEntryResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ApiGetAppChangelogEntryResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiGetAppChangelogEntryResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
