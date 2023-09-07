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

const UserStatusClearAtTimeType _$userStatusClearAtTimeTypeDay = UserStatusClearAtTimeType._('day');
const UserStatusClearAtTimeType _$userStatusClearAtTimeTypeWeek = UserStatusClearAtTimeType._('week');

UserStatusClearAtTimeType _$valueOfUserStatusClearAtTimeType(String name) {
  switch (name) {
    case 'day':
      return _$userStatusClearAtTimeTypeDay;
    case 'week':
      return _$userStatusClearAtTimeTypeWeek;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UserStatusClearAtTimeType> _$userStatusClearAtTimeTypeValues =
    BuiltSet<UserStatusClearAtTimeType>(const <UserStatusClearAtTimeType>[
  _$userStatusClearAtTimeTypeDay,
  _$userStatusClearAtTimeTypeWeek,
]);

Serializer<UserStatusOCSMeta> _$userStatusOCSMetaSerializer = _$UserStatusOCSMetaSerializer();
Serializer<UserStatusPublic> _$userStatusPublicSerializer = _$UserStatusPublicSerializer();
Serializer<UserStatusPrivate> _$userStatusPrivateSerializer = _$UserStatusPrivateSerializer();
Serializer<UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs>
    _$userStatusHeartbeatHeartbeatResponseApplicationJsonOcsSerializer =
    _$UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsSerializer();
Serializer<UserStatusHeartbeatHeartbeatResponseApplicationJson>
    _$userStatusHeartbeatHeartbeatResponseApplicationJsonSerializer =
    _$UserStatusHeartbeatHeartbeatResponseApplicationJsonSerializer();
Serializer<UserStatusClearAt_Type> _$userStatusClearAtTypeSerializer = _$UserStatusClearAt_TypeSerializer();
Serializer<UserStatusClearAtTimeType> _$userStatusClearAtTimeTypeSerializer = _$UserStatusClearAtTimeTypeSerializer();
Serializer<UserStatusClearAt> _$userStatusClearAtSerializer = _$UserStatusClearAtSerializer();
Serializer<UserStatusPredefined> _$userStatusPredefinedSerializer = _$UserStatusPredefinedSerializer();
Serializer<UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs>
    _$userStatusPredefinedStatusFindAllResponseApplicationJsonOcsSerializer =
    _$UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsSerializer();
Serializer<UserStatusPredefinedStatusFindAllResponseApplicationJson>
    _$userStatusPredefinedStatusFindAllResponseApplicationJsonSerializer =
    _$UserStatusPredefinedStatusFindAllResponseApplicationJsonSerializer();
Serializer<UserStatusStatusesFindAllResponseApplicationJson_Ocs>
    _$userStatusStatusesFindAllResponseApplicationJsonOcsSerializer =
    _$UserStatusStatusesFindAllResponseApplicationJson_OcsSerializer();
Serializer<UserStatusStatusesFindAllResponseApplicationJson>
    _$userStatusStatusesFindAllResponseApplicationJsonSerializer =
    _$UserStatusStatusesFindAllResponseApplicationJsonSerializer();
Serializer<UserStatusStatusesFindResponseApplicationJson_Ocs>
    _$userStatusStatusesFindResponseApplicationJsonOcsSerializer =
    _$UserStatusStatusesFindResponseApplicationJson_OcsSerializer();
Serializer<UserStatusStatusesFindResponseApplicationJson> _$userStatusStatusesFindResponseApplicationJsonSerializer =
    _$UserStatusStatusesFindResponseApplicationJsonSerializer();
Serializer<UserStatusUserStatusGetStatusResponseApplicationJson_Ocs>
    _$userStatusUserStatusGetStatusResponseApplicationJsonOcsSerializer =
    _$UserStatusUserStatusGetStatusResponseApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusGetStatusResponseApplicationJson>
    _$userStatusUserStatusGetStatusResponseApplicationJsonSerializer =
    _$UserStatusUserStatusGetStatusResponseApplicationJsonSerializer();
Serializer<UserStatusUserStatusSetStatusResponseApplicationJson_Ocs>
    _$userStatusUserStatusSetStatusResponseApplicationJsonOcsSerializer =
    _$UserStatusUserStatusSetStatusResponseApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusSetStatusResponseApplicationJson>
    _$userStatusUserStatusSetStatusResponseApplicationJsonSerializer =
    _$UserStatusUserStatusSetStatusResponseApplicationJsonSerializer();
Serializer<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs>
    _$userStatusUserStatusSetPredefinedMessageResponseApplicationJsonOcsSerializer =
    _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson>
    _$userStatusUserStatusSetPredefinedMessageResponseApplicationJsonSerializer =
    _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonSerializer();
Serializer<UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs>
    _$userStatusUserStatusSetCustomMessageResponseApplicationJsonOcsSerializer =
    _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusSetCustomMessageResponseApplicationJson>
    _$userStatusUserStatusSetCustomMessageResponseApplicationJsonSerializer =
    _$UserStatusUserStatusSetCustomMessageResponseApplicationJsonSerializer();
Serializer<UserStatusUserStatusClearMessageResponseApplicationJson_Ocs>
    _$userStatusUserStatusClearMessageResponseApplicationJsonOcsSerializer =
    _$UserStatusUserStatusClearMessageResponseApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusClearMessageResponseApplicationJson>
    _$userStatusUserStatusClearMessageResponseApplicationJsonSerializer =
    _$UserStatusUserStatusClearMessageResponseApplicationJsonSerializer();
Serializer<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs>
    _$userStatusUserStatusRevertStatusResponseApplicationJsonOcsSerializer =
    _$UserStatusUserStatusRevertStatusResponseApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusRevertStatusResponseApplicationJson>
    _$userStatusUserStatusRevertStatusResponseApplicationJsonSerializer =
    _$UserStatusUserStatusRevertStatusResponseApplicationJsonSerializer();
Serializer<UserStatusCapabilities_UserStatus> _$userStatusCapabilitiesUserStatusSerializer =
    _$UserStatusCapabilities_UserStatusSerializer();
Serializer<UserStatusCapabilities> _$userStatusCapabilitiesSerializer = _$UserStatusCapabilitiesSerializer();

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

class _$UserStatusPublicSerializer implements StructuredSerializer<UserStatusPublic> {
  @override
  final Iterable<Type> types = const [UserStatusPublic, _$UserStatusPublic];
  @override
  final String wireName = 'UserStatusPublic';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPublic object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
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
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UserStatusPublic deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPublicBuilder();

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
          result.clearAt = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusPrivateSerializer implements StructuredSerializer<UserStatusPrivate> {
  @override
  final Iterable<Type> types = const [UserStatusPrivate, _$UserStatusPrivate];
  @override
  final String wireName = 'UserStatusPrivate';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPrivate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'messageIsPredefined',
      serializers.serialize(object.messageIsPredefined, specifiedType: const FullType(bool)),
      'statusIsUserDefined',
      serializers.serialize(object.statusIsUserDefined, specifiedType: const FullType(bool)),
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
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.messageId;
    if (value != null) {
      result
        ..add('messageId')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserStatusPrivate deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPrivateBuilder();

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
          result.clearAt = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
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

class _$UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs,
    _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusPrivate)),
    ];

    return result;
  }

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(UserStatusPrivate))! as UserStatusPrivate);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusHeartbeatHeartbeatResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusHeartbeatHeartbeatResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusHeartbeatHeartbeatResponseApplicationJson,
    _$UserStatusHeartbeatHeartbeatResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusHeartbeatHeartbeatResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusHeartbeatHeartbeatResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs))!
              as UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs);
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

class _$UserStatusClearAtTimeTypeSerializer implements PrimitiveSerializer<UserStatusClearAtTimeType> {
  @override
  final Iterable<Type> types = const <Type>[UserStatusClearAtTimeType];
  @override
  final String wireName = 'UserStatusClearAtTimeType';

  @override
  Object serialize(Serializers serializers, UserStatusClearAtTimeType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  UserStatusClearAtTimeType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserStatusClearAtTimeType.valueOf(serialized as String);
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

class _$UserStatusPredefinedSerializer implements StructuredSerializer<UserStatusPredefined> {
  @override
  final Iterable<Type> types = const [UserStatusPredefined, _$UserStatusPredefined];
  @override
  final String wireName = 'UserStatusPredefined';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPredefined object,
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
        ..add(serializers.serialize(value, specifiedType: const FullType(UserStatusClearAt)));
    }
    value = object.visible;
    if (value != null) {
      result
        ..add('visible')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  UserStatusPredefined deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(UserStatusClearAt))! as UserStatusClearAt);
          break;
        case 'visible':
          result.visible = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs,
    _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(UserStatusPredefined)])),
    ];

    return result;
  }

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(BuiltList, [FullType(UserStatusPredefined)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusPredefinedStatusFindAllResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusPredefinedStatusFindAllResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusPredefinedStatusFindAllResponseApplicationJson,
    _$UserStatusPredefinedStatusFindAllResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusPredefinedStatusFindAllResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusPredefinedStatusFindAllResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs))!
              as UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusStatusesFindAllResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusStatusesFindAllResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindAllResponseApplicationJson_Ocs,
    _$UserStatusStatusesFindAllResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusStatusesFindAllResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindAllResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(UserStatusPublic)])),
    ];

    return result;
  }

  @override
  UserStatusStatusesFindAllResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(BuiltList, [FullType(UserStatusPublic)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusStatusesFindAllResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusStatusesFindAllResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindAllResponseApplicationJson,
    _$UserStatusStatusesFindAllResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusStatusesFindAllResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindAllResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusStatusesFindAllResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusStatusesFindAllResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindAllResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusStatusesFindAllResponseApplicationJson_Ocs))!
              as UserStatusStatusesFindAllResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusStatusesFindResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusStatusesFindResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindResponseApplicationJson_Ocs,
    _$UserStatusStatusesFindResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusStatusesFindResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusPublic)),
    ];

    return result;
  }

  @override
  UserStatusStatusesFindResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindResponseApplicationJson_OcsBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(UserStatusPublic))! as UserStatusPublic);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusStatusesFindResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusStatusesFindResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindResponseApplicationJson,
    _$UserStatusStatusesFindResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusStatusesFindResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusStatusesFindResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusStatusesFindResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusStatusesFindResponseApplicationJson_Ocs))!
              as UserStatusStatusesFindResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusGetStatusResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusGetStatusResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusGetStatusResponseApplicationJson_Ocs,
    _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusGetStatusResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusGetStatusResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusPrivate)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusGetStatusResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(UserStatusPrivate))! as UserStatusPrivate);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusGetStatusResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusGetStatusResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusGetStatusResponseApplicationJson,
    _$UserStatusUserStatusGetStatusResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusGetStatusResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusGetStatusResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusGetStatusResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusGetStatusResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusGetStatusResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusGetStatusResponseApplicationJson_Ocs))!
              as UserStatusUserStatusGetStatusResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetStatusResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusSetStatusResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetStatusResponseApplicationJson_Ocs,
    _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetStatusResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusSetStatusResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusPrivate)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetStatusResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(UserStatusPrivate))! as UserStatusPrivate);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetStatusResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusSetStatusResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetStatusResponseApplicationJson,
    _$UserStatusUserStatusSetStatusResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetStatusResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusSetStatusResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusSetStatusResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetStatusResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetStatusResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusSetStatusResponseApplicationJson_Ocs))!
              as UserStatusUserStatusSetStatusResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
    _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusPrivate)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(UserStatusPrivate))! as UserStatusPrivate);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetPredefinedMessageResponseApplicationJson,
    _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetPredefinedMessageResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs))!
              as UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs,
    _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UserStatusPrivate)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(UserStatusPrivate))! as UserStatusPrivate);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetCustomMessageResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusSetCustomMessageResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetCustomMessageResponseApplicationJson,
    _$UserStatusUserStatusSetCustomMessageResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetCustomMessageResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetCustomMessageResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs))!
              as UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusClearMessageResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusClearMessageResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusClearMessageResponseApplicationJson_Ocs,
    _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusClearMessageResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusClearMessageResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusClearMessageResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder();

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
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusClearMessageResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusClearMessageResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusClearMessageResponseApplicationJson,
    _$UserStatusUserStatusClearMessageResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusClearMessageResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusClearMessageResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusClearMessageResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusClearMessageResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusClearMessageResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusClearMessageResponseApplicationJson_Ocs))!
              as UserStatusUserStatusClearMessageResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusRevertStatusResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs,
    _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder();

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
                  specifiedType: const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data))!
              as UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusRevertStatusResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusRevertStatusResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusRevertStatusResponseApplicationJson,
    _$UserStatusUserStatusRevertStatusResponseApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusRevertStatusResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusRevertStatusResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs))!
              as UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusCapabilities_UserStatusSerializer implements StructuredSerializer<UserStatusCapabilities_UserStatus> {
  @override
  final Iterable<Type> types = const [UserStatusCapabilities_UserStatus, _$UserStatusCapabilities_UserStatus];
  @override
  final String wireName = 'UserStatusCapabilities_UserStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusCapabilities_UserStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'restore',
      serializers.serialize(object.restore, specifiedType: const FullType(bool)),
      'supports_emoji',
      serializers.serialize(object.supportsEmoji, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UserStatusCapabilities_UserStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusCapabilities_UserStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'restore':
          result.restore = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'supports_emoji':
          result.supportsEmoji = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusCapabilitiesSerializer implements StructuredSerializer<UserStatusCapabilities> {
  @override
  final Iterable<Type> types = const [UserStatusCapabilities, _$UserStatusCapabilities];
  @override
  final String wireName = 'UserStatusCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user_status',
      serializers.serialize(object.userStatus, specifiedType: const FullType(UserStatusCapabilities_UserStatus)),
    ];

    return result;
  }

  @override
  UserStatusCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_status':
          result.userStatus.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStatusCapabilities_UserStatus))! as UserStatusCapabilities_UserStatus);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class UserStatusOCSMetaInterfaceBuilder {
  void replace(UserStatusOCSMetaInterface other);
  void update(void Function(UserStatusOCSMetaInterfaceBuilder) updates);
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

class UserStatusOCSMetaBuilder
    implements Builder<UserStatusOCSMeta, UserStatusOCSMetaBuilder>, UserStatusOCSMetaInterfaceBuilder {
  _$UserStatusOCSMeta? _$v;

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
  void replace(covariant UserStatusOCSMeta other) {
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

abstract mixin class UserStatusPublicInterfaceBuilder {
  void replace(UserStatusPublicInterface other);
  void update(void Function(UserStatusPublicInterfaceBuilder) updates);
  String? get userId;
  set userId(String? userId);

  String? get message;
  set message(String? message);

  String? get icon;
  set icon(String? icon);

  int? get clearAt;
  set clearAt(int? clearAt);

  String? get status;
  set status(String? status);
}

class _$UserStatusPublic extends UserStatusPublic {
  @override
  final String userId;
  @override
  final String? message;
  @override
  final String? icon;
  @override
  final int? clearAt;
  @override
  final String status;

  factory _$UserStatusPublic([void Function(UserStatusPublicBuilder)? updates]) =>
      (UserStatusPublicBuilder()..update(updates))._build();

  _$UserStatusPublic._({required this.userId, this.message, this.icon, this.clearAt, required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'UserStatusPublic', 'userId');
    BuiltValueNullFieldError.checkNotNull(status, r'UserStatusPublic', 'status');
  }

  @override
  UserStatusPublic rebuild(void Function(UserStatusPublicBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UserStatusPublicBuilder toBuilder() => UserStatusPublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPublic &&
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
    return (newBuiltValueToStringHelper(r'UserStatusPublic')
          ..add('userId', userId)
          ..add('message', message)
          ..add('icon', icon)
          ..add('clearAt', clearAt)
          ..add('status', status))
        .toString();
  }
}

class UserStatusPublicBuilder
    implements Builder<UserStatusPublic, UserStatusPublicBuilder>, UserStatusPublicInterfaceBuilder {
  _$UserStatusPublic? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  int? _clearAt;
  int? get clearAt => _$this._clearAt;
  set clearAt(covariant int? clearAt) => _$this._clearAt = clearAt;

  String? _status;
  String? get status => _$this._status;
  set status(covariant String? status) => _$this._status = status;

  UserStatusPublicBuilder();

  UserStatusPublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _message = $v.message;
      _icon = $v.icon;
      _clearAt = $v.clearAt;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusPublic other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPublic;
  }

  @override
  void update(void Function(UserStatusPublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPublic build() => _build();

  _$UserStatusPublic _build() {
    final _$result = _$v ??
        _$UserStatusPublic._(
            userId: BuiltValueNullFieldError.checkNotNull(userId, r'UserStatusPublic', 'userId'),
            message: message,
            icon: icon,
            clearAt: clearAt,
            status: BuiltValueNullFieldError.checkNotNull(status, r'UserStatusPublic', 'status'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusPrivate_1InterfaceBuilder {
  void replace(UserStatusPrivate_1Interface other);
  void update(void Function(UserStatusPrivate_1InterfaceBuilder) updates);
  String? get messageId;
  set messageId(String? messageId);

  bool? get messageIsPredefined;
  set messageIsPredefined(bool? messageIsPredefined);

  bool? get statusIsUserDefined;
  set statusIsUserDefined(bool? statusIsUserDefined);
}

class _$UserStatusPrivate extends UserStatusPrivate {
  @override
  final String userId;
  @override
  final String? message;
  @override
  final String? icon;
  @override
  final int? clearAt;
  @override
  final String status;
  @override
  final String? messageId;
  @override
  final bool messageIsPredefined;
  @override
  final bool statusIsUserDefined;

  factory _$UserStatusPrivate([void Function(UserStatusPrivateBuilder)? updates]) =>
      (UserStatusPrivateBuilder()..update(updates))._build();

  _$UserStatusPrivate._(
      {required this.userId,
      this.message,
      this.icon,
      this.clearAt,
      required this.status,
      this.messageId,
      required this.messageIsPredefined,
      required this.statusIsUserDefined})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'UserStatusPrivate', 'userId');
    BuiltValueNullFieldError.checkNotNull(status, r'UserStatusPrivate', 'status');
    BuiltValueNullFieldError.checkNotNull(messageIsPredefined, r'UserStatusPrivate', 'messageIsPredefined');
    BuiltValueNullFieldError.checkNotNull(statusIsUserDefined, r'UserStatusPrivate', 'statusIsUserDefined');
  }

  @override
  UserStatusPrivate rebuild(void Function(UserStatusPrivateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  UserStatusPrivateBuilder toBuilder() => UserStatusPrivateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPrivate &&
        userId == other.userId &&
        message == other.message &&
        icon == other.icon &&
        clearAt == other.clearAt &&
        status == other.status &&
        messageId == other.messageId &&
        messageIsPredefined == other.messageIsPredefined &&
        statusIsUserDefined == other.statusIsUserDefined;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, messageId.hashCode);
    _$hash = $jc(_$hash, messageIsPredefined.hashCode);
    _$hash = $jc(_$hash, statusIsUserDefined.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusPrivate')
          ..add('userId', userId)
          ..add('message', message)
          ..add('icon', icon)
          ..add('clearAt', clearAt)
          ..add('status', status)
          ..add('messageId', messageId)
          ..add('messageIsPredefined', messageIsPredefined)
          ..add('statusIsUserDefined', statusIsUserDefined))
        .toString();
  }
}

class UserStatusPrivateBuilder
    implements
        Builder<UserStatusPrivate, UserStatusPrivateBuilder>,
        UserStatusPublicInterfaceBuilder,
        UserStatusPrivate_1InterfaceBuilder {
  _$UserStatusPrivate? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  int? _clearAt;
  int? get clearAt => _$this._clearAt;
  set clearAt(covariant int? clearAt) => _$this._clearAt = clearAt;

  String? _status;
  String? get status => _$this._status;
  set status(covariant String? status) => _$this._status = status;

  String? _messageId;
  String? get messageId => _$this._messageId;
  set messageId(covariant String? messageId) => _$this._messageId = messageId;

  bool? _messageIsPredefined;
  bool? get messageIsPredefined => _$this._messageIsPredefined;
  set messageIsPredefined(covariant bool? messageIsPredefined) => _$this._messageIsPredefined = messageIsPredefined;

  bool? _statusIsUserDefined;
  bool? get statusIsUserDefined => _$this._statusIsUserDefined;
  set statusIsUserDefined(covariant bool? statusIsUserDefined) => _$this._statusIsUserDefined = statusIsUserDefined;

  UserStatusPrivateBuilder();

  UserStatusPrivateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _message = $v.message;
      _icon = $v.icon;
      _clearAt = $v.clearAt;
      _status = $v.status;
      _messageId = $v.messageId;
      _messageIsPredefined = $v.messageIsPredefined;
      _statusIsUserDefined = $v.statusIsUserDefined;
      _$v = null;
    }
    return this;
  }

  @override
// ignore: override_on_non_overriding_method
  void replace(covariant UserStatusPrivate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPrivate;
  }

  @override
  void update(void Function(UserStatusPrivateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPrivate build() => _build();

  _$UserStatusPrivate _build() {
    final _$result = _$v ??
        _$UserStatusPrivate._(
            userId: BuiltValueNullFieldError.checkNotNull(userId, r'UserStatusPrivate', 'userId'),
            message: message,
            icon: icon,
            clearAt: clearAt,
            status: BuiltValueNullFieldError.checkNotNull(status, r'UserStatusPrivate', 'status'),
            messageId: messageId,
            messageIsPredefined:
                BuiltValueNullFieldError.checkNotNull(messageIsPredefined, r'UserStatusPrivate', 'messageIsPredefined'),
            statusIsUserDefined: BuiltValueNullFieldError.checkNotNull(
                statusIsUserDefined, r'UserStatusPrivate', 'statusIsUserDefined'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs
    extends UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs(
          [void Function(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs,
            UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder>,
        UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder();

  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs build() => _build();

  _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs _build() {
    _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusHeartbeatHeartbeatResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusHeartbeatHeartbeatResponseApplicationJsonInterface other);
  void update(void Function(UserStatusHeartbeatHeartbeatResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusHeartbeatHeartbeatResponseApplicationJson
    extends UserStatusHeartbeatHeartbeatResponseApplicationJson {
  @override
  final UserStatusHeartbeatHeartbeatResponseApplicationJson_Ocs ocs;

  factory _$UserStatusHeartbeatHeartbeatResponseApplicationJson(
          [void Function(UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusHeartbeatHeartbeatResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusHeartbeatHeartbeatResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJson rebuild(
          void Function(UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder toBuilder() =>
      UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusHeartbeatHeartbeatResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusHeartbeatHeartbeatResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder
    implements
        Builder<UserStatusHeartbeatHeartbeatResponseApplicationJson,
            UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder>,
        UserStatusHeartbeatHeartbeatResponseApplicationJsonInterfaceBuilder {
  _$UserStatusHeartbeatHeartbeatResponseApplicationJson? _$v;

  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusHeartbeatHeartbeatResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder();

  UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusHeartbeatHeartbeatResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusHeartbeatHeartbeatResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusHeartbeatHeartbeatResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusHeartbeatHeartbeatResponseApplicationJson build() => _build();

  _$UserStatusHeartbeatHeartbeatResponseApplicationJson _build() {
    _$UserStatusHeartbeatHeartbeatResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusHeartbeatHeartbeatResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusHeartbeatHeartbeatResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusClearAt_Time extends UserStatusClearAt_Time {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final UserStatusClearAtTimeType? clearAtTimeType;

  factory _$UserStatusClearAt_Time([void Function(UserStatusClearAt_TimeBuilder)? updates]) =>
      (UserStatusClearAt_TimeBuilder()..update(updates))._build();

  _$UserStatusClearAt_Time._({required this.data, this.$int, this.clearAtTimeType}) : super._() {
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
        $int == other.$int &&
        clearAtTimeType == other.clearAtTimeType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jc(_$hash, clearAtTimeType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusClearAt_Time')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('clearAtTimeType', clearAtTimeType))
        .toString();
  }
}

class UserStatusClearAt_TimeBuilder implements Builder<UserStatusClearAt_Time, UserStatusClearAt_TimeBuilder> {
  _$UserStatusClearAt_Time? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  UserStatusClearAtTimeType? _clearAtTimeType;
  UserStatusClearAtTimeType? get clearAtTimeType => _$this._clearAtTimeType;
  set clearAtTimeType(UserStatusClearAtTimeType? clearAtTimeType) => _$this._clearAtTimeType = clearAtTimeType;

  UserStatusClearAt_TimeBuilder();

  UserStatusClearAt_TimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$int = $v.$int;
      _clearAtTimeType = $v.clearAtTimeType;
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
            $int: $int,
            clearAtTimeType: clearAtTimeType);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusClearAtInterfaceBuilder {
  void replace(UserStatusClearAtInterface other);
  void update(void Function(UserStatusClearAtInterfaceBuilder) updates);
  UserStatusClearAt_Type? get type;
  set type(UserStatusClearAt_Type? type);

  UserStatusClearAt_TimeBuilder get time;
  set time(UserStatusClearAt_TimeBuilder? time);
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

class UserStatusClearAtBuilder
    implements Builder<UserStatusClearAt, UserStatusClearAtBuilder>, UserStatusClearAtInterfaceBuilder {
  _$UserStatusClearAt? _$v;

  UserStatusClearAt_Type? _type;
  UserStatusClearAt_Type? get type => _$this._type;
  set type(covariant UserStatusClearAt_Type? type) => _$this._type = type;

  UserStatusClearAt_TimeBuilder? _time;
  UserStatusClearAt_TimeBuilder get time => _$this._time ??= UserStatusClearAt_TimeBuilder();
  set time(covariant UserStatusClearAt_TimeBuilder? time) => _$this._time = time;

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
  void replace(covariant UserStatusClearAt other) {
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

abstract mixin class UserStatusPredefinedInterfaceBuilder {
  void replace(UserStatusPredefinedInterface other);
  void update(void Function(UserStatusPredefinedInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get icon;
  set icon(String? icon);

  String? get message;
  set message(String? message);

  UserStatusClearAtBuilder get clearAt;
  set clearAt(UserStatusClearAtBuilder? clearAt);

  bool? get visible;
  set visible(bool? visible);
}

class _$UserStatusPredefined extends UserStatusPredefined {
  @override
  final String id;
  @override
  final String icon;
  @override
  final String message;
  @override
  final UserStatusClearAt? clearAt;
  @override
  final bool? visible;

  factory _$UserStatusPredefined([void Function(UserStatusPredefinedBuilder)? updates]) =>
      (UserStatusPredefinedBuilder()..update(updates))._build();

  _$UserStatusPredefined._({required this.id, required this.icon, required this.message, this.clearAt, this.visible})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserStatusPredefined', 'id');
    BuiltValueNullFieldError.checkNotNull(icon, r'UserStatusPredefined', 'icon');
    BuiltValueNullFieldError.checkNotNull(message, r'UserStatusPredefined', 'message');
  }

  @override
  UserStatusPredefined rebuild(void Function(UserStatusPredefinedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedBuilder toBuilder() => UserStatusPredefinedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefined &&
        id == other.id &&
        icon == other.icon &&
        message == other.message &&
        clearAt == other.clearAt &&
        visible == other.visible;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jc(_$hash, visible.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusPredefined')
          ..add('id', id)
          ..add('icon', icon)
          ..add('message', message)
          ..add('clearAt', clearAt)
          ..add('visible', visible))
        .toString();
  }
}

class UserStatusPredefinedBuilder
    implements Builder<UserStatusPredefined, UserStatusPredefinedBuilder>, UserStatusPredefinedInterfaceBuilder {
  _$UserStatusPredefined? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  UserStatusClearAtBuilder? _clearAt;
  UserStatusClearAtBuilder get clearAt => _$this._clearAt ??= UserStatusClearAtBuilder();
  set clearAt(covariant UserStatusClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  bool? _visible;
  bool? get visible => _$this._visible;
  set visible(covariant bool? visible) => _$this._visible = visible;

  UserStatusPredefinedBuilder();

  UserStatusPredefinedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _icon = $v.icon;
      _message = $v.message;
      _clearAt = $v.clearAt?.toBuilder();
      _visible = $v.visible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusPredefined other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefined;
  }

  @override
  void update(void Function(UserStatusPredefinedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefined build() => _build();

  _$UserStatusPredefined _build() {
    _$UserStatusPredefined _$result;
    try {
      _$result = _$v ??
          _$UserStatusPredefined._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'UserStatusPredefined', 'id'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'UserStatusPredefined', 'icon'),
              message: BuiltValueNullFieldError.checkNotNull(message, r'UserStatusPredefined', 'message'),
              clearAt: _clearAt?.build(),
              visible: visible);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusPredefined', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  ListBuilder<UserStatusPredefined> get data;
  set data(ListBuilder<UserStatusPredefined>? data);
}

class _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs
    extends UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final BuiltList<UserStatusPredefined> data;

  factory _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs(
          [void Function(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs,
            UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder>,
        UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<UserStatusPredefined>? _data;
  ListBuilder<UserStatusPredefined> get data => _$this._data ??= ListBuilder<UserStatusPredefined>();
  set data(covariant ListBuilder<UserStatusPredefined>? data) => _$this._data = data;

  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder();

  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs build() => _build();

  _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs _build() {
    _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusPredefinedStatusFindAllResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusPredefinedStatusFindAllResponseApplicationJsonInterface other);
  void update(void Function(UserStatusPredefinedStatusFindAllResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusPredefinedStatusFindAllResponseApplicationJson
    extends UserStatusPredefinedStatusFindAllResponseApplicationJson {
  @override
  final UserStatusPredefinedStatusFindAllResponseApplicationJson_Ocs ocs;

  factory _$UserStatusPredefinedStatusFindAllResponseApplicationJson(
          [void Function(UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatusFindAllResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusPredefinedStatusFindAllResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJson rebuild(
          void Function(UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder toBuilder() =>
      UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatusFindAllResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatusFindAllResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder
    implements
        Builder<UserStatusPredefinedStatusFindAllResponseApplicationJson,
            UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder>,
        UserStatusPredefinedStatusFindAllResponseApplicationJsonInterfaceBuilder {
  _$UserStatusPredefinedStatusFindAllResponseApplicationJson? _$v;

  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusPredefinedStatusFindAllResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder();

  UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusPredefinedStatusFindAllResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatusFindAllResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusPredefinedStatusFindAllResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatusFindAllResponseApplicationJson build() => _build();

  _$UserStatusPredefinedStatusFindAllResponseApplicationJson _build() {
    _$UserStatusPredefinedStatusFindAllResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusPredefinedStatusFindAllResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusPredefinedStatusFindAllResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindAllResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusStatusesFindAllResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusStatusesFindAllResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  ListBuilder<UserStatusPublic> get data;
  set data(ListBuilder<UserStatusPublic>? data);
}

class _$UserStatusStatusesFindAllResponseApplicationJson_Ocs
    extends UserStatusStatusesFindAllResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final BuiltList<UserStatusPublic> data;

  factory _$UserStatusStatusesFindAllResponseApplicationJson_Ocs(
          [void Function(UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusStatusesFindAllResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusStatusesFindAllResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusStatusesFindAllResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusStatusesFindAllResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindAllResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindAllResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusStatusesFindAllResponseApplicationJson_Ocs,
            UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder>,
        UserStatusStatusesFindAllResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusStatusesFindAllResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<UserStatusPublic>? _data;
  ListBuilder<UserStatusPublic> get data => _$this._data ??= ListBuilder<UserStatusPublic>();
  set data(covariant ListBuilder<UserStatusPublic>? data) => _$this._data = data;

  UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder();

  UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindAllResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindAllResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindAllResponseApplicationJson_Ocs build() => _build();

  _$UserStatusStatusesFindAllResponseApplicationJson_Ocs _build() {
    _$UserStatusStatusesFindAllResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UserStatusStatusesFindAllResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusStatusesFindAllResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindAllResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusStatusesFindAllResponseApplicationJsonInterface other);
  void update(void Function(UserStatusStatusesFindAllResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusStatusesFindAllResponseApplicationJson extends UserStatusStatusesFindAllResponseApplicationJson {
  @override
  final UserStatusStatusesFindAllResponseApplicationJson_Ocs ocs;

  factory _$UserStatusStatusesFindAllResponseApplicationJson(
          [void Function(UserStatusStatusesFindAllResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusStatusesFindAllResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusStatusesFindAllResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusStatusesFindAllResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusStatusesFindAllResponseApplicationJson rebuild(
          void Function(UserStatusStatusesFindAllResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindAllResponseApplicationJsonBuilder toBuilder() =>
      UserStatusStatusesFindAllResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindAllResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindAllResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusStatusesFindAllResponseApplicationJsonBuilder
    implements
        Builder<UserStatusStatusesFindAllResponseApplicationJson,
            UserStatusStatusesFindAllResponseApplicationJsonBuilder>,
        UserStatusStatusesFindAllResponseApplicationJsonInterfaceBuilder {
  _$UserStatusStatusesFindAllResponseApplicationJson? _$v;

  UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusStatusesFindAllResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusStatusesFindAllResponseApplicationJsonBuilder();

  UserStatusStatusesFindAllResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindAllResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindAllResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusStatusesFindAllResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindAllResponseApplicationJson build() => _build();

  _$UserStatusStatusesFindAllResponseApplicationJson _build() {
    _$UserStatusStatusesFindAllResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusStatusesFindAllResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusStatusesFindAllResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusStatusesFindResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusStatusesFindResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPublicBuilder get data;
  set data(UserStatusPublicBuilder? data);
}

class _$UserStatusStatusesFindResponseApplicationJson_Ocs extends UserStatusStatusesFindResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPublic data;

  factory _$UserStatusStatusesFindResponseApplicationJson_Ocs(
          [void Function(UserStatusStatusesFindResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusStatusesFindResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusStatusesFindResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusStatusesFindResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusStatusesFindResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusStatusesFindResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusStatusesFindResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusStatusesFindResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusStatusesFindResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusStatusesFindResponseApplicationJson_Ocs,
            UserStatusStatusesFindResponseApplicationJson_OcsBuilder>,
        UserStatusStatusesFindResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusStatusesFindResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPublicBuilder? _data;
  UserStatusPublicBuilder get data => _$this._data ??= UserStatusPublicBuilder();
  set data(covariant UserStatusPublicBuilder? data) => _$this._data = data;

  UserStatusStatusesFindResponseApplicationJson_OcsBuilder();

  UserStatusStatusesFindResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusStatusesFindResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindResponseApplicationJson_Ocs build() => _build();

  _$UserStatusStatusesFindResponseApplicationJson_Ocs _build() {
    _$UserStatusStatusesFindResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$UserStatusStatusesFindResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusStatusesFindResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusStatusesFindResponseApplicationJsonInterface other);
  void update(void Function(UserStatusStatusesFindResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusStatusesFindResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusStatusesFindResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusStatusesFindResponseApplicationJson extends UserStatusStatusesFindResponseApplicationJson {
  @override
  final UserStatusStatusesFindResponseApplicationJson_Ocs ocs;

  factory _$UserStatusStatusesFindResponseApplicationJson(
          [void Function(UserStatusStatusesFindResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusStatusesFindResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusStatusesFindResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusStatusesFindResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusStatusesFindResponseApplicationJson rebuild(
          void Function(UserStatusStatusesFindResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindResponseApplicationJsonBuilder toBuilder() =>
      UserStatusStatusesFindResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class UserStatusStatusesFindResponseApplicationJsonBuilder
    implements
        Builder<UserStatusStatusesFindResponseApplicationJson, UserStatusStatusesFindResponseApplicationJsonBuilder>,
        UserStatusStatusesFindResponseApplicationJsonInterfaceBuilder {
  _$UserStatusStatusesFindResponseApplicationJson? _$v;

  UserStatusStatusesFindResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusStatusesFindResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusStatusesFindResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusStatusesFindResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusStatusesFindResponseApplicationJsonBuilder();

  UserStatusStatusesFindResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusStatusesFindResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindResponseApplicationJson build() => _build();

  _$UserStatusStatusesFindResponseApplicationJson _build() {
    _$UserStatusStatusesFindResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusStatusesFindResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'UserStatusStatusesFindResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs
    extends UserStatusUserStatusGetStatusResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs(
          [void Function(UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusUserStatusGetStatusResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusUserStatusGetStatusResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusGetStatusResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusGetStatusResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusGetStatusResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusGetStatusResponseApplicationJson_Ocs,
            UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder>,
        UserStatusUserStatusGetStatusResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder();

  UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusGetStatusResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusGetStatusResponseApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs _build() {
    _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UserStatusUserStatusGetStatusResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusGetStatusResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusGetStatusResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusGetStatusResponseApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusGetStatusResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusGetStatusResponseApplicationJson
    extends UserStatusUserStatusGetStatusResponseApplicationJson {
  @override
  final UserStatusUserStatusGetStatusResponseApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusGetStatusResponseApplicationJson(
          [void Function(UserStatusUserStatusGetStatusResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusGetStatusResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusGetStatusResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusGetStatusResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusGetStatusResponseApplicationJson rebuild(
          void Function(UserStatusUserStatusGetStatusResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusGetStatusResponseApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusGetStatusResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusGetStatusResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusGetStatusResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusGetStatusResponseApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusGetStatusResponseApplicationJson,
            UserStatusUserStatusGetStatusResponseApplicationJsonBuilder>,
        UserStatusUserStatusGetStatusResponseApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusGetStatusResponseApplicationJson? _$v;

  UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusGetStatusResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusGetStatusResponseApplicationJsonBuilder();

  UserStatusUserStatusGetStatusResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusGetStatusResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusGetStatusResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusGetStatusResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusGetStatusResponseApplicationJson build() => _build();

  _$UserStatusUserStatusGetStatusResponseApplicationJson _build() {
    _$UserStatusUserStatusGetStatusResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusGetStatusResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusGetStatusResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs
    extends UserStatusUserStatusSetStatusResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs(
          [void Function(UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusUserStatusSetStatusResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusUserStatusSetStatusResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusSetStatusResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetStatusResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetStatusResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusSetStatusResponseApplicationJson_Ocs,
            UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder>,
        UserStatusUserStatusSetStatusResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder();

  UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetStatusResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetStatusResponseApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs _build() {
    _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UserStatusUserStatusSetStatusResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetStatusResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetStatusResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusSetStatusResponseApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusSetStatusResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusSetStatusResponseApplicationJson
    extends UserStatusUserStatusSetStatusResponseApplicationJson {
  @override
  final UserStatusUserStatusSetStatusResponseApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusSetStatusResponseApplicationJson(
          [void Function(UserStatusUserStatusSetStatusResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusSetStatusResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetStatusResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusSetStatusResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusSetStatusResponseApplicationJson rebuild(
          void Function(UserStatusUserStatusSetStatusResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetStatusResponseApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusSetStatusResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetStatusResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetStatusResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusSetStatusResponseApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusSetStatusResponseApplicationJson,
            UserStatusUserStatusSetStatusResponseApplicationJsonBuilder>,
        UserStatusUserStatusSetStatusResponseApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusSetStatusResponseApplicationJson? _$v;

  UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusSetStatusResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusSetStatusResponseApplicationJsonBuilder();

  UserStatusUserStatusSetStatusResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetStatusResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetStatusResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusSetStatusResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetStatusResponseApplicationJson build() => _build();

  _$UserStatusUserStatusSetStatusResponseApplicationJson _build() {
    _$UserStatusUserStatusSetStatusResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusSetStatusResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetStatusResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface other);
  void update(
      void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs
    extends UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs(
          [void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
            UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder>,
        UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder();

  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs _build() {
    _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs._(
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
            r'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson
    extends UserStatusUserStatusSetPredefinedMessageResponseApplicationJson {
  @override
  final UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson(
          [void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ocs, r'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson rebuild(
          void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetPredefinedMessageResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusSetPredefinedMessageResponseApplicationJson,
            UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder>,
        UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson? _$v;

  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder? ocs) =>
      _$this._ocs = ocs;

  UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder();

  UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetPredefinedMessageResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusSetPredefinedMessageResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponseApplicationJson build() => _build();

  _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson _build() {
    _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusSetPredefinedMessageResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetPredefinedMessageResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs
    extends UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs(
          [void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs,
            UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder>,
        UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder();

  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs _build() {
    _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusSetCustomMessageResponseApplicationJson
    extends UserStatusUserStatusSetCustomMessageResponseApplicationJson {
  @override
  final UserStatusUserStatusSetCustomMessageResponseApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusSetCustomMessageResponseApplicationJson(
          [void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetCustomMessageResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusSetCustomMessageResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJson rebuild(
          void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetCustomMessageResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetCustomMessageResponseApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusSetCustomMessageResponseApplicationJson,
            UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder>,
        UserStatusUserStatusSetCustomMessageResponseApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusSetCustomMessageResponseApplicationJson? _$v;

  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusSetCustomMessageResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder();

  UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetCustomMessageResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetCustomMessageResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusSetCustomMessageResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetCustomMessageResponseApplicationJson build() => _build();

  _$UserStatusUserStatusSetCustomMessageResponseApplicationJson _build() {
    _$UserStatusUserStatusSetCustomMessageResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusSetCustomMessageResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetCustomMessageResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs
    extends UserStatusUserStatusClearMessageResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final JsonObject data;

  factory _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs(
          [void Function(UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusUserStatusClearMessageResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusUserStatusClearMessageResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusClearMessageResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusClearMessageResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusClearMessageResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusClearMessageResponseApplicationJson_Ocs,
            UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder>,
        UserStatusUserStatusClearMessageResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder();

  UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusClearMessageResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusClearMessageResponseApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs _build() {
    _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusClearMessageResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'UserStatusUserStatusClearMessageResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusClearMessageResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusClearMessageResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusClearMessageResponseApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusClearMessageResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusClearMessageResponseApplicationJson
    extends UserStatusUserStatusClearMessageResponseApplicationJson {
  @override
  final UserStatusUserStatusClearMessageResponseApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusClearMessageResponseApplicationJson(
          [void Function(UserStatusUserStatusClearMessageResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusClearMessageResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusClearMessageResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusClearMessageResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusClearMessageResponseApplicationJson rebuild(
          void Function(UserStatusUserStatusClearMessageResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusClearMessageResponseApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusClearMessageResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusClearMessageResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusClearMessageResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusClearMessageResponseApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusClearMessageResponseApplicationJson,
            UserStatusUserStatusClearMessageResponseApplicationJsonBuilder>,
        UserStatusUserStatusClearMessageResponseApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusClearMessageResponseApplicationJson? _$v;

  UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusClearMessageResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusClearMessageResponseApplicationJsonBuilder();

  UserStatusUserStatusClearMessageResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusClearMessageResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusClearMessageResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusClearMessageResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusClearMessageResponseApplicationJson build() => _build();

  _$UserStatusUserStatusClearMessageResponseApplicationJson _build() {
    _$UserStatusUserStatusClearMessageResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusClearMessageResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusClearMessageResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data
    extends UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data {
  @override
  final JsonObject data;
  @override
  final UserStatusPrivate? private;
  @override
  final JsonObject? jsonObject;

  factory _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data(
          [void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data._(
      {required this.data, this.private, this.jsonObject})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data', 'data');
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data rebuild(
          void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data &&
        data == other.data &&
        private == other.private &&
        jsonObject == other.jsonObject;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, private.hashCode);
    _$hash = $jc(_$hash, jsonObject.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data')
          ..add('data', data)
          ..add('private', private)
          ..add('jsonObject', jsonObject))
        .toString();
  }
}

class UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data,
            UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder> {
  _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  UserStatusPrivateBuilder? _private;
  UserStatusPrivateBuilder get private => _$this._private ??= UserStatusPrivateBuilder();
  set private(UserStatusPrivateBuilder? private) => _$this._private = private;

  JsonObject? _jsonObject;
  JsonObject? get jsonObject => _$this._jsonObject;
  set jsonObject(JsonObject? jsonObject) => _$this._jsonObject = jsonObject;

  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder();

  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _private = $v.private?.toBuilder();
      _jsonObject = $v.jsonObject;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data build() => _build();

  _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data _build() {
    _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data._(
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data', 'data'),
              private: _private?.build(),
              jsonObject: jsonObject);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'private';
        _private?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder get data;
  set data(UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs
    extends UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_Data data;

  factory _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs(
          [void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs,
            UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder>,
        UserStatusUserStatusRevertStatusResponseApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder? _data;
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder? data) =>
      _$this._data = data;

  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder();

  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs _build() {
    _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusRevertStatusResponseApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusRevertStatusResponseApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusRevertStatusResponseApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusRevertStatusResponseApplicationJson
    extends UserStatusUserStatusRevertStatusResponseApplicationJson {
  @override
  final UserStatusUserStatusRevertStatusResponseApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusRevertStatusResponseApplicationJson(
          [void Function(UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusRevertStatusResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusRevertStatusResponseApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson rebuild(
          void Function(UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusRevertStatusResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusRevertStatusResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusRevertStatusResponseApplicationJson,
            UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder>,
        UserStatusUserStatusRevertStatusResponseApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusRevertStatusResponseApplicationJson? _$v;

  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusRevertStatusResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder();

  UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusRevertStatusResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusRevertStatusResponseApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusRevertStatusResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusRevertStatusResponseApplicationJson build() => _build();

  _$UserStatusUserStatusRevertStatusResponseApplicationJson _build() {
    _$UserStatusUserStatusRevertStatusResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusRevertStatusResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusRevertStatusResponseApplicationJson', _$failedField, e.toString());
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
