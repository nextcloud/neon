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
Serializer<UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs>
    _$userStatusHeartbeatHeartbeatResponse200ApplicationJsonOcsSerializer =
    _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusHeartbeatHeartbeatResponse200ApplicationJson>
    _$userStatusHeartbeatHeartbeatResponse200ApplicationJsonSerializer =
    _$UserStatusHeartbeatHeartbeatResponse200ApplicationJsonSerializer();
Serializer<UserStatusClearAt_Type> _$userStatusClearAtTypeSerializer = _$UserStatusClearAt_TypeSerializer();
Serializer<UserStatusClearAtTimeType> _$userStatusClearAtTimeTypeSerializer = _$UserStatusClearAtTimeTypeSerializer();
Serializer<UserStatusClearAt> _$userStatusClearAtSerializer = _$UserStatusClearAtSerializer();
Serializer<UserStatusPredefined> _$userStatusPredefinedSerializer = _$UserStatusPredefinedSerializer();
Serializer<UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs>
    _$userStatusPredefinedStatusFindAllResponse200ApplicationJsonOcsSerializer =
    _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusPredefinedStatusFindAllResponse200ApplicationJson>
    _$userStatusPredefinedStatusFindAllResponse200ApplicationJsonSerializer =
    _$UserStatusPredefinedStatusFindAllResponse200ApplicationJsonSerializer();
Serializer<UserStatusStatusesFindAllResponse200ApplicationJson_Ocs>
    _$userStatusStatusesFindAllResponse200ApplicationJsonOcsSerializer =
    _$UserStatusStatusesFindAllResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusStatusesFindAllResponse200ApplicationJson>
    _$userStatusStatusesFindAllResponse200ApplicationJsonSerializer =
    _$UserStatusStatusesFindAllResponse200ApplicationJsonSerializer();
Serializer<UserStatusStatusesFindResponse200ApplicationJson_Ocs>
    _$userStatusStatusesFindResponse200ApplicationJsonOcsSerializer =
    _$UserStatusStatusesFindResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusStatusesFindResponse200ApplicationJson>
    _$userStatusStatusesFindResponse200ApplicationJsonSerializer =
    _$UserStatusStatusesFindResponse200ApplicationJsonSerializer();
Serializer<UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs>
    _$userStatusUserStatusGetStatusResponse200ApplicationJsonOcsSerializer =
    _$UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusGetStatusResponse200ApplicationJson>
    _$userStatusUserStatusGetStatusResponse200ApplicationJsonSerializer =
    _$UserStatusUserStatusGetStatusResponse200ApplicationJsonSerializer();
Serializer<UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs>
    _$userStatusUserStatusSetStatusResponse200ApplicationJsonOcsSerializer =
    _$UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusSetStatusResponse200ApplicationJson>
    _$userStatusUserStatusSetStatusResponse200ApplicationJsonSerializer =
    _$UserStatusUserStatusSetStatusResponse200ApplicationJsonSerializer();
Serializer<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs>
    _$userStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonOcsSerializer =
    _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson>
    _$userStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonSerializer =
    _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonSerializer();
Serializer<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs>
    _$userStatusUserStatusSetCustomMessageResponse200ApplicationJsonOcsSerializer =
    _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson>
    _$userStatusUserStatusSetCustomMessageResponse200ApplicationJsonSerializer =
    _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonSerializer();
Serializer<UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs>
    _$userStatusUserStatusClearMessageResponse200ApplicationJsonOcsSerializer =
    _$UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusClearMessageResponse200ApplicationJson>
    _$userStatusUserStatusClearMessageResponse200ApplicationJsonSerializer =
    _$UserStatusUserStatusClearMessageResponse200ApplicationJsonSerializer();
Serializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs>
    _$userStatusUserStatusRevertStatusResponse200ApplicationJsonOcsSerializer =
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsSerializer();
Serializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson>
    _$userStatusUserStatusRevertStatusResponse200ApplicationJsonSerializer =
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJsonSerializer();
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

class _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs,
    _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs object,
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
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusHeartbeatHeartbeatResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusHeartbeatHeartbeatResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusHeartbeatHeartbeatResponse200ApplicationJson,
    _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusHeartbeatHeartbeatResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusHeartbeatHeartbeatResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs))!
              as UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs);
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

class _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs,
    _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs object,
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
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusPredefinedStatusFindAllResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusPredefinedStatusFindAllResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusPredefinedStatusFindAllResponse200ApplicationJson,
    _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusPredefinedStatusFindAllResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusPredefinedStatusFindAllResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs))!
              as UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusStatusesFindAllResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusStatusesFindAllResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindAllResponse200ApplicationJson_Ocs,
    _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusStatusesFindAllResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindAllResponse200ApplicationJson_Ocs object,
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
  UserStatusStatusesFindAllResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusStatusesFindAllResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusStatusesFindAllResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindAllResponse200ApplicationJson,
    _$UserStatusStatusesFindAllResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusStatusesFindAllResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindAllResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusStatusesFindAllResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusStatusesFindAllResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindAllResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusStatusesFindAllResponse200ApplicationJson_Ocs))!
              as UserStatusStatusesFindAllResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusStatusesFindResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusStatusesFindResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindResponse200ApplicationJson_Ocs,
    _$UserStatusStatusesFindResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusStatusesFindResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindResponse200ApplicationJson_Ocs object,
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
  UserStatusStatusesFindResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusStatusesFindResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusStatusesFindResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusStatusesFindResponse200ApplicationJson,
    _$UserStatusStatusesFindResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusStatusesFindResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusStatusesFindResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusStatusesFindResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusStatusesFindResponse200ApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusStatusesFindResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusStatusesFindResponse200ApplicationJson_Ocs))!
              as UserStatusStatusesFindResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs,
    _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs object,
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
  UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusUserStatusGetStatusResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusGetStatusResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusGetStatusResponse200ApplicationJson,
    _$UserStatusUserStatusGetStatusResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusGetStatusResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusGetStatusResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusGetStatusResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs))!
              as UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs,
    _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs object,
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
  UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusUserStatusSetStatusResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusSetStatusResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetStatusResponse200ApplicationJson,
    _$UserStatusUserStatusSetStatusResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetStatusResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStatusUserStatusSetStatusResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetStatusResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs))!
              as UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs,
    _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs object,
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
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson,
    _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs))!
              as UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs,
    _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs object,
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
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusSetCustomMessageResponse200ApplicationJson,
    _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusSetCustomMessageResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs))!
              as UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs,
    _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs object,
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
  UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder();

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

class _$UserStatusUserStatusClearMessageResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusClearMessageResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusClearMessageResponse200ApplicationJson,
    _$UserStatusUserStatusClearMessageResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusClearMessageResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusClearMessageResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusClearMessageResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs))!
              as UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs,
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(UserStatusOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder();

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
                  specifiedType: const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data))!
              as UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$UserStatusUserStatusRevertStatusResponse200ApplicationJsonSerializer
    implements StructuredSerializer<UserStatusUserStatusRevertStatusResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    UserStatusUserStatusRevertStatusResponse200ApplicationJson,
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJson
  ];
  @override
  final String wireName = 'UserStatusUserStatusRevertStatusResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserStatusUserStatusRevertStatusResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs))!
              as UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs);
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

abstract mixin class UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs
    extends UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs(
          [void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs,
            UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder>,
        UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder();

  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs _build() {
    _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusHeartbeatHeartbeatResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusHeartbeatHeartbeatResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson
    extends UserStatusHeartbeatHeartbeatResponse200ApplicationJson {
  @override
  final UserStatusHeartbeatHeartbeatResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson(
          [void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusHeartbeatHeartbeatResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson rebuild(
          void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusHeartbeatHeartbeatResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusHeartbeatHeartbeatResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusHeartbeatHeartbeatResponse200ApplicationJson,
            UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder>,
        UserStatusHeartbeatHeartbeatResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson? _$v;

  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusHeartbeatHeartbeatResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder();

  UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusHeartbeatHeartbeatResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusHeartbeatHeartbeatResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusHeartbeatHeartbeatResponse200ApplicationJson build() => _build();

  _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson _build() {
    _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusHeartbeatHeartbeatResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusHeartbeatHeartbeatResponse200ApplicationJson', _$failedField, e.toString());
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

abstract mixin class UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  ListBuilder<UserStatusPredefined> get data;
  set data(ListBuilder<UserStatusPredefined>? data);
}

class _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs
    extends UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final BuiltList<UserStatusPredefined> data;

  factory _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs(
          [void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs,
            UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder>,
        UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<UserStatusPredefined>? _data;
  ListBuilder<UserStatusPredefined> get data => _$this._data ??= ListBuilder<UserStatusPredefined>();
  set data(covariant ListBuilder<UserStatusPredefined>? data) => _$this._data = data;

  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder();

  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs _build() {
    _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusPredefinedStatusFindAllResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusPredefinedStatusFindAllResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson
    extends UserStatusPredefinedStatusFindAllResponse200ApplicationJson {
  @override
  final UserStatusPredefinedStatusFindAllResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson(
          [void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusPredefinedStatusFindAllResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson rebuild(
          void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusPredefinedStatusFindAllResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusPredefinedStatusFindAllResponse200ApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusPredefinedStatusFindAllResponse200ApplicationJson,
            UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder>,
        UserStatusPredefinedStatusFindAllResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson? _$v;

  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusPredefinedStatusFindAllResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder();

  UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusPredefinedStatusFindAllResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusPredefinedStatusFindAllResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusPredefinedStatusFindAllResponse200ApplicationJson build() => _build();

  _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson _build() {
    _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusPredefinedStatusFindAllResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusPredefinedStatusFindAllResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindAllResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusStatusesFindAllResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusStatusesFindAllResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  ListBuilder<UserStatusPublic> get data;
  set data(ListBuilder<UserStatusPublic>? data);
}

class _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs
    extends UserStatusStatusesFindAllResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final BuiltList<UserStatusPublic> data;

  factory _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs(
          [void Function(UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusStatusesFindAllResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusStatusesFindAllResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusStatusesFindAllResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindAllResponse200ApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindAllResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusStatusesFindAllResponse200ApplicationJson_Ocs,
            UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder>,
        UserStatusStatusesFindAllResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<UserStatusPublic>? _data;
  ListBuilder<UserStatusPublic> get data => _$this._data ??= ListBuilder<UserStatusPublic>();
  set data(covariant ListBuilder<UserStatusPublic>? data) => _$this._data = data;

  UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder();

  UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindAllResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindAllResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs _build() {
    _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UserStatusStatusesFindAllResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusStatusesFindAllResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindAllResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusStatusesFindAllResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusStatusesFindAllResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusStatusesFindAllResponse200ApplicationJson
    extends UserStatusStatusesFindAllResponse200ApplicationJson {
  @override
  final UserStatusStatusesFindAllResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusStatusesFindAllResponse200ApplicationJson(
          [void Function(UserStatusStatusesFindAllResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusStatusesFindAllResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusStatusesFindAllResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusStatusesFindAllResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusStatusesFindAllResponse200ApplicationJson rebuild(
          void Function(UserStatusStatusesFindAllResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindAllResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusStatusesFindAllResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindAllResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindAllResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusStatusesFindAllResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusStatusesFindAllResponse200ApplicationJson,
            UserStatusStatusesFindAllResponse200ApplicationJsonBuilder>,
        UserStatusStatusesFindAllResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusStatusesFindAllResponse200ApplicationJson? _$v;

  UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusStatusesFindAllResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusStatusesFindAllResponse200ApplicationJsonBuilder();

  UserStatusStatusesFindAllResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindAllResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindAllResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusStatusesFindAllResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindAllResponse200ApplicationJson build() => _build();

  _$UserStatusStatusesFindAllResponse200ApplicationJson _build() {
    _$UserStatusStatusesFindAllResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusStatusesFindAllResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusStatusesFindAllResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusStatusesFindResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusStatusesFindResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPublicBuilder get data;
  set data(UserStatusPublicBuilder? data);
}

class _$UserStatusStatusesFindResponse200ApplicationJson_Ocs
    extends UserStatusStatusesFindResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPublic data;

  factory _$UserStatusStatusesFindResponse200ApplicationJson_Ocs(
          [void Function(UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusStatusesFindResponse200ApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusStatusesFindResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusStatusesFindResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusStatusesFindResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindResponse200ApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusStatusesFindResponse200ApplicationJson_Ocs,
            UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder>,
        UserStatusStatusesFindResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusStatusesFindResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPublicBuilder? _data;
  UserStatusPublicBuilder get data => _$this._data ??= UserStatusPublicBuilder();
  set data(covariant UserStatusPublicBuilder? data) => _$this._data = data;

  UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder();

  UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusStatusesFindResponse200ApplicationJson_Ocs _build() {
    _$UserStatusStatusesFindResponse200ApplicationJson_Ocs _$result;
    try {
      _$result =
          _$v ?? _$UserStatusStatusesFindResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusStatusesFindResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusStatusesFindResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusStatusesFindResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusStatusesFindResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusStatusesFindResponse200ApplicationJson extends UserStatusStatusesFindResponse200ApplicationJson {
  @override
  final UserStatusStatusesFindResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusStatusesFindResponse200ApplicationJson(
          [void Function(UserStatusStatusesFindResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusStatusesFindResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusStatusesFindResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusStatusesFindResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusStatusesFindResponse200ApplicationJson rebuild(
          void Function(UserStatusStatusesFindResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusStatusesFindResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusStatusesFindResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusStatusesFindResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusStatusesFindResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusStatusesFindResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusStatusesFindResponse200ApplicationJson,
            UserStatusStatusesFindResponse200ApplicationJsonBuilder>,
        UserStatusStatusesFindResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusStatusesFindResponse200ApplicationJson? _$v;

  UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusStatusesFindResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusStatusesFindResponse200ApplicationJsonBuilder();

  UserStatusStatusesFindResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusStatusesFindResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusStatusesFindResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusStatusesFindResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusStatusesFindResponse200ApplicationJson build() => _build();

  _$UserStatusStatusesFindResponse200ApplicationJson _build() {
    _$UserStatusStatusesFindResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusStatusesFindResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusStatusesFindResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs
    extends UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs(
          [void Function(UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs,
            UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder>,
        UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder();

  UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs _build() {
    _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusGetStatusResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusGetStatusResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusGetStatusResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusGetStatusResponse200ApplicationJson
    extends UserStatusUserStatusGetStatusResponse200ApplicationJson {
  @override
  final UserStatusUserStatusGetStatusResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusGetStatusResponse200ApplicationJson(
          [void Function(UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusGetStatusResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusGetStatusResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusGetStatusResponse200ApplicationJson rebuild(
          void Function(UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusGetStatusResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusGetStatusResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusGetStatusResponse200ApplicationJson,
            UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder>,
        UserStatusUserStatusGetStatusResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusGetStatusResponse200ApplicationJson? _$v;

  UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusGetStatusResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder();

  UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusGetStatusResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusGetStatusResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusGetStatusResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusGetStatusResponse200ApplicationJson build() => _build();

  _$UserStatusUserStatusGetStatusResponse200ApplicationJson _build() {
    _$UserStatusUserStatusGetStatusResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusGetStatusResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusGetStatusResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs
    extends UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs(
          [void Function(UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs,
            UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder>,
        UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder();

  UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs _build() {
    _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetStatusResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusSetStatusResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusSetStatusResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusSetStatusResponse200ApplicationJson
    extends UserStatusUserStatusSetStatusResponse200ApplicationJson {
  @override
  final UserStatusUserStatusSetStatusResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusSetStatusResponse200ApplicationJson(
          [void Function(UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetStatusResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusSetStatusResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusSetStatusResponse200ApplicationJson rebuild(
          void Function(UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetStatusResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetStatusResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusSetStatusResponse200ApplicationJson,
            UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder>,
        UserStatusUserStatusSetStatusResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusSetStatusResponse200ApplicationJson? _$v;

  UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusSetStatusResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder();

  UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetStatusResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetStatusResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusSetStatusResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetStatusResponse200ApplicationJson build() => _build();

  _$UserStatusUserStatusSetStatusResponse200ApplicationJson _build() {
    _$UserStatusUserStatusSetStatusResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusSetStatusResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetStatusResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsInterface other);
  void update(
      void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs
    extends UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs(
          [void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs,
            UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder>,
        UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder();

  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs _build() {
    _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs._(
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
            r'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonInterface other);
  void update(
      void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson
    extends UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson {
  @override
  final UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson(
          [void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ocs, r'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson rebuild(
          void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson,
            UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder>,
        UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson? _$v;

  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson_OcsBuilder? ocs) =>
      _$this._ocs = ocs;

  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder();

  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson build() => _build();

  _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson _build() {
    _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetPredefinedMessageResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsInterface other);
  void update(
      void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusPrivateBuilder get data;
  set data(UserStatusPrivateBuilder? data);
}

class _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs
    extends UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusPrivate data;

  factory _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs(
          [void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs,
            UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder>,
        UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusPrivateBuilder? _data;
  UserStatusPrivateBuilder get data => _$this._data ??= UserStatusPrivateBuilder();
  set data(covariant UserStatusPrivateBuilder? data) => _$this._data = data;

  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder();

  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs _build() {
    _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs._(
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
            r'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson
    extends UserStatusUserStatusSetCustomMessageResponse200ApplicationJson {
  @override
  final UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson(
          [void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ocs, r'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson rebuild(
          void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusSetCustomMessageResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusSetCustomMessageResponse200ApplicationJson,
            UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder>,
        UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson? _$v;

  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusSetCustomMessageResponse200ApplicationJson_OcsBuilder? ocs) =>
      _$this._ocs = ocs;

  UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder();

  UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusSetCustomMessageResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusSetCustomMessageResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusSetCustomMessageResponse200ApplicationJson build() => _build();

  _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson _build() {
    _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusSetCustomMessageResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusSetCustomMessageResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs
    extends UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final JsonObject data;

  factory _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs(
          [void Function(UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs,
            UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder>,
        UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder();

  UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs _build() {
    _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusClearMessageResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusClearMessageResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusClearMessageResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusClearMessageResponse200ApplicationJson
    extends UserStatusUserStatusClearMessageResponse200ApplicationJson {
  @override
  final UserStatusUserStatusClearMessageResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusClearMessageResponse200ApplicationJson(
          [void Function(UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusClearMessageResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusClearMessageResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusClearMessageResponse200ApplicationJson rebuild(
          void Function(UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusClearMessageResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusClearMessageResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusClearMessageResponse200ApplicationJson,
            UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder>,
        UserStatusUserStatusClearMessageResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusClearMessageResponse200ApplicationJson? _$v;

  UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusClearMessageResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder();

  UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusClearMessageResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusClearMessageResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusClearMessageResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusClearMessageResponse200ApplicationJson build() => _build();

  _$UserStatusUserStatusClearMessageResponse200ApplicationJson _build() {
    _$UserStatusUserStatusClearMessageResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusClearMessageResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusClearMessageResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data
    extends UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data {
  @override
  final JsonObject data;
  @override
  final UserStatusPrivate? private;
  @override
  final JsonObject? jsonObject;

  factory _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data(
          [void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder)? updates]) =>
      (UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data._(
      {required this.data, this.private, this.jsonObject})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data', 'data');
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data rebuild(
          void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder toBuilder() =>
      UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data')
          ..add('data', data)
          ..add('private', private)
          ..add('jsonObject', jsonObject))
        .toString();
  }
}

class UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder
    implements
        Builder<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data,
            UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder> {
  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  UserStatusPrivateBuilder? _private;
  UserStatusPrivateBuilder get private => _$this._private ??= UserStatusPrivateBuilder();
  set private(UserStatusPrivateBuilder? private) => _$this._private = private;

  JsonObject? _jsonObject;
  JsonObject? get jsonObject => _$this._jsonObject;
  set jsonObject(JsonObject? jsonObject) => _$this._jsonObject = jsonObject;

  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder();

  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder get _$this {
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
  void replace(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data build() => _build();

  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data _build() {
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data._(
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data', 'data'),
              private: _private?.build(),
              jsonObject: jsonObject);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'private';
        _private?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsInterface other);
  void update(void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  UserStatusOCSMetaBuilder get meta;
  set meta(UserStatusOCSMetaBuilder? meta);

  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder get data;
  set data(UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder? data);
}

class _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs
    extends UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs {
  @override
  final UserStatusOCSMeta meta;
  @override
  final UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_Data data;

  factory _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs(
          [void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs rebuild(
          void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder toBuilder() =>
      UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder
    implements
        Builder<UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs,
            UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder>,
        UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsInterfaceBuilder {
  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs? _$v;

  UserStatusOCSMetaBuilder? _meta;
  UserStatusOCSMetaBuilder get meta => _$this._meta ??= UserStatusOCSMetaBuilder();
  set meta(covariant UserStatusOCSMetaBuilder? meta) => _$this._meta = meta;

  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder? _data;
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder();
  set data(covariant UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs_DataBuilder? data) =>
      _$this._data = data;

  UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder();

  UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs build() => _build();

  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs _build() {
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class UserStatusUserStatusRevertStatusResponse200ApplicationJsonInterfaceBuilder {
  void replace(UserStatusUserStatusRevertStatusResponse200ApplicationJsonInterface other);
  void update(void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJsonInterfaceBuilder) updates);
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$UserStatusUserStatusRevertStatusResponse200ApplicationJson
    extends UserStatusUserStatusRevertStatusResponse200ApplicationJson {
  @override
  final UserStatusUserStatusRevertStatusResponse200ApplicationJson_Ocs ocs;

  factory _$UserStatusUserStatusRevertStatusResponse200ApplicationJson(
          [void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder)? updates]) =>
      (UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'UserStatusUserStatusRevertStatusResponse200ApplicationJson', 'ocs');
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson rebuild(
          void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder toBuilder() =>
      UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStatusUserStatusRevertStatusResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'UserStatusUserStatusRevertStatusResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder
    implements
        Builder<UserStatusUserStatusRevertStatusResponse200ApplicationJson,
            UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder>,
        UserStatusUserStatusRevertStatusResponse200ApplicationJsonInterfaceBuilder {
  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson? _$v;

  UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder? _ocs;
  UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant UserStatusUserStatusRevertStatusResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder();

  UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant UserStatusUserStatusRevertStatusResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStatusUserStatusRevertStatusResponse200ApplicationJson;
  }

  @override
  void update(void Function(UserStatusUserStatusRevertStatusResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStatusUserStatusRevertStatusResponse200ApplicationJson build() => _build();

  _$UserStatusUserStatusRevertStatusResponse200ApplicationJson _build() {
    _$UserStatusUserStatusRevertStatusResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$UserStatusUserStatusRevertStatusResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserStatusUserStatusRevertStatusResponse200ApplicationJson', _$failedField, e.toString());
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
