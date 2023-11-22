// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'dashboard.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  DashboardApiClient get dashboardApi => DashboardApiClient(this);
}

class DashboardApiClient {
  DashboardApiClient(this._rootClient);

  final Client _rootClient;

  /// Get the widgets.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widgets returned
  ///
  /// See:
  ///  * [getWidgetsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DashboardApiGetWidgetsResponseApplicationJson, void>> getWidgets({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getWidgetsRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the widgets.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widgets returned
  ///
  /// See:
  ///  * [getWidgets] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DashboardApiGetWidgetsResponseApplicationJson, void> getWidgetsRaw({
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/dashboard/api/v1/widgets').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DashboardApiGetWidgetsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DashboardApiGetWidgetsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the items for the widgets.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sinceIds] Array indexed by widget Ids, contains date/id from which we want the new items.
  ///   * [limit] Limit number of result items per widget. Defaults to `7`.
  ///   * [widgets] Limit results to specific widgets. Defaults to `[]`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widget items returned
  ///
  /// See:
  ///  * [getWidgetItemsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DashboardApiGetWidgetItemsResponseApplicationJson, void>> getWidgetItems({
    final ContentString<BuiltMap<String, String>>? sinceIds,
    final int limit = 7,
    final List<String> widgets = const <String>[],
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getWidgetItemsRaw(
      sinceIds: sinceIds,
      limit: limit,
      widgets: widgets,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the items for the widgets.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sinceIds] Array indexed by widget Ids, contains date/id from which we want the new items.
  ///   * [limit] Limit number of result items per widget. Defaults to `7`.
  ///   * [widgets] Limit results to specific widgets. Defaults to `[]`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widget items returned
  ///
  /// See:
  ///  * [getWidgetItems] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DashboardApiGetWidgetItemsResponseApplicationJson, void> getWidgetItemsRaw({
    final ContentString<BuiltMap<String, String>>? sinceIds,
    final int limit = 7,
    final List<String> widgets = const <String>[],
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
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
    if (widgets != const <String>[]) {
      queryParameters['widgets[]'] = widgets.map((final e) => e);
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/dashboard/api/v1/widget-items').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DashboardApiGetWidgetItemsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DashboardApiGetWidgetItemsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the items for the widgets.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sinceIds] Array indexed by widget Ids, contains date/id from which we want the new items.
  ///   * [limit] Limit number of result items per widget. Defaults to `7`.
  ///   * [widgets] Limit results to specific widgets. Defaults to `[]`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widget items returned
  ///
  /// See:
  ///  * [getWidgetItemsV2Raw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DashboardApiGetWidgetItemsV2ResponseApplicationJson, void>> getWidgetItemsV2({
    final ContentString<BuiltMap<String, String>>? sinceIds,
    final int limit = 7,
    final List<String> widgets = const <String>[],
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getWidgetItemsV2Raw(
      sinceIds: sinceIds,
      limit: limit,
      widgets: widgets,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the items for the widgets.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sinceIds] Array indexed by widget Ids, contains date/id from which we want the new items.
  ///   * [limit] Limit number of result items per widget. Defaults to `7`.
  ///   * [widgets] Limit results to specific widgets. Defaults to `[]`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widget items returned
  ///
  /// See:
  ///  * [getWidgetItemsV2] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DashboardApiGetWidgetItemsV2ResponseApplicationJson, void> getWidgetItemsV2Raw({
    final ContentString<BuiltMap<String, String>>? sinceIds,
    final int limit = 7,
    final List<String> widgets = const <String>[],
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
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
    if (widgets != const <String>[]) {
      queryParameters['widgets[]'] = widgets.map((final e) => e);
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/dashboard/api/v2/widget-items').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DashboardApiGetWidgetItemsV2ResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DashboardApiGetWidgetItemsV2ResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([final void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OCSMeta> get serializer => const _$OCSMetaSerializer();
}

class _$OCSMetaSerializer implements StructuredSerializer<OCSMeta> {
  const _$OCSMetaSerializer();

  @override
  Iterable<Type> get types => const [OCSMeta, _$OCSMeta];

  @override
  String get wireName => 'OCSMeta';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OCSMeta object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
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
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  OCSMeta deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Widget_ButtonsInterface {
  String get type;
  String get text;
  String get link;
}

abstract class Widget_Buttons implements Widget_ButtonsInterface, Built<Widget_Buttons, Widget_ButtonsBuilder> {
  factory Widget_Buttons([final void Function(Widget_ButtonsBuilder)? b]) = _$Widget_Buttons;

  // coverage:ignore-start
  const Widget_Buttons._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Widget_Buttons.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Widget_Buttons> get serializer => const _$Widget_ButtonsSerializer();
}

class _$Widget_ButtonsSerializer implements StructuredSerializer<Widget_Buttons> {
  const _$Widget_ButtonsSerializer();

  @override
  Iterable<Type> get types => const [Widget_Buttons, _$Widget_Buttons];

  @override
  String get wireName => 'Widget_Buttons';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Widget_Buttons object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
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
  Widget_Buttons deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Widget_ButtonsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'text':
          result.text = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WidgetInterface {
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
  BuiltList<Widget_Buttons>? get buttons;
}

abstract class Widget implements WidgetInterface, Built<Widget, WidgetBuilder> {
  factory Widget([final void Function(WidgetBuilder)? b]) = _$Widget;

  // coverage:ignore-start
  const Widget._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Widget.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Widget> get serializer => const _$WidgetSerializer();
}

class _$WidgetSerializer implements StructuredSerializer<Widget> {
  const _$WidgetSerializer();

  @override
  Iterable<Type> get types => const [Widget, _$Widget];

  @override
  String get wireName => 'Widget';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Widget object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
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
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.buttons;
    if (value != null) {
      result
        ..add('buttons')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Widget_Buttons)])),
        );
    }

    return result;
  }

  @override
  Widget deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WidgetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'order':
          result.order = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'icon_class':
          result.iconClass = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon_url':
          result.iconUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'widget_url':
          result.widgetUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'item_icons_round':
          result.itemIconsRound = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'item_api_versions':
          result.itemApiVersions.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(int)]))!
                as BuiltList<int>,
          );
        case 'reload_interval':
          result.reloadInterval = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'buttons':
          result.buttons.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Widget_Buttons)]))!
                as BuiltList<Widget_Buttons>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DashboardApiGetWidgetsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, Widget> get data;
}

abstract class DashboardApiGetWidgetsResponseApplicationJson_Ocs
    implements
        DashboardApiGetWidgetsResponseApplicationJson_OcsInterface,
        Built<DashboardApiGetWidgetsResponseApplicationJson_Ocs,
            DashboardApiGetWidgetsResponseApplicationJson_OcsBuilder> {
  factory DashboardApiGetWidgetsResponseApplicationJson_Ocs([
    final void Function(DashboardApiGetWidgetsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DashboardApiGetWidgetsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardApiGetWidgetsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardApiGetWidgetsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardApiGetWidgetsResponseApplicationJson_Ocs> get serializer =>
      const _$DashboardApiGetWidgetsResponseApplicationJson_OcsSerializer();
}

class _$DashboardApiGetWidgetsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DashboardApiGetWidgetsResponseApplicationJson_Ocs> {
  const _$DashboardApiGetWidgetsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DashboardApiGetWidgetsResponseApplicationJson_Ocs, _$DashboardApiGetWidgetsResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DashboardApiGetWidgetsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DashboardApiGetWidgetsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Widget)])),
    ];
    return result;
  }

  @override
  DashboardApiGetWidgetsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardApiGetWidgetsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Widget)]),
            )! as BuiltMap<String, Widget>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DashboardApiGetWidgetsResponseApplicationJsonInterface {
  DashboardApiGetWidgetsResponseApplicationJson_Ocs get ocs;
}

abstract class DashboardApiGetWidgetsResponseApplicationJson
    implements
        DashboardApiGetWidgetsResponseApplicationJsonInterface,
        Built<DashboardApiGetWidgetsResponseApplicationJson, DashboardApiGetWidgetsResponseApplicationJsonBuilder> {
  factory DashboardApiGetWidgetsResponseApplicationJson([
    final void Function(DashboardApiGetWidgetsResponseApplicationJsonBuilder)? b,
  ]) = _$DashboardApiGetWidgetsResponseApplicationJson;

  // coverage:ignore-start
  const DashboardApiGetWidgetsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardApiGetWidgetsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardApiGetWidgetsResponseApplicationJson> get serializer =>
      const _$DashboardApiGetWidgetsResponseApplicationJsonSerializer();
}

class _$DashboardApiGetWidgetsResponseApplicationJsonSerializer
    implements StructuredSerializer<DashboardApiGetWidgetsResponseApplicationJson> {
  const _$DashboardApiGetWidgetsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DashboardApiGetWidgetsResponseApplicationJson, _$DashboardApiGetWidgetsResponseApplicationJson];

  @override
  String get wireName => 'DashboardApiGetWidgetsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DashboardApiGetWidgetsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(DashboardApiGetWidgetsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  DashboardApiGetWidgetsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardApiGetWidgetsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(DashboardApiGetWidgetsResponseApplicationJson_Ocs),
            )! as DashboardApiGetWidgetsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WidgetItemInterface {
  String get subtitle;
  String get title;
  String get link;
  String get iconUrl;
  String get overlayIconUrl;
  String get sinceId;
}

abstract class WidgetItem implements WidgetItemInterface, Built<WidgetItem, WidgetItemBuilder> {
  factory WidgetItem([final void Function(WidgetItemBuilder)? b]) = _$WidgetItem;

  // coverage:ignore-start
  const WidgetItem._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WidgetItem.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WidgetItem> get serializer => const _$WidgetItemSerializer();
}

class _$WidgetItemSerializer implements StructuredSerializer<WidgetItem> {
  const _$WidgetItemSerializer();

  @override
  Iterable<Type> get types => const [WidgetItem, _$WidgetItem];

  @override
  String get wireName => 'WidgetItem';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WidgetItem object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
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
  WidgetItem deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WidgetItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'subtitle':
          result.subtitle = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'overlayIconUrl':
          result.overlayIconUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'sinceId':
          result.sinceId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DashboardApiGetWidgetItemsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, BuiltList<WidgetItem>> get data;
}

abstract class DashboardApiGetWidgetItemsResponseApplicationJson_Ocs
    implements
        DashboardApiGetWidgetItemsResponseApplicationJson_OcsInterface,
        Built<DashboardApiGetWidgetItemsResponseApplicationJson_Ocs,
            DashboardApiGetWidgetItemsResponseApplicationJson_OcsBuilder> {
  factory DashboardApiGetWidgetItemsResponseApplicationJson_Ocs([
    final void Function(DashboardApiGetWidgetItemsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DashboardApiGetWidgetItemsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardApiGetWidgetItemsResponseApplicationJson_Ocs> get serializer =>
      const _$DashboardApiGetWidgetItemsResponseApplicationJson_OcsSerializer();
}

class _$DashboardApiGetWidgetItemsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DashboardApiGetWidgetItemsResponseApplicationJson_Ocs> {
  const _$DashboardApiGetWidgetItemsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        DashboardApiGetWidgetItemsResponseApplicationJson_Ocs,
        _$DashboardApiGetWidgetItemsResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'DashboardApiGetWidgetItemsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DashboardApiGetWidgetItemsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(WidgetItem)]),
        ]),
      ),
    ];
    return result;
  }

  @override
  DashboardApiGetWidgetItemsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardApiGetWidgetItemsResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(BuiltList, [FullType(WidgetItem)]),
              ]),
            )! as BuiltMap<String, BuiltList<WidgetItem>>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DashboardApiGetWidgetItemsResponseApplicationJsonInterface {
  DashboardApiGetWidgetItemsResponseApplicationJson_Ocs get ocs;
}

abstract class DashboardApiGetWidgetItemsResponseApplicationJson
    implements
        DashboardApiGetWidgetItemsResponseApplicationJsonInterface,
        Built<DashboardApiGetWidgetItemsResponseApplicationJson,
            DashboardApiGetWidgetItemsResponseApplicationJsonBuilder> {
  factory DashboardApiGetWidgetItemsResponseApplicationJson([
    final void Function(DashboardApiGetWidgetItemsResponseApplicationJsonBuilder)? b,
  ]) = _$DashboardApiGetWidgetItemsResponseApplicationJson;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardApiGetWidgetItemsResponseApplicationJson> get serializer =>
      const _$DashboardApiGetWidgetItemsResponseApplicationJsonSerializer();
}

class _$DashboardApiGetWidgetItemsResponseApplicationJsonSerializer
    implements StructuredSerializer<DashboardApiGetWidgetItemsResponseApplicationJson> {
  const _$DashboardApiGetWidgetItemsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DashboardApiGetWidgetItemsResponseApplicationJson, _$DashboardApiGetWidgetItemsResponseApplicationJson];

  @override
  String get wireName => 'DashboardApiGetWidgetItemsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DashboardApiGetWidgetItemsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(DashboardApiGetWidgetItemsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  DashboardApiGetWidgetItemsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardApiGetWidgetItemsResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(DashboardApiGetWidgetItemsResponseApplicationJson_Ocs),
            )! as DashboardApiGetWidgetItemsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WidgetItemsInterface {
  BuiltList<WidgetItem> get items;
  String get emptyContentMessage;
  String get halfEmptyContentMessage;
}

abstract class WidgetItems implements WidgetItemsInterface, Built<WidgetItems, WidgetItemsBuilder> {
  factory WidgetItems([final void Function(WidgetItemsBuilder)? b]) = _$WidgetItems;

  // coverage:ignore-start
  const WidgetItems._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WidgetItems.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WidgetItems> get serializer => const _$WidgetItemsSerializer();
}

class _$WidgetItemsSerializer implements StructuredSerializer<WidgetItems> {
  const _$WidgetItemsSerializer();

  @override
  Iterable<Type> get types => const [WidgetItems, _$WidgetItems];

  @override
  String get wireName => 'WidgetItems';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WidgetItems object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(WidgetItem)])),
      'emptyContentMessage',
      serializers.serialize(object.emptyContentMessage, specifiedType: const FullType(String)),
      'halfEmptyContentMessage',
      serializers.serialize(object.halfEmptyContentMessage, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  WidgetItems deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WidgetItemsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(WidgetItem)]))!
                as BuiltList<WidgetItem>,
          );
        case 'emptyContentMessage':
          result.emptyContentMessage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'halfEmptyContentMessage':
          result.halfEmptyContentMessage =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, WidgetItems> get data;
}

abstract class DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs
    implements
        DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsInterface,
        Built<DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs,
            DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsBuilder> {
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs([
    final void Function(DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs> get serializer =>
      const _$DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsSerializer();
}

class _$DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs> {
  const _$DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs,
        _$DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(WidgetItems)]),
      ),
    ];
    return result;
  }

  @override
  DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(WidgetItems)]),
            )! as BuiltMap<String, WidgetItems>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DashboardApiGetWidgetItemsV2ResponseApplicationJsonInterface {
  DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs get ocs;
}

abstract class DashboardApiGetWidgetItemsV2ResponseApplicationJson
    implements
        DashboardApiGetWidgetItemsV2ResponseApplicationJsonInterface,
        Built<DashboardApiGetWidgetItemsV2ResponseApplicationJson,
            DashboardApiGetWidgetItemsV2ResponseApplicationJsonBuilder> {
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson([
    final void Function(DashboardApiGetWidgetItemsV2ResponseApplicationJsonBuilder)? b,
  ]) = _$DashboardApiGetWidgetItemsV2ResponseApplicationJson;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsV2ResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DashboardApiGetWidgetItemsV2ResponseApplicationJson> get serializer =>
      const _$DashboardApiGetWidgetItemsV2ResponseApplicationJsonSerializer();
}

class _$DashboardApiGetWidgetItemsV2ResponseApplicationJsonSerializer
    implements StructuredSerializer<DashboardApiGetWidgetItemsV2ResponseApplicationJson> {
  const _$DashboardApiGetWidgetItemsV2ResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        DashboardApiGetWidgetItemsV2ResponseApplicationJson,
        _$DashboardApiGetWidgetItemsV2ResponseApplicationJson,
      ];

  @override
  String get wireName => 'DashboardApiGetWidgetItemsV2ResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DashboardApiGetWidgetItemsV2ResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  DashboardApiGetWidgetItemsV2ResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DashboardApiGetWidgetItemsV2ResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs),
            )! as DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetsResponseApplicationJson),
        DashboardApiGetWidgetsResponseApplicationJson.new,
      )
      ..add(DashboardApiGetWidgetsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetsResponseApplicationJson_Ocs),
        DashboardApiGetWidgetsResponseApplicationJson_Ocs.new,
      )
      ..add(DashboardApiGetWidgetsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(Widget), Widget.new)
      ..add(Widget.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(const FullType(Widget_Buttons), Widget_Buttons.new)
      ..add(Widget_Buttons.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Widget_Buttons)]), ListBuilder<Widget_Buttons>.new)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(Widget)]),
        MapBuilder<String, Widget>.new,
      )
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
        const FullType(DashboardApiGetWidgetItemsResponseApplicationJson),
        DashboardApiGetWidgetItemsResponseApplicationJson.new,
      )
      ..add(DashboardApiGetWidgetItemsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetItemsResponseApplicationJson_Ocs),
        DashboardApiGetWidgetItemsResponseApplicationJson_Ocs.new,
      )
      ..add(DashboardApiGetWidgetItemsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(WidgetItem), WidgetItem.new)
      ..add(WidgetItem.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(WidgetItem)]), ListBuilder<WidgetItem>.new)
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(WidgetItem)]),
        ]),
        MapBuilder<String, BuiltList<WidgetItem>>.new,
      )
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetItemsV2ResponseApplicationJson),
        DashboardApiGetWidgetItemsV2ResponseApplicationJson.new,
      )
      ..add(DashboardApiGetWidgetItemsV2ResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs),
        DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs.new,
      )
      ..add(DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(WidgetItems), WidgetItems.new)
      ..add(WidgetItems.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(WidgetItems)]),
        MapBuilder<String, WidgetItems>.new,
      ))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
