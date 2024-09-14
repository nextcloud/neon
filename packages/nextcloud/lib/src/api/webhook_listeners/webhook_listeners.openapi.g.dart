// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webhook_listeners.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WebhooksCreateRequestApplicationJson_AuthMethod _$webhooksCreateRequestApplicationJsonAuthMethodNone =
    WebhooksCreateRequestApplicationJson_AuthMethod._('none');
const WebhooksCreateRequestApplicationJson_AuthMethod _$webhooksCreateRequestApplicationJsonAuthMethodHeaders =
    WebhooksCreateRequestApplicationJson_AuthMethod._('headers');

WebhooksCreateRequestApplicationJson_AuthMethod _$valueOfWebhooksCreateRequestApplicationJson_AuthMethod(String name) {
  switch (name) {
    case 'none':
      return _$webhooksCreateRequestApplicationJsonAuthMethodNone;
    case 'headers':
      return _$webhooksCreateRequestApplicationJsonAuthMethodHeaders;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<WebhooksCreateRequestApplicationJson_AuthMethod> _$webhooksCreateRequestApplicationJsonAuthMethodValues =
    BuiltSet<WebhooksCreateRequestApplicationJson_AuthMethod>(const <WebhooksCreateRequestApplicationJson_AuthMethod>[
  _$webhooksCreateRequestApplicationJsonAuthMethodNone,
  _$webhooksCreateRequestApplicationJsonAuthMethodHeaders,
]);

const WebhooksUpdateRequestApplicationJson_AuthMethod _$webhooksUpdateRequestApplicationJsonAuthMethodNone =
    WebhooksUpdateRequestApplicationJson_AuthMethod._('none');
const WebhooksUpdateRequestApplicationJson_AuthMethod _$webhooksUpdateRequestApplicationJsonAuthMethodHeaders =
    WebhooksUpdateRequestApplicationJson_AuthMethod._('headers');

WebhooksUpdateRequestApplicationJson_AuthMethod _$valueOfWebhooksUpdateRequestApplicationJson_AuthMethod(String name) {
  switch (name) {
    case 'none':
      return _$webhooksUpdateRequestApplicationJsonAuthMethodNone;
    case 'headers':
      return _$webhooksUpdateRequestApplicationJsonAuthMethodHeaders;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<WebhooksUpdateRequestApplicationJson_AuthMethod> _$webhooksUpdateRequestApplicationJsonAuthMethodValues =
    BuiltSet<WebhooksUpdateRequestApplicationJson_AuthMethod>(const <WebhooksUpdateRequestApplicationJson_AuthMethod>[
  _$webhooksUpdateRequestApplicationJsonAuthMethodNone,
  _$webhooksUpdateRequestApplicationJsonAuthMethodHeaders,
]);

Serializer<OCSMeta> _$oCSMetaSerializer = _$OCSMetaSerializer();
Serializer<WebhookInfo> _$webhookInfoSerializer = _$WebhookInfoSerializer();
Serializer<WebhooksIndexResponseApplicationJson_Ocs> _$webhooksIndexResponseApplicationJsonOcsSerializer =
    _$WebhooksIndexResponseApplicationJson_OcsSerializer();
Serializer<WebhooksIndexResponseApplicationJson> _$webhooksIndexResponseApplicationJsonSerializer =
    _$WebhooksIndexResponseApplicationJsonSerializer();
Serializer<WebhooksCreateRequestApplicationJson> _$webhooksCreateRequestApplicationJsonSerializer =
    _$WebhooksCreateRequestApplicationJsonSerializer();
Serializer<WebhooksCreateResponseApplicationJson_Ocs> _$webhooksCreateResponseApplicationJsonOcsSerializer =
    _$WebhooksCreateResponseApplicationJson_OcsSerializer();
Serializer<WebhooksCreateResponseApplicationJson> _$webhooksCreateResponseApplicationJsonSerializer =
    _$WebhooksCreateResponseApplicationJsonSerializer();
Serializer<WebhooksShowResponseApplicationJson_Ocs> _$webhooksShowResponseApplicationJsonOcsSerializer =
    _$WebhooksShowResponseApplicationJson_OcsSerializer();
Serializer<WebhooksShowResponseApplicationJson> _$webhooksShowResponseApplicationJsonSerializer =
    _$WebhooksShowResponseApplicationJsonSerializer();
Serializer<WebhooksUpdateRequestApplicationJson> _$webhooksUpdateRequestApplicationJsonSerializer =
    _$WebhooksUpdateRequestApplicationJsonSerializer();
Serializer<WebhooksUpdateResponseApplicationJson_Ocs> _$webhooksUpdateResponseApplicationJsonOcsSerializer =
    _$WebhooksUpdateResponseApplicationJson_OcsSerializer();
Serializer<WebhooksUpdateResponseApplicationJson> _$webhooksUpdateResponseApplicationJsonSerializer =
    _$WebhooksUpdateResponseApplicationJsonSerializer();
Serializer<WebhooksDestroyResponseApplicationJson_Ocs> _$webhooksDestroyResponseApplicationJsonOcsSerializer =
    _$WebhooksDestroyResponseApplicationJson_OcsSerializer();
Serializer<WebhooksDestroyResponseApplicationJson> _$webhooksDestroyResponseApplicationJsonSerializer =
    _$WebhooksDestroyResponseApplicationJsonSerializer();
Serializer<WebhooksDeleteByAppIdResponseApplicationJson_Ocs>
    _$webhooksDeleteByAppIdResponseApplicationJsonOcsSerializer =
    _$WebhooksDeleteByAppIdResponseApplicationJson_OcsSerializer();
Serializer<WebhooksDeleteByAppIdResponseApplicationJson> _$webhooksDeleteByAppIdResponseApplicationJsonSerializer =
    _$WebhooksDeleteByAppIdResponseApplicationJsonSerializer();

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

class _$WebhookInfoSerializer implements StructuredSerializer<WebhookInfo> {
  @override
  final Iterable<Type> types = const [WebhookInfo, _$WebhookInfo];
  @override
  final String wireName = 'WebhookInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhookInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'httpMethod',
      serializers.serialize(object.httpMethod, specifiedType: const FullType(String)),
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(String)),
      'authMethod',
      serializers.serialize(object.authMethod, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.event;
    if (value != null) {
      result
        ..add('event')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.eventFilter;
    if (value != null) {
      result
        ..add('eventFilter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    value = object.userIdFilter;
    if (value != null) {
      result
        ..add('userIdFilter')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.headers;
    if (value != null) {
      result
        ..add('headers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)])));
    }
    value = object.authData;
    if (value != null) {
      result
        ..add('authData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    return result;
  }

  @override
  WebhookInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhookInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'httpMethod':
          result.httpMethod = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'event':
          result.event = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'eventFilter':
          result.eventFilter.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'userIdFilter':
          result.userIdFilter = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'headers':
          result.headers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]))!);
          break;
        case 'authMethod':
          result.authMethod = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'authData':
          result.authData.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksIndexResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WebhooksIndexResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WebhooksIndexResponseApplicationJson_Ocs,
    _$WebhooksIndexResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WebhooksIndexResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksIndexResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(WebhookInfo)])),
    ];

    return result;
  }

  @override
  WebhooksIndexResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksIndexResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(BuiltList, [FullType(WebhookInfo)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksIndexResponseApplicationJsonSerializer
    implements StructuredSerializer<WebhooksIndexResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [WebhooksIndexResponseApplicationJson, _$WebhooksIndexResponseApplicationJson];
  @override
  final String wireName = 'WebhooksIndexResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksIndexResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WebhooksIndexResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WebhooksIndexResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksIndexResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(WebhooksIndexResponseApplicationJson_Ocs))!
                  as WebhooksIndexResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksCreateRequestApplicationJsonSerializer
    implements StructuredSerializer<WebhooksCreateRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [WebhooksCreateRequestApplicationJson, _$WebhooksCreateRequestApplicationJson];
  @override
  final String wireName = 'WebhooksCreateRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksCreateRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'httpMethod',
      serializers.serialize(object.httpMethod, specifiedType: const FullType(String)),
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(String)),
      'event',
      serializers.serialize(object.event, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.eventFilter;
    if (value != null) {
      result
        ..add('eventFilter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    value = object.userIdFilter;
    if (value != null) {
      result
        ..add('userIdFilter')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.headers;
    if (value != null) {
      result
        ..add('headers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)])));
    }
    value = object.authMethod;
    if (value != null) {
      result
        ..add('authMethod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(WebhooksCreateRequestApplicationJson_AuthMethod)));
    }
    value = object.authData;
    if (value != null) {
      result
        ..add('authData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    return result;
  }

  @override
  WebhooksCreateRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksCreateRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'httpMethod':
          result.httpMethod = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'event':
          result.event = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'eventFilter':
          result.eventFilter.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'userIdFilter':
          result.userIdFilter = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'headers':
          result.headers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]))!);
          break;
        case 'authMethod':
          result.authMethod = serializers.deserialize(value,
                  specifiedType: const FullType(WebhooksCreateRequestApplicationJson_AuthMethod))
              as WebhooksCreateRequestApplicationJson_AuthMethod?;
          break;
        case 'authData':
          result.authData.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksCreateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WebhooksCreateResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WebhooksCreateResponseApplicationJson_Ocs,
    _$WebhooksCreateResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WebhooksCreateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksCreateResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(WebhookInfo)),
    ];

    return result;
  }

  @override
  WebhooksCreateResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksCreateResponseApplicationJson_OcsBuilder();

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
              .replace(serializers.deserialize(value, specifiedType: const FullType(WebhookInfo))! as WebhookInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksCreateResponseApplicationJsonSerializer
    implements StructuredSerializer<WebhooksCreateResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [WebhooksCreateResponseApplicationJson, _$WebhooksCreateResponseApplicationJson];
  @override
  final String wireName = 'WebhooksCreateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksCreateResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WebhooksCreateResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WebhooksCreateResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksCreateResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(WebhooksCreateResponseApplicationJson_Ocs))!
                  as WebhooksCreateResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksShowResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WebhooksShowResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WebhooksShowResponseApplicationJson_Ocs,
    _$WebhooksShowResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WebhooksShowResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksShowResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(WebhookInfo)),
    ];

    return result;
  }

  @override
  WebhooksShowResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksShowResponseApplicationJson_OcsBuilder();

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
              .replace(serializers.deserialize(value, specifiedType: const FullType(WebhookInfo))! as WebhookInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksShowResponseApplicationJsonSerializer
    implements StructuredSerializer<WebhooksShowResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [WebhooksShowResponseApplicationJson, _$WebhooksShowResponseApplicationJson];
  @override
  final String wireName = 'WebhooksShowResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksShowResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WebhooksShowResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WebhooksShowResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksShowResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(WebhooksShowResponseApplicationJson_Ocs))!
                  as WebhooksShowResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksUpdateRequestApplicationJsonSerializer
    implements StructuredSerializer<WebhooksUpdateRequestApplicationJson> {
  @override
  final Iterable<Type> types = const [WebhooksUpdateRequestApplicationJson, _$WebhooksUpdateRequestApplicationJson];
  @override
  final String wireName = 'WebhooksUpdateRequestApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksUpdateRequestApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'httpMethod',
      serializers.serialize(object.httpMethod, specifiedType: const FullType(String)),
      'uri',
      serializers.serialize(object.uri, specifiedType: const FullType(String)),
      'event',
      serializers.serialize(object.event, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.eventFilter;
    if (value != null) {
      result
        ..add('eventFilter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    value = object.userIdFilter;
    if (value != null) {
      result
        ..add('userIdFilter')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.headers;
    if (value != null) {
      result
        ..add('headers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)])));
    }
    value = object.authMethod;
    if (value != null) {
      result
        ..add('authMethod')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(WebhooksUpdateRequestApplicationJson_AuthMethod)));
    }
    value = object.authData;
    if (value != null) {
      result
        ..add('authData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)])));
    }
    return result;
  }

  @override
  WebhooksUpdateRequestApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksUpdateRequestApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'httpMethod':
          result.httpMethod = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'uri':
          result.uri = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'event':
          result.event = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'eventFilter':
          result.eventFilter.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
        case 'userIdFilter':
          result.userIdFilter = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'headers':
          result.headers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]))!);
          break;
        case 'authMethod':
          result.authMethod = serializers.deserialize(value,
                  specifiedType: const FullType(WebhooksUpdateRequestApplicationJson_AuthMethod))
              as WebhooksUpdateRequestApplicationJson_AuthMethod?;
          break;
        case 'authData':
          result.authData.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksUpdateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WebhooksUpdateResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WebhooksUpdateResponseApplicationJson_Ocs,
    _$WebhooksUpdateResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WebhooksUpdateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksUpdateResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(WebhookInfo)),
    ];

    return result;
  }

  @override
  WebhooksUpdateResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksUpdateResponseApplicationJson_OcsBuilder();

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
              .replace(serializers.deserialize(value, specifiedType: const FullType(WebhookInfo))! as WebhookInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksUpdateResponseApplicationJsonSerializer
    implements StructuredSerializer<WebhooksUpdateResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [WebhooksUpdateResponseApplicationJson, _$WebhooksUpdateResponseApplicationJson];
  @override
  final String wireName = 'WebhooksUpdateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksUpdateResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WebhooksUpdateResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WebhooksUpdateResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksUpdateResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(WebhooksUpdateResponseApplicationJson_Ocs))!
                  as WebhooksUpdateResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksDestroyResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WebhooksDestroyResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WebhooksDestroyResponseApplicationJson_Ocs,
    _$WebhooksDestroyResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WebhooksDestroyResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksDestroyResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  WebhooksDestroyResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksDestroyResponseApplicationJson_OcsBuilder();

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
          result.data = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksDestroyResponseApplicationJsonSerializer
    implements StructuredSerializer<WebhooksDestroyResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [WebhooksDestroyResponseApplicationJson, _$WebhooksDestroyResponseApplicationJson];
  @override
  final String wireName = 'WebhooksDestroyResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksDestroyResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WebhooksDestroyResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WebhooksDestroyResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksDestroyResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(WebhooksDestroyResponseApplicationJson_Ocs))!
                  as WebhooksDestroyResponseApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksDeleteByAppIdResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WebhooksDeleteByAppIdResponseApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    WebhooksDeleteByAppIdResponseApplicationJson_Ocs,
    _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs
  ];
  @override
  final String wireName = 'WebhooksDeleteByAppIdResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksDeleteByAppIdResponseApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  WebhooksDeleteByAppIdResponseApplicationJson_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder();

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
          result.data = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$WebhooksDeleteByAppIdResponseApplicationJsonSerializer
    implements StructuredSerializer<WebhooksDeleteByAppIdResponseApplicationJson> {
  @override
  final Iterable<Type> types = const [
    WebhooksDeleteByAppIdResponseApplicationJson,
    _$WebhooksDeleteByAppIdResponseApplicationJson
  ];
  @override
  final String wireName = 'WebhooksDeleteByAppIdResponseApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebhooksDeleteByAppIdResponseApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(WebhooksDeleteByAppIdResponseApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  WebhooksDeleteByAppIdResponseApplicationJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebhooksDeleteByAppIdResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebhooksDeleteByAppIdResponseApplicationJson_Ocs))!
              as WebhooksDeleteByAppIdResponseApplicationJson_Ocs);
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

abstract mixin class $WebhookInfoInterfaceBuilder {
  void replace($WebhookInfoInterface other);
  void update(void Function($WebhookInfoInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get userId;
  set userId(String? userId);

  String? get httpMethod;
  set httpMethod(String? httpMethod);

  String? get uri;
  set uri(String? uri);

  String? get event;
  set event(String? event);

  MapBuilder<String, JsonObject> get eventFilter;
  set eventFilter(MapBuilder<String, JsonObject>? eventFilter);

  String? get userIdFilter;
  set userIdFilter(String? userIdFilter);

  MapBuilder<String, String> get headers;
  set headers(MapBuilder<String, String>? headers);

  String? get authMethod;
  set authMethod(String? authMethod);

  MapBuilder<String, JsonObject> get authData;
  set authData(MapBuilder<String, JsonObject>? authData);
}

class _$WebhookInfo extends WebhookInfo {
  @override
  final String id;
  @override
  final String userId;
  @override
  final String httpMethod;
  @override
  final String uri;
  @override
  final String? event;
  @override
  final BuiltMap<String, JsonObject>? eventFilter;
  @override
  final String? userIdFilter;
  @override
  final BuiltMap<String, String>? headers;
  @override
  final String authMethod;
  @override
  final BuiltMap<String, JsonObject>? authData;

  factory _$WebhookInfo([void Function(WebhookInfoBuilder)? updates]) =>
      (WebhookInfoBuilder()..update(updates))._build();

  _$WebhookInfo._(
      {required this.id,
      required this.userId,
      required this.httpMethod,
      required this.uri,
      this.event,
      this.eventFilter,
      this.userIdFilter,
      this.headers,
      required this.authMethod,
      this.authData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'WebhookInfo', 'id');
    BuiltValueNullFieldError.checkNotNull(userId, r'WebhookInfo', 'userId');
    BuiltValueNullFieldError.checkNotNull(httpMethod, r'WebhookInfo', 'httpMethod');
    BuiltValueNullFieldError.checkNotNull(uri, r'WebhookInfo', 'uri');
    BuiltValueNullFieldError.checkNotNull(authMethod, r'WebhookInfo', 'authMethod');
  }

  @override
  WebhookInfo rebuild(void Function(WebhookInfoBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  WebhookInfoBuilder toBuilder() => WebhookInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhookInfo &&
        id == other.id &&
        userId == other.userId &&
        httpMethod == other.httpMethod &&
        uri == other.uri &&
        event == other.event &&
        eventFilter == other.eventFilter &&
        userIdFilter == other.userIdFilter &&
        headers == other.headers &&
        authMethod == other.authMethod &&
        authData == other.authData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, httpMethod.hashCode);
    _$hash = $jc(_$hash, uri.hashCode);
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, eventFilter.hashCode);
    _$hash = $jc(_$hash, userIdFilter.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, authMethod.hashCode);
    _$hash = $jc(_$hash, authData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebhookInfo')
          ..add('id', id)
          ..add('userId', userId)
          ..add('httpMethod', httpMethod)
          ..add('uri', uri)
          ..add('event', event)
          ..add('eventFilter', eventFilter)
          ..add('userIdFilter', userIdFilter)
          ..add('headers', headers)
          ..add('authMethod', authMethod)
          ..add('authData', authData))
        .toString();
  }
}

class WebhookInfoBuilder implements Builder<WebhookInfo, WebhookInfoBuilder>, $WebhookInfoInterfaceBuilder {
  _$WebhookInfo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(covariant String? userId) => _$this._userId = userId;

  String? _httpMethod;
  String? get httpMethod => _$this._httpMethod;
  set httpMethod(covariant String? httpMethod) => _$this._httpMethod = httpMethod;

  String? _uri;
  String? get uri => _$this._uri;
  set uri(covariant String? uri) => _$this._uri = uri;

  String? _event;
  String? get event => _$this._event;
  set event(covariant String? event) => _$this._event = event;

  MapBuilder<String, JsonObject>? _eventFilter;
  MapBuilder<String, JsonObject> get eventFilter => _$this._eventFilter ??= MapBuilder<String, JsonObject>();
  set eventFilter(covariant MapBuilder<String, JsonObject>? eventFilter) => _$this._eventFilter = eventFilter;

  String? _userIdFilter;
  String? get userIdFilter => _$this._userIdFilter;
  set userIdFilter(covariant String? userIdFilter) => _$this._userIdFilter = userIdFilter;

  MapBuilder<String, String>? _headers;
  MapBuilder<String, String> get headers => _$this._headers ??= MapBuilder<String, String>();
  set headers(covariant MapBuilder<String, String>? headers) => _$this._headers = headers;

  String? _authMethod;
  String? get authMethod => _$this._authMethod;
  set authMethod(covariant String? authMethod) => _$this._authMethod = authMethod;

  MapBuilder<String, JsonObject>? _authData;
  MapBuilder<String, JsonObject> get authData => _$this._authData ??= MapBuilder<String, JsonObject>();
  set authData(covariant MapBuilder<String, JsonObject>? authData) => _$this._authData = authData;

  WebhookInfoBuilder() {
    WebhookInfo._defaults(this);
  }

  WebhookInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _httpMethod = $v.httpMethod;
      _uri = $v.uri;
      _event = $v.event;
      _eventFilter = $v.eventFilter?.toBuilder();
      _userIdFilter = $v.userIdFilter;
      _headers = $v.headers?.toBuilder();
      _authMethod = $v.authMethod;
      _authData = $v.authData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhookInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhookInfo;
  }

  @override
  void update(void Function(WebhookInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhookInfo build() => _build();

  _$WebhookInfo _build() {
    WebhookInfo._validate(this);
    _$WebhookInfo _$result;
    try {
      _$result = _$v ??
          _$WebhookInfo._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'WebhookInfo', 'id'),
              userId: BuiltValueNullFieldError.checkNotNull(userId, r'WebhookInfo', 'userId'),
              httpMethod: BuiltValueNullFieldError.checkNotNull(httpMethod, r'WebhookInfo', 'httpMethod'),
              uri: BuiltValueNullFieldError.checkNotNull(uri, r'WebhookInfo', 'uri'),
              event: event,
              eventFilter: _eventFilter?.build(),
              userIdFilter: userIdFilter,
              headers: _headers?.build(),
              authMethod: BuiltValueNullFieldError.checkNotNull(authMethod, r'WebhookInfo', 'authMethod'),
              authData: _authData?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'eventFilter';
        _eventFilter?.build();

        _$failedField = 'headers';
        _headers?.build();

        _$failedField = 'authData';
        _authData?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhookInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksIndexResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WebhooksIndexResponseApplicationJson_OcsInterface other);
  void update(void Function($WebhooksIndexResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  ListBuilder<WebhookInfo> get data;
  set data(ListBuilder<WebhookInfo>? data);
}

class _$WebhooksIndexResponseApplicationJson_Ocs extends WebhooksIndexResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final BuiltList<WebhookInfo> data;

  factory _$WebhooksIndexResponseApplicationJson_Ocs(
          [void Function(WebhooksIndexResponseApplicationJson_OcsBuilder)? updates]) =>
      (WebhooksIndexResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WebhooksIndexResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WebhooksIndexResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WebhooksIndexResponseApplicationJson_Ocs', 'data');
  }

  @override
  WebhooksIndexResponseApplicationJson_Ocs rebuild(
          void Function(WebhooksIndexResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksIndexResponseApplicationJson_OcsBuilder toBuilder() =>
      WebhooksIndexResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksIndexResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WebhooksIndexResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WebhooksIndexResponseApplicationJson_OcsBuilder
    implements
        Builder<WebhooksIndexResponseApplicationJson_Ocs, WebhooksIndexResponseApplicationJson_OcsBuilder>,
        $WebhooksIndexResponseApplicationJson_OcsInterfaceBuilder {
  _$WebhooksIndexResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<WebhookInfo>? _data;
  ListBuilder<WebhookInfo> get data => _$this._data ??= ListBuilder<WebhookInfo>();
  set data(covariant ListBuilder<WebhookInfo>? data) => _$this._data = data;

  WebhooksIndexResponseApplicationJson_OcsBuilder() {
    WebhooksIndexResponseApplicationJson_Ocs._defaults(this);
  }

  WebhooksIndexResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksIndexResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksIndexResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WebhooksIndexResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksIndexResponseApplicationJson_Ocs build() => _build();

  _$WebhooksIndexResponseApplicationJson_Ocs _build() {
    WebhooksIndexResponseApplicationJson_Ocs._validate(this);
    _$WebhooksIndexResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WebhooksIndexResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksIndexResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksIndexResponseApplicationJsonInterfaceBuilder {
  void replace($WebhooksIndexResponseApplicationJsonInterface other);
  void update(void Function($WebhooksIndexResponseApplicationJsonInterfaceBuilder) updates);
  WebhooksIndexResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WebhooksIndexResponseApplicationJson_OcsBuilder? ocs);
}

class _$WebhooksIndexResponseApplicationJson extends WebhooksIndexResponseApplicationJson {
  @override
  final WebhooksIndexResponseApplicationJson_Ocs ocs;

  factory _$WebhooksIndexResponseApplicationJson(
          [void Function(WebhooksIndexResponseApplicationJsonBuilder)? updates]) =>
      (WebhooksIndexResponseApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksIndexResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WebhooksIndexResponseApplicationJson', 'ocs');
  }

  @override
  WebhooksIndexResponseApplicationJson rebuild(void Function(WebhooksIndexResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksIndexResponseApplicationJsonBuilder toBuilder() =>
      WebhooksIndexResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksIndexResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WebhooksIndexResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WebhooksIndexResponseApplicationJsonBuilder
    implements
        Builder<WebhooksIndexResponseApplicationJson, WebhooksIndexResponseApplicationJsonBuilder>,
        $WebhooksIndexResponseApplicationJsonInterfaceBuilder {
  _$WebhooksIndexResponseApplicationJson? _$v;

  WebhooksIndexResponseApplicationJson_OcsBuilder? _ocs;
  WebhooksIndexResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WebhooksIndexResponseApplicationJson_OcsBuilder();
  set ocs(covariant WebhooksIndexResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WebhooksIndexResponseApplicationJsonBuilder() {
    WebhooksIndexResponseApplicationJson._defaults(this);
  }

  WebhooksIndexResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksIndexResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksIndexResponseApplicationJson;
  }

  @override
  void update(void Function(WebhooksIndexResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksIndexResponseApplicationJson build() => _build();

  _$WebhooksIndexResponseApplicationJson _build() {
    WebhooksIndexResponseApplicationJson._validate(this);
    _$WebhooksIndexResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WebhooksIndexResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksIndexResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksCreateRequestApplicationJsonInterfaceBuilder {
  void replace($WebhooksCreateRequestApplicationJsonInterface other);
  void update(void Function($WebhooksCreateRequestApplicationJsonInterfaceBuilder) updates);
  String? get httpMethod;
  set httpMethod(String? httpMethod);

  String? get uri;
  set uri(String? uri);

  String? get event;
  set event(String? event);

  MapBuilder<String, JsonObject> get eventFilter;
  set eventFilter(MapBuilder<String, JsonObject>? eventFilter);

  String? get userIdFilter;
  set userIdFilter(String? userIdFilter);

  MapBuilder<String, String> get headers;
  set headers(MapBuilder<String, String>? headers);

  WebhooksCreateRequestApplicationJson_AuthMethod? get authMethod;
  set authMethod(WebhooksCreateRequestApplicationJson_AuthMethod? authMethod);

  MapBuilder<String, JsonObject> get authData;
  set authData(MapBuilder<String, JsonObject>? authData);
}

class _$WebhooksCreateRequestApplicationJson extends WebhooksCreateRequestApplicationJson {
  @override
  final String httpMethod;
  @override
  final String uri;
  @override
  final String event;
  @override
  final BuiltMap<String, JsonObject>? eventFilter;
  @override
  final String? userIdFilter;
  @override
  final BuiltMap<String, String>? headers;
  @override
  final WebhooksCreateRequestApplicationJson_AuthMethod? authMethod;
  @override
  final BuiltMap<String, JsonObject>? authData;

  factory _$WebhooksCreateRequestApplicationJson(
          [void Function(WebhooksCreateRequestApplicationJsonBuilder)? updates]) =>
      (WebhooksCreateRequestApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksCreateRequestApplicationJson._(
      {required this.httpMethod,
      required this.uri,
      required this.event,
      this.eventFilter,
      this.userIdFilter,
      this.headers,
      this.authMethod,
      this.authData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(httpMethod, r'WebhooksCreateRequestApplicationJson', 'httpMethod');
    BuiltValueNullFieldError.checkNotNull(uri, r'WebhooksCreateRequestApplicationJson', 'uri');
    BuiltValueNullFieldError.checkNotNull(event, r'WebhooksCreateRequestApplicationJson', 'event');
  }

  @override
  WebhooksCreateRequestApplicationJson rebuild(void Function(WebhooksCreateRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksCreateRequestApplicationJsonBuilder toBuilder() =>
      WebhooksCreateRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksCreateRequestApplicationJson &&
        httpMethod == other.httpMethod &&
        uri == other.uri &&
        event == other.event &&
        eventFilter == other.eventFilter &&
        userIdFilter == other.userIdFilter &&
        headers == other.headers &&
        authMethod == other.authMethod &&
        authData == other.authData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, httpMethod.hashCode);
    _$hash = $jc(_$hash, uri.hashCode);
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, eventFilter.hashCode);
    _$hash = $jc(_$hash, userIdFilter.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, authMethod.hashCode);
    _$hash = $jc(_$hash, authData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebhooksCreateRequestApplicationJson')
          ..add('httpMethod', httpMethod)
          ..add('uri', uri)
          ..add('event', event)
          ..add('eventFilter', eventFilter)
          ..add('userIdFilter', userIdFilter)
          ..add('headers', headers)
          ..add('authMethod', authMethod)
          ..add('authData', authData))
        .toString();
  }
}

class WebhooksCreateRequestApplicationJsonBuilder
    implements
        Builder<WebhooksCreateRequestApplicationJson, WebhooksCreateRequestApplicationJsonBuilder>,
        $WebhooksCreateRequestApplicationJsonInterfaceBuilder {
  _$WebhooksCreateRequestApplicationJson? _$v;

  String? _httpMethod;
  String? get httpMethod => _$this._httpMethod;
  set httpMethod(covariant String? httpMethod) => _$this._httpMethod = httpMethod;

  String? _uri;
  String? get uri => _$this._uri;
  set uri(covariant String? uri) => _$this._uri = uri;

  String? _event;
  String? get event => _$this._event;
  set event(covariant String? event) => _$this._event = event;

  MapBuilder<String, JsonObject>? _eventFilter;
  MapBuilder<String, JsonObject> get eventFilter => _$this._eventFilter ??= MapBuilder<String, JsonObject>();
  set eventFilter(covariant MapBuilder<String, JsonObject>? eventFilter) => _$this._eventFilter = eventFilter;

  String? _userIdFilter;
  String? get userIdFilter => _$this._userIdFilter;
  set userIdFilter(covariant String? userIdFilter) => _$this._userIdFilter = userIdFilter;

  MapBuilder<String, String>? _headers;
  MapBuilder<String, String> get headers => _$this._headers ??= MapBuilder<String, String>();
  set headers(covariant MapBuilder<String, String>? headers) => _$this._headers = headers;

  WebhooksCreateRequestApplicationJson_AuthMethod? _authMethod;
  WebhooksCreateRequestApplicationJson_AuthMethod? get authMethod => _$this._authMethod;
  set authMethod(covariant WebhooksCreateRequestApplicationJson_AuthMethod? authMethod) =>
      _$this._authMethod = authMethod;

  MapBuilder<String, JsonObject>? _authData;
  MapBuilder<String, JsonObject> get authData => _$this._authData ??= MapBuilder<String, JsonObject>();
  set authData(covariant MapBuilder<String, JsonObject>? authData) => _$this._authData = authData;

  WebhooksCreateRequestApplicationJsonBuilder() {
    WebhooksCreateRequestApplicationJson._defaults(this);
  }

  WebhooksCreateRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _httpMethod = $v.httpMethod;
      _uri = $v.uri;
      _event = $v.event;
      _eventFilter = $v.eventFilter?.toBuilder();
      _userIdFilter = $v.userIdFilter;
      _headers = $v.headers?.toBuilder();
      _authMethod = $v.authMethod;
      _authData = $v.authData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksCreateRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksCreateRequestApplicationJson;
  }

  @override
  void update(void Function(WebhooksCreateRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksCreateRequestApplicationJson build() => _build();

  _$WebhooksCreateRequestApplicationJson _build() {
    WebhooksCreateRequestApplicationJson._validate(this);
    _$WebhooksCreateRequestApplicationJson _$result;
    try {
      _$result = _$v ??
          _$WebhooksCreateRequestApplicationJson._(
              httpMethod: BuiltValueNullFieldError.checkNotNull(
                  httpMethod, r'WebhooksCreateRequestApplicationJson', 'httpMethod'),
              uri: BuiltValueNullFieldError.checkNotNull(uri, r'WebhooksCreateRequestApplicationJson', 'uri'),
              event: BuiltValueNullFieldError.checkNotNull(event, r'WebhooksCreateRequestApplicationJson', 'event'),
              eventFilter: _eventFilter?.build(),
              userIdFilter: userIdFilter,
              headers: _headers?.build(),
              authMethod: authMethod,
              authData: _authData?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'eventFilter';
        _eventFilter?.build();

        _$failedField = 'headers';
        _headers?.build();

        _$failedField = 'authData';
        _authData?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksCreateRequestApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksCreateResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WebhooksCreateResponseApplicationJson_OcsInterface other);
  void update(void Function($WebhooksCreateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  WebhookInfoBuilder get data;
  set data(WebhookInfoBuilder? data);
}

class _$WebhooksCreateResponseApplicationJson_Ocs extends WebhooksCreateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final WebhookInfo data;

  factory _$WebhooksCreateResponseApplicationJson_Ocs(
          [void Function(WebhooksCreateResponseApplicationJson_OcsBuilder)? updates]) =>
      (WebhooksCreateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WebhooksCreateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WebhooksCreateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WebhooksCreateResponseApplicationJson_Ocs', 'data');
  }

  @override
  WebhooksCreateResponseApplicationJson_Ocs rebuild(
          void Function(WebhooksCreateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksCreateResponseApplicationJson_OcsBuilder toBuilder() =>
      WebhooksCreateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksCreateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WebhooksCreateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WebhooksCreateResponseApplicationJson_OcsBuilder
    implements
        Builder<WebhooksCreateResponseApplicationJson_Ocs, WebhooksCreateResponseApplicationJson_OcsBuilder>,
        $WebhooksCreateResponseApplicationJson_OcsInterfaceBuilder {
  _$WebhooksCreateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  WebhookInfoBuilder? _data;
  WebhookInfoBuilder get data => _$this._data ??= WebhookInfoBuilder();
  set data(covariant WebhookInfoBuilder? data) => _$this._data = data;

  WebhooksCreateResponseApplicationJson_OcsBuilder() {
    WebhooksCreateResponseApplicationJson_Ocs._defaults(this);
  }

  WebhooksCreateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksCreateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksCreateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WebhooksCreateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksCreateResponseApplicationJson_Ocs build() => _build();

  _$WebhooksCreateResponseApplicationJson_Ocs _build() {
    WebhooksCreateResponseApplicationJson_Ocs._validate(this);
    _$WebhooksCreateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WebhooksCreateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksCreateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksCreateResponseApplicationJsonInterfaceBuilder {
  void replace($WebhooksCreateResponseApplicationJsonInterface other);
  void update(void Function($WebhooksCreateResponseApplicationJsonInterfaceBuilder) updates);
  WebhooksCreateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WebhooksCreateResponseApplicationJson_OcsBuilder? ocs);
}

class _$WebhooksCreateResponseApplicationJson extends WebhooksCreateResponseApplicationJson {
  @override
  final WebhooksCreateResponseApplicationJson_Ocs ocs;

  factory _$WebhooksCreateResponseApplicationJson(
          [void Function(WebhooksCreateResponseApplicationJsonBuilder)? updates]) =>
      (WebhooksCreateResponseApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksCreateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WebhooksCreateResponseApplicationJson', 'ocs');
  }

  @override
  WebhooksCreateResponseApplicationJson rebuild(void Function(WebhooksCreateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksCreateResponseApplicationJsonBuilder toBuilder() =>
      WebhooksCreateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksCreateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WebhooksCreateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WebhooksCreateResponseApplicationJsonBuilder
    implements
        Builder<WebhooksCreateResponseApplicationJson, WebhooksCreateResponseApplicationJsonBuilder>,
        $WebhooksCreateResponseApplicationJsonInterfaceBuilder {
  _$WebhooksCreateResponseApplicationJson? _$v;

  WebhooksCreateResponseApplicationJson_OcsBuilder? _ocs;
  WebhooksCreateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WebhooksCreateResponseApplicationJson_OcsBuilder();
  set ocs(covariant WebhooksCreateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WebhooksCreateResponseApplicationJsonBuilder() {
    WebhooksCreateResponseApplicationJson._defaults(this);
  }

  WebhooksCreateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksCreateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksCreateResponseApplicationJson;
  }

  @override
  void update(void Function(WebhooksCreateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksCreateResponseApplicationJson build() => _build();

  _$WebhooksCreateResponseApplicationJson _build() {
    WebhooksCreateResponseApplicationJson._validate(this);
    _$WebhooksCreateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WebhooksCreateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksCreateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksShowResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WebhooksShowResponseApplicationJson_OcsInterface other);
  void update(void Function($WebhooksShowResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  WebhookInfoBuilder get data;
  set data(WebhookInfoBuilder? data);
}

class _$WebhooksShowResponseApplicationJson_Ocs extends WebhooksShowResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final WebhookInfo data;

  factory _$WebhooksShowResponseApplicationJson_Ocs(
          [void Function(WebhooksShowResponseApplicationJson_OcsBuilder)? updates]) =>
      (WebhooksShowResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WebhooksShowResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WebhooksShowResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WebhooksShowResponseApplicationJson_Ocs', 'data');
  }

  @override
  WebhooksShowResponseApplicationJson_Ocs rebuild(
          void Function(WebhooksShowResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksShowResponseApplicationJson_OcsBuilder toBuilder() =>
      WebhooksShowResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksShowResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WebhooksShowResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WebhooksShowResponseApplicationJson_OcsBuilder
    implements
        Builder<WebhooksShowResponseApplicationJson_Ocs, WebhooksShowResponseApplicationJson_OcsBuilder>,
        $WebhooksShowResponseApplicationJson_OcsInterfaceBuilder {
  _$WebhooksShowResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  WebhookInfoBuilder? _data;
  WebhookInfoBuilder get data => _$this._data ??= WebhookInfoBuilder();
  set data(covariant WebhookInfoBuilder? data) => _$this._data = data;

  WebhooksShowResponseApplicationJson_OcsBuilder() {
    WebhooksShowResponseApplicationJson_Ocs._defaults(this);
  }

  WebhooksShowResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksShowResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksShowResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WebhooksShowResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksShowResponseApplicationJson_Ocs build() => _build();

  _$WebhooksShowResponseApplicationJson_Ocs _build() {
    WebhooksShowResponseApplicationJson_Ocs._validate(this);
    _$WebhooksShowResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WebhooksShowResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksShowResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksShowResponseApplicationJsonInterfaceBuilder {
  void replace($WebhooksShowResponseApplicationJsonInterface other);
  void update(void Function($WebhooksShowResponseApplicationJsonInterfaceBuilder) updates);
  WebhooksShowResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WebhooksShowResponseApplicationJson_OcsBuilder? ocs);
}

class _$WebhooksShowResponseApplicationJson extends WebhooksShowResponseApplicationJson {
  @override
  final WebhooksShowResponseApplicationJson_Ocs ocs;

  factory _$WebhooksShowResponseApplicationJson([void Function(WebhooksShowResponseApplicationJsonBuilder)? updates]) =>
      (WebhooksShowResponseApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksShowResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WebhooksShowResponseApplicationJson', 'ocs');
  }

  @override
  WebhooksShowResponseApplicationJson rebuild(void Function(WebhooksShowResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksShowResponseApplicationJsonBuilder toBuilder() => WebhooksShowResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksShowResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WebhooksShowResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WebhooksShowResponseApplicationJsonBuilder
    implements
        Builder<WebhooksShowResponseApplicationJson, WebhooksShowResponseApplicationJsonBuilder>,
        $WebhooksShowResponseApplicationJsonInterfaceBuilder {
  _$WebhooksShowResponseApplicationJson? _$v;

  WebhooksShowResponseApplicationJson_OcsBuilder? _ocs;
  WebhooksShowResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WebhooksShowResponseApplicationJson_OcsBuilder();
  set ocs(covariant WebhooksShowResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WebhooksShowResponseApplicationJsonBuilder() {
    WebhooksShowResponseApplicationJson._defaults(this);
  }

  WebhooksShowResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksShowResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksShowResponseApplicationJson;
  }

  @override
  void update(void Function(WebhooksShowResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksShowResponseApplicationJson build() => _build();

  _$WebhooksShowResponseApplicationJson _build() {
    WebhooksShowResponseApplicationJson._validate(this);
    _$WebhooksShowResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WebhooksShowResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksShowResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksUpdateRequestApplicationJsonInterfaceBuilder {
  void replace($WebhooksUpdateRequestApplicationJsonInterface other);
  void update(void Function($WebhooksUpdateRequestApplicationJsonInterfaceBuilder) updates);
  String? get httpMethod;
  set httpMethod(String? httpMethod);

  String? get uri;
  set uri(String? uri);

  String? get event;
  set event(String? event);

  MapBuilder<String, JsonObject> get eventFilter;
  set eventFilter(MapBuilder<String, JsonObject>? eventFilter);

  String? get userIdFilter;
  set userIdFilter(String? userIdFilter);

  MapBuilder<String, String> get headers;
  set headers(MapBuilder<String, String>? headers);

  WebhooksUpdateRequestApplicationJson_AuthMethod? get authMethod;
  set authMethod(WebhooksUpdateRequestApplicationJson_AuthMethod? authMethod);

  MapBuilder<String, JsonObject> get authData;
  set authData(MapBuilder<String, JsonObject>? authData);
}

class _$WebhooksUpdateRequestApplicationJson extends WebhooksUpdateRequestApplicationJson {
  @override
  final String httpMethod;
  @override
  final String uri;
  @override
  final String event;
  @override
  final BuiltMap<String, JsonObject>? eventFilter;
  @override
  final String? userIdFilter;
  @override
  final BuiltMap<String, String>? headers;
  @override
  final WebhooksUpdateRequestApplicationJson_AuthMethod? authMethod;
  @override
  final BuiltMap<String, JsonObject>? authData;

  factory _$WebhooksUpdateRequestApplicationJson(
          [void Function(WebhooksUpdateRequestApplicationJsonBuilder)? updates]) =>
      (WebhooksUpdateRequestApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksUpdateRequestApplicationJson._(
      {required this.httpMethod,
      required this.uri,
      required this.event,
      this.eventFilter,
      this.userIdFilter,
      this.headers,
      this.authMethod,
      this.authData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(httpMethod, r'WebhooksUpdateRequestApplicationJson', 'httpMethod');
    BuiltValueNullFieldError.checkNotNull(uri, r'WebhooksUpdateRequestApplicationJson', 'uri');
    BuiltValueNullFieldError.checkNotNull(event, r'WebhooksUpdateRequestApplicationJson', 'event');
  }

  @override
  WebhooksUpdateRequestApplicationJson rebuild(void Function(WebhooksUpdateRequestApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksUpdateRequestApplicationJsonBuilder toBuilder() =>
      WebhooksUpdateRequestApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksUpdateRequestApplicationJson &&
        httpMethod == other.httpMethod &&
        uri == other.uri &&
        event == other.event &&
        eventFilter == other.eventFilter &&
        userIdFilter == other.userIdFilter &&
        headers == other.headers &&
        authMethod == other.authMethod &&
        authData == other.authData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, httpMethod.hashCode);
    _$hash = $jc(_$hash, uri.hashCode);
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, eventFilter.hashCode);
    _$hash = $jc(_$hash, userIdFilter.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, authMethod.hashCode);
    _$hash = $jc(_$hash, authData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebhooksUpdateRequestApplicationJson')
          ..add('httpMethod', httpMethod)
          ..add('uri', uri)
          ..add('event', event)
          ..add('eventFilter', eventFilter)
          ..add('userIdFilter', userIdFilter)
          ..add('headers', headers)
          ..add('authMethod', authMethod)
          ..add('authData', authData))
        .toString();
  }
}

class WebhooksUpdateRequestApplicationJsonBuilder
    implements
        Builder<WebhooksUpdateRequestApplicationJson, WebhooksUpdateRequestApplicationJsonBuilder>,
        $WebhooksUpdateRequestApplicationJsonInterfaceBuilder {
  _$WebhooksUpdateRequestApplicationJson? _$v;

  String? _httpMethod;
  String? get httpMethod => _$this._httpMethod;
  set httpMethod(covariant String? httpMethod) => _$this._httpMethod = httpMethod;

  String? _uri;
  String? get uri => _$this._uri;
  set uri(covariant String? uri) => _$this._uri = uri;

  String? _event;
  String? get event => _$this._event;
  set event(covariant String? event) => _$this._event = event;

  MapBuilder<String, JsonObject>? _eventFilter;
  MapBuilder<String, JsonObject> get eventFilter => _$this._eventFilter ??= MapBuilder<String, JsonObject>();
  set eventFilter(covariant MapBuilder<String, JsonObject>? eventFilter) => _$this._eventFilter = eventFilter;

  String? _userIdFilter;
  String? get userIdFilter => _$this._userIdFilter;
  set userIdFilter(covariant String? userIdFilter) => _$this._userIdFilter = userIdFilter;

  MapBuilder<String, String>? _headers;
  MapBuilder<String, String> get headers => _$this._headers ??= MapBuilder<String, String>();
  set headers(covariant MapBuilder<String, String>? headers) => _$this._headers = headers;

  WebhooksUpdateRequestApplicationJson_AuthMethod? _authMethod;
  WebhooksUpdateRequestApplicationJson_AuthMethod? get authMethod => _$this._authMethod;
  set authMethod(covariant WebhooksUpdateRequestApplicationJson_AuthMethod? authMethod) =>
      _$this._authMethod = authMethod;

  MapBuilder<String, JsonObject>? _authData;
  MapBuilder<String, JsonObject> get authData => _$this._authData ??= MapBuilder<String, JsonObject>();
  set authData(covariant MapBuilder<String, JsonObject>? authData) => _$this._authData = authData;

  WebhooksUpdateRequestApplicationJsonBuilder() {
    WebhooksUpdateRequestApplicationJson._defaults(this);
  }

  WebhooksUpdateRequestApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _httpMethod = $v.httpMethod;
      _uri = $v.uri;
      _event = $v.event;
      _eventFilter = $v.eventFilter?.toBuilder();
      _userIdFilter = $v.userIdFilter;
      _headers = $v.headers?.toBuilder();
      _authMethod = $v.authMethod;
      _authData = $v.authData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksUpdateRequestApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksUpdateRequestApplicationJson;
  }

  @override
  void update(void Function(WebhooksUpdateRequestApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksUpdateRequestApplicationJson build() => _build();

  _$WebhooksUpdateRequestApplicationJson _build() {
    WebhooksUpdateRequestApplicationJson._validate(this);
    _$WebhooksUpdateRequestApplicationJson _$result;
    try {
      _$result = _$v ??
          _$WebhooksUpdateRequestApplicationJson._(
              httpMethod: BuiltValueNullFieldError.checkNotNull(
                  httpMethod, r'WebhooksUpdateRequestApplicationJson', 'httpMethod'),
              uri: BuiltValueNullFieldError.checkNotNull(uri, r'WebhooksUpdateRequestApplicationJson', 'uri'),
              event: BuiltValueNullFieldError.checkNotNull(event, r'WebhooksUpdateRequestApplicationJson', 'event'),
              eventFilter: _eventFilter?.build(),
              userIdFilter: userIdFilter,
              headers: _headers?.build(),
              authMethod: authMethod,
              authData: _authData?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'eventFilter';
        _eventFilter?.build();

        _$failedField = 'headers';
        _headers?.build();

        _$failedField = 'authData';
        _authData?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksUpdateRequestApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksUpdateResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WebhooksUpdateResponseApplicationJson_OcsInterface other);
  void update(void Function($WebhooksUpdateResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  WebhookInfoBuilder get data;
  set data(WebhookInfoBuilder? data);
}

class _$WebhooksUpdateResponseApplicationJson_Ocs extends WebhooksUpdateResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final WebhookInfo data;

  factory _$WebhooksUpdateResponseApplicationJson_Ocs(
          [void Function(WebhooksUpdateResponseApplicationJson_OcsBuilder)? updates]) =>
      (WebhooksUpdateResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WebhooksUpdateResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WebhooksUpdateResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WebhooksUpdateResponseApplicationJson_Ocs', 'data');
  }

  @override
  WebhooksUpdateResponseApplicationJson_Ocs rebuild(
          void Function(WebhooksUpdateResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksUpdateResponseApplicationJson_OcsBuilder toBuilder() =>
      WebhooksUpdateResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksUpdateResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WebhooksUpdateResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WebhooksUpdateResponseApplicationJson_OcsBuilder
    implements
        Builder<WebhooksUpdateResponseApplicationJson_Ocs, WebhooksUpdateResponseApplicationJson_OcsBuilder>,
        $WebhooksUpdateResponseApplicationJson_OcsInterfaceBuilder {
  _$WebhooksUpdateResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  WebhookInfoBuilder? _data;
  WebhookInfoBuilder get data => _$this._data ??= WebhookInfoBuilder();
  set data(covariant WebhookInfoBuilder? data) => _$this._data = data;

  WebhooksUpdateResponseApplicationJson_OcsBuilder() {
    WebhooksUpdateResponseApplicationJson_Ocs._defaults(this);
  }

  WebhooksUpdateResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksUpdateResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksUpdateResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WebhooksUpdateResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksUpdateResponseApplicationJson_Ocs build() => _build();

  _$WebhooksUpdateResponseApplicationJson_Ocs _build() {
    WebhooksUpdateResponseApplicationJson_Ocs._validate(this);
    _$WebhooksUpdateResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ?? _$WebhooksUpdateResponseApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksUpdateResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksUpdateResponseApplicationJsonInterfaceBuilder {
  void replace($WebhooksUpdateResponseApplicationJsonInterface other);
  void update(void Function($WebhooksUpdateResponseApplicationJsonInterfaceBuilder) updates);
  WebhooksUpdateResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WebhooksUpdateResponseApplicationJson_OcsBuilder? ocs);
}

class _$WebhooksUpdateResponseApplicationJson extends WebhooksUpdateResponseApplicationJson {
  @override
  final WebhooksUpdateResponseApplicationJson_Ocs ocs;

  factory _$WebhooksUpdateResponseApplicationJson(
          [void Function(WebhooksUpdateResponseApplicationJsonBuilder)? updates]) =>
      (WebhooksUpdateResponseApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksUpdateResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WebhooksUpdateResponseApplicationJson', 'ocs');
  }

  @override
  WebhooksUpdateResponseApplicationJson rebuild(void Function(WebhooksUpdateResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksUpdateResponseApplicationJsonBuilder toBuilder() =>
      WebhooksUpdateResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksUpdateResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WebhooksUpdateResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WebhooksUpdateResponseApplicationJsonBuilder
    implements
        Builder<WebhooksUpdateResponseApplicationJson, WebhooksUpdateResponseApplicationJsonBuilder>,
        $WebhooksUpdateResponseApplicationJsonInterfaceBuilder {
  _$WebhooksUpdateResponseApplicationJson? _$v;

  WebhooksUpdateResponseApplicationJson_OcsBuilder? _ocs;
  WebhooksUpdateResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WebhooksUpdateResponseApplicationJson_OcsBuilder();
  set ocs(covariant WebhooksUpdateResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WebhooksUpdateResponseApplicationJsonBuilder() {
    WebhooksUpdateResponseApplicationJson._defaults(this);
  }

  WebhooksUpdateResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksUpdateResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksUpdateResponseApplicationJson;
  }

  @override
  void update(void Function(WebhooksUpdateResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksUpdateResponseApplicationJson build() => _build();

  _$WebhooksUpdateResponseApplicationJson _build() {
    WebhooksUpdateResponseApplicationJson._validate(this);
    _$WebhooksUpdateResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WebhooksUpdateResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksUpdateResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksDestroyResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WebhooksDestroyResponseApplicationJson_OcsInterface other);
  void update(void Function($WebhooksDestroyResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  bool? get data;
  set data(bool? data);
}

class _$WebhooksDestroyResponseApplicationJson_Ocs extends WebhooksDestroyResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final bool data;

  factory _$WebhooksDestroyResponseApplicationJson_Ocs(
          [void Function(WebhooksDestroyResponseApplicationJson_OcsBuilder)? updates]) =>
      (WebhooksDestroyResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WebhooksDestroyResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WebhooksDestroyResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WebhooksDestroyResponseApplicationJson_Ocs', 'data');
  }

  @override
  WebhooksDestroyResponseApplicationJson_Ocs rebuild(
          void Function(WebhooksDestroyResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksDestroyResponseApplicationJson_OcsBuilder toBuilder() =>
      WebhooksDestroyResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksDestroyResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WebhooksDestroyResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WebhooksDestroyResponseApplicationJson_OcsBuilder
    implements
        Builder<WebhooksDestroyResponseApplicationJson_Ocs, WebhooksDestroyResponseApplicationJson_OcsBuilder>,
        $WebhooksDestroyResponseApplicationJson_OcsInterfaceBuilder {
  _$WebhooksDestroyResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  bool? _data;
  bool? get data => _$this._data;
  set data(covariant bool? data) => _$this._data = data;

  WebhooksDestroyResponseApplicationJson_OcsBuilder() {
    WebhooksDestroyResponseApplicationJson_Ocs._defaults(this);
  }

  WebhooksDestroyResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksDestroyResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksDestroyResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WebhooksDestroyResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksDestroyResponseApplicationJson_Ocs build() => _build();

  _$WebhooksDestroyResponseApplicationJson_Ocs _build() {
    WebhooksDestroyResponseApplicationJson_Ocs._validate(this);
    _$WebhooksDestroyResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$WebhooksDestroyResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(data, r'WebhooksDestroyResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksDestroyResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksDestroyResponseApplicationJsonInterfaceBuilder {
  void replace($WebhooksDestroyResponseApplicationJsonInterface other);
  void update(void Function($WebhooksDestroyResponseApplicationJsonInterfaceBuilder) updates);
  WebhooksDestroyResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WebhooksDestroyResponseApplicationJson_OcsBuilder? ocs);
}

class _$WebhooksDestroyResponseApplicationJson extends WebhooksDestroyResponseApplicationJson {
  @override
  final WebhooksDestroyResponseApplicationJson_Ocs ocs;

  factory _$WebhooksDestroyResponseApplicationJson(
          [void Function(WebhooksDestroyResponseApplicationJsonBuilder)? updates]) =>
      (WebhooksDestroyResponseApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksDestroyResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WebhooksDestroyResponseApplicationJson', 'ocs');
  }

  @override
  WebhooksDestroyResponseApplicationJson rebuild(
          void Function(WebhooksDestroyResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksDestroyResponseApplicationJsonBuilder toBuilder() =>
      WebhooksDestroyResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksDestroyResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WebhooksDestroyResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WebhooksDestroyResponseApplicationJsonBuilder
    implements
        Builder<WebhooksDestroyResponseApplicationJson, WebhooksDestroyResponseApplicationJsonBuilder>,
        $WebhooksDestroyResponseApplicationJsonInterfaceBuilder {
  _$WebhooksDestroyResponseApplicationJson? _$v;

  WebhooksDestroyResponseApplicationJson_OcsBuilder? _ocs;
  WebhooksDestroyResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WebhooksDestroyResponseApplicationJson_OcsBuilder();
  set ocs(covariant WebhooksDestroyResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WebhooksDestroyResponseApplicationJsonBuilder() {
    WebhooksDestroyResponseApplicationJson._defaults(this);
  }

  WebhooksDestroyResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksDestroyResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksDestroyResponseApplicationJson;
  }

  @override
  void update(void Function(WebhooksDestroyResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksDestroyResponseApplicationJson build() => _build();

  _$WebhooksDestroyResponseApplicationJson _build() {
    WebhooksDestroyResponseApplicationJson._validate(this);
    _$WebhooksDestroyResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WebhooksDestroyResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksDestroyResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksDeleteByAppIdResponseApplicationJson_OcsInterfaceBuilder {
  void replace($WebhooksDeleteByAppIdResponseApplicationJson_OcsInterface other);
  void update(void Function($WebhooksDeleteByAppIdResponseApplicationJson_OcsInterfaceBuilder) updates);
  OCSMetaBuilder get meta;
  set meta(OCSMetaBuilder? meta);

  int? get data;
  set data(int? data);
}

class _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs extends WebhooksDeleteByAppIdResponseApplicationJson_Ocs {
  @override
  final OCSMeta meta;
  @override
  final int data;

  factory _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs(
          [void Function(WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder)? updates]) =>
      (WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder()..update(updates))._build();

  _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'WebhooksDeleteByAppIdResponseApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'WebhooksDeleteByAppIdResponseApplicationJson_Ocs', 'data');
  }

  @override
  WebhooksDeleteByAppIdResponseApplicationJson_Ocs rebuild(
          void Function(WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder toBuilder() =>
      WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksDeleteByAppIdResponseApplicationJson_Ocs && meta == other.meta && data == other.data;
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
    return (newBuiltValueToStringHelper(r'WebhooksDeleteByAppIdResponseApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder
    implements
        Builder<WebhooksDeleteByAppIdResponseApplicationJson_Ocs,
            WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder>,
        $WebhooksDeleteByAppIdResponseApplicationJson_OcsInterfaceBuilder {
  _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs? _$v;

  OCSMetaBuilder? _meta;
  OCSMetaBuilder get meta => _$this._meta ??= OCSMetaBuilder();
  set meta(covariant OCSMetaBuilder? meta) => _$this._meta = meta;

  int? _data;
  int? get data => _$this._data;
  set data(covariant int? data) => _$this._data = data;

  WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder() {
    WebhooksDeleteByAppIdResponseApplicationJson_Ocs._defaults(this);
  }

  WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksDeleteByAppIdResponseApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs;
  }

  @override
  void update(void Function(WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksDeleteByAppIdResponseApplicationJson_Ocs build() => _build();

  _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs _build() {
    WebhooksDeleteByAppIdResponseApplicationJson_Ocs._validate(this);
    _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$WebhooksDeleteByAppIdResponseApplicationJson_Ocs._(
              meta: meta.build(),
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'WebhooksDeleteByAppIdResponseApplicationJson_Ocs', 'data'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WebhooksDeleteByAppIdResponseApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class $WebhooksDeleteByAppIdResponseApplicationJsonInterfaceBuilder {
  void replace($WebhooksDeleteByAppIdResponseApplicationJsonInterface other);
  void update(void Function($WebhooksDeleteByAppIdResponseApplicationJsonInterfaceBuilder) updates);
  WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder get ocs;
  set ocs(WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder? ocs);
}

class _$WebhooksDeleteByAppIdResponseApplicationJson extends WebhooksDeleteByAppIdResponseApplicationJson {
  @override
  final WebhooksDeleteByAppIdResponseApplicationJson_Ocs ocs;

  factory _$WebhooksDeleteByAppIdResponseApplicationJson(
          [void Function(WebhooksDeleteByAppIdResponseApplicationJsonBuilder)? updates]) =>
      (WebhooksDeleteByAppIdResponseApplicationJsonBuilder()..update(updates))._build();

  _$WebhooksDeleteByAppIdResponseApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'WebhooksDeleteByAppIdResponseApplicationJson', 'ocs');
  }

  @override
  WebhooksDeleteByAppIdResponseApplicationJson rebuild(
          void Function(WebhooksDeleteByAppIdResponseApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebhooksDeleteByAppIdResponseApplicationJsonBuilder toBuilder() =>
      WebhooksDeleteByAppIdResponseApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebhooksDeleteByAppIdResponseApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'WebhooksDeleteByAppIdResponseApplicationJson')..add('ocs', ocs)).toString();
  }
}

class WebhooksDeleteByAppIdResponseApplicationJsonBuilder
    implements
        Builder<WebhooksDeleteByAppIdResponseApplicationJson, WebhooksDeleteByAppIdResponseApplicationJsonBuilder>,
        $WebhooksDeleteByAppIdResponseApplicationJsonInterfaceBuilder {
  _$WebhooksDeleteByAppIdResponseApplicationJson? _$v;

  WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder? _ocs;
  WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder();
  set ocs(covariant WebhooksDeleteByAppIdResponseApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  WebhooksDeleteByAppIdResponseApplicationJsonBuilder() {
    WebhooksDeleteByAppIdResponseApplicationJson._defaults(this);
  }

  WebhooksDeleteByAppIdResponseApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant WebhooksDeleteByAppIdResponseApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebhooksDeleteByAppIdResponseApplicationJson;
  }

  @override
  void update(void Function(WebhooksDeleteByAppIdResponseApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebhooksDeleteByAppIdResponseApplicationJson build() => _build();

  _$WebhooksDeleteByAppIdResponseApplicationJson _build() {
    WebhooksDeleteByAppIdResponseApplicationJson._validate(this);
    _$WebhooksDeleteByAppIdResponseApplicationJson _$result;
    try {
      _$result = _$v ?? _$WebhooksDeleteByAppIdResponseApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'WebhooksDeleteByAppIdResponseApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
