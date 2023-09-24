// ignore_for_file: camel_case_types
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
  Future<WeatherStatusWeatherStatusSetModeResponseApplicationJson> setMode({
    required final int mode,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/mode';
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
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusSetModeResponseApplicationJson),
      )! as WeatherStatusWeatherStatusSetModeResponseApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Try to use the address set in user personal settings as weather location
  Future<WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson> usePersonalAddress({
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/use-personal';
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
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson),
      )! as WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get stored user location
  Future<WeatherStatusWeatherStatusGetLocationResponseApplicationJson> getLocation({
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/location';
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusGetLocationResponseApplicationJson),
      )! as WeatherStatusWeatherStatusGetLocationResponseApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set address and resolve it to get coordinates or directly set coordinates and get address with reverse geocoding
  Future<WeatherStatusWeatherStatusSetLocationResponseApplicationJson> setLocation({
    final String? address,
    final num? lat,
    final num? lon,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/location';
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
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusSetLocationResponseApplicationJson),
      )! as WeatherStatusWeatherStatusSetLocationResponseApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get forecast for current location
  Future<WeatherStatusWeatherStatusGetForecastResponseApplicationJson> getForecast({
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/forecast';
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusGetForecastResponseApplicationJson),
      )! as WeatherStatusWeatherStatusGetForecastResponseApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get favorites list
  Future<WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson> getFavorites({
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/favorites';
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson),
      )! as WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set favorites list
  Future<WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson> setFavorites({
    required final List<String> favorites,
    final bool oCSAPIRequest = true,
  }) async {
    const path = '/ocs/v2.php/apps/weather_status/api/v1/favorites';
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
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson),
      )! as WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson;
    }
    throw await WeatherStatusApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  WeatherStatusOCSMetaInterface rebuild(final void Function(WeatherStatusOCSMetaInterfaceBuilder) updates);
  WeatherStatusOCSMetaInterfaceBuilder toBuilder();
}

abstract class WeatherStatusOCSMeta
    implements WeatherStatusOCSMetaInterface, Built<WeatherStatusOCSMeta, WeatherStatusOCSMetaBuilder> {
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

  static Serializer<WeatherStatusOCSMeta> get serializer => _$weatherStatusOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusSetModeResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetModeResponseApplicationJson_OcsInterface {
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data get data;
  WeatherStatusWeatherStatusSetModeResponseApplicationJson_OcsInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetModeResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetModeResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs
    implements
        WeatherStatusWeatherStatusSetModeResponseApplicationJson_OcsInterface,
        Built<WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs,
            WeatherStatusWeatherStatusSetModeResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusSetModeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusSetModeResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetModeResponseApplicationJsonInterface {
  WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs get ocs;
  WeatherStatusWeatherStatusSetModeResponseApplicationJsonInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetModeResponseApplicationJsonInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetModeResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetModeResponseApplicationJson
    implements
        WeatherStatusWeatherStatusSetModeResponseApplicationJsonInterface,
        Built<WeatherStatusWeatherStatusSetModeResponseApplicationJson,
            WeatherStatusWeatherStatusSetModeResponseApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusSetModeResponseApplicationJson([
    final void Function(WeatherStatusWeatherStatusSetModeResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetModeResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetModeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetModeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetModeResponseApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusSetModeResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  num? get lat;
  num? get lon;
  String? get address;
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterfaceBuilder)
        updates,
  );
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface {
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data get data;
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface rebuild(
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs
    implements
        WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_OcsInterface,
        Built<WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs,
            WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonInterface {
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs get ocs;
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonInterface rebuild(
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson
    implements
        WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonInterface,
        Built<WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson,
            WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson([
    final void Function(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusUsePersonalAddressResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterface {
  num get lat;
  num get lon;
  String get address;
  int get mode;
  WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusGetLocationResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusGetLocationResponseApplicationJson_OcsInterface {
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data get data;
  WeatherStatusWeatherStatusGetLocationResponseApplicationJson_OcsInterface rebuild(
    final void Function(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusGetLocationResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs
    implements
        WeatherStatusWeatherStatusGetLocationResponseApplicationJson_OcsInterface,
        Built<WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs,
            WeatherStatusWeatherStatusGetLocationResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusGetLocationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusGetLocationResponseApplicationJsonInterface {
  WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs get ocs;
  WeatherStatusWeatherStatusGetLocationResponseApplicationJsonInterface rebuild(
    final void Function(WeatherStatusWeatherStatusGetLocationResponseApplicationJsonInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusGetLocationResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusGetLocationResponseApplicationJson
    implements
        WeatherStatusWeatherStatusGetLocationResponseApplicationJsonInterface,
        Built<WeatherStatusWeatherStatusGetLocationResponseApplicationJson,
            WeatherStatusWeatherStatusGetLocationResponseApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusGetLocationResponseApplicationJson([
    final void Function(WeatherStatusWeatherStatusGetLocationResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetLocationResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetLocationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetLocationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusGetLocationResponseApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusGetLocationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  num? get lat;
  num? get lon;
  String? get address;
  WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusSetLocationResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetLocationResponseApplicationJson_OcsInterface {
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data get data;
  WeatherStatusWeatherStatusSetLocationResponseApplicationJson_OcsInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetLocationResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs
    implements
        WeatherStatusWeatherStatusSetLocationResponseApplicationJson_OcsInterface,
        Built<WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs,
            WeatherStatusWeatherStatusSetLocationResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusSetLocationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetLocationResponseApplicationJsonInterface {
  WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs get ocs;
  WeatherStatusWeatherStatusSetLocationResponseApplicationJsonInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetLocationResponseApplicationJsonInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetLocationResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetLocationResponseApplicationJson
    implements
        WeatherStatusWeatherStatusSetLocationResponseApplicationJsonInterface,
        Built<WeatherStatusWeatherStatusSetLocationResponseApplicationJson,
            WeatherStatusWeatherStatusSetLocationResponseApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusSetLocationResponseApplicationJson([
    final void Function(WeatherStatusWeatherStatusSetLocationResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetLocationResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetLocationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetLocationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetLocationResponseApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusSetLocationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Instant_DetailsInterface {
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
  WeatherStatusForecast_Data_Instant_DetailsInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Instant_DetailsInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Instant_DetailsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Instant_Details
    implements
        WeatherStatusForecast_Data_Instant_DetailsInterface,
        Built<WeatherStatusForecast_Data_Instant_Details, WeatherStatusForecast_Data_Instant_DetailsBuilder> {
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

  static Serializer<WeatherStatusForecast_Data_Instant_Details> get serializer =>
      _$weatherStatusForecastDataInstantDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_InstantInterface {
  WeatherStatusForecast_Data_Instant_Details get details;
  WeatherStatusForecast_Data_InstantInterface rebuild(
    final void Function(WeatherStatusForecast_Data_InstantInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_InstantInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Instant
    implements
        WeatherStatusForecast_Data_InstantInterface,
        Built<WeatherStatusForecast_Data_Instant, WeatherStatusForecast_Data_InstantBuilder> {
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

  static Serializer<WeatherStatusForecast_Data_Instant> get serializer => _$weatherStatusForecastDataInstantSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next12Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
  WeatherStatusForecast_Data_Next12Hours_SummaryInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next12Hours_SummaryInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next12Hours_SummaryInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next12Hours_Summary
    implements
        WeatherStatusForecast_Data_Next12Hours_SummaryInterface,
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

  static Serializer<WeatherStatusForecast_Data_Next12Hours_Summary> get serializer =>
      _$weatherStatusForecastDataNext12HoursSummarySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next12Hours_DetailsInterface {
  @BuiltValueField(wireName: 'probability_of_precipitation')
  num get probabilityOfPrecipitation;
  WeatherStatusForecast_Data_Next12Hours_DetailsInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next12Hours_DetailsInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next12Hours_DetailsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next12Hours_Details
    implements
        WeatherStatusForecast_Data_Next12Hours_DetailsInterface,
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

  static Serializer<WeatherStatusForecast_Data_Next12Hours_Details> get serializer =>
      _$weatherStatusForecastDataNext12HoursDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next12HoursInterface {
  WeatherStatusForecast_Data_Next12Hours_Summary get summary;
  WeatherStatusForecast_Data_Next12Hours_Details get details;
  WeatherStatusForecast_Data_Next12HoursInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next12HoursInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next12HoursInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next12Hours
    implements
        WeatherStatusForecast_Data_Next12HoursInterface,
        Built<WeatherStatusForecast_Data_Next12Hours, WeatherStatusForecast_Data_Next12HoursBuilder> {
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

  static Serializer<WeatherStatusForecast_Data_Next12Hours> get serializer =>
      _$weatherStatusForecastDataNext12HoursSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next1Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
  WeatherStatusForecast_Data_Next1Hours_SummaryInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next1Hours_SummaryInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next1Hours_SummaryInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next1Hours_Summary
    implements
        WeatherStatusForecast_Data_Next1Hours_SummaryInterface,
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

  static Serializer<WeatherStatusForecast_Data_Next1Hours_Summary> get serializer =>
      _$weatherStatusForecastDataNext1HoursSummarySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next1Hours_DetailsInterface {
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
  WeatherStatusForecast_Data_Next1Hours_DetailsInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next1Hours_DetailsInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next1Hours_DetailsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next1Hours_Details
    implements
        WeatherStatusForecast_Data_Next1Hours_DetailsInterface,
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

  static Serializer<WeatherStatusForecast_Data_Next1Hours_Details> get serializer =>
      _$weatherStatusForecastDataNext1HoursDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next1HoursInterface {
  WeatherStatusForecast_Data_Next1Hours_Summary get summary;
  WeatherStatusForecast_Data_Next1Hours_Details get details;
  WeatherStatusForecast_Data_Next1HoursInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next1HoursInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next1HoursInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next1Hours
    implements
        WeatherStatusForecast_Data_Next1HoursInterface,
        Built<WeatherStatusForecast_Data_Next1Hours, WeatherStatusForecast_Data_Next1HoursBuilder> {
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

  static Serializer<WeatherStatusForecast_Data_Next1Hours> get serializer =>
      _$weatherStatusForecastDataNext1HoursSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next6Hours_SummaryInterface {
  @BuiltValueField(wireName: 'symbol_code')
  String get symbolCode;
  WeatherStatusForecast_Data_Next6Hours_SummaryInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next6Hours_SummaryInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next6Hours_SummaryInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next6Hours_Summary
    implements
        WeatherStatusForecast_Data_Next6Hours_SummaryInterface,
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

  static Serializer<WeatherStatusForecast_Data_Next6Hours_Summary> get serializer =>
      _$weatherStatusForecastDataNext6HoursSummarySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next6Hours_DetailsInterface {
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
  WeatherStatusForecast_Data_Next6Hours_DetailsInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next6Hours_DetailsInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next6Hours_DetailsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next6Hours_Details
    implements
        WeatherStatusForecast_Data_Next6Hours_DetailsInterface,
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

  static Serializer<WeatherStatusForecast_Data_Next6Hours_Details> get serializer =>
      _$weatherStatusForecastDataNext6HoursDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_Data_Next6HoursInterface {
  WeatherStatusForecast_Data_Next6Hours_Summary get summary;
  WeatherStatusForecast_Data_Next6Hours_Details get details;
  WeatherStatusForecast_Data_Next6HoursInterface rebuild(
    final void Function(WeatherStatusForecast_Data_Next6HoursInterfaceBuilder) updates,
  );
  WeatherStatusForecast_Data_Next6HoursInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data_Next6Hours
    implements
        WeatherStatusForecast_Data_Next6HoursInterface,
        Built<WeatherStatusForecast_Data_Next6Hours, WeatherStatusForecast_Data_Next6HoursBuilder> {
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

  static Serializer<WeatherStatusForecast_Data_Next6Hours> get serializer =>
      _$weatherStatusForecastDataNext6HoursSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecast_DataInterface {
  WeatherStatusForecast_Data_Instant get instant;
  @BuiltValueField(wireName: 'next_12_hours')
  WeatherStatusForecast_Data_Next12Hours get next12Hours;
  @BuiltValueField(wireName: 'next_1_hours')
  WeatherStatusForecast_Data_Next1Hours get next1Hours;
  @BuiltValueField(wireName: 'next_6_hours')
  WeatherStatusForecast_Data_Next6Hours get next6Hours;
  WeatherStatusForecast_DataInterface rebuild(final void Function(WeatherStatusForecast_DataInterfaceBuilder) updates);
  WeatherStatusForecast_DataInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast_Data
    implements
        WeatherStatusForecast_DataInterface,
        Built<WeatherStatusForecast_Data, WeatherStatusForecast_DataBuilder> {
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

  static Serializer<WeatherStatusForecast_Data> get serializer => _$weatherStatusForecastDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusForecastInterface {
  String get time;
  WeatherStatusForecast_Data get data;
  WeatherStatusForecastInterface rebuild(final void Function(WeatherStatusForecastInterfaceBuilder) updates);
  WeatherStatusForecastInterfaceBuilder toBuilder();
}

abstract class WeatherStatusForecast
    implements WeatherStatusForecastInterface, Built<WeatherStatusForecast, WeatherStatusForecastBuilder> {
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

  static Serializer<WeatherStatusForecast> get serializer => _$weatherStatusForecastSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusGetForecastResponseApplicationJson_OcsInterface {
  WeatherStatusOCSMeta get meta;
  BuiltList<WeatherStatusForecast> get data;
  WeatherStatusWeatherStatusGetForecastResponseApplicationJson_OcsInterface rebuild(
    final void Function(WeatherStatusWeatherStatusGetForecastResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusGetForecastResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs
    implements
        WeatherStatusWeatherStatusGetForecastResponseApplicationJson_OcsInterface,
        Built<WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs,
            WeatherStatusWeatherStatusGetForecastResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusGetForecastResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusGetForecastResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusGetForecastResponseApplicationJsonInterface {
  WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs get ocs;
  WeatherStatusWeatherStatusGetForecastResponseApplicationJsonInterface rebuild(
    final void Function(WeatherStatusWeatherStatusGetForecastResponseApplicationJsonInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusGetForecastResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusGetForecastResponseApplicationJson
    implements
        WeatherStatusWeatherStatusGetForecastResponseApplicationJsonInterface,
        Built<WeatherStatusWeatherStatusGetForecastResponseApplicationJson,
            WeatherStatusWeatherStatusGetForecastResponseApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusGetForecastResponseApplicationJson([
    final void Function(WeatherStatusWeatherStatusGetForecastResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetForecastResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetForecastResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetForecastResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusGetForecastResponseApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusGetForecastResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_OcsInterface {
  WeatherStatusOCSMeta get meta;
  BuiltList<String> get data;
  WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_OcsInterface rebuild(
    final void Function(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs
    implements
        WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_OcsInterface,
        Built<WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusGetFavoritesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusGetFavoritesResponseApplicationJsonInterface {
  WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs get ocs;
  WeatherStatusWeatherStatusGetFavoritesResponseApplicationJsonInterface rebuild(
    final void Function(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJsonInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusGetFavoritesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson
    implements
        WeatherStatusWeatherStatusGetFavoritesResponseApplicationJsonInterface,
        Built<WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson,
            WeatherStatusWeatherStatusGetFavoritesResponseApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson([
    final void Function(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusGetFavoritesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data
    implements
        WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataInterface,
        Built<WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data,
            WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder> {
  factory WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data([
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data> get serializer =>
      _$weatherStatusWeatherStatusSetFavoritesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_OcsInterface {
  WeatherStatusOCSMeta get meta;
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data get data;
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_OcsInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs
    implements
        WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_OcsInterface,
        Built<WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs,
            WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder> {
  factory WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs([
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs> get serializer =>
      _$weatherStatusWeatherStatusSetFavoritesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusWeatherStatusSetFavoritesResponseApplicationJsonInterface {
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs get ocs;
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJsonInterface rebuild(
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJsonInterfaceBuilder) updates,
  );
  WeatherStatusWeatherStatusSetFavoritesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson
    implements
        WeatherStatusWeatherStatusSetFavoritesResponseApplicationJsonInterface,
        Built<WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson,
            WeatherStatusWeatherStatusSetFavoritesResponseApplicationJsonBuilder> {
  factory WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson([
    final void Function(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJsonBuilder)? b,
  ]) = _$WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson;

  // coverage:ignore-start
  const WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson> get serializer =>
      _$weatherStatusWeatherStatusSetFavoritesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusCapabilities_WeatherStatusInterface {
  bool get enabled;
  WeatherStatusCapabilities_WeatherStatusInterface rebuild(
    final void Function(WeatherStatusCapabilities_WeatherStatusInterfaceBuilder) updates,
  );
  WeatherStatusCapabilities_WeatherStatusInterfaceBuilder toBuilder();
}

abstract class WeatherStatusCapabilities_WeatherStatus
    implements
        WeatherStatusCapabilities_WeatherStatusInterface,
        Built<WeatherStatusCapabilities_WeatherStatus, WeatherStatusCapabilities_WeatherStatusBuilder> {
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

  static Serializer<WeatherStatusCapabilities_WeatherStatus> get serializer =>
      _$weatherStatusCapabilitiesWeatherStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'weather_status')
  WeatherStatusCapabilities_WeatherStatus get weatherStatus;
  WeatherStatusCapabilitiesInterface rebuild(final void Function(WeatherStatusCapabilitiesInterfaceBuilder) updates);
  WeatherStatusCapabilitiesInterfaceBuilder toBuilder();
}

abstract class WeatherStatusCapabilities
    implements WeatherStatusCapabilitiesInterface, Built<WeatherStatusCapabilities, WeatherStatusCapabilitiesBuilder> {
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

  static Serializer<WeatherStatusCapabilities> get serializer => _$weatherStatusCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetModeResponseApplicationJson),
        WeatherStatusWeatherStatusSetModeResponseApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusSetModeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs),
        WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusOCSMeta), WeatherStatusOCSMeta.new)
      ..add(WeatherStatusOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusSetModeResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson),
        WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs),
        WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusUsePersonalAddressResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetLocationResponseApplicationJson),
        WeatherStatusWeatherStatusGetLocationResponseApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusGetLocationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs),
        WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusGetLocationResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetLocationResponseApplicationJson),
        WeatherStatusWeatherStatusSetLocationResponseApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusSetLocationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs),
        WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusSetLocationResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetForecastResponseApplicationJson),
        WeatherStatusWeatherStatusGetForecastResponseApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusGetForecastResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs),
        WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusGetForecastResponseApplicationJson_Ocs.serializer)
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
        const FullType(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson),
        WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs),
        WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusGetFavoritesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson),
        WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson.new,
      )
      ..add(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs),
        WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs.new,
      )
      ..add(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data),
        WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WeatherStatusWeatherStatusSetFavoritesResponseApplicationJson_Ocs_Data.serializer)
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
