// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updatenotification.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpdatenotificationApiGetAppListApiVersion _$updatenotificationApiGetAppListApiVersionV1 =
    UpdatenotificationApiGetAppListApiVersion._('v1');

UpdatenotificationApiGetAppListApiVersion _$valueOfUpdatenotificationApiGetAppListApiVersion(String name) {
  switch (name) {
    case 'v1':
      return _$updatenotificationApiGetAppListApiVersionV1;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpdatenotificationApiGetAppListApiVersion> _$updatenotificationApiGetAppListApiVersionValues =
    BuiltSet<UpdatenotificationApiGetAppListApiVersion>(const <UpdatenotificationApiGetAppListApiVersion>[
  _$updatenotificationApiGetAppListApiVersionV1,
]);

Serializer<UpdatenotificationApiGetAppListApiVersion> _$updatenotificationApiGetAppListApiVersionSerializer =
    _$UpdatenotificationApiGetAppListApiVersionSerializer();
Serializer<UpdatenotificationOCSMeta> _$updatenotificationOCSMetaSerializer = _$UpdatenotificationOCSMetaSerializer();
Serializer<UpdatenotificationApp> _$updatenotificationAppSerializer = _$UpdatenotificationAppSerializer();
Serializer<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data>
    _$updatenotificationApiGetAppListResponseApplicationJsonOcsDataSerializer =
    _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataSerializer();
Serializer<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs>
    _$updatenotificationApiGetAppListResponseApplicationJsonOcsSerializer =
    _$UpdatenotificationApiGetAppListResponseApplicationJson_OcsSerializer();
Serializer<UpdatenotificationApiGetAppListResponseApplicationJson>
    _$updatenotificationApiGetAppListResponseApplicationJsonSerializer =
    _$UpdatenotificationApiGetAppListResponseApplicationJsonSerializer();

class _$UpdatenotificationApiGetAppListApiVersionSerializer
    implements PrimitiveSerializer<UpdatenotificationApiGetAppListApiVersion> {
  @override
  final Iterable<Type> types = const <Type>[UpdatenotificationApiGetAppListApiVersion];
  @override
  final String wireName = 'UpdatenotificationApiGetAppListApiVersion';

  @override
  Object serialize(Serializers serializers, UpdatenotificationApiGetAppListApiVersion object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  UpdatenotificationApiGetAppListApiVersion deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpdatenotificationApiGetAppListApiVersion.valueOf(serialized as String);
}

class _$UpdatenotificationOCSMetaSerializer implements StructuredSerializer<UpdatenotificationOCSMeta> {
  @override
  final Iterable<Type> types = const [UpdatenotificationOCSMeta, _$UpdatenotificationOCSMeta];
  @override
  final String wireName = 'UpdatenotificationOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, UpdatenotificationOCSMeta object,
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
  UpdatenotificationOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UpdatenotificationOCSMetaBuilder();

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

class _$UpdatenotificationAppSerializer implements StructuredSerializer<UpdatenotificationApp> {
  @override
  final Iterable<Type> types = const [UpdatenotificationApp, _$UpdatenotificationApp];
  @override
  final String wireName = 'UpdatenotificationApp';

  @override
  Iterable<Object?> serialize(Serializers serializers, UpdatenotificationApp object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'appId',
      serializers.serialize(object.appId, specifiedType: const FullType(String)),
      'appName',
      serializers.serialize(object.appName, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UpdatenotificationApp deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UpdatenotificationAppBuilder();

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

class _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data,
    _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'missing',
      serializers.serialize(object.missing,
          specifiedType: const FullType(BuiltList, [FullType(UpdatenotificationApp)])),
      'available',
      serializers.serialize(object.available,
          specifiedType: const FullType(BuiltList, [FullType(UpdatenotificationApp)])),
    ];

    return result;
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'missing':
          result.missing.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(UpdatenotificationApp)]))! as BuiltList<Object?>);
          break;
        case 'available':
          result.available.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(UpdatenotificationApp)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UpdatenotificationApiGetAppListResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UpdatenotificationApiGetAppListResponseApplicationJson_Ocs,
    _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UpdatenotificationApiGetAppListResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UpdatenotificationOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(UpdatenotificationOCSMeta))!
              as UpdatenotificationOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data))!
              as UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$UpdatenotificationApiGetAppListResponseApplicationJsonSerializer
    implements StructuredSerializer<UpdatenotificationApiGetAppListResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UpdatenotificationApiGetAppListResponseApplicationJson,
    _$UpdatenotificationApiGetAppListResponseApplicationJson
  ];
  @override
  final String wireName = 'UpdatenotificationApiGetAppListResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UpdatenotificationApiGetAppListResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UpdatenotificationApiGetAppListResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs))!
              as UpdatenotificationApiGetAppListResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class UpdatenotificationOCSMetaInterfaceBuilder {
  void replace(UpdatenotificationOCSMetaInterface other);
  void update(void Function(UpdatenotificationOCSMetaInterfaceBuilder) updates);
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

class _$UpdatenotificationOCSMeta extends UpdatenotificationOCSMeta {
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

  factory _$UpdatenotificationOCSMeta([void Function(UpdatenotificationOCSMetaBuilder)? updates]) =>
      (UpdatenotificationOCSMetaBuilder()..update(updates))._build();

  _$UpdatenotificationOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'UpdatenotificationOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'UpdatenotificationOCSMeta', 'statuscode');
  }

  @override
  UpdatenotificationOCSMeta rebuild(void Function(UpdatenotificationOCSMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatenotificationOCSMetaBuilder toBuilder() => UpdatenotificationOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatenotificationOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'UpdatenotificationOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class UpdatenotificationOCSMetaBuilder
    implements
        Builder<UpdatenotificationOCSMeta, UpdatenotificationOCSMetaBuilder>,
        UpdatenotificationOCSMetaInterfaceBuilder {
  _$UpdatenotificationOCSMeta? _$v;

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

  UpdatenotificationOCSMetaBuilder();

  UpdatenotificationOCSMetaBuilder get _$this {
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
  void replace(covariant UpdatenotificationOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdatenotificationOCSMeta;
  }

  @override
  void update(void Function(UpdatenotificationOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatenotificationOCSMeta build() => _build();

  _$UpdatenotificationOCSMeta _build() {
    final _$result = _$v ??
        _$UpdatenotificationOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'UpdatenotificationOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'UpdatenotificationOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UpdatenotificationAppInterfaceBuilder {
  void replace(UpdatenotificationAppInterface other);
  void update(void Function(UpdatenotificationAppInterfaceBuilder) updates);
  String? get appId;
  set appId(String? appId);

  String? get appName;
  set appName(String? appName);
}

class _$UpdatenotificationApp extends UpdatenotificationApp {
  @override
  final String appId;
  @override
  final String appName;

  factory _$UpdatenotificationApp([void Function(UpdatenotificationAppBuilder)? updates]) =>
      (UpdatenotificationAppBuilder()..update(updates))._build();

  _$UpdatenotificationApp._({required this.appId, required this.appName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(appId, r'UpdatenotificationApp', 'appId');
    BuiltValueNullFieldError.checkNotNull(appName, r'UpdatenotificationApp', 'appName');
  }

  @override
  UpdatenotificationApp rebuild(void Function(UpdatenotificationAppBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatenotificationAppBuilder toBuilder() => UpdatenotificationAppBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatenotificationApp && appId == other.appId && appName == other.appName;
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
    return (newBuiltValueToStringHelper(r'UpdatenotificationApp')
          ..add('appId', appId)
          ..add('appName', appName))
        .toString();
  }
}

class UpdatenotificationAppBuilder
    implements Builder<UpdatenotificationApp, UpdatenotificationAppBuilder>, UpdatenotificationAppInterfaceBuilder {
  _$UpdatenotificationApp? _$v;

  String? _appId;
  String? get appId => _$this._appId;
  set appId(covariant String? appId) => _$this._appId = appId;

  String? _appName;
  String? get appName => _$this._appName;
  set appName(covariant String? appName) => _$this._appName = appName;

  UpdatenotificationAppBuilder();

  UpdatenotificationAppBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appId = $v.appId;
      _appName = $v.appName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UpdatenotificationApp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdatenotificationApp;
  }

  @override
  void update(void Function(UpdatenotificationAppBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatenotificationApp build() => _build();

  _$UpdatenotificationApp _build() {
    final _$result = _$v ??
        _$UpdatenotificationApp._(
            appId: BuiltValueNullFieldError.checkNotNull(appId, r'UpdatenotificationApp', 'appId'),
            appName: BuiltValueNullFieldError.checkNotNull(appName, r'UpdatenotificationApp', 'appName'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  ListBuilder<UpdatenotificationApp> get missing;
  set missing(ListBuilder<UpdatenotificationApp>? missing);

  ListBuilder<UpdatenotificationApp> get available;
  set available(ListBuilder<UpdatenotificationApp>? available);
}

class _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data
    extends UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data {
  @override
  final BuiltList<UpdatenotificationApp> missing;
  @override
  final BuiltList<UpdatenotificationApp> available;

  factory _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data(
          [void Function(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data._({required this.missing, required this.available})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        missing, r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data', 'missing');
    BuiltValueNullFieldError.checkNotNull(
        available, r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data', 'available');
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data rebuild(
          void Function(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data &&
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
    return (newBuiltValueToStringHelper(r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data')
          ..add('missing', missing)
          ..add('available', available))
        .toString();
  }
}

class UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data,
            UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder>,
        UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data? _$v;

  ListBuilder<UpdatenotificationApp>? _missing;
  ListBuilder<UpdatenotificationApp> get missing => _$this._missing ??= ListBuilder<UpdatenotificationApp>();
  set missing(covariant ListBuilder<UpdatenotificationApp>? missing) => _$this._missing = missing;

  ListBuilder<UpdatenotificationApp>? _available;
  ListBuilder<UpdatenotificationApp> get available => _$this._available ??= ListBuilder<UpdatenotificationApp>();
  set available(covariant ListBuilder<UpdatenotificationApp>? available) => _$this._available = available;

  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder();

  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _missing = $v.missing.toBuilder();
      _available = $v.available.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data build() => _build();

  _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data _build() {
    _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data._(
              missing: missing.build(), available: available.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'missing';
        missing.build();
        _$failedField = 'available';
        available.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterface other);
  void update(void Function(UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterfaceBuilder) updates);
  UpdatenotificationOCSMetaBuilder get meta;
  set meta(UpdatenotificationOCSMetaBuilder? meta);

  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder get data;
  set data(UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs
    extends UpdatenotificationApiGetAppListResponseApplicationJson_Ocs {
  @override
  final UpdatenotificationOCSMeta meta;
  @override
  final UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_Data data;

  factory _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs(
          [void Function(UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder)? updates]) =>
      (UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs', 'data');
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs rebuild(
          void Function(UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder toBuilder() =>
      UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatenotificationApiGetAppListResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder
    implements
        Builder<UpdatenotificationApiGetAppListResponseApplicationJson_Ocs,
            UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder>,
        UpdatenotificationApiGetAppListResponseApplicationJson_OcsInterfaceBuilder {
  _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs? _$v;

  UpdatenotificationOCSMetaBuilder? _meta;
  UpdatenotificationOCSMetaBuilder get meta => _$this._meta ??= UpdatenotificationOCSMetaBuilder();
  set meta(covariant UpdatenotificationOCSMetaBuilder? meta) => _$this._meta = meta;

  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder? _data;
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant UpdatenotificationApiGetAppListResponseApplicationJson_Ocs_DataBuilder? data) =>
      _$this._data = data;

  UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder();

  UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UpdatenotificationApiGetAppListResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson_Ocs build() => _build();

  _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs _build() {
    _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UpdatenotificationApiGetAppListResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdatenotificationApiGetAppListResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UpdatenotificationApiGetAppListResponseApplicationJsonInterfaceBuilder {
  void replace(UpdatenotificationApiGetAppListResponseApplicationJsonInterface other);
  void update(void Function(UpdatenotificationApiGetAppListResponseApplicationJsonInterfaceBuilder) updates);
  UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder? ocs);
}

class _$UpdatenotificationApiGetAppListResponseApplicationJson
    extends UpdatenotificationApiGetAppListResponseApplicationJson {
  @override
  final UpdatenotificationApiGetAppListResponseApplicationJson_Ocs ocs;

  factory _$UpdatenotificationApiGetAppListResponseApplicationJson(
          [void Function(UpdatenotificationApiGetAppListResponseApplicationJsonBuilder)? updates]) =>
      (UpdatenotificationApiGetAppListResponseApplicationJsonBuilder()..update(updates))._build();

  _$UpdatenotificationApiGetAppListResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UpdatenotificationApiGetAppListResponseApplicationJson', 'ocs');
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson rebuild(
          void Function(UpdatenotificationApiGetAppListResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatenotificationApiGetAppListResponseApplicationJsonBuilder toBuilder() =>
      UpdatenotificationApiGetAppListResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatenotificationApiGetAppListResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UpdatenotificationApiGetAppListResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UpdatenotificationApiGetAppListResponseApplicationJsonBuilder
    implements
        Builder<UpdatenotificationApiGetAppListResponseApplicationJson,
            UpdatenotificationApiGetAppListResponseApplicationJsonBuilder>,
        UpdatenotificationApiGetAppListResponseApplicationJsonInterfaceBuilder {
  _$UpdatenotificationApiGetAppListResponseApplicationJson? _$v;

  UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder? _ocs;
  UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder();
  set ocs(covariant UpdatenotificationApiGetAppListResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UpdatenotificationApiGetAppListResponseApplicationJsonBuilder();

  UpdatenotificationApiGetAppListResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UpdatenotificationApiGetAppListResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdatenotificationApiGetAppListResponseApplicationJson;
  }

  @override
  void update(void Function(UpdatenotificationApiGetAppListResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatenotificationApiGetAppListResponseApplicationJson build() => _build();

  _$UpdatenotificationApiGetAppListResponseApplicationJson _build() {
    _$UpdatenotificationApiGetAppListResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UpdatenotificationApiGetAppListResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdatenotificationApiGetAppListResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
