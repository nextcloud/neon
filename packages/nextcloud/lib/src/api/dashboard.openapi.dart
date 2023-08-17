// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'dashboard.openapi.g.dart';

class DashboardResponse<T, U> extends DynamiteResponse<T, U> {
  DashboardResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'DashboardResponse(data: $data, headers: $headers)';
}

class DashboardApiException extends DynamiteApiException {
  DashboardApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<DashboardApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return DashboardApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'DashboardApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class DashboardClient extends DynamiteClient {
  DashboardClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  DashboardClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  DashboardDashboardApiClient get dashboardApi => DashboardDashboardApiClient(this);
}

class DashboardDashboardApiClient {
  DashboardDashboardApiClient(this._rootClient);

  final DashboardClient _rootClient;

  /// Get the widgets
  Future<DashboardDashboardApiGetWidgetsResponse200ApplicationJson> getWidgets({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/dashboard/api/v1/widgets';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(DashboardDashboardApiGetWidgetsResponse200ApplicationJson),
      )! as DashboardDashboardApiGetWidgetsResponse200ApplicationJson;
    }
    throw await DashboardApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the items for the widgets
  Future<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson> getWidgetItems({
    final ContentString<BuiltMap<String, String>>? sinceIds,
    final int limit = 7,
    final List<String> widgets = const [],
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/dashboard/api/v1/widget-items';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (sinceIds != null) {
      queryParameters['sinceIds'] = _jsonSerializers.serialize(
        sinceIds,
        specifiedType: const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(String)]),
        ]),
      );
    }
    if (limit != 7) {
      queryParameters['limit'] = limit.toString();
    }
    if (widgets != const []) {
      queryParameters['widgets[]'] = widgets.map((final e) => e);
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson),
      )! as DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson;
    }
    throw await DashboardApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the items for the widgets
  Future<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson> getWidgetItemsV2({
    final ContentString<BuiltMap<String, String>>? sinceIds,
    final int limit = 7,
    final List<String> widgets = const [],
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/dashboard/api/v2/widget-items';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (sinceIds != null) {
      queryParameters['sinceIds'] = _jsonSerializers.serialize(
        sinceIds,
        specifiedType: const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(String)]),
        ]),
      );
    }
    if (limit != 7) {
      queryParameters['limit'] = limit.toString();
    }
    if (widgets != const []) {
      queryParameters['widgets[]'] = widgets.map((final e) => e);
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson),
      )! as DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson;
    }
    throw await DashboardApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class DashboardOCSMeta implements Built<DashboardOCSMeta, DashboardOCSMetaBuilder> {
  factory DashboardOCSMeta([final void Function(DashboardOCSMetaBuilder)? b]) = _$DashboardOCSMeta;

  // coverage:ignore-start
  const DashboardOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<DashboardOCSMeta> get serializer => _$dashboardOCSMetaSerializer;
}

abstract class DashboardWidget_Buttons implements Built<DashboardWidget_Buttons, DashboardWidget_ButtonsBuilder> {
  factory DashboardWidget_Buttons([final void Function(DashboardWidget_ButtonsBuilder)? b]) = _$DashboardWidget_Buttons;

  // coverage:ignore-start
  const DashboardWidget_Buttons._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardWidget_Buttons.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get type;
  String get text;
  String get link;
  static Serializer<DashboardWidget_Buttons> get serializer => _$dashboardWidgetButtonsSerializer;
}

abstract class DashboardWidget implements Built<DashboardWidget, DashboardWidgetBuilder> {
  factory DashboardWidget([final void Function(DashboardWidgetBuilder)? b]) = _$DashboardWidget;

  // coverage:ignore-start
  const DashboardWidget._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardWidget.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get id;
  String get title;
  int get order;
  @BuiltValueField(wireName: 'icon_class')
  String get iconClass;
  @BuiltValueField(wireName: 'icon_url')
  String get iconUrl;
  @BuiltValueField(wireName: 'widget_url')
  String? get widgetUrl;
  @BuiltValueField(wireName: 'item_icons_round')
  bool get itemIconsRound;
  @BuiltValueField(wireName: 'item_api_versions')
  BuiltList<int> get itemApiVersions;
  @BuiltValueField(wireName: 'reload_interval')
  int get reloadInterval;
  BuiltList<DashboardWidget_Buttons>? get buttons;
  static Serializer<DashboardWidget> get serializer => _$dashboardWidgetSerializer;
}

abstract class DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs
    implements
        Built<DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs,
            DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder> {
  factory DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs([
    final void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  DashboardOCSMeta get meta;
  BuiltList<DashboardWidget> get data;
  static Serializer<DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs> get serializer =>
      _$dashboardDashboardApiGetWidgetsResponse200ApplicationJsonOcsSerializer;
}

abstract class DashboardDashboardApiGetWidgetsResponse200ApplicationJson
    implements
        Built<DashboardDashboardApiGetWidgetsResponse200ApplicationJson,
            DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder> {
  factory DashboardDashboardApiGetWidgetsResponse200ApplicationJson([
    final void Function(DashboardDashboardApiGetWidgetsResponse200ApplicationJsonBuilder)? b,
  ]) = _$DashboardDashboardApiGetWidgetsResponse200ApplicationJson;

  // coverage:ignore-start
  const DashboardDashboardApiGetWidgetsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardDashboardApiGetWidgetsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs get ocs;
  static Serializer<DashboardDashboardApiGetWidgetsResponse200ApplicationJson> get serializer =>
      _$dashboardDashboardApiGetWidgetsResponse200ApplicationJsonSerializer;
}

abstract class DashboardWidgetItem implements Built<DashboardWidgetItem, DashboardWidgetItemBuilder> {
  factory DashboardWidgetItem([final void Function(DashboardWidgetItemBuilder)? b]) = _$DashboardWidgetItem;

  // coverage:ignore-start
  const DashboardWidgetItem._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardWidgetItem.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get subtitle;
  String get title;
  String get link;
  String get iconUrl;
  String get overlayIconUrl;
  String get sinceId;
  static Serializer<DashboardWidgetItem> get serializer => _$dashboardWidgetItemSerializer;
}

abstract class DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs
    implements
        Built<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs,
            DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder> {
  factory DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs([
    final void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  DashboardOCSMeta get meta;
  BuiltMap<String, BuiltList<DashboardWidgetItem>> get data;
  static Serializer<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs> get serializer =>
      _$dashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonOcsSerializer;
}

abstract class DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson
    implements
        Built<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson,
            DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder> {
  factory DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson([
    final void Function(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonBuilder)? b,
  ]) = _$DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson;

  // coverage:ignore-start
  const DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs get ocs;
  static Serializer<DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson> get serializer =>
      _$dashboardDashboardApiGetWidgetItemsResponse200ApplicationJsonSerializer;
}

abstract class DashboardWidgetItems implements Built<DashboardWidgetItems, DashboardWidgetItemsBuilder> {
  factory DashboardWidgetItems([final void Function(DashboardWidgetItemsBuilder)? b]) = _$DashboardWidgetItems;

  // coverage:ignore-start
  const DashboardWidgetItems._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardWidgetItems.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<DashboardWidgetItem> get items;
  String get emptyContentMessage;
  String get halfEmptyContentMessage;
  static Serializer<DashboardWidgetItems> get serializer => _$dashboardWidgetItemsSerializer;
}

abstract class DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs
    implements
        Built<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs,
            DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder> {
  factory DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs([
    final void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_OcsBuilder)? b,
  ]) = _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  DashboardOCSMeta get meta;
  BuiltMap<String, DashboardWidgetItems> get data;
  static Serializer<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs> get serializer =>
      _$dashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonOcsSerializer;
}

abstract class DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson
    implements
        Built<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson,
            DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder> {
  factory DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson([
    final void Function(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonBuilder)? b,
  ]) = _$DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson;

  // coverage:ignore-start
  const DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs get ocs;
  static Serializer<DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson> get serializer =>
      _$dashboardDashboardApiGetWidgetItemsV2Response200ApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DashboardDashboardApiGetWidgetsResponse200ApplicationJson),
        DashboardDashboardApiGetWidgetsResponse200ApplicationJson.new,
      )
      ..add(DashboardDashboardApiGetWidgetsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs),
        DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs.new,
      )
      ..add(DashboardDashboardApiGetWidgetsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(DashboardOCSMeta), DashboardOCSMeta.new)
      ..add(DashboardOCSMeta.serializer)
      ..addBuilderFactory(const FullType(DashboardWidget), DashboardWidget.new)
      ..add(DashboardWidget.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(const FullType(DashboardWidget_Buttons), DashboardWidget_Buttons.new)
      ..add(DashboardWidget_Buttons.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DashboardWidget_Buttons)]),
        ListBuilder<DashboardWidget_Buttons>.new,
      )
      ..addBuilderFactory(const FullType(BuiltList, [FullType(DashboardWidget)]), ListBuilder<DashboardWidget>.new)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(String)]),
        MapBuilder<String, String>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(String)]),
        ]),
        ContentString<BuiltMap<String, String>>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson),
        DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson.new,
      )
      ..add(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs),
        DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs.new,
      )
      ..add(DashboardDashboardApiGetWidgetItemsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(DashboardWidgetItem), DashboardWidgetItem.new)
      ..add(DashboardWidgetItem.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DashboardWidgetItem)]),
        ListBuilder<DashboardWidgetItem>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(DashboardWidgetItem)]),
        ]),
        MapBuilder<String, BuiltList>.new,
      )
      ..addBuilderFactory(
        const FullType(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson),
        DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson.new,
      )
      ..add(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs),
        DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs.new,
      )
      ..add(DashboardDashboardApiGetWidgetItemsV2Response200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(DashboardWidgetItems), DashboardWidgetItems.new)
      ..add(DashboardWidgetItems.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(DashboardWidgetItems)]),
        MapBuilder<String, DashboardWidgetItems>.new,
      ))
    .build();

Serializers get dashboardSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeDashboard<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeDashboard<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
