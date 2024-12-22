// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_of_service.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdminFormData_TosOnPublicShares _$adminFormDataTosOnPublicShares$0 =
    const AdminFormData_TosOnPublicShares._('\$0');
const AdminFormData_TosOnPublicShares _$adminFormDataTosOnPublicShares$1 =
    const AdminFormData_TosOnPublicShares._('\$1');

AdminFormData_TosOnPublicShares _$valueOfAdminFormData_TosOnPublicShares(String name) {
  switch (name) {
    case '\$0':
      return _$adminFormDataTosOnPublicShares$0;
    case '\$1':
      return _$adminFormDataTosOnPublicShares$1;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AdminFormData_TosOnPublicShares> _$adminFormDataTosOnPublicSharesValues =
    new BuiltSet<AdminFormData_TosOnPublicShares>(const <AdminFormData_TosOnPublicShares>[
  _$adminFormDataTosOnPublicShares$0,
  _$adminFormDataTosOnPublicShares$1,
]);

const AdminFormData_TosForUsers _$adminFormDataTosForUsers$0 = const AdminFormData_TosForUsers._('\$0');
const AdminFormData_TosForUsers _$adminFormDataTosForUsers$1 = const AdminFormData_TosForUsers._('\$1');

AdminFormData_TosForUsers _$valueOfAdminFormData_TosForUsers(String name) {
  switch (name) {
    case '\$0':
      return _$adminFormDataTosForUsers$0;
    case '\$1':
      return _$adminFormDataTosForUsers$1;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AdminFormData_TosForUsers> _$adminFormDataTosForUsersValues =
    new BuiltSet<AdminFormData_TosForUsers>(const <AdminFormData_TosForUsers>[
  _$adminFormDataTosForUsers$0,
  _$adminFormDataTosForUsers$1,
]);

const PublicCapabilities_TermsOfService_Enabled _$publicCapabilitiesTermsOfServiceEnabled$true =
    const PublicCapabilities_TermsOfService_Enabled._('\$true');

PublicCapabilities_TermsOfService_Enabled _$valueOfPublicCapabilities_TermsOfService_Enabled(String name) {
  switch (name) {
    case '\$true':
      return _$publicCapabilitiesTermsOfServiceEnabled$true;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PublicCapabilities_TermsOfService_Enabled> _$publicCapabilitiesTermsOfServiceEnabledValues =
    new BuiltSet<PublicCapabilities_TermsOfService_Enabled>(const <PublicCapabilities_TermsOfService_Enabled>[
  _$publicCapabilitiesTermsOfServiceEnabled$true,
]);

Serializer<SigningSignTermsRequestApplicationJson> _$signingSignTermsRequestApplicationJsonSerializer =
    new _$SigningSignTermsRequestApplicationJsonSerializer();
Serializer<OCSMeta> _$oCSMetaSerializer = new _$OCSMetaSerializer();
Serializer<SigningSignTermsResponseApplicationJson_Ocs> _$signingSignTermsResponseApplicationJsonOcsSerializer =
    new _$SigningSignTermsResponseApplicationJson_OcsSerializer();
Serializer<SigningSignTermsResponseApplicationJson> _$signingSignTermsResponseApplicationJsonSerializer =
    new _$SigningSignTermsResponseApplicationJsonSerializer();
Serializer<SigningResetAllSignatoriesResponseApplicationJson_Ocs>
    _$signingResetAllSignatoriesResponseApplicationJsonOcsSerializer =
    new _$SigningResetAllSignatoriesResponseApplicationJson_OcsSerializer();
Serializer<SigningResetAllSignatoriesResponseApplicationJson>
    _$signingResetAllSignatoriesResponseApplicationJsonSerializer =
    new _$SigningResetAllSignatoriesResponseApplicationJsonSerializer();
Serializer<SigningSignTermsPublicRequestApplicationJson> _$signingSignTermsPublicRequestApplicationJsonSerializer =
    new _$SigningSignTermsPublicRequestApplicationJsonSerializer();
Serializer<SigningSignTermsPublicResponseApplicationJson_Ocs>
    _$signingSignTermsPublicResponseApplicationJsonOcsSerializer =
    new _$SigningSignTermsPublicResponseApplicationJson_OcsSerializer();
Serializer<SigningSignTermsPublicResponseApplicationJson> _$signingSignTermsPublicResponseApplicationJsonSerializer =
    new _$SigningSignTermsPublicResponseApplicationJsonSerializer();
Serializer<Terms> _$termsSerializer = new _$TermsSerializer();
Serializer<TermsIndexResponseApplicationJson_Ocs_Data> _$termsIndexResponseApplicationJsonOcsDataSerializer =
    new _$TermsIndexResponseApplicationJson_Ocs_DataSerializer();
Serializer<TermsIndexResponseApplicationJson_Ocs> _$termsIndexResponseApplicationJsonOcsSerializer =
    new _$TermsIndexResponseApplicationJson_OcsSerializer();
Serializer<TermsIndexResponseApplicationJson> _$termsIndexResponseApplicationJsonSerializer =
    new _$TermsIndexResponseApplicationJsonSerializer();
Serializer<TermsCreateRequestApplicationJson> _$termsCreateRequestApplicationJsonSerializer =
    new _$TermsCreateRequestApplicationJsonSerializer();
Serializer<TermsCreateResponseApplicationJson_Ocs> _$termsCreateResponseApplicationJsonOcsSerializer =
    new _$TermsCreateResponseApplicationJson_OcsSerializer();
Serializer<TermsCreateResponseApplicationJson> _$termsCreateResponseApplicationJsonSerializer =
    new _$TermsCreateResponseApplicationJsonSerializer();
Serializer<TermsDestroyResponseApplicationJson_Ocs> _$termsDestroyResponseApplicationJsonOcsSerializer =
    new _$TermsDestroyResponseApplicationJson_OcsSerializer();
Serializer<TermsDestroyResponseApplicationJson> _$termsDestroyResponseApplicationJsonSerializer =
    new _$TermsDestroyResponseApplicationJsonSerializer();
Serializer<AdminFormData> _$adminFormDataSerializer = new _$AdminFormDataSerializer();
Serializer<TermsGetAdminFormDataResponseApplicationJson_Ocs>
    _$termsGetAdminFormDataResponseApplicationJsonOcsSerializer =
    new _$TermsGetAdminFormDataResponseApplicationJson_OcsSerializer();
Serializer<TermsGetAdminFormDataResponseApplicationJson> _$termsGetAdminFormDataResponseApplicationJsonSerializer =
    new _$TermsGetAdminFormDataResponseApplicationJsonSerializer();
Serializer<PublicCapabilities_TermsOfService> _$publicCapabilitiesTermsOfServiceSerializer =
    new _$PublicCapabilities_TermsOfServiceSerializer();
Serializer<PublicCapabilities> _$publicCapabilitiesSerializer = new _$PublicCapabilitiesSerializer();

class _$SigningSignTermsRequestApplicationJsonSerializer
    implements StructuredSerializer<SigningSignTermsRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [SigningSignTermsRequestApplicationJson, _$SigningSignTermsRequestApplicationJson];
  @override
  final String wireName = 'SigningSignTermsRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningSignTermsRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'termId',
      serializers.serialize(object.termId, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SigningSignTermsRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningSignTermsRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'termId':
          result.termId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

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
    final result = new OCSMetaBuilder();

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

class _$SigningSignTermsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<SigningSignTermsResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    SigningSignTermsResponseApplicationJson_Ocs,
    _$SigningSignTermsResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'SigningSignTermsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningSignTermsResponseApplicationJson_Ocs object,
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
  SigningSignTermsResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningSignTermsResponseApplicationJson_OcsBuilder();

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

class _$SigningSignTermsResponseApplicationJsonSerializer
    implements StructuredSerializer<SigningSignTermsResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    SigningSignTermsResponseApplicationJson,
    _$SigningSignTermsResponseApplicationJson
  ];
  @override
  final String wireName = 'SigningSignTermsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningSignTermsResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(SigningSignTermsResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  SigningSignTermsResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningSignTermsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SigningSignTermsResponseApplicationJson_Ocs))!
              as SigningSignTermsResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$SigningResetAllSignatoriesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<SigningResetAllSignatoriesResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    SigningResetAllSignatoriesResponseApplicationJson_Ocs,
    _$SigningResetAllSignatoriesResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'SigningResetAllSignatoriesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningResetAllSignatoriesResponseApplicationJson_Ocs object,
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
  SigningResetAllSignatoriesResponseApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder();

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

class _$SigningResetAllSignatoriesResponseApplicationJsonSerializer
    implements StructuredSerializer<SigningResetAllSignatoriesResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    SigningResetAllSignatoriesResponseApplicationJson,
    _$SigningResetAllSignatoriesResponseApplicationJson
  ];
  @override
  final String wireName = 'SigningResetAllSignatoriesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningResetAllSignatoriesResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(SigningResetAllSignatoriesResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  SigningResetAllSignatoriesResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningResetAllSignatoriesResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SigningResetAllSignatoriesResponseApplicationJson_Ocs))!
              as SigningResetAllSignatoriesResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$SigningSignTermsPublicRequestApplicationJsonSerializer
    implements StructuredSerializer<SigningSignTermsPublicRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [
    SigningSignTermsPublicRequestApplicationJson,
    _$SigningSignTermsPublicRequestApplicationJson
  ];
  @override
  final String wireName = 'SigningSignTermsPublicRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningSignTermsPublicRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'termId',
      serializers.serialize(object.termId, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SigningSignTermsPublicRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningSignTermsPublicRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'termId':
          result.termId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SigningSignTermsPublicResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<SigningSignTermsPublicResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    SigningSignTermsPublicResponseApplicationJson_Ocs,
    _$SigningSignTermsPublicResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'SigningSignTermsPublicResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningSignTermsPublicResponseApplicationJson_Ocs object,
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
  SigningSignTermsPublicResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningSignTermsPublicResponseApplicationJson_OcsBuilder();

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

class _$SigningSignTermsPublicResponseApplicationJsonSerializer
    implements StructuredSerializer<SigningSignTermsPublicResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    SigningSignTermsPublicResponseApplicationJson,
    _$SigningSignTermsPublicResponseApplicationJson
  ];
  @override
  final String wireName = 'SigningSignTermsPublicResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, SigningSignTermsPublicResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(SigningSignTermsPublicResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  SigningSignTermsPublicResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SigningSignTermsPublicResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SigningSignTermsPublicResponseApplicationJson_Ocs))!
              as SigningSignTermsPublicResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$TermsSerializer implements StructuredSerializer<Terms> {
  @override
  final Iterable<Type> types = const [Terms, _$Terms];
  @override
  final String wireName = 'Terms';

  @override
  Iterable<Object?> serialize(Serializers serializers, Terms object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'countryCode',
      serializers.serialize(object.countryCode, specifiedType: const FullType(String)),
      'languageCode',
      serializers.serialize(object.languageCode, specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'renderedBody',
      serializers.serialize(object.renderedBody, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Terms deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'countryCode':
          result.countryCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'languageCode':
          result.languageCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'renderedBody':
          result.renderedBody = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TermsIndexResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TermsIndexResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    TermsIndexResponseApplicationJson_Ocs_Data,
    _$TermsIndexResponseApplicationJson_Ocs_Data
  ];
  @override
  final String wireName = 'TermsIndexResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsIndexResponseApplicationJson_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'terms',
      serializers.serialize(object.terms, specifiedType: const FullType(BuiltList, const [const FullType(Terms)])),
      'languages',
      serializers.serialize(object.languages,
          specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(String)])),
      'hasSigned',
      serializers.serialize(object.hasSigned, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TermsIndexResponseApplicationJson_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsIndexResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'terms':
          result.terms.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [const FullType(Terms)]))! as BuiltList<Object?>);
          break;
        case 'languages':
          result.languages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(String)]))!);
          break;
        case 'hasSigned':
          result.hasSigned = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TermsIndexResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TermsIndexResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [TermsIndexResponseApplicationJson_Ocs, _$TermsIndexResponseApplicationJson_Ocs];
  @override
  final String wireName = 'TermsIndexResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsIndexResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(TermsIndexResponseApplicationJson_Ocs_Data)),
    ];

    return result;
  }

  @override
  TermsIndexResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsIndexResponseApplicationJson_OcsBuilder();

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
              serializers.deserialize(value, specifiedType: const FullType(TermsIndexResponseApplicationJson_Ocs_Data))!
                  as TermsIndexResponseApplicationJson_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$TermsIndexResponseApplicationJsonSerializer implements StructuredSerializer<TermsIndexResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [TermsIndexResponseApplicationJson, _$TermsIndexResponseApplicationJson];
  @override
  final String wireName = 'TermsIndexResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsIndexResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(TermsIndexResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  TermsIndexResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsIndexResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(TermsIndexResponseApplicationJson_Ocs))!
                  as TermsIndexResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$TermsCreateRequestApplicationJsonSerializer implements StructuredSerializer<TermsCreateRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [TermsCreateRequestApplicationJson, _$TermsCreateRequestApplicationJson];
  @override
  final String wireName = 'TermsCreateRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsCreateRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'countryCode',
      serializers.serialize(object.countryCode, specifiedType: const FullType(String)),
      'languageCode',
      serializers.serialize(object.languageCode, specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TermsCreateRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsCreateRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'countryCode':
          result.countryCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'languageCode':
          result.languageCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TermsCreateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TermsCreateResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [TermsCreateResponseApplicationJson_Ocs, _$TermsCreateResponseApplicationJson_Ocs];
  @override
  final String wireName = 'TermsCreateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsCreateResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Terms)),
    ];

    return result;
  }

  @override
  TermsCreateResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsCreateResponseApplicationJson_OcsBuilder();

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
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(Terms))! as Terms);
          break;
      }
    }

    return result.build();
  }
}

class _$TermsCreateResponseApplicationJsonSerializer
    implements StructuredSerializer<TermsCreateResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [TermsCreateResponseApplicationJson, _$TermsCreateResponseApplicationJson];
  @override
  final String wireName = 'TermsCreateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsCreateResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(TermsCreateResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  TermsCreateResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsCreateResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(TermsCreateResponseApplicationJson_Ocs))!
                  as TermsCreateResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$TermsDestroyResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TermsDestroyResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    TermsDestroyResponseApplicationJson_Ocs,
    _$TermsDestroyResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'TermsDestroyResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsDestroyResponseApplicationJson_Ocs object,
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
  TermsDestroyResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsDestroyResponseApplicationJson_OcsBuilder();

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

class _$TermsDestroyResponseApplicationJsonSerializer
    implements StructuredSerializer<TermsDestroyResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [TermsDestroyResponseApplicationJson, _$TermsDestroyResponseApplicationJson];
  @override
  final String wireName = 'TermsDestroyResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsDestroyResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(TermsDestroyResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  TermsDestroyResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsDestroyResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(TermsDestroyResponseApplicationJson_Ocs))!
                  as TermsDestroyResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$AdminFormDataSerializer implements StructuredSerializer<AdminFormData> {
  @override
  final Iterable<Type> types = const [AdminFormData, _$AdminFormData];
  @override
  final String wireName = 'AdminFormData';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdminFormData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'terms',
      serializers.serialize(object.terms,
          specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(Terms)])),
      'countries',
      serializers.serialize(object.countries,
          specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(String)])),
      'languages',
      serializers.serialize(object.languages,
          specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(String)])),
      'tos_on_public_shares',
      serializers.serialize(object.tosOnPublicShares, specifiedType: const FullType(AdminFormData_TosOnPublicShares)),
      'tos_for_users',
      serializers.serialize(object.tosForUsers, specifiedType: const FullType(AdminFormData_TosForUsers)),
    ];

    return result;
  }

  @override
  AdminFormData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdminFormDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'terms':
          result.terms.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(Terms)]))!);
          break;
        case 'countries':
          result.countries.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(String)]))!);
          break;
        case 'languages':
          result.languages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [const FullType(String), const FullType(String)]))!);
          break;
        case 'tos_on_public_shares':
          result.tosOnPublicShares = serializers.deserialize(value,
              specifiedType: const FullType(AdminFormData_TosOnPublicShares))! as AdminFormData_TosOnPublicShares;
          break;
        case 'tos_for_users':
          result.tosForUsers = serializers.deserialize(value, specifiedType: const FullType(AdminFormData_TosForUsers))!
              as AdminFormData_TosForUsers;
          break;
      }
    }

    return result.build();
  }
}

class _$TermsGetAdminFormDataResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TermsGetAdminFormDataResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    TermsGetAdminFormDataResponseApplicationJson_Ocs,
    _$TermsGetAdminFormDataResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'TermsGetAdminFormDataResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsGetAdminFormDataResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(AdminFormData)),
    ];

    return result;
  }

  @override
  TermsGetAdminFormDataResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsGetAdminFormDataResponseApplicationJson_OcsBuilder();

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
          result.data
              .replace(serializers.deserialize(value, specifiedType: const FullType(AdminFormData))! as AdminFormData);
          break;
      }
    }

    return result.build();
  }
}

class _$TermsGetAdminFormDataResponseApplicationJsonSerializer
    implements StructuredSerializer<TermsGetAdminFormDataResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    TermsGetAdminFormDataResponseApplicationJson,
    _$TermsGetAdminFormDataResponseApplicationJson
  ];
  @override
  final String wireName = 'TermsGetAdminFormDataResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermsGetAdminFormDataResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(TermsGetAdminFormDataResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  TermsGetAdminFormDataResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermsGetAdminFormDataResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TermsGetAdminFormDataResponseApplicationJson_Ocs))!
              as TermsGetAdminFormDataResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$PublicCapabilities_TermsOfServiceSerializer implements StructuredSerializer<PublicCapabilities_TermsOfService> {
  @override
  final Iterable<Type> types = const [PublicCapabilities_TermsOfService, _$PublicCapabilities_TermsOfService];
  @override
  final String wireName = 'PublicCapabilities_TermsOfService';

  @override
  Iterable<Object?> serialize(Serializers serializers, PublicCapabilities_TermsOfService object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(PublicCapabilities_TermsOfService_Enabled)),
      'term_uuid',
      serializers.serialize(object.termUuid, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PublicCapabilities_TermsOfService deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublicCapabilities_TermsOfServiceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled =
              serializers.deserialize(value, specifiedType: const FullType(PublicCapabilities_TermsOfService_Enabled))!
                  as PublicCapabilities_TermsOfService_Enabled;
          break;
        case 'term_uuid':
          result.termUuid = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PublicCapabilitiesSerializer implements StructuredSerializer<PublicCapabilities> {
  @override
  final Iterable<Type> types = const [PublicCapabilities, _$PublicCapabilities];
  @override
  final String wireName = 'PublicCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, PublicCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'terms_of_service',
      serializers.serialize(object.termsOfService, specifiedType: const FullType(PublicCapabilities_TermsOfService)),
    ];

    return result;
  }

  @override
  PublicCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublicCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'terms_of_service':
          result.termsOfService.replace(serializers.deserialize(value,
              specifiedType: const FullType(PublicCapabilities_TermsOfService))! as PublicCapabilities_TermsOfService);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class $SigningSignTermsRequestApplicationJsonInterfaceBuilder {
  void replace($SigningSignTermsRequestApplicationJsonInterface other);
  void update(void Function($SigningSignTermsRequestApplicationJsonInterfaceBuilder) updates);
  int? get termId;
  set termId(int? termId);
}

class _$SigningSignTermsRequestApplicationJson extends SigningSignTermsRequestApplicationJson {
  @override
  final int termId;

  factory _$SigningSignTermsRequestApplicationJson(
          [void Function(SigningSignTermsRequestApplicationJsonBuilder)? updates]) =>
      (new SigningSignTermsRequestApplicationJsonBuilder()..update(updates))._build();

  _$SigningSignTermsRequestApplicationJson._({required this.termId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(termId, r'SigningSignTermsRequestApplicationJson', 'termId');
  }

  @override
  SigningSignTermsRequestApplicationJson rebuild(
          void Function(SigningSignTermsRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningSignTermsRequestApplicationJsonBuilder toBuilder() =>
      new SigningSignTermsRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningSignTermsRequestApplicationJson && termId == other.termId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, termId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SigningSignTermsRequestApplicationJson')..add('termId', termId)).toString();
  }
}

class SigningSignTermsRequestApplicationJsonBuilder
    implements
        Builder<SigningSignTermsRequestApplicationJson, SigningSignTermsRequestApplicationJsonBuilder>,
        $SigningSignTermsRequestApplicationJsonInterfaceBuilder {
  _$SigningSignTermsRequestApplicationJson? _$v;

  int? _termId;
  int? get termId => _$this._termId;
  set termId(covariant int? termId) => _$this._termId = termId;

  SigningSignTermsRequestApplicationJsonBuilder() {
    SigningSignTermsRequestApplicationJson._defaults(this);
  }

  SigningSignTermsRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _termId = $v.termId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningSignTermsRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningSignTermsRequestApplicationJson;
  }

  @override
  void update(void Function(SigningSignTermsRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningSignTermsRequestApplicationJson build() => _build();

  _$SigningSignTermsRequestApplicationJson _build() {
    SigningSignTermsRequestApplicationJson._validate(this);
    final _$result = _$v ??
        new _$SigningSignTermsRequestApplicationJson._(
          termId: BuiltValueNullFieldError.checkNotNull(termId, r'SigningSignTermsRequestApplicationJson', 'termId'),
        );
    replace(_$result);
    return _$result;
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

  factory _$OCSMeta([void Function(OCSMetaBuilder)? updates]) => (new OCSMetaBuilder()..update(updates))._build();

  _$OCSMeta._({required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode');
  }

  @override
  OCSMeta rebuild(void Function(OCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  OCSMetaBuilder toBuilder() => new OCSMetaBuilder()..replace(this);

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
        new _$OCSMeta._(
          status: BuiltValueNullFieldError.checkNotNull(status, r'OCSMeta', 'status'),
          statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'OCSMeta', 'statuscode'),
          message: message,
          totalitems: totalitems,
          itemsperpage: itemsperpage,
        );
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $SigningSignTermsResponseApplicationJson_OcsInterfaceBuilder {
  void replace($SigningSignTermsResponseApplicationJson_OcsInterface other);
  void update(void Function($SigningSignTermsResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$SigningSignTermsResponseApplicationJson_Ocs extends SigningSignTermsResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$SigningSignTermsResponseApplicationJson_Ocs(
          [void Function(SigningSignTermsResponseApplicationJson_OcsBuilder)? updates]) =>
      (new SigningSignTermsResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$SigningSignTermsResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'SigningSignTermsResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'SigningSignTermsResponseApplicationJson_Ocs', 'data');
  }

  @override
  SigningSignTermsResponseApplicationJson_Ocs rebuild(
          void Function(SigningSignTermsResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningSignTermsResponseApplicationJson_OcsBuilder toBuilder() =>
      new SigningSignTermsResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningSignTermsResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'SigningSignTermsResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class SigningSignTermsResponseApplicationJson_OcsBuilder
    implements
        Builder<SigningSignTermsResponseApplicationJson_Ocs, SigningSignTermsResponseApplicationJson_OcsBuilder>,
        $SigningSignTermsResponseApplicationJson_OcsInterfaceBuilder {
  _$SigningSignTermsResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= new OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  SigningSignTermsResponseApplicationJson_OcsBuilder() {
    SigningSignTermsResponseApplicationJson_Ocs._defaults(this);
  }

  SigningSignTermsResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningSignTermsResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningSignTermsResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(SigningSignTermsResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningSignTermsResponseApplicationJson_Ocs build() => _build();

  _$SigningSignTermsResponseApplicationJson_Ocs _build() {
    SigningSignTermsResponseApplicationJson_Ocs._validate(this);
    _$SigningSignTermsResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          new _$SigningSignTermsResponseApplicationJson_Ocs._(
            meta: meta.build(),
            data: BuiltValueNullFieldError.checkNotNull(data, r'SigningSignTermsResponseApplicationJson_Ocs', 'data'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SigningSignTermsResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $SigningSignTermsResponseApplicationJsonInterfaceBuilder {
  void replace($SigningSignTermsResponseApplicationJsonInterface other);
  void update(void Function($SigningSignTermsResponseApplicationJsonInterfaceBuilder) updates);
  SigningSignTermsResponseApplicationJson_OcsBuilder get ocs;
  set ocs(SigningSignTermsResponseApplicationJson_OcsBuilder? ocs);
}

class _$SigningSignTermsResponseApplicationJson extends SigningSignTermsResponseApplicationJson {
  @override
  final SigningSignTermsResponseApplicationJson_Ocs ocs;

  factory _$SigningSignTermsResponseApplicationJson(
          [void Function(SigningSignTermsResponseApplicationJsonBuilder)? updates]) =>
      (new SigningSignTermsResponseApplicationJsonBuilder()..update(updates))._build();

  _$SigningSignTermsResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'SigningSignTermsResponseApplicationJson', 'ocs');
  }

  @override
  SigningSignTermsResponseApplicationJson rebuild(
          void Function(SigningSignTermsResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningSignTermsResponseApplicationJsonBuilder toBuilder() =>
      new SigningSignTermsResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningSignTermsResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'SigningSignTermsResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class SigningSignTermsResponseApplicationJsonBuilder
    implements
        Builder<SigningSignTermsResponseApplicationJson, SigningSignTermsResponseApplicationJsonBuilder>,
        $SigningSignTermsResponseApplicationJsonInterfaceBuilder {
  _$SigningSignTermsResponseApplicationJson? _$v;

  SigningSignTermsResponseApplicationJson_OcsBuilder? _ocs;
  SigningSignTermsResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= new SigningSignTermsResponseApplicationJson_OcsBuilder();
  set ocs(covariant SigningSignTermsResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  SigningSignTermsResponseApplicationJsonBuilder() {
    SigningSignTermsResponseApplicationJson._defaults(this);
  }

  SigningSignTermsResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningSignTermsResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningSignTermsResponseApplicationJson;
  }

  @override
  void update(void Function(SigningSignTermsResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningSignTermsResponseApplicationJson build() => _build();

  _$SigningSignTermsResponseApplicationJson _build() {
    SigningSignTermsResponseApplicationJson._validate(this);
    _$SigningSignTermsResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          new _$SigningSignTermsResponseApplicationJson._(
            ocs: ocs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'SigningSignTermsResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $SigningResetAllSignatoriesResponseApplicationJson_OcsInterfaceBuilder {
  void replace($SigningResetAllSignatoriesResponseApplicationJson_OcsInterface other);
  void update(void Function($SigningResetAllSignatoriesResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$SigningResetAllSignatoriesResponseApplicationJson_Ocs
    extends SigningResetAllSignatoriesResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$SigningResetAllSignatoriesResponseApplicationJson_Ocs(
          [void Function(SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder)? updates]) =>
      (new SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$SigningResetAllSignatoriesResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'SigningResetAllSignatoriesResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'SigningResetAllSignatoriesResponseApplicationJson_Ocs', 'data');
  }

  @override
  SigningResetAllSignatoriesResponseApplicationJson_Ocs rebuild(
          void Function(SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder toBuilder() =>
      new SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningResetAllSignatoriesResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'SigningResetAllSignatoriesResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder
    implements
        Builder<SigningResetAllSignatoriesResponseApplicationJson_Ocs,
            SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder>,
        $SigningResetAllSignatoriesResponseApplicationJson_OcsInterfaceBuilder {
  _$SigningResetAllSignatoriesResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= new OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder() {
    SigningResetAllSignatoriesResponseApplicationJson_Ocs._defaults(this);
  }

  SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningResetAllSignatoriesResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningResetAllSignatoriesResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningResetAllSignatoriesResponseApplicationJson_Ocs build() => _build();

  _$SigningResetAllSignatoriesResponseApplicationJson_Ocs _build() {
    SigningResetAllSignatoriesResponseApplicationJson_Ocs._validate(this);
    _$SigningResetAllSignatoriesResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          new _$SigningResetAllSignatoriesResponseApplicationJson_Ocs._(
            meta: meta.build(),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'SigningResetAllSignatoriesResponseApplicationJson_Ocs', 'data'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SigningResetAllSignatoriesResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $SigningResetAllSignatoriesResponseApplicationJsonInterfaceBuilder {
  void replace($SigningResetAllSignatoriesResponseApplicationJsonInterface other);
  void update(void Function($SigningResetAllSignatoriesResponseApplicationJsonInterfaceBuilder) updates);
  SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder get ocs;
  set ocs(SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder? ocs);
}

class _$SigningResetAllSignatoriesResponseApplicationJson extends SigningResetAllSignatoriesResponseApplicationJson {
  @override
  final SigningResetAllSignatoriesResponseApplicationJson_Ocs ocs;

  factory _$SigningResetAllSignatoriesResponseApplicationJson(
          [void Function(SigningResetAllSignatoriesResponseApplicationJsonBuilder)? updates]) =>
      (new SigningResetAllSignatoriesResponseApplicationJsonBuilder()..update(updates))._build();

  _$SigningResetAllSignatoriesResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'SigningResetAllSignatoriesResponseApplicationJson', 'ocs');
  }

  @override
  SigningResetAllSignatoriesResponseApplicationJson rebuild(
          void Function(SigningResetAllSignatoriesResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningResetAllSignatoriesResponseApplicationJsonBuilder toBuilder() =>
      new SigningResetAllSignatoriesResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningResetAllSignatoriesResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'SigningResetAllSignatoriesResponseApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class SigningResetAllSignatoriesResponseApplicationJsonBuilder
    implements
        Builder<SigningResetAllSignatoriesResponseApplicationJson,
            SigningResetAllSignatoriesResponseApplicationJsonBuilder>,
        $SigningResetAllSignatoriesResponseApplicationJsonInterfaceBuilder {
  _$SigningResetAllSignatoriesResponseApplicationJson? _$v;

  SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder? _ocs;
  SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= new SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder();
  set ocs(covariant SigningResetAllSignatoriesResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  SigningResetAllSignatoriesResponseApplicationJsonBuilder() {
    SigningResetAllSignatoriesResponseApplicationJson._defaults(this);
  }

  SigningResetAllSignatoriesResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningResetAllSignatoriesResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningResetAllSignatoriesResponseApplicationJson;
  }

  @override
  void update(void Function(SigningResetAllSignatoriesResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningResetAllSignatoriesResponseApplicationJson build() => _build();

  _$SigningResetAllSignatoriesResponseApplicationJson _build() {
    SigningResetAllSignatoriesResponseApplicationJson._validate(this);
    _$SigningResetAllSignatoriesResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          new _$SigningResetAllSignatoriesResponseApplicationJson._(
            ocs: ocs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SigningResetAllSignatoriesResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $SigningSignTermsPublicRequestApplicationJsonInterfaceBuilder {
  void replace($SigningSignTermsPublicRequestApplicationJsonInterface other);
  void update(void Function($SigningSignTermsPublicRequestApplicationJsonInterfaceBuilder) updates);
  int? get termId;
  set termId(int? termId);
}

class _$SigningSignTermsPublicRequestApplicationJson extends SigningSignTermsPublicRequestApplicationJson {
  @override
  final int termId;

  factory _$SigningSignTermsPublicRequestApplicationJson(
          [void Function(SigningSignTermsPublicRequestApplicationJsonBuilder)? updates]) =>
      (new SigningSignTermsPublicRequestApplicationJsonBuilder()..update(updates))._build();

  _$SigningSignTermsPublicRequestApplicationJson._({required this.termId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(termId, r'SigningSignTermsPublicRequestApplicationJson', 'termId');
  }

  @override
  SigningSignTermsPublicRequestApplicationJson rebuild(
          void Function(SigningSignTermsPublicRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningSignTermsPublicRequestApplicationJsonBuilder toBuilder() =>
      new SigningSignTermsPublicRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningSignTermsPublicRequestApplicationJson && termId == other.termId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, termId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SigningSignTermsPublicRequestApplicationJson')..add('termId', termId))
        .toString();
  }
}

class SigningSignTermsPublicRequestApplicationJsonBuilder
    implements
        Builder<SigningSignTermsPublicRequestApplicationJson, SigningSignTermsPublicRequestApplicationJsonBuilder>,
        $SigningSignTermsPublicRequestApplicationJsonInterfaceBuilder {
  _$SigningSignTermsPublicRequestApplicationJson? _$v;

  int? _termId;
  int? get termId => _$this._termId;
  set termId(covariant int? termId) => _$this._termId = termId;

  SigningSignTermsPublicRequestApplicationJsonBuilder() {
    SigningSignTermsPublicRequestApplicationJson._defaults(this);
  }

  SigningSignTermsPublicRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _termId = $v.termId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningSignTermsPublicRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningSignTermsPublicRequestApplicationJson;
  }

  @override
  void update(void Function(SigningSignTermsPublicRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningSignTermsPublicRequestApplicationJson build() => _build();

  _$SigningSignTermsPublicRequestApplicationJson _build() {
    SigningSignTermsPublicRequestApplicationJson._validate(this);
    final _$result = _$v ??
        new _$SigningSignTermsPublicRequestApplicationJson._(
          termId:
              BuiltValueNullFieldError.checkNotNull(termId, r'SigningSignTermsPublicRequestApplicationJson', 'termId'),
        );
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $SigningSignTermsPublicResponseApplicationJson_OcsInterfaceBuilder {
  void replace($SigningSignTermsPublicResponseApplicationJson_OcsInterface other);
  void update(void Function($SigningSignTermsPublicResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$SigningSignTermsPublicResponseApplicationJson_Ocs extends SigningSignTermsPublicResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$SigningSignTermsPublicResponseApplicationJson_Ocs(
          [void Function(SigningSignTermsPublicResponseApplicationJson_OcsBuilder)? updates]) =>
      (new SigningSignTermsPublicResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$SigningSignTermsPublicResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'SigningSignTermsPublicResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'SigningSignTermsPublicResponseApplicationJson_Ocs', 'data');
  }

  @override
  SigningSignTermsPublicResponseApplicationJson_Ocs rebuild(
          void Function(SigningSignTermsPublicResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningSignTermsPublicResponseApplicationJson_OcsBuilder toBuilder() =>
      new SigningSignTermsPublicResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningSignTermsPublicResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'SigningSignTermsPublicResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class SigningSignTermsPublicResponseApplicationJson_OcsBuilder
    implements
        Builder<SigningSignTermsPublicResponseApplicationJson_Ocs,
            SigningSignTermsPublicResponseApplicationJson_OcsBuilder>,
        $SigningSignTermsPublicResponseApplicationJson_OcsInterfaceBuilder {
  _$SigningSignTermsPublicResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= new OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  SigningSignTermsPublicResponseApplicationJson_OcsBuilder() {
    SigningSignTermsPublicResponseApplicationJson_Ocs._defaults(this);
  }

  SigningSignTermsPublicResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningSignTermsPublicResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningSignTermsPublicResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(SigningSignTermsPublicResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningSignTermsPublicResponseApplicationJson_Ocs build() => _build();

  _$SigningSignTermsPublicResponseApplicationJson_Ocs _build() {
    SigningSignTermsPublicResponseApplicationJson_Ocs._validate(this);
    _$SigningSignTermsPublicResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          new _$SigningSignTermsPublicResponseApplicationJson_Ocs._(
            meta: meta.build(),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'SigningSignTermsPublicResponseApplicationJson_Ocs', 'data'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SigningSignTermsPublicResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $SigningSignTermsPublicResponseApplicationJsonInterfaceBuilder {
  void replace($SigningSignTermsPublicResponseApplicationJsonInterface other);
  void update(void Function($SigningSignTermsPublicResponseApplicationJsonInterfaceBuilder) updates);
  SigningSignTermsPublicResponseApplicationJson_OcsBuilder get ocs;
  set ocs(SigningSignTermsPublicResponseApplicationJson_OcsBuilder? ocs);
}

class _$SigningSignTermsPublicResponseApplicationJson extends SigningSignTermsPublicResponseApplicationJson {
  @override
  final SigningSignTermsPublicResponseApplicationJson_Ocs ocs;

  factory _$SigningSignTermsPublicResponseApplicationJson(
          [void Function(SigningSignTermsPublicResponseApplicationJsonBuilder)? updates]) =>
      (new SigningSignTermsPublicResponseApplicationJsonBuilder()..update(updates))._build();

  _$SigningSignTermsPublicResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'SigningSignTermsPublicResponseApplicationJson', 'ocs');
  }

  @override
  SigningSignTermsPublicResponseApplicationJson rebuild(
          void Function(SigningSignTermsPublicResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SigningSignTermsPublicResponseApplicationJsonBuilder toBuilder() =>
      new SigningSignTermsPublicResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SigningSignTermsPublicResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'SigningSignTermsPublicResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class SigningSignTermsPublicResponseApplicationJsonBuilder
    implements
        Builder<SigningSignTermsPublicResponseApplicationJson, SigningSignTermsPublicResponseApplicationJsonBuilder>,
        $SigningSignTermsPublicResponseApplicationJsonInterfaceBuilder {
  _$SigningSignTermsPublicResponseApplicationJson? _$v;

  SigningSignTermsPublicResponseApplicationJson_OcsBuilder? _ocs;
  SigningSignTermsPublicResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= new SigningSignTermsPublicResponseApplicationJson_OcsBuilder();
  set ocs(covariant SigningSignTermsPublicResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  SigningSignTermsPublicResponseApplicationJsonBuilder() {
    SigningSignTermsPublicResponseApplicationJson._defaults(this);
  }

  SigningSignTermsPublicResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SigningSignTermsPublicResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SigningSignTermsPublicResponseApplicationJson;
  }

  @override
  void update(void Function(SigningSignTermsPublicResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SigningSignTermsPublicResponseApplicationJson build() => _build();

  _$SigningSignTermsPublicResponseApplicationJson _build() {
    SigningSignTermsPublicResponseApplicationJson._validate(this);
    _$SigningSignTermsPublicResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          new _$SigningSignTermsPublicResponseApplicationJson._(
            ocs: ocs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SigningSignTermsPublicResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsInterfaceBuilder {
  void replace($TermsInterface other);
  void update(void Function($TermsInterfaceBuilder) updates);
  int? get id;
  set id(int? id);

  String? get countryCode;
  set countryCode(String? countryCode);

  String? get languageCode;
  set languageCode(String? languageCode);

  String? get body;
  set body(String? body);

  String? get renderedBody;
  set renderedBody(String? renderedBody);
}

class _$Terms extends Terms {
  @override
  final int id;
  @override
  final String countryCode;
  @override
  final String languageCode;
  @override
  final String body;
  @override
  final String renderedBody;

  factory _$Terms([void Function(TermsBuilder)? updates]) => (new TermsBuilder()..update(updates))._build();

  _$Terms._(
      {required this.id,
      required this.countryCode,
      required this.languageCode,
      required this.body,
      required this.renderedBody})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Terms', 'id');
    BuiltValueNullFieldError.checkNotNull(countryCode, r'Terms', 'countryCode');
    BuiltValueNullFieldError.checkNotNull(languageCode, r'Terms', 'languageCode');
    BuiltValueNullFieldError.checkNotNull(body, r'Terms', 'body');
    BuiltValueNullFieldError.checkNotNull(renderedBody, r'Terms', 'renderedBody');
  }

  @override
  Terms rebuild(void Function(TermsBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  TermsBuilder toBuilder() => new TermsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Terms &&
        id == other.id &&
        countryCode == other.countryCode &&
        languageCode == other.languageCode &&
        body == other.body &&
        renderedBody == other.renderedBody;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, languageCode.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, renderedBody.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Terms')
          ..add('id', id)
          ..add('countryCode', countryCode)
          ..add('languageCode', languageCode)
          ..add('body', body)
          ..add('renderedBody', renderedBody))
        .toString();
  }
}

class TermsBuilder implements Builder<Terms, TermsBuilder>, $TermsInterfaceBuilder {
  _$Terms? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(covariant String? countryCode) => _$this._countryCode = countryCode;

  String? _languageCode;
  String? get languageCode => _$this._languageCode;
  set languageCode(covariant String? languageCode) => _$this._languageCode = languageCode;

  String? _body;
  String? get body => _$this._body;
  set body(covariant String? body) => _$this._body = body;

  String? _renderedBody;
  String? get renderedBody => _$this._renderedBody;
  set renderedBody(covariant String? renderedBody) => _$this._renderedBody = renderedBody;

  TermsBuilder() {
    Terms._defaults(this);
  }

  TermsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _countryCode = $v.countryCode;
      _languageCode = $v.languageCode;
      _body = $v.body;
      _renderedBody = $v.renderedBody;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Terms other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Terms;
  }

  @override
  void update(void Function(TermsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Terms build() => _build();

  _$Terms _build() {
    Terms._validate(this);
    final _$result = _$v ??
        new _$Terms._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'Terms', 'id'),
          countryCode: BuiltValueNullFieldError.checkNotNull(countryCode, r'Terms', 'countryCode'),
          languageCode: BuiltValueNullFieldError.checkNotNull(languageCode, r'Terms', 'languageCode'),
          body: BuiltValueNullFieldError.checkNotNull(body, r'Terms', 'body'),
          renderedBody: BuiltValueNullFieldError.checkNotNull(renderedBody, r'Terms', 'renderedBody'),
        );
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsIndexResponseApplicationJson_Ocs_DataInterfaceBuilder {
  void replace($TermsIndexResponseApplicationJson_Ocs_DataInterface other);
  void update(void Function($TermsIndexResponseApplicationJson_Ocs_DataInterfaceBuilder) updates);
  ListBuilder<Terms> get terms;
  set terms(ListBuilder<Terms>? terms);

  MapBuilder<String, String> get languages;
  set languages(MapBuilder<String, String>? languages);

  bool? get hasSigned;
  set hasSigned(bool? hasSigned);
}

class _$TermsIndexResponseApplicationJson_Ocs_Data extends TermsIndexResponseApplicationJson_Ocs_Data {
  @override
  final BuiltList<Terms> terms;
  @override
  final BuiltMap<String, String> languages;
  @override
  final bool hasSigned;

  factory _$TermsIndexResponseApplicationJson_Ocs_Data(
          [void Function(TermsIndexResponseApplicationJson_Ocs_DataBuilder)? updates]) =>
      (new TermsIndexResponseApplicationJson_Ocs_DataBuilder()..update(updates))._build();

  _$TermsIndexResponseApplicationJson_Ocs_Data._(
      {required this.terms, required this.languages, required this.hasSigned})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(terms, r'TermsIndexResponseApplicationJson_Ocs_Data', 'terms');
    BuiltValueNullFieldError.checkNotNull(languages, r'TermsIndexResponseApplicationJson_Ocs_Data', 'languages');
    BuiltValueNullFieldError.checkNotNull(hasSigned, r'TermsIndexResponseApplicationJson_Ocs_Data', 'hasSigned');
  }

  @override
  TermsIndexResponseApplicationJson_Ocs_Data rebuild(
          void Function(TermsIndexResponseApplicationJson_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsIndexResponseApplicationJson_Ocs_DataBuilder toBuilder() =>
      new TermsIndexResponseApplicationJson_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsIndexResponseApplicationJson_Ocs_Data &&
        terms == other.terms &&
        languages == other.languages &&
        hasSigned == other.hasSigned;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, terms.hashCode);
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, hasSigned.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TermsIndexResponseApplicationJson_Ocs_Data')
          ..add('terms', terms)
          ..add('languages', languages)
          ..add('hasSigned', hasSigned))
        .toString();
  }
}

class TermsIndexResponseApplicationJson_Ocs_DataBuilder
    implements
        Builder<TermsIndexResponseApplicationJson_Ocs_Data, TermsIndexResponseApplicationJson_Ocs_DataBuilder>,
        $TermsIndexResponseApplicationJson_Ocs_DataInterfaceBuilder {
  _$TermsIndexResponseApplicationJson_Ocs_Data? _$v;

  ListBuilder<Terms>? _terms;
  ListBuilder<Terms> get terms => _$this._terms ??= new ListBuilder<Terms>();
  set terms(covariant ListBuilder<Terms>? terms) => _$this._terms = terms;

  MapBuilder<String, String>? _languages;
  MapBuilder<String, String> get languages => _$this._languages ??= new MapBuilder<String, String>();
  set languages(covariant MapBuilder<String, String>? languages) => _$this._languages = languages;

  bool? _hasSigned;
  bool? get hasSigned => _$this._hasSigned;
  set hasSigned(covariant bool? hasSigned) => _$this._hasSigned = hasSigned;

  TermsIndexResponseApplicationJson_Ocs_DataBuilder() {
    TermsIndexResponseApplicationJson_Ocs_Data._defaults(this);
  }

  TermsIndexResponseApplicationJson_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _terms = $v.terms.toBuilder();
      _languages = $v.languages.toBuilder();
      _hasSigned = $v.hasSigned;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsIndexResponseApplicationJson_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsIndexResponseApplicationJson_Ocs_Data;
  }

  @override
  void update(void Function(TermsIndexResponseApplicationJson_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsIndexResponseApplicationJson_Ocs_Data build() => _build();

  _$TermsIndexResponseApplicationJson_Ocs_Data _build() {
    TermsIndexResponseApplicationJson_Ocs_Data._validate(this);
    _$TermsIndexResponseApplicationJson_Ocs_Data _$result;
    try {
      _$result = _$v ??
          new _$TermsIndexResponseApplicationJson_Ocs_Data._(
            terms: terms.build(),
            languages: languages.build(),
            hasSigned: BuiltValueNullFieldError.checkNotNull(
                hasSigned, r'TermsIndexResponseApplicationJson_Ocs_Data', 'hasSigned'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'terms';
        terms.build();
        _$failedField = 'languages';
        languages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TermsIndexResponseApplicationJson_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsIndexResponseApplicationJson_OcsInterfaceBuilder {
  void replace($TermsIndexResponseApplicationJson_OcsInterface other);
  void update(void Function($TermsIndexResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TermsIndexResponseApplicationJson_Ocs_DataBuilder get data;
  set data(TermsIndexResponseApplicationJson_Ocs_DataBuilder? data);
}

class _$TermsIndexResponseApplicationJson_Ocs extends TermsIndexResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final TermsIndexResponseApplicationJson_Ocs_Data data;

  factory _$TermsIndexResponseApplicationJson_Ocs(
          [void Function(TermsIndexResponseApplicationJson_OcsBuilder)? updates]) =>
      (new TermsIndexResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TermsIndexResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TermsIndexResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TermsIndexResponseApplicationJson_Ocs', 'data');
  }

  @override
  TermsIndexResponseApplicationJson_Ocs rebuild(void Function(TermsIndexResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsIndexResponseApplicationJson_OcsBuilder toBuilder() =>
      new TermsIndexResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsIndexResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TermsIndexResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TermsIndexResponseApplicationJson_OcsBuilder
    implements
        Builder<TermsIndexResponseApplicationJson_Ocs, TermsIndexResponseApplicationJson_OcsBuilder>,
        $TermsIndexResponseApplicationJson_OcsInterfaceBuilder {
  _$TermsIndexResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= new OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TermsIndexResponseApplicationJson_Ocs_DataBuilder? _data;
  TermsIndexResponseApplicationJson_Ocs_DataBuilder get data =>
      _$this._data ??= new TermsIndexResponseApplicationJson_Ocs_DataBuilder();
  set data(covariant TermsIndexResponseApplicationJson_Ocs_DataBuilder? data) => _$this._data = data;

  TermsIndexResponseApplicationJson_OcsBuilder() {
    TermsIndexResponseApplicationJson_Ocs._defaults(this);
  }

  TermsIndexResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsIndexResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsIndexResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TermsIndexResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsIndexResponseApplicationJson_Ocs build() => _build();

  _$TermsIndexResponseApplicationJson_Ocs _build() {
    TermsIndexResponseApplicationJson_Ocs._validate(this);
    _$TermsIndexResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          new _$TermsIndexResponseApplicationJson_Ocs._(
            meta: meta.build(),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'TermsIndexResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsIndexResponseApplicationJsonInterfaceBuilder {
  void replace($TermsIndexResponseApplicationJsonInterface other);
  void update(void Function($TermsIndexResponseApplicationJsonInterfaceBuilder) updates);
  TermsIndexResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TermsIndexResponseApplicationJson_OcsBuilder? ocs);
}

class _$TermsIndexResponseApplicationJson extends TermsIndexResponseApplicationJson {
  @override
  final TermsIndexResponseApplicationJson_Ocs ocs;

  factory _$TermsIndexResponseApplicationJson([void Function(TermsIndexResponseApplicationJsonBuilder)? updates]) =>
      (new TermsIndexResponseApplicationJsonBuilder()..update(updates))._build();

  _$TermsIndexResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TermsIndexResponseApplicationJson', 'ocs');
  }

  @override
  TermsIndexResponseApplicationJson rebuild(void Function(TermsIndexResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsIndexResponseApplicationJsonBuilder toBuilder() => new TermsIndexResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsIndexResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TermsIndexResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TermsIndexResponseApplicationJsonBuilder
    implements
        Builder<TermsIndexResponseApplicationJson, TermsIndexResponseApplicationJsonBuilder>,
        $TermsIndexResponseApplicationJsonInterfaceBuilder {
  _$TermsIndexResponseApplicationJson? _$v;

  TermsIndexResponseApplicationJson_OcsBuilder? _ocs;
  TermsIndexResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= new TermsIndexResponseApplicationJson_OcsBuilder();
  set ocs(covariant TermsIndexResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TermsIndexResponseApplicationJsonBuilder() {
    TermsIndexResponseApplicationJson._defaults(this);
  }

  TermsIndexResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsIndexResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsIndexResponseApplicationJson;
  }

  @override
  void update(void Function(TermsIndexResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsIndexResponseApplicationJson build() => _build();

  _$TermsIndexResponseApplicationJson _build() {
    TermsIndexResponseApplicationJson._validate(this);
    _$TermsIndexResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          new _$TermsIndexResponseApplicationJson._(
            ocs: ocs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'TermsIndexResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsCreateRequestApplicationJsonInterfaceBuilder {
  void replace($TermsCreateRequestApplicationJsonInterface other);
  void update(void Function($TermsCreateRequestApplicationJsonInterfaceBuilder) updates);
  String? get countryCode;
  set countryCode(String? countryCode);

  String? get languageCode;
  set languageCode(String? languageCode);

  String? get body;
  set body(String? body);
}

class _$TermsCreateRequestApplicationJson extends TermsCreateRequestApplicationJson {
  @override
  final String countryCode;
  @override
  final String languageCode;
  @override
  final String body;

  factory _$TermsCreateRequestApplicationJson([void Function(TermsCreateRequestApplicationJsonBuilder)? updates]) =>
      (new TermsCreateRequestApplicationJsonBuilder()..update(updates))._build();

  _$TermsCreateRequestApplicationJson._({required this.countryCode, required this.languageCode, required this.body})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(countryCode, r'TermsCreateRequestApplicationJson', 'countryCode');
    BuiltValueNullFieldError.checkNotNull(languageCode, r'TermsCreateRequestApplicationJson', 'languageCode');
    BuiltValueNullFieldError.checkNotNull(body, r'TermsCreateRequestApplicationJson', 'body');
  }

  @override
  TermsCreateRequestApplicationJson rebuild(void Function(TermsCreateRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsCreateRequestApplicationJsonBuilder toBuilder() => new TermsCreateRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsCreateRequestApplicationJson &&
        countryCode == other.countryCode &&
        languageCode == other.languageCode &&
        body == other.body;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, languageCode.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TermsCreateRequestApplicationJson')
          ..add('countryCode', countryCode)
          ..add('languageCode', languageCode)
          ..add('body', body))
        .toString();
  }
}

class TermsCreateRequestApplicationJsonBuilder
    implements
        Builder<TermsCreateRequestApplicationJson, TermsCreateRequestApplicationJsonBuilder>,
        $TermsCreateRequestApplicationJsonInterfaceBuilder {
  _$TermsCreateRequestApplicationJson? _$v;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(covariant String? countryCode) => _$this._countryCode = countryCode;

  String? _languageCode;
  String? get languageCode => _$this._languageCode;
  set languageCode(covariant String? languageCode) => _$this._languageCode = languageCode;

  String? _body;
  String? get body => _$this._body;
  set body(covariant String? body) => _$this._body = body;

  TermsCreateRequestApplicationJsonBuilder() {
    TermsCreateRequestApplicationJson._defaults(this);
  }

  TermsCreateRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _countryCode = $v.countryCode;
      _languageCode = $v.languageCode;
      _body = $v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsCreateRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsCreateRequestApplicationJson;
  }

  @override
  void update(void Function(TermsCreateRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsCreateRequestApplicationJson build() => _build();

  _$TermsCreateRequestApplicationJson _build() {
    TermsCreateRequestApplicationJson._validate(this);
    final _$result = _$v ??
        new _$TermsCreateRequestApplicationJson._(
          countryCode:
              BuiltValueNullFieldError.checkNotNull(countryCode, r'TermsCreateRequestApplicationJson', 'countryCode'),
          languageCode:
              BuiltValueNullFieldError.checkNotNull(languageCode, r'TermsCreateRequestApplicationJson', 'languageCode'),
          body: BuiltValueNullFieldError.checkNotNull(body, r'TermsCreateRequestApplicationJson', 'body'),
        );
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsCreateResponseApplicationJson_OcsInterfaceBuilder {
  void replace($TermsCreateResponseApplicationJson_OcsInterface other);
  void update(void Function($TermsCreateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  TermsBuilder get data;
  set data(TermsBuilder? data);
}

class _$TermsCreateResponseApplicationJson_Ocs extends TermsCreateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final Terms data;

  factory _$TermsCreateResponseApplicationJson_Ocs(
          [void Function(TermsCreateResponseApplicationJson_OcsBuilder)? updates]) =>
      (new TermsCreateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TermsCreateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TermsCreateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TermsCreateResponseApplicationJson_Ocs', 'data');
  }

  @override
  TermsCreateResponseApplicationJson_Ocs rebuild(
          void Function(TermsCreateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsCreateResponseApplicationJson_OcsBuilder toBuilder() =>
      new TermsCreateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsCreateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TermsCreateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TermsCreateResponseApplicationJson_OcsBuilder
    implements
        Builder<TermsCreateResponseApplicationJson_Ocs, TermsCreateResponseApplicationJson_OcsBuilder>,
        $TermsCreateResponseApplicationJson_OcsInterfaceBuilder {
  _$TermsCreateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= new OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  TermsBuilder? _data;
  TermsBuilder get data => _$this._data ??= new TermsBuilder();
  set data(covariant TermsBuilder? data) => _$this._data = data;

  TermsCreateResponseApplicationJson_OcsBuilder() {
    TermsCreateResponseApplicationJson_Ocs._defaults(this);
  }

  TermsCreateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsCreateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsCreateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TermsCreateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsCreateResponseApplicationJson_Ocs build() => _build();

  _$TermsCreateResponseApplicationJson_Ocs _build() {
    TermsCreateResponseApplicationJson_Ocs._validate(this);
    _$TermsCreateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          new _$TermsCreateResponseApplicationJson_Ocs._(
            meta: meta.build(),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'TermsCreateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsCreateResponseApplicationJsonInterfaceBuilder {
  void replace($TermsCreateResponseApplicationJsonInterface other);
  void update(void Function($TermsCreateResponseApplicationJsonInterfaceBuilder) updates);
  TermsCreateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TermsCreateResponseApplicationJson_OcsBuilder? ocs);
}

class _$TermsCreateResponseApplicationJson extends TermsCreateResponseApplicationJson {
  @override
  final TermsCreateResponseApplicationJson_Ocs ocs;

  factory _$TermsCreateResponseApplicationJson([void Function(TermsCreateResponseApplicationJsonBuilder)? updates]) =>
      (new TermsCreateResponseApplicationJsonBuilder()..update(updates))._build();

  _$TermsCreateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TermsCreateResponseApplicationJson', 'ocs');
  }

  @override
  TermsCreateResponseApplicationJson rebuild(void Function(TermsCreateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsCreateResponseApplicationJsonBuilder toBuilder() =>
      new TermsCreateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsCreateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TermsCreateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TermsCreateResponseApplicationJsonBuilder
    implements
        Builder<TermsCreateResponseApplicationJson, TermsCreateResponseApplicationJsonBuilder>,
        $TermsCreateResponseApplicationJsonInterfaceBuilder {
  _$TermsCreateResponseApplicationJson? _$v;

  TermsCreateResponseApplicationJson_OcsBuilder? _ocs;
  TermsCreateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= new TermsCreateResponseApplicationJson_OcsBuilder();
  set ocs(covariant TermsCreateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TermsCreateResponseApplicationJsonBuilder() {
    TermsCreateResponseApplicationJson._defaults(this);
  }

  TermsCreateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsCreateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsCreateResponseApplicationJson;
  }

  @override
  void update(void Function(TermsCreateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsCreateResponseApplicationJson build() => _build();

  _$TermsCreateResponseApplicationJson _build() {
    TermsCreateResponseApplicationJson._validate(this);
    _$TermsCreateResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          new _$TermsCreateResponseApplicationJson._(
            ocs: ocs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'TermsCreateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsDestroyResponseApplicationJson_OcsInterfaceBuilder {
  void replace($TermsDestroyResponseApplicationJson_OcsInterface other);
  void update(void Function($TermsDestroyResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  JsonObject? get data;
  set data(JsonObject? data);
}

class _$TermsDestroyResponseApplicationJson_Ocs extends TermsDestroyResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final JsonObject data;

  factory _$TermsDestroyResponseApplicationJson_Ocs(
          [void Function(TermsDestroyResponseApplicationJson_OcsBuilder)? updates]) =>
      (new TermsDestroyResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TermsDestroyResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TermsDestroyResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TermsDestroyResponseApplicationJson_Ocs', 'data');
  }

  @override
  TermsDestroyResponseApplicationJson_Ocs rebuild(
          void Function(TermsDestroyResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsDestroyResponseApplicationJson_OcsBuilder toBuilder() =>
      new TermsDestroyResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsDestroyResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TermsDestroyResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TermsDestroyResponseApplicationJson_OcsBuilder
    implements
        Builder<TermsDestroyResponseApplicationJson_Ocs, TermsDestroyResponseApplicationJson_OcsBuilder>,
        $TermsDestroyResponseApplicationJson_OcsInterfaceBuilder {
  _$TermsDestroyResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= new OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  TermsDestroyResponseApplicationJson_OcsBuilder() {
    TermsDestroyResponseApplicationJson_Ocs._defaults(this);
  }

  TermsDestroyResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsDestroyResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsDestroyResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TermsDestroyResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsDestroyResponseApplicationJson_Ocs build() => _build();

  _$TermsDestroyResponseApplicationJson_Ocs _build() {
    TermsDestroyResponseApplicationJson_Ocs._validate(this);
    _$TermsDestroyResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          new _$TermsDestroyResponseApplicationJson_Ocs._(
            meta: meta.build(),
            data: BuiltValueNullFieldError.checkNotNull(data, r'TermsDestroyResponseApplicationJson_Ocs', 'data'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'TermsDestroyResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsDestroyResponseApplicationJsonInterfaceBuilder {
  void replace($TermsDestroyResponseApplicationJsonInterface other);
  void update(void Function($TermsDestroyResponseApplicationJsonInterfaceBuilder) updates);
  TermsDestroyResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TermsDestroyResponseApplicationJson_OcsBuilder? ocs);
}

class _$TermsDestroyResponseApplicationJson extends TermsDestroyResponseApplicationJson {
  @override
  final TermsDestroyResponseApplicationJson_Ocs ocs;

  factory _$TermsDestroyResponseApplicationJson([void Function(TermsDestroyResponseApplicationJsonBuilder)? updates]) =>
      (new TermsDestroyResponseApplicationJsonBuilder()..update(updates))._build();

  _$TermsDestroyResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TermsDestroyResponseApplicationJson', 'ocs');
  }

  @override
  TermsDestroyResponseApplicationJson rebuild(void Function(TermsDestroyResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsDestroyResponseApplicationJsonBuilder toBuilder() =>
      new TermsDestroyResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsDestroyResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TermsDestroyResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TermsDestroyResponseApplicationJsonBuilder
    implements
        Builder<TermsDestroyResponseApplicationJson, TermsDestroyResponseApplicationJsonBuilder>,
        $TermsDestroyResponseApplicationJsonInterfaceBuilder {
  _$TermsDestroyResponseApplicationJson? _$v;

  TermsDestroyResponseApplicationJson_OcsBuilder? _ocs;
  TermsDestroyResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= new TermsDestroyResponseApplicationJson_OcsBuilder();
  set ocs(covariant TermsDestroyResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TermsDestroyResponseApplicationJsonBuilder() {
    TermsDestroyResponseApplicationJson._defaults(this);
  }

  TermsDestroyResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsDestroyResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsDestroyResponseApplicationJson;
  }

  @override
  void update(void Function(TermsDestroyResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsDestroyResponseApplicationJson build() => _build();

  _$TermsDestroyResponseApplicationJson _build() {
    TermsDestroyResponseApplicationJson._validate(this);
    _$TermsDestroyResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          new _$TermsDestroyResponseApplicationJson._(
            ocs: ocs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'TermsDestroyResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $AdminFormDataInterfaceBuilder {
  void replace($AdminFormDataInterface other);
  void update(void Function($AdminFormDataInterfaceBuilder) updates);
  MapBuilder<String, Terms> get terms;
  set terms(MapBuilder<String, Terms>? terms);

  MapBuilder<String, String> get countries;
  set countries(MapBuilder<String, String>? countries);

  MapBuilder<String, String> get languages;
  set languages(MapBuilder<String, String>? languages);

  AdminFormData_TosOnPublicShares? get tosOnPublicShares;
  set tosOnPublicShares(AdminFormData_TosOnPublicShares? tosOnPublicShares);

  AdminFormData_TosForUsers? get tosForUsers;
  set tosForUsers(AdminFormData_TosForUsers? tosForUsers);
}

class _$AdminFormData extends AdminFormData {
  @override
  final BuiltMap<String, Terms> terms;
  @override
  final BuiltMap<String, String> countries;
  @override
  final BuiltMap<String, String> languages;
  @override
  final AdminFormData_TosOnPublicShares tosOnPublicShares;
  @override
  final AdminFormData_TosForUsers tosForUsers;

  factory _$AdminFormData([void Function(AdminFormDataBuilder)? updates]) =>
      (new AdminFormDataBuilder()..update(updates))._build();

  _$AdminFormData._(
      {required this.terms,
      required this.countries,
      required this.languages,
      required this.tosOnPublicShares,
      required this.tosForUsers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(terms, r'AdminFormData', 'terms');
    BuiltValueNullFieldError.checkNotNull(countries, r'AdminFormData', 'countries');
    BuiltValueNullFieldError.checkNotNull(languages, r'AdminFormData', 'languages');
    BuiltValueNullFieldError.checkNotNull(tosOnPublicShares, r'AdminFormData', 'tosOnPublicShares');
    BuiltValueNullFieldError.checkNotNull(tosForUsers, r'AdminFormData', 'tosForUsers');
  }

  @override
  AdminFormData rebuild(void Function(AdminFormDataBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AdminFormDataBuilder toBuilder() => new AdminFormDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminFormData &&
        terms == other.terms &&
        countries == other.countries &&
        languages == other.languages &&
        tosOnPublicShares == other.tosOnPublicShares &&
        tosForUsers == other.tosForUsers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, terms.hashCode);
    _$hash = $jc(_$hash, countries.hashCode);
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, tosOnPublicShares.hashCode);
    _$hash = $jc(_$hash, tosForUsers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminFormData')
          ..add('terms', terms)
          ..add('countries', countries)
          ..add('languages', languages)
          ..add('tosOnPublicShares', tosOnPublicShares)
          ..add('tosForUsers', tosForUsers))
        .toString();
  }
}

class AdminFormDataBuilder implements Builder<AdminFormData, AdminFormDataBuilder>, $AdminFormDataInterfaceBuilder {
  _$AdminFormData? _$v;

  MapBuilder<String, Terms>? _terms;
  MapBuilder<String, Terms> get terms => _$this._terms ??= new MapBuilder<String, Terms>();
  set terms(covariant MapBuilder<String, Terms>? terms) => _$this._terms = terms;

  MapBuilder<String, String>? _countries;
  MapBuilder<String, String> get countries => _$this._countries ??= new MapBuilder<String, String>();
  set countries(covariant MapBuilder<String, String>? countries) => _$this._countries = countries;

  MapBuilder<String, String>? _languages;
  MapBuilder<String, String> get languages => _$this._languages ??= new MapBuilder<String, String>();
  set languages(covariant MapBuilder<String, String>? languages) => _$this._languages = languages;

  AdminFormData_TosOnPublicShares? _tosOnPublicShares;
  AdminFormData_TosOnPublicShares? get tosOnPublicShares => _$this._tosOnPublicShares;
  set tosOnPublicShares(covariant AdminFormData_TosOnPublicShares? tosOnPublicShares) =>
      _$this._tosOnPublicShares = tosOnPublicShares;

  AdminFormData_TosForUsers? _tosForUsers;
  AdminFormData_TosForUsers? get tosForUsers => _$this._tosForUsers;
  set tosForUsers(covariant AdminFormData_TosForUsers? tosForUsers) => _$this._tosForUsers = tosForUsers;

  AdminFormDataBuilder() {
    AdminFormData._defaults(this);
  }

  AdminFormDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _terms = $v.terms.toBuilder();
      _countries = $v.countries.toBuilder();
      _languages = $v.languages.toBuilder();
      _tosOnPublicShares = $v.tosOnPublicShares;
      _tosForUsers = $v.tosForUsers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant AdminFormData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdminFormData;
  }

  @override
  void update(void Function(AdminFormDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminFormData build() => _build();

  _$AdminFormData _build() {
    AdminFormData._validate(this);
    _$AdminFormData _$result;
    try {
      _$result = _$v ??
          new _$AdminFormData._(
            terms: terms.build(),
            countries: countries.build(),
            languages: languages.build(),
            tosOnPublicShares:
                BuiltValueNullFieldError.checkNotNull(tosOnPublicShares, r'AdminFormData', 'tosOnPublicShares'),
            tosForUsers: BuiltValueNullFieldError.checkNotNull(tosForUsers, r'AdminFormData', 'tosForUsers'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'terms';
        terms.build();
        _$failedField = 'countries';
        countries.build();
        _$failedField = 'languages';
        languages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'AdminFormData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsGetAdminFormDataResponseApplicationJson_OcsInterfaceBuilder {
  void replace($TermsGetAdminFormDataResponseApplicationJson_OcsInterface other);
  void update(void Function($TermsGetAdminFormDataResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  AdminFormDataBuilder get data;
  set data(AdminFormDataBuilder? data);
}

class _$TermsGetAdminFormDataResponseApplicationJson_Ocs extends TermsGetAdminFormDataResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final AdminFormData data;

  factory _$TermsGetAdminFormDataResponseApplicationJson_Ocs(
          [void Function(TermsGetAdminFormDataResponseApplicationJson_OcsBuilder)? updates]) =>
      (new TermsGetAdminFormDataResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$TermsGetAdminFormDataResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'TermsGetAdminFormDataResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'TermsGetAdminFormDataResponseApplicationJson_Ocs', 'data');
  }

  @override
  TermsGetAdminFormDataResponseApplicationJson_Ocs rebuild(
          void Function(TermsGetAdminFormDataResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsGetAdminFormDataResponseApplicationJson_OcsBuilder toBuilder() =>
      new TermsGetAdminFormDataResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsGetAdminFormDataResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'TermsGetAdminFormDataResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class TermsGetAdminFormDataResponseApplicationJson_OcsBuilder
    implements
        Builder<TermsGetAdminFormDataResponseApplicationJson_Ocs,
            TermsGetAdminFormDataResponseApplicationJson_OcsBuilder>,
        $TermsGetAdminFormDataResponseApplicationJson_OcsInterfaceBuilder {
  _$TermsGetAdminFormDataResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= new OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  AdminFormDataBuilder? _data;
  AdminFormDataBuilder get data => _$this._data ??= new AdminFormDataBuilder();
  set data(covariant AdminFormDataBuilder? data) => _$this._data = data;

  TermsGetAdminFormDataResponseApplicationJson_OcsBuilder() {
    TermsGetAdminFormDataResponseApplicationJson_Ocs._defaults(this);
  }

  TermsGetAdminFormDataResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsGetAdminFormDataResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsGetAdminFormDataResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(TermsGetAdminFormDataResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsGetAdminFormDataResponseApplicationJson_Ocs build() => _build();

  _$TermsGetAdminFormDataResponseApplicationJson_Ocs _build() {
    TermsGetAdminFormDataResponseApplicationJson_Ocs._validate(this);
    _$TermsGetAdminFormDataResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          new _$TermsGetAdminFormDataResponseApplicationJson_Ocs._(
            meta: meta.build(),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TermsGetAdminFormDataResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $TermsGetAdminFormDataResponseApplicationJsonInterfaceBuilder {
  void replace($TermsGetAdminFormDataResponseApplicationJsonInterface other);
  void update(void Function($TermsGetAdminFormDataResponseApplicationJsonInterfaceBuilder) updates);
  TermsGetAdminFormDataResponseApplicationJson_OcsBuilder get ocs;
  set ocs(TermsGetAdminFormDataResponseApplicationJson_OcsBuilder? ocs);
}

class _$TermsGetAdminFormDataResponseApplicationJson extends TermsGetAdminFormDataResponseApplicationJson {
  @override
  final TermsGetAdminFormDataResponseApplicationJson_Ocs ocs;

  factory _$TermsGetAdminFormDataResponseApplicationJson(
          [void Function(TermsGetAdminFormDataResponseApplicationJsonBuilder)? updates]) =>
      (new TermsGetAdminFormDataResponseApplicationJsonBuilder()..update(updates))._build();

  _$TermsGetAdminFormDataResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'TermsGetAdminFormDataResponseApplicationJson', 'ocs');
  }

  @override
  TermsGetAdminFormDataResponseApplicationJson rebuild(
          void Function(TermsGetAdminFormDataResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermsGetAdminFormDataResponseApplicationJsonBuilder toBuilder() =>
      new TermsGetAdminFormDataResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermsGetAdminFormDataResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'TermsGetAdminFormDataResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class TermsGetAdminFormDataResponseApplicationJsonBuilder
    implements
        Builder<TermsGetAdminFormDataResponseApplicationJson, TermsGetAdminFormDataResponseApplicationJsonBuilder>,
        $TermsGetAdminFormDataResponseApplicationJsonInterfaceBuilder {
  _$TermsGetAdminFormDataResponseApplicationJson? _$v;

  TermsGetAdminFormDataResponseApplicationJson_OcsBuilder? _ocs;
  TermsGetAdminFormDataResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= new TermsGetAdminFormDataResponseApplicationJson_OcsBuilder();
  set ocs(covariant TermsGetAdminFormDataResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  TermsGetAdminFormDataResponseApplicationJsonBuilder() {
    TermsGetAdminFormDataResponseApplicationJson._defaults(this);
  }

  TermsGetAdminFormDataResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TermsGetAdminFormDataResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermsGetAdminFormDataResponseApplicationJson;
  }

  @override
  void update(void Function(TermsGetAdminFormDataResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermsGetAdminFormDataResponseApplicationJson build() => _build();

  _$TermsGetAdminFormDataResponseApplicationJson _build() {
    TermsGetAdminFormDataResponseApplicationJson._validate(this);
    _$TermsGetAdminFormDataResponseApplicationJson _$result;
    try {
      _$result = _$v ??
          new _$TermsGetAdminFormDataResponseApplicationJson._(
            ocs: ocs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TermsGetAdminFormDataResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $PublicCapabilities_TermsOfServiceInterfaceBuilder {
  void replace($PublicCapabilities_TermsOfServiceInterface other);
  void update(void Function($PublicCapabilities_TermsOfServiceInterfaceBuilder) updates);
  PublicCapabilities_TermsOfService_Enabled? get enabled;
  set enabled(PublicCapabilities_TermsOfService_Enabled? enabled);

  String? get termUuid;
  set termUuid(String? termUuid);
}

class _$PublicCapabilities_TermsOfService extends PublicCapabilities_TermsOfService {
  @override
  final PublicCapabilities_TermsOfService_Enabled enabled;
  @override
  final String termUuid;

  factory _$PublicCapabilities_TermsOfService([void Function(PublicCapabilities_TermsOfServiceBuilder)? updates]) =>
      (new PublicCapabilities_TermsOfServiceBuilder()..update(updates))._build();

  _$PublicCapabilities_TermsOfService._({required this.enabled, required this.termUuid}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, r'PublicCapabilities_TermsOfService', 'enabled');
    BuiltValueNullFieldError.checkNotNull(termUuid, r'PublicCapabilities_TermsOfService', 'termUuid');
  }

  @override
  PublicCapabilities_TermsOfService rebuild(void Function(PublicCapabilities_TermsOfServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicCapabilities_TermsOfServiceBuilder toBuilder() => new PublicCapabilities_TermsOfServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicCapabilities_TermsOfService && enabled == other.enabled && termUuid == other.termUuid;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, termUuid.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicCapabilities_TermsOfService')
          ..add('enabled', enabled)
          ..add('termUuid', termUuid))
        .toString();
  }
}

class PublicCapabilities_TermsOfServiceBuilder
    implements
        Builder<PublicCapabilities_TermsOfService, PublicCapabilities_TermsOfServiceBuilder>,
        $PublicCapabilities_TermsOfServiceInterfaceBuilder {
  _$PublicCapabilities_TermsOfService? _$v;

  PublicCapabilities_TermsOfService_Enabled? _enabled;
  PublicCapabilities_TermsOfService_Enabled? get enabled => _$this._enabled;
  set enabled(covariant PublicCapabilities_TermsOfService_Enabled? enabled) => _$this._enabled = enabled;

  String? _termUuid;
  String? get termUuid => _$this._termUuid;
  set termUuid(covariant String? termUuid) => _$this._termUuid = termUuid;

  PublicCapabilities_TermsOfServiceBuilder() {
    PublicCapabilities_TermsOfService._defaults(this);
  }

  PublicCapabilities_TermsOfServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _termUuid = $v.termUuid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PublicCapabilities_TermsOfService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicCapabilities_TermsOfService;
  }

  @override
  void update(void Function(PublicCapabilities_TermsOfServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicCapabilities_TermsOfService build() => _build();

  _$PublicCapabilities_TermsOfService _build() {
    PublicCapabilities_TermsOfService._validate(this);
    final _$result = _$v ??
        new _$PublicCapabilities_TermsOfService._(
          enabled: BuiltValueNullFieldError.checkNotNull(enabled, r'PublicCapabilities_TermsOfService', 'enabled'),
          termUuid: BuiltValueNullFieldError.checkNotNull(termUuid, r'PublicCapabilities_TermsOfService', 'termUuid'),
        );
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $PublicCapabilitiesInterfaceBuilder {
  void replace($PublicCapabilitiesInterface other);
  void update(void Function($PublicCapabilitiesInterfaceBuilder) updates);
  PublicCapabilities_TermsOfServiceBuilder get termsOfService;
  set termsOfService(PublicCapabilities_TermsOfServiceBuilder? termsOfService);
}

class _$PublicCapabilities extends PublicCapabilities {
  @override
  final PublicCapabilities_TermsOfService termsOfService;

  factory _$PublicCapabilities([void Function(PublicCapabilitiesBuilder)? updates]) =>
      (new PublicCapabilitiesBuilder()..update(updates))._build();

  _$PublicCapabilities._({required this.termsOfService}) : super._() {
    BuiltValueNullFieldError.checkNotNull(termsOfService, r'PublicCapabilities', 'termsOfService');
  }

  @override
  PublicCapabilities rebuild(void Function(PublicCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicCapabilitiesBuilder toBuilder() => new PublicCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicCapabilities && termsOfService == other.termsOfService;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, termsOfService.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicCapabilities')..add('termsOfService', termsOfService)).toString();
  }
}

class PublicCapabilitiesBuilder
    implements Builder<PublicCapabilities, PublicCapabilitiesBuilder>, $PublicCapabilitiesInterfaceBuilder {
  _$PublicCapabilities? _$v;

  PublicCapabilities_TermsOfServiceBuilder? _termsOfService;
  PublicCapabilities_TermsOfServiceBuilder get termsOfService =>
      _$this._termsOfService ??= new PublicCapabilities_TermsOfServiceBuilder();
  set termsOfService(covariant PublicCapabilities_TermsOfServiceBuilder? termsOfService) =>
      _$this._termsOfService = termsOfService;

  PublicCapabilitiesBuilder() {
    PublicCapabilities._defaults(this);
  }

  PublicCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _termsOfService = $v.termsOfService.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PublicCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicCapabilities;
  }

  @override
  void update(void Function(PublicCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicCapabilities build() => _build();

  _$PublicCapabilities _build() {
    PublicCapabilities._validate(this);
    _$PublicCapabilities _$result;
    try {
      _$result = _$v ??
          new _$PublicCapabilities._(
            termsOfService: termsOfService.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'termsOfService';
        termsOfService.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(r'PublicCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
