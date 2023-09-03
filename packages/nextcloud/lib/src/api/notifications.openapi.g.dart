// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationsOCSMeta> _$notificationsOCSMetaSerializer = _$NotificationsOCSMetaSerializer();
Serializer<NotificationsNotificationAction> _$notificationsNotificationActionSerializer =
    _$NotificationsNotificationActionSerializer();
Serializer<NotificationsNotification> _$notificationsNotificationSerializer = _$NotificationsNotificationSerializer();
Serializer<NotificationsListNotifications_Ocs> _$notificationsListNotificationsOcsSerializer =
    _$NotificationsListNotifications_OcsSerializer();
Serializer<NotificationsListNotifications> _$notificationsListNotificationsSerializer =
    _$NotificationsListNotificationsSerializer();
Serializer<NotificationsGetNotification_Ocs> _$notificationsGetNotificationOcsSerializer =
    _$NotificationsGetNotification_OcsSerializer();
Serializer<NotificationsGetNotification> _$notificationsGetNotificationSerializer =
    _$NotificationsGetNotificationSerializer();
Serializer<NotificationsEmptyOCS_Ocs> _$notificationsEmptyOCSOcsSerializer = _$NotificationsEmptyOCS_OcsSerializer();
Serializer<NotificationsEmptyOCS> _$notificationsEmptyOCSSerializer = _$NotificationsEmptyOCSSerializer();
Serializer<NotificationsPushServerSubscription> _$notificationsPushServerSubscriptionSerializer =
    _$NotificationsPushServerSubscriptionSerializer();
Serializer<NotificationsPushServerRegistration_Ocs> _$notificationsPushServerRegistrationOcsSerializer =
    _$NotificationsPushServerRegistration_OcsSerializer();
Serializer<NotificationsPushServerRegistration> _$notificationsPushServerRegistrationSerializer =
    _$NotificationsPushServerRegistrationSerializer();
Serializer<NotificationsCapabilities_Notifications> _$notificationsCapabilitiesNotificationsSerializer =
    _$NotificationsCapabilities_NotificationsSerializer();
Serializer<NotificationsCapabilities> _$notificationsCapabilitiesSerializer = _$NotificationsCapabilitiesSerializer();
Serializer<NotificationsNotificationDecryptedSubject> _$notificationsNotificationDecryptedSubjectSerializer =
    _$NotificationsNotificationDecryptedSubjectSerializer();

class _$NotificationsOCSMetaSerializer implements StructuredSerializer<NotificationsOCSMeta> {
  @override
  final Iterable<Type> types = const [NotificationsOCSMeta, _$NotificationsOCSMeta];
  @override
  final String wireName = 'NotificationsOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsOCSMeta object,
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
  NotificationsOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsOCSMetaBuilder();

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

class _$NotificationsNotificationActionSerializer implements StructuredSerializer<NotificationsNotificationAction> {
  @override
  final Iterable<Type> types = const [NotificationsNotificationAction, _$NotificationsNotificationAction];
  @override
  final String wireName = 'NotificationsNotificationAction';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsNotificationAction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primary;
    if (value != null) {
      result
        ..add('primary')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NotificationsNotificationAction deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsNotificationActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'primary':
          result.primary = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsNotificationSerializer implements StructuredSerializer<NotificationsNotification> {
  @override
  final Iterable<Type> types = const [NotificationsNotification, _$NotificationsNotification];
  @override
  final String wireName = 'NotificationsNotification';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsNotification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'notification_id',
      serializers.serialize(object.notificationId, specifiedType: const FullType(int)),
      'app',
      serializers.serialize(object.app, specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'datetime',
      serializers.serialize(object.datetime, specifiedType: const FullType(String)),
      'object_type',
      serializers.serialize(object.objectType, specifiedType: const FullType(String)),
      'object_id',
      serializers.serialize(object.objectId, specifiedType: const FullType(String)),
      'subject',
      serializers.serialize(object.subject, specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'actions',
      serializers.serialize(object.actions,
          specifiedType: const FullType(BuiltList, [FullType(NotificationsNotificationAction)])),
    ];
    Object? value;
    value = object.subjectRich;
    if (value != null) {
      result
        ..add('subjectRich')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.subjectRichParameters;
    if (value != null) {
      result
        ..add('subjectRichParameters')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.messageRich;
    if (value != null) {
      result
        ..add('messageRich')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.messageRichParameters;
    if (value != null) {
      result
        ..add('messageRichParameters')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.shouldNotify;
    if (value != null) {
      result
        ..add('shouldNotify')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NotificationsNotification deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsNotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notification_id':
          result.notificationId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'datetime':
          result.datetime = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'object_type':
          result.objectType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'object_id':
          result.objectId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subjectRich':
          result.subjectRich = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'subjectRichParameters':
          result.subjectRichParameters =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'messageRich':
          result.messageRich = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'messageRichParameters':
          result.messageRichParameters =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'shouldNotify':
          result.shouldNotify = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'actions':
          result.actions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(NotificationsNotificationAction)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsListNotifications_OcsSerializer
    implements StructuredSerializer<NotificationsListNotifications_Ocs> {
  @override
  final Iterable<Type> types = const [NotificationsListNotifications_Ocs, _$NotificationsListNotifications_Ocs];
  @override
  final String wireName = 'NotificationsListNotifications_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsListNotifications_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NotificationsOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltList, [FullType(NotificationsNotification)])),
    ];

    return result;
  }

  @override
  NotificationsListNotifications_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsListNotifications_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(NotificationsOCSMeta))!
              as NotificationsOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NotificationsNotification)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsListNotificationsSerializer implements StructuredSerializer<NotificationsListNotifications> {
  @override
  final Iterable<Type> types = const [NotificationsListNotifications, _$NotificationsListNotifications];
  @override
  final String wireName = 'NotificationsListNotifications';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsListNotifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NotificationsListNotifications_Ocs)),
    ];

    return result;
  }

  @override
  NotificationsListNotifications deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsListNotificationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NotificationsListNotifications_Ocs))!
                  as NotificationsListNotifications_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsGetNotification_OcsSerializer implements StructuredSerializer<NotificationsGetNotification_Ocs> {
  @override
  final Iterable<Type> types = const [NotificationsGetNotification_Ocs, _$NotificationsGetNotification_Ocs];
  @override
  final String wireName = 'NotificationsGetNotification_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsGetNotification_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NotificationsOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NotificationsNotification)),
    ];

    return result;
  }

  @override
  NotificationsGetNotification_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsGetNotification_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(NotificationsOCSMeta))!
              as NotificationsOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(NotificationsNotification))!
              as NotificationsNotification);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsGetNotificationSerializer implements StructuredSerializer<NotificationsGetNotification> {
  @override
  final Iterable<Type> types = const [NotificationsGetNotification, _$NotificationsGetNotification];
  @override
  final String wireName = 'NotificationsGetNotification';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsGetNotification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NotificationsGetNotification_Ocs)),
    ];

    return result;
  }

  @override
  NotificationsGetNotification deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsGetNotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(NotificationsGetNotification_Ocs))! as NotificationsGetNotification_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsEmptyOCS_OcsSerializer implements StructuredSerializer<NotificationsEmptyOCS_Ocs> {
  @override
  final Iterable<Type> types = const [NotificationsEmptyOCS_Ocs, _$NotificationsEmptyOCS_Ocs];
  @override
  final String wireName = 'NotificationsEmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsEmptyOCS_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NotificationsOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  NotificationsEmptyOCS_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsEmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(NotificationsOCSMeta))!
              as NotificationsOCSMeta);
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

class _$NotificationsEmptyOCSSerializer implements StructuredSerializer<NotificationsEmptyOCS> {
  @override
  final Iterable<Type> types = const [NotificationsEmptyOCS, _$NotificationsEmptyOCS];
  @override
  final String wireName = 'NotificationsEmptyOCS';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsEmptyOCS object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NotificationsEmptyOCS_Ocs)),
    ];

    return result;
  }

  @override
  NotificationsEmptyOCS deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsEmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value, specifiedType: const FullType(NotificationsEmptyOCS_Ocs))!
              as NotificationsEmptyOCS_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsPushServerSubscriptionSerializer
    implements StructuredSerializer<NotificationsPushServerSubscription> {
  @override
  final Iterable<Type> types = const [NotificationsPushServerSubscription, _$NotificationsPushServerSubscription];
  @override
  final String wireName = 'NotificationsPushServerSubscription';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsPushServerSubscription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'publicKey',
      serializers.serialize(object.publicKey, specifiedType: const FullType(String)),
      'deviceIdentifier',
      serializers.serialize(object.deviceIdentifier, specifiedType: const FullType(String)),
      'signature',
      serializers.serialize(object.signature, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationsPushServerSubscription deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsPushServerSubscriptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'publicKey':
          result.publicKey = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'deviceIdentifier':
          result.deviceIdentifier = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'signature':
          result.signature = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsPushServerRegistration_OcsSerializer
    implements StructuredSerializer<NotificationsPushServerRegistration_Ocs> {
  @override
  final Iterable<Type> types = const [
    NotificationsPushServerRegistration_Ocs,
    _$NotificationsPushServerRegistration_Ocs
  ];
  @override
  final String wireName = 'NotificationsPushServerRegistration_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsPushServerRegistration_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NotificationsOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NotificationsPushServerSubscription)),
    ];

    return result;
  }

  @override
  NotificationsPushServerRegistration_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsPushServerRegistration_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(NotificationsOCSMeta))!
              as NotificationsOCSMeta);
          break;
        case 'data':
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(NotificationsPushServerSubscription))!
                  as NotificationsPushServerSubscription);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsPushServerRegistrationSerializer
    implements StructuredSerializer<NotificationsPushServerRegistration> {
  @override
  final Iterable<Type> types = const [NotificationsPushServerRegistration, _$NotificationsPushServerRegistration];
  @override
  final String wireName = 'NotificationsPushServerRegistration';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsPushServerRegistration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NotificationsPushServerRegistration_Ocs)),
    ];

    return result;
  }

  @override
  NotificationsPushServerRegistration deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsPushServerRegistrationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NotificationsPushServerRegistration_Ocs))!
                  as NotificationsPushServerRegistration_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsCapabilities_NotificationsSerializer
    implements StructuredSerializer<NotificationsCapabilities_Notifications> {
  @override
  final Iterable<Type> types = const [
    NotificationsCapabilities_Notifications,
    _$NotificationsCapabilities_Notifications
  ];
  @override
  final String wireName = 'NotificationsCapabilities_Notifications';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsCapabilities_Notifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.ocsEndpoints;
    if (value != null) {
      result
        ..add('ocs-endpoints')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.push;
    if (value != null) {
      result
        ..add('push')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.adminNotifications;
    if (value != null) {
      result
        ..add('admin-notifications')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  NotificationsCapabilities_Notifications deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsCapabilities_NotificationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs-endpoints':
          result.ocsEndpoints.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'push':
          result.push.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'admin-notifications':
          result.adminNotifications.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsCapabilitiesSerializer implements StructuredSerializer<NotificationsCapabilities> {
  @override
  final Iterable<Type> types = const [NotificationsCapabilities, _$NotificationsCapabilities];
  @override
  final String wireName = 'NotificationsCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'notifications',
      serializers.serialize(object.notifications,
          specifiedType: const FullType(NotificationsCapabilities_Notifications)),
    ];

    return result;
  }

  @override
  NotificationsCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notifications':
          result.notifications.replace(
              serializers.deserialize(value, specifiedType: const FullType(NotificationsCapabilities_Notifications))!
                  as NotificationsCapabilities_Notifications);
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsNotificationDecryptedSubjectSerializer
    implements StructuredSerializer<NotificationsNotificationDecryptedSubject> {
  @override
  final Iterable<Type> types = const [
    NotificationsNotificationDecryptedSubject,
    _$NotificationsNotificationDecryptedSubject
  ];
  @override
  final String wireName = 'NotificationsNotificationDecryptedSubject';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationsNotificationDecryptedSubject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nid;
    if (value != null) {
      result
        ..add('nid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.app;
    if (value != null) {
      result
        ..add('app')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.subject;
    if (value != null) {
      result
        ..add('subject')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.delete;
    if (value != null) {
      result
        ..add('delete')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deleteAll;
    if (value != null) {
      result
        ..add('delete-all')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NotificationsNotificationDecryptedSubject deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NotificationsNotificationDecryptedSubjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nid':
          result.nid = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'delete':
          result.delete = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delete-all':
          result.deleteAll = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class NotificationsOCSMetaInterfaceBuilder {
  void replace(NotificationsOCSMetaInterface other);
  void update(void Function(NotificationsOCSMetaInterfaceBuilder) updates);
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

class _$NotificationsOCSMeta extends NotificationsOCSMeta {
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

  factory _$NotificationsOCSMeta([void Function(NotificationsOCSMetaBuilder)? updates]) =>
      (NotificationsOCSMetaBuilder()..update(updates))._build();

  _$NotificationsOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'NotificationsOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'NotificationsOCSMeta', 'statuscode');
  }

  @override
  NotificationsOCSMeta rebuild(void Function(NotificationsOCSMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsOCSMetaBuilder toBuilder() => NotificationsOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'NotificationsOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class NotificationsOCSMetaBuilder
    implements Builder<NotificationsOCSMeta, NotificationsOCSMetaBuilder>, NotificationsOCSMetaInterfaceBuilder {
  _$NotificationsOCSMeta? _$v;

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

  NotificationsOCSMetaBuilder();

  NotificationsOCSMetaBuilder get _$this {
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
  void replace(covariant NotificationsOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsOCSMeta;
  }

  @override
  void update(void Function(NotificationsOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsOCSMeta build() => _build();

  _$NotificationsOCSMeta _build() {
    final _$result = _$v ??
        _$NotificationsOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'NotificationsOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'NotificationsOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsNotificationActionInterfaceBuilder {
  void replace(NotificationsNotificationActionInterface other);
  void update(void Function(NotificationsNotificationActionInterfaceBuilder) updates);
  String? get label;
  set label(String? label);

  String? get link;
  set link(String? link);

  String? get type;
  set type(String? type);

  bool? get primary;
  set primary(bool? primary);
}

class _$NotificationsNotificationAction extends NotificationsNotificationAction {
  @override
  final String label;
  @override
  final String link;
  @override
  final String type;
  @override
  final bool? primary;

  factory _$NotificationsNotificationAction([void Function(NotificationsNotificationActionBuilder)? updates]) =>
      (NotificationsNotificationActionBuilder()..update(updates))._build();

  _$NotificationsNotificationAction._({required this.label, required this.link, required this.type, this.primary})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(label, r'NotificationsNotificationAction', 'label');
    BuiltValueNullFieldError.checkNotNull(link, r'NotificationsNotificationAction', 'link');
    BuiltValueNullFieldError.checkNotNull(type, r'NotificationsNotificationAction', 'type');
  }

  @override
  NotificationsNotificationAction rebuild(void Function(NotificationsNotificationActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsNotificationActionBuilder toBuilder() => NotificationsNotificationActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsNotificationAction &&
        label == other.label &&
        link == other.link &&
        type == other.type &&
        primary == other.primary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, primary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsNotificationAction')
          ..add('label', label)
          ..add('link', link)
          ..add('type', type)
          ..add('primary', primary))
        .toString();
  }
}

class NotificationsNotificationActionBuilder
    implements
        Builder<NotificationsNotificationAction, NotificationsNotificationActionBuilder>,
        NotificationsNotificationActionInterfaceBuilder {
  _$NotificationsNotificationAction? _$v;

  String? _label;
  String? get label => _$this._label;
  set label(covariant String? label) => _$this._label = label;

  String? _link;
  String? get link => _$this._link;
  set link(covariant String? link) => _$this._link = link;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  bool? _primary;
  bool? get primary => _$this._primary;
  set primary(covariant bool? primary) => _$this._primary = primary;

  NotificationsNotificationActionBuilder();

  NotificationsNotificationActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _label = $v.label;
      _link = $v.link;
      _type = $v.type;
      _primary = $v.primary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsNotificationAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsNotificationAction;
  }

  @override
  void update(void Function(NotificationsNotificationActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsNotificationAction build() => _build();

  _$NotificationsNotificationAction _build() {
    final _$result = _$v ??
        _$NotificationsNotificationAction._(
            label: BuiltValueNullFieldError.checkNotNull(label, r'NotificationsNotificationAction', 'label'),
            link: BuiltValueNullFieldError.checkNotNull(link, r'NotificationsNotificationAction', 'link'),
            type: BuiltValueNullFieldError.checkNotNull(type, r'NotificationsNotificationAction', 'type'),
            primary: primary);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsNotificationInterfaceBuilder {
  void replace(NotificationsNotificationInterface other);
  void update(void Function(NotificationsNotificationInterfaceBuilder) updates);
  int? get notificationId;
  set notificationId(int? notificationId);

  String? get app;
  set app(String? app);

  String? get user;
  set user(String? user);

  String? get datetime;
  set datetime(String? datetime);

  String? get objectType;
  set objectType(String? objectType);

  String? get objectId;
  set objectId(String? objectId);

  String? get subject;
  set subject(String? subject);

  String? get message;
  set message(String? message);

  String? get link;
  set link(String? link);

  String? get subjectRich;
  set subjectRich(String? subjectRich);

  JsonObject? get subjectRichParameters;
  set subjectRichParameters(JsonObject? subjectRichParameters);

  String? get messageRich;
  set messageRich(String? messageRich);

  JsonObject? get messageRichParameters;
  set messageRichParameters(JsonObject? messageRichParameters);

  String? get icon;
  set icon(String? icon);

  bool? get shouldNotify;
  set shouldNotify(bool? shouldNotify);

  ListBuilder<NotificationsNotificationAction> get actions;
  set actions(ListBuilder<NotificationsNotificationAction>? actions);
}

class _$NotificationsNotification extends NotificationsNotification {
  @override
  final int notificationId;
  @override
  final String app;
  @override
  final String user;
  @override
  final String datetime;
  @override
  final String objectType;
  @override
  final String objectId;
  @override
  final String subject;
  @override
  final String message;
  @override
  final String link;
  @override
  final String? subjectRich;
  @override
  final JsonObject? subjectRichParameters;
  @override
  final String? messageRich;
  @override
  final JsonObject? messageRichParameters;
  @override
  final String? icon;
  @override
  final bool? shouldNotify;
  @override
  final BuiltList<NotificationsNotificationAction> actions;

  factory _$NotificationsNotification([void Function(NotificationsNotificationBuilder)? updates]) =>
      (NotificationsNotificationBuilder()..update(updates))._build();

  _$NotificationsNotification._(
      {required this.notificationId,
      required this.app,
      required this.user,
      required this.datetime,
      required this.objectType,
      required this.objectId,
      required this.subject,
      required this.message,
      required this.link,
      this.subjectRich,
      this.subjectRichParameters,
      this.messageRich,
      this.messageRichParameters,
      this.icon,
      this.shouldNotify,
      required this.actions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(notificationId, r'NotificationsNotification', 'notificationId');
    BuiltValueNullFieldError.checkNotNull(app, r'NotificationsNotification', 'app');
    BuiltValueNullFieldError.checkNotNull(user, r'NotificationsNotification', 'user');
    BuiltValueNullFieldError.checkNotNull(datetime, r'NotificationsNotification', 'datetime');
    BuiltValueNullFieldError.checkNotNull(objectType, r'NotificationsNotification', 'objectType');
    BuiltValueNullFieldError.checkNotNull(objectId, r'NotificationsNotification', 'objectId');
    BuiltValueNullFieldError.checkNotNull(subject, r'NotificationsNotification', 'subject');
    BuiltValueNullFieldError.checkNotNull(message, r'NotificationsNotification', 'message');
    BuiltValueNullFieldError.checkNotNull(link, r'NotificationsNotification', 'link');
    BuiltValueNullFieldError.checkNotNull(actions, r'NotificationsNotification', 'actions');
  }

  @override
  NotificationsNotification rebuild(void Function(NotificationsNotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsNotificationBuilder toBuilder() => NotificationsNotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsNotification &&
        notificationId == other.notificationId &&
        app == other.app &&
        user == other.user &&
        datetime == other.datetime &&
        objectType == other.objectType &&
        objectId == other.objectId &&
        subject == other.subject &&
        message == other.message &&
        link == other.link &&
        subjectRich == other.subjectRich &&
        subjectRichParameters == other.subjectRichParameters &&
        messageRich == other.messageRich &&
        messageRichParameters == other.messageRichParameters &&
        icon == other.icon &&
        shouldNotify == other.shouldNotify &&
        actions == other.actions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notificationId.hashCode);
    _$hash = $jc(_$hash, app.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, datetime.hashCode);
    _$hash = $jc(_$hash, objectType.hashCode);
    _$hash = $jc(_$hash, objectId.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, subjectRich.hashCode);
    _$hash = $jc(_$hash, subjectRichParameters.hashCode);
    _$hash = $jc(_$hash, messageRich.hashCode);
    _$hash = $jc(_$hash, messageRichParameters.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, shouldNotify.hashCode);
    _$hash = $jc(_$hash, actions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsNotification')
          ..add('notificationId', notificationId)
          ..add('app', app)
          ..add('user', user)
          ..add('datetime', datetime)
          ..add('objectType', objectType)
          ..add('objectId', objectId)
          ..add('subject', subject)
          ..add('message', message)
          ..add('link', link)
          ..add('subjectRich', subjectRich)
          ..add('subjectRichParameters', subjectRichParameters)
          ..add('messageRich', messageRich)
          ..add('messageRichParameters', messageRichParameters)
          ..add('icon', icon)
          ..add('shouldNotify', shouldNotify)
          ..add('actions', actions))
        .toString();
  }
}

class NotificationsNotificationBuilder
    implements
        Builder<NotificationsNotification, NotificationsNotificationBuilder>,
        NotificationsNotificationInterfaceBuilder {
  _$NotificationsNotification? _$v;

  int? _notificationId;
  int? get notificationId => _$this._notificationId;
  set notificationId(covariant int? notificationId) => _$this._notificationId = notificationId;

  String? _app;
  String? get app => _$this._app;
  set app(covariant String? app) => _$this._app = app;

  String? _user;
  String? get user => _$this._user;
  set user(covariant String? user) => _$this._user = user;

  String? _datetime;
  String? get datetime => _$this._datetime;
  set datetime(covariant String? datetime) => _$this._datetime = datetime;

  String? _objectType;
  String? get objectType => _$this._objectType;
  set objectType(covariant String? objectType) => _$this._objectType = objectType;

  String? _objectId;
  String? get objectId => _$this._objectId;
  set objectId(covariant String? objectId) => _$this._objectId = objectId;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(covariant String? subject) => _$this._subject = subject;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  String? _link;
  String? get link => _$this._link;
  set link(covariant String? link) => _$this._link = link;

  String? _subjectRich;
  String? get subjectRich => _$this._subjectRich;
  set subjectRich(covariant String? subjectRich) => _$this._subjectRich = subjectRich;

  JsonObject? _subjectRichParameters;
  JsonObject? get subjectRichParameters => _$this._subjectRichParameters;
  set subjectRichParameters(covariant JsonObject? subjectRichParameters) =>
      _$this._subjectRichParameters = subjectRichParameters;

  String? _messageRich;
  String? get messageRich => _$this._messageRich;
  set messageRich(covariant String? messageRich) => _$this._messageRich = messageRich;

  JsonObject? _messageRichParameters;
  JsonObject? get messageRichParameters => _$this._messageRichParameters;
  set messageRichParameters(covariant JsonObject? messageRichParameters) =>
      _$this._messageRichParameters = messageRichParameters;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(covariant String? icon) => _$this._icon = icon;

  bool? _shouldNotify;
  bool? get shouldNotify => _$this._shouldNotify;
  set shouldNotify(covariant bool? shouldNotify) => _$this._shouldNotify = shouldNotify;

  ListBuilder<NotificationsNotificationAction>? _actions;
  ListBuilder<NotificationsNotificationAction> get actions =>
      _$this._actions ??= ListBuilder<NotificationsNotificationAction>();
  set actions(covariant ListBuilder<NotificationsNotificationAction>? actions) => _$this._actions = actions;

  NotificationsNotificationBuilder();

  NotificationsNotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notificationId = $v.notificationId;
      _app = $v.app;
      _user = $v.user;
      _datetime = $v.datetime;
      _objectType = $v.objectType;
      _objectId = $v.objectId;
      _subject = $v.subject;
      _message = $v.message;
      _link = $v.link;
      _subjectRich = $v.subjectRich;
      _subjectRichParameters = $v.subjectRichParameters;
      _messageRich = $v.messageRich;
      _messageRichParameters = $v.messageRichParameters;
      _icon = $v.icon;
      _shouldNotify = $v.shouldNotify;
      _actions = $v.actions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsNotification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsNotification;
  }

  @override
  void update(void Function(NotificationsNotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsNotification build() => _build();

  _$NotificationsNotification _build() {
    _$NotificationsNotification _$result;
    try {
      _$result = _$v ??
          _$NotificationsNotification._(
              notificationId:
                  BuiltValueNullFieldError.checkNotNull(notificationId, r'NotificationsNotification', 'notificationId'),
              app: BuiltValueNullFieldError.checkNotNull(app, r'NotificationsNotification', 'app'),
              user: BuiltValueNullFieldError.checkNotNull(user, r'NotificationsNotification', 'user'),
              datetime: BuiltValueNullFieldError.checkNotNull(datetime, r'NotificationsNotification', 'datetime'),
              objectType: BuiltValueNullFieldError.checkNotNull(objectType, r'NotificationsNotification', 'objectType'),
              objectId: BuiltValueNullFieldError.checkNotNull(objectId, r'NotificationsNotification', 'objectId'),
              subject: BuiltValueNullFieldError.checkNotNull(subject, r'NotificationsNotification', 'subject'),
              message: BuiltValueNullFieldError.checkNotNull(message, r'NotificationsNotification', 'message'),
              link: BuiltValueNullFieldError.checkNotNull(link, r'NotificationsNotification', 'link'),
              subjectRich: subjectRich,
              subjectRichParameters: subjectRichParameters,
              messageRich: messageRich,
              messageRichParameters: messageRichParameters,
              icon: icon,
              shouldNotify: shouldNotify,
              actions: actions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actions';
        actions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsNotification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsListNotifications_OcsInterfaceBuilder {
  void replace(NotificationsListNotifications_OcsInterface other);
  void update(void Function(NotificationsListNotifications_OcsInterfaceBuilder) updates);
  NotificationsOCSMetaBuilder get meta;
  set meta(NotificationsOCSMetaBuilder? meta);

  ListBuilder<NotificationsNotification> get data;
  set data(ListBuilder<NotificationsNotification>? data);
}

class _$NotificationsListNotifications_Ocs extends NotificationsListNotifications_Ocs {
  @override
  final NotificationsOCSMeta meta;
  @override
  final BuiltList<NotificationsNotification> data;

  factory _$NotificationsListNotifications_Ocs([void Function(NotificationsListNotifications_OcsBuilder)? updates]) =>
      (NotificationsListNotifications_OcsBuilder()..update(updates))._build();

  _$NotificationsListNotifications_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NotificationsListNotifications_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NotificationsListNotifications_Ocs', 'data');
  }

  @override
  NotificationsListNotifications_Ocs rebuild(void Function(NotificationsListNotifications_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsListNotifications_OcsBuilder toBuilder() => NotificationsListNotifications_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsListNotifications_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'NotificationsListNotifications_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NotificationsListNotifications_OcsBuilder
    implements
        Builder<NotificationsListNotifications_Ocs, NotificationsListNotifications_OcsBuilder>,
        NotificationsListNotifications_OcsInterfaceBuilder {
  _$NotificationsListNotifications_Ocs? _$v;

  NotificationsOCSMetaBuilder? _meta;
  NotificationsOCSMetaBuilder get meta => _$this._meta ??= NotificationsOCSMetaBuilder();
  set meta(covariant NotificationsOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NotificationsNotification>? _data;
  ListBuilder<NotificationsNotification> get data => _$this._data ??= ListBuilder<NotificationsNotification>();
  set data(covariant ListBuilder<NotificationsNotification>? data) => _$this._data = data;

  NotificationsListNotifications_OcsBuilder();

  NotificationsListNotifications_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsListNotifications_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsListNotifications_Ocs;
  }

  @override
  void update(void Function(NotificationsListNotifications_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsListNotifications_Ocs build() => _build();

  _$NotificationsListNotifications_Ocs _build() {
    _$NotificationsListNotifications_Ocs _$result;
    try {
      _$result = _$v ?? _$NotificationsListNotifications_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsListNotifications_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsListNotificationsInterfaceBuilder {
  void replace(NotificationsListNotificationsInterface other);
  void update(void Function(NotificationsListNotificationsInterfaceBuilder) updates);
  NotificationsListNotifications_OcsBuilder get ocs;
  set ocs(NotificationsListNotifications_OcsBuilder? ocs);
}

class _$NotificationsListNotifications extends NotificationsListNotifications {
  @override
  final NotificationsListNotifications_Ocs ocs;

  factory _$NotificationsListNotifications([void Function(NotificationsListNotificationsBuilder)? updates]) =>
      (NotificationsListNotificationsBuilder()..update(updates))._build();

  _$NotificationsListNotifications._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NotificationsListNotifications', 'ocs');
  }

  @override
  NotificationsListNotifications rebuild(void Function(NotificationsListNotificationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsListNotificationsBuilder toBuilder() => NotificationsListNotificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsListNotifications && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'NotificationsListNotifications')..add('ocs', ocs)).toString();
  }
}

class NotificationsListNotificationsBuilder
    implements
        Builder<NotificationsListNotifications, NotificationsListNotificationsBuilder>,
        NotificationsListNotificationsInterfaceBuilder {
  _$NotificationsListNotifications? _$v;

  NotificationsListNotifications_OcsBuilder? _ocs;
  NotificationsListNotifications_OcsBuilder get ocs => _$this._ocs ??= NotificationsListNotifications_OcsBuilder();
  set ocs(covariant NotificationsListNotifications_OcsBuilder? ocs) => _$this._ocs = ocs;

  NotificationsListNotificationsBuilder();

  NotificationsListNotificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsListNotifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsListNotifications;
  }

  @override
  void update(void Function(NotificationsListNotificationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsListNotifications build() => _build();

  _$NotificationsListNotifications _build() {
    _$NotificationsListNotifications _$result;
    try {
      _$result = _$v ?? _$NotificationsListNotifications._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsListNotifications', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsGetNotification_OcsInterfaceBuilder {
  void replace(NotificationsGetNotification_OcsInterface other);
  void update(void Function(NotificationsGetNotification_OcsInterfaceBuilder) updates);
  NotificationsOCSMetaBuilder get meta;
  set meta(NotificationsOCSMetaBuilder? meta);

  NotificationsNotificationBuilder get data;
  set data(NotificationsNotificationBuilder? data);
}

class _$NotificationsGetNotification_Ocs extends NotificationsGetNotification_Ocs {
  @override
  final NotificationsOCSMeta meta;
  @override
  final NotificationsNotification data;

  factory _$NotificationsGetNotification_Ocs([void Function(NotificationsGetNotification_OcsBuilder)? updates]) =>
      (NotificationsGetNotification_OcsBuilder()..update(updates))._build();

  _$NotificationsGetNotification_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NotificationsGetNotification_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NotificationsGetNotification_Ocs', 'data');
  }

  @override
  NotificationsGetNotification_Ocs rebuild(void Function(NotificationsGetNotification_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsGetNotification_OcsBuilder toBuilder() => NotificationsGetNotification_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsGetNotification_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'NotificationsGetNotification_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NotificationsGetNotification_OcsBuilder
    implements
        Builder<NotificationsGetNotification_Ocs, NotificationsGetNotification_OcsBuilder>,
        NotificationsGetNotification_OcsInterfaceBuilder {
  _$NotificationsGetNotification_Ocs? _$v;

  NotificationsOCSMetaBuilder? _meta;
  NotificationsOCSMetaBuilder get meta => _$this._meta ??= NotificationsOCSMetaBuilder();
  set meta(covariant NotificationsOCSMetaBuilder? meta) => _$this._meta = meta;

  NotificationsNotificationBuilder? _data;
  NotificationsNotificationBuilder get data => _$this._data ??= NotificationsNotificationBuilder();
  set data(covariant NotificationsNotificationBuilder? data) => _$this._data = data;

  NotificationsGetNotification_OcsBuilder();

  NotificationsGetNotification_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsGetNotification_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsGetNotification_Ocs;
  }

  @override
  void update(void Function(NotificationsGetNotification_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsGetNotification_Ocs build() => _build();

  _$NotificationsGetNotification_Ocs _build() {
    _$NotificationsGetNotification_Ocs _$result;
    try {
      _$result = _$v ?? _$NotificationsGetNotification_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsGetNotification_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsGetNotificationInterfaceBuilder {
  void replace(NotificationsGetNotificationInterface other);
  void update(void Function(NotificationsGetNotificationInterfaceBuilder) updates);
  NotificationsGetNotification_OcsBuilder get ocs;
  set ocs(NotificationsGetNotification_OcsBuilder? ocs);
}

class _$NotificationsGetNotification extends NotificationsGetNotification {
  @override
  final NotificationsGetNotification_Ocs ocs;

  factory _$NotificationsGetNotification([void Function(NotificationsGetNotificationBuilder)? updates]) =>
      (NotificationsGetNotificationBuilder()..update(updates))._build();

  _$NotificationsGetNotification._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NotificationsGetNotification', 'ocs');
  }

  @override
  NotificationsGetNotification rebuild(void Function(NotificationsGetNotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsGetNotificationBuilder toBuilder() => NotificationsGetNotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsGetNotification && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'NotificationsGetNotification')..add('ocs', ocs)).toString();
  }
}

class NotificationsGetNotificationBuilder
    implements
        Builder<NotificationsGetNotification, NotificationsGetNotificationBuilder>,
        NotificationsGetNotificationInterfaceBuilder {
  _$NotificationsGetNotification? _$v;

  NotificationsGetNotification_OcsBuilder? _ocs;
  NotificationsGetNotification_OcsBuilder get ocs => _$this._ocs ??= NotificationsGetNotification_OcsBuilder();
  set ocs(covariant NotificationsGetNotification_OcsBuilder? ocs) => _$this._ocs = ocs;

  NotificationsGetNotificationBuilder();

  NotificationsGetNotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsGetNotification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsGetNotification;
  }

  @override
  void update(void Function(NotificationsGetNotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsGetNotification build() => _build();

  _$NotificationsGetNotification _build() {
    _$NotificationsGetNotification _$result;
    try {
      _$result = _$v ?? _$NotificationsGetNotification._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsGetNotification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsEmptyOCS_OcsInterfaceBuilder {
  void replace(NotificationsEmptyOCS_OcsInterface other);
  void update(void Function(NotificationsEmptyOCS_OcsInterfaceBuilder) updates);
  NotificationsOCSMetaBuilder get meta;
  set meta(NotificationsOCSMetaBuilder? meta);

  ListBuilder<JsonObject> get data;
  set data(ListBuilder<JsonObject>? data);
}

class _$NotificationsEmptyOCS_Ocs extends NotificationsEmptyOCS_Ocs {
  @override
  final NotificationsOCSMeta meta;
  @override
  final BuiltList<JsonObject> data;

  factory _$NotificationsEmptyOCS_Ocs([void Function(NotificationsEmptyOCS_OcsBuilder)? updates]) =>
      (NotificationsEmptyOCS_OcsBuilder()..update(updates))._build();

  _$NotificationsEmptyOCS_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NotificationsEmptyOCS_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NotificationsEmptyOCS_Ocs', 'data');
  }

  @override
  NotificationsEmptyOCS_Ocs rebuild(void Function(NotificationsEmptyOCS_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsEmptyOCS_OcsBuilder toBuilder() => NotificationsEmptyOCS_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsEmptyOCS_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'NotificationsEmptyOCS_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NotificationsEmptyOCS_OcsBuilder
    implements
        Builder<NotificationsEmptyOCS_Ocs, NotificationsEmptyOCS_OcsBuilder>,
        NotificationsEmptyOCS_OcsInterfaceBuilder {
  _$NotificationsEmptyOCS_Ocs? _$v;

  NotificationsOCSMetaBuilder? _meta;
  NotificationsOCSMetaBuilder get meta => _$this._meta ??= NotificationsOCSMetaBuilder();
  set meta(covariant NotificationsOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(covariant ListBuilder<JsonObject>? data) => _$this._data = data;

  NotificationsEmptyOCS_OcsBuilder();

  NotificationsEmptyOCS_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsEmptyOCS_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsEmptyOCS_Ocs;
  }

  @override
  void update(void Function(NotificationsEmptyOCS_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsEmptyOCS_Ocs build() => _build();

  _$NotificationsEmptyOCS_Ocs _build() {
    _$NotificationsEmptyOCS_Ocs _$result;
    try {
      _$result = _$v ?? _$NotificationsEmptyOCS_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsEmptyOCS_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsEmptyOCSInterfaceBuilder {
  void replace(NotificationsEmptyOCSInterface other);
  void update(void Function(NotificationsEmptyOCSInterfaceBuilder) updates);
  NotificationsEmptyOCS_OcsBuilder get ocs;
  set ocs(NotificationsEmptyOCS_OcsBuilder? ocs);
}

class _$NotificationsEmptyOCS extends NotificationsEmptyOCS {
  @override
  final NotificationsEmptyOCS_Ocs ocs;

  factory _$NotificationsEmptyOCS([void Function(NotificationsEmptyOCSBuilder)? updates]) =>
      (NotificationsEmptyOCSBuilder()..update(updates))._build();

  _$NotificationsEmptyOCS._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NotificationsEmptyOCS', 'ocs');
  }

  @override
  NotificationsEmptyOCS rebuild(void Function(NotificationsEmptyOCSBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsEmptyOCSBuilder toBuilder() => NotificationsEmptyOCSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsEmptyOCS && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'NotificationsEmptyOCS')..add('ocs', ocs)).toString();
  }
}

class NotificationsEmptyOCSBuilder
    implements Builder<NotificationsEmptyOCS, NotificationsEmptyOCSBuilder>, NotificationsEmptyOCSInterfaceBuilder {
  _$NotificationsEmptyOCS? _$v;

  NotificationsEmptyOCS_OcsBuilder? _ocs;
  NotificationsEmptyOCS_OcsBuilder get ocs => _$this._ocs ??= NotificationsEmptyOCS_OcsBuilder();
  set ocs(covariant NotificationsEmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

  NotificationsEmptyOCSBuilder();

  NotificationsEmptyOCSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsEmptyOCS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsEmptyOCS;
  }

  @override
  void update(void Function(NotificationsEmptyOCSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsEmptyOCS build() => _build();

  _$NotificationsEmptyOCS _build() {
    _$NotificationsEmptyOCS _$result;
    try {
      _$result = _$v ?? _$NotificationsEmptyOCS._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsEmptyOCS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsPushServerSubscriptionInterfaceBuilder {
  void replace(NotificationsPushServerSubscriptionInterface other);
  void update(void Function(NotificationsPushServerSubscriptionInterfaceBuilder) updates);
  String? get publicKey;
  set publicKey(String? publicKey);

  String? get deviceIdentifier;
  set deviceIdentifier(String? deviceIdentifier);

  String? get signature;
  set signature(String? signature);

  String? get message;
  set message(String? message);
}

class _$NotificationsPushServerSubscription extends NotificationsPushServerSubscription {
  @override
  final String publicKey;
  @override
  final String deviceIdentifier;
  @override
  final String signature;
  @override
  final String? message;

  factory _$NotificationsPushServerSubscription([void Function(NotificationsPushServerSubscriptionBuilder)? updates]) =>
      (NotificationsPushServerSubscriptionBuilder()..update(updates))._build();

  _$NotificationsPushServerSubscription._(
      {required this.publicKey, required this.deviceIdentifier, required this.signature, this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(publicKey, r'NotificationsPushServerSubscription', 'publicKey');
    BuiltValueNullFieldError.checkNotNull(deviceIdentifier, r'NotificationsPushServerSubscription', 'deviceIdentifier');
    BuiltValueNullFieldError.checkNotNull(signature, r'NotificationsPushServerSubscription', 'signature');
  }

  @override
  NotificationsPushServerSubscription rebuild(void Function(NotificationsPushServerSubscriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsPushServerSubscriptionBuilder toBuilder() => NotificationsPushServerSubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsPushServerSubscription &&
        publicKey == other.publicKey &&
        deviceIdentifier == other.deviceIdentifier &&
        signature == other.signature &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, publicKey.hashCode);
    _$hash = $jc(_$hash, deviceIdentifier.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsPushServerSubscription')
          ..add('publicKey', publicKey)
          ..add('deviceIdentifier', deviceIdentifier)
          ..add('signature', signature)
          ..add('message', message))
        .toString();
  }
}

class NotificationsPushServerSubscriptionBuilder
    implements
        Builder<NotificationsPushServerSubscription, NotificationsPushServerSubscriptionBuilder>,
        NotificationsPushServerSubscriptionInterfaceBuilder {
  _$NotificationsPushServerSubscription? _$v;

  String? _publicKey;
  String? get publicKey => _$this._publicKey;
  set publicKey(covariant String? publicKey) => _$this._publicKey = publicKey;

  String? _deviceIdentifier;
  String? get deviceIdentifier => _$this._deviceIdentifier;
  set deviceIdentifier(covariant String? deviceIdentifier) => _$this._deviceIdentifier = deviceIdentifier;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(covariant String? signature) => _$this._signature = signature;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  NotificationsPushServerSubscriptionBuilder();

  NotificationsPushServerSubscriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _publicKey = $v.publicKey;
      _deviceIdentifier = $v.deviceIdentifier;
      _signature = $v.signature;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsPushServerSubscription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsPushServerSubscription;
  }

  @override
  void update(void Function(NotificationsPushServerSubscriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsPushServerSubscription build() => _build();

  _$NotificationsPushServerSubscription _build() {
    final _$result = _$v ??
        _$NotificationsPushServerSubscription._(
            publicKey:
                BuiltValueNullFieldError.checkNotNull(publicKey, r'NotificationsPushServerSubscription', 'publicKey'),
            deviceIdentifier: BuiltValueNullFieldError.checkNotNull(
                deviceIdentifier, r'NotificationsPushServerSubscription', 'deviceIdentifier'),
            signature:
                BuiltValueNullFieldError.checkNotNull(signature, r'NotificationsPushServerSubscription', 'signature'),
            message: message);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsPushServerRegistration_OcsInterfaceBuilder {
  void replace(NotificationsPushServerRegistration_OcsInterface other);
  void update(void Function(NotificationsPushServerRegistration_OcsInterfaceBuilder) updates);
  NotificationsOCSMetaBuilder get meta;
  set meta(NotificationsOCSMetaBuilder? meta);

  NotificationsPushServerSubscriptionBuilder get data;
  set data(NotificationsPushServerSubscriptionBuilder? data);
}

class _$NotificationsPushServerRegistration_Ocs extends NotificationsPushServerRegistration_Ocs {
  @override
  final NotificationsOCSMeta meta;
  @override
  final NotificationsPushServerSubscription data;

  factory _$NotificationsPushServerRegistration_Ocs(
          [void Function(NotificationsPushServerRegistration_OcsBuilder)? updates]) =>
      (NotificationsPushServerRegistration_OcsBuilder()..update(updates))._build();

  _$NotificationsPushServerRegistration_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NotificationsPushServerRegistration_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NotificationsPushServerRegistration_Ocs', 'data');
  }

  @override
  NotificationsPushServerRegistration_Ocs rebuild(
          void Function(NotificationsPushServerRegistration_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsPushServerRegistration_OcsBuilder toBuilder() =>
      NotificationsPushServerRegistration_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsPushServerRegistration_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'NotificationsPushServerRegistration_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NotificationsPushServerRegistration_OcsBuilder
    implements
        Builder<NotificationsPushServerRegistration_Ocs, NotificationsPushServerRegistration_OcsBuilder>,
        NotificationsPushServerRegistration_OcsInterfaceBuilder {
  _$NotificationsPushServerRegistration_Ocs? _$v;

  NotificationsOCSMetaBuilder? _meta;
  NotificationsOCSMetaBuilder get meta => _$this._meta ??= NotificationsOCSMetaBuilder();
  set meta(covariant NotificationsOCSMetaBuilder? meta) => _$this._meta = meta;

  NotificationsPushServerSubscriptionBuilder? _data;
  NotificationsPushServerSubscriptionBuilder get data => _$this._data ??= NotificationsPushServerSubscriptionBuilder();
  set data(covariant NotificationsPushServerSubscriptionBuilder? data) => _$this._data = data;

  NotificationsPushServerRegistration_OcsBuilder();

  NotificationsPushServerRegistration_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsPushServerRegistration_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsPushServerRegistration_Ocs;
  }

  @override
  void update(void Function(NotificationsPushServerRegistration_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsPushServerRegistration_Ocs build() => _build();

  _$NotificationsPushServerRegistration_Ocs _build() {
    _$NotificationsPushServerRegistration_Ocs _$result;
    try {
      _$result = _$v ?? _$NotificationsPushServerRegistration_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsPushServerRegistration_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsPushServerRegistrationInterfaceBuilder {
  void replace(NotificationsPushServerRegistrationInterface other);
  void update(void Function(NotificationsPushServerRegistrationInterfaceBuilder) updates);
  NotificationsPushServerRegistration_OcsBuilder get ocs;
  set ocs(NotificationsPushServerRegistration_OcsBuilder? ocs);
}

class _$NotificationsPushServerRegistration extends NotificationsPushServerRegistration {
  @override
  final NotificationsPushServerRegistration_Ocs ocs;

  factory _$NotificationsPushServerRegistration([void Function(NotificationsPushServerRegistrationBuilder)? updates]) =>
      (NotificationsPushServerRegistrationBuilder()..update(updates))._build();

  _$NotificationsPushServerRegistration._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NotificationsPushServerRegistration', 'ocs');
  }

  @override
  NotificationsPushServerRegistration rebuild(void Function(NotificationsPushServerRegistrationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsPushServerRegistrationBuilder toBuilder() => NotificationsPushServerRegistrationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsPushServerRegistration && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'NotificationsPushServerRegistration')..add('ocs', ocs)).toString();
  }
}

class NotificationsPushServerRegistrationBuilder
    implements
        Builder<NotificationsPushServerRegistration, NotificationsPushServerRegistrationBuilder>,
        NotificationsPushServerRegistrationInterfaceBuilder {
  _$NotificationsPushServerRegistration? _$v;

  NotificationsPushServerRegistration_OcsBuilder? _ocs;
  NotificationsPushServerRegistration_OcsBuilder get ocs =>
      _$this._ocs ??= NotificationsPushServerRegistration_OcsBuilder();
  set ocs(covariant NotificationsPushServerRegistration_OcsBuilder? ocs) => _$this._ocs = ocs;

  NotificationsPushServerRegistrationBuilder();

  NotificationsPushServerRegistrationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsPushServerRegistration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsPushServerRegistration;
  }

  @override
  void update(void Function(NotificationsPushServerRegistrationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsPushServerRegistration build() => _build();

  _$NotificationsPushServerRegistration _build() {
    _$NotificationsPushServerRegistration _$result;
    try {
      _$result = _$v ?? _$NotificationsPushServerRegistration._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsPushServerRegistration', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsCapabilities_NotificationsInterfaceBuilder {
  void replace(NotificationsCapabilities_NotificationsInterface other);
  void update(void Function(NotificationsCapabilities_NotificationsInterfaceBuilder) updates);
  ListBuilder<String> get ocsEndpoints;
  set ocsEndpoints(ListBuilder<String>? ocsEndpoints);

  ListBuilder<String> get push;
  set push(ListBuilder<String>? push);

  ListBuilder<String> get adminNotifications;
  set adminNotifications(ListBuilder<String>? adminNotifications);
}

class _$NotificationsCapabilities_Notifications extends NotificationsCapabilities_Notifications {
  @override
  final BuiltList<String>? ocsEndpoints;
  @override
  final BuiltList<String>? push;
  @override
  final BuiltList<String>? adminNotifications;

  factory _$NotificationsCapabilities_Notifications(
          [void Function(NotificationsCapabilities_NotificationsBuilder)? updates]) =>
      (NotificationsCapabilities_NotificationsBuilder()..update(updates))._build();

  _$NotificationsCapabilities_Notifications._({this.ocsEndpoints, this.push, this.adminNotifications}) : super._();

  @override
  NotificationsCapabilities_Notifications rebuild(
          void Function(NotificationsCapabilities_NotificationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsCapabilities_NotificationsBuilder toBuilder() =>
      NotificationsCapabilities_NotificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsCapabilities_Notifications &&
        ocsEndpoints == other.ocsEndpoints &&
        push == other.push &&
        adminNotifications == other.adminNotifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocsEndpoints.hashCode);
    _$hash = $jc(_$hash, push.hashCode);
    _$hash = $jc(_$hash, adminNotifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsCapabilities_Notifications')
          ..add('ocsEndpoints', ocsEndpoints)
          ..add('push', push)
          ..add('adminNotifications', adminNotifications))
        .toString();
  }
}

class NotificationsCapabilities_NotificationsBuilder
    implements
        Builder<NotificationsCapabilities_Notifications, NotificationsCapabilities_NotificationsBuilder>,
        NotificationsCapabilities_NotificationsInterfaceBuilder {
  _$NotificationsCapabilities_Notifications? _$v;

  ListBuilder<String>? _ocsEndpoints;
  ListBuilder<String> get ocsEndpoints => _$this._ocsEndpoints ??= ListBuilder<String>();
  set ocsEndpoints(covariant ListBuilder<String>? ocsEndpoints) => _$this._ocsEndpoints = ocsEndpoints;

  ListBuilder<String>? _push;
  ListBuilder<String> get push => _$this._push ??= ListBuilder<String>();
  set push(covariant ListBuilder<String>? push) => _$this._push = push;

  ListBuilder<String>? _adminNotifications;
  ListBuilder<String> get adminNotifications => _$this._adminNotifications ??= ListBuilder<String>();
  set adminNotifications(covariant ListBuilder<String>? adminNotifications) =>
      _$this._adminNotifications = adminNotifications;

  NotificationsCapabilities_NotificationsBuilder();

  NotificationsCapabilities_NotificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocsEndpoints = $v.ocsEndpoints?.toBuilder();
      _push = $v.push?.toBuilder();
      _adminNotifications = $v.adminNotifications?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsCapabilities_Notifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsCapabilities_Notifications;
  }

  @override
  void update(void Function(NotificationsCapabilities_NotificationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsCapabilities_Notifications build() => _build();

  _$NotificationsCapabilities_Notifications _build() {
    _$NotificationsCapabilities_Notifications _$result;
    try {
      _$result = _$v ??
          _$NotificationsCapabilities_Notifications._(
              ocsEndpoints: _ocsEndpoints?.build(),
              push: _push?.build(),
              adminNotifications: _adminNotifications?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocsEndpoints';
        _ocsEndpoints?.build();
        _$failedField = 'push';
        _push?.build();
        _$failedField = 'adminNotifications';
        _adminNotifications?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsCapabilities_Notifications', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsCapabilitiesInterfaceBuilder {
  void replace(NotificationsCapabilitiesInterface other);
  void update(void Function(NotificationsCapabilitiesInterfaceBuilder) updates);
  NotificationsCapabilities_NotificationsBuilder get notifications;
  set notifications(NotificationsCapabilities_NotificationsBuilder? notifications);
}

class _$NotificationsCapabilities extends NotificationsCapabilities {
  @override
  final NotificationsCapabilities_Notifications notifications;

  factory _$NotificationsCapabilities([void Function(NotificationsCapabilitiesBuilder)? updates]) =>
      (NotificationsCapabilitiesBuilder()..update(updates))._build();

  _$NotificationsCapabilities._({required this.notifications}) : super._() {
    BuiltValueNullFieldError.checkNotNull(notifications, r'NotificationsCapabilities', 'notifications');
  }

  @override
  NotificationsCapabilities rebuild(void Function(NotificationsCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsCapabilitiesBuilder toBuilder() => NotificationsCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsCapabilities && notifications == other.notifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsCapabilities')..add('notifications', notifications)).toString();
  }
}

class NotificationsCapabilitiesBuilder
    implements
        Builder<NotificationsCapabilities, NotificationsCapabilitiesBuilder>,
        NotificationsCapabilitiesInterfaceBuilder {
  _$NotificationsCapabilities? _$v;

  NotificationsCapabilities_NotificationsBuilder? _notifications;
  NotificationsCapabilities_NotificationsBuilder get notifications =>
      _$this._notifications ??= NotificationsCapabilities_NotificationsBuilder();
  set notifications(covariant NotificationsCapabilities_NotificationsBuilder? notifications) =>
      _$this._notifications = notifications;

  NotificationsCapabilitiesBuilder();

  NotificationsCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notifications = $v.notifications.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsCapabilities;
  }

  @override
  void update(void Function(NotificationsCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsCapabilities build() => _build();

  _$NotificationsCapabilities _build() {
    _$NotificationsCapabilities _$result;
    try {
      _$result = _$v ?? _$NotificationsCapabilities._(notifications: notifications.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notifications';
        notifications.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NotificationsCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class NotificationsNotificationDecryptedSubjectInterfaceBuilder {
  void replace(NotificationsNotificationDecryptedSubjectInterface other);
  void update(void Function(NotificationsNotificationDecryptedSubjectInterfaceBuilder) updates);
  int? get nid;
  set nid(int? nid);

  String? get app;
  set app(String? app);

  String? get subject;
  set subject(String? subject);

  String? get type;
  set type(String? type);

  String? get id;
  set id(String? id);

  bool? get delete;
  set delete(bool? delete);

  bool? get deleteAll;
  set deleteAll(bool? deleteAll);
}

class _$NotificationsNotificationDecryptedSubject extends NotificationsNotificationDecryptedSubject {
  @override
  final int? nid;
  @override
  final String? app;
  @override
  final String? subject;
  @override
  final String? type;
  @override
  final String? id;
  @override
  final bool? delete;
  @override
  final bool? deleteAll;

  factory _$NotificationsNotificationDecryptedSubject(
          [void Function(NotificationsNotificationDecryptedSubjectBuilder)? updates]) =>
      (NotificationsNotificationDecryptedSubjectBuilder()..update(updates))._build();

  _$NotificationsNotificationDecryptedSubject._(
      {this.nid, this.app, this.subject, this.type, this.id, this.delete, this.deleteAll})
      : super._();

  @override
  NotificationsNotificationDecryptedSubject rebuild(
          void Function(NotificationsNotificationDecryptedSubjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsNotificationDecryptedSubjectBuilder toBuilder() =>
      NotificationsNotificationDecryptedSubjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsNotificationDecryptedSubject &&
        nid == other.nid &&
        app == other.app &&
        subject == other.subject &&
        type == other.type &&
        id == other.id &&
        delete == other.delete &&
        deleteAll == other.deleteAll;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nid.hashCode);
    _$hash = $jc(_$hash, app.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, delete.hashCode);
    _$hash = $jc(_$hash, deleteAll.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsNotificationDecryptedSubject')
          ..add('nid', nid)
          ..add('app', app)
          ..add('subject', subject)
          ..add('type', type)
          ..add('id', id)
          ..add('delete', delete)
          ..add('deleteAll', deleteAll))
        .toString();
  }
}

class NotificationsNotificationDecryptedSubjectBuilder
    implements
        Builder<NotificationsNotificationDecryptedSubject, NotificationsNotificationDecryptedSubjectBuilder>,
        NotificationsNotificationDecryptedSubjectInterfaceBuilder {
  _$NotificationsNotificationDecryptedSubject? _$v;

  int? _nid;
  int? get nid => _$this._nid;
  set nid(covariant int? nid) => _$this._nid = nid;

  String? _app;
  String? get app => _$this._app;
  set app(covariant String? app) => _$this._app = app;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(covariant String? subject) => _$this._subject = subject;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  bool? _delete;
  bool? get delete => _$this._delete;
  set delete(covariant bool? delete) => _$this._delete = delete;

  bool? _deleteAll;
  bool? get deleteAll => _$this._deleteAll;
  set deleteAll(covariant bool? deleteAll) => _$this._deleteAll = deleteAll;

  NotificationsNotificationDecryptedSubjectBuilder();

  NotificationsNotificationDecryptedSubjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nid = $v.nid;
      _app = $v.app;
      _subject = $v.subject;
      _type = $v.type;
      _id = $v.id;
      _delete = $v.delete;
      _deleteAll = $v.deleteAll;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NotificationsNotificationDecryptedSubject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsNotificationDecryptedSubject;
  }

  @override
  void update(void Function(NotificationsNotificationDecryptedSubjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsNotificationDecryptedSubject build() => _build();

  _$NotificationsNotificationDecryptedSubject _build() {
    final _$result = _$v ??
        _$NotificationsNotificationDecryptedSubject._(
            nid: nid, app: app, subject: subject, type: type, id: id, delete: delete, deleteAll: deleteAll);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
