// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioning_api.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$_serializers = (Serializers().toBuilder()
      ..add(ProvisioningApiEmptyOCS.serializer)
      ..add(ProvisioningApiEmptyOCS_Ocs.serializer)
      ..add(ProvisioningApiOCSMeta.serializer)
      ..add(ProvisioningApiUser.serializer)
      ..add(ProvisioningApiUserDetails.serializer)
      ..add(ProvisioningApiUserDetails_BackendCapabilities.serializer)
      ..add(ProvisioningApiUserDetails_Quota.serializer)
      ..add(ProvisioningApiUser_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>()))
    .build();
Serializer<ProvisioningApiOCSMeta> _$provisioningApiOCSMetaSerializer = _$ProvisioningApiOCSMetaSerializer();
Serializer<ProvisioningApiUserDetails_Quota> _$provisioningApiUserDetailsQuotaSerializer =
    _$ProvisioningApiUserDetails_QuotaSerializer();
Serializer<ProvisioningApiUserDetails_BackendCapabilities> _$provisioningApiUserDetailsBackendCapabilitiesSerializer =
    _$ProvisioningApiUserDetails_BackendCapabilitiesSerializer();
Serializer<ProvisioningApiUserDetails> _$provisioningApiUserDetailsSerializer =
    _$ProvisioningApiUserDetailsSerializer();
Serializer<ProvisioningApiUser_Ocs> _$provisioningApiUserOcsSerializer = _$ProvisioningApiUser_OcsSerializer();
Serializer<ProvisioningApiUser> _$provisioningApiUserSerializer = _$ProvisioningApiUserSerializer();
Serializer<ProvisioningApiEmptyOCS_Ocs> _$provisioningApiEmptyOCSOcsSerializer =
    _$ProvisioningApiEmptyOCS_OcsSerializer();
Serializer<ProvisioningApiEmptyOCS> _$provisioningApiEmptyOCSSerializer = _$ProvisioningApiEmptyOCSSerializer();

class _$ProvisioningApiOCSMetaSerializer implements StructuredSerializer<ProvisioningApiOCSMeta> {
  @override
  final Iterable<Type> types = const [ProvisioningApiOCSMeta, _$ProvisioningApiOCSMeta];
  @override
  final String wireName = 'ProvisioningApiOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiOCSMeta object,
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
  ProvisioningApiOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiOCSMetaBuilder();

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

class _$ProvisioningApiUserDetails_QuotaSerializer implements StructuredSerializer<ProvisioningApiUserDetails_Quota> {
  @override
  final Iterable<Type> types = const [ProvisioningApiUserDetails_Quota, _$ProvisioningApiUserDetails_Quota];
  @override
  final String wireName = 'ProvisioningApiUserDetails_Quota';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiUserDetails_Quota object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'free',
      serializers.serialize(object.free, specifiedType: const FullType(int)),
      'used',
      serializers.serialize(object.used, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'relative',
      serializers.serialize(object.relative, specifiedType: const FullType(num)),
      'quota',
      serializers.serialize(object.quota, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ProvisioningApiUserDetails_Quota deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiUserDetails_QuotaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'free':
          result.free = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'used':
          result.used = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'relative':
          result.relative = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'quota':
          result.quota = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ProvisioningApiUserDetails_BackendCapabilitiesSerializer
    implements StructuredSerializer<ProvisioningApiUserDetails_BackendCapabilities> {
  @override
  final Iterable<Type> types = const [
    ProvisioningApiUserDetails_BackendCapabilities,
    _$ProvisioningApiUserDetails_BackendCapabilities
  ];
  @override
  final String wireName = 'ProvisioningApiUserDetails_BackendCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiUserDetails_BackendCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'setDisplayName',
      serializers.serialize(object.setDisplayName, specifiedType: const FullType(bool)),
      'setPassword',
      serializers.serialize(object.setPassword, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ProvisioningApiUserDetails_BackendCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiUserDetails_BackendCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'setDisplayName':
          result.setDisplayName = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'setPassword':
          result.setPassword = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ProvisioningApiUserDetailsSerializer implements StructuredSerializer<ProvisioningApiUserDetails> {
  @override
  final Iterable<Type> types = const [ProvisioningApiUserDetails, _$ProvisioningApiUserDetails];
  @override
  final String wireName = 'ProvisioningApiUserDetails';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiUserDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'lastLogin',
      serializers.serialize(object.lastLogin, specifiedType: const FullType(int)),
      'backend',
      serializers.serialize(object.backend, specifiedType: const FullType(String)),
      'subadmin',
      serializers.serialize(object.subadmin, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'quota',
      serializers.serialize(object.quota, specifiedType: const FullType(ProvisioningApiUserDetails_Quota)),
      'avatarScope',
      serializers.serialize(object.avatarScope, specifiedType: const FullType(String)),
      'emailScope',
      serializers.serialize(object.emailScope, specifiedType: const FullType(String)),
      'additional_mail',
      serializers.serialize(object.additionalMail, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'additional_mailScope',
      serializers.serialize(object.additionalMailScope, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'displayname',
      serializers.serialize(object.displayname, specifiedType: const FullType(String)),
      'displaynameScope',
      serializers.serialize(object.displaynameScope, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone, specifiedType: const FullType(String)),
      'phoneScope',
      serializers.serialize(object.phoneScope, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address, specifiedType: const FullType(String)),
      'addressScope',
      serializers.serialize(object.addressScope, specifiedType: const FullType(String)),
      'website',
      serializers.serialize(object.website, specifiedType: const FullType(String)),
      'websiteScope',
      serializers.serialize(object.websiteScope, specifiedType: const FullType(String)),
      'twitter',
      serializers.serialize(object.twitter, specifiedType: const FullType(String)),
      'twitterScope',
      serializers.serialize(object.twitterScope, specifiedType: const FullType(String)),
      'organisation',
      serializers.serialize(object.organisation, specifiedType: const FullType(String)),
      'organisationScope',
      serializers.serialize(object.organisationScope, specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'roleScope',
      serializers.serialize(object.roleScope, specifiedType: const FullType(String)),
      'headline',
      serializers.serialize(object.headline, specifiedType: const FullType(String)),
      'headlineScope',
      serializers.serialize(object.headlineScope, specifiedType: const FullType(String)),
      'biography',
      serializers.serialize(object.biography, specifiedType: const FullType(String)),
      'biographyScope',
      serializers.serialize(object.biographyScope, specifiedType: const FullType(String)),
      'profile_enabled',
      serializers.serialize(object.profileEnabled, specifiedType: const FullType(String)),
      'profile_enabledScope',
      serializers.serialize(object.profileEnabledScope, specifiedType: const FullType(String)),
      'fediverse',
      serializers.serialize(object.fediverse, specifiedType: const FullType(String)),
      'fediverseScope',
      serializers.serialize(object.fediverseScope, specifiedType: const FullType(String)),
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'language',
      serializers.serialize(object.language, specifiedType: const FullType(String)),
      'locale',
      serializers.serialize(object.locale, specifiedType: const FullType(String)),
      'backendCapabilities',
      serializers.serialize(object.backendCapabilities,
          specifiedType: const FullType(ProvisioningApiUserDetails_BackendCapabilities)),
      'display-name',
      serializers.serialize(object.displayName, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.storageLocation;
    if (value != null) {
      result
        ..add('storageLocation')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.notifyEmail;
    if (value != null) {
      result
        ..add('notify_email')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProvisioningApiUserDetails deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiUserDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'storageLocation':
          result.storageLocation = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'lastLogin':
          result.lastLogin = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'backend':
          result.backend = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subadmin':
          result.subadmin.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'quota':
          result.quota.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProvisioningApiUserDetails_Quota))! as ProvisioningApiUserDetails_Quota);
          break;
        case 'avatarScope':
          result.avatarScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'emailScope':
          result.emailScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'additional_mail':
          result.additionalMail.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'additional_mailScope':
          result.additionalMailScope.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'displayname':
          result.displayname = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'displaynameScope':
          result.displaynameScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'phoneScope':
          result.phoneScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'addressScope':
          result.addressScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'website':
          result.website = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'websiteScope':
          result.websiteScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'twitter':
          result.twitter = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'twitterScope':
          result.twitterScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'organisation':
          result.organisation = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'organisationScope':
          result.organisationScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'roleScope':
          result.roleScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'headline':
          result.headline = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'headlineScope':
          result.headlineScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'biography':
          result.biography = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'biographyScope':
          result.biographyScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'profile_enabled':
          result.profileEnabled = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'profile_enabledScope':
          result.profileEnabledScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'fediverse':
          result.fediverse = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'fediverseScope':
          result.fediverseScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'groups':
          result.groups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'language':
          result.language = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'locale':
          result.locale = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'notify_email':
          result.notifyEmail = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'backendCapabilities':
          result.backendCapabilities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ProvisioningApiUserDetails_BackendCapabilities))!
              as ProvisioningApiUserDetails_BackendCapabilities);
          break;
        case 'display-name':
          result.displayName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProvisioningApiUser_OcsSerializer implements StructuredSerializer<ProvisioningApiUser_Ocs> {
  @override
  final Iterable<Type> types = const [ProvisioningApiUser_Ocs, _$ProvisioningApiUser_Ocs];
  @override
  final String wireName = 'ProvisioningApiUser_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiUser_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(ProvisioningApiOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(ProvisioningApiUserDetails)),
    ];

    return result;
  }

  @override
  ProvisioningApiUser_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiUser_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(ProvisioningApiOCSMeta))!
              as ProvisioningApiOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(ProvisioningApiUserDetails))!
              as ProvisioningApiUserDetails);
          break;
      }
    }

    return result.build();
  }
}

class _$ProvisioningApiUserSerializer implements StructuredSerializer<ProvisioningApiUser> {
  @override
  final Iterable<Type> types = const [ProvisioningApiUser, _$ProvisioningApiUser];
  @override
  final String wireName = 'ProvisioningApiUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ProvisioningApiUser_Ocs)),
    ];

    return result;
  }

  @override
  ProvisioningApiUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value, specifiedType: const FullType(ProvisioningApiUser_Ocs))!
              as ProvisioningApiUser_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ProvisioningApiEmptyOCS_OcsSerializer implements StructuredSerializer<ProvisioningApiEmptyOCS_Ocs> {
  @override
  final Iterable<Type> types = const [ProvisioningApiEmptyOCS_Ocs, _$ProvisioningApiEmptyOCS_Ocs];
  @override
  final String wireName = 'ProvisioningApiEmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiEmptyOCS_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(ProvisioningApiOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  ProvisioningApiEmptyOCS_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiEmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value, specifiedType: const FullType(ProvisioningApiOCSMeta))!
              as ProvisioningApiOCSMeta);
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

class _$ProvisioningApiEmptyOCSSerializer implements StructuredSerializer<ProvisioningApiEmptyOCS> {
  @override
  final Iterable<Type> types = const [ProvisioningApiEmptyOCS, _$ProvisioningApiEmptyOCS];
  @override
  final String wireName = 'ProvisioningApiEmptyOCS';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProvisioningApiEmptyOCS object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ProvisioningApiEmptyOCS_Ocs)),
    ];

    return result;
  }

  @override
  ProvisioningApiEmptyOCS deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProvisioningApiEmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value, specifiedType: const FullType(ProvisioningApiEmptyOCS_Ocs))!
              as ProvisioningApiEmptyOCS_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$ProvisioningApiOCSMeta extends ProvisioningApiOCSMeta {
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

  factory _$ProvisioningApiOCSMeta([void Function(ProvisioningApiOCSMetaBuilder)? updates]) =>
      (ProvisioningApiOCSMetaBuilder()..update(updates))._build();

  _$ProvisioningApiOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'ProvisioningApiOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'ProvisioningApiOCSMeta', 'statuscode');
  }

  @override
  ProvisioningApiOCSMeta rebuild(void Function(ProvisioningApiOCSMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiOCSMetaBuilder toBuilder() => ProvisioningApiOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'ProvisioningApiOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class ProvisioningApiOCSMetaBuilder implements Builder<ProvisioningApiOCSMeta, ProvisioningApiOCSMetaBuilder> {
  _$ProvisioningApiOCSMeta? _$v;

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

  ProvisioningApiOCSMetaBuilder();

  ProvisioningApiOCSMetaBuilder get _$this {
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
  void replace(ProvisioningApiOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiOCSMeta;
  }

  @override
  void update(void Function(ProvisioningApiOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiOCSMeta build() => _build();

  _$ProvisioningApiOCSMeta _build() {
    final _$result = _$v ??
        _$ProvisioningApiOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'ProvisioningApiOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'ProvisioningApiOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

class _$ProvisioningApiUserDetails_Quota extends ProvisioningApiUserDetails_Quota {
  @override
  final int free;
  @override
  final int used;
  @override
  final int total;
  @override
  final num relative;
  @override
  final int quota;

  factory _$ProvisioningApiUserDetails_Quota([void Function(ProvisioningApiUserDetails_QuotaBuilder)? updates]) =>
      (ProvisioningApiUserDetails_QuotaBuilder()..update(updates))._build();

  _$ProvisioningApiUserDetails_Quota._(
      {required this.free, required this.used, required this.total, required this.relative, required this.quota})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(free, r'ProvisioningApiUserDetails_Quota', 'free');
    BuiltValueNullFieldError.checkNotNull(used, r'ProvisioningApiUserDetails_Quota', 'used');
    BuiltValueNullFieldError.checkNotNull(total, r'ProvisioningApiUserDetails_Quota', 'total');
    BuiltValueNullFieldError.checkNotNull(relative, r'ProvisioningApiUserDetails_Quota', 'relative');
    BuiltValueNullFieldError.checkNotNull(quota, r'ProvisioningApiUserDetails_Quota', 'quota');
  }

  @override
  ProvisioningApiUserDetails_Quota rebuild(void Function(ProvisioningApiUserDetails_QuotaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiUserDetails_QuotaBuilder toBuilder() => ProvisioningApiUserDetails_QuotaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiUserDetails_Quota &&
        free == other.free &&
        used == other.used &&
        total == other.total &&
        relative == other.relative &&
        quota == other.quota;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, free.hashCode);
    _$hash = $jc(_$hash, used.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, relative.hashCode);
    _$hash = $jc(_$hash, quota.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProvisioningApiUserDetails_Quota')
          ..add('free', free)
          ..add('used', used)
          ..add('total', total)
          ..add('relative', relative)
          ..add('quota', quota))
        .toString();
  }
}

class ProvisioningApiUserDetails_QuotaBuilder
    implements Builder<ProvisioningApiUserDetails_Quota, ProvisioningApiUserDetails_QuotaBuilder> {
  _$ProvisioningApiUserDetails_Quota? _$v;

  int? _free;
  int? get free => _$this._free;
  set free(int? free) => _$this._free = free;

  int? _used;
  int? get used => _$this._used;
  set used(int? used) => _$this._used = used;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  num? _relative;
  num? get relative => _$this._relative;
  set relative(num? relative) => _$this._relative = relative;

  int? _quota;
  int? get quota => _$this._quota;
  set quota(int? quota) => _$this._quota = quota;

  ProvisioningApiUserDetails_QuotaBuilder();

  ProvisioningApiUserDetails_QuotaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _free = $v.free;
      _used = $v.used;
      _total = $v.total;
      _relative = $v.relative;
      _quota = $v.quota;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvisioningApiUserDetails_Quota other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiUserDetails_Quota;
  }

  @override
  void update(void Function(ProvisioningApiUserDetails_QuotaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiUserDetails_Quota build() => _build();

  _$ProvisioningApiUserDetails_Quota _build() {
    final _$result = _$v ??
        _$ProvisioningApiUserDetails_Quota._(
            free: BuiltValueNullFieldError.checkNotNull(free, r'ProvisioningApiUserDetails_Quota', 'free'),
            used: BuiltValueNullFieldError.checkNotNull(used, r'ProvisioningApiUserDetails_Quota', 'used'),
            total: BuiltValueNullFieldError.checkNotNull(total, r'ProvisioningApiUserDetails_Quota', 'total'),
            relative: BuiltValueNullFieldError.checkNotNull(relative, r'ProvisioningApiUserDetails_Quota', 'relative'),
            quota: BuiltValueNullFieldError.checkNotNull(quota, r'ProvisioningApiUserDetails_Quota', 'quota'));
    replace(_$result);
    return _$result;
  }
}

class _$ProvisioningApiUserDetails_BackendCapabilities extends ProvisioningApiUserDetails_BackendCapabilities {
  @override
  final bool setDisplayName;
  @override
  final bool setPassword;

  factory _$ProvisioningApiUserDetails_BackendCapabilities(
          [void Function(ProvisioningApiUserDetails_BackendCapabilitiesBuilder)? updates]) =>
      (ProvisioningApiUserDetails_BackendCapabilitiesBuilder()..update(updates))._build();

  _$ProvisioningApiUserDetails_BackendCapabilities._({required this.setDisplayName, required this.setPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        setDisplayName, r'ProvisioningApiUserDetails_BackendCapabilities', 'setDisplayName');
    BuiltValueNullFieldError.checkNotNull(
        setPassword, r'ProvisioningApiUserDetails_BackendCapabilities', 'setPassword');
  }

  @override
  ProvisioningApiUserDetails_BackendCapabilities rebuild(
          void Function(ProvisioningApiUserDetails_BackendCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiUserDetails_BackendCapabilitiesBuilder toBuilder() =>
      ProvisioningApiUserDetails_BackendCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiUserDetails_BackendCapabilities &&
        setDisplayName == other.setDisplayName &&
        setPassword == other.setPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, setDisplayName.hashCode);
    _$hash = $jc(_$hash, setPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProvisioningApiUserDetails_BackendCapabilities')
          ..add('setDisplayName', setDisplayName)
          ..add('setPassword', setPassword))
        .toString();
  }
}

class ProvisioningApiUserDetails_BackendCapabilitiesBuilder
    implements
        Builder<ProvisioningApiUserDetails_BackendCapabilities, ProvisioningApiUserDetails_BackendCapabilitiesBuilder> {
  _$ProvisioningApiUserDetails_BackendCapabilities? _$v;

  bool? _setDisplayName;
  bool? get setDisplayName => _$this._setDisplayName;
  set setDisplayName(bool? setDisplayName) => _$this._setDisplayName = setDisplayName;

  bool? _setPassword;
  bool? get setPassword => _$this._setPassword;
  set setPassword(bool? setPassword) => _$this._setPassword = setPassword;

  ProvisioningApiUserDetails_BackendCapabilitiesBuilder();

  ProvisioningApiUserDetails_BackendCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _setDisplayName = $v.setDisplayName;
      _setPassword = $v.setPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvisioningApiUserDetails_BackendCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiUserDetails_BackendCapabilities;
  }

  @override
  void update(void Function(ProvisioningApiUserDetails_BackendCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiUserDetails_BackendCapabilities build() => _build();

  _$ProvisioningApiUserDetails_BackendCapabilities _build() {
    final _$result = _$v ??
        _$ProvisioningApiUserDetails_BackendCapabilities._(
            setDisplayName: BuiltValueNullFieldError.checkNotNull(
                setDisplayName, r'ProvisioningApiUserDetails_BackendCapabilities', 'setDisplayName'),
            setPassword: BuiltValueNullFieldError.checkNotNull(
                setPassword, r'ProvisioningApiUserDetails_BackendCapabilities', 'setPassword'));
    replace(_$result);
    return _$result;
  }
}

class _$ProvisioningApiUserDetails extends ProvisioningApiUserDetails {
  @override
  final bool? enabled;
  @override
  final String? storageLocation;
  @override
  final String id;
  @override
  final int lastLogin;
  @override
  final String backend;
  @override
  final BuiltList<String> subadmin;
  @override
  final ProvisioningApiUserDetails_Quota quota;
  @override
  final String avatarScope;
  @override
  final String? email;
  @override
  final String emailScope;
  @override
  final BuiltList<String> additionalMail;
  @override
  final BuiltList<String> additionalMailScope;
  @override
  final String displayname;
  @override
  final String displaynameScope;
  @override
  final String phone;
  @override
  final String phoneScope;
  @override
  final String address;
  @override
  final String addressScope;
  @override
  final String website;
  @override
  final String websiteScope;
  @override
  final String twitter;
  @override
  final String twitterScope;
  @override
  final String organisation;
  @override
  final String organisationScope;
  @override
  final String role;
  @override
  final String roleScope;
  @override
  final String headline;
  @override
  final String headlineScope;
  @override
  final String biography;
  @override
  final String biographyScope;
  @override
  final String profileEnabled;
  @override
  final String profileEnabledScope;
  @override
  final String fediverse;
  @override
  final String fediverseScope;
  @override
  final BuiltList<String> groups;
  @override
  final String language;
  @override
  final String locale;
  @override
  final String? notifyEmail;
  @override
  final ProvisioningApiUserDetails_BackendCapabilities backendCapabilities;
  @override
  final String displayName;

  factory _$ProvisioningApiUserDetails([void Function(ProvisioningApiUserDetailsBuilder)? updates]) =>
      (ProvisioningApiUserDetailsBuilder()..update(updates))._build();

  _$ProvisioningApiUserDetails._(
      {this.enabled,
      this.storageLocation,
      required this.id,
      required this.lastLogin,
      required this.backend,
      required this.subadmin,
      required this.quota,
      required this.avatarScope,
      this.email,
      required this.emailScope,
      required this.additionalMail,
      required this.additionalMailScope,
      required this.displayname,
      required this.displaynameScope,
      required this.phone,
      required this.phoneScope,
      required this.address,
      required this.addressScope,
      required this.website,
      required this.websiteScope,
      required this.twitter,
      required this.twitterScope,
      required this.organisation,
      required this.organisationScope,
      required this.role,
      required this.roleScope,
      required this.headline,
      required this.headlineScope,
      required this.biography,
      required this.biographyScope,
      required this.profileEnabled,
      required this.profileEnabledScope,
      required this.fediverse,
      required this.fediverseScope,
      required this.groups,
      required this.language,
      required this.locale,
      this.notifyEmail,
      required this.backendCapabilities,
      required this.displayName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ProvisioningApiUserDetails', 'id');
    BuiltValueNullFieldError.checkNotNull(lastLogin, r'ProvisioningApiUserDetails', 'lastLogin');
    BuiltValueNullFieldError.checkNotNull(backend, r'ProvisioningApiUserDetails', 'backend');
    BuiltValueNullFieldError.checkNotNull(subadmin, r'ProvisioningApiUserDetails', 'subadmin');
    BuiltValueNullFieldError.checkNotNull(quota, r'ProvisioningApiUserDetails', 'quota');
    BuiltValueNullFieldError.checkNotNull(avatarScope, r'ProvisioningApiUserDetails', 'avatarScope');
    BuiltValueNullFieldError.checkNotNull(emailScope, r'ProvisioningApiUserDetails', 'emailScope');
    BuiltValueNullFieldError.checkNotNull(additionalMail, r'ProvisioningApiUserDetails', 'additionalMail');
    BuiltValueNullFieldError.checkNotNull(additionalMailScope, r'ProvisioningApiUserDetails', 'additionalMailScope');
    BuiltValueNullFieldError.checkNotNull(displayname, r'ProvisioningApiUserDetails', 'displayname');
    BuiltValueNullFieldError.checkNotNull(displaynameScope, r'ProvisioningApiUserDetails', 'displaynameScope');
    BuiltValueNullFieldError.checkNotNull(phone, r'ProvisioningApiUserDetails', 'phone');
    BuiltValueNullFieldError.checkNotNull(phoneScope, r'ProvisioningApiUserDetails', 'phoneScope');
    BuiltValueNullFieldError.checkNotNull(address, r'ProvisioningApiUserDetails', 'address');
    BuiltValueNullFieldError.checkNotNull(addressScope, r'ProvisioningApiUserDetails', 'addressScope');
    BuiltValueNullFieldError.checkNotNull(website, r'ProvisioningApiUserDetails', 'website');
    BuiltValueNullFieldError.checkNotNull(websiteScope, r'ProvisioningApiUserDetails', 'websiteScope');
    BuiltValueNullFieldError.checkNotNull(twitter, r'ProvisioningApiUserDetails', 'twitter');
    BuiltValueNullFieldError.checkNotNull(twitterScope, r'ProvisioningApiUserDetails', 'twitterScope');
    BuiltValueNullFieldError.checkNotNull(organisation, r'ProvisioningApiUserDetails', 'organisation');
    BuiltValueNullFieldError.checkNotNull(organisationScope, r'ProvisioningApiUserDetails', 'organisationScope');
    BuiltValueNullFieldError.checkNotNull(role, r'ProvisioningApiUserDetails', 'role');
    BuiltValueNullFieldError.checkNotNull(roleScope, r'ProvisioningApiUserDetails', 'roleScope');
    BuiltValueNullFieldError.checkNotNull(headline, r'ProvisioningApiUserDetails', 'headline');
    BuiltValueNullFieldError.checkNotNull(headlineScope, r'ProvisioningApiUserDetails', 'headlineScope');
    BuiltValueNullFieldError.checkNotNull(biography, r'ProvisioningApiUserDetails', 'biography');
    BuiltValueNullFieldError.checkNotNull(biographyScope, r'ProvisioningApiUserDetails', 'biographyScope');
    BuiltValueNullFieldError.checkNotNull(profileEnabled, r'ProvisioningApiUserDetails', 'profileEnabled');
    BuiltValueNullFieldError.checkNotNull(profileEnabledScope, r'ProvisioningApiUserDetails', 'profileEnabledScope');
    BuiltValueNullFieldError.checkNotNull(fediverse, r'ProvisioningApiUserDetails', 'fediverse');
    BuiltValueNullFieldError.checkNotNull(fediverseScope, r'ProvisioningApiUserDetails', 'fediverseScope');
    BuiltValueNullFieldError.checkNotNull(groups, r'ProvisioningApiUserDetails', 'groups');
    BuiltValueNullFieldError.checkNotNull(language, r'ProvisioningApiUserDetails', 'language');
    BuiltValueNullFieldError.checkNotNull(locale, r'ProvisioningApiUserDetails', 'locale');
    BuiltValueNullFieldError.checkNotNull(backendCapabilities, r'ProvisioningApiUserDetails', 'backendCapabilities');
    BuiltValueNullFieldError.checkNotNull(displayName, r'ProvisioningApiUserDetails', 'displayName');
  }

  @override
  ProvisioningApiUserDetails rebuild(void Function(ProvisioningApiUserDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiUserDetailsBuilder toBuilder() => ProvisioningApiUserDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiUserDetails &&
        enabled == other.enabled &&
        storageLocation == other.storageLocation &&
        id == other.id &&
        lastLogin == other.lastLogin &&
        backend == other.backend &&
        subadmin == other.subadmin &&
        quota == other.quota &&
        avatarScope == other.avatarScope &&
        email == other.email &&
        emailScope == other.emailScope &&
        additionalMail == other.additionalMail &&
        additionalMailScope == other.additionalMailScope &&
        displayname == other.displayname &&
        displaynameScope == other.displaynameScope &&
        phone == other.phone &&
        phoneScope == other.phoneScope &&
        address == other.address &&
        addressScope == other.addressScope &&
        website == other.website &&
        websiteScope == other.websiteScope &&
        twitter == other.twitter &&
        twitterScope == other.twitterScope &&
        organisation == other.organisation &&
        organisationScope == other.organisationScope &&
        role == other.role &&
        roleScope == other.roleScope &&
        headline == other.headline &&
        headlineScope == other.headlineScope &&
        biography == other.biography &&
        biographyScope == other.biographyScope &&
        profileEnabled == other.profileEnabled &&
        profileEnabledScope == other.profileEnabledScope &&
        fediverse == other.fediverse &&
        fediverseScope == other.fediverseScope &&
        groups == other.groups &&
        language == other.language &&
        locale == other.locale &&
        notifyEmail == other.notifyEmail &&
        backendCapabilities == other.backendCapabilities &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, storageLocation.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, lastLogin.hashCode);
    _$hash = $jc(_$hash, backend.hashCode);
    _$hash = $jc(_$hash, subadmin.hashCode);
    _$hash = $jc(_$hash, quota.hashCode);
    _$hash = $jc(_$hash, avatarScope.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, emailScope.hashCode);
    _$hash = $jc(_$hash, additionalMail.hashCode);
    _$hash = $jc(_$hash, additionalMailScope.hashCode);
    _$hash = $jc(_$hash, displayname.hashCode);
    _$hash = $jc(_$hash, displaynameScope.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, phoneScope.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, addressScope.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, websiteScope.hashCode);
    _$hash = $jc(_$hash, twitter.hashCode);
    _$hash = $jc(_$hash, twitterScope.hashCode);
    _$hash = $jc(_$hash, organisation.hashCode);
    _$hash = $jc(_$hash, organisationScope.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, roleScope.hashCode);
    _$hash = $jc(_$hash, headline.hashCode);
    _$hash = $jc(_$hash, headlineScope.hashCode);
    _$hash = $jc(_$hash, biography.hashCode);
    _$hash = $jc(_$hash, biographyScope.hashCode);
    _$hash = $jc(_$hash, profileEnabled.hashCode);
    _$hash = $jc(_$hash, profileEnabledScope.hashCode);
    _$hash = $jc(_$hash, fediverse.hashCode);
    _$hash = $jc(_$hash, fediverseScope.hashCode);
    _$hash = $jc(_$hash, groups.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, notifyEmail.hashCode);
    _$hash = $jc(_$hash, backendCapabilities.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProvisioningApiUserDetails')
          ..add('enabled', enabled)
          ..add('storageLocation', storageLocation)
          ..add('id', id)
          ..add('lastLogin', lastLogin)
          ..add('backend', backend)
          ..add('subadmin', subadmin)
          ..add('quota', quota)
          ..add('avatarScope', avatarScope)
          ..add('email', email)
          ..add('emailScope', emailScope)
          ..add('additionalMail', additionalMail)
          ..add('additionalMailScope', additionalMailScope)
          ..add('displayname', displayname)
          ..add('displaynameScope', displaynameScope)
          ..add('phone', phone)
          ..add('phoneScope', phoneScope)
          ..add('address', address)
          ..add('addressScope', addressScope)
          ..add('website', website)
          ..add('websiteScope', websiteScope)
          ..add('twitter', twitter)
          ..add('twitterScope', twitterScope)
          ..add('organisation', organisation)
          ..add('organisationScope', organisationScope)
          ..add('role', role)
          ..add('roleScope', roleScope)
          ..add('headline', headline)
          ..add('headlineScope', headlineScope)
          ..add('biography', biography)
          ..add('biographyScope', biographyScope)
          ..add('profileEnabled', profileEnabled)
          ..add('profileEnabledScope', profileEnabledScope)
          ..add('fediverse', fediverse)
          ..add('fediverseScope', fediverseScope)
          ..add('groups', groups)
          ..add('language', language)
          ..add('locale', locale)
          ..add('notifyEmail', notifyEmail)
          ..add('backendCapabilities', backendCapabilities)
          ..add('displayName', displayName))
        .toString();
  }
}

class ProvisioningApiUserDetailsBuilder
    implements Builder<ProvisioningApiUserDetails, ProvisioningApiUserDetailsBuilder> {
  _$ProvisioningApiUserDetails? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  String? _storageLocation;
  String? get storageLocation => _$this._storageLocation;
  set storageLocation(String? storageLocation) => _$this._storageLocation = storageLocation;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _lastLogin;
  int? get lastLogin => _$this._lastLogin;
  set lastLogin(int? lastLogin) => _$this._lastLogin = lastLogin;

  String? _backend;
  String? get backend => _$this._backend;
  set backend(String? backend) => _$this._backend = backend;

  ListBuilder<String>? _subadmin;
  ListBuilder<String> get subadmin => _$this._subadmin ??= ListBuilder<String>();
  set subadmin(ListBuilder<String>? subadmin) => _$this._subadmin = subadmin;

  ProvisioningApiUserDetails_QuotaBuilder? _quota;
  ProvisioningApiUserDetails_QuotaBuilder get quota => _$this._quota ??= ProvisioningApiUserDetails_QuotaBuilder();
  set quota(ProvisioningApiUserDetails_QuotaBuilder? quota) => _$this._quota = quota;

  String? _avatarScope;
  String? get avatarScope => _$this._avatarScope;
  set avatarScope(String? avatarScope) => _$this._avatarScope = avatarScope;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _emailScope;
  String? get emailScope => _$this._emailScope;
  set emailScope(String? emailScope) => _$this._emailScope = emailScope;

  ListBuilder<String>? _additionalMail;
  ListBuilder<String> get additionalMail => _$this._additionalMail ??= ListBuilder<String>();
  set additionalMail(ListBuilder<String>? additionalMail) => _$this._additionalMail = additionalMail;

  ListBuilder<String>? _additionalMailScope;
  ListBuilder<String> get additionalMailScope => _$this._additionalMailScope ??= ListBuilder<String>();
  set additionalMailScope(ListBuilder<String>? additionalMailScope) =>
      _$this._additionalMailScope = additionalMailScope;

  String? _displayname;
  String? get displayname => _$this._displayname;
  set displayname(String? displayname) => _$this._displayname = displayname;

  String? _displaynameScope;
  String? get displaynameScope => _$this._displaynameScope;
  set displaynameScope(String? displaynameScope) => _$this._displaynameScope = displaynameScope;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _phoneScope;
  String? get phoneScope => _$this._phoneScope;
  set phoneScope(String? phoneScope) => _$this._phoneScope = phoneScope;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _addressScope;
  String? get addressScope => _$this._addressScope;
  set addressScope(String? addressScope) => _$this._addressScope = addressScope;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _websiteScope;
  String? get websiteScope => _$this._websiteScope;
  set websiteScope(String? websiteScope) => _$this._websiteScope = websiteScope;

  String? _twitter;
  String? get twitter => _$this._twitter;
  set twitter(String? twitter) => _$this._twitter = twitter;

  String? _twitterScope;
  String? get twitterScope => _$this._twitterScope;
  set twitterScope(String? twitterScope) => _$this._twitterScope = twitterScope;

  String? _organisation;
  String? get organisation => _$this._organisation;
  set organisation(String? organisation) => _$this._organisation = organisation;

  String? _organisationScope;
  String? get organisationScope => _$this._organisationScope;
  set organisationScope(String? organisationScope) => _$this._organisationScope = organisationScope;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _roleScope;
  String? get roleScope => _$this._roleScope;
  set roleScope(String? roleScope) => _$this._roleScope = roleScope;

  String? _headline;
  String? get headline => _$this._headline;
  set headline(String? headline) => _$this._headline = headline;

  String? _headlineScope;
  String? get headlineScope => _$this._headlineScope;
  set headlineScope(String? headlineScope) => _$this._headlineScope = headlineScope;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _biographyScope;
  String? get biographyScope => _$this._biographyScope;
  set biographyScope(String? biographyScope) => _$this._biographyScope = biographyScope;

  String? _profileEnabled;
  String? get profileEnabled => _$this._profileEnabled;
  set profileEnabled(String? profileEnabled) => _$this._profileEnabled = profileEnabled;

  String? _profileEnabledScope;
  String? get profileEnabledScope => _$this._profileEnabledScope;
  set profileEnabledScope(String? profileEnabledScope) => _$this._profileEnabledScope = profileEnabledScope;

  String? _fediverse;
  String? get fediverse => _$this._fediverse;
  set fediverse(String? fediverse) => _$this._fediverse = fediverse;

  String? _fediverseScope;
  String? get fediverseScope => _$this._fediverseScope;
  set fediverseScope(String? fediverseScope) => _$this._fediverseScope = fediverseScope;

  ListBuilder<String>? _groups;
  ListBuilder<String> get groups => _$this._groups ??= ListBuilder<String>();
  set groups(ListBuilder<String>? groups) => _$this._groups = groups;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _notifyEmail;
  String? get notifyEmail => _$this._notifyEmail;
  set notifyEmail(String? notifyEmail) => _$this._notifyEmail = notifyEmail;

  ProvisioningApiUserDetails_BackendCapabilitiesBuilder? _backendCapabilities;
  ProvisioningApiUserDetails_BackendCapabilitiesBuilder get backendCapabilities =>
      _$this._backendCapabilities ??= ProvisioningApiUserDetails_BackendCapabilitiesBuilder();
  set backendCapabilities(ProvisioningApiUserDetails_BackendCapabilitiesBuilder? backendCapabilities) =>
      _$this._backendCapabilities = backendCapabilities;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  ProvisioningApiUserDetailsBuilder();

  ProvisioningApiUserDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _storageLocation = $v.storageLocation;
      _id = $v.id;
      _lastLogin = $v.lastLogin;
      _backend = $v.backend;
      _subadmin = $v.subadmin.toBuilder();
      _quota = $v.quota.toBuilder();
      _avatarScope = $v.avatarScope;
      _email = $v.email;
      _emailScope = $v.emailScope;
      _additionalMail = $v.additionalMail.toBuilder();
      _additionalMailScope = $v.additionalMailScope.toBuilder();
      _displayname = $v.displayname;
      _displaynameScope = $v.displaynameScope;
      _phone = $v.phone;
      _phoneScope = $v.phoneScope;
      _address = $v.address;
      _addressScope = $v.addressScope;
      _website = $v.website;
      _websiteScope = $v.websiteScope;
      _twitter = $v.twitter;
      _twitterScope = $v.twitterScope;
      _organisation = $v.organisation;
      _organisationScope = $v.organisationScope;
      _role = $v.role;
      _roleScope = $v.roleScope;
      _headline = $v.headline;
      _headlineScope = $v.headlineScope;
      _biography = $v.biography;
      _biographyScope = $v.biographyScope;
      _profileEnabled = $v.profileEnabled;
      _profileEnabledScope = $v.profileEnabledScope;
      _fediverse = $v.fediverse;
      _fediverseScope = $v.fediverseScope;
      _groups = $v.groups.toBuilder();
      _language = $v.language;
      _locale = $v.locale;
      _notifyEmail = $v.notifyEmail;
      _backendCapabilities = $v.backendCapabilities.toBuilder();
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvisioningApiUserDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiUserDetails;
  }

  @override
  void update(void Function(ProvisioningApiUserDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiUserDetails build() => _build();

  _$ProvisioningApiUserDetails _build() {
    _$ProvisioningApiUserDetails _$result;
    try {
      _$result = _$v ??
          _$ProvisioningApiUserDetails._(
              enabled: enabled,
              storageLocation: storageLocation,
              id: BuiltValueNullFieldError.checkNotNull(id, r'ProvisioningApiUserDetails', 'id'),
              lastLogin: BuiltValueNullFieldError.checkNotNull(lastLogin, r'ProvisioningApiUserDetails', 'lastLogin'),
              backend: BuiltValueNullFieldError.checkNotNull(backend, r'ProvisioningApiUserDetails', 'backend'),
              subadmin: subadmin.build(),
              quota: quota.build(),
              avatarScope:
                  BuiltValueNullFieldError.checkNotNull(avatarScope, r'ProvisioningApiUserDetails', 'avatarScope'),
              email: email,
              emailScope:
                  BuiltValueNullFieldError.checkNotNull(emailScope, r'ProvisioningApiUserDetails', 'emailScope'),
              additionalMail: additionalMail.build(),
              additionalMailScope: additionalMailScope.build(),
              displayname:
                  BuiltValueNullFieldError.checkNotNull(displayname, r'ProvisioningApiUserDetails', 'displayname'),
              displaynameScope: BuiltValueNullFieldError.checkNotNull(
                  displaynameScope, r'ProvisioningApiUserDetails', 'displaynameScope'),
              phone: BuiltValueNullFieldError.checkNotNull(phone, r'ProvisioningApiUserDetails', 'phone'),
              phoneScope:
                  BuiltValueNullFieldError.checkNotNull(phoneScope, r'ProvisioningApiUserDetails', 'phoneScope'),
              address: BuiltValueNullFieldError.checkNotNull(address, r'ProvisioningApiUserDetails', 'address'),
              addressScope:
                  BuiltValueNullFieldError.checkNotNull(addressScope, r'ProvisioningApiUserDetails', 'addressScope'),
              website: BuiltValueNullFieldError.checkNotNull(website, r'ProvisioningApiUserDetails', 'website'),
              websiteScope:
                  BuiltValueNullFieldError.checkNotNull(websiteScope, r'ProvisioningApiUserDetails', 'websiteScope'),
              twitter: BuiltValueNullFieldError.checkNotNull(twitter, r'ProvisioningApiUserDetails', 'twitter'),
              twitterScope:
                  BuiltValueNullFieldError.checkNotNull(twitterScope, r'ProvisioningApiUserDetails', 'twitterScope'),
              organisation:
                  BuiltValueNullFieldError.checkNotNull(organisation, r'ProvisioningApiUserDetails', 'organisation'),
              organisationScope: BuiltValueNullFieldError.checkNotNull(
                  organisationScope, r'ProvisioningApiUserDetails', 'organisationScope'),
              role: BuiltValueNullFieldError.checkNotNull(role, r'ProvisioningApiUserDetails', 'role'),
              roleScope: BuiltValueNullFieldError.checkNotNull(roleScope, r'ProvisioningApiUserDetails', 'roleScope'),
              headline: BuiltValueNullFieldError.checkNotNull(headline, r'ProvisioningApiUserDetails', 'headline'),
              headlineScope:
                  BuiltValueNullFieldError.checkNotNull(headlineScope, r'ProvisioningApiUserDetails', 'headlineScope'),
              biography: BuiltValueNullFieldError.checkNotNull(biography, r'ProvisioningApiUserDetails', 'biography'),
              biographyScope: BuiltValueNullFieldError.checkNotNull(
                  biographyScope, r'ProvisioningApiUserDetails', 'biographyScope'),
              profileEnabled: BuiltValueNullFieldError.checkNotNull(
                  profileEnabled, r'ProvisioningApiUserDetails', 'profileEnabled'),
              profileEnabledScope: BuiltValueNullFieldError.checkNotNull(
                  profileEnabledScope, r'ProvisioningApiUserDetails', 'profileEnabledScope'),
              fediverse: BuiltValueNullFieldError.checkNotNull(fediverse, r'ProvisioningApiUserDetails', 'fediverse'),
              fediverseScope: BuiltValueNullFieldError.checkNotNull(
                  fediverseScope, r'ProvisioningApiUserDetails', 'fediverseScope'),
              groups: groups.build(),
              language: BuiltValueNullFieldError.checkNotNull(language, r'ProvisioningApiUserDetails', 'language'),
              locale: BuiltValueNullFieldError.checkNotNull(locale, r'ProvisioningApiUserDetails', 'locale'),
              notifyEmail: notifyEmail,
              backendCapabilities: backendCapabilities.build(),
              displayName:
                  BuiltValueNullFieldError.checkNotNull(displayName, r'ProvisioningApiUserDetails', 'displayName'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subadmin';
        subadmin.build();
        _$failedField = 'quota';
        quota.build();

        _$failedField = 'additionalMail';
        additionalMail.build();
        _$failedField = 'additionalMailScope';
        additionalMailScope.build();

        _$failedField = 'groups';
        groups.build();

        _$failedField = 'backendCapabilities';
        backendCapabilities.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ProvisioningApiUserDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProvisioningApiUser_Ocs extends ProvisioningApiUser_Ocs {
  @override
  final ProvisioningApiOCSMeta meta;
  @override
  final ProvisioningApiUserDetails data;

  factory _$ProvisioningApiUser_Ocs([void Function(ProvisioningApiUser_OcsBuilder)? updates]) =>
      (ProvisioningApiUser_OcsBuilder()..update(updates))._build();

  _$ProvisioningApiUser_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ProvisioningApiUser_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ProvisioningApiUser_Ocs', 'data');
  }

  @override
  ProvisioningApiUser_Ocs rebuild(void Function(ProvisioningApiUser_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiUser_OcsBuilder toBuilder() => ProvisioningApiUser_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiUser_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ProvisioningApiUser_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ProvisioningApiUser_OcsBuilder implements Builder<ProvisioningApiUser_Ocs, ProvisioningApiUser_OcsBuilder> {
  _$ProvisioningApiUser_Ocs? _$v;

  ProvisioningApiOCSMetaBuilder? _meta;
  ProvisioningApiOCSMetaBuilder get meta => _$this._meta ??= ProvisioningApiOCSMetaBuilder();
  set meta(ProvisioningApiOCSMetaBuilder? meta) => _$this._meta = meta;

  ProvisioningApiUserDetailsBuilder? _data;
  ProvisioningApiUserDetailsBuilder get data => _$this._data ??= ProvisioningApiUserDetailsBuilder();
  set data(ProvisioningApiUserDetailsBuilder? data) => _$this._data = data;

  ProvisioningApiUser_OcsBuilder();

  ProvisioningApiUser_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvisioningApiUser_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiUser_Ocs;
  }

  @override
  void update(void Function(ProvisioningApiUser_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiUser_Ocs build() => _build();

  _$ProvisioningApiUser_Ocs _build() {
    _$ProvisioningApiUser_Ocs _$result;
    try {
      _$result = _$v ?? _$ProvisioningApiUser_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ProvisioningApiUser_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProvisioningApiUser extends ProvisioningApiUser {
  @override
  final ProvisioningApiUser_Ocs ocs;

  factory _$ProvisioningApiUser([void Function(ProvisioningApiUserBuilder)? updates]) =>
      (ProvisioningApiUserBuilder()..update(updates))._build();

  _$ProvisioningApiUser._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ProvisioningApiUser', 'ocs');
  }

  @override
  ProvisioningApiUser rebuild(void Function(ProvisioningApiUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiUserBuilder toBuilder() => ProvisioningApiUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiUser && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ProvisioningApiUser')..add('ocs', ocs)).toString();
  }
}

class ProvisioningApiUserBuilder implements Builder<ProvisioningApiUser, ProvisioningApiUserBuilder> {
  _$ProvisioningApiUser? _$v;

  ProvisioningApiUser_OcsBuilder? _ocs;
  ProvisioningApiUser_OcsBuilder get ocs => _$this._ocs ??= ProvisioningApiUser_OcsBuilder();
  set ocs(ProvisioningApiUser_OcsBuilder? ocs) => _$this._ocs = ocs;

  ProvisioningApiUserBuilder();

  ProvisioningApiUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvisioningApiUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiUser;
  }

  @override
  void update(void Function(ProvisioningApiUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiUser build() => _build();

  _$ProvisioningApiUser _build() {
    _$ProvisioningApiUser _$result;
    try {
      _$result = _$v ?? _$ProvisioningApiUser._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ProvisioningApiUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProvisioningApiEmptyOCS_Ocs extends ProvisioningApiEmptyOCS_Ocs {
  @override
  final ProvisioningApiOCSMeta meta;
  @override
  final BuiltList<JsonObject> data;

  factory _$ProvisioningApiEmptyOCS_Ocs([void Function(ProvisioningApiEmptyOCS_OcsBuilder)? updates]) =>
      (ProvisioningApiEmptyOCS_OcsBuilder()..update(updates))._build();

  _$ProvisioningApiEmptyOCS_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'ProvisioningApiEmptyOCS_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'ProvisioningApiEmptyOCS_Ocs', 'data');
  }

  @override
  ProvisioningApiEmptyOCS_Ocs rebuild(void Function(ProvisioningApiEmptyOCS_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiEmptyOCS_OcsBuilder toBuilder() => ProvisioningApiEmptyOCS_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiEmptyOCS_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ProvisioningApiEmptyOCS_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class ProvisioningApiEmptyOCS_OcsBuilder
    implements Builder<ProvisioningApiEmptyOCS_Ocs, ProvisioningApiEmptyOCS_OcsBuilder> {
  _$ProvisioningApiEmptyOCS_Ocs? _$v;

  ProvisioningApiOCSMetaBuilder? _meta;
  ProvisioningApiOCSMetaBuilder get meta => _$this._meta ??= ProvisioningApiOCSMetaBuilder();
  set meta(ProvisioningApiOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(ListBuilder<JsonObject>? data) => _$this._data = data;

  ProvisioningApiEmptyOCS_OcsBuilder();

  ProvisioningApiEmptyOCS_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvisioningApiEmptyOCS_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiEmptyOCS_Ocs;
  }

  @override
  void update(void Function(ProvisioningApiEmptyOCS_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiEmptyOCS_Ocs build() => _build();

  _$ProvisioningApiEmptyOCS_Ocs _build() {
    _$ProvisioningApiEmptyOCS_Ocs _$result;
    try {
      _$result = _$v ?? _$ProvisioningApiEmptyOCS_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ProvisioningApiEmptyOCS_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProvisioningApiEmptyOCS extends ProvisioningApiEmptyOCS {
  @override
  final ProvisioningApiEmptyOCS_Ocs ocs;

  factory _$ProvisioningApiEmptyOCS([void Function(ProvisioningApiEmptyOCSBuilder)? updates]) =>
      (ProvisioningApiEmptyOCSBuilder()..update(updates))._build();

  _$ProvisioningApiEmptyOCS._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'ProvisioningApiEmptyOCS', 'ocs');
  }

  @override
  ProvisioningApiEmptyOCS rebuild(void Function(ProvisioningApiEmptyOCSBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvisioningApiEmptyOCSBuilder toBuilder() => ProvisioningApiEmptyOCSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvisioningApiEmptyOCS && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'ProvisioningApiEmptyOCS')..add('ocs', ocs)).toString();
  }
}

class ProvisioningApiEmptyOCSBuilder implements Builder<ProvisioningApiEmptyOCS, ProvisioningApiEmptyOCSBuilder> {
  _$ProvisioningApiEmptyOCS? _$v;

  ProvisioningApiEmptyOCS_OcsBuilder? _ocs;
  ProvisioningApiEmptyOCS_OcsBuilder get ocs => _$this._ocs ??= ProvisioningApiEmptyOCS_OcsBuilder();
  set ocs(ProvisioningApiEmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

  ProvisioningApiEmptyOCSBuilder();

  ProvisioningApiEmptyOCSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvisioningApiEmptyOCS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvisioningApiEmptyOCS;
  }

  @override
  void update(void Function(ProvisioningApiEmptyOCSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvisioningApiEmptyOCS build() => _build();

  _$ProvisioningApiEmptyOCS _build() {
    _$ProvisioningApiEmptyOCS _$result;
    try {
      _$result = _$v ?? _$ProvisioningApiEmptyOCS._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ProvisioningApiEmptyOCS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
