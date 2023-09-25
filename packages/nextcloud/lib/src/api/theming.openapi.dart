// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'theming.openapi.g.dart';

class ThemingResponse<T, U> extends DynamiteResponse<T, U> {
  ThemingResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'ThemingResponse(data: $data, headers: $headers)';
}

class ThemingApiException extends DynamiteApiException {
  ThemingApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<ThemingApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return ThemingApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'ThemingApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class ThemingClient extends DynamiteClient {
  ThemingClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  ThemingClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  ThemingIconClient get icon => ThemingIconClient(this);

  ThemingThemingClient get theming => ThemingThemingClient(this);

  ThemingUserThemeClient get userTheme => ThemingUserThemeClient(this);
}

class ThemingIconClient {
  ThemingIconClient(this._rootClient);

  final ThemingClient _rootClient;

  /// Return a 32x32 favicon as png
  Future<Uint8List> getFavicon({final String app = 'core'}) async {
    var path = '/index.php/apps/theming/favicon/{app}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/x-icon',
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
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Return a 512x512 icon for touch devices
  Future<Uint8List> getTouchIcon({final String app = 'core'}) async {
    var path = '/index.php/apps/theming/icon/{app}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/png',
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
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a themed icon
  Future<Uint8List> getThemedIcon({
    required final String app,
    required final String image,
  }) async {
    var path = '/index.php/apps/theming/img/{app}/{image}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/svg+xml',
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
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    if (!RegExp(r'^.+$').hasMatch(image)) {
      throw Exception('Invalid value "$image" for parameter "image" with pattern "${r'^.+$'}"'); // coverage:ignore-line
    }
    path = path.replaceAll('{image}', Uri.encodeQueryComponent(image));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }
}

/// Class ThemingController
/// handle ajax requests to update the theme
class ThemingThemingClient {
  ThemingThemingClient(this._rootClient);

  final ThemingClient _rootClient;

  /// Get the CSS stylesheet for a theme
  Future<String> getThemeStylesheet({
    required final String themeId,
    final int plain = 0,
    final int withCustomCss = 0,
  }) async {
    var path = '/index.php/apps/theming/theme/{themeId}.css';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'text/css',
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
    }
    // coverage:ignore-end
    path = path.replaceAll('{themeId}', Uri.encodeQueryComponent(themeId));
    if (plain != 0) {
      queryParameters['plain'] = plain.toString();
    }
    if (withCustomCss != 0) {
      queryParameters['withCustomCss'] = withCustomCss.toString();
    }
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get an image
  Future<Uint8List> getImage({
    required final String key,
    final int useSvg = 1,
  }) async {
    var path = '/index.php/apps/theming/image/{key}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
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
    }
    // coverage:ignore-end
    path = path.replaceAll('{key}', Uri.encodeQueryComponent(key));
    if (useSvg != 1) {
      queryParameters['useSvg'] = useSvg.toString();
    }
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the manifest for an app
  Future<ThemingThemingGetManifestResponseApplicationJson> getManifest({required final String app}) async {
    var path = '/index.php/apps/theming/manifest/{app}';
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
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ThemingThemingGetManifestResponseApplicationJson),
      )! as ThemingThemingGetManifestResponseApplicationJson;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ThemingUserThemeClient {
  ThemingUserThemeClient(this._rootClient);

  final ThemingClient _rootClient;

  /// Get the background image
  Future<Uint8List> getBackground({final String oCSAPIRequest = 'true'}) async {
    const path = '/index.php/apps/theming/background';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
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
      return response.bodyBytes;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set the background
  Future<ThemingBackground> setBackground({
    required final String type,
    final String value = '',
    final String? color,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/index.php/apps/theming/background/{type}';
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
    path = path.replaceAll('{type}', Uri.encodeQueryComponent(type));
    if (value != '') {
      queryParameters['value'] = value;
    }
    if (color != null) {
      queryParameters['color'] = color;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(ThemingBackground))!
          as ThemingBackground;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete the background
  Future<ThemingBackground> deleteBackground({final String oCSAPIRequest = 'true'}) async {
    const path = '/index.php/apps/theming/background/custom';
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
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(ThemingBackground))!
          as ThemingBackground;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Enable theme
  Future<ThemingUserThemeEnableThemeResponseApplicationJson> enableTheme({
    required final String themeId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/theming/api/v1/theme/{themeId}/enable';
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
    path = path.replaceAll('{themeId}', Uri.encodeQueryComponent(themeId));
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
        specifiedType: const FullType(ThemingUserThemeEnableThemeResponseApplicationJson),
      )! as ThemingUserThemeEnableThemeResponseApplicationJson;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Disable theme
  Future<ThemingUserThemeDisableThemeResponseApplicationJson> disableTheme({
    required final String themeId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/theming/api/v1/theme/{themeId}';
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
    path = path.replaceAll('{themeId}', Uri.encodeQueryComponent(themeId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ThemingUserThemeDisableThemeResponseApplicationJson),
      )! as ThemingUserThemeDisableThemeResponseApplicationJson;
    }
    throw await ThemingApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class ThemingThemingGetManifestResponseApplicationJson_IconsInterface {
  String get src;
  String get type;
  String get sizes;
  ThemingThemingGetManifestResponseApplicationJson_IconsInterface rebuild(
    final void Function(ThemingThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder) updates,
  );
  ThemingThemingGetManifestResponseApplicationJson_IconsInterfaceBuilder toBuilder();
}

abstract class ThemingThemingGetManifestResponseApplicationJson_Icons
    implements
        ThemingThemingGetManifestResponseApplicationJson_IconsInterface,
        Built<ThemingThemingGetManifestResponseApplicationJson_Icons,
            ThemingThemingGetManifestResponseApplicationJson_IconsBuilder> {
  factory ThemingThemingGetManifestResponseApplicationJson_Icons([
    final void Function(ThemingThemingGetManifestResponseApplicationJson_IconsBuilder)? b,
  ]) = _$ThemingThemingGetManifestResponseApplicationJson_Icons;

  // coverage:ignore-start
  const ThemingThemingGetManifestResponseApplicationJson_Icons._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingThemingGetManifestResponseApplicationJson_Icons.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingThemingGetManifestResponseApplicationJson_Icons> get serializer =>
      _$themingThemingGetManifestResponseApplicationJsonIconsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingThemingGetManifestResponseApplicationJsonInterface {
  String get name;
  @BuiltValueField(wireName: 'short_name')
  String get shortName;
  @BuiltValueField(wireName: 'start_url')
  String get startUrl;
  @BuiltValueField(wireName: 'theme_color')
  String get themeColor;
  @BuiltValueField(wireName: 'background_color')
  String get backgroundColor;
  String get description;
  BuiltList<ThemingThemingGetManifestResponseApplicationJson_Icons> get icons;
  String get display;
  ThemingThemingGetManifestResponseApplicationJsonInterface rebuild(
    final void Function(ThemingThemingGetManifestResponseApplicationJsonInterfaceBuilder) updates,
  );
  ThemingThemingGetManifestResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ThemingThemingGetManifestResponseApplicationJson
    implements
        ThemingThemingGetManifestResponseApplicationJsonInterface,
        Built<ThemingThemingGetManifestResponseApplicationJson,
            ThemingThemingGetManifestResponseApplicationJsonBuilder> {
  factory ThemingThemingGetManifestResponseApplicationJson([
    final void Function(ThemingThemingGetManifestResponseApplicationJsonBuilder)? b,
  ]) = _$ThemingThemingGetManifestResponseApplicationJson;

  // coverage:ignore-start
  const ThemingThemingGetManifestResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingThemingGetManifestResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingThemingGetManifestResponseApplicationJson> get serializer =>
      _$themingThemingGetManifestResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingBackgroundInterface {
  String? get backgroundImage;
  String get backgroundColor;
  int get version;
  ThemingBackgroundInterface rebuild(final void Function(ThemingBackgroundInterfaceBuilder) updates);
  ThemingBackgroundInterfaceBuilder toBuilder();
}

abstract class ThemingBackground
    implements ThemingBackgroundInterface, Built<ThemingBackground, ThemingBackgroundBuilder> {
  factory ThemingBackground([final void Function(ThemingBackgroundBuilder)? b]) = _$ThemingBackground;

  // coverage:ignore-start
  const ThemingBackground._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingBackground.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingBackground> get serializer => _$themingBackgroundSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  ThemingOCSMetaInterface rebuild(final void Function(ThemingOCSMetaInterfaceBuilder) updates);
  ThemingOCSMetaInterfaceBuilder toBuilder();
}

abstract class ThemingOCSMeta implements ThemingOCSMetaInterface, Built<ThemingOCSMeta, ThemingOCSMetaBuilder> {
  factory ThemingOCSMeta([final void Function(ThemingOCSMetaBuilder)? b]) = _$ThemingOCSMeta;

  // coverage:ignore-start
  const ThemingOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingOCSMeta> get serializer => _$themingOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterface {
  ThemingOCSMeta get meta;
  JsonObject get data;
  ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterface rebuild(
    final void Function(ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ThemingUserThemeEnableThemeResponseApplicationJson_Ocs
    implements
        ThemingUserThemeEnableThemeResponseApplicationJson_OcsInterface,
        Built<ThemingUserThemeEnableThemeResponseApplicationJson_Ocs,
            ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder> {
  factory ThemingUserThemeEnableThemeResponseApplicationJson_Ocs([
    final void Function(ThemingUserThemeEnableThemeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ThemingUserThemeEnableThemeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ThemingUserThemeEnableThemeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingUserThemeEnableThemeResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingUserThemeEnableThemeResponseApplicationJson_Ocs> get serializer =>
      _$themingUserThemeEnableThemeResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingUserThemeEnableThemeResponseApplicationJsonInterface {
  ThemingUserThemeEnableThemeResponseApplicationJson_Ocs get ocs;
  ThemingUserThemeEnableThemeResponseApplicationJsonInterface rebuild(
    final void Function(ThemingUserThemeEnableThemeResponseApplicationJsonInterfaceBuilder) updates,
  );
  ThemingUserThemeEnableThemeResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ThemingUserThemeEnableThemeResponseApplicationJson
    implements
        ThemingUserThemeEnableThemeResponseApplicationJsonInterface,
        Built<ThemingUserThemeEnableThemeResponseApplicationJson,
            ThemingUserThemeEnableThemeResponseApplicationJsonBuilder> {
  factory ThemingUserThemeEnableThemeResponseApplicationJson([
    final void Function(ThemingUserThemeEnableThemeResponseApplicationJsonBuilder)? b,
  ]) = _$ThemingUserThemeEnableThemeResponseApplicationJson;

  // coverage:ignore-start
  const ThemingUserThemeEnableThemeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingUserThemeEnableThemeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingUserThemeEnableThemeResponseApplicationJson> get serializer =>
      _$themingUserThemeEnableThemeResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterface {
  ThemingOCSMeta get meta;
  JsonObject get data;
  ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterface rebuild(
    final void Function(ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ThemingUserThemeDisableThemeResponseApplicationJson_Ocs
    implements
        ThemingUserThemeDisableThemeResponseApplicationJson_OcsInterface,
        Built<ThemingUserThemeDisableThemeResponseApplicationJson_Ocs,
            ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder> {
  factory ThemingUserThemeDisableThemeResponseApplicationJson_Ocs([
    final void Function(ThemingUserThemeDisableThemeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ThemingUserThemeDisableThemeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ThemingUserThemeDisableThemeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingUserThemeDisableThemeResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingUserThemeDisableThemeResponseApplicationJson_Ocs> get serializer =>
      _$themingUserThemeDisableThemeResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingUserThemeDisableThemeResponseApplicationJsonInterface {
  ThemingUserThemeDisableThemeResponseApplicationJson_Ocs get ocs;
  ThemingUserThemeDisableThemeResponseApplicationJsonInterface rebuild(
    final void Function(ThemingUserThemeDisableThemeResponseApplicationJsonInterfaceBuilder) updates,
  );
  ThemingUserThemeDisableThemeResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ThemingUserThemeDisableThemeResponseApplicationJson
    implements
        ThemingUserThemeDisableThemeResponseApplicationJsonInterface,
        Built<ThemingUserThemeDisableThemeResponseApplicationJson,
            ThemingUserThemeDisableThemeResponseApplicationJsonBuilder> {
  factory ThemingUserThemeDisableThemeResponseApplicationJson([
    final void Function(ThemingUserThemeDisableThemeResponseApplicationJsonBuilder)? b,
  ]) = _$ThemingUserThemeDisableThemeResponseApplicationJson;

  // coverage:ignore-start
  const ThemingUserThemeDisableThemeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingUserThemeDisableThemeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingUserThemeDisableThemeResponseApplicationJson> get serializer =>
      _$themingUserThemeDisableThemeResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingPublicCapabilities_ThemingInterface {
  String get name;
  String get url;
  String get slogan;
  String get color;
  @BuiltValueField(wireName: 'color-text')
  String get colorText;
  @BuiltValueField(wireName: 'color-element')
  String get colorElement;
  @BuiltValueField(wireName: 'color-element-bright')
  String get colorElementBright;
  @BuiltValueField(wireName: 'color-element-dark')
  String get colorElementDark;
  String get logo;
  String get background;
  @BuiltValueField(wireName: 'background-plain')
  bool get backgroundPlain;
  @BuiltValueField(wireName: 'background-default')
  bool get backgroundDefault;
  String get logoheader;
  String get favicon;
  ThemingPublicCapabilities_ThemingInterface rebuild(
    final void Function(ThemingPublicCapabilities_ThemingInterfaceBuilder) updates,
  );
  ThemingPublicCapabilities_ThemingInterfaceBuilder toBuilder();
}

abstract class ThemingPublicCapabilities_Theming
    implements
        ThemingPublicCapabilities_ThemingInterface,
        Built<ThemingPublicCapabilities_Theming, ThemingPublicCapabilities_ThemingBuilder> {
  factory ThemingPublicCapabilities_Theming([final void Function(ThemingPublicCapabilities_ThemingBuilder)? b]) =
      _$ThemingPublicCapabilities_Theming;

  // coverage:ignore-start
  const ThemingPublicCapabilities_Theming._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingPublicCapabilities_Theming.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingPublicCapabilities_Theming> get serializer => _$themingPublicCapabilitiesThemingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ThemingPublicCapabilitiesInterface {
  ThemingPublicCapabilities_Theming get theming;
  ThemingPublicCapabilitiesInterface rebuild(final void Function(ThemingPublicCapabilitiesInterfaceBuilder) updates);
  ThemingPublicCapabilitiesInterfaceBuilder toBuilder();
}

abstract class ThemingPublicCapabilities
    implements ThemingPublicCapabilitiesInterface, Built<ThemingPublicCapabilities, ThemingPublicCapabilitiesBuilder> {
  factory ThemingPublicCapabilities([final void Function(ThemingPublicCapabilitiesBuilder)? b]) =
      _$ThemingPublicCapabilities;

  // coverage:ignore-start
  const ThemingPublicCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingPublicCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingPublicCapabilities> get serializer => _$themingPublicCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(ThemingThemingGetManifestResponseApplicationJson),
        ThemingThemingGetManifestResponseApplicationJson.new,
      )
      ..add(ThemingThemingGetManifestResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ThemingThemingGetManifestResponseApplicationJson_Icons),
        ThemingThemingGetManifestResponseApplicationJson_Icons.new,
      )
      ..add(ThemingThemingGetManifestResponseApplicationJson_Icons.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ThemingThemingGetManifestResponseApplicationJson_Icons)]),
        ListBuilder<ThemingThemingGetManifestResponseApplicationJson_Icons>.new,
      )
      ..addBuilderFactory(const FullType(ThemingBackground), ThemingBackground.new)
      ..add(ThemingBackground.serializer)
      ..addBuilderFactory(
        const FullType(ThemingUserThemeEnableThemeResponseApplicationJson),
        ThemingUserThemeEnableThemeResponseApplicationJson.new,
      )
      ..add(ThemingUserThemeEnableThemeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ThemingUserThemeEnableThemeResponseApplicationJson_Ocs),
        ThemingUserThemeEnableThemeResponseApplicationJson_Ocs.new,
      )
      ..add(ThemingUserThemeEnableThemeResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ThemingOCSMeta), ThemingOCSMeta.new)
      ..add(ThemingOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ThemingUserThemeDisableThemeResponseApplicationJson),
        ThemingUserThemeDisableThemeResponseApplicationJson.new,
      )
      ..add(ThemingUserThemeDisableThemeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ThemingUserThemeDisableThemeResponseApplicationJson_Ocs),
        ThemingUserThemeDisableThemeResponseApplicationJson_Ocs.new,
      )
      ..add(ThemingUserThemeDisableThemeResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ThemingPublicCapabilities), ThemingPublicCapabilities.new)
      ..add(ThemingPublicCapabilities.serializer)
      ..addBuilderFactory(const FullType(ThemingPublicCapabilities_Theming), ThemingPublicCapabilities_Theming.new)
      ..add(ThemingPublicCapabilities_Theming.serializer))
    .build();

Serializers get themingSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeTheming<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeTheming<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
