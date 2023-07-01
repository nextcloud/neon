// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserStatusClearAt_Type _$userStatusClearAtTypePeriod = UserStatusClearAt_Type._('period');
const UserStatusClearAt_Type _$userStatusClearAtTypeEndOf = UserStatusClearAt_Type._('endOf');

UserStatusClearAt_Type _$valueOfUserStatusClearAt_Type(String name) {
  switch (name) {
    case 'period':
      return _$userStatusClearAtTypePeriod;
    case 'endOf':
      return _$userStatusClearAtTypeEndOf;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserStatusClearAt_Type> _$userStatusClearAtTypeValues =
    BuiltSet<UserStatusClearAt_Type>(const <UserStatusClearAt_Type>[
  _$userStatusClearAtTypePeriod,
  _$userStatusClearAtTypeEndOf,
]);

const UserStatusClearAt_Time0 _$userStatusClearAtTime0Day = UserStatusClearAt_Time0._('day');
const UserStatusClearAt_Time0 _$userStatusClearAtTime0Week = UserStatusClearAt_Time0._('week');

UserStatusClearAt_Time0 _$valueOfUserStatusClearAt_Time0(String name) {
  switch (name) {
    case 'day':
      return _$userStatusClearAtTime0Day;
    case 'week':
      return _$userStatusClearAtTime0Week;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserStatusClearAt_Time0> _$userStatusClearAtTime0Values =
    BuiltSet<UserStatusClearAt_Time0>(const <UserStatusClearAt_Time0>[
  _$userStatusClearAtTime0Day,
  _$userStatusClearAtTime0Week,
]);

const UserStatusType _$userStatusTypeOnline = UserStatusType._('online');
const UserStatusType _$userStatusTypeOffline = UserStatusType._('offline');
const UserStatusType _$userStatusTypeDnd = UserStatusType._('dnd');
const UserStatusType _$userStatusTypeAway = UserStatusType._('away');
const UserStatusType _$userStatusTypeInvisible = UserStatusType._('invisible');

UserStatusType _$valueOfUserStatusType(String name) {
  switch (name) {
    case 'online':
      return _$userStatusTypeOnline;
    case 'offline':
      return _$userStatusTypeOffline;
    case 'dnd':
      return _$userStatusTypeDnd;
    case 'away':
      return _$userStatusTypeAway;
    case 'invisible':
      return _$userStatusTypeInvisible;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserStatusType> _$userStatusTypeValues = BuiltSet<UserStatusType>(const <UserStatusType>[
  _$userStatusTypeOnline,
  _$userStatusTypeOffline,
  _$userStatusTypeDnd,
  _$userStatusTypeAway,
  _$userStatusTypeInvisible,
]);

Serializers _$_serializers = (Serializers().toBuilder()
      ..add(UserStatusClearAt.serializer)
      ..add(UserStatusClearAt_Time.serializer)
      ..add(UserStatusClearAt_Time0.serializer)
      ..add(UserStatusClearAt_Type.serializer)
      ..add(UserStatusEmptyOCS.serializer)
      ..add(UserStatusEmptyOCS_Ocs.serializer)
      ..add(UserStatusGetPublicStatus.serializer)
      ..add(UserStatusGetPublicStatus_Ocs.serializer)
      ..add(UserStatusGetPublicStatus_Ocs_Data.serializer)
      ..add(UserStatusGetPublicStatuses.serializer)
      ..add(UserStatusGetPublicStatuses_Ocs.serializer)
      ..add(UserStatusGetStatus.serializer)
      ..add(UserStatusGetStatus_Ocs.serializer)
      ..add(UserStatusGetStatus_Ocs_Data.serializer)
      ..add(UserStatusHeartbeat.serializer)
      ..add(UserStatusHeartbeat_Ocs.serializer)
      ..add(UserStatusHeartbeat_Ocs_Data.serializer)
      ..add(UserStatusOCSMeta.serializer)
      ..add(UserStatusPredefinedStatus.serializer)
      ..add(UserStatusPredefinedStatus_ClearAt.serializer)
      ..add(UserStatusPredefinedStatuses.serializer)
      ..add(UserStatusPredefinedStatuses_Ocs.serializer)
      ..add(UserStatusPublicStatus.serializer)
      ..add(UserStatusPublicStatus_ClearAt.serializer)
      ..add(UserStatusStatus.serializer)
      ..add(UserStatusStatus1.serializer)
      ..add(UserStatusType.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(UserStatusPredefinedStatus)]),
          () => ListBuilder<UserStatusPredefinedStatus>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(UserStatusPublicStatus)]), () => ListBuilder<UserStatusPublicStatus>()))
    .build();
Serializer<UserStatusOCSMeta> _$userStatusOCSMetaSerializer = _$UserStatusOCSMetaSerializer();
Serializer<UserStatusClearAt_Type> _$userStatusClearAtTypeSerializer = _$UserStatusClearAt_TypeSerializer();
Serializer<UserStatusClearAt_Time0> _$userStatusClearAtTime0Serializer = _$UserStatusClearAt_Time0Serializer();
Serializer<UserStatusClearAt> _$userStatusClearAtSerializer = _$UserStatusClearAtSerializer();
Serializer<UserStatusType> _$userStatusTypeSerializer = _$UserStatusTypeSerializer();
Serializer<UserStatusPublicStatus> _$userStatusPublicStatusSerializer = _$UserStatusPublicStatusSerializer();
Serializer<UserStatusGetPublicStatuses_Ocs> _$userStatusGetPublicStatusesOcsSerializer =
    _$UserStatusGetPublicStatuses_OcsSerializer();
Serializer<UserStatusGetPublicStatuses> _$userStatusGetPublicStatusesSerializer =
    _$UserStatusGetPublicStatusesSerializer();
Serializer<UserStatusGetPublicStatus_Ocs> _$userStatusGetPublicStatusOcsSerializer =
    _$UserStatusGetPublicStatus_OcsSerializer();
Serializer<UserStatusGetPublicStatus> _$userStatusGetPublicStatusSerializer = _$UserStatusGetPublicStatusSerializer();
Serializer<UserStatusStatus1> _$userStatusStatus1Serializer = _$UserStatusStatus1Serializer();
Serializer<UserStatusGetStatus_Ocs> _$userStatusGetStatusOcsSerializer = _$UserStatusGetStatus_OcsSerializer();
Serializer<UserStatusGetStatus> _$userStatusGetStatusSerializer = _$UserStatusGetStatusSerializer();
Serializer<UserStatusPredefinedStatus> _$userStatusPredefinedStatusSerializer =
    _$UserStatusPredefinedStatusSerializer();
Serializer<UserStatusPredefinedStatuses_Ocs> _$userStatusPredefinedStatusesOcsSerializer =
    _$UserStatusPredefinedStatuses_OcsSerializer();
Serializer<UserStatusPredefinedStatuses> _$userStatusPredefinedStatusesSerializer =
    _$UserStatusPredefinedStatusesSerializer();
Serializer<UserStatusHeartbeat_Ocs> _$userStatusHeartbeatOcsSerializer = _$UserStatusHeartbeat_OcsSerializer();
Serializer<UserStatusHeartbeat> _$userStatusHeartbeatSerializer = _$UserStatusHeartbeatSerializer();
Serializer<UserStatusEmptyOCS_Ocs> _$userStatusEmptyOCSOcsSerializer = _$UserStatusEmptyOCS_OcsSerializer();
Serializer<UserStatusEmptyOCS> _$userStatusEmptyOCSSerializer = _$UserStatusEmptyOCSSerializer();

class _$UserStatusOCSMetaSerializer implements StructuredSerializer<UserStatusOCSMeta> {
  @override
  final Iterable<Type> types = const [UserStatusOCSMeta, _$UserStatusOCSMeta];
  @override
  final String wireName = 'UserStatusOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusOCSMeta object,
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
  UserStatusOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusOCSMetaBuilder();

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

class _$UserStatusClearAt_TypeSerializer implements PrimitiveSerializer<UserStatusClearAt_Type> {
  static const Map<String, Object> _toWire = <String, Object>{
    'endOf': 'end-of',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    'end-of': 'endOf',
  };

  @override
  final Iterable<Type> types = const <Type>[UserStatusClearAt_Type];
  @override
  final String wireName = 'UserStatusClearAt_Type';

  @override
  Object serialize(Serializers serializers, UserStatusClearAt_Type object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UserStatusClearAt_Type deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserStatusClearAt_Type.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UserStatusClearAt_Time0Serializer implements PrimitiveSerializer<UserStatusClearAt_Time0> {
  @override
  final Iterable<Type> types = const <Type>[UserStatusClearAt_Time0];
  @override
  final String wireName = 'UserStatusClearAt_Time0';

  @override
  Object serialize(Serializers serializers, UserStatusClearAt_Time0 object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  UserStatusClearAt_Time0 deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserStatusClearAt_Time0.valueOf(serialized as String);
}

class _$UserStatusClearAtSerializer implements StructuredSerializer<UserStatusClearAt> {
  @override
  final Iterable<Type> types = const [UserStatusClearAt, _$UserStatusClearAt];
  @override
  final String wireName = 'UserStatusClearAt';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusClearAt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(UserStatusClearAt_Type)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(UserStatusClearAt_Time)),
    ];

    return result;
  }

  @override
  UserStatusClearAt deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusClearAtBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(UserStatusClearAt_Type))!
              as UserStatusClearAt_Type;
          break;
        case 'time':
          result.time.replace(serializers.deserialize(value, specifiedType: const FullType(UserStatusClearAt_Time))!
              as UserStatusClearAt_Time);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusTypeSerializer implements PrimitiveSerializer<UserStatusType> {
  @override
  final Iterable<Type> types = const <Type>[UserStatusType];
  @override
  final String wireName = 'UserStatusType';

  @override
  Object serialize(Serializers serializers, UserStatusType object, {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  UserStatusType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserStatusType.valueOf(serialized as String);
}

class _$UserStatusPublicStatusSerializer implements StructuredSerializer<UserStatusPublicStatus> {
  @override
  final Iterable<Type> types = const [UserStatusPublicStatus, _$UserStatusPublicStatus];
  @override
  final String wireName = 'UserStatusPublicStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPublicStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(UserStatusType)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(UserStatusPublicStatus_ClearAt)));
    }
    return result;
  }

  @override
  UserStatusPublicStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPublicStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'clearAt':
          result.clearAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStatusPublicStatus_ClearAt))! as UserStatusPublicStatus_ClearAt);
          break;
        case 'status':
          result.status =
              serializers.deserialize(value, specifiedType: const FullType(UserStatusType))! as UserStatusType;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusGetPublicStatuses_OcsSerializer implements StructuredSerializer<UserStatusGetPublicStatuses_Ocs> {
  @override
  final Iterable<Type> types = const [UserStatusGetPublicStatuses_Ocs, _$UserStatusGetPublicStatuses_Ocs];
  @override
  final String wireName = 'UserStatusGetPublicStatuses_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusGetPublicStatuses_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(UserStatusPublicStatus)])),
    ];

    return result;
  }

  @override
  UserStatusGetPublicStatuses_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusGetPublicStatuses_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusOCSMeta))! as UserStatusOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(UserStatusPublicStatus)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusGetPublicStatusesSerializer implements StructuredSerializer<UserStatusGetPublicStatuses> {
  @override
  final Iterable<Type> types = const [UserStatusGetPublicStatuses, _$UserStatusGetPublicStatuses];
  @override
  final String wireName = 'UserStatusGetPublicStatuses';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusGetPublicStatuses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusGetPublicStatuses_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusGetPublicStatuses deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusGetPublicStatusesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStatusGetPublicStatuses_Ocs))! as UserStatusGetPublicStatuses_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusGetPublicStatus_OcsSerializer implements StructuredSerializer<UserStatusGetPublicStatus_Ocs> {
  @override
  final Iterable<Type> types = const [UserStatusGetPublicStatus_Ocs, _$UserStatusGetPublicStatus_Ocs];
  @override
  final String wireName = 'UserStatusGetPublicStatus_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusGetPublicStatus_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusGetPublicStatus_Ocs_Data)),
    ];

    return result;
  }

  @override
  UserStatusGetPublicStatus_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusGetPublicStatus_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusOCSMeta))! as UserStatusOCSMeta);
          break;
        case 'data':
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusGetPublicStatus_Ocs_Data))!
                  as UserStatusGetPublicStatus_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusGetPublicStatusSerializer implements StructuredSerializer<UserStatusGetPublicStatus> {
  @override
  final Iterable<Type> types = const [UserStatusGetPublicStatus, _$UserStatusGetPublicStatus];
  @override
  final String wireName = 'UserStatusGetPublicStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusGetPublicStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusGetPublicStatus_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusGetPublicStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusGetPublicStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStatusGetPublicStatus_Ocs))! as UserStatusGetPublicStatus_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusStatus1Serializer implements StructuredSerializer<UserStatusStatus1> {
  @override
  final Iterable<Type> types = const [UserStatusStatus1, _$UserStatusStatus1];
  @override
  final String wireName = 'UserStatusStatus1';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatus1 object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'messageIsPredefined',
      serializers.serialize(object.messageIsPredefined, specifiedType: const FullType(bool)),
      'statusIsUserDefined',
      serializers.serialize(object.statusIsUserDefined, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.messageId;
    if (value != null) {
      result
        ..add('messageId')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserStatusStatus1 deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatus1Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'messageId':
          result.messageId = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'messageIsPredefined':
          result.messageIsPredefined = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'statusIsUserDefined':
          result.statusIsUserDefined = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusGetStatus_OcsSerializer implements StructuredSerializer<UserStatusGetStatus_Ocs> {
  @override
  final Iterable<Type> types = const [UserStatusGetStatus_Ocs, _$UserStatusGetStatus_Ocs];
  @override
  final String wireName = 'UserStatusGetStatus_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusGetStatus_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusGetStatus_Ocs_Data)),
    ];

    return result;
  }

  @override
  UserStatusGetStatus_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusGetStatus_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusOCSMeta))! as UserStatusOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStatusGetStatus_Ocs_Data))! as UserStatusGetStatus_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusGetStatusSerializer implements StructuredSerializer<UserStatusGetStatus> {
  @override
  final Iterable<Type> types = const [UserStatusGetStatus, _$UserStatusGetStatus];
  @override
  final String wireName = 'UserStatusGetStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusGetStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusGetStatus_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusGetStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusGetStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value, specifiedType: const FullType(UserStatusGetStatus_Ocs))!
              as UserStatusGetStatus_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusPredefinedStatusSerializer implements StructuredSerializer<UserStatusPredefinedStatus> {
  @override
  final Iterable<Type> types = const [UserStatusPredefinedStatus, _$UserStatusPredefinedStatus];
  @override
  final String wireName = 'UserStatusPredefinedStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPredefinedStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(UserStatusPredefinedStatus_ClearAt)));
    }
    return result;
  }

  @override
  UserStatusPredefinedStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'clearAt':
          result.clearAt.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusPredefinedStatus_ClearAt))!
                  as UserStatusPredefinedStatus_ClearAt);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusPredefinedStatuses_OcsSerializer implements StructuredSerializer<UserStatusPredefinedStatuses_Ocs> {
  @override
  final Iterable<Type> types = const [UserStatusPredefinedStatuses_Ocs, _$UserStatusPredefinedStatuses_Ocs];
  @override
  final String wireName = 'UserStatusPredefinedStatuses_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPredefinedStatuses_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltList, [FullType(UserStatusPredefinedStatus)])),
    ];

    return result;
  }

  @override
  UserStatusPredefinedStatuses_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedStatuses_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusOCSMeta))! as UserStatusOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(UserStatusPredefinedStatus)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusPredefinedStatusesSerializer implements StructuredSerializer<UserStatusPredefinedStatuses> {
  @override
  final Iterable<Type> types = const [UserStatusPredefinedStatuses, _$UserStatusPredefinedStatuses];
  @override
  final String wireName = 'UserStatusPredefinedStatuses';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPredefinedStatuses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusPredefinedStatuses_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusPredefinedStatuses deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedStatusesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStatusPredefinedStatuses_Ocs))! as UserStatusPredefinedStatuses_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusHeartbeat_OcsSerializer implements StructuredSerializer<UserStatusHeartbeat_Ocs> {
  @override
  final Iterable<Type> types = const [UserStatusHeartbeat_Ocs, _$UserStatusHeartbeat_Ocs];
  @override
  final String wireName = 'UserStatusHeartbeat_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusHeartbeat_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusHeartbeat_Ocs_Data)),
    ];

    return result;
  }

  @override
  UserStatusHeartbeat_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusHeartbeat_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusOCSMeta))! as UserStatusOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStatusHeartbeat_Ocs_Data))! as UserStatusHeartbeat_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusHeartbeatSerializer implements StructuredSerializer<UserStatusHeartbeat> {
  @override
  final Iterable<Type> types = const [UserStatusHeartbeat, _$UserStatusHeartbeat];
  @override
  final String wireName = 'UserStatusHeartbeat';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusHeartbeat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusHeartbeat_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusHeartbeat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusHeartbeatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value, specifiedType: const FullType(UserStatusHeartbeat_Ocs))!
              as UserStatusHeartbeat_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusEmptyOCS_OcsSerializer implements StructuredSerializer<UserStatusEmptyOCS_Ocs> {
  @override
  final Iterable<Type> types = const [UserStatusEmptyOCS_Ocs, _$UserStatusEmptyOCS_Ocs];
  @override
  final String wireName = 'UserStatusEmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusEmptyOCS_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  UserStatusEmptyOCS_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusEmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(UserStatusOCSMeta))! as UserStatusOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusEmptyOCSSerializer implements StructuredSerializer<UserStatusEmptyOCS> {
  @override
  final Iterable<Type> types = const [UserStatusEmptyOCS, _$UserStatusEmptyOCS];
  @override
  final String wireName = 'UserStatusEmptyOCS';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusEmptyOCS object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusEmptyOCS_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusEmptyOCS deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusEmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value, specifiedType: const FullType(UserStatusEmptyOCS_Ocs))!
              as UserStatusEmptyOCS_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusOCSMeta extends UserStatusOCSMeta {
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

  factory _$UserStatusOCSMeta([void Function(UserStatusOCSMetaBuilder)? updates]) =>
      (UserStatusOCSMetaBuilder()..update(updates))._build();

  _$UserStatusOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'UserStatusOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'UserStatusOCSMeta', 'statuscode');
  }

  @override
  UserStatusOCSMeta rebuild(void Function(UserStatusOCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UserStatusOCSMetaBuilder toBuilder() => UserStatusOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'UserStatusOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class UserStatusOCSMetaBuilder implements Builder<UserStatusOCSMeta, UserStatusOCSMetaBuilder> {
  _$UserStatusOCSMeta? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _totalitems;
  String? get totalitems => _$this._totalitems;
  set totalitems(String? totalitems) => _$this._totalitems = totalitems;

  String? _itemsperpage;
  String? get itemsperpage => _$this._itemsperpage;
  set itemsperpage(String? itemsperpage) => _$this._itemsperpage = itemsperpage;

  UserStatusOCSMetaBuilder();

  UserStatusOCSMetaBuilder get _$this {
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
  void replace(UserStatusOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusOCSMeta;
  }

  @override
  void update(void Function(UserStatusOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusOCSMeta build() => _build();

  _$UserStatusOCSMeta _build() {
    final _$result = _$v ??
        _$UserStatusOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'UserStatusOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'UserStatusOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusClearAt_Time extends UserStatusClearAt_Time {
  @override
  final JsonObject data;
  @override
  final UserStatusClearAt_Time0? clearAtTime0;
  @override
  final int? $int;

  factory _$UserStatusClearAt_Time([void Function(UserStatusClearAt_TimeBuilder)? updates]) =>
      (UserStatusClearAt_TimeBuilder()..update(updates))._build();

  _$UserStatusClearAt_Time._({required this.data, this.clearAtTime0, this.$int}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusClearAt_Time', 'data');
  }

  @override
  UserStatusClearAt_Time rebuild(void Function(UserStatusClearAt_TimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusClearAt_TimeBuilder toBuilder() => UserStatusClearAt_TimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusClearAt_Time &&
        data == other.data &&
        clearAtTime0 == other.clearAtTime0 &&
        $int == other.$int;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, clearAtTime0.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusClearAt_Time')
          ..add('data', data)
          ..add('clearAtTime0', clearAtTime0)
          ..add('\$int', $int))
        .toString();
  }
}

class UserStatusClearAt_TimeBuilder implements Builder<UserStatusClearAt_Time, UserStatusClearAt_TimeBuilder> {
  _$UserStatusClearAt_Time? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  UserStatusClearAt_Time0? _clearAtTime0;
  UserStatusClearAt_Time0? get clearAtTime0 => _$this._clearAtTime0;
  set clearAtTime0(UserStatusClearAt_Time0? clearAtTime0) => _$this._clearAtTime0 = clearAtTime0;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  UserStatusClearAt_TimeBuilder();

  UserStatusClearAt_TimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _clearAtTime0 = $v.clearAtTime0;
      _$int = $v.$int;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusClearAt_Time other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusClearAt_Time;
  }

  @override
  void update(void Function(UserStatusClearAt_TimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusClearAt_Time build() => _build();

  _$UserStatusClearAt_Time _build() {
    final _$result = _$v ??
        _$UserStatusClearAt_Time._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'UserStatusClearAt_Time', 'data'),
            clearAtTime0: clearAtTime0,
            $int: $int);
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusClearAt extends UserStatusClearAt {
  @override
  final UserStatusClearAt_Type type;
  @override
  final UserStatusClearAt_Time time;

  factory _$UserStatusClearAt([void Function(UserStatusClearAtBuilder)? updates]) =>
      (UserStatusClearAtBuilder()..update(updates))._build();

  _$UserStatusClearAt._({required this.type, required this.time}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'UserStatusClearAt', 'type');
    BuiltValueNullFieldError.checkNotNull(time, r'UserStatusClearAt', 'time');
  }

  @override
  UserStatusClearAt rebuild(void Function(UserStatusClearAtBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UserStatusClearAtBuilder toBuilder() => UserStatusClearAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusClearAt && type == other.type && time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusClearAt')
          ..add('type', type)
          ..add('time', time))
        .toString();
  }
}

class UserStatusClearAtBuilder implements Builder<UserStatusClearAt, UserStatusClearAtBuilder> {
  _$UserStatusClearAt? _$v;

  UserStatusClearAt_Type? _type;
  UserStatusClearAt_Type? get type => _$this._type;
  set type(UserStatusClearAt_Type? type) => _$this._type = type;

  UserStatusClearAt_TimeBuilder? _time;
  UserStatusClearAt_TimeBuilder get time => _$this._time ??= UserStatusClearAt_TimeBuilder();
  set time(UserStatusClearAt_TimeBuilder? time) => _$this._time = time;

  UserStatusClearAtBuilder();

  UserStatusClearAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _time = $v.time.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusClearAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusClearAt;
  }

  @override
  void update(void Function(UserStatusClearAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusClearAt build() => _build();

  _$UserStatusClearAt _build() {
    _$UserStatusClearAt _$result;
    try {
      _$result = _$v ??
          _$UserStatusClearAt._(
              type: BuiltValueNullFieldError.checkNotNull(type, r'UserStatusClearAt', 'type'), time: time.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'time';
        time.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusClearAt', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusPublicStatus_ClearAt extends UserStatusPublicStatus_ClearAt {
  @override
  final JsonObject data;
  @override
  final UserStatusClearAt? clearAt;
  @override
  final int? $int;

  factory _$UserStatusPublicStatus_ClearAt([void Function(UserStatusPublicStatus_ClearAtBuilder)? updates]) =>
      (UserStatusPublicStatus_ClearAtBuilder()..update(updates))._build();

  _$UserStatusPublicStatus_ClearAt._({required this.data, this.clearAt, this.$int}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusPublicStatus_ClearAt', 'data');
  }

  @override
  UserStatusPublicStatus_ClearAt rebuild(void Function(UserStatusPublicStatus_ClearAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPublicStatus_ClearAtBuilder toBuilder() => UserStatusPublicStatus_ClearAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPublicStatus_ClearAt &&
        data == other.data &&
        clearAt == other.clearAt &&
        $int == other.$int;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusPublicStatus_ClearAt')
          ..add('data', data)
          ..add('clearAt', clearAt)
          ..add('\$int', $int))
        .toString();
  }
}

class UserStatusPublicStatus_ClearAtBuilder
    implements Builder<UserStatusPublicStatus_ClearAt, UserStatusPublicStatus_ClearAtBuilder> {
  _$UserStatusPublicStatus_ClearAt? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  UserStatusClearAtBuilder? _clearAt;
  UserStatusClearAtBuilder get clearAt => _$this._clearAt ??= UserStatusClearAtBuilder();
  set clearAt(UserStatusClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  UserStatusPublicStatus_ClearAtBuilder();

  UserStatusPublicStatus_ClearAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _clearAt = $v.clearAt?.toBuilder();
      _$int = $v.$int;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusPublicStatus_ClearAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPublicStatus_ClearAt;
  }

  @override
  void update(void Function(UserStatusPublicStatus_ClearAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPublicStatus_ClearAt build() => _build();

  _$UserStatusPublicStatus_ClearAt _build() {
    _$UserStatusPublicStatus_ClearAt _$result;
    try {
      _$result = _$v ??
          _$UserStatusPublicStatus_ClearAt._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'UserStatusPublicStatus_ClearAt', 'data'),
              clearAt: _clearAt?.build(),
              $int: $int);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusPublicStatus_ClearAt', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusPublicStatus extends UserStatusPublicStatus {
  @override
  final String userId;
  @override
  final String? message;
  @override
  final String? icon;
  @override
  final UserStatusPublicStatus_ClearAt? clearAt;
  @override
  final UserStatusType status;

  factory _$UserStatusPublicStatus([void Function(UserStatusPublicStatusBuilder)? updates]) =>
      (UserStatusPublicStatusBuilder()..update(updates))._build();

  _$UserStatusPublicStatus._({required this.userId, this.message, this.icon, this.clearAt, required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'UserStatusPublicStatus', 'userId');
    BuiltValueNullFieldError.checkNotNull(status, r'UserStatusPublicStatus', 'status');
  }

  @override
  UserStatusPublicStatus rebuild(void Function(UserStatusPublicStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPublicStatusBuilder toBuilder() => UserStatusPublicStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPublicStatus &&
        userId == other.userId &&
        message == other.message &&
        icon == other.icon &&
        clearAt == other.clearAt &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusPublicStatus')
          ..add('userId', userId)
          ..add('message', message)
          ..add('icon', icon)
          ..add('clearAt', clearAt)
          ..add('status', status))
        .toString();
  }
}

class UserStatusPublicStatusBuilder implements Builder<UserStatusPublicStatus, UserStatusPublicStatusBuilder> {
  _$UserStatusPublicStatus? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  UserStatusPublicStatus_ClearAtBuilder? _clearAt;
  UserStatusPublicStatus_ClearAtBuilder get clearAt => _$this._clearAt ??= UserStatusPublicStatus_ClearAtBuilder();
  set clearAt(UserStatusPublicStatus_ClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  UserStatusType? _status;
  UserStatusType? get status => _$this._status;
  set status(UserStatusType? status) => _$this._status = status;

  UserStatusPublicStatusBuilder();

  UserStatusPublicStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _message = $v.message;
      _icon = $v.icon;
      _clearAt = $v.clearAt?.toBuilder();
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusPublicStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPublicStatus;
  }

  @override
  void update(void Function(UserStatusPublicStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPublicStatus build() => _build();

  _$UserStatusPublicStatus _build() {
    _$UserStatusPublicStatus _$result;
    try {
      _$result = _$v ??
          _$UserStatusPublicStatus._(
              userId: BuiltValueNullFieldError.checkNotNull(userId, r'UserStatusPublicStatus', 'userId'),
              message: message,
              icon: icon,
              clearAt: _clearAt?.build(),
              status: BuiltValueNullFieldError.checkNotNull(status, r'UserStatusPublicStatus', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusPublicStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetPublicStatuses_Ocs extends UserStatusGetPublicStatuses_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final BuiltList<UserStatusPublicStatus> data;

  factory _$UserStatusGetPublicStatuses_Ocs([void Function(UserStatusGetPublicStatuses_OcsBuilder)? updates]) =>
      (UserStatusGetPublicStatuses_OcsBuilder()..update(updates))._build();

  _$UserStatusGetPublicStatuses_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusGetPublicStatuses_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusGetPublicStatuses_Ocs', 'data');
  }

  @override
  UserStatusGetPublicStatuses_Ocs rebuild(void Function(UserStatusGetPublicStatuses_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetPublicStatuses_OcsBuilder toBuilder() => UserStatusGetPublicStatuses_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetPublicStatuses_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusGetPublicStatuses_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusGetPublicStatuses_OcsBuilder
    implements Builder<UserStatusGetPublicStatuses_Ocs, UserStatusGetPublicStatuses_OcsBuilder> {
  _$UserStatusGetPublicStatuses_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<UserStatusPublicStatus>? _data;
  ListBuilder<UserStatusPublicStatus> get data => _$this._data ??= ListBuilder<UserStatusPublicStatus>();
  set data(ListBuilder<UserStatusPublicStatus>? data) => _$this._data = data;

  UserStatusGetPublicStatuses_OcsBuilder();

  UserStatusGetPublicStatuses_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetPublicStatuses_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetPublicStatuses_Ocs;
  }

  @override
  void update(void Function(UserStatusGetPublicStatuses_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetPublicStatuses_Ocs build() => _build();

  _$UserStatusGetPublicStatuses_Ocs _build() {
    _$UserStatusGetPublicStatuses_Ocs _$result;
    try {
      _$result = _$v ?? _$UserStatusGetPublicStatuses_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetPublicStatuses_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetPublicStatuses extends UserStatusGetPublicStatuses {
  @override
  final UserStatusGetPublicStatuses_Ocs ocs;

  factory _$UserStatusGetPublicStatuses([void Function(UserStatusGetPublicStatusesBuilder)? updates]) =>
      (UserStatusGetPublicStatusesBuilder()..update(updates))._build();

  _$UserStatusGetPublicStatuses._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusGetPublicStatuses', 'ocs');
  }

  @override
  UserStatusGetPublicStatuses rebuild(void Function(UserStatusGetPublicStatusesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetPublicStatusesBuilder toBuilder() => UserStatusGetPublicStatusesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetPublicStatuses && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusGetPublicStatuses')..add('ocs', ocs)).toString();
  }
}

class UserStatusGetPublicStatusesBuilder
    implements Builder<UserStatusGetPublicStatuses, UserStatusGetPublicStatusesBuilder> {
  _$UserStatusGetPublicStatuses? _$v;

  UserStatusGetPublicStatuses_OcsBuilder? _ocs;
  UserStatusGetPublicStatuses_OcsBuilder get ocs => _$this._ocs ??= UserStatusGetPublicStatuses_OcsBuilder();
  set ocs(UserStatusGetPublicStatuses_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusGetPublicStatusesBuilder();

  UserStatusGetPublicStatusesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetPublicStatuses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetPublicStatuses;
  }

  @override
  void update(void Function(UserStatusGetPublicStatusesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetPublicStatuses build() => _build();

  _$UserStatusGetPublicStatuses _build() {
    _$UserStatusGetPublicStatuses _$result;
    try {
      _$result = _$v ?? _$UserStatusGetPublicStatuses._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetPublicStatuses', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetPublicStatus_Ocs_Data extends UserStatusGetPublicStatus_Ocs_Data {
  @override
  final JsonObject data;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;
  @override
  final UserStatusPublicStatus? publicStatus;

  factory _$UserStatusGetPublicStatus_Ocs_Data([void Function(UserStatusGetPublicStatus_Ocs_DataBuilder)? updates]) =>
      (UserStatusGetPublicStatus_Ocs_DataBuilder()..update(updates))._build();

  _$UserStatusGetPublicStatus_Ocs_Data._({required this.data, this.builtListJsonObject, this.publicStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusGetPublicStatus_Ocs_Data', 'data');
  }

  @override
  UserStatusGetPublicStatus_Ocs_Data rebuild(void Function(UserStatusGetPublicStatus_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetPublicStatus_Ocs_DataBuilder toBuilder() => UserStatusGetPublicStatus_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetPublicStatus_Ocs_Data &&
        data == other.data &&
        builtListJsonObject == other.builtListJsonObject &&
        publicStatus == other.publicStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jc(_$hash, publicStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusGetPublicStatus_Ocs_Data')
          ..add('data', data)
          ..add('builtListJsonObject', builtListJsonObject)
          ..add('publicStatus', publicStatus))
        .toString();
  }
}

class UserStatusGetPublicStatus_Ocs_DataBuilder
    implements Builder<UserStatusGetPublicStatus_Ocs_Data, UserStatusGetPublicStatus_Ocs_DataBuilder> {
  _$UserStatusGetPublicStatus_Ocs_Data? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  UserStatusPublicStatusBuilder? _publicStatus;
  UserStatusPublicStatusBuilder get publicStatus => _$this._publicStatus ??= UserStatusPublicStatusBuilder();
  set publicStatus(UserStatusPublicStatusBuilder? publicStatus) => _$this._publicStatus = publicStatus;

  UserStatusGetPublicStatus_Ocs_DataBuilder();

  UserStatusGetPublicStatus_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _publicStatus = $v.publicStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetPublicStatus_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetPublicStatus_Ocs_Data;
  }

  @override
  void update(void Function(UserStatusGetPublicStatus_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetPublicStatus_Ocs_Data build() => _build();

  _$UserStatusGetPublicStatus_Ocs_Data _build() {
    _$UserStatusGetPublicStatus_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$UserStatusGetPublicStatus_Ocs_Data._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'UserStatusGetPublicStatus_Ocs_Data', 'data'),
              builtListJsonObject: _builtListJsonObject?.build(),
              publicStatus: _publicStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
        _$failedField = 'publicStatus';
        _publicStatus?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetPublicStatus_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetPublicStatus_Ocs extends UserStatusGetPublicStatus_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusGetPublicStatus_Ocs_Data data;

  factory _$UserStatusGetPublicStatus_Ocs([void Function(UserStatusGetPublicStatus_OcsBuilder)? updates]) =>
      (UserStatusGetPublicStatus_OcsBuilder()..update(updates))._build();

  _$UserStatusGetPublicStatus_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusGetPublicStatus_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusGetPublicStatus_Ocs', 'data');
  }

  @override
  UserStatusGetPublicStatus_Ocs rebuild(void Function(UserStatusGetPublicStatus_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetPublicStatus_OcsBuilder toBuilder() => UserStatusGetPublicStatus_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetPublicStatus_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusGetPublicStatus_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusGetPublicStatus_OcsBuilder
    implements Builder<UserStatusGetPublicStatus_Ocs, UserStatusGetPublicStatus_OcsBuilder> {
  _$UserStatusGetPublicStatus_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusGetPublicStatus_Ocs_DataBuilder? _data;
  UserStatusGetPublicStatus_Ocs_DataBuilder get data => _$this._data ??= UserStatusGetPublicStatus_Ocs_DataBuilder();
  set data(UserStatusGetPublicStatus_Ocs_DataBuilder? data) => _$this._data = data;

  UserStatusGetPublicStatus_OcsBuilder();

  UserStatusGetPublicStatus_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetPublicStatus_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetPublicStatus_Ocs;
  }

  @override
  void update(void Function(UserStatusGetPublicStatus_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetPublicStatus_Ocs build() => _build();

  _$UserStatusGetPublicStatus_Ocs _build() {
    _$UserStatusGetPublicStatus_Ocs _$result;
    try {
      _$result = _$v ?? _$UserStatusGetPublicStatus_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetPublicStatus_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetPublicStatus extends UserStatusGetPublicStatus {
  @override
  final UserStatusGetPublicStatus_Ocs ocs;

  factory _$UserStatusGetPublicStatus([void Function(UserStatusGetPublicStatusBuilder)? updates]) =>
      (UserStatusGetPublicStatusBuilder()..update(updates))._build();

  _$UserStatusGetPublicStatus._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusGetPublicStatus', 'ocs');
  }

  @override
  UserStatusGetPublicStatus rebuild(void Function(UserStatusGetPublicStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetPublicStatusBuilder toBuilder() => UserStatusGetPublicStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetPublicStatus && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusGetPublicStatus')..add('ocs', ocs)).toString();
  }
}

class UserStatusGetPublicStatusBuilder implements Builder<UserStatusGetPublicStatus, UserStatusGetPublicStatusBuilder> {
  _$UserStatusGetPublicStatus? _$v;

  UserStatusGetPublicStatus_OcsBuilder? _ocs;
  UserStatusGetPublicStatus_OcsBuilder get ocs => _$this._ocs ??= UserStatusGetPublicStatus_OcsBuilder();
  set ocs(UserStatusGetPublicStatus_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusGetPublicStatusBuilder();

  UserStatusGetPublicStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetPublicStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetPublicStatus;
  }

  @override
  void update(void Function(UserStatusGetPublicStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetPublicStatus build() => _build();

  _$UserStatusGetPublicStatus _build() {
    _$UserStatusGetPublicStatus _$result;
    try {
      _$result = _$v ?? _$UserStatusGetPublicStatus._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetPublicStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusStatus1 extends UserStatusStatus1 {
  @override
  final String? messageId;
  @override
  final bool messageIsPredefined;
  @override
  final bool statusIsUserDefined;

  factory _$UserStatusStatus1([void Function(UserStatusStatus1Builder)? updates]) =>
      (UserStatusStatus1Builder()..update(updates))._build();

  _$UserStatusStatus1._({this.messageId, required this.messageIsPredefined, required this.statusIsUserDefined})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(messageIsPredefined, r'UserStatusStatus1', 'messageIsPredefined');
    BuiltValueNullFieldError.checkNotNull(statusIsUserDefined, r'UserStatusStatus1', 'statusIsUserDefined');
  }

  @override
  UserStatusStatus1 rebuild(void Function(UserStatusStatus1Builder) updates) => (toBuilder()..update(updates)).build();

  @override
  UserStatusStatus1Builder toBuilder() => UserStatusStatus1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatus1 &&
        messageId == other.messageId &&
        messageIsPredefined == other.messageIsPredefined &&
        statusIsUserDefined == other.statusIsUserDefined;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, messageId.hashCode);
    _$hash = $jc(_$hash, messageIsPredefined.hashCode);
    _$hash = $jc(_$hash, statusIsUserDefined.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusStatus1')
          ..add('messageId', messageId)
          ..add('messageIsPredefined', messageIsPredefined)
          ..add('statusIsUserDefined', statusIsUserDefined))
        .toString();
  }
}

class UserStatusStatus1Builder implements Builder<UserStatusStatus1, UserStatusStatus1Builder> {
  _$UserStatusStatus1? _$v;

  String? _messageId;
  String? get messageId => _$this._messageId;
  set messageId(String? messageId) => _$this._messageId = messageId;

  bool? _messageIsPredefined;
  bool? get messageIsPredefined => _$this._messageIsPredefined;
  set messageIsPredefined(bool? messageIsPredefined) => _$this._messageIsPredefined = messageIsPredefined;

  bool? _statusIsUserDefined;
  bool? get statusIsUserDefined => _$this._statusIsUserDefined;
  set statusIsUserDefined(bool? statusIsUserDefined) => _$this._statusIsUserDefined = statusIsUserDefined;

  UserStatusStatus1Builder();

  UserStatusStatus1Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _messageId = $v.messageId;
      _messageIsPredefined = $v.messageIsPredefined;
      _statusIsUserDefined = $v.statusIsUserDefined;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusStatus1 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatus1;
  }

  @override
  void update(void Function(UserStatusStatus1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatus1 build() => _build();

  _$UserStatusStatus1 _build() {
    final _$result = _$v ??
        _$UserStatusStatus1._(
            messageId: messageId,
            messageIsPredefined:
                BuiltValueNullFieldError.checkNotNull(messageIsPredefined, r'UserStatusStatus1', 'messageIsPredefined'),
            statusIsUserDefined: BuiltValueNullFieldError.checkNotNull(
                statusIsUserDefined, r'UserStatusStatus1', 'statusIsUserDefined'));
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusStatus extends UserStatusStatus {
  @override
  final JsonObject data;
  @override
  final UserStatusPublicStatus publicStatus;
  @override
  final UserStatusStatus1 status1;

  factory _$UserStatusStatus([void Function(UserStatusStatusBuilder)? updates]) =>
      (UserStatusStatusBuilder()..update(updates))._build();

  _$UserStatusStatus._({required this.data, required this.publicStatus, required this.status1}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusStatus', 'data');
    BuiltValueNullFieldError.checkNotNull(publicStatus, r'UserStatusStatus', 'publicStatus');
    BuiltValueNullFieldError.checkNotNull(status1, r'UserStatusStatus', 'status1');
  }

  @override
  UserStatusStatus rebuild(void Function(UserStatusStatusBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusBuilder toBuilder() => UserStatusStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatus &&
        data == other.data &&
        publicStatus == other.publicStatus &&
        status1 == other.status1;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, publicStatus.hashCode);
    _$hash = $jc(_$hash, status1.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusStatus')
          ..add('data', data)
          ..add('publicStatus', publicStatus)
          ..add('status1', status1))
        .toString();
  }
}

class UserStatusStatusBuilder implements Builder<UserStatusStatus, UserStatusStatusBuilder> {
  _$UserStatusStatus? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  UserStatusPublicStatusBuilder? _publicStatus;
  UserStatusPublicStatusBuilder get publicStatus => _$this._publicStatus ??= UserStatusPublicStatusBuilder();
  set publicStatus(UserStatusPublicStatusBuilder? publicStatus) => _$this._publicStatus = publicStatus;

  UserStatusStatus1Builder? _status1;
  UserStatusStatus1Builder get status1 => _$this._status1 ??= UserStatusStatus1Builder();
  set status1(UserStatusStatus1Builder? status1) => _$this._status1 = status1;

  UserStatusStatusBuilder();

  UserStatusStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _publicStatus = $v.publicStatus.toBuilder();
      _status1 = $v.status1.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatus;
  }

  @override
  void update(void Function(UserStatusStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatus build() => _build();

  _$UserStatusStatus _build() {
    _$UserStatusStatus _$result;
    try {
      _$result = _$v ??
          _$UserStatusStatus._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'UserStatusStatus', 'data'),
              publicStatus: publicStatus.build(),
              status1: status1.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'publicStatus';
        publicStatus.build();
        _$failedField = 'status1';
        status1.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetStatus_Ocs_Data extends UserStatusGetStatus_Ocs_Data {
  @override
  final JsonObject data;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;
  @override
  final UserStatusStatus? status;

  factory _$UserStatusGetStatus_Ocs_Data([void Function(UserStatusGetStatus_Ocs_DataBuilder)? updates]) =>
      (UserStatusGetStatus_Ocs_DataBuilder()..update(updates))._build();

  _$UserStatusGetStatus_Ocs_Data._({required this.data, this.builtListJsonObject, this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusGetStatus_Ocs_Data', 'data');
  }

  @override
  UserStatusGetStatus_Ocs_Data rebuild(void Function(UserStatusGetStatus_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetStatus_Ocs_DataBuilder toBuilder() => UserStatusGetStatus_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetStatus_Ocs_Data &&
        data == other.data &&
        builtListJsonObject == other.builtListJsonObject &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusGetStatus_Ocs_Data')
          ..add('data', data)
          ..add('builtListJsonObject', builtListJsonObject)
          ..add('status', status))
        .toString();
  }
}

class UserStatusGetStatus_Ocs_DataBuilder
    implements Builder<UserStatusGetStatus_Ocs_Data, UserStatusGetStatus_Ocs_DataBuilder> {
  _$UserStatusGetStatus_Ocs_Data? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  UserStatusStatusBuilder? _status;
  UserStatusStatusBuilder get status => _$this._status ??= UserStatusStatusBuilder();
  set status(UserStatusStatusBuilder? status) => _$this._status = status;

  UserStatusGetStatus_Ocs_DataBuilder();

  UserStatusGetStatus_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _status = $v.status?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetStatus_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetStatus_Ocs_Data;
  }

  @override
  void update(void Function(UserStatusGetStatus_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetStatus_Ocs_Data build() => _build();

  _$UserStatusGetStatus_Ocs_Data _build() {
    _$UserStatusGetStatus_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$UserStatusGetStatus_Ocs_Data._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'UserStatusGetStatus_Ocs_Data', 'data'),
              builtListJsonObject: _builtListJsonObject?.build(),
              status: _status?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
        _$failedField = 'status';
        _status?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetStatus_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetStatus_Ocs extends UserStatusGetStatus_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusGetStatus_Ocs_Data data;

  factory _$UserStatusGetStatus_Ocs([void Function(UserStatusGetStatus_OcsBuilder)? updates]) =>
      (UserStatusGetStatus_OcsBuilder()..update(updates))._build();

  _$UserStatusGetStatus_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusGetStatus_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusGetStatus_Ocs', 'data');
  }

  @override
  UserStatusGetStatus_Ocs rebuild(void Function(UserStatusGetStatus_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetStatus_OcsBuilder toBuilder() => UserStatusGetStatus_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetStatus_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusGetStatus_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusGetStatus_OcsBuilder implements Builder<UserStatusGetStatus_Ocs, UserStatusGetStatus_OcsBuilder> {
  _$UserStatusGetStatus_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusGetStatus_Ocs_DataBuilder? _data;
  UserStatusGetStatus_Ocs_DataBuilder get data => _$this._data ??= UserStatusGetStatus_Ocs_DataBuilder();
  set data(UserStatusGetStatus_Ocs_DataBuilder? data) => _$this._data = data;

  UserStatusGetStatus_OcsBuilder();

  UserStatusGetStatus_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetStatus_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetStatus_Ocs;
  }

  @override
  void update(void Function(UserStatusGetStatus_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetStatus_Ocs build() => _build();

  _$UserStatusGetStatus_Ocs _build() {
    _$UserStatusGetStatus_Ocs _$result;
    try {
      _$result = _$v ?? _$UserStatusGetStatus_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetStatus_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusGetStatus extends UserStatusGetStatus {
  @override
  final UserStatusGetStatus_Ocs ocs;

  factory _$UserStatusGetStatus([void Function(UserStatusGetStatusBuilder)? updates]) =>
      (UserStatusGetStatusBuilder()..update(updates))._build();

  _$UserStatusGetStatus._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusGetStatus', 'ocs');
  }

  @override
  UserStatusGetStatus rebuild(void Function(UserStatusGetStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusGetStatusBuilder toBuilder() => UserStatusGetStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusGetStatus && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusGetStatus')..add('ocs', ocs)).toString();
  }
}

class UserStatusGetStatusBuilder implements Builder<UserStatusGetStatus, UserStatusGetStatusBuilder> {
  _$UserStatusGetStatus? _$v;

  UserStatusGetStatus_OcsBuilder? _ocs;
  UserStatusGetStatus_OcsBuilder get ocs => _$this._ocs ??= UserStatusGetStatus_OcsBuilder();
  set ocs(UserStatusGetStatus_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusGetStatusBuilder();

  UserStatusGetStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusGetStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusGetStatus;
  }

  @override
  void update(void Function(UserStatusGetStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusGetStatus build() => _build();

  _$UserStatusGetStatus _build() {
    _$UserStatusGetStatus _$result;
    try {
      _$result = _$v ?? _$UserStatusGetStatus._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusGetStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusPredefinedStatus_ClearAt extends UserStatusPredefinedStatus_ClearAt {
  @override
  final JsonObject data;
  @override
  final UserStatusClearAt? clearAt;
  @override
  final int? $int;

  factory _$UserStatusPredefinedStatus_ClearAt([void Function(UserStatusPredefinedStatus_ClearAtBuilder)? updates]) =>
      (UserStatusPredefinedStatus_ClearAtBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatus_ClearAt._({required this.data, this.clearAt, this.$int}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusPredefinedStatus_ClearAt', 'data');
  }

  @override
  UserStatusPredefinedStatus_ClearAt rebuild(void Function(UserStatusPredefinedStatus_ClearAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatus_ClearAtBuilder toBuilder() => UserStatusPredefinedStatus_ClearAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatus_ClearAt &&
        data == other.data &&
        clearAt == other.clearAt &&
        $int == other.$int;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatus_ClearAt')
          ..add('data', data)
          ..add('clearAt', clearAt)
          ..add('\$int', $int))
        .toString();
  }
}

class UserStatusPredefinedStatus_ClearAtBuilder
    implements Builder<UserStatusPredefinedStatus_ClearAt, UserStatusPredefinedStatus_ClearAtBuilder> {
  _$UserStatusPredefinedStatus_ClearAt? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  UserStatusClearAtBuilder? _clearAt;
  UserStatusClearAtBuilder get clearAt => _$this._clearAt ??= UserStatusClearAtBuilder();
  set clearAt(UserStatusClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  UserStatusPredefinedStatus_ClearAtBuilder();

  UserStatusPredefinedStatus_ClearAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _clearAt = $v.clearAt?.toBuilder();
      _$int = $v.$int;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusPredefinedStatus_ClearAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatus_ClearAt;
  }

  @override
  void update(void Function(UserStatusPredefinedStatus_ClearAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatus_ClearAt build() => _build();

  _$UserStatusPredefinedStatus_ClearAt _build() {
    _$UserStatusPredefinedStatus_ClearAt _$result;
    try {
      _$result = _$v ??
          _$UserStatusPredefinedStatus_ClearAt._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'UserStatusPredefinedStatus_ClearAt', 'data'),
              clearAt: _clearAt?.build(),
              $int: $int);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusPredefinedStatus_ClearAt', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusPredefinedStatus extends UserStatusPredefinedStatus {
  @override
  final String id;
  @override
  final String icon;
  @override
  final String message;
  @override
  final UserStatusPredefinedStatus_ClearAt? clearAt;

  factory _$UserStatusPredefinedStatus([void Function(UserStatusPredefinedStatusBuilder)? updates]) =>
      (UserStatusPredefinedStatusBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatus._({required this.id, required this.icon, required this.message, this.clearAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserStatusPredefinedStatus', 'id');
    BuiltValueNullFieldError.checkNotNull(icon, r'UserStatusPredefinedStatus', 'icon');
    BuiltValueNullFieldError.checkNotNull(message, r'UserStatusPredefinedStatus', 'message');
  }

  @override
  UserStatusPredefinedStatus rebuild(void Function(UserStatusPredefinedStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatusBuilder toBuilder() => UserStatusPredefinedStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatus &&
        id == other.id &&
        icon == other.icon &&
        message == other.message &&
        clearAt == other.clearAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatus')
          ..add('id', id)
          ..add('icon', icon)
          ..add('message', message)
          ..add('clearAt', clearAt))
        .toString();
  }
}

class UserStatusPredefinedStatusBuilder
    implements Builder<UserStatusPredefinedStatus, UserStatusPredefinedStatusBuilder> {
  _$UserStatusPredefinedStatus? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  UserStatusPredefinedStatus_ClearAtBuilder? _clearAt;
  UserStatusPredefinedStatus_ClearAtBuilder get clearAt =>
      _$this._clearAt ??= UserStatusPredefinedStatus_ClearAtBuilder();
  set clearAt(UserStatusPredefinedStatus_ClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  UserStatusPredefinedStatusBuilder();

  UserStatusPredefinedStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _icon = $v.icon;
      _message = $v.message;
      _clearAt = $v.clearAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusPredefinedStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatus;
  }

  @override
  void update(void Function(UserStatusPredefinedStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatus build() => _build();

  _$UserStatusPredefinedStatus _build() {
    _$UserStatusPredefinedStatus _$result;
    try {
      _$result = _$v ??
          _$UserStatusPredefinedStatus._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'UserStatusPredefinedStatus', 'id'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'UserStatusPredefinedStatus', 'icon'),
              message: BuiltValueNullFieldError.checkNotNull(message, r'UserStatusPredefinedStatus', 'message'),
              clearAt: _clearAt?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusPredefinedStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusPredefinedStatuses_Ocs extends UserStatusPredefinedStatuses_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final BuiltList<UserStatusPredefinedStatus> data;

  factory _$UserStatusPredefinedStatuses_Ocs([void Function(UserStatusPredefinedStatuses_OcsBuilder)? updates]) =>
      (UserStatusPredefinedStatuses_OcsBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatuses_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusPredefinedStatuses_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusPredefinedStatuses_Ocs', 'data');
  }

  @override
  UserStatusPredefinedStatuses_Ocs rebuild(void Function(UserStatusPredefinedStatuses_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatuses_OcsBuilder toBuilder() => UserStatusPredefinedStatuses_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatuses_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatuses_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusPredefinedStatuses_OcsBuilder
    implements Builder<UserStatusPredefinedStatuses_Ocs, UserStatusPredefinedStatuses_OcsBuilder> {
  _$UserStatusPredefinedStatuses_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<UserStatusPredefinedStatus>? _data;
  ListBuilder<UserStatusPredefinedStatus> get data => _$this._data ??= ListBuilder<UserStatusPredefinedStatus>();
  set data(ListBuilder<UserStatusPredefinedStatus>? data) => _$this._data = data;

  UserStatusPredefinedStatuses_OcsBuilder();

  UserStatusPredefinedStatuses_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusPredefinedStatuses_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatuses_Ocs;
  }

  @override
  void update(void Function(UserStatusPredefinedStatuses_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatuses_Ocs build() => _build();

  _$UserStatusPredefinedStatuses_Ocs _build() {
    _$UserStatusPredefinedStatuses_Ocs _$result;
    try {
      _$result = _$v ?? _$UserStatusPredefinedStatuses_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusPredefinedStatuses_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusPredefinedStatuses extends UserStatusPredefinedStatuses {
  @override
  final UserStatusPredefinedStatuses_Ocs ocs;

  factory _$UserStatusPredefinedStatuses([void Function(UserStatusPredefinedStatusesBuilder)? updates]) =>
      (UserStatusPredefinedStatusesBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatuses._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusPredefinedStatuses', 'ocs');
  }

  @override
  UserStatusPredefinedStatuses rebuild(void Function(UserStatusPredefinedStatusesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatusesBuilder toBuilder() => UserStatusPredefinedStatusesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatuses && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatuses')..add('ocs', ocs)).toString();
  }
}

class UserStatusPredefinedStatusesBuilder
    implements Builder<UserStatusPredefinedStatuses, UserStatusPredefinedStatusesBuilder> {
  _$UserStatusPredefinedStatuses? _$v;

  UserStatusPredefinedStatuses_OcsBuilder? _ocs;
  UserStatusPredefinedStatuses_OcsBuilder get ocs => _$this._ocs ??= UserStatusPredefinedStatuses_OcsBuilder();
  set ocs(UserStatusPredefinedStatuses_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusPredefinedStatusesBuilder();

  UserStatusPredefinedStatusesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusPredefinedStatuses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatuses;
  }

  @override
  void update(void Function(UserStatusPredefinedStatusesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatuses build() => _build();

  _$UserStatusPredefinedStatuses _build() {
    _$UserStatusPredefinedStatuses _$result;
    try {
      _$result = _$v ?? _$UserStatusPredefinedStatuses._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusPredefinedStatuses', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusHeartbeat_Ocs_Data extends UserStatusHeartbeat_Ocs_Data {
  @override
  final JsonObject data;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;
  @override
  final UserStatusStatus? status;

  factory _$UserStatusHeartbeat_Ocs_Data([void Function(UserStatusHeartbeat_Ocs_DataBuilder)? updates]) =>
      (UserStatusHeartbeat_Ocs_DataBuilder()..update(updates))._build();

  _$UserStatusHeartbeat_Ocs_Data._({required this.data, this.builtListJsonObject, this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusHeartbeat_Ocs_Data', 'data');
  }

  @override
  UserStatusHeartbeat_Ocs_Data rebuild(void Function(UserStatusHeartbeat_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusHeartbeat_Ocs_DataBuilder toBuilder() => UserStatusHeartbeat_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusHeartbeat_Ocs_Data &&
        data == other.data &&
        builtListJsonObject == other.builtListJsonObject &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusHeartbeat_Ocs_Data')
          ..add('data', data)
          ..add('builtListJsonObject', builtListJsonObject)
          ..add('status', status))
        .toString();
  }
}

class UserStatusHeartbeat_Ocs_DataBuilder
    implements Builder<UserStatusHeartbeat_Ocs_Data, UserStatusHeartbeat_Ocs_DataBuilder> {
  _$UserStatusHeartbeat_Ocs_Data? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  UserStatusStatusBuilder? _status;
  UserStatusStatusBuilder get status => _$this._status ??= UserStatusStatusBuilder();
  set status(UserStatusStatusBuilder? status) => _$this._status = status;

  UserStatusHeartbeat_Ocs_DataBuilder();

  UserStatusHeartbeat_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _status = $v.status?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusHeartbeat_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusHeartbeat_Ocs_Data;
  }

  @override
  void update(void Function(UserStatusHeartbeat_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusHeartbeat_Ocs_Data build() => _build();

  _$UserStatusHeartbeat_Ocs_Data _build() {
    _$UserStatusHeartbeat_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$UserStatusHeartbeat_Ocs_Data._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'UserStatusHeartbeat_Ocs_Data', 'data'),
              builtListJsonObject: _builtListJsonObject?.build(),
              status: _status?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
        _$failedField = 'status';
        _status?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusHeartbeat_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusHeartbeat_Ocs extends UserStatusHeartbeat_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusHeartbeat_Ocs_Data data;

  factory _$UserStatusHeartbeat_Ocs([void Function(UserStatusHeartbeat_OcsBuilder)? updates]) =>
      (UserStatusHeartbeat_OcsBuilder()..update(updates))._build();

  _$UserStatusHeartbeat_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusHeartbeat_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusHeartbeat_Ocs', 'data');
  }

  @override
  UserStatusHeartbeat_Ocs rebuild(void Function(UserStatusHeartbeat_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusHeartbeat_OcsBuilder toBuilder() => UserStatusHeartbeat_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusHeartbeat_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusHeartbeat_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusHeartbeat_OcsBuilder implements Builder<UserStatusHeartbeat_Ocs, UserStatusHeartbeat_OcsBuilder> {
  _$UserStatusHeartbeat_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusHeartbeat_Ocs_DataBuilder? _data;
  UserStatusHeartbeat_Ocs_DataBuilder get data => _$this._data ??= UserStatusHeartbeat_Ocs_DataBuilder();
  set data(UserStatusHeartbeat_Ocs_DataBuilder? data) => _$this._data = data;

  UserStatusHeartbeat_OcsBuilder();

  UserStatusHeartbeat_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusHeartbeat_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusHeartbeat_Ocs;
  }

  @override
  void update(void Function(UserStatusHeartbeat_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusHeartbeat_Ocs build() => _build();

  _$UserStatusHeartbeat_Ocs _build() {
    _$UserStatusHeartbeat_Ocs _$result;
    try {
      _$result = _$v ?? _$UserStatusHeartbeat_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusHeartbeat_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusHeartbeat extends UserStatusHeartbeat {
  @override
  final UserStatusHeartbeat_Ocs ocs;

  factory _$UserStatusHeartbeat([void Function(UserStatusHeartbeatBuilder)? updates]) =>
      (UserStatusHeartbeatBuilder()..update(updates))._build();

  _$UserStatusHeartbeat._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusHeartbeat', 'ocs');
  }

  @override
  UserStatusHeartbeat rebuild(void Function(UserStatusHeartbeatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusHeartbeatBuilder toBuilder() => UserStatusHeartbeatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusHeartbeat && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusHeartbeat')..add('ocs', ocs)).toString();
  }
}

class UserStatusHeartbeatBuilder implements Builder<UserStatusHeartbeat, UserStatusHeartbeatBuilder> {
  _$UserStatusHeartbeat? _$v;

  UserStatusHeartbeat_OcsBuilder? _ocs;
  UserStatusHeartbeat_OcsBuilder get ocs => _$this._ocs ??= UserStatusHeartbeat_OcsBuilder();
  set ocs(UserStatusHeartbeat_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusHeartbeatBuilder();

  UserStatusHeartbeatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusHeartbeat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusHeartbeat;
  }

  @override
  void update(void Function(UserStatusHeartbeatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusHeartbeat build() => _build();

  _$UserStatusHeartbeat _build() {
    _$UserStatusHeartbeat _$result;
    try {
      _$result = _$v ?? _$UserStatusHeartbeat._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusHeartbeat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusEmptyOCS_Ocs extends UserStatusEmptyOCS_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final BuiltList<JsonObject> data;

  factory _$UserStatusEmptyOCS_Ocs([void Function(UserStatusEmptyOCS_OcsBuilder)? updates]) =>
      (UserStatusEmptyOCS_OcsBuilder()..update(updates))._build();

  _$UserStatusEmptyOCS_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusEmptyOCS_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusEmptyOCS_Ocs', 'data');
  }

  @override
  UserStatusEmptyOCS_Ocs rebuild(void Function(UserStatusEmptyOCS_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusEmptyOCS_OcsBuilder toBuilder() => UserStatusEmptyOCS_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusEmptyOCS_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusEmptyOCS_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusEmptyOCS_OcsBuilder implements Builder<UserStatusEmptyOCS_Ocs, UserStatusEmptyOCS_OcsBuilder> {
  _$UserStatusEmptyOCS_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(ListBuilder<JsonObject>? data) => _$this._data = data;

  UserStatusEmptyOCS_OcsBuilder();

  UserStatusEmptyOCS_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusEmptyOCS_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusEmptyOCS_Ocs;
  }

  @override
  void update(void Function(UserStatusEmptyOCS_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusEmptyOCS_Ocs build() => _build();

  _$UserStatusEmptyOCS_Ocs _build() {
    _$UserStatusEmptyOCS_Ocs _$result;
    try {
      _$result = _$v ?? _$UserStatusEmptyOCS_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusEmptyOCS_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusEmptyOCS extends UserStatusEmptyOCS {
  @override
  final UserStatusEmptyOCS_Ocs ocs;

  factory _$UserStatusEmptyOCS([void Function(UserStatusEmptyOCSBuilder)? updates]) =>
      (UserStatusEmptyOCSBuilder()..update(updates))._build();

  _$UserStatusEmptyOCS._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusEmptyOCS', 'ocs');
  }

  @override
  UserStatusEmptyOCS rebuild(void Function(UserStatusEmptyOCSBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusEmptyOCSBuilder toBuilder() => UserStatusEmptyOCSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusEmptyOCS && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusEmptyOCS')..add('ocs', ocs)).toString();
  }
}

class UserStatusEmptyOCSBuilder implements Builder<UserStatusEmptyOCS, UserStatusEmptyOCSBuilder> {
  _$UserStatusEmptyOCS? _$v;

  UserStatusEmptyOCS_OcsBuilder? _ocs;
  UserStatusEmptyOCS_OcsBuilder get ocs => _$this._ocs ??= UserStatusEmptyOCS_OcsBuilder();
  set ocs(UserStatusEmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusEmptyOCSBuilder();

  UserStatusEmptyOCSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusEmptyOCS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusEmptyOCS;
  }

  @override
  void update(void Function(UserStatusEmptyOCSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusEmptyOCS build() => _build();

  _$UserStatusEmptyOCS _build() {
    _$UserStatusEmptyOCS _$result;
    try {
      _$result = _$v ?? _$UserStatusEmptyOCS._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusEmptyOCS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
