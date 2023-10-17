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
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

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
    const path = '/ocs/v2.php/apps/weather_status/api/v1/mode';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    const path = '/ocs/v2.php/apps/weather_status/api/v1/use-personal';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    const path = '/ocs/v2.php/apps/weather_status/api/v1/location';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    const path = '/ocs/v2.php/apps/weather_status/api/v1/location';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    const path = '/ocs/v2.php/apps/weather_status/api/v1/forecast';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    const path = '/ocs/v2.php/apps/weather_status/api/v1/favorites';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    const path = '/ocs/v2.php/apps/weather_status/api/v1/favorites';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
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

  static Serializer<WeatherStatusSetModeResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusSetModeResponseApplicationJsonOcsDataSerializer;
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

  static Serializer<WeatherStatusSetModeResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusSetModeResponseApplicationJsonOcsSerializer;
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

  static Serializer<WeatherStatusSetModeResponseApplicationJson> get serializer =>
      _$weatherStatusSetModeResponseApplicationJsonSerializer;
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

  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusUsePersonalAddressResponseApplicationJsonOcsDataSerializer;
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

  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusUsePersonalAddressResponseApplicationJsonOcsSerializer;
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

  static Serializer<WeatherStatusUsePersonalAddressResponseApplicationJson> get serializer =>
      _$weatherStatusUsePersonalAddressResponseApplicationJsonSerializer;
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

  static Serializer<WeatherStatusGetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusGetLocationResponseApplicationJsonOcsDataSerializer;
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

  static Serializer<WeatherStatusGetLocationResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusGetLocationResponseApplicationJsonOcsSerializer;
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

  static Serializer<WeatherStatusGetLocationResponseApplicationJson> get serializer =>
      _$weatherStatusGetLocationResponseApplicationJsonSerializer;
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

  static Serializer<WeatherStatusSetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusSetLocationResponseApplicationJsonOcsDataSerializer;
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

  static Serializer<WeatherStatusSetLocationResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusSetLocationResponseApplicationJsonOcsSerializer;
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

  static Serializer<WeatherStatusSetLocationResponseApplicationJson> get serializer =>
      _$weatherStatusSetLocationResponseApplicationJsonSerializer;
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

  static Serializer<Forecast_Data_Instant_Details> get serializer => _$forecastDataInstantDetailsSerializer;
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

  static Serializer<Forecast_Data_Instant> get serializer => _$forecastDataInstantSerializer;
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

  static Serializer<Forecast_Data_Next12Hours_Summary> get serializer => _$forecastDataNext12HoursSummarySerializer;
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

  static Serializer<Forecast_Data_Next12Hours_Details> get serializer => _$forecastDataNext12HoursDetailsSerializer;
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

  static Serializer<Forecast_Data_Next12Hours> get serializer => _$forecastDataNext12HoursSerializer;
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

  static Serializer<Forecast_Data_Next1Hours_Summary> get serializer => _$forecastDataNext1HoursSummarySerializer;
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

  static Serializer<Forecast_Data_Next1Hours_Details> get serializer => _$forecastDataNext1HoursDetailsSerializer;
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

  static Serializer<Forecast_Data_Next1Hours> get serializer => _$forecastDataNext1HoursSerializer;
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

  static Serializer<Forecast_Data_Next6Hours_Summary> get serializer => _$forecastDataNext6HoursSummarySerializer;
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

  static Serializer<Forecast_Data_Next6Hours_Details> get serializer => _$forecastDataNext6HoursDetailsSerializer;
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

  static Serializer<Forecast_Data_Next6Hours> get serializer => _$forecastDataNext6HoursSerializer;
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

  static Serializer<Forecast_Data> get serializer => _$forecastDataSerializer;
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

  static Serializer<Forecast> get serializer => _$forecastSerializer;
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

  static Serializer<WeatherStatusGetForecastResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusGetForecastResponseApplicationJsonOcsSerializer;
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

  static Serializer<WeatherStatusGetForecastResponseApplicationJson> get serializer =>
      _$weatherStatusGetForecastResponseApplicationJsonSerializer;
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

  static Serializer<WeatherStatusGetFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusGetFavoritesResponseApplicationJsonOcsSerializer;
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

  static Serializer<WeatherStatusGetFavoritesResponseApplicationJson> get serializer =>
      _$weatherStatusGetFavoritesResponseApplicationJsonSerializer;
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

  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusSetFavoritesResponseApplicationJsonOcsDataSerializer;
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

  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusSetFavoritesResponseApplicationJsonOcsSerializer;
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

  static Serializer<WeatherStatusSetFavoritesResponseApplicationJson> get serializer =>
      _$weatherStatusSetFavoritesResponseApplicationJsonSerializer;
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

  static Serializer<Capabilities_WeatherStatus> get serializer => _$capabilitiesWeatherStatusSerializer;
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

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
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
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
