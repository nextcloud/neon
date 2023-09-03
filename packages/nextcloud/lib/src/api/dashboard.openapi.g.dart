// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DashboardOCSMeta> _$dashboardOCSMetaSerializer = _$DashboardOCSMetaSerializer();
Serializer<DashboardWidget_Buttons> _$dashboardWidgetButtonsSerializer = _$DashboardWidget_ButtonsSerializer();
Serializer<DashboardWidget> _$dashboardWidgetSerializer = _$DashboardWidgetSerializer();
Serializer<DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs>
    _$dashboardDashboardApiGetWidgetsResponse200ApplicationJsonOcsSerializer =
    _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsSerializer();
Serializer<DashboardDashboardApiGetWidgetsResponse200ApplicationJson>
    _$dashboardDashboardApiGetWidgetsResponse200ApplicationJsonSerializer =
    _$DashboardDashboardApiGetWidgetsResponse200ApplicationJsonSerializer();
Serializer<DashboardWidgetItem> _$dashboardWidgetItemSerializer = _$DashboardWidgetItemSerializer();
Serializer<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs>
    _$dashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonOcsSerializer =
    _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsSerializer();
Serializer<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson>
    _$dashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonSerializer =
    _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonSerializer();
Serializer<DashboardWidgetItems> _$dashboardWidgetItemsSerializer = _$DashboardWidgetItemsSerializer();
Serializer<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs>
    _$dashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonOcsSerializer =
    _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsSerializer();
Serializer<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson>
    _$dashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonSerializer =
    _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonSerializer();

class _$DashboardOCSMetaSerializer implements StructuredSerializer<DashboardOCSMeta> {
  @override
  final Iterable<Type> types = const [DashboardOCSMeta, _$DashboardOCSMeta];
  @override
  final String wireName = 'DashboardOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, DashboardOCSMeta object,
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
  DashboardOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardOCSMetaBuilder();

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

class _$DashboardWidget_ButtonsSerializer implements StructuredSerializer<DashboardWidget_Buttons> {
  @override
  final Iterable<Type> types = const [DashboardWidget_Buttons, _$DashboardWidget_Buttons];
  @override
  final String wireName = 'DashboardWidget_Buttons';

  @override
  Iterable<Object?> serialize(Serializers serializers, DashboardWidget_Buttons object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DashboardWidget_Buttons deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardWidget_ButtonsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardWidgetSerializer implements StructuredSerializer<DashboardWidget> {
  @override
  final Iterable<Type> types = const [DashboardWidget, _$DashboardWidget];
  @override
  final String wireName = 'DashboardWidget';

  @override
  Iterable<Object?> serialize(Serializers serializers, DashboardWidget object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(int)),
      'icon_class',
      serializers.serialize(object.iconClass, specifiedType: const FullType(String)),
      'icon_url',
      serializers.serialize(object.iconUrl, specifiedType: const FullType(String)),
      'item_icons_round',
      serializers.serialize(object.itemIconsRound, specifiedType: const FullType(bool)),
      'item_api_versions',
      serializers.serialize(object.itemApiVersions, specifiedType: const FullType(BuiltList, [FullType(int)])),
      'reload_interval',
      serializers.serialize(object.reloadInterval, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.widgetUrl;
    if (value != null) {
      result
        ..add('widget_url')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.buttons;
    if (value != null) {
      result
        ..add('buttons')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(DashboardWidget_Buttons)])));
    }
    return result;
  }

  @override
  DashboardWidget deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardWidgetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'icon_class':
          result.iconClass = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'icon_url':
          result.iconUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'widget_url':
          result.widgetUrl = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'item_icons_round':
          result.itemIconsRound = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'item_api_versions':
          result.itemApiVersions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(int)]))! as BuiltList<Object?>);
          break;
        case 'reload_interval':
          result.reloadInterval = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'buttons':
          result.buttons.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(DashboardWidget_Buttons)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs,
    _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(DashboardOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(DashboardWidget)])),
    ];

    return result;
  }

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(DashboardOCSMeta))! as DashboardOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(DashboardWidget)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardDashboardApiGetWidgetsResponse200ApplicationJsonSerializer
    implements StructuredSerializer<DashboardDashboardApiGetWidgetsResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    DashboardDashboardApiGetWidgetsResponse200ApplicationJson,
    _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson
  ];
  @override
  final String wireName = 'DashboardDashboardApiGetWidgetsResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, DashboardDashboardApiGetWidgetsResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs))!
              as DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardWidgetItemSerializer implements StructuredSerializer<DashboardWidgetItem> {
  @override
  final Iterable<Type> types = const [DashboardWidgetItem, _$DashboardWidgetItem];
  @override
  final String wireName = 'DashboardWidgetItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, DashboardWidgetItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'subtitle',
      serializers.serialize(object.subtitle, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'iconUrl',
      serializers.serialize(object.iconUrl, specifiedType: const FullType(String)),
      'overlayIconUrl',
      serializers.serialize(object.overlayIconUrl, specifiedType: const FullType(String)),
      'sinceId',
      serializers.serialize(object.sinceId, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DashboardWidgetItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardWidgetItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'subtitle':
          result.subtitle = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'overlayIconUrl':
          result.overlayIconUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'sinceId':
          result.sinceId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsSerializer
    implements StructuredSerializer<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs,
    _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(DashboardOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltMap, [
            FullType(String),
            FullType(BuiltList, [FullType(DashboardWidgetItem)])
          ])),
    ];

    return result;
  }

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(DashboardOCSMeta))! as DashboardOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(BuiltList, [FullType(DashboardWidgetItem)])
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonSerializer
    implements StructuredSerializer<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson,
    _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson
  ];
  @override
  final String wireName = 'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs))!
              as DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardWidgetItemsSerializer implements StructuredSerializer<DashboardWidgetItems> {
  @override
  final Iterable<Type> types = const [DashboardWidgetItems, _$DashboardWidgetItems];
  @override
  final String wireName = 'DashboardWidgetItems';

  @override
  Iterable<Object?> serialize(Serializers serializers, DashboardWidgetItems object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(DashboardWidgetItem)])),
      'emptyContentMessage',
      serializers.serialize(object.emptyContentMessage, specifiedType: const FullType(String)),
      'halfEmptyContentMessage',
      serializers.serialize(object.halfEmptyContentMessage, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DashboardWidgetItems deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardWidgetItemsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(DashboardWidgetItem)]))! as BuiltList<Object?>);
          break;
        case 'emptyContentMessage':
          result.emptyContentMessage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'halfEmptyContentMessage':
          result.halfEmptyContentMessage =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsSerializer
    implements StructuredSerializer<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs> {
  @override
  final Iterable<Type> types = const [
    DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs,
    _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs
  ];
  @override
  final String wireName = 'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(DashboardOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltMap, [FullType(String), FullType(DashboardWidgetItems)])),
    ];

    return result;
  }

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(DashboardOCSMeta))! as DashboardOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(DashboardWidgetItems)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonSerializer
    implements StructuredSerializer<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson,
    _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson
  ];
  @override
  final String wireName = 'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs)),
    ];

    return result;
  }

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs))!
              as DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs);
          break;
      }
    }

    return result.build();
  }
}

abstract mixin class DashboardOCSMetaInterfaceBuilder {
  void replace(DashboardOCSMetaInterface other);
  void update(void Function(DashboardOCSMetaInterfaceBuilder) updates);
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

class _$DashboardOCSMeta extends DashboardOCSMeta {
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

  factory _$DashboardOCSMeta([void Function(DashboardOCSMetaBuilder)? updates]) =>
      (DashboardOCSMetaBuilder()..update(updates))._build();

  _$DashboardOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'DashboardOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'DashboardOCSMeta', 'statuscode');
  }

  @override
  DashboardOCSMeta rebuild(void Function(DashboardOCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DashboardOCSMetaBuilder toBuilder() => DashboardOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardOCSMeta &&
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
    return (newBuiltValueToStringHelper(r'DashboardOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class DashboardOCSMetaBuilder
    implements Builder<DashboardOCSMeta, DashboardOCSMetaBuilder>, DashboardOCSMetaInterfaceBuilder {
  _$DashboardOCSMeta? _$v;

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

  DashboardOCSMetaBuilder();

  DashboardOCSMetaBuilder get _$this {
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
  void replace(covariant DashboardOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardOCSMeta;
  }

  @override
  void update(void Function(DashboardOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardOCSMeta build() => _build();

  _$DashboardOCSMeta _build() {
    final _$result = _$v ??
        _$DashboardOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'DashboardOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'DashboardOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardWidget_ButtonsInterfaceBuilder {
  void replace(DashboardWidget_ButtonsInterface other);
  void update(void Function(DashboardWidget_ButtonsInterfaceBuilder) updates);
  String? get type;
  set type(String? type);

  String? get text;
  set text(String? text);

  String? get link;
  set link(String? link);
}

class _$DashboardWidget_Buttons extends DashboardWidget_Buttons {
  @override
  final String type;
  @override
  final String text;
  @override
  final String link;

  factory _$DashboardWidget_Buttons([void Function(DashboardWidget_ButtonsBuilder)? updates]) =>
      (DashboardWidget_ButtonsBuilder()..update(updates))._build();

  _$DashboardWidget_Buttons._({required this.type, required this.text, required this.link}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'DashboardWidget_Buttons', 'type');
    BuiltValueNullFieldError.checkNotNull(text, r'DashboardWidget_Buttons', 'text');
    BuiltValueNullFieldError.checkNotNull(link, r'DashboardWidget_Buttons', 'link');
  }

  @override
  DashboardWidget_Buttons rebuild(void Function(DashboardWidget_ButtonsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardWidget_ButtonsBuilder toBuilder() => DashboardWidget_ButtonsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardWidget_Buttons && type == other.type && text == other.text && link == other.link;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DashboardWidget_Buttons')
          ..add('type', type)
          ..add('text', text)
          ..add('link', link))
        .toString();
  }
}

class DashboardWidget_ButtonsBuilder
    implements
        Builder<DashboardWidget_Buttons, DashboardWidget_ButtonsBuilder>,
        DashboardWidget_ButtonsInterfaceBuilder {
  _$DashboardWidget_Buttons? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _text;
  String? get text => _$this._text;
  set text(covariant String? text) => _$this._text = text;

  String? _link;
  String? get link => _$this._link;
  set link(covariant String? link) => _$this._link = link;

  DashboardWidget_ButtonsBuilder();

  DashboardWidget_ButtonsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _text = $v.text;
      _link = $v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardWidget_Buttons other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardWidget_Buttons;
  }

  @override
  void update(void Function(DashboardWidget_ButtonsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardWidget_Buttons build() => _build();

  _$DashboardWidget_Buttons _build() {
    final _$result = _$v ??
        _$DashboardWidget_Buttons._(
            type: BuiltValueNullFieldError.checkNotNull(type, r'DashboardWidget_Buttons', 'type'),
            text: BuiltValueNullFieldError.checkNotNull(text, r'DashboardWidget_Buttons', 'text'),
            link: BuiltValueNullFieldError.checkNotNull(link, r'DashboardWidget_Buttons', 'link'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardWidgetInterfaceBuilder {
  void replace(DashboardWidgetInterface other);
  void update(void Function(DashboardWidgetInterfaceBuilder) updates);
  String? get id;
  set id(String? id);

  String? get title;
  set title(String? title);

  int? get order;
  set order(int? order);

  String? get iconClass;
  set iconClass(String? iconClass);

  String? get iconUrl;
  set iconUrl(String? iconUrl);

  String? get widgetUrl;
  set widgetUrl(String? widgetUrl);

  bool? get itemIconsRound;
  set itemIconsRound(bool? itemIconsRound);

  ListBuilder<int> get itemApiVersions;
  set itemApiVersions(ListBuilder<int>? itemApiVersions);

  int? get reloadInterval;
  set reloadInterval(int? reloadInterval);

  ListBuilder<DashboardWidget_Buttons> get buttons;
  set buttons(ListBuilder<DashboardWidget_Buttons>? buttons);
}

class _$DashboardWidget extends DashboardWidget {
  @override
  final String id;
  @override
  final String title;
  @override
  final int order;
  @override
  final String iconClass;
  @override
  final String iconUrl;
  @override
  final String? widgetUrl;
  @override
  final bool itemIconsRound;
  @override
  final BuiltList<int> itemApiVersions;
  @override
  final int reloadInterval;
  @override
  final BuiltList<DashboardWidget_Buttons>? buttons;

  factory _$DashboardWidget([void Function(DashboardWidgetBuilder)? updates]) =>
      (DashboardWidgetBuilder()..update(updates))._build();

  _$DashboardWidget._(
      {required this.id,
      required this.title,
      required this.order,
      required this.iconClass,
      required this.iconUrl,
      this.widgetUrl,
      required this.itemIconsRound,
      required this.itemApiVersions,
      required this.reloadInterval,
      this.buttons})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DashboardWidget', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'DashboardWidget', 'title');
    BuiltValueNullFieldError.checkNotNull(order, r'DashboardWidget', 'order');
    BuiltValueNullFieldError.checkNotNull(iconClass, r'DashboardWidget', 'iconClass');
    BuiltValueNullFieldError.checkNotNull(iconUrl, r'DashboardWidget', 'iconUrl');
    BuiltValueNullFieldError.checkNotNull(itemIconsRound, r'DashboardWidget', 'itemIconsRound');
    BuiltValueNullFieldError.checkNotNull(itemApiVersions, r'DashboardWidget', 'itemApiVersions');
    BuiltValueNullFieldError.checkNotNull(reloadInterval, r'DashboardWidget', 'reloadInterval');
  }

  @override
  DashboardWidget rebuild(void Function(DashboardWidgetBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  DashboardWidgetBuilder toBuilder() => DashboardWidgetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardWidget &&
        id == other.id &&
        title == other.title &&
        order == other.order &&
        iconClass == other.iconClass &&
        iconUrl == other.iconUrl &&
        widgetUrl == other.widgetUrl &&
        itemIconsRound == other.itemIconsRound &&
        itemApiVersions == other.itemApiVersions &&
        reloadInterval == other.reloadInterval &&
        buttons == other.buttons;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, iconClass.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, widgetUrl.hashCode);
    _$hash = $jc(_$hash, itemIconsRound.hashCode);
    _$hash = $jc(_$hash, itemApiVersions.hashCode);
    _$hash = $jc(_$hash, reloadInterval.hashCode);
    _$hash = $jc(_$hash, buttons.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DashboardWidget')
          ..add('id', id)
          ..add('title', title)
          ..add('order', order)
          ..add('iconClass', iconClass)
          ..add('iconUrl', iconUrl)
          ..add('widgetUrl', widgetUrl)
          ..add('itemIconsRound', itemIconsRound)
          ..add('itemApiVersions', itemApiVersions)
          ..add('reloadInterval', reloadInterval)
          ..add('buttons', buttons))
        .toString();
  }
}

class DashboardWidgetBuilder
    implements Builder<DashboardWidget, DashboardWidgetBuilder>, DashboardWidgetInterfaceBuilder {
  _$DashboardWidget? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  int? _order;
  int? get order => _$this._order;
  set order(covariant int? order) => _$this._order = order;

  String? _iconClass;
  String? get iconClass => _$this._iconClass;
  set iconClass(covariant String? iconClass) => _$this._iconClass = iconClass;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(covariant String? iconUrl) => _$this._iconUrl = iconUrl;

  String? _widgetUrl;
  String? get widgetUrl => _$this._widgetUrl;
  set widgetUrl(covariant String? widgetUrl) => _$this._widgetUrl = widgetUrl;

  bool? _itemIconsRound;
  bool? get itemIconsRound => _$this._itemIconsRound;
  set itemIconsRound(covariant bool? itemIconsRound) => _$this._itemIconsRound = itemIconsRound;

  ListBuilder<int>? _itemApiVersions;
  ListBuilder<int> get itemApiVersions => _$this._itemApiVersions ??= ListBuilder<int>();
  set itemApiVersions(covariant ListBuilder<int>? itemApiVersions) => _$this._itemApiVersions = itemApiVersions;

  int? _reloadInterval;
  int? get reloadInterval => _$this._reloadInterval;
  set reloadInterval(covariant int? reloadInterval) => _$this._reloadInterval = reloadInterval;

  ListBuilder<DashboardWidget_Buttons>? _buttons;
  ListBuilder<DashboardWidget_Buttons> get buttons => _$this._buttons ??= ListBuilder<DashboardWidget_Buttons>();
  set buttons(covariant ListBuilder<DashboardWidget_Buttons>? buttons) => _$this._buttons = buttons;

  DashboardWidgetBuilder();

  DashboardWidgetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _order = $v.order;
      _iconClass = $v.iconClass;
      _iconUrl = $v.iconUrl;
      _widgetUrl = $v.widgetUrl;
      _itemIconsRound = $v.itemIconsRound;
      _itemApiVersions = $v.itemApiVersions.toBuilder();
      _reloadInterval = $v.reloadInterval;
      _buttons = $v.buttons?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardWidget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardWidget;
  }

  @override
  void update(void Function(DashboardWidgetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardWidget build() => _build();

  _$DashboardWidget _build() {
    _$DashboardWidget _$result;
    try {
      _$result = _$v ??
          _$DashboardWidget._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'DashboardWidget', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'DashboardWidget', 'title'),
              order: BuiltValueNullFieldError.checkNotNull(order, r'DashboardWidget', 'order'),
              iconClass: BuiltValueNullFieldError.checkNotNull(iconClass, r'DashboardWidget', 'iconClass'),
              iconUrl: BuiltValueNullFieldError.checkNotNull(iconUrl, r'DashboardWidget', 'iconUrl'),
              widgetUrl: widgetUrl,
              itemIconsRound:
                  BuiltValueNullFieldError.checkNotNull(itemIconsRound, r'DashboardWidget', 'itemIconsRound'),
              itemApiVersions: itemApiVersions.build(),
              reloadInterval:
                  BuiltValueNullFieldError.checkNotNull(reloadInterval, r'DashboardWidget', 'reloadInterval'),
              buttons: _buttons?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'itemApiVersions';
        itemApiVersions.build();

        _$failedField = 'buttons';
        _buttons?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DashboardWidget', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsInterface other);
  void update(void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  DashboardOCSMetaBuilder get meta;
  set meta(DashboardOCSMetaBuilder? meta);

  ListBuilder<DashboardWidget> get data;
  set data(ListBuilder<DashboardWidget>? data);
}

class _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs
    extends DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs {
  @override
  final DashboardOCSMeta meta;
  @override
  final BuiltList<DashboardWidget> data;

  factory _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs(
          [void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs rebuild(
          void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder toBuilder() =>
      DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder
    implements
        Builder<DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs,
            DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder>,
        DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsInterfaceBuilder {
  _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs? _$v;

  DashboardOCSMetaBuilder? _meta;
  DashboardOCSMetaBuilder get meta => _$this._meta ??= DashboardOCSMetaBuilder();
  set meta(covariant DashboardOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<DashboardWidget>? _data;
  ListBuilder<DashboardWidget> get data => _$this._data ??= ListBuilder<DashboardWidget>();
  set data(covariant ListBuilder<DashboardWidget>? data) => _$this._data = data;

  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder();

  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs build() => _build();

  _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs _build() {
    _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardDashboardApiGetWidgetsResponse200ApplicationJsonInterfaceBuilder {
  void replace(DashboardDashboardApiGetWidgetsResponse200ApplicationJsonInterface other);
  void update(void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJsonInterfaceBuilder) updates);
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson
    extends DashboardDashboardApiGetWidgetsResponse200ApplicationJson {
  @override
  final DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs ocs;

  factory _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson(
          [void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder)? updates]) =>
      (DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DashboardDashboardApiGetWidgetsResponse200ApplicationJson', 'ocs');
  }

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson rebuild(
          void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder toBuilder() =>
      DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardDashboardApiGetWidgetsResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DashboardDashboardApiGetWidgetsResponse200ApplicationJson')..add('ocs', ocs))
        .toString();
  }
}

class DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder
    implements
        Builder<DashboardDashboardApiGetWidgetsResponse200ApplicationJson,
            DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder>,
        DashboardDashboardApiGetWidgetsResponse200ApplicationJsonInterfaceBuilder {
  _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson? _$v;

  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder? _ocs;
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder();

  DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardDashboardApiGetWidgetsResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson;
  }

  @override
  void update(void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson build() => _build();

  _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson _build() {
    _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DashboardDashboardApiGetWidgetsResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardWidgetItemInterfaceBuilder {
  void replace(DashboardWidgetItemInterface other);
  void update(void Function(DashboardWidgetItemInterfaceBuilder) updates);
  String? get subtitle;
  set subtitle(String? subtitle);

  String? get title;
  set title(String? title);

  String? get link;
  set link(String? link);

  String? get iconUrl;
  set iconUrl(String? iconUrl);

  String? get overlayIconUrl;
  set overlayIconUrl(String? overlayIconUrl);

  String? get sinceId;
  set sinceId(String? sinceId);
}

class _$DashboardWidgetItem extends DashboardWidgetItem {
  @override
  final String subtitle;
  @override
  final String title;
  @override
  final String link;
  @override
  final String iconUrl;
  @override
  final String overlayIconUrl;
  @override
  final String sinceId;

  factory _$DashboardWidgetItem([void Function(DashboardWidgetItemBuilder)? updates]) =>
      (DashboardWidgetItemBuilder()..update(updates))._build();

  _$DashboardWidgetItem._(
      {required this.subtitle,
      required this.title,
      required this.link,
      required this.iconUrl,
      required this.overlayIconUrl,
      required this.sinceId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(subtitle, r'DashboardWidgetItem', 'subtitle');
    BuiltValueNullFieldError.checkNotNull(title, r'DashboardWidgetItem', 'title');
    BuiltValueNullFieldError.checkNotNull(link, r'DashboardWidgetItem', 'link');
    BuiltValueNullFieldError.checkNotNull(iconUrl, r'DashboardWidgetItem', 'iconUrl');
    BuiltValueNullFieldError.checkNotNull(overlayIconUrl, r'DashboardWidgetItem', 'overlayIconUrl');
    BuiltValueNullFieldError.checkNotNull(sinceId, r'DashboardWidgetItem', 'sinceId');
  }

  @override
  DashboardWidgetItem rebuild(void Function(DashboardWidgetItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardWidgetItemBuilder toBuilder() => DashboardWidgetItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardWidgetItem &&
        subtitle == other.subtitle &&
        title == other.title &&
        link == other.link &&
        iconUrl == other.iconUrl &&
        overlayIconUrl == other.overlayIconUrl &&
        sinceId == other.sinceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subtitle.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jc(_$hash, overlayIconUrl.hashCode);
    _$hash = $jc(_$hash, sinceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DashboardWidgetItem')
          ..add('subtitle', subtitle)
          ..add('title', title)
          ..add('link', link)
          ..add('iconUrl', iconUrl)
          ..add('overlayIconUrl', overlayIconUrl)
          ..add('sinceId', sinceId))
        .toString();
  }
}

class DashboardWidgetItemBuilder
    implements Builder<DashboardWidgetItem, DashboardWidgetItemBuilder>, DashboardWidgetItemInterfaceBuilder {
  _$DashboardWidgetItem? _$v;

  String? _subtitle;
  String? get subtitle => _$this._subtitle;
  set subtitle(covariant String? subtitle) => _$this._subtitle = subtitle;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _link;
  String? get link => _$this._link;
  set link(covariant String? link) => _$this._link = link;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(covariant String? iconUrl) => _$this._iconUrl = iconUrl;

  String? _overlayIconUrl;
  String? get overlayIconUrl => _$this._overlayIconUrl;
  set overlayIconUrl(covariant String? overlayIconUrl) => _$this._overlayIconUrl = overlayIconUrl;

  String? _sinceId;
  String? get sinceId => _$this._sinceId;
  set sinceId(covariant String? sinceId) => _$this._sinceId = sinceId;

  DashboardWidgetItemBuilder();

  DashboardWidgetItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subtitle = $v.subtitle;
      _title = $v.title;
      _link = $v.link;
      _iconUrl = $v.iconUrl;
      _overlayIconUrl = $v.overlayIconUrl;
      _sinceId = $v.sinceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardWidgetItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardWidgetItem;
  }

  @override
  void update(void Function(DashboardWidgetItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardWidgetItem build() => _build();

  _$DashboardWidgetItem _build() {
    final _$result = _$v ??
        _$DashboardWidgetItem._(
            subtitle: BuiltValueNullFieldError.checkNotNull(subtitle, r'DashboardWidgetItem', 'subtitle'),
            title: BuiltValueNullFieldError.checkNotNull(title, r'DashboardWidgetItem', 'title'),
            link: BuiltValueNullFieldError.checkNotNull(link, r'DashboardWidgetItem', 'link'),
            iconUrl: BuiltValueNullFieldError.checkNotNull(iconUrl, r'DashboardWidgetItem', 'iconUrl'),
            overlayIconUrl:
                BuiltValueNullFieldError.checkNotNull(overlayIconUrl, r'DashboardWidgetItem', 'overlayIconUrl'),
            sinceId: BuiltValueNullFieldError.checkNotNull(sinceId, r'DashboardWidgetItem', 'sinceId'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsInterfaceBuilder {
  void replace(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsInterface other);
  void update(void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsInterfaceBuilder) updates);
  DashboardOCSMetaBuilder get meta;
  set meta(DashboardOCSMetaBuilder? meta);

  MapBuilder<String, BuiltList<DashboardWidgetItem>> get data;
  set data(MapBuilder<String, BuiltList<DashboardWidgetItem>>? data);
}

class _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs
    extends DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs {
  @override
  final DashboardOCSMeta meta;
  @override
  final BuiltMap<String, BuiltList<DashboardWidgetItem>> data;

  factory _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs(
          [void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder)? updates]) =>
      (DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs', 'data');
  }

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs rebuild(
          void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder toBuilder() =>
      DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder
    implements
        Builder<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs,
            DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder>,
        DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsInterfaceBuilder {
  _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs? _$v;

  DashboardOCSMetaBuilder? _meta;
  DashboardOCSMetaBuilder get meta => _$this._meta ??= DashboardOCSMetaBuilder();
  set meta(covariant DashboardOCSMetaBuilder? meta) => _$this._meta = meta;

  MapBuilder<String, BuiltList<DashboardWidgetItem>>? _data;
  MapBuilder<String, BuiltList<DashboardWidgetItem>> get data =>
      _$this._data ??= MapBuilder<String, BuiltList<DashboardWidgetItem>>();
  set data(covariant MapBuilder<String, BuiltList<DashboardWidgetItem>>? data) => _$this._data = data;

  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder();

  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs build() => _build();

  _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs _build() {
    _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonInterfaceBuilder {
  void replace(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonInterface other);
  void update(void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonInterfaceBuilder) updates);
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder get ocs;
  set ocs(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder? ocs);
}

class _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson
    extends DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson {
  @override
  final DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs ocs;

  factory _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson(
          [void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder)? updates]) =>
      (DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson', 'ocs');
  }

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson rebuild(
          void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder toBuilder() =>
      DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder
    implements
        Builder<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson,
            DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder>,
        DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonInterfaceBuilder {
  _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson? _$v;

  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder? _ocs;
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder();
  set ocs(covariant DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder? ocs) => _$this._ocs = ocs;

  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder();

  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson;
  }

  @override
  void update(void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson build() => _build();

  _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson _build() {
    _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardWidgetItemsInterfaceBuilder {
  void replace(DashboardWidgetItemsInterface other);
  void update(void Function(DashboardWidgetItemsInterfaceBuilder) updates);
  ListBuilder<DashboardWidgetItem> get items;
  set items(ListBuilder<DashboardWidgetItem>? items);

  String? get emptyContentMessage;
  set emptyContentMessage(String? emptyContentMessage);

  String? get halfEmptyContentMessage;
  set halfEmptyContentMessage(String? halfEmptyContentMessage);
}

class _$DashboardWidgetItems extends DashboardWidgetItems {
  @override
  final BuiltList<DashboardWidgetItem> items;
  @override
  final String emptyContentMessage;
  @override
  final String halfEmptyContentMessage;

  factory _$DashboardWidgetItems([void Function(DashboardWidgetItemsBuilder)? updates]) =>
      (DashboardWidgetItemsBuilder()..update(updates))._build();

  _$DashboardWidgetItems._(
      {required this.items, required this.emptyContentMessage, required this.halfEmptyContentMessage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'DashboardWidgetItems', 'items');
    BuiltValueNullFieldError.checkNotNull(emptyContentMessage, r'DashboardWidgetItems', 'emptyContentMessage');
    BuiltValueNullFieldError.checkNotNull(halfEmptyContentMessage, r'DashboardWidgetItems', 'halfEmptyContentMessage');
  }

  @override
  DashboardWidgetItems rebuild(void Function(DashboardWidgetItemsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardWidgetItemsBuilder toBuilder() => DashboardWidgetItemsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardWidgetItems &&
        items == other.items &&
        emptyContentMessage == other.emptyContentMessage &&
        halfEmptyContentMessage == other.halfEmptyContentMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, emptyContentMessage.hashCode);
    _$hash = $jc(_$hash, halfEmptyContentMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DashboardWidgetItems')
          ..add('items', items)
          ..add('emptyContentMessage', emptyContentMessage)
          ..add('halfEmptyContentMessage', halfEmptyContentMessage))
        .toString();
  }
}

class DashboardWidgetItemsBuilder
    implements Builder<DashboardWidgetItems, DashboardWidgetItemsBuilder>, DashboardWidgetItemsInterfaceBuilder {
  _$DashboardWidgetItems? _$v;

  ListBuilder<DashboardWidgetItem>? _items;
  ListBuilder<DashboardWidgetItem> get items => _$this._items ??= ListBuilder<DashboardWidgetItem>();
  set items(covariant ListBuilder<DashboardWidgetItem>? items) => _$this._items = items;

  String? _emptyContentMessage;
  String? get emptyContentMessage => _$this._emptyContentMessage;
  set emptyContentMessage(covariant String? emptyContentMessage) => _$this._emptyContentMessage = emptyContentMessage;

  String? _halfEmptyContentMessage;
  String? get halfEmptyContentMessage => _$this._halfEmptyContentMessage;
  set halfEmptyContentMessage(covariant String? halfEmptyContentMessage) =>
      _$this._halfEmptyContentMessage = halfEmptyContentMessage;

  DashboardWidgetItemsBuilder();

  DashboardWidgetItemsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _emptyContentMessage = $v.emptyContentMessage;
      _halfEmptyContentMessage = $v.halfEmptyContentMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardWidgetItems other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardWidgetItems;
  }

  @override
  void update(void Function(DashboardWidgetItemsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardWidgetItems build() => _build();

  _$DashboardWidgetItems _build() {
    _$DashboardWidgetItems _$result;
    try {
      _$result = _$v ??
          _$DashboardWidgetItems._(
              items: items.build(),
              emptyContentMessage: BuiltValueNullFieldError.checkNotNull(
                  emptyContentMessage, r'DashboardWidgetItems', 'emptyContentMessage'),
              halfEmptyContentMessage: BuiltValueNullFieldError.checkNotNull(
                  halfEmptyContentMessage, r'DashboardWidgetItems', 'halfEmptyContentMessage'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'DashboardWidgetItems', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsInterfaceBuilder {
  void replace(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsInterface other);
  void update(
      void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsInterfaceBuilder) updates);
  DashboardOCSMetaBuilder get meta;
  set meta(DashboardOCSMetaBuilder? meta);

  MapBuilder<String, DashboardWidgetItems> get data;
  set data(MapBuilder<String, DashboardWidgetItems>? data);
}

class _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs
    extends DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs {
  @override
  final DashboardOCSMeta meta;
  @override
  final BuiltMap<String, DashboardWidgetItems> data;

  factory _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs(
          [void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder)? updates]) =>
      (DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder()..update(updates))._build();

  _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs._({required this.meta, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        meta, r'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(
        data, r'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs', 'data');
  }

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs rebuild(
          void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder toBuilder() =>
      DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs &&
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
    return (newBuiltValueToStringHelper(r'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder
    implements
        Builder<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs,
            DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder>,
        DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsInterfaceBuilder {
  _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs? _$v;

  DashboardOCSMetaBuilder? _meta;
  DashboardOCSMetaBuilder get meta => _$this._meta ??= DashboardOCSMetaBuilder();
  set meta(covariant DashboardOCSMetaBuilder? meta) => _$this._meta = meta;

  MapBuilder<String, DashboardWidgetItems>? _data;
  MapBuilder<String, DashboardWidgetItems> get data => _$this._data ??= MapBuilder<String, DashboardWidgetItems>();
  set data(covariant MapBuilder<String, DashboardWidgetItems>? data) => _$this._data = data;

  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder();

  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs;
  }

  @override
  void update(void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs build() => _build();

  _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs _build() {
    _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs _$result;
    try {
      _$result = _$v ??
          _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs._(
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
            r'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonInterfaceBuilder {
  void replace(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonInterface other);
  void update(void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonInterfaceBuilder) updates);
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder get ocs;
  set ocs(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder? ocs);
}

class _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson
    extends DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson {
  @override
  final DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs ocs;

  factory _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson(
          [void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder)? updates]) =>
      (DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder()..update(updates))._build();

  _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ocs, r'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson', 'ocs');
  }

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson rebuild(
          void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder toBuilder() =>
      DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson && ocs == other.ocs;
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
    return (newBuiltValueToStringHelper(r'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson')
          ..add('ocs', ocs))
        .toString();
  }
}

class DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder
    implements
        Builder<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson,
            DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder>,
        DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonInterfaceBuilder {
  _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson? _$v;

  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder? _ocs;
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder get ocs =>
      _$this._ocs ??= DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder();
  set ocs(covariant DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder? ocs) =>
      _$this._ocs = ocs;

  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder();

  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson;
  }

  @override
  void update(void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson build() => _build();

  _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson _build() {
    _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson _$result;
    try {
      _$result = _$v ?? _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
