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

part 'weather_status.openapi.g.dart';

class WeatherStatusResponse<T, U> extends DynamiteResponse<T, U> {
  WeatherStatusResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'WeatherStatusResponse(data: $data, headers: $headers)';
}

class WeatherStatusApiException extends DynamiteApiException {
  WeatherStatusApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<WeatherStatusApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return WeatherStatusApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'WeatherStatusApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class WeatherStatusClient extends DynamiteClient {
  WeatherStatusClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  WeatherStatusClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  WeatherStatusWeatherStatusClient get weatherStatus => WeatherStatusWeatherStatusClient(this);
}

class WeatherStatusWeatherStatusClient {
  WeatherStatusWeatherStatusClient(this._rootClient);

  final WeatherStatusClient _rootClient;

  /// Change the weather status mode. There are currently 2 modes: - ask the browser - use the user defined address
  Future<WeatherStatusWeatherStatusSetModeResponse200ApplicationJson> setMode({
    required final int mode,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/mode';
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
    queryParameters['mode'] = mode.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson),
      )! as WeatherStatusWeatherStatusSetModeResponse200ApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Try to use the address set in user personal settings as weather location
  Future<WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson> usePersonalAddress({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/use-personal';
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
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson),
      )! as WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get stored user location
  Future<WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson> getLocation({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/location';
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson),
      )! as WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set address and resolve it to get coordinates or directly set coordinates and get address with reverse geocoding
  Future<WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson> setLocation({
    final String? address,
    final num? lat,
    final num? lon,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/location';
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
    if (address != null) {
      queryParameters['address'] = address;
    }
    if (lat != null) {
      queryParameters['lat'] = lat.toString();
    }
    if (lon != null) {
      queryParameters['lon'] = lon.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson),
      )! as WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get forecast for current location
  Future<WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson> getForecast({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/forecast';
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson),
      )! as WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get favorites list
  Future<WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson> getFavorites({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/favorites';
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
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson),
      )! as WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set favorites list
  Future<WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson> setFavorites({
    required final List<String> favorites,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/favorites';
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
    queryParameters['favorites[]'] = favorites.map((final e) => e);
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson),
      )! as WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class WeatherStatusOCSMeta implements Built<WeatherStatusOCSMeta, WeatherStatusOCSMetaBuilder> {
  factory WeatherStatusOCSMeta([final void Function(WeatherStatusOCSMetaBuilder)? b]) = _$WeatherStatusOCSMeta;

  // coverage:ignore-start
  const WeatherStatusOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusOCSMeta.fromJson(final Map<String, dynamic> json) =>
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
  static Serializer<WeatherStatusOCSMeta> get serializer => _$weatherStatusOCSMetaSerializer;
}

abstract class WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data
    implements
        Built<WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusSetModeResponse200ApplicationJsonOcsDataSerializer;
}

abstract class WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs
    implements
        Built<WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs,
            WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusSetModeResponse200ApplicationJsonOcsSerializer;
}

abstract class WeatherStatusWeatherStatusSetModeResponse200ApplicationJson
    implements
        Built<WeatherStatusWeatherStatusSetModeResponse200ApplicationJson,
            WeatherStatusWeatherStatusSetModeResponse200ApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusSetModeResponse200ApplicationJson([
    final void Function(WeatherStatusWeatherStatusSetModeResponse200ApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetModeResponse200ApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetModeResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetModeResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs get ocs;
  static Serializer<WeatherStatusWeatherStatusSetModeResponse200ApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusSetModeResponse200ApplicationJsonSerializer;
}

abstract class WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data
    implements
        Built<WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  num? get lat;
  num? get lon;
  String? get address;
  static Serializer<WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJsonOcsDataSerializer;
}

abstract class WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs
    implements
        Built<WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs,
            WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJsonOcsSerializer;
}

abstract class WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson
    implements
        Built<WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson,
            WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson([
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs get ocs;
  static Serializer<WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJsonSerializer;
}

abstract class WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data
    implements
        Built<WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  num get lat;
  num get lon;
  String get address;
  int get mode;
  static Serializer<WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusGetLocationResponse200ApplicationJsonOcsDataSerializer;
}

abstract class WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs
    implements
        Built<WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs,
            WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusGetLocationResponse200ApplicationJsonOcsSerializer;
}

abstract class WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson
    implements
        Built<WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson,
            WeatherStatusWeatherStatusGetLocationResponse200ApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson([
    final void Function(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs get ocs;
  static Serializer<WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusGetLocationResponse200ApplicationJsonSerializer;
}

abstract class WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data
    implements
        Built<WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  num? get lat;
  num? get lon;
  String? get address;
  static Serializer<WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusSetLocationResponse200ApplicationJsonOcsDataSerializer;
}

abstract class WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs
    implements
        Built<WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs,
            WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusSetLocationResponse200ApplicationJsonOcsSerializer;
}

abstract class WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson
    implements
        Built<WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson,
            WeatherStatusWeatherStatusSetLocationResponse200ApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson([
    final void Function(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs get ocs;
  static Serializer<WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusSetLocationResponse200ApplicationJsonSerializer;
}

abstract class WeatherStatusForecast_Data_Instant_Details
    implements Built<WeatherStatusForecast_Data_Instant_Details, WeatherStatusForecast_Data_Instant_DetailsBuilder> {
  factory WeatherStatusForecast_Data_Instant_Details([
    final void Function(WeatherStatusForecast_Data_Instant_DetailsBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Instant_Details;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Instant_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Instant_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'air_pressure_at_sea_level')
  num get airPressureAtSeaLevel;
  @BuiltValueField(wireName: 'air_temperature')
  num get airTemperature;
  @BuiltValueField(wireName: 'cloud_area_fraction')
  num get cloudAreaFraction;
  @BuiltValueField(wireName: 'cloud_area_fraction_high')
  num get cloudAreaFractionHigh;
  @BuiltValueField(wireName: 'cloud_area_fraction_low')
  num get cloudAreaFractionLow;
  @BuiltValueField(wireName: 'cloud_area_fraction_medium')
  num get cloudAreaFractionMedium;
  @BuiltValueField(wireName: 'dew_point_temperature')
  num get dewPointTemperature;
  @BuiltValueField(wireName: 'fog_area_fraction')
  num get fogAreaFraction;
  @BuiltValueField(wireName: 'relative_humidity')
  num get relativeHumidity;
  @BuiltValueField(wireName: 'ultraviolet_index_clear_sky')
  num get ultravioletIndexClearSky;
  @BuiltValueField(wireName: 'wind_from_direction')
  num get windFromDirection;
  @BuiltValueField(wireName: 'wind_speed')
  num get windSpeed;
  @BuiltValueField(wireName: 'wind_speed_of_gust')
  num get windSpeedOfGust;
  static Serializer<WeatherStatusForecast_Data_Instant_Details> get serializer =>
      _$weatherStatusForecastDataInstantDetailsSerializer;
}

abstract class WeatherStatusForecast_Data_Instant
    implements Built<WeatherStatusForecast_Data_Instant, WeatherStatusForecast_Data_InstantBuilder> {
  factory WeatherStatusForecast_Data_Instant([final void Function(WeatherStatusForecast_Data_InstantBuilder)? b]) =
      _$WeatherStatusForecast_Data_Instant;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Instant._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Instant.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusForecast_Data_Instant_Details get details;
  static Serializer<WeatherStatusForecast_Data_Instant> get serializer => _$weatherStatusForecastDataInstantSerializer;
}

abstract class WeatherStatusForecast_Data_Next12Hours_Summary
    implements
        Built<WeatherStatusForecast_Data_Next12Hours_Summary, WeatherStatusForecast_Data_Next12Hours_SummaryBuilder> {
  factory WeatherStatusForecast_Data_Next12Hours_Summary([
    final void Function(WeatherStatusForecast_Data_Next12Hours_SummaryBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next12Hours_Summary;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next12Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next12Hours_Summary.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
  static Serializer<WeatherStatusForecast_Data_Next12Hours_Summary> get serializer =>
      _$weatherStatusForecastDataNext12HoursSummarySerializer;
}

abstract class WeatherStatusForecast_Data_Next12Hours_Details
    implements
        Built<WeatherStatusForecast_Data_Next12Hours_Details, WeatherStatusForecast_Data_Next12Hours_DetailsBuilder> {
  factory WeatherStatusForecast_Data_Next12Hours_Details([
    final void Function(WeatherStatusForecast_Data_Next12Hours_DetailsBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next12Hours_Details;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next12Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next12Hours_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'probability_of_precipitation')
  num get probabilityOfPrecipitation;
  static Serializer<WeatherStatusForecast_Data_Next12Hours_Details> get serializer =>
      _$weatherStatusForecastDataNext12HoursDetailsSerializer;
}

abstract class WeatherStatusForecast_Data_Next12Hours
    implements Built<WeatherStatusForecast_Data_Next12Hours, WeatherStatusForecast_Data_Next12HoursBuilder> {
  factory WeatherStatusForecast_Data_Next12Hours([
    final void Function(WeatherStatusForecast_Data_Next12HoursBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next12Hours;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next12Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next12Hours.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusForecast_Data_Next12Hours_Summary get summary;
  WeatherStatusForecast_Data_Next12Hours_Details get details;
  static Serializer<WeatherStatusForecast_Data_Next12Hours> get serializer =>
      _$weatherStatusForecastDataNext12HoursSerializer;
}

abstract class WeatherStatusForecast_Data_Next1Hours_Summary
    implements
        Built<WeatherStatusForecast_Data_Next1Hours_Summary, WeatherStatusForecast_Data_Next1Hours_SummaryBuilder> {
  factory WeatherStatusForecast_Data_Next1Hours_Summary([
    final void Function(WeatherStatusForecast_Data_Next1Hours_SummaryBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next1Hours_Summary;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next1Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next1Hours_Summary.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
  static Serializer<WeatherStatusForecast_Data_Next1Hours_Summary> get serializer =>
      _$weatherStatusForecastDataNext1HoursSummarySerializer;
}

abstract class WeatherStatusForecast_Data_Next1Hours_Details
    implements
        Built<WeatherStatusForecast_Data_Next1Hours_Details, WeatherStatusForecast_Data_Next1Hours_DetailsBuilder> {
  factory WeatherStatusForecast_Data_Next1Hours_Details([
    final void Function(WeatherStatusForecast_Data_Next1Hours_DetailsBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next1Hours_Details;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next1Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next1Hours_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'precipitation_amount')
  num get precipitationAmount;
  @BuiltValueField(wireName: 'precipitation_amount_max')
  num get precipitationAmountMax;
  @BuiltValueField(wireName: 'precipitation_amount_min')
  num get precipitationAmountMin;
  @BuiltValueField(wireName: 'probability_of_precipitation')
  num get probabilityOfPrecipitation;
  @BuiltValueField(wireName: 'probability_of_thunder')
  num get probabilityOfThunder;
  static Serializer<WeatherStatusForecast_Data_Next1Hours_Details> get serializer =>
      _$weatherStatusForecastDataNext1HoursDetailsSerializer;
}

abstract class WeatherStatusForecast_Data_Next1Hours
    implements Built<WeatherStatusForecast_Data_Next1Hours, WeatherStatusForecast_Data_Next1HoursBuilder> {
  factory WeatherStatusForecast_Data_Next1Hours([
    final void Function(WeatherStatusForecast_Data_Next1HoursBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next1Hours;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next1Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next1Hours.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusForecast_Data_Next1Hours_Summary get summary;
  WeatherStatusForecast_Data_Next1Hours_Details get details;
  static Serializer<WeatherStatusForecast_Data_Next1Hours> get serializer =>
      _$weatherStatusForecastDataNext1HoursSerializer;
}

abstract class WeatherStatusForecast_Data_Next6Hours_Summary
    implements
        Built<WeatherStatusForecast_Data_Next6Hours_Summary, WeatherStatusForecast_Data_Next6Hours_SummaryBuilder> {
  factory WeatherStatusForecast_Data_Next6Hours_Summary([
    final void Function(WeatherStatusForecast_Data_Next6Hours_SummaryBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next6Hours_Summary;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next6Hours_Summary._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next6Hours_Summary.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
  static Serializer<WeatherStatusForecast_Data_Next6Hours_Summary> get serializer =>
      _$weatherStatusForecastDataNext6HoursSummarySerializer;
}

abstract class WeatherStatusForecast_Data_Next6Hours_Details
    implements
        Built<WeatherStatusForecast_Data_Next6Hours_Details, WeatherStatusForecast_Data_Next6Hours_DetailsBuilder> {
  factory WeatherStatusForecast_Data_Next6Hours_Details([
    final void Function(WeatherStatusForecast_Data_Next6Hours_DetailsBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next6Hours_Details;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next6Hours_Details._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next6Hours_Details.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'air_temperature_max')
  num get airTemperatureMax;
  @BuiltValueField(wireName: 'air_temperature_min')
  num get airTemperatureMin;
  @BuiltValueField(wireName: 'precipitation_amount')
  num get precipitationAmount;
  @BuiltValueField(wireName: 'precipitation_amount_max')
  num get precipitationAmountMax;
  @BuiltValueField(wireName: 'precipitation_amount_min')
  num get precipitationAmountMin;
  @BuiltValueField(wireName: 'probability_of_precipitation')
  num get probabilityOfPrecipitation;
  static Serializer<WeatherStatusForecast_Data_Next6Hours_Details> get serializer =>
      _$weatherStatusForecastDataNext6HoursDetailsSerializer;
}

abstract class WeatherStatusForecast_Data_Next6Hours
    implements Built<WeatherStatusForecast_Data_Next6Hours, WeatherStatusForecast_Data_Next6HoursBuilder> {
  factory WeatherStatusForecast_Data_Next6Hours([
    final void Function(WeatherStatusForecast_Data_Next6HoursBuilder)? b,
  ]) = _$WeatherStatusForecast_Data_Next6Hours;

  // coverage:ignore-start
  const WeatherStatusForecast_Data_Next6Hours._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data_Next6Hours.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusForecast_Data_Next6Hours_Summary get summary;
  WeatherStatusForecast_Data_Next6Hours_Details get details;
  static Serializer<WeatherStatusForecast_Data_Next6Hours> get serializer =>
      _$weatherStatusForecastDataNext6HoursSerializer;
}

abstract class WeatherStatusForecast_Data
    implements Built<WeatherStatusForecast_Data, WeatherStatusForecast_DataBuilder> {
  factory WeatherStatusForecast_Data([final void Function(WeatherStatusForecast_DataBuilder)? b]) =
      _$WeatherStatusForecast_Data;

  // coverage:ignore-start
  const WeatherStatusForecast_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusForecast_Data_Instant get instant;
  @BuiltValueField(wireName: 'next_12_hours')
  WeatherStatusForecast_Data_Next12Hours get next12Hours;
  @BuiltValueField(wireName: 'next_1_hours')
  WeatherStatusForecast_Data_Next1Hours get next1Hours;
  @BuiltValueField(wireName: 'next_6_hours')
  WeatherStatusForecast_Data_Next6Hours get next6Hours;
  static Serializer<WeatherStatusForecast_Data> get serializer => _$weatherStatusForecastDataSerializer;
}

abstract class WeatherStatusForecast implements Built<WeatherStatusForecast, WeatherStatusForecastBuilder> {
  factory WeatherStatusForecast([final void Function(WeatherStatusForecastBuilder)? b]) = _$WeatherStatusForecast;

  // coverage:ignore-start
  const WeatherStatusForecast._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusForecast.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get time;
  WeatherStatusForecast_Data get data;
  static Serializer<WeatherStatusForecast> get serializer => _$weatherStatusForecastSerializer;
}

abstract class WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs
    implements
        Built<WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs,
            WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusOCSMeta get meta;
  BuiltList<WeatherStatusForecast> get data;
  static Serializer<WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusGetForecastResponse200ApplicationJsonOcsSerializer;
}

abstract class WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson
    implements
        Built<WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson,
            WeatherStatusWeatherStatusGetForecastResponse200ApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson([
    final void Function(WeatherStatusWeatherStatusGetForecastResponse200ApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs get ocs;
  static Serializer<WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusGetForecastResponse200ApplicationJsonSerializer;
}

abstract class WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs
    implements
        Built<WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs,
            WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusOCSMeta get meta;
  BuiltList<String> get data;
  static Serializer<WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusGetFavoritesResponse200ApplicationJsonOcsSerializer;
}

abstract class WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson
    implements
        Built<WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson,
            WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson([
    final void Function(WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusGetFavoritesResponse200ApplicationJsonSerializer;
}

abstract class WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data
    implements
        Built<WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusSetFavoritesResponse200ApplicationJsonOcsDataSerializer;
}

abstract class WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs
    implements
        Built<WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs,
            WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusSetFavoritesResponse200ApplicationJsonOcsSerializer;
}

abstract class WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson
    implements
        Built<WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson,
            WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson([
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusSetFavoritesResponse200ApplicationJsonSerializer;
}

abstract class WeatherStatusCapabilities_WeatherStatus
    implements Built<WeatherStatusCapabilities_WeatherStatus, WeatherStatusCapabilities_WeatherStatusBuilder> {
  factory WeatherStatusCapabilities_WeatherStatus([
    final void Function(WeatherStatusCapabilities_WeatherStatusBuilder)? b,
  ]) = _$WeatherStatusCapabilities_WeatherStatus;

  // coverage:ignore-start
  const WeatherStatusCapabilities_WeatherStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusCapabilities_WeatherStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get enabled;
  static Serializer<WeatherStatusCapabilities_WeatherStatus> get serializer =>
      _$weatherStatusCapabilitiesWeatherStatusSerializer;
}

abstract class WeatherStatusCapabilities implements Built<WeatherStatusCapabilities, WeatherStatusCapabilitiesBuilder> {
  factory WeatherStatusCapabilities([final void Function(WeatherStatusCapabilitiesBuilder)? b]) =
      _$WeatherStatusCapabilities;

  // coverage:ignore-start
  const WeatherStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'weather_status')
  WeatherStatusCapabilities_WeatherStatus get weatherStatus;
  static Serializer<WeatherStatusCapabilities> get serializer => _$weatherStatusCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson),
        WeatherStatusWeatherStatusSetModeResponse200ApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs),
        WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusOCSMeta), WeatherStatusOCSMeta.new)
      ..add(WeatherStatusOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusSetModeResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson),
        WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs),
        WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusUsePersonalAddressResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson),
        WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs),
        WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusGetLocationResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson),
        WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs),
        WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusSetLocationResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson),
        WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs),
        WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusGetForecastResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusForecast), WeatherStatusForecast.new)
      ..add(WeatherStatusForecast.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusForecast_Data), WeatherStatusForecast_Data.new)
      ..add(WeatherStatusForecast_Data.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusForecast_Data_Instant), WeatherStatusForecast_Data_Instant.new)
      ..add(WeatherStatusForecast_Data_Instant.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Instant_Details),
        WeatherStatusForecast_Data_Instant_Details.new,
      )
      ..add(WeatherStatusForecast_Data_Instant_Details.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next12Hours),
        WeatherStatusForecast_Data_Next12Hours.new,
      )
      ..add(WeatherStatusForecast_Data_Next12Hours.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next12Hours_Summary),
        WeatherStatusForecast_Data_Next12Hours_Summary.new,
      )
      ..add(WeatherStatusForecast_Data_Next12Hours_Summary.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next12Hours_Details),
        WeatherStatusForecast_Data_Next12Hours_Details.new,
      )
      ..add(WeatherStatusForecast_Data_Next12Hours_Details.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next1Hours),
        WeatherStatusForecast_Data_Next1Hours.new,
      )
      ..add(WeatherStatusForecast_Data_Next1Hours.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next1Hours_Summary),
        WeatherStatusForecast_Data_Next1Hours_Summary.new,
      )
      ..add(WeatherStatusForecast_Data_Next1Hours_Summary.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next1Hours_Details),
        WeatherStatusForecast_Data_Next1Hours_Details.new,
      )
      ..add(WeatherStatusForecast_Data_Next1Hours_Details.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next6Hours),
        WeatherStatusForecast_Data_Next6Hours.new,
      )
      ..add(WeatherStatusForecast_Data_Next6Hours.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next6Hours_Summary),
        WeatherStatusForecast_Data_Next6Hours_Summary.new,
      )
      ..add(WeatherStatusForecast_Data_Next6Hours_Summary.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusForecast_Data_Next6Hours_Details),
        WeatherStatusForecast_Data_Next6Hours_Details.new,
      )
      ..add(WeatherStatusForecast_Data_Next6Hours_Details.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(WeatherStatusForecast)]),
        ListBuilder<WeatherStatusForecast>.new,
      )
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson),
        WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs),
        WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusGetFavoritesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson),
        WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs),
        WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusSetFavoritesResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusCapabilities), WeatherStatusCapabilities.new)
      ..add(WeatherStatusCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusCapabilities_WeatherStatus),
        WeatherStatusCapabilities_WeatherStatus.new,
      )
      ..add(WeatherStatusCapabilities_WeatherStatus.serializer))
    .build();

Serializers get weatherStatusSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeWeatherStatus<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeWeatherStatus<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
