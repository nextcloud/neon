// Use of this source code is governed by a agpl license. It can be obtained at `https://spdx.org/licenses/AGPL-3.0-only.html`.

// OpenAPI client generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names, public_member_api_docs
// ignore_for_file: unreachable_switch_case

/// dashboard Version: 0.0.1.
///
/// Dashboard app.
///
/// Use of this source code is governed by a agpl license.
/// It can be obtained at `https://spdx.org/licenses/AGPL-3.0-only.html`.
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i7;
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart' as _i6;
import 'package:dynamite_runtime/http_client.dart' as _i1;
import 'package:dynamite_runtime/models.dart';
import 'package:dynamite_runtime/utils.dart' as _i4;
import 'package:http/http.dart' as _i3;
import 'package:meta/meta.dart' as _i2;
import 'package:uri/uri.dart' as _i5;

part 'dashboard.openapi.g.dart';

class $Client extends _i1.DynamiteClient {
  /// Creates a new `DynamiteClient` for untagged requests.
  $Client(
    super.baseURL, {
    super.baseHeaders,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  /// Creates a new [$Client] from another [client].
  $Client.fromClient(_i1.DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  late final $DashboardApiClient dashboardApi = $DashboardApiClient(this);
}

class $DashboardApiClient {
  /// Creates a new `DynamiteClient` for dashboard_api requests.
  $DashboardApiClient(this._rootClient);

  final $Client _rootClient;

  /// Builds a serializer to parse the response of [$getWidgets_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<DashboardApiGetWidgetsResponseApplicationJson, void>
      $getWidgets_Serializer() => _i1.DynamiteSerializer(
            bodyType:
                const FullType(DashboardApiGetWidgetsResponseApplicationJson),
            headersType: null,
            serializers: _$jsonSerializers,
            validStatuses: const {200},
          );

  /// Get the widgets.
  ///
  /// Returns a `DynamiteRequest` backing the [getWidgets] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widgets returned
  ///
  /// See:
  ///  * [getWidgets] for a method executing this request and parsing the response.
  ///  * [$getWidgets_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $getWidgets_Request({bool? oCSAPIRequest}) {
    const _path = '/ocs/v2.php/apps/dashboard/api/v1/widgets';
    final _uri = Uri.parse('${_rootClient.baseURL}$_path');
    final _request = _i3.Request('get', _uri);
    _request.headers['Accept'] = 'application/json';
// coverage:ignore-start
    final authentication = _rootClient.authentications?.firstWhereOrNull(
      (auth) => switch (auth) {
        _i1.DynamiteHttpBearerAuthentication() ||
        _i1.DynamiteHttpBasicAuthentication() =>
          true,
        _ => false,
      },
    );

    if (authentication != null) {
      _request.headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = _$jsonSerializers.serialize(
      oCSAPIRequest,
      specifiedType: const FullType(bool),
    );
    $oCSAPIRequest ??= true;
    _request.headers['OCS-APIRequest'] =
        const _i4.HeaderEncoder().convert($oCSAPIRequest);

    return _request;
  }

  /// Get the widgets.
  ///
  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Widgets returned
  ///
  /// See:
  ///  * [$getWidgets_Request] for the request send by this method.
  ///  * [$getWidgets_Serializer] for a converter to parse the `Response` from an executed request.
  Future<
      _i1.DynamiteResponse<DashboardApiGetWidgetsResponseApplicationJson,
          void>> getWidgets({bool? oCSAPIRequest}) async {
    final _request = $getWidgets_Request(
      oCSAPIRequest: oCSAPIRequest,
    );
    final _response = await _rootClient.sendWithCookies(_request);

    final _serializer = $getWidgets_Serializer();
    final _rawResponse = await _i1.ResponseConverter<
            DashboardApiGetWidgetsResponseApplicationJson, void>(_serializer)
        .convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }

  /// Builds a serializer to parse the response of [$getWidgetItems_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<
          DashboardApiGetWidgetItemsResponseApplicationJson, void>
      $getWidgetItems_Serializer() => _i1.DynamiteSerializer(
            bodyType: const FullType(
              DashboardApiGetWidgetItemsResponseApplicationJson,
            ),
            headersType: null,
            serializers: _$jsonSerializers,
            validStatuses: const {200},
          );

  /// Get the items for the widgets.
  ///
  /// Returns a `DynamiteRequest` backing the [getWidgetItems] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
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
  ///  * [getWidgetItems] for a method executing this request and parsing the response.
  ///  * [$getWidgetItems_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $getWidgetItems_Request({
    ContentString<BuiltMap<String, String>>? sinceIds,
    int? limit,
    BuiltList<String>? widgets,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, Object?>{};
    final $sinceIds = _$jsonSerializers.serialize(
      sinceIds,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [FullType(String), FullType(String)]),
      ]),
    );
    _parameters['sinceIds'] = $sinceIds;

    var $limit =
        _$jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 7;
    _parameters['limit'] = $limit;

    var $widgets = _$jsonSerializers.serialize(
      widgets,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    $widgets ??= [];
    _parameters['widgets%5B%5D'] = $widgets;

    final _path = _i5.UriTemplate(
      '/ocs/v2.php/apps/dashboard/api/v1/widget-items{?sinceIds*,limit*,widgets%5B%5D*}',
    ).expand(_parameters);
    final _uri = Uri.parse('${_rootClient.baseURL}$_path');
    final _request = _i3.Request('get', _uri);
    _request.headers['Accept'] = 'application/json';
// coverage:ignore-start
    final authentication = _rootClient.authentications?.firstWhereOrNull(
      (auth) => switch (auth) {
        _i1.DynamiteHttpBearerAuthentication() ||
        _i1.DynamiteHttpBasicAuthentication() =>
          true,
        _ => false,
      },
    );

    if (authentication != null) {
      _request.headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = _$jsonSerializers.serialize(
      oCSAPIRequest,
      specifiedType: const FullType(bool),
    );
    $oCSAPIRequest ??= true;
    _request.headers['OCS-APIRequest'] =
        const _i4.HeaderEncoder().convert($oCSAPIRequest);

    return _request;
  }

  /// Get the items for the widgets.
  ///
  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
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
  ///  * [$getWidgetItems_Request] for the request send by this method.
  ///  * [$getWidgetItems_Serializer] for a converter to parse the `Response` from an executed request.
  Future<
      _i1.DynamiteResponse<DashboardApiGetWidgetItemsResponseApplicationJson,
          void>> getWidgetItems({
    ContentString<BuiltMap<String, String>>? sinceIds,
    int? limit,
    BuiltList<String>? widgets,
    bool? oCSAPIRequest,
  }) async {
    final _request = $getWidgetItems_Request(
      sinceIds: sinceIds,
      limit: limit,
      widgets: widgets,
      oCSAPIRequest: oCSAPIRequest,
    );
    final _response = await _rootClient.sendWithCookies(_request);

    final _serializer = $getWidgetItems_Serializer();
    final _rawResponse = await _i1.ResponseConverter<
            DashboardApiGetWidgetItemsResponseApplicationJson,
            void>(_serializer)
        .convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }

  /// Builds a serializer to parse the response of [$getWidgetItemsV2_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<
          DashboardApiGetWidgetItemsV2ResponseApplicationJson, void>
      $getWidgetItemsV2_Serializer() => _i1.DynamiteSerializer(
            bodyType: const FullType(
              DashboardApiGetWidgetItemsV2ResponseApplicationJson,
            ),
            headersType: null,
            serializers: _$jsonSerializers,
            validStatuses: const {200},
          );

  /// Get the items for the widgets.
  ///
  /// Only available since 27.1.
  ///
  /// Returns a `DynamiteRequest` backing the [getWidgetItemsV2] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
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
  ///  * [getWidgetItemsV2] for a method executing this request and parsing the response.
  ///  * [$getWidgetItemsV2_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $getWidgetItemsV2_Request({
    ContentString<BuiltMap<String, String>>? sinceIds,
    int? limit,
    BuiltList<String>? widgets,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, Object?>{};
    final $sinceIds = _$jsonSerializers.serialize(
      sinceIds,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [FullType(String), FullType(String)]),
      ]),
    );
    _parameters['sinceIds'] = $sinceIds;

    var $limit =
        _$jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 7;
    _parameters['limit'] = $limit;

    var $widgets = _$jsonSerializers.serialize(
      widgets,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    $widgets ??= [];
    _parameters['widgets%5B%5D'] = $widgets;

    final _path = _i5.UriTemplate(
      '/ocs/v2.php/apps/dashboard/api/v2/widget-items{?sinceIds*,limit*,widgets%5B%5D*}',
    ).expand(_parameters);
    final _uri = Uri.parse('${_rootClient.baseURL}$_path');
    final _request = _i3.Request('get', _uri);
    _request.headers['Accept'] = 'application/json';
// coverage:ignore-start
    final authentication = _rootClient.authentications?.firstWhereOrNull(
      (auth) => switch (auth) {
        _i1.DynamiteHttpBearerAuthentication() ||
        _i1.DynamiteHttpBasicAuthentication() =>
          true,
        _ => false,
      },
    );

    if (authentication != null) {
      _request.headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = _$jsonSerializers.serialize(
      oCSAPIRequest,
      specifiedType: const FullType(bool),
    );
    $oCSAPIRequest ??= true;
    _request.headers['OCS-APIRequest'] =
        const _i4.HeaderEncoder().convert($oCSAPIRequest);

    return _request;
  }

  /// Get the items for the widgets.
  ///
  /// Only available since 27.1.
  ///
  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
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
  ///  * [$getWidgetItemsV2_Request] for the request send by this method.
  ///  * [$getWidgetItemsV2_Serializer] for a converter to parse the `Response` from an executed request.
  Future<
      _i1.DynamiteResponse<DashboardApiGetWidgetItemsV2ResponseApplicationJson,
          void>> getWidgetItemsV2({
    ContentString<BuiltMap<String, String>>? sinceIds,
    int? limit,
    BuiltList<String>? widgets,
    bool? oCSAPIRequest,
  }) async {
    final _request = $getWidgetItemsV2_Request(
      sinceIds: sinceIds,
      limit: limit,
      widgets: widgets,
      oCSAPIRequest: oCSAPIRequest,
    );
    final _response = await _rootClient.sendWithCookies(_request);

    final _serializer = $getWidgetItemsV2_Serializer();
    final _rawResponse = await _i1.ResponseConverter<
            DashboardApiGetWidgetItemsV2ResponseApplicationJson,
            void>(_serializer)
        .convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta
    implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  /// Creates a new OCSMeta object using the builder pattern.
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for OCSMeta.
  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Widget_ButtonsInterface {
  String get type;
  String get text;
  String get link;
}

abstract class Widget_Buttons
    implements
        $Widget_ButtonsInterface,
        Built<Widget_Buttons, Widget_ButtonsBuilder> {
  /// Creates a new Widget_Buttons object using the builder pattern.
  factory Widget_Buttons([void Function(Widget_ButtonsBuilder)? b]) =
      _$Widget_Buttons;

  // coverage:ignore-start
  const Widget_Buttons._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory Widget_Buttons.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for Widget_Buttons.
  static Serializer<Widget_Buttons> get serializer => _$widgetButtonsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WidgetInterface {
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
  BuiltList<int>? get itemApiVersions;
  @BuiltValueField(wireName: 'reload_interval')
  int? get reloadInterval;
  BuiltList<Widget_Buttons>? get buttons;
}

abstract class Widget
    implements $WidgetInterface, Built<Widget, WidgetBuilder> {
  /// Creates a new Widget object using the builder pattern.
  factory Widget([void Function(WidgetBuilder)? b]) = _$Widget;

  // coverage:ignore-start
  const Widget._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory Widget.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for Widget.
  static Serializer<Widget> get serializer => _$widgetSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DashboardApiGetWidgetsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, Widget> get data;
}

abstract class DashboardApiGetWidgetsResponseApplicationJson_Ocs
    implements
        $DashboardApiGetWidgetsResponseApplicationJson_OcsInterface,
        Built<DashboardApiGetWidgetsResponseApplicationJson_Ocs,
            DashboardApiGetWidgetsResponseApplicationJson_OcsBuilder> {
  /// Creates a new DashboardApiGetWidgetsResponseApplicationJson_Ocs object using the builder pattern.
  factory DashboardApiGetWidgetsResponseApplicationJson_Ocs([
    void Function(DashboardApiGetWidgetsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DashboardApiGetWidgetsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardApiGetWidgetsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory DashboardApiGetWidgetsResponseApplicationJson_Ocs.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for DashboardApiGetWidgetsResponseApplicationJson_Ocs.
  static Serializer<DashboardApiGetWidgetsResponseApplicationJson_Ocs>
      get serializer =>
          _$dashboardApiGetWidgetsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DashboardApiGetWidgetsResponseApplicationJsonInterface {
  DashboardApiGetWidgetsResponseApplicationJson_Ocs get ocs;
}

abstract class DashboardApiGetWidgetsResponseApplicationJson
    implements
        $DashboardApiGetWidgetsResponseApplicationJsonInterface,
        Built<DashboardApiGetWidgetsResponseApplicationJson,
            DashboardApiGetWidgetsResponseApplicationJsonBuilder> {
  /// Creates a new DashboardApiGetWidgetsResponseApplicationJson object using the builder pattern.
  factory DashboardApiGetWidgetsResponseApplicationJson([
    void Function(DashboardApiGetWidgetsResponseApplicationJsonBuilder)? b,
  ]) = _$DashboardApiGetWidgetsResponseApplicationJson;

  // coverage:ignore-start
  const DashboardApiGetWidgetsResponseApplicationJson._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory DashboardApiGetWidgetsResponseApplicationJson.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for DashboardApiGetWidgetsResponseApplicationJson.
  static Serializer<DashboardApiGetWidgetsResponseApplicationJson>
      get serializer =>
          _$dashboardApiGetWidgetsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WidgetItemInterface {
  String get subtitle;
  String get title;
  String get link;
  String get iconUrl;
  String? get overlayIconUrl;
  String get sinceId;
}

abstract class WidgetItem
    implements $WidgetItemInterface, Built<WidgetItem, WidgetItemBuilder> {
  /// Creates a new WidgetItem object using the builder pattern.
  factory WidgetItem([void Function(WidgetItemBuilder)? b]) = _$WidgetItem;

  // coverage:ignore-start
  const WidgetItem._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for WidgetItem.
  static Serializer<WidgetItem> get serializer => _$widgetItemSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DashboardApiGetWidgetItemsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, BuiltList<WidgetItem>> get data;
}

abstract class DashboardApiGetWidgetItemsResponseApplicationJson_Ocs
    implements
        $DashboardApiGetWidgetItemsResponseApplicationJson_OcsInterface,
        Built<DashboardApiGetWidgetItemsResponseApplicationJson_Ocs,
            DashboardApiGetWidgetItemsResponseApplicationJson_OcsBuilder> {
  /// Creates a new DashboardApiGetWidgetItemsResponseApplicationJson_Ocs object using the builder pattern.
  factory DashboardApiGetWidgetItemsResponseApplicationJson_Ocs([
    void Function(
      DashboardApiGetWidgetItemsResponseApplicationJson_OcsBuilder,
    )? b,
  ]) = _$DashboardApiGetWidgetItemsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsResponseApplicationJson_Ocs.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for DashboardApiGetWidgetItemsResponseApplicationJson_Ocs.
  static Serializer<DashboardApiGetWidgetItemsResponseApplicationJson_Ocs>
      get serializer =>
          _$dashboardApiGetWidgetItemsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DashboardApiGetWidgetItemsResponseApplicationJsonInterface {
  DashboardApiGetWidgetItemsResponseApplicationJson_Ocs get ocs;
}

abstract class DashboardApiGetWidgetItemsResponseApplicationJson
    implements
        $DashboardApiGetWidgetItemsResponseApplicationJsonInterface,
        Built<DashboardApiGetWidgetItemsResponseApplicationJson,
            DashboardApiGetWidgetItemsResponseApplicationJsonBuilder> {
  /// Creates a new DashboardApiGetWidgetItemsResponseApplicationJson object using the builder pattern.
  factory DashboardApiGetWidgetItemsResponseApplicationJson([
    void Function(DashboardApiGetWidgetItemsResponseApplicationJsonBuilder)? b,
  ]) = _$DashboardApiGetWidgetItemsResponseApplicationJson;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsResponseApplicationJson._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsResponseApplicationJson.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for DashboardApiGetWidgetItemsResponseApplicationJson.
  static Serializer<DashboardApiGetWidgetItemsResponseApplicationJson>
      get serializer =>
          _$dashboardApiGetWidgetItemsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WidgetItemsInterface {
  BuiltList<WidgetItem> get items;
  String get emptyContentMessage;
  String get halfEmptyContentMessage;
}

abstract class WidgetItems
    implements $WidgetItemsInterface, Built<WidgetItems, WidgetItemsBuilder> {
  /// Creates a new WidgetItems object using the builder pattern.
  factory WidgetItems([void Function(WidgetItemsBuilder)? b]) = _$WidgetItems;

  // coverage:ignore-start
  const WidgetItems._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory WidgetItems.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for WidgetItems.
  static Serializer<WidgetItems> get serializer => _$widgetItemsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltMap<String, WidgetItems> get data;
}

abstract class DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs
    implements
        $DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsInterface,
        Built<DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs,
            DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsBuilder> {
  /// Creates a new DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs object using the builder pattern.
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs([
    void Function(
      DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsBuilder,
    )? b,
  ]) = _$DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs.
  static Serializer<DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs>
      get serializer =>
          _$dashboardApiGetWidgetItemsV2ResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DashboardApiGetWidgetItemsV2ResponseApplicationJsonInterface {
  DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs get ocs;
}

abstract class DashboardApiGetWidgetItemsV2ResponseApplicationJson
    implements
        $DashboardApiGetWidgetItemsV2ResponseApplicationJsonInterface,
        Built<DashboardApiGetWidgetItemsV2ResponseApplicationJson,
            DashboardApiGetWidgetItemsV2ResponseApplicationJsonBuilder> {
  /// Creates a new DashboardApiGetWidgetItemsV2ResponseApplicationJson object using the builder pattern.
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson([
    void Function(
      DashboardApiGetWidgetItemsV2ResponseApplicationJsonBuilder,
    )? b,
  ]) = _$DashboardApiGetWidgetItemsV2ResponseApplicationJson;

  // coverage:ignore-start
  const DashboardApiGetWidgetItemsV2ResponseApplicationJson._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory DashboardApiGetWidgetItemsV2ResponseApplicationJson.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$jsonSerializers.serializeWith(serializer, this)!
          as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for DashboardApiGetWidgetItemsV2ResponseApplicationJson.
  static Serializer<DashboardApiGetWidgetItemsV2ResponseApplicationJson>
      get serializer =>
          _$dashboardApiGetWidgetItemsV2ResponseApplicationJsonSerializer;
}

// coverage:ignore-start
/// Serializer for all values in this library.
///
/// Serializes values into the `built_value` wire format.
/// See: [$jsonSerializers] for serializing into json.
@_i2.visibleForTesting
final Serializers $serializers = _$serializers;
final Serializers _$serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetsResponseApplicationJson),
        DashboardApiGetWidgetsResponseApplicationJsonBuilder.new,
      )
      ..add(DashboardApiGetWidgetsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetsResponseApplicationJson_Ocs),
        DashboardApiGetWidgetsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DashboardApiGetWidgetsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(Widget), WidgetBuilder.new)
      ..add(Widget.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(int)]),
        ListBuilder<int>.new,
      )
      ..addBuilderFactory(
        const FullType(Widget_Buttons),
        Widget_ButtonsBuilder.new,
      )
      ..add(Widget_Buttons.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Widget_Buttons)]),
        ListBuilder<Widget_Buttons>.new,
      )
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
        ContentStringBuilder<BuiltMap<String, String>>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        ListBuilder<String>.new,
      )
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetItemsResponseApplicationJson),
        DashboardApiGetWidgetItemsResponseApplicationJsonBuilder.new,
      )
      ..add(DashboardApiGetWidgetItemsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetItemsResponseApplicationJson_Ocs),
        DashboardApiGetWidgetItemsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DashboardApiGetWidgetItemsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(WidgetItem), WidgetItemBuilder.new)
      ..add(WidgetItem.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(WidgetItem)]),
        ListBuilder<WidgetItem>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(WidgetItem)]),
        ]),
        MapBuilder<String, BuiltList<WidgetItem>>.new,
      )
      ..addBuilderFactory(
        const FullType(DashboardApiGetWidgetItemsV2ResponseApplicationJson),
        DashboardApiGetWidgetItemsV2ResponseApplicationJsonBuilder.new,
      )
      ..add(DashboardApiGetWidgetItemsV2ResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(
          DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs,
        ),
        DashboardApiGetWidgetItemsV2ResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DashboardApiGetWidgetItemsV2ResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(WidgetItems), WidgetItemsBuilder.new)
      ..add(WidgetItems.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(WidgetItems)]),
        MapBuilder<String, WidgetItems>.new,
      ))
    .build();

/// Serializer for all values in this library.
///
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.
@_i2.visibleForTesting
final Serializers $jsonSerializers = _$jsonSerializers;
final Serializers _$jsonSerializers = (_$serializers.toBuilder()
      ..add(_i6.DynamiteDoubleSerializer())
      ..addPlugin(_i7.StandardJsonPlugin())
      ..addPlugin(const _i6.HeaderPlugin())
      ..addPlugin(const _i6.ContentStringPlugin()))
    .build();
// coverage:ignore-end
