// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_external.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FilesExternalMount_Type _$filesExternalMountTypeDir = FilesExternalMount_Type._('dir');

FilesExternalMount_Type _$valueOfFilesExternalMount_Type(String name) {
  switch (name) {
    case 'dir':
      return _$filesExternalMountTypeDir;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<FilesExternalMount_Type> _$filesExternalMountTypeValues =
    BuiltSet<FilesExternalMount_Type>(const <FilesExternalMount_Type>[
  _$filesExternalMountTypeDir,
]);

const FilesExternalMount_Scope _$filesExternalMountScopeSystem = FilesExternalMount_Scope._('system');
const FilesExternalMount_Scope _$filesExternalMountScopePersonal = FilesExternalMount_Scope._('personal');

FilesExternalMount_Scope _$valueOfFilesExternalMount_Scope(String name) {
  switch (name) {
    case 'system':
      return _$filesExternalMountScopeSystem;
    case 'personal':
      return _$filesExternalMountScopePersonal;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<FilesExternalMount_Scope> _$filesExternalMountScopeValues =
    BuiltSet<FilesExternalMount_Scope>(const <FilesExternalMount_Scope>[
  _$filesExternalMountScopeSystem,
  _$filesExternalMountScopePersonal,
]);

const FilesExternalStorageConfig_Type _$filesExternalStorageConfigTypePersonal =
    FilesExternalStorageConfig_Type._('personal');
const FilesExternalStorageConfig_Type _$filesExternalStorageConfigTypeSystem =
    FilesExternalStorageConfig_Type._('system');

FilesExternalStorageConfig_Type _$valueOfFilesExternalStorageConfig_Type(String name) {
  switch (name) {
    case 'personal':
      return _$filesExternalStorageConfigTypePersonal;
    case 'system':
      return _$filesExternalStorageConfigTypeSystem;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<FilesExternalStorageConfig_Type> _$filesExternalStorageConfigTypeValues =
    BuiltSet<FilesExternalStorageConfig_Type>(const <FilesExternalStorageConfig_Type>[
  _$filesExternalStorageConfigTypePersonal,
  _$filesExternalStorageConfigTypeSystem,
]);

Serializer<FilesExternalOCSMeta> _$filesExternalOCSMetaSerializer = _$FilesExternalOCSMetaSerializer();
Serializer<FilesExternalMount_Type> _$filesExternalMountTypeSerializer = _$FilesExternalMount_TypeSerializer();
Serializer<FilesExternalMount_Scope> _$filesExternalMountScopeSerializer = _$FilesExternalMount_ScopeSerializer();
Serializer<FilesExternalStorageConfig_Type> _$filesExternalStorageConfigTypeSerializer =
    _$FilesExternalStorageConfig_TypeSerializer();
Serializer<FilesExternalStorageConfig> _$filesExternalStorageConfigSerializer =
    _$FilesExternalStorageConfigSerializer();
Serializer<FilesExternalMount> _$filesExternalMountSerializer = _$FilesExternalMountSerializer();
Serializer<FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs>
    _$filesExternalApiGetUserMountsResponse200ApplicationJsonOcsSerializer =
    _$FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsSerializer();
Serializer<FilesExternalApiGetUserMountsResponse200ApplicationJson>
    _$filesExternalApiGetUserMountsResponse200ApplicationJsonSerializer =
    _$FilesExternalApiGetUserMountsResponse200ApplicationJsonSerializer();

class _$FilesExternalOCSMetaSerializer implements StructuredSerializer<FilesExternalOCSMeta> {
  @override
  final Iterable<Type> types = const [FilesExternalOCSMeta, _$FilesExternalOCSMeta];
  @override
  final String wireName = 'FilesExternalOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesExternalOCSMeta object,
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
  FilesExternalOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesExternalOCSMetaBuilder();

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

class _$FilesExternalMount_TypeSerializer implements PrimitiveSerializer<FilesExternalMount_Type> {
  @override
  final Iterable<Type> types = const <Type>[FilesExternalMount_Type];
  @override
  final String wireName = 'FilesExternalMount_Type';

  @override
  Object serialize(Serializers serializers, FilesExternalMount_Type object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  FilesExternalMount_Type deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FilesExternalMount_Type.valueOf(serialized as String);
}

class _$FilesExternalMount_ScopeSerializer implements PrimitiveSerializer<FilesExternalMount_Scope> {
  @override
  final Iterable<Type> types = const <Type>[FilesExternalMount_Scope];
  @override
  final String wireName = 'FilesExternalMount_Scope';

  @override
  Object serialize(Serializers serializers, FilesExternalMount_Scope object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  FilesExternalMount_Scope deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FilesExternalMount_Scope.valueOf(serialized as String);
}

class _$FilesExternalStorageConfig_TypeSerializer implements PrimitiveSerializer<FilesExternalStorageConfig_Type> {
  @override
  final Iterable<Type> types = const <Type>[FilesExternalStorageConfig_Type];
  @override
  final String wireName = 'FilesExternalStorageConfig_Type';

  @override
  Object serialize(Serializers serializers, FilesExternalStorageConfig_Type object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  FilesExternalStorageConfig_Type deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FilesExternalStorageConfig_Type.valueOf(serialized as String);
}

class _$FilesExternalStorageConfigSerializer implements StructuredSerializer<FilesExternalStorageConfig> {
  @override
  final Iterable<Type> types = const [FilesExternalStorageConfig, _$FilesExternalStorageConfig];
  @override
  final String wireName = 'FilesExternalStorageConfig';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesExternalStorageConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'authMechanism',
      serializers.serialize(object.authMechanism, specifiedType: const FullType(String)),
      'backend',
      serializers.serialize(object.backend, specifiedType: const FullType(String)),
      'backendOptions',
      serializers.serialize(object.backendOptions,
          specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])),
      'mountPoint',
      serializers.serialize(object.mountPoint, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(FilesExternalStorageConfig_Type)),
      'userProvided',
      serializers.serialize(object.userProvided, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.applicableGroups;
    if (value != null) {
      result
        ..add('applicableGroups')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.applicableUsers;
    if (value != null) {
      result
        ..add('applicableUsers')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.mountOptions;
    if (value != null) {
      result
        ..add('mountOptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    value = object.priority;
    if (value != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.statusMessage;
    if (value != null) {
      result
        ..add('statusMessage')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FilesExternalStorageConfig deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesExternalStorageConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'applicableGroups':
          result.applicableGroups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'applicableUsers':
          result.applicableUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'authMechanism':
          result.authMechanism = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'backend':
          result.backend = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'backendOptions':
          result.backendOptions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'mountOptions':
          result.mountOptions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'mountPoint':
          result.mountPoint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'statusMessage':
          result.statusMessage = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(FilesExternalStorageConfig_Type))!
              as FilesExternalStorageConfig_Type;
          break;
        case 'userProvided':
          result.userProvided = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$FilesExternalMountSerializer implements StructuredSerializer<FilesExternalMount> {
  @override
  final Iterable<Type> types = const [FilesExternalMount, _$FilesExternalMount];
  @override
  final String wireName = 'FilesExternalMount';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesExternalMount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(FilesExternalMount_Type)),
      'backend',
      serializers.serialize(object.backend, specifiedType: const FullType(String)),
      'scope',
      serializers.serialize(object.scope, specifiedType: const FullType(FilesExternalMount_Scope)),
      'permissions',
      serializers.serialize(object.permissions, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'class',
      serializers.serialize(object.$class, specifiedType: const FullType(String)),
      'config',
      serializers.serialize(object.config, specifiedType: const FullType(FilesExternalStorageConfig)),
    ];

    return result;
  }

  @override
  FilesExternalMount deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesExternalMountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'path':
          result.path = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(FilesExternalMount_Type))!
              as FilesExternalMount_Type;
          break;
        case 'backend':
          result.backend = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value, specifiedType: const FullType(FilesExternalMount_Scope))!
              as FilesExternalMount_Scope;
          break;
        case 'permissions':
          result.permissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'class':
          result.$class = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'config':
          result.config.replace(serializers.deserialize(value,
              specifiedType: const FullType(FilesExternalStorageConfig))! as FilesExternalStorageConfig);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs,
    _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(FilesExternalOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(FilesExternalMount)])),
    ];

    return result;
  }

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(FilesExternalOCSMeta))!
              as FilesExternalOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(FilesExternalMount)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$FilesExternalApiGetUserMountsResponse200ApplicationJsonSerializer
    implements StructuredSerializer<FilesExternalApiGetUserMountsResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    FilesExternalApiGetUserMountsResponse200ApplicationJson,
    _$FilesExternalApiGetUserMountsResponse200ApplicationJson
  ];
  @override
  final String wireName = 'FilesExternalApiGetUserMountsResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesExternalApiGetUserMountsResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs))!
              as FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class FilesExternalOCSMetaInterfaceBuilder {
  void replace(FilesExternalOCSMetaInterface other);
  void update(void Function(FilesExternalOCSMetaInterfaceBuilder) updates);
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

class _$FilesExternalOCSMeta extends FilesExternalOCSMeta {
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

  factory _$FilesExternalOCSMeta([void Function(FilesExternalOCSMetaBuilder)? updates]) =>
      (FilesExternalOCSMetaBuilder()..update(updates))._build();

  _$FilesExternalOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'FilesExternalOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'FilesExternalOCSMeta', 'statuscode');
  }

  @override
  FilesExternalOCSMeta rebuild(void Function(FilesExternalOCSMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesExternalOCSMetaBuilder toBuilder() => FilesExternalOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesExternalOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'FilesExternalOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class FilesExternalOCSMetaBuilder
    implements Builder<FilesExternalOCSMeta, FilesExternalOCSMetaBuilder>, FilesExternalOCSMetaInterfaceBuilder {
  _$FilesExternalOCSMeta? _$v;

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

  FilesExternalOCSMetaBuilder();

  FilesExternalOCSMetaBuilder get _$this {
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
  void replace(covariant FilesExternalOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesExternalOCSMeta;
  }

  @override
  void update(void Function(FilesExternalOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesExternalOCSMeta build() => _build();

  _$FilesExternalOCSMeta _build() {
    final _$result = _$v ??
        _$FilesExternalOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'FilesExternalOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'FilesExternalOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesExternalStorageConfigInterfaceBuilder {
  void replace(FilesExternalStorageConfigInterface other);
  void update(void Function(FilesExternalStorageConfigInterfaceBuilder) updates);
  ListBuilder<String> get applicableGroups;
  set applicableGroups(ListBuilder<String>? applicableGroups);

  ListBuilder<String> get applicableUsers;
  set applicableUsers(ListBuilder<String>? applicableUsers);

  String? get authMechanism;
  set authMechanism(String? authMechanism);

  String? get backend;
  set backend(String? backend);

  MapBuilder<String, JsonObject> get backendOptions;
  set backendOptions(MapBuilder<String, JsonObject>? backendOptions);

  int? get id;
  set id(int? id);

  MapBuilder<String, JsonObject> get mountOptions;
  set mountOptions(MapBuilder<String, JsonObject>? mountOptions);

  String? get mountPoint;
  set mountPoint(String? mountPoint);

  int? get priority;
  set priority(int? priority);

  int? get status;
  set status(int? status);

  String? get statusMessage;
  set statusMessage(String? statusMessage);

  FilesExternalStorageConfig_Type? get type;
  set type(FilesExternalStorageConfig_Type? type);

  bool? get userProvided;
  set userProvided(bool? userProvided);
}

class _$FilesExternalStorageConfig extends FilesExternalStorageConfig {
  @override
  final BuiltList<String>? applicableGroups;
  @override
  final BuiltList<String>? applicableUsers;
  @override
  final String authMechanism;
  @override
  final String backend;
  @override
  final BuiltMap<String, JsonObject> backendOptions;
  @override
  final int? id;
  @override
  final BuiltMap<String, JsonObject>? mountOptions;
  @override
  final String mountPoint;
  @override
  final int? priority;
  @override
  final int? status;
  @override
  final String? statusMessage;
  @override
  final FilesExternalStorageConfig_Type type;
  @override
  final bool userProvided;

  factory _$FilesExternalStorageConfig([void Function(FilesExternalStorageConfigBuilder)? updates]) =>
      (FilesExternalStorageConfigBuilder()..update(updates))._build();

  _$FilesExternalStorageConfig._(
      {this.applicableGroups,
      this.applicableUsers,
      required this.authMechanism,
      required this.backend,
      required this.backendOptions,
      this.id,
      this.mountOptions,
      required this.mountPoint,
      this.priority,
      this.status,
      this.statusMessage,
      required this.type,
      required this.userProvided})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(authMechanism, r'FilesExternalStorageConfig', 'authMechanism');
    BuiltValueNullFieldError.checkNotNull(backend, r'FilesExternalStorageConfig', 'backend');
    BuiltValueNullFieldError.checkNotNull(backendOptions, r'FilesExternalStorageConfig', 'backendOptions');
    BuiltValueNullFieldError.checkNotNull(mountPoint, r'FilesExternalStorageConfig', 'mountPoint');
    BuiltValueNullFieldError.checkNotNull(type, r'FilesExternalStorageConfig', 'type');
    BuiltValueNullFieldError.checkNotNull(userProvided, r'FilesExternalStorageConfig', 'userProvided');
  }

  @override
  FilesExternalStorageConfig rebuild(void Function(FilesExternalStorageConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesExternalStorageConfigBuilder toBuilder() => FilesExternalStorageConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesExternalStorageConfig &&
        applicableGroups == other.applicableGroups &&
        applicableUsers == other.applicableUsers &&
        authMechanism == other.authMechanism &&
        backend == other.backend &&
        backendOptions == other.backendOptions &&
        id == other.id &&
        mountOptions == other.mountOptions &&
        mountPoint == other.mountPoint &&
        priority == other.priority &&
        status == other.status &&
        statusMessage == other.statusMessage &&
        type == other.type &&
        userProvided == other.userProvided;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, applicableGroups.hashCode);
    _$hash = $jc(_$hash, applicableUsers.hashCode);
    _$hash = $jc(_$hash, authMechanism.hashCode);
    _$hash = $jc(_$hash, backend.hashCode);
    _$hash = $jc(_$hash, backendOptions.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, mountOptions.hashCode);
    _$hash = $jc(_$hash, mountPoint.hashCode);
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, statusMessage.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, userProvided.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesExternalStorageConfig')
          ..add('applicableGroups', applicableGroups)
          ..add('applicableUsers', applicableUsers)
          ..add('authMechanism', authMechanism)
          ..add('backend', backend)
          ..add('backendOptions', backendOptions)
          ..add('id', id)
          ..add('mountOptions', mountOptions)
          ..add('mountPoint', mountPoint)
          ..add('priority', priority)
          ..add('status', status)
          ..add('statusMessage', statusMessage)
          ..add('type', type)
          ..add('userProvided', userProvided))
        .toString();
  }
}

class FilesExternalStorageConfigBuilder
    implements
        Builder<FilesExternalStorageConfig, FilesExternalStorageConfigBuilder>,
        FilesExternalStorageConfigInterfaceBuilder {
  _$FilesExternalStorageConfig? _$v;

  ListBuilder<String>? _applicableGroups;
  ListBuilder<String> get applicableGroups => _$this._applicableGroups ??= ListBuilder<String>();
  set applicableGroups(covariant ListBuilder<String>? applicableGroups) => _$this._applicableGroups = applicableGroups;

  ListBuilder<String>? _applicableUsers;
  ListBuilder<String> get applicableUsers => _$this._applicableUsers ??= ListBuilder<String>();
  set applicableUsers(covariant ListBuilder<String>? applicableUsers) => _$this._applicableUsers = applicableUsers;

  String? _authMechanism;
  String? get authMechanism => _$this._authMechanism;
  set authMechanism(covariant String? authMechanism) => _$this._authMechanism = authMechanism;

  String? _backend;
  String? get backend => _$this._backend;
  set backend(covariant String? backend) => _$this._backend = backend;

  MapBuilder<String, JsonObject>? _backendOptions;
  MapBuilder<String, JsonObject> get backendOptions => _$this._backendOptions ??= MapBuilder<String, JsonObject>();
  set backendOptions(covariant MapBuilder<String, JsonObject>? backendOptions) =>
      _$this._backendOptions = backendOptions;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  MapBuilder<String, JsonObject>? _mountOptions;
  MapBuilder<String, JsonObject> get mountOptions => _$this._mountOptions ??= MapBuilder<String, JsonObject>();
  set mountOptions(covariant MapBuilder<String, JsonObject>? mountOptions) => _$this._mountOptions = mountOptions;

  String? _mountPoint;
  String? get mountPoint => _$this._mountPoint;
  set mountPoint(covariant String? mountPoint) => _$this._mountPoint = mountPoint;

  int? _priority;
  int? get priority => _$this._priority;
  set priority(covariant int? priority) => _$this._priority = priority;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

  String? _statusMessage;
  String? get statusMessage => _$this._statusMessage;
  set statusMessage(covariant String? statusMessage) => _$this._statusMessage = statusMessage;

  FilesExternalStorageConfig_Type? _type;
  FilesExternalStorageConfig_Type? get type => _$this._type;
  set type(covariant FilesExternalStorageConfig_Type? type) => _$this._type = type;

  bool? _userProvided;
  bool? get userProvided => _$this._userProvided;
  set userProvided(covariant bool? userProvided) => _$this._userProvided = userProvided;

  FilesExternalStorageConfigBuilder();

  FilesExternalStorageConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _applicableGroups = $v.applicableGroups?.toBuilder();
      _applicableUsers = $v.applicableUsers?.toBuilder();
      _authMechanism = $v.authMechanism;
      _backend = $v.backend;
      _backendOptions = $v.backendOptions.toBuilder();
      _id = $v.id;
      _mountOptions = $v.mountOptions?.toBuilder();
      _mountPoint = $v.mountPoint;
      _priority = $v.priority;
      _status = $v.status;
      _statusMessage = $v.statusMessage;
      _type = $v.type;
      _userProvided = $v.userProvided;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesExternalStorageConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesExternalStorageConfig;
  }

  @override
  void update(void Function(FilesExternalStorageConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesExternalStorageConfig build() => _build();

  _$FilesExternalStorageConfig _build() {
    _$FilesExternalStorageConfig _$result;
    try {
      _$result = _$v ??
          _$FilesExternalStorageConfig._(
              applicableGroups: _applicableGroups?.build(),
              applicableUsers: _applicableUsers?.build(),
              authMechanism:
                  BuiltValueNullFieldError.checkNotNull(authMechanism, r'FilesExternalStorageConfig', 'authMechanism'),
              backend: BuiltValueNullFieldError.checkNotNull(backend, r'FilesExternalStorageConfig', 'backend'),
              backendOptions: backendOptions.build(),
              id: id,
              mountOptions: _mountOptions?.build(),
              mountPoint:
                  BuiltValueNullFieldError.checkNotNull(mountPoint, r'FilesExternalStorageConfig', 'mountPoint'),
              priority: priority,
              status: status,
              statusMessage: statusMessage,
              type: BuiltValueNullFieldError.checkNotNull(type, r'FilesExternalStorageConfig', 'type'),
              userProvided:
                  BuiltValueNullFieldError.checkNotNull(userProvided, r'FilesExternalStorageConfig', 'userProvided'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'applicableGroups';
        _applicableGroups?.build();
        _$failedField = 'applicableUsers';
        _applicableUsers?.build();

        _$failedField = 'backendOptions';
        backendOptions.build();

        _$failedField = 'mountOptions';
        _mountOptions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesExternalStorageConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesExternalMountInterfaceBuilder {
  void replace(FilesExternalMountInterface other);
  void update(void Function(FilesExternalMountInterfaceBuilder) updates);
  String? get name;
  set name(String? name);

  String? get path;
  set path(String? path);

  FilesExternalMount_Type? get type;
  set type(FilesExternalMount_Type? type);

  String? get backend;
  set backend(String? backend);

  FilesExternalMount_Scope? get scope;
  set scope(FilesExternalMount_Scope? scope);

  int? get permissions;
  set permissions(int? permissions);

  int? get id;
  set id(int? id);

  String? get $class;
  set $class(String? $class);

  FilesExternalStorageConfigBuilder get config;
  set config(FilesExternalStorageConfigBuilder? config);
}

class _$FilesExternalMount extends FilesExternalMount {
  @override
  final String name;
  @override
  final String path;
  @override
  final FilesExternalMount_Type type;
  @override
  final String backend;
  @override
  final FilesExternalMount_Scope scope;
  @override
  final int permissions;
  @override
  final int id;
  @override
  final String $class;
  @override
  final FilesExternalStorageConfig config;

  factory _$FilesExternalMount([void Function(FilesExternalMountBuilder)? updates]) =>
      (FilesExternalMountBuilder()..update(updates))._build();

  _$FilesExternalMount._(
      {required this.name,
      required this.path,
      required this.type,
      required this.backend,
      required this.scope,
      required this.permissions,
      required this.id,
      required this.$class,
      required this.config})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'FilesExternalMount', 'name');
    BuiltValueNullFieldError.checkNotNull(path, r'FilesExternalMount', 'path');
    BuiltValueNullFieldError.checkNotNull(type, r'FilesExternalMount', 'type');
    BuiltValueNullFieldError.checkNotNull(backend, r'FilesExternalMount', 'backend');
    BuiltValueNullFieldError.checkNotNull(scope, r'FilesExternalMount', 'scope');
    BuiltValueNullFieldError.checkNotNull(permissions, r'FilesExternalMount', 'permissions');
    BuiltValueNullFieldError.checkNotNull(id, r'FilesExternalMount', 'id');
    BuiltValueNullFieldError.checkNotNull($class, r'FilesExternalMount', '\$class');
    BuiltValueNullFieldError.checkNotNull(config, r'FilesExternalMount', 'config');
  }

  @override
  FilesExternalMount rebuild(void Function(FilesExternalMountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesExternalMountBuilder toBuilder() => FilesExternalMountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesExternalMount &&
        name == other.name &&
        path == other.path &&
        type == other.type &&
        backend == other.backend &&
        scope == other.scope &&
        permissions == other.permissions &&
        id == other.id &&
        $class == other.$class &&
        config == other.config;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, backend.hashCode);
    _$hash = $jc(_$hash, scope.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, $class.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesExternalMount')
          ..add('name', name)
          ..add('path', path)
          ..add('type', type)
          ..add('backend', backend)
          ..add('scope', scope)
          ..add('permissions', permissions)
          ..add('id', id)
          ..add('\$class', $class)
          ..add('config', config))
        .toString();
  }
}

class FilesExternalMountBuilder
    implements Builder<FilesExternalMount, FilesExternalMountBuilder>, FilesExternalMountInterfaceBuilder {
  _$FilesExternalMount? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  String? _path;
  String? get path => _$this._path;
  set path(covariant String? path) => _$this._path = path;

  FilesExternalMount_Type? _type;
  FilesExternalMount_Type? get type => _$this._type;
  set type(covariant FilesExternalMount_Type? type) => _$this._type = type;

  String? _backend;
  String? get backend => _$this._backend;
  set backend(covariant String? backend) => _$this._backend = backend;

  FilesExternalMount_Scope? _scope;
  FilesExternalMount_Scope? get scope => _$this._scope;
  set scope(covariant FilesExternalMount_Scope? scope) => _$this._scope = scope;

  int? _permissions;
  int? get permissions => _$this._permissions;
  set permissions(covariant int? permissions) => _$this._permissions = permissions;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _$class;
  String? get $class => _$this._$class;
  set $class(covariant String? $class) => _$this._$class = $class;

  FilesExternalStorageConfigBuilder? _config;
  FilesExternalStorageConfigBuilder get config => _$this._config ??= FilesExternalStorageConfigBuilder();
  set config(covariant FilesExternalStorageConfigBuilder? config) => _$this._config = config;

  FilesExternalMountBuilder();

  FilesExternalMountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _path = $v.path;
      _type = $v.type;
      _backend = $v.backend;
      _scope = $v.scope;
      _permissions = $v.permissions;
      _id = $v.id;
      _$class = $v.$class;
      _config = $v.config.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesExternalMount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesExternalMount;
  }

  @override
  void update(void Function(FilesExternalMountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesExternalMount build() => _build();

  _$FilesExternalMount _build() {
    _$FilesExternalMount _$result;
    try {
      _$result = _$v ??
          _$FilesExternalMount._(
              name: BuiltValueNullFieldError.checkNotNull(name, r'FilesExternalMount', 'name'),
              path: BuiltValueNullFieldError.checkNotNull(path, r'FilesExternalMount', 'path'),
              type: BuiltValueNullFieldError.checkNotNull(type, r'FilesExternalMount', 'type'),
              backend: BuiltValueNullFieldError.checkNotNull(backend, r'FilesExternalMount', 'backend'),
              scope: BuiltValueNullFieldError.checkNotNull(scope, r'FilesExternalMount', 'scope'),
              permissions: BuiltValueNullFieldError.checkNotNull(permissions, r'FilesExternalMount', 'permissions'),
              id: BuiltValueNullFieldError.checkNotNull(id, r'FilesExternalMount', 'id'),
              $class: BuiltValueNullFieldError.checkNotNull($class, r'FilesExternalMount', '\$class'),
              config: config.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'config';
        config.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'FilesExternalMount', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsInterface other);
  void update(void Function(FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  FilesExternalOCSMetaBuilder get meta;
  set meta(FilesExternalOCSMetaBuilder? meta);

  ListBuilder<FilesExternalMount> get data;
  set data(ListBuilder<FilesExternalMount>? data);
}

class _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs
    extends FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs {
  @override
  final FilesExternalOCSMeta meta;
  @override
  final BuiltList<FilesExternalMount> data;

  factory _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs(
          [void Function(FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs rebuild(
          void Function(FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder toBuilder() =>
      FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder
    implements
        Builder<FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs,
            FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder>,
        FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsInterfaceBuilder {
  _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs? _$v;

  FilesExternalOCSMetaBuilder? _meta;
  FilesExternalOCSMetaBuilder get meta => _$this._meta ??= FilesExternalOCSMetaBuilder();
  set meta(covariant FilesExternalOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<FilesExternalMount>? _data;
  ListBuilder<FilesExternalMount> get data => _$this._data ??= ListBuilder<FilesExternalMount>();
  set data(covariant ListBuilder<FilesExternalMount>? data) => _$this._data = data;

  FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder();

  FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs build() => _build();

  _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs _build() {
    _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FilesExternalApiGetUserMountsResponse200ApplicationJsonInterfaceBuilder {
  void replace(FilesExternalApiGetUserMountsResponse200ApplicationJsonInterface other);
  void update(void Function(FilesExternalApiGetUserMountsResponse200ApplicationJsonInterfaceBuilder) updates);
  FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$FilesExternalApiGetUserMountsResponse200ApplicationJson
    extends FilesExternalApiGetUserMountsResponse200ApplicationJson {
  @override
  final FilesExternalApiGetUserMountsResponse200ApplicationJson_Ocs ocs;

  factory _$FilesExternalApiGetUserMountsResponse200ApplicationJson(
          [void Function(FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder)? updates]) =>
      (FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$FilesExternalApiGetUserMountsResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'FilesExternalApiGetUserMountsResponse200ApplicationJson', 'ocs');
  }

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJson rebuild(
          void Function(FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder toBuilder() =>
      FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesExternalApiGetUserMountsResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'FilesExternalApiGetUserMountsResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder
    implements
        Builder<FilesExternalApiGetUserMountsResponse200ApplicationJson,
            FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder>,
        FilesExternalApiGetUserMountsResponse200ApplicationJsonInterfaceBuilder {
  _$FilesExternalApiGetUserMountsResponse200ApplicationJson? _$v;

  FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder? _ocs;
  FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant FilesExternalApiGetUserMountsResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder();

  FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FilesExternalApiGetUserMountsResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesExternalApiGetUserMountsResponse200ApplicationJson;
  }

  @override
  void update(void Function(FilesExternalApiGetUserMountsResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesExternalApiGetUserMountsResponse200ApplicationJson build() => _build();

  _$FilesExternalApiGetUserMountsResponse200ApplicationJson _build() {
    _$FilesExternalApiGetUserMountsResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$FilesExternalApiGetUserMountsResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FilesExternalApiGetUserMountsResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
