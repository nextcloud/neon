// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ldap.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConfigapiShowShowPassword _$configapiShowShowPassword$0 = ConfigapiShowShowPassword._('\$0');
const ConfigapiShowShowPassword _$configapiShowShowPassword$1 = ConfigapiShowShowPassword._('\$1');

ConfigapiShowShowPassword _$valueOfConfigapiShowShowPassword(String name) {
  switch (name) {
    case '\$0':
      return _$configapiShowShowPassword$0;
    case '\$1':
      return _$configapiShowShowPassword$1;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConfigapiShowShowPassword> _$configapiShowShowPasswordValues =
    BuiltSet<ConfigapiShowShowPassword>(const <ConfigapiShowShowPassword>[
  _$configapiShowShowPassword$0,
  _$configapiShowShowPassword$1,
]);

Serializer<OCSMeta> _$oCSMetaSerializer = _$OCSMetaSerializer();
Serializer<ConfigapiCreateResponseApplicationJson_Ocs_Data> _$configapiCreateResponseApplicationJsonOcsDataSerializer =
    _$ConfigapiCreateResponseApplicationJson_Ocs_DataSerializer();
Serializer<ConfigapiCreateResponseApplicationJson_Ocs> _$configapiCreateResponseApplicationJsonOcsSerializer =
    _$ConfigapiCreateResponseApplicationJson_OcsSerializer();
Serializer<ConfigapiCreateResponseApplicationJson> _$configapiCreateResponseApplicationJsonSerializer =
    _$ConfigapiCreateResponseApplicationJsonSerializer();
Serializer<ConfigapiShowResponseApplicationJson_Ocs> _$configapiShowResponseApplicationJsonOcsSerializer =
    _$ConfigapiShowResponseApplicationJson_OcsSerializer();
Serializer<ConfigapiShowResponseApplicationJson> _$configapiShowResponseApplicationJsonSerializer =
    _$ConfigapiShowResponseApplicationJsonSerializer();
Serializer<ConfigapiModifyResponseApplicationJson_Ocs> _$configapiModifyResponseApplicationJsonOcsSerializer =
    _$ConfigapiModifyResponseApplicationJson_OcsSerializer();
Serializer<ConfigapiModifyResponseApplicationJson> _$configapiModifyResponseApplicationJsonSerializer =
    _$ConfigapiModifyResponseApplicationJsonSerializer();
Serializer<ConfigapiDeleteResponseApplicationJson_Ocs> _$configapiDeleteResponseApplicationJsonOcsSerializer =
    _$ConfigapiDeleteResponseApplicationJson_OcsSerializer();
Serializer<ConfigapiDeleteResponseApplicationJson> _$configapiDeleteResponseApplicationJsonSerializer =
    _$ConfigapiDeleteResponseApplicationJsonSerializer();

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

class _$ConfigapiCreateResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ConfigapiCreateResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    ConfigapiCreateResponseApplicationJson_Ocs_Data,
    _$ConfigapiCreateResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'ConfigapiCreateResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiCreateResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'configID',
      serializers.serialize(object.configID, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ConfigapiCreateResponseApplicationJson_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'configID':
          result.configID = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiCreateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ConfigapiCreateResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ConfigapiCreateResponseApplicationJson_Ocs,
    _$ConfigapiCreateResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ConfigapiCreateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiCreateResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(ConfigapiCreateResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  ConfigapiCreateResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiCreateResponseApplicationJson_OcsBuilder();

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
                  specifiedType: const FullType(ConfigapiCreateResponseApplicationJson_Ocs_Data))!
              as ConfigapiCreateResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiCreateResponseApplicationJsonSerializer
    implements StructuredSerializer<ConfigapiCreateResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [ConfigapiCreateResponseApplicationJson, _$ConfigapiCreateResponseApplicationJson];
  @override
  final String wireName = 'ConfigapiCreateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiCreateResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ConfigapiCreateResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ConfigapiCreateResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiCreateResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(ConfigapiCreateResponseApplicationJson_Ocs))!
                  as ConfigapiCreateResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiShowResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ConfigapiShowResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ConfigapiShowResponseApplicationJson_Ocs,
    _$ConfigapiShowResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ConfigapiShowResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiShowResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  ConfigapiShowResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiShowResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiShowResponseApplicationJsonSerializer
    implements StructuredSerializer<ConfigapiShowResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [ConfigapiShowResponseApplicationJson, _$ConfigapiShowResponseApplicationJson];
  @override
  final String wireName = 'ConfigapiShowResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiShowResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ConfigapiShowResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ConfigapiShowResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiShowResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(ConfigapiShowResponseApplicationJson_Ocs))!
                  as ConfigapiShowResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiModifyResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ConfigapiModifyResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ConfigapiModifyResponseApplicationJson_Ocs,
    _$ConfigapiModifyResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ConfigapiModifyResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiModifyResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  ConfigapiModifyResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiModifyResponseApplicationJson_OcsBuilder();

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
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiModifyResponseApplicationJsonSerializer
    implements StructuredSerializer<ConfigapiModifyResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [ConfigapiModifyResponseApplicationJson, _$ConfigapiModifyResponseApplicationJson];
  @override
  final String wireName = 'ConfigapiModifyResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiModifyResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ConfigapiModifyResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ConfigapiModifyResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiModifyResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(ConfigapiModifyResponseApplicationJson_Ocs))!
                  as ConfigapiModifyResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiDeleteResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ConfigapiDeleteResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    ConfigapiDeleteResponseApplicationJson_Ocs,
    _$ConfigapiDeleteResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'ConfigapiDeleteResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiDeleteResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  ConfigapiDeleteResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiDeleteResponseApplicationJson_OcsBuilder();

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
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigapiDeleteResponseApplicationJsonSerializer
    implements StructuredSerializer<ConfigapiDeleteResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [ConfigapiDeleteResponseApplicationJson, _$ConfigapiDeleteResponseApplicationJson];
  @override
  final String wireName = 'ConfigapiDeleteResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigapiDeleteResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ConfigapiDeleteResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  ConfigapiDeleteResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ConfigapiDeleteResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(ConfigapiDeleteResponseApplicationJson_Ocs))!
                  as ConfigapiDeleteResponseApplicationJson_Ocs);
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

abstract mixin class $ConfigapiCreateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace($ConfigapiCreateResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function($ConfigapiCreateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  String? get configID;
  set configID(String? configID);
}

class _$ConfigapiCreateResponseApplicationJson_Ocs_Data extends ConfigapiCreateResponseApplicationJson_Ocs_Data {
  @override
  final String configID;

  factory _$ConfigapiCreateResponseApplicationJson_Ocs_Data(
          [void Function(ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$ConfigapiCreateResponseApplicationJson_Ocs_Data._({required this.configID}) : super._() {
    BuiltValueNullFieldError.checkNotNull(configID, r'ConfigapiCreateResponseApplicationJson_Ocs_Data', 'configID');
  }

  @override
  ConfigapiCreateResponseApplicationJson_Ocs_Data rebuild(
          void Function(ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiCreateResponseApplicationJson_Ocs_Data && configID == other.configID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, configID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfigapiCreateResponseApplicationJson_Ocs_Data')..add('configID', configID))
        .toString();
  }
}

class ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<ConfigapiCreateResponseApplicationJson_Ocs_Data,
            ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder>,
        $ConfigapiCreateResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$ConfigapiCreateResponseApplicationJson_Ocs_Data? _$v;

  String? _configID;
  String? get configID => _$this._configID;
  set configID(covariant String? configID) => _$this._configID = configID;

  ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder();

  ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _configID = $v.configID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiCreateResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiCreateResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiCreateResponseApplicationJson_Ocs_Data build() => _build();

  _$ConfigapiCreateResponseApplicationJson_Ocs_Data _build() {
    final _$result = _$v ??
        _$ConfigapiCreateResponseApplicationJson_Ocs_Data._(
            configID: BuiltValueNullFieldError.checkNotNull(
                configID, r'ConfigapiCreateResponseApplicationJson_Ocs_Data', 'configID'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiCreateResponseApplicationJson_OcsInterfaceBuilder {
  void replace($ConfigapiCreateResponseApplicationJson_OcsInterface other);
  void update(void Function($ConfigapiCreateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder get data;
  set data(ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$ConfigapiCreateResponseApplicationJson_Ocs extends ConfigapiCreateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final ConfigapiCreateResponseApplicationJson_Ocs_Data data;

  factory _$ConfigapiCreateResponseApplicationJson_Ocs(
          [void Function(ConfigapiCreateResponseApplicationJson_OcsBuilder)? updates]) =>
      (ConfigapiCreateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ConfigapiCreateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ConfigapiCreateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ConfigapiCreateResponseApplicationJson_Ocs', 'data');
  }

  @override
  ConfigapiCreateResponseApplicationJson_Ocs rebuild(
          void Function(ConfigapiCreateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiCreateResponseApplicationJson_OcsBuilder toBuilder() =>
      ConfigapiCreateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiCreateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ConfigapiCreateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ConfigapiCreateResponseApplicationJson_OcsBuilder
    implements
        Builder<ConfigapiCreateResponseApplicationJson_Ocs, ConfigapiCreateResponseApplicationJson_OcsBuilder>,
        $ConfigapiCreateResponseApplicationJson_OcsInterfaceBuilder {
  _$ConfigapiCreateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder? _data;
  ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant ConfigapiCreateResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  ConfigapiCreateResponseApplicationJson_OcsBuilder();

  ConfigapiCreateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiCreateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiCreateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ConfigapiCreateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiCreateResponseApplicationJson_Ocs build() => _build();

  _$ConfigapiCreateResponseApplicationJson_Ocs _build() {
    _$ConfigapiCreateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ConfigapiCreateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiCreateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiCreateResponseApplicationJsonInterfaceBuilder {
  void replace($ConfigapiCreateResponseApplicationJsonInterface other);
  void update(void Function($ConfigapiCreateResponseApplicationJsonInterfaceBuilder) updates);
  ConfigapiCreateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ConfigapiCreateResponseApplicationJson_OcsBuilder? ocs);
}

class _$ConfigapiCreateResponseApplicationJson extends ConfigapiCreateResponseApplicationJson {
  @override
  final ConfigapiCreateResponseApplicationJson_Ocs ocs;

  factory _$ConfigapiCreateResponseApplicationJson(
          [void Function(ConfigapiCreateResponseApplicationJsonBuilder)? updates]) =>
      (ConfigapiCreateResponseApplicationJsonBuilder()..update(updates))._build();

  _$ConfigapiCreateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ConfigapiCreateResponseApplicationJson', 'ocs');
  }

  @override
  ConfigapiCreateResponseApplicationJson rebuild(
          void Function(ConfigapiCreateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiCreateResponseApplicationJsonBuilder toBuilder() =>
      ConfigapiCreateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiCreateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ConfigapiCreateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ConfigapiCreateResponseApplicationJsonBuilder
    implements
        Builder<ConfigapiCreateResponseApplicationJson, ConfigapiCreateResponseApplicationJsonBuilder>,
        $ConfigapiCreateResponseApplicationJsonInterfaceBuilder {
  _$ConfigapiCreateResponseApplicationJson? _$v;

  ConfigapiCreateResponseApplicationJson_OcsBuilder? _ocs;
  ConfigapiCreateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ConfigapiCreateResponseApplicationJson_OcsBuilder();
  set ocs(covariant ConfigapiCreateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ConfigapiCreateResponseApplicationJsonBuilder();

  ConfigapiCreateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiCreateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiCreateResponseApplicationJson;
  }

  @override
  void update(void Function(ConfigapiCreateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiCreateResponseApplicationJson build() => _build();

  _$ConfigapiCreateResponseApplicationJson _build() {
    _$ConfigapiCreateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ConfigapiCreateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiCreateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiShowResponseApplicationJson_OcsInterfaceBuilder {
  void replace($ConfigapiShowResponseApplicationJson_OcsInterface other);
  void update(void Function($ConfigapiShowResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  MapBuilder<String, JsonObject> get data;
  set data(MapBuilder<String, JsonObject>? data);
}

class _$ConfigapiShowResponseApplicationJson_Ocs extends ConfigapiShowResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltMap<String, JsonObject> data;

  factory _$ConfigapiShowResponseApplicationJson_Ocs(
          [void Function(ConfigapiShowResponseApplicationJson_OcsBuilder)? updates]) =>
      (ConfigapiShowResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ConfigapiShowResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ConfigapiShowResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ConfigapiShowResponseApplicationJson_Ocs', 'data');
  }

  @override
  ConfigapiShowResponseApplicationJson_Ocs rebuild(
          void Function(ConfigapiShowResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiShowResponseApplicationJson_OcsBuilder toBuilder() =>
      ConfigapiShowResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiShowResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ConfigapiShowResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ConfigapiShowResponseApplicationJson_OcsBuilder
    implements
        Builder<ConfigapiShowResponseApplicationJson_Ocs, ConfigapiShowResponseApplicationJson_OcsBuilder>,
        $ConfigapiShowResponseApplicationJson_OcsInterfaceBuilder {
  _$ConfigapiShowResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  MapBuilder<String, JsonObject>? _data;
  MapBuilder<String, JsonObject> get data => _$this._data ??= MapBuilder<String, JsonObject>();
  set data(covariant MapBuilder<String, JsonObject>? data) => _$this._data = data;

  ConfigapiShowResponseApplicationJson_OcsBuilder();

  ConfigapiShowResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiShowResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiShowResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ConfigapiShowResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiShowResponseApplicationJson_Ocs build() => _build();

  _$ConfigapiShowResponseApplicationJson_Ocs _build() {
    _$ConfigapiShowResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$ConfigapiShowResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiShowResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiShowResponseApplicationJsonInterfaceBuilder {
  void replace($ConfigapiShowResponseApplicationJsonInterface other);
  void update(void Function($ConfigapiShowResponseApplicationJsonInterfaceBuilder) updates);
  ConfigapiShowResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ConfigapiShowResponseApplicationJson_OcsBuilder? ocs);
}

class _$ConfigapiShowResponseApplicationJson extends ConfigapiShowResponseApplicationJson {
  @override
  final ConfigapiShowResponseApplicationJson_Ocs ocs;

  factory _$ConfigapiShowResponseApplicationJson(
          [void Function(ConfigapiShowResponseApplicationJsonBuilder)? updates]) =>
      (ConfigapiShowResponseApplicationJsonBuilder()..update(updates))._build();

  _$ConfigapiShowResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ConfigapiShowResponseApplicationJson', 'ocs');
  }

  @override
  ConfigapiShowResponseApplicationJson rebuild(void Function(ConfigapiShowResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiShowResponseApplicationJsonBuilder toBuilder() =>
      ConfigapiShowResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiShowResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ConfigapiShowResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ConfigapiShowResponseApplicationJsonBuilder
    implements
        Builder<ConfigapiShowResponseApplicationJson, ConfigapiShowResponseApplicationJsonBuilder>,
        $ConfigapiShowResponseApplicationJsonInterfaceBuilder {
  _$ConfigapiShowResponseApplicationJson? _$v;

  ConfigapiShowResponseApplicationJson_OcsBuilder? _ocs;
  ConfigapiShowResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ConfigapiShowResponseApplicationJson_OcsBuilder();
  set ocs(covariant ConfigapiShowResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ConfigapiShowResponseApplicationJsonBuilder();

  ConfigapiShowResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiShowResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiShowResponseApplicationJson;
  }

  @override
  void update(void Function(ConfigapiShowResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiShowResponseApplicationJson build() => _build();

  _$ConfigapiShowResponseApplicationJson _build() {
    _$ConfigapiShowResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ConfigapiShowResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiShowResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiModifyResponseApplicationJson_OcsInterfaceBuilder {
  void replace($ConfigapiModifyResponseApplicationJson_OcsInterface other);
  void update(void Function($ConfigapiModifyResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$ConfigapiModifyResponseApplicationJson_Ocs extends ConfigapiModifyResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$ConfigapiModifyResponseApplicationJson_Ocs(
          [void Function(ConfigapiModifyResponseApplicationJson_OcsBuilder)? updates]) =>
      (ConfigapiModifyResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ConfigapiModifyResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ConfigapiModifyResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ConfigapiModifyResponseApplicationJson_Ocs', 'data');
  }

  @override
  ConfigapiModifyResponseApplicationJson_Ocs rebuild(
          void Function(ConfigapiModifyResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiModifyResponseApplicationJson_OcsBuilder toBuilder() =>
      ConfigapiModifyResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiModifyResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ConfigapiModifyResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ConfigapiModifyResponseApplicationJson_OcsBuilder
    implements
        Builder<ConfigapiModifyResponseApplicationJson_Ocs, ConfigapiModifyResponseApplicationJson_OcsBuilder>,
        $ConfigapiModifyResponseApplicationJson_OcsInterfaceBuilder {
  _$ConfigapiModifyResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ConfigapiModifyResponseApplicationJson_OcsBuilder();

  ConfigapiModifyResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiModifyResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiModifyResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ConfigapiModifyResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiModifyResponseApplicationJson_Ocs build() => _build();

  _$ConfigapiModifyResponseApplicationJson_Ocs _build() {
    _$ConfigapiModifyResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ConfigapiModifyResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(data, r'ConfigapiModifyResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiModifyResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiModifyResponseApplicationJsonInterfaceBuilder {
  void replace($ConfigapiModifyResponseApplicationJsonInterface other);
  void update(void Function($ConfigapiModifyResponseApplicationJsonInterfaceBuilder) updates);
  ConfigapiModifyResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ConfigapiModifyResponseApplicationJson_OcsBuilder? ocs);
}

class _$ConfigapiModifyResponseApplicationJson extends ConfigapiModifyResponseApplicationJson {
  @override
  final ConfigapiModifyResponseApplicationJson_Ocs ocs;

  factory _$ConfigapiModifyResponseApplicationJson(
          [void Function(ConfigapiModifyResponseApplicationJsonBuilder)? updates]) =>
      (ConfigapiModifyResponseApplicationJsonBuilder()..update(updates))._build();

  _$ConfigapiModifyResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ConfigapiModifyResponseApplicationJson', 'ocs');
  }

  @override
  ConfigapiModifyResponseApplicationJson rebuild(
          void Function(ConfigapiModifyResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiModifyResponseApplicationJsonBuilder toBuilder() =>
      ConfigapiModifyResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiModifyResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ConfigapiModifyResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ConfigapiModifyResponseApplicationJsonBuilder
    implements
        Builder<ConfigapiModifyResponseApplicationJson, ConfigapiModifyResponseApplicationJsonBuilder>,
        $ConfigapiModifyResponseApplicationJsonInterfaceBuilder {
  _$ConfigapiModifyResponseApplicationJson? _$v;

  ConfigapiModifyResponseApplicationJson_OcsBuilder? _ocs;
  ConfigapiModifyResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ConfigapiModifyResponseApplicationJson_OcsBuilder();
  set ocs(covariant ConfigapiModifyResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ConfigapiModifyResponseApplicationJsonBuilder();

  ConfigapiModifyResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiModifyResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiModifyResponseApplicationJson;
  }

  @override
  void update(void Function(ConfigapiModifyResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiModifyResponseApplicationJson build() => _build();

  _$ConfigapiModifyResponseApplicationJson _build() {
    _$ConfigapiModifyResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ConfigapiModifyResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiModifyResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiDeleteResponseApplicationJson_OcsInterfaceBuilder {
  void replace($ConfigapiDeleteResponseApplicationJson_OcsInterface other);
  void update(void Function($ConfigapiDeleteResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$ConfigapiDeleteResponseApplicationJson_Ocs extends ConfigapiDeleteResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$ConfigapiDeleteResponseApplicationJson_Ocs(
          [void Function(ConfigapiDeleteResponseApplicationJson_OcsBuilder)? updates]) =>
      (ConfigapiDeleteResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$ConfigapiDeleteResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ConfigapiDeleteResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ConfigapiDeleteResponseApplicationJson_Ocs', 'data');
  }

  @override
  ConfigapiDeleteResponseApplicationJson_Ocs rebuild(
          void Function(ConfigapiDeleteResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiDeleteResponseApplicationJson_OcsBuilder toBuilder() =>
      ConfigapiDeleteResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiDeleteResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ConfigapiDeleteResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ConfigapiDeleteResponseApplicationJson_OcsBuilder
    implements
        Builder<ConfigapiDeleteResponseApplicationJson_Ocs, ConfigapiDeleteResponseApplicationJson_OcsBuilder>,
        $ConfigapiDeleteResponseApplicationJson_OcsInterfaceBuilder {
  _$ConfigapiDeleteResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ConfigapiDeleteResponseApplicationJson_OcsBuilder();

  ConfigapiDeleteResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiDeleteResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiDeleteResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(ConfigapiDeleteResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiDeleteResponseApplicationJson_Ocs build() => _build();

  _$ConfigapiDeleteResponseApplicationJson_Ocs _build() {
    _$ConfigapiDeleteResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$ConfigapiDeleteResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(data, r'ConfigapiDeleteResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiDeleteResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $ConfigapiDeleteResponseApplicationJsonInterfaceBuilder {
  void replace($ConfigapiDeleteResponseApplicationJsonInterface other);
  void update(void Function($ConfigapiDeleteResponseApplicationJsonInterfaceBuilder) updates);
  ConfigapiDeleteResponseApplicationJson_OcsBuilder get ocs;
  set ocs(ConfigapiDeleteResponseApplicationJson_OcsBuilder? ocs);
}

class _$ConfigapiDeleteResponseApplicationJson extends ConfigapiDeleteResponseApplicationJson {
  @override
  final ConfigapiDeleteResponseApplicationJson_Ocs ocs;

  factory _$ConfigapiDeleteResponseApplicationJson(
          [void Function(ConfigapiDeleteResponseApplicationJsonBuilder)? updates]) =>
      (ConfigapiDeleteResponseApplicationJsonBuilder()..update(updates))._build();

  _$ConfigapiDeleteResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ConfigapiDeleteResponseApplicationJson', 'ocs');
  }

  @override
  ConfigapiDeleteResponseApplicationJson rebuild(
          void Function(ConfigapiDeleteResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigapiDeleteResponseApplicationJsonBuilder toBuilder() =>
      ConfigapiDeleteResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigapiDeleteResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ConfigapiDeleteResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class ConfigapiDeleteResponseApplicationJsonBuilder
    implements
        Builder<ConfigapiDeleteResponseApplicationJson, ConfigapiDeleteResponseApplicationJsonBuilder>,
        $ConfigapiDeleteResponseApplicationJsonInterfaceBuilder {
  _$ConfigapiDeleteResponseApplicationJson? _$v;

  ConfigapiDeleteResponseApplicationJson_OcsBuilder? _ocs;
  ConfigapiDeleteResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= ConfigapiDeleteResponseApplicationJson_OcsBuilder();
  set ocs(covariant ConfigapiDeleteResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  ConfigapiDeleteResponseApplicationJsonBuilder();

  ConfigapiDeleteResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConfigapiDeleteResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigapiDeleteResponseApplicationJson;
  }

  @override
  void update(void Function(ConfigapiDeleteResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigapiDeleteResponseApplicationJson build() => _build();

  _$ConfigapiDeleteResponseApplicationJson _build() {
    _$ConfigapiDeleteResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$ConfigapiDeleteResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ConfigapiDeleteResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
