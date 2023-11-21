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
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'weather_status.openapi.g.dart';

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

  WeatherStatusClient get weatherStatus => WeatherStatusClient(this);
}

class WeatherStatusClient {
  WeatherStatusClient(this._rootClient);

  final Client _rootClient;

  /// Change the weather status mode. There are currently 2 modes: - ask the browser - use the user defined address.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [mode] New mode.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Weather status mode updated
  ///
  /// See:
  ///  * [setModeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusSetModeResponseApplicationJson, void>> setMode({
    required final int mode,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setModeRaw(
      mode: mode,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Change the weather status mode. There are currently 2 modes: - ask the browser - use the user defined address.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [mode] New mode.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Weather status mode updated
  ///
  /// See:
  ///  * [setMode] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusSetModeResponseApplicationJson, void> setModeRaw({
    required final int mode,
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
    queryParameters['mode'] = mode.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/mode').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<WeatherStatusSetModeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusSetModeResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Try to use the address set in user personal settings as weather location.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Address updated
  ///
  /// See:
  ///  * [usePersonalAddressRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusUsePersonalAddressResponseApplicationJson, void>> usePersonalAddress({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = usePersonalAddressRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Try to use the address set in user personal settings as weather location.
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
  ///   * 200: Address updated
  ///
  /// See:
  ///  * [usePersonalAddress] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusUsePersonalAddressResponseApplicationJson, void> usePersonalAddressRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/use-personal').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<WeatherStatusUsePersonalAddressResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get stored user location.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Location returned
  ///
  /// See:
  ///  * [getLocationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusGetLocationResponseApplicationJson, void>> getLocation({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getLocationRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get stored user location.
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
  ///   * 200: Location returned
  ///
  /// See:
  ///  * [getLocation] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusGetLocationResponseApplicationJson, void> getLocationRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/location').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<WeatherStatusGetLocationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusGetLocationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Set address and resolve it to get coordinates or directly set coordinates and get address with reverse geocoding.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [address] Any approximative or exact address.
  ///   * [lat] Latitude in decimal degree format.
  ///   * [lon] Longitude in decimal degree format.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Location updated
  ///
  /// See:
  ///  * [setLocationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusSetLocationResponseApplicationJson, void>> setLocation({
    final String? address,
    final double? lat,
    final double? lon,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setLocationRaw(
      address: address,
      lat: lat,
      lon: lon,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set address and resolve it to get coordinates or directly set coordinates and get address with reverse geocoding.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [address] Any approximative or exact address.
  ///   * [lat] Latitude in decimal degree format.
  ///   * [lon] Longitude in decimal degree format.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Location updated
  ///
  /// See:
  ///  * [setLocation] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusSetLocationResponseApplicationJson, void> setLocationRaw({
    final String? address,
    final double? lat,
    final double? lon,
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
    if (address != null) {
      queryParameters['address'] = address;
    }
    if (lat != null) {
      queryParameters['lat'] = lat.toString();
    }
    if (lon != null) {
      queryParameters['lon'] = lon.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/location').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<WeatherStatusSetLocationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusSetLocationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get forecast for current location.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Forecast returned
  ///   * 404: Forecast not found
  ///
  /// See:
  ///  * [getForecastRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusGetForecastResponseApplicationJson, void>> getForecast({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getForecastRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get forecast for current location.
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
  ///   * 200: Forecast returned
  ///   * 404: Forecast not found
  ///
  /// See:
  ///  * [getForecast] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusGetForecastResponseApplicationJson, void> getForecastRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/forecast').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<WeatherStatusGetForecastResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusGetForecastResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get favorites list.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Favorites returned
  ///
  /// See:
  ///  * [getFavoritesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusGetFavoritesResponseApplicationJson, void>> getFavorites({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getFavoritesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get favorites list.
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
  ///   * 200: Favorites returned
  ///
  /// See:
  ///  * [getFavorites] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusGetFavoritesResponseApplicationJson, void> getFavoritesRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/favorites').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<WeatherStatusGetFavoritesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusGetFavoritesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Set favorites list.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [favorites] Favorite addresses.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Favorites updated
  ///
  /// See:
  ///  * [setFavoritesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WeatherStatusSetFavoritesResponseApplicationJson, void>> setFavorites({
    required final List<String> favorites,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setFavoritesRaw(
      favorites: favorites,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set favorites list.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [favorites] Favorite addresses.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Favorites updated
  ///
  /// See:
  ///  * [setFavorites] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WeatherStatusSetFavoritesResponseApplicationJson, void> setFavoritesRaw({
    required final List<String> favorites,
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
    queryParameters['favorites[]'] = favorites.map((final e) => e);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/weather_status/api/v1/favorites').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<WeatherStatusSetFavoritesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson),
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
abstract interface class WeatherStatusSetModeResponseApplicationJson_Ocs_DataInterface {
  bool get success;
}

abstract class WeatherStatusSetModeResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusSetModeResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusSetModeResponseApplicationJson_Ocs_Data,
            WeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusSetModeResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusSetModeResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusSetModeResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetModeResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetModeResponseApplicationJson_Ocs_Data> get serializer =>
      const _$WeatherStatusSetModeResponseApplicationJson_Ocs_DataSerializer();
}

class _$WeatherStatusSetModeResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<WeatherStatusSetModeResponseApplicationJson_Ocs_Data> {
  const _$WeatherStatusSetModeResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusSetModeResponseApplicationJson_Ocs_Data,
        _$WeatherStatusSetModeResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'WeatherStatusSetModeResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetModeResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  WeatherStatusSetModeResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetModeResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusSetModeResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusSetModeResponseApplicationJson_Ocs
    implements
        WeatherStatusSetModeResponseApplicationJson_OcsInterface,
        Built<WeatherStatusSetModeResponseApplicationJson_Ocs, WeatherStatusSetModeResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusSetModeResponseApplicationJson_Ocs([
    final void Function(WeatherStatusSetModeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusSetModeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusSetModeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetModeResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetModeResponseApplicationJson_Ocs> get serializer =>
      const _$WeatherStatusSetModeResponseApplicationJson_OcsSerializer();
}

class _$WeatherStatusSetModeResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusSetModeResponseApplicationJson_Ocs> {
  const _$WeatherStatusSetModeResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusSetModeResponseApplicationJson_Ocs, _$WeatherStatusSetModeResponseApplicationJson_Ocs];

  @override
  String get wireName => 'WeatherStatusSetModeResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetModeResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusSetModeResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetModeResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs_Data),
            )! as WeatherStatusSetModeResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetModeResponseApplicationJsonInterface {
  WeatherStatusSetModeResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusSetModeResponseApplicationJson
    implements
        WeatherStatusSetModeResponseApplicationJsonInterface,
        Built<WeatherStatusSetModeResponseApplicationJson, WeatherStatusSetModeResponseApplicationJsonBuilder> {
  factory WeatherStatusSetModeResponseApplicationJson([
    final void Function(WeatherStatusSetModeResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusSetModeResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusSetModeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetModeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetModeResponseApplicationJson> get serializer =>
      const _$WeatherStatusSetModeResponseApplicationJsonSerializer();
}

class _$WeatherStatusSetModeResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetModeResponseApplicationJson> {
  const _$WeatherStatusSetModeResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusSetModeResponseApplicationJson, _$WeatherStatusSetModeResponseApplicationJson];

  @override
  String get wireName => 'WeatherStatusSetModeResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetModeResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  WeatherStatusSetModeResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetModeResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs),
            )! as WeatherStatusSetModeResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  double? get lat;
  double? get lon;
  String? get address;
}

abstract class WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data,
            WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data> get serializer =>
      const _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataSerializer();
}

class _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data> {
  const _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data,
        _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }

    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }

    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'lat':
          result.lat = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'lon':
          result.lon = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs
    implements
        WeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface,
        Built<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
            WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs([
    final void Function(WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs> get serializer =>
      const _$WeatherStatusUsePersonalAddressResponseApplicationJson_OcsSerializer();
}

class _$WeatherStatusUsePersonalAddressResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs> {
  const _$WeatherStatusUsePersonalAddressResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
        _$WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data),
            )! as WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusUsePersonalAddressResponseApplicationJsonInterface {
  WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusUsePersonalAddressResponseApplicationJson
    implements
        WeatherStatusUsePersonalAddressResponseApplicationJsonInterface,
        Built<WeatherStatusUsePersonalAddressResponseApplicationJson,
            WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder> {
  factory WeatherStatusUsePersonalAddressResponseApplicationJson([
    final void Function(WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusUsePersonalAddressResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusUsePersonalAddressResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusUsePersonalAddressResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson> get serializer =>
      const _$WeatherStatusUsePersonalAddressResponseApplicationJsonSerializer();
}

class _$WeatherStatusUsePersonalAddressResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusUsePersonalAddressResponseApplicationJson> {
  const _$WeatherStatusUsePersonalAddressResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusUsePersonalAddressResponseApplicationJson,
        _$WeatherStatusUsePersonalAddressResponseApplicationJson,
      ];

  @override
  String get wireName => 'WeatherStatusUsePersonalAddressResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusUsePersonalAddressResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusUsePersonalAddressResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusUsePersonalAddressResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs),
            )! as WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterface {
  double get lat;
  double get lon;
  String get address;
  int get mode;
}

abstract class WeatherStatusGetLocationResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusGetLocationResponseApplicationJson_Ocs_Data,
            WeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusGetLocationResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusGetLocationResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusGetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      const _$WeatherStatusGetLocationResponseApplicationJson_Ocs_DataSerializer();
}

class _$WeatherStatusGetLocationResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<WeatherStatusGetLocationResponseApplicationJson_Ocs_Data> {
  const _$WeatherStatusGetLocationResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusGetLocationResponseApplicationJson_Ocs_Data,
        _$WeatherStatusGetLocationResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'WeatherStatusGetLocationResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusGetLocationResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'lat',
      serializers.serialize(object.lat, specifiedType: const FullType(double)),
      'lon',
      serializers.serialize(object.lon, specifiedType: const FullType(double)),
      'address',
      serializers.serialize(object.address, specifiedType: const FullType(String)),
      'mode',
      serializers.serialize(object.mode, specifiedType: const FullType(int)),
    ];
    return result;
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'lat':
          result.lat = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'lon':
          result.lon = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mode':
          result.mode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusGetLocationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusGetLocationResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusGetLocationResponseApplicationJson_Ocs
    implements
        WeatherStatusGetLocationResponseApplicationJson_OcsInterface,
        Built<WeatherStatusGetLocationResponseApplicationJson_Ocs,
            WeatherStatusGetLocationResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs([
    final void Function(WeatherStatusGetLocationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusGetLocationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusGetLocationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetLocationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusGetLocationResponseApplicationJson_Ocs> get serializer =>
      const _$WeatherStatusGetLocationResponseApplicationJson_OcsSerializer();
}

class _$WeatherStatusGetLocationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusGetLocationResponseApplicationJson_Ocs> {
  const _$WeatherStatusGetLocationResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusGetLocationResponseApplicationJson_Ocs,
        _$WeatherStatusGetLocationResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'WeatherStatusGetLocationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusGetLocationResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusGetLocationResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs_Data),
            )! as WeatherStatusGetLocationResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusGetLocationResponseApplicationJsonInterface {
  WeatherStatusGetLocationResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusGetLocationResponseApplicationJson
    implements
        WeatherStatusGetLocationResponseApplicationJsonInterface,
        Built<WeatherStatusGetLocationResponseApplicationJson, WeatherStatusGetLocationResponseApplicationJsonBuilder> {
  factory WeatherStatusGetLocationResponseApplicationJson([
    final void Function(WeatherStatusGetLocationResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusGetLocationResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusGetLocationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetLocationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusGetLocationResponseApplicationJson> get serializer =>
      const _$WeatherStatusGetLocationResponseApplicationJsonSerializer();
}

class _$WeatherStatusGetLocationResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusGetLocationResponseApplicationJson> {
  const _$WeatherStatusGetLocationResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusGetLocationResponseApplicationJson, _$WeatherStatusGetLocationResponseApplicationJson];

  @override
  String get wireName => 'WeatherStatusGetLocationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusGetLocationResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusGetLocationResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusGetLocationResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs),
            )! as WeatherStatusGetLocationResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  double? get lat;
  double? get lon;
  String? get address;
}

abstract class WeatherStatusSetLocationResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusSetLocationResponseApplicationJson_Ocs_Data,
            WeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusSetLocationResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusSetLocationResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      const _$WeatherStatusSetLocationResponseApplicationJson_Ocs_DataSerializer();
}

class _$WeatherStatusSetLocationResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<WeatherStatusSetLocationResponseApplicationJson_Ocs_Data> {
  const _$WeatherStatusSetLocationResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusSetLocationResponseApplicationJson_Ocs_Data,
        _$WeatherStatusSetLocationResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'WeatherStatusSetLocationResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetLocationResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }

    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }

    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'lat':
          result.lat = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'lon':
          result.lon = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetLocationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusSetLocationResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusSetLocationResponseApplicationJson_Ocs
    implements
        WeatherStatusSetLocationResponseApplicationJson_OcsInterface,
        Built<WeatherStatusSetLocationResponseApplicationJson_Ocs,
            WeatherStatusSetLocationResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs([
    final void Function(WeatherStatusSetLocationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusSetLocationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusSetLocationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetLocationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetLocationResponseApplicationJson_Ocs> get serializer =>
      const _$WeatherStatusSetLocationResponseApplicationJson_OcsSerializer();
}

class _$WeatherStatusSetLocationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusSetLocationResponseApplicationJson_Ocs> {
  const _$WeatherStatusSetLocationResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusSetLocationResponseApplicationJson_Ocs,
        _$WeatherStatusSetLocationResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'WeatherStatusSetLocationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetLocationResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetLocationResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs_Data),
            )! as WeatherStatusSetLocationResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetLocationResponseApplicationJsonInterface {
  WeatherStatusSetLocationResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusSetLocationResponseApplicationJson
    implements
        WeatherStatusSetLocationResponseApplicationJsonInterface,
        Built<WeatherStatusSetLocationResponseApplicationJson, WeatherStatusSetLocationResponseApplicationJsonBuilder> {
  factory WeatherStatusSetLocationResponseApplicationJson([
    final void Function(WeatherStatusSetLocationResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusSetLocationResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusSetLocationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetLocationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetLocationResponseApplicationJson> get serializer =>
      const _$WeatherStatusSetLocationResponseApplicationJsonSerializer();
}

class _$WeatherStatusSetLocationResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetLocationResponseApplicationJson> {
  const _$WeatherStatusSetLocationResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusSetLocationResponseApplicationJson, _$WeatherStatusSetLocationResponseApplicationJson];

  @override
  String get wireName => 'WeatherStatusSetLocationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetLocationResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusSetLocationResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetLocationResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs),
            )! as WeatherStatusSetLocationResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Instant_DetailsInterface {
  @BuiltValueField(wireName: 'air_pressure_at_sea_level')
  double get airPressureAtSeaLevel;
  @BuiltValueField(wireName: 'air_temperature')
  double get airTemperature;
  @BuiltValueField(wireName: 'cloud_area_fraction')
  double get cloudAreaFraction;
  @BuiltValueField(wireName: 'cloud_area_fraction_high')
  double get cloudAreaFractionHigh;
  @BuiltValueField(wireName: 'cloud_area_fraction_low')
  double get cloudAreaFractionLow;
  @BuiltValueField(wireName: 'cloud_area_fraction_medium')
  double get cloudAreaFractionMedium;
  @BuiltValueField(wireName: 'dew_point_temperature')
  double get dewPointTemperature;
  @BuiltValueField(wireName: 'fog_area_fraction')
  double get fogAreaFraction;
  @BuiltValueField(wireName: 'relative_humidity')
  double get relativeHumidity;
  @BuiltValueField(wireName: 'ultraviolet_index_clear_sky')
  double get ultravioletIndexClearSky;
  @BuiltValueField(wireName: 'wind_from_direction')
  double get windFromDirection;
  @BuiltValueField(wireName: 'wind_speed')
  double get windSpeed;
  @BuiltValueField(wireName: 'wind_speed_of_gust')
  double get windSpeedOfGust;
}

abstract class Forecast_Data_Instant_Details
    implements
        Forecast_Data_Instant_DetailsInterface,
        Built<Forecast_Data_Instant_Details, Forecast_Data_Instant_DetailsBuilder> {
  factory Forecast_Data_Instant_Details([final void Function(Forecast_Data_Instant_DetailsBuilder)? b]) =
      _$Forecast_Data_Instant_Details;

  // coverage:ignore-start
  const Forecast_Data_Instant_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Instant_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Instant_Details> get serializer => const _$Forecast_Data_Instant_DetailsSerializer();
}

class _$Forecast_Data_Instant_DetailsSerializer implements StructuredSerializer<Forecast_Data_Instant_Details> {
  const _$Forecast_Data_Instant_DetailsSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Instant_Details, _$Forecast_Data_Instant_Details];

  @override
  String get wireName => 'Forecast_Data_Instant_Details';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Instant_Details object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'air_pressure_at_sea_level',
      serializers.serialize(object.airPressureAtSeaLevel, specifiedType: const FullType(double)),
      'air_temperature',
      serializers.serialize(object.airTemperature, specifiedType: const FullType(double)),
      'cloud_area_fraction',
      serializers.serialize(object.cloudAreaFraction, specifiedType: const FullType(double)),
      'cloud_area_fraction_high',
      serializers.serialize(object.cloudAreaFractionHigh, specifiedType: const FullType(double)),
      'cloud_area_fraction_low',
      serializers.serialize(object.cloudAreaFractionLow, specifiedType: const FullType(double)),
      'cloud_area_fraction_medium',
      serializers.serialize(object.cloudAreaFractionMedium, specifiedType: const FullType(double)),
      'dew_point_temperature',
      serializers.serialize(object.dewPointTemperature, specifiedType: const FullType(double)),
      'fog_area_fraction',
      serializers.serialize(object.fogAreaFraction, specifiedType: const FullType(double)),
      'relative_humidity',
      serializers.serialize(object.relativeHumidity, specifiedType: const FullType(double)),
      'ultraviolet_index_clear_sky',
      serializers.serialize(object.ultravioletIndexClearSky, specifiedType: const FullType(double)),
      'wind_from_direction',
      serializers.serialize(object.windFromDirection, specifiedType: const FullType(double)),
      'wind_speed',
      serializers.serialize(object.windSpeed, specifiedType: const FullType(double)),
      'wind_speed_of_gust',
      serializers.serialize(object.windSpeedOfGust, specifiedType: const FullType(double)),
    ];
    return result;
  }

  @override
  Forecast_Data_Instant_Details deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Instant_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'air_pressure_at_sea_level':
          result.airPressureAtSeaLevel =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'air_temperature':
          result.airTemperature = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'cloud_area_fraction':
          result.cloudAreaFraction = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'cloud_area_fraction_high':
          result.cloudAreaFractionHigh =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'cloud_area_fraction_low':
          result.cloudAreaFractionLow =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'cloud_area_fraction_medium':
          result.cloudAreaFractionMedium =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'dew_point_temperature':
          result.dewPointTemperature = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'fog_area_fraction':
          result.fogAreaFraction = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'relative_humidity':
          result.relativeHumidity = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'ultraviolet_index_clear_sky':
          result.ultravioletIndexClearSky =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'wind_from_direction':
          result.windFromDirection = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'wind_speed':
          result.windSpeed = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'wind_speed_of_gust':
          result.windSpeedOfGust = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_InstantInterface {
  Forecast_Data_Instant_Details get details;
}

abstract class Forecast_Data_Instant
    implements Forecast_Data_InstantInterface, Built<Forecast_Data_Instant, Forecast_Data_InstantBuilder> {
  factory Forecast_Data_Instant([final void Function(Forecast_Data_InstantBuilder)? b]) = _$Forecast_Data_Instant;

  // coverage:ignore-start
  const Forecast_Data_Instant._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Instant.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Instant> get serializer => const _$Forecast_Data_InstantSerializer();
}

class _$Forecast_Data_InstantSerializer implements StructuredSerializer<Forecast_Data_Instant> {
  const _$Forecast_Data_InstantSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Instant, _$Forecast_Data_Instant];

  @override
  String get wireName => 'Forecast_Data_Instant';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Instant object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Instant_Details)),
    ];
    return result;
  }

  @override
  Forecast_Data_Instant deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_InstantBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'details':
          result.details.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Instant_Details))!
                as Forecast_Data_Instant_Details,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next12Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
}

abstract class Forecast_Data_Next12Hours_Summary
    implements
        Forecast_Data_Next12Hours_SummaryInterface,
        Built<Forecast_Data_Next12Hours_Summary, Forecast_Data_Next12Hours_SummaryBuilder> {
  factory Forecast_Data_Next12Hours_Summary([final void Function(Forecast_Data_Next12Hours_SummaryBuilder)? b]) =
      _$Forecast_Data_Next12Hours_Summary;

  // coverage:ignore-start
  const Forecast_Data_Next12Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next12Hours_Summary.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next12Hours_Summary> get serializer =>
      const _$Forecast_Data_Next12Hours_SummarySerializer();
}

class _$Forecast_Data_Next12Hours_SummarySerializer implements StructuredSerializer<Forecast_Data_Next12Hours_Summary> {
  const _$Forecast_Data_Next12Hours_SummarySerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next12Hours_Summary, _$Forecast_Data_Next12Hours_Summary];

  @override
  String get wireName => 'Forecast_Data_Next12Hours_Summary';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next12Hours_Summary object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'symbol_code',
      serializers.serialize(object.symbolCode, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next12Hours_Summary deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next12Hours_SummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'symbol_code':
          result.symbolCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next12Hours_DetailsInterface {
  @BuiltValueField(wireName: 'probability_of_precipitation')
  double get probabilityOfPrecipitation;
}

abstract class Forecast_Data_Next12Hours_Details
    implements
        Forecast_Data_Next12Hours_DetailsInterface,
        Built<Forecast_Data_Next12Hours_Details, Forecast_Data_Next12Hours_DetailsBuilder> {
  factory Forecast_Data_Next12Hours_Details([final void Function(Forecast_Data_Next12Hours_DetailsBuilder)? b]) =
      _$Forecast_Data_Next12Hours_Details;

  // coverage:ignore-start
  const Forecast_Data_Next12Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next12Hours_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next12Hours_Details> get serializer =>
      const _$Forecast_Data_Next12Hours_DetailsSerializer();
}

class _$Forecast_Data_Next12Hours_DetailsSerializer implements StructuredSerializer<Forecast_Data_Next12Hours_Details> {
  const _$Forecast_Data_Next12Hours_DetailsSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next12Hours_Details, _$Forecast_Data_Next12Hours_Details];

  @override
  String get wireName => 'Forecast_Data_Next12Hours_Details';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next12Hours_Details object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'probability_of_precipitation',
      serializers.serialize(object.probabilityOfPrecipitation, specifiedType: const FullType(double)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next12Hours_Details deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next12Hours_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'probability_of_precipitation':
          result.probabilityOfPrecipitation =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next12HoursInterface {
  Forecast_Data_Next12Hours_Summary get summary;
  Forecast_Data_Next12Hours_Details get details;
}

abstract class Forecast_Data_Next12Hours
    implements Forecast_Data_Next12HoursInterface, Built<Forecast_Data_Next12Hours, Forecast_Data_Next12HoursBuilder> {
  factory Forecast_Data_Next12Hours([final void Function(Forecast_Data_Next12HoursBuilder)? b]) =
      _$Forecast_Data_Next12Hours;

  // coverage:ignore-start
  const Forecast_Data_Next12Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next12Hours.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next12Hours> get serializer => const _$Forecast_Data_Next12HoursSerializer();
}

class _$Forecast_Data_Next12HoursSerializer implements StructuredSerializer<Forecast_Data_Next12Hours> {
  const _$Forecast_Data_Next12HoursSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next12Hours, _$Forecast_Data_Next12Hours];

  @override
  String get wireName => 'Forecast_Data_Next12Hours';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next12Hours object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(Forecast_Data_Next12Hours_Summary)),
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Next12Hours_Details)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next12Hours deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next12HoursBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'summary':
          result.summary.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next12Hours_Summary))!
                as Forecast_Data_Next12Hours_Summary,
          );
        case 'details':
          result.details.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next12Hours_Details))!
                as Forecast_Data_Next12Hours_Details,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next1Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
}

abstract class Forecast_Data_Next1Hours_Summary
    implements
        Forecast_Data_Next1Hours_SummaryInterface,
        Built<Forecast_Data_Next1Hours_Summary, Forecast_Data_Next1Hours_SummaryBuilder> {
  factory Forecast_Data_Next1Hours_Summary([final void Function(Forecast_Data_Next1Hours_SummaryBuilder)? b]) =
      _$Forecast_Data_Next1Hours_Summary;

  // coverage:ignore-start
  const Forecast_Data_Next1Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next1Hours_Summary.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next1Hours_Summary> get serializer =>
      const _$Forecast_Data_Next1Hours_SummarySerializer();
}

class _$Forecast_Data_Next1Hours_SummarySerializer implements StructuredSerializer<Forecast_Data_Next1Hours_Summary> {
  const _$Forecast_Data_Next1Hours_SummarySerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next1Hours_Summary, _$Forecast_Data_Next1Hours_Summary];

  @override
  String get wireName => 'Forecast_Data_Next1Hours_Summary';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next1Hours_Summary object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'symbol_code',
      serializers.serialize(object.symbolCode, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next1Hours_Summary deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next1Hours_SummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'symbol_code':
          result.symbolCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next1Hours_DetailsInterface {
  @BuiltValueField(wireName: 'precipitation_amount')
  double get precipitationAmount;
  @BuiltValueField(wireName: 'precipitation_amount_max')
  double get precipitationAmountMax;
  @BuiltValueField(wireName: 'precipitation_amount_min')
  double get precipitationAmountMin;
  @BuiltValueField(wireName: 'probability_of_precipitation')
  double get probabilityOfPrecipitation;
  @BuiltValueField(wireName: 'probability_of_thunder')
  double get probabilityOfThunder;
}

abstract class Forecast_Data_Next1Hours_Details
    implements
        Forecast_Data_Next1Hours_DetailsInterface,
        Built<Forecast_Data_Next1Hours_Details, Forecast_Data_Next1Hours_DetailsBuilder> {
  factory Forecast_Data_Next1Hours_Details([final void Function(Forecast_Data_Next1Hours_DetailsBuilder)? b]) =
      _$Forecast_Data_Next1Hours_Details;

  // coverage:ignore-start
  const Forecast_Data_Next1Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next1Hours_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next1Hours_Details> get serializer =>
      const _$Forecast_Data_Next1Hours_DetailsSerializer();
}

class _$Forecast_Data_Next1Hours_DetailsSerializer implements StructuredSerializer<Forecast_Data_Next1Hours_Details> {
  const _$Forecast_Data_Next1Hours_DetailsSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next1Hours_Details, _$Forecast_Data_Next1Hours_Details];

  @override
  String get wireName => 'Forecast_Data_Next1Hours_Details';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next1Hours_Details object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'precipitation_amount',
      serializers.serialize(object.precipitationAmount, specifiedType: const FullType(double)),
      'precipitation_amount_max',
      serializers.serialize(object.precipitationAmountMax, specifiedType: const FullType(double)),
      'precipitation_amount_min',
      serializers.serialize(object.precipitationAmountMin, specifiedType: const FullType(double)),
      'probability_of_precipitation',
      serializers.serialize(object.probabilityOfPrecipitation, specifiedType: const FullType(double)),
      'probability_of_thunder',
      serializers.serialize(object.probabilityOfThunder, specifiedType: const FullType(double)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next1Hours_Details deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next1Hours_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'precipitation_amount':
          result.precipitationAmount = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'precipitation_amount_max':
          result.precipitationAmountMax =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'precipitation_amount_min':
          result.precipitationAmountMin =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'probability_of_precipitation':
          result.probabilityOfPrecipitation =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'probability_of_thunder':
          result.probabilityOfThunder =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next1HoursInterface {
  Forecast_Data_Next1Hours_Summary get summary;
  Forecast_Data_Next1Hours_Details get details;
}

abstract class Forecast_Data_Next1Hours
    implements Forecast_Data_Next1HoursInterface, Built<Forecast_Data_Next1Hours, Forecast_Data_Next1HoursBuilder> {
  factory Forecast_Data_Next1Hours([final void Function(Forecast_Data_Next1HoursBuilder)? b]) =
      _$Forecast_Data_Next1Hours;

  // coverage:ignore-start
  const Forecast_Data_Next1Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next1Hours.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next1Hours> get serializer => const _$Forecast_Data_Next1HoursSerializer();
}

class _$Forecast_Data_Next1HoursSerializer implements StructuredSerializer<Forecast_Data_Next1Hours> {
  const _$Forecast_Data_Next1HoursSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next1Hours, _$Forecast_Data_Next1Hours];

  @override
  String get wireName => 'Forecast_Data_Next1Hours';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next1Hours object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(Forecast_Data_Next1Hours_Summary)),
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Next1Hours_Details)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next1Hours deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next1HoursBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'summary':
          result.summary.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next1Hours_Summary))!
                as Forecast_Data_Next1Hours_Summary,
          );
        case 'details':
          result.details.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next1Hours_Details))!
                as Forecast_Data_Next1Hours_Details,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next6Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
}

abstract class Forecast_Data_Next6Hours_Summary
    implements
        Forecast_Data_Next6Hours_SummaryInterface,
        Built<Forecast_Data_Next6Hours_Summary, Forecast_Data_Next6Hours_SummaryBuilder> {
  factory Forecast_Data_Next6Hours_Summary([final void Function(Forecast_Data_Next6Hours_SummaryBuilder)? b]) =
      _$Forecast_Data_Next6Hours_Summary;

  // coverage:ignore-start
  const Forecast_Data_Next6Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next6Hours_Summary.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next6Hours_Summary> get serializer =>
      const _$Forecast_Data_Next6Hours_SummarySerializer();
}

class _$Forecast_Data_Next6Hours_SummarySerializer implements StructuredSerializer<Forecast_Data_Next6Hours_Summary> {
  const _$Forecast_Data_Next6Hours_SummarySerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next6Hours_Summary, _$Forecast_Data_Next6Hours_Summary];

  @override
  String get wireName => 'Forecast_Data_Next6Hours_Summary';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next6Hours_Summary object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'symbol_code',
      serializers.serialize(object.symbolCode, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next6Hours_Summary deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next6Hours_SummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'symbol_code':
          result.symbolCode = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next6Hours_DetailsInterface {
  @BuiltValueField(wireName: 'air_temperature_max')
  double get airTemperatureMax;
  @BuiltValueField(wireName: 'air_temperature_min')
  double get airTemperatureMin;
  @BuiltValueField(wireName: 'precipitation_amount')
  double get precipitationAmount;
  @BuiltValueField(wireName: 'precipitation_amount_max')
  double get precipitationAmountMax;
  @BuiltValueField(wireName: 'precipitation_amount_min')
  double get precipitationAmountMin;
  @BuiltValueField(wireName: 'probability_of_precipitation')
  double get probabilityOfPrecipitation;
}

abstract class Forecast_Data_Next6Hours_Details
    implements
        Forecast_Data_Next6Hours_DetailsInterface,
        Built<Forecast_Data_Next6Hours_Details, Forecast_Data_Next6Hours_DetailsBuilder> {
  factory Forecast_Data_Next6Hours_Details([final void Function(Forecast_Data_Next6Hours_DetailsBuilder)? b]) =
      _$Forecast_Data_Next6Hours_Details;

  // coverage:ignore-start
  const Forecast_Data_Next6Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next6Hours_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next6Hours_Details> get serializer =>
      const _$Forecast_Data_Next6Hours_DetailsSerializer();
}

class _$Forecast_Data_Next6Hours_DetailsSerializer implements StructuredSerializer<Forecast_Data_Next6Hours_Details> {
  const _$Forecast_Data_Next6Hours_DetailsSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next6Hours_Details, _$Forecast_Data_Next6Hours_Details];

  @override
  String get wireName => 'Forecast_Data_Next6Hours_Details';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next6Hours_Details object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'air_temperature_max',
      serializers.serialize(object.airTemperatureMax, specifiedType: const FullType(double)),
      'air_temperature_min',
      serializers.serialize(object.airTemperatureMin, specifiedType: const FullType(double)),
      'precipitation_amount',
      serializers.serialize(object.precipitationAmount, specifiedType: const FullType(double)),
      'precipitation_amount_max',
      serializers.serialize(object.precipitationAmountMax, specifiedType: const FullType(double)),
      'precipitation_amount_min',
      serializers.serialize(object.precipitationAmountMin, specifiedType: const FullType(double)),
      'probability_of_precipitation',
      serializers.serialize(object.probabilityOfPrecipitation, specifiedType: const FullType(double)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next6Hours_Details deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next6Hours_DetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'air_temperature_max':
          result.airTemperatureMax = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'air_temperature_min':
          result.airTemperatureMin = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'precipitation_amount':
          result.precipitationAmount = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'precipitation_amount_max':
          result.precipitationAmountMax =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'precipitation_amount_min':
          result.precipitationAmountMin =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'probability_of_precipitation':
          result.probabilityOfPrecipitation =
              serializers.deserialize(value, specifiedType: const FullType(double))! as double;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_Data_Next6HoursInterface {
  Forecast_Data_Next6Hours_Summary get summary;
  Forecast_Data_Next6Hours_Details get details;
}

abstract class Forecast_Data_Next6Hours
    implements Forecast_Data_Next6HoursInterface, Built<Forecast_Data_Next6Hours, Forecast_Data_Next6HoursBuilder> {
  factory Forecast_Data_Next6Hours([final void Function(Forecast_Data_Next6HoursBuilder)? b]) =
      _$Forecast_Data_Next6Hours;

  // coverage:ignore-start
  const Forecast_Data_Next6Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data_Next6Hours.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data_Next6Hours> get serializer => const _$Forecast_Data_Next6HoursSerializer();
}

class _$Forecast_Data_Next6HoursSerializer implements StructuredSerializer<Forecast_Data_Next6Hours> {
  const _$Forecast_Data_Next6HoursSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data_Next6Hours, _$Forecast_Data_Next6Hours];

  @override
  String get wireName => 'Forecast_Data_Next6Hours';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data_Next6Hours object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(Forecast_Data_Next6Hours_Summary)),
      'details',
      serializers.serialize(object.details, specifiedType: const FullType(Forecast_Data_Next6Hours_Details)),
    ];
    return result;
  }

  @override
  Forecast_Data_Next6Hours deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_Data_Next6HoursBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'summary':
          result.summary.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next6Hours_Summary))!
                as Forecast_Data_Next6Hours_Summary,
          );
        case 'details':
          result.details.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next6Hours_Details))!
                as Forecast_Data_Next6Hours_Details,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Forecast_DataInterface {
  Forecast_Data_Instant get instant;
  @BuiltValueField(wireName: 'next_12_hours')
  Forecast_Data_Next12Hours get next12Hours;
  @BuiltValueField(wireName: 'next_1_hours')
  Forecast_Data_Next1Hours get next1Hours;
  @BuiltValueField(wireName: 'next_6_hours')
  Forecast_Data_Next6Hours get next6Hours;
}

abstract class Forecast_Data implements Forecast_DataInterface, Built<Forecast_Data, Forecast_DataBuilder> {
  factory Forecast_Data([final void Function(Forecast_DataBuilder)? b]) = _$Forecast_Data;

  // coverage:ignore-start
  const Forecast_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast_Data> get serializer => const _$Forecast_DataSerializer();
}

class _$Forecast_DataSerializer implements StructuredSerializer<Forecast_Data> {
  const _$Forecast_DataSerializer();

  @override
  Iterable<Type> get types => const [Forecast_Data, _$Forecast_Data];

  @override
  String get wireName => 'Forecast_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'instant',
      serializers.serialize(object.instant, specifiedType: const FullType(Forecast_Data_Instant)),
      'next_12_hours',
      serializers.serialize(object.next12Hours, specifiedType: const FullType(Forecast_Data_Next12Hours)),
      'next_1_hours',
      serializers.serialize(object.next1Hours, specifiedType: const FullType(Forecast_Data_Next1Hours)),
      'next_6_hours',
      serializers.serialize(object.next6Hours, specifiedType: const FullType(Forecast_Data_Next6Hours)),
    ];
    return result;
  }

  @override
  Forecast_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Forecast_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'instant':
          result.instant.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Instant))!
                as Forecast_Data_Instant,
          );
        case 'next_12_hours':
          result.next12Hours.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next12Hours))!
                as Forecast_Data_Next12Hours,
          );
        case 'next_1_hours':
          result.next1Hours.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next1Hours))!
                as Forecast_Data_Next1Hours,
          );
        case 'next_6_hours':
          result.next6Hours.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data_Next6Hours))!
                as Forecast_Data_Next6Hours,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ForecastInterface {
  String get time;
  Forecast_Data get data;
}

abstract class Forecast implements ForecastInterface, Built<Forecast, ForecastBuilder> {
  factory Forecast([final void Function(ForecastBuilder)? b]) = _$Forecast;

  // coverage:ignore-start
  const Forecast._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Forecast.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Forecast> get serializer => const _$ForecastSerializer();
}

class _$ForecastSerializer implements StructuredSerializer<Forecast> {
  const _$ForecastSerializer();

  @override
  Iterable<Type> get types => const [Forecast, _$Forecast];

  @override
  String get wireName => 'Forecast';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Forecast object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Forecast_Data)),
    ];
    return result;
  }

  @override
  Forecast deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ForecastBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'time':
          result.time = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(Forecast_Data))! as Forecast_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusGetForecastResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Forecast> get data;
}

abstract class WeatherStatusGetForecastResponseApplicationJson_Ocs
    implements
        WeatherStatusGetForecastResponseApplicationJson_OcsInterface,
        Built<WeatherStatusGetForecastResponseApplicationJson_Ocs,
            WeatherStatusGetForecastResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusGetForecastResponseApplicationJson_Ocs([
    final void Function(WeatherStatusGetForecastResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusGetForecastResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusGetForecastResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetForecastResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusGetForecastResponseApplicationJson_Ocs> get serializer =>
      const _$WeatherStatusGetForecastResponseApplicationJson_OcsSerializer();
}

class _$WeatherStatusGetForecastResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusGetForecastResponseApplicationJson_Ocs> {
  const _$WeatherStatusGetForecastResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusGetForecastResponseApplicationJson_Ocs,
        _$WeatherStatusGetForecastResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'WeatherStatusGetForecastResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusGetForecastResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Forecast)])),
    ];
    return result;
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusGetForecastResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Forecast)]))!
                as BuiltList<Forecast>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusGetForecastResponseApplicationJsonInterface {
  WeatherStatusGetForecastResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusGetForecastResponseApplicationJson
    implements
        WeatherStatusGetForecastResponseApplicationJsonInterface,
        Built<WeatherStatusGetForecastResponseApplicationJson, WeatherStatusGetForecastResponseApplicationJsonBuilder> {
  factory WeatherStatusGetForecastResponseApplicationJson([
    final void Function(WeatherStatusGetForecastResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusGetForecastResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusGetForecastResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetForecastResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusGetForecastResponseApplicationJson> get serializer =>
      const _$WeatherStatusGetForecastResponseApplicationJsonSerializer();
}

class _$WeatherStatusGetForecastResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusGetForecastResponseApplicationJson> {
  const _$WeatherStatusGetForecastResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusGetForecastResponseApplicationJson, _$WeatherStatusGetForecastResponseApplicationJson];

  @override
  String get wireName => 'WeatherStatusGetForecastResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusGetForecastResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusGetForecastResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusGetForecastResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs),
            )! as WeatherStatusGetForecastResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusGetFavoritesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<String> get data;
}

abstract class WeatherStatusGetFavoritesResponseApplicationJson_Ocs
    implements
        WeatherStatusGetFavoritesResponseApplicationJson_OcsInterface,
        Built<WeatherStatusGetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusGetFavoritesResponseApplicationJson_Ocs([
    final void Function(WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusGetFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetFavoritesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusGetFavoritesResponseApplicationJson_Ocs> get serializer =>
      const _$WeatherStatusGetFavoritesResponseApplicationJson_OcsSerializer();
}

class _$WeatherStatusGetFavoritesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusGetFavoritesResponseApplicationJson_Ocs> {
  const _$WeatherStatusGetFavoritesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusGetFavoritesResponseApplicationJson_Ocs,
        _$WeatherStatusGetFavoritesResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'WeatherStatusGetFavoritesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusGetFavoritesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusGetFavoritesResponseApplicationJsonInterface {
  WeatherStatusGetFavoritesResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusGetFavoritesResponseApplicationJson
    implements
        WeatherStatusGetFavoritesResponseApplicationJsonInterface,
        Built<WeatherStatusGetFavoritesResponseApplicationJson,
            WeatherStatusGetFavoritesResponseApplicationJsonBuilder> {
  factory WeatherStatusGetFavoritesResponseApplicationJson([
    final void Function(WeatherStatusGetFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusGetFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusGetFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusGetFavoritesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusGetFavoritesResponseApplicationJson> get serializer =>
      const _$WeatherStatusGetFavoritesResponseApplicationJsonSerializer();
}

class _$WeatherStatusGetFavoritesResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusGetFavoritesResponseApplicationJson> {
  const _$WeatherStatusGetFavoritesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusGetFavoritesResponseApplicationJson, _$WeatherStatusGetFavoritesResponseApplicationJson];

  @override
  String get wireName => 'WeatherStatusGetFavoritesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusGetFavoritesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(WeatherStatusGetFavoritesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusGetFavoritesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusGetFavoritesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(WeatherStatusGetFavoritesResponseApplicationJson_Ocs),
            )! as WeatherStatusGetFavoritesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterface {
  bool get success;
}

abstract class WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data,
            WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data> get serializer =>
      const _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataSerializer();
}

class _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data> {
  const _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data,
        _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetFavoritesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data get data;
}

abstract class WeatherStatusSetFavoritesResponseApplicationJson_Ocs
    implements
        WeatherStatusSetFavoritesResponseApplicationJson_OcsInterface,
        Built<WeatherStatusSetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs([
    final void Function(WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusSetFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetFavoritesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs> get serializer =>
      const _$WeatherStatusSetFavoritesResponseApplicationJson_OcsSerializer();
}

class _$WeatherStatusSetFavoritesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs> {
  const _$WeatherStatusSetFavoritesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        WeatherStatusSetFavoritesResponseApplicationJson_Ocs,
        _$WeatherStatusSetFavoritesResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'WeatherStatusSetFavoritesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetFavoritesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data),
            )! as WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusSetFavoritesResponseApplicationJsonInterface {
  WeatherStatusSetFavoritesResponseApplicationJson_Ocs get ocs;
}

abstract class WeatherStatusSetFavoritesResponseApplicationJson
    implements
        WeatherStatusSetFavoritesResponseApplicationJsonInterface,
        Built<WeatherStatusSetFavoritesResponseApplicationJson,
            WeatherStatusSetFavoritesResponseApplicationJsonBuilder> {
  factory WeatherStatusSetFavoritesResponseApplicationJson([
    final void Function(WeatherStatusSetFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusSetFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusSetFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusSetFavoritesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson> get serializer =>
      const _$WeatherStatusSetFavoritesResponseApplicationJsonSerializer();
}

class _$WeatherStatusSetFavoritesResponseApplicationJsonSerializer
    implements StructuredSerializer<WeatherStatusSetFavoritesResponseApplicationJson> {
  const _$WeatherStatusSetFavoritesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusSetFavoritesResponseApplicationJson, _$WeatherStatusSetFavoritesResponseApplicationJson];

  @override
  String get wireName => 'WeatherStatusSetFavoritesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusSetFavoritesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusSetFavoritesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusSetFavoritesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs),
            )! as WeatherStatusSetFavoritesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_WeatherStatusInterface {
  bool get enabled;
}

abstract class Capabilities_WeatherStatus
    implements
        Capabilities_WeatherStatusInterface,
        Built<Capabilities_WeatherStatus, Capabilities_WeatherStatusBuilder> {
  factory Capabilities_WeatherStatus([final void Function(Capabilities_WeatherStatusBuilder)? b]) =
      _$Capabilities_WeatherStatus;

  // coverage:ignore-start
  const Capabilities_WeatherStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_WeatherStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_WeatherStatus> get serializer => const _$Capabilities_WeatherStatusSerializer();
}

class _$Capabilities_WeatherStatusSerializer implements StructuredSerializer<Capabilities_WeatherStatus> {
  const _$Capabilities_WeatherStatusSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_WeatherStatus, _$Capabilities_WeatherStatus];

  @override
  String get wireName => 'Capabilities_WeatherStatus';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_WeatherStatus object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_WeatherStatus deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_WeatherStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  @BuiltValueField(wireName: 'weather_status')
  Capabilities_WeatherStatus get weatherStatus;
}

abstract class Capabilities implements CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([final void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities> get serializer => const _$CapabilitiesSerializer();
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  const _$CapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities, _$Capabilities];

  @override
  String get wireName => 'Capabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'weather_status',
      serializers.serialize(object.weatherStatus, specifiedType: const FullType(Capabilities_WeatherStatus)),
    ];
    return result;
  }

  @override
  Capabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'weather_status':
          result.weatherStatus.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_WeatherStatus))!
                as Capabilities_WeatherStatus,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(WeatherStatusSetModeResponseApplicationJson),
        WeatherStatusSetModeResponseApplicationJson.new,
      )
      ..add(WeatherStatusSetModeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs),
        WeatherStatusSetModeResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusSetModeResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetModeResponseApplicationJson_Ocs_Data),
        WeatherStatusSetModeResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusSetModeResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson),
        WeatherStatusUsePersonalAddressResponseApplicationJson.new,
      )
      ..add(WeatherStatusUsePersonalAddressResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs),
        WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data),
        WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetLocationResponseApplicationJson),
        WeatherStatusGetLocationResponseApplicationJson.new,
      )
      ..add(WeatherStatusGetLocationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs),
        WeatherStatusGetLocationResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusGetLocationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetLocationResponseApplicationJson_Ocs_Data),
        WeatherStatusGetLocationResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusGetLocationResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetLocationResponseApplicationJson),
        WeatherStatusSetLocationResponseApplicationJson.new,
      )
      ..add(WeatherStatusSetLocationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs),
        WeatherStatusSetLocationResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusSetLocationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetLocationResponseApplicationJson_Ocs_Data),
        WeatherStatusSetLocationResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusSetLocationResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetForecastResponseApplicationJson),
        WeatherStatusGetForecastResponseApplicationJson.new,
      )
      ..add(WeatherStatusGetForecastResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetForecastResponseApplicationJson_Ocs),
        WeatherStatusGetForecastResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusGetForecastResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Forecast), Forecast.new)
      ..add(Forecast.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data), Forecast_Data.new)
      ..add(Forecast_Data.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Instant), Forecast_Data_Instant.new)
      ..add(Forecast_Data_Instant.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Instant_Details), Forecast_Data_Instant_Details.new)
      ..add(Forecast_Data_Instant_Details.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next12Hours), Forecast_Data_Next12Hours.new)
      ..add(Forecast_Data_Next12Hours.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next12Hours_Summary), Forecast_Data_Next12Hours_Summary.new)
      ..add(Forecast_Data_Next12Hours_Summary.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next12Hours_Details), Forecast_Data_Next12Hours_Details.new)
      ..add(Forecast_Data_Next12Hours_Details.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next1Hours), Forecast_Data_Next1Hours.new)
      ..add(Forecast_Data_Next1Hours.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next1Hours_Summary), Forecast_Data_Next1Hours_Summary.new)
      ..add(Forecast_Data_Next1Hours_Summary.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next1Hours_Details), Forecast_Data_Next1Hours_Details.new)
      ..add(Forecast_Data_Next1Hours_Details.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next6Hours), Forecast_Data_Next6Hours.new)
      ..add(Forecast_Data_Next6Hours.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next6Hours_Summary), Forecast_Data_Next6Hours_Summary.new)
      ..add(Forecast_Data_Next6Hours_Summary.serializer)
      ..addBuilderFactory(const FullType(Forecast_Data_Next6Hours_Details), Forecast_Data_Next6Hours_Details.new)
      ..add(Forecast_Data_Next6Hours_Details.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Forecast)]), ListBuilder<Forecast>.new)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetFavoritesResponseApplicationJson),
        WeatherStatusGetFavoritesResponseApplicationJson.new,
      )
      ..add(WeatherStatusGetFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusGetFavoritesResponseApplicationJson_Ocs),
        WeatherStatusGetFavoritesResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusGetFavoritesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetFavoritesResponseApplicationJson),
        WeatherStatusSetFavoritesResponseApplicationJson.new,
      )
      ..add(WeatherStatusSetFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs),
        WeatherStatusSetFavoritesResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusSetFavoritesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data),
        WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_WeatherStatus), Capabilities_WeatherStatus.new)
      ..add(Capabilities_WeatherStatus.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
