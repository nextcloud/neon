// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'theming.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  IconClient get icon => IconClient(this);

  ThemingClient get theming => ThemingClient(this);

  UserThemeClient get userTheme => UserThemeClient(this);
}

class IconClient {
  IconClient(this._rootClient);

  final Client _rootClient;

  /// Return a 32x32 favicon as png.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app. Defaults to `core`.
  ///
  /// Status codes:
  ///   * 200: Favicon returned
  ///   * 404: Favicon not found
  ///   * 500
  ///
  /// See:
  ///  * [getFaviconRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getFavicon({String? app}) async {
    final rawResponse = getFaviconRaw(
      app: app,
    );

    return rawResponse.future;
  }

  /// Return a 32x32 favicon as png.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app. Defaults to `core`.
  ///
  /// Status codes:
  ///   * 200: Favicon returned
  ///   * 404: Favicon not found
  ///   * 500
  ///
  /// See:
  ///  * [getFavicon] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getFaviconRaw({String? app}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'image/x-icon',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    var $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    $app ??= 'core';
    _parameters['app'] = $app;

    final _path = UriTemplate('/index.php/apps/theming/favicon/{app}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Return a 512x512 icon for touch devices.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app. Defaults to `core`.
  ///
  /// Status codes:
  ///   * 200: Touch icon returned
  ///   * 404: Touch icon not found
  ///   * 500
  ///
  /// See:
  ///  * [getTouchIconRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getTouchIcon({String? app}) async {
    final rawResponse = getTouchIconRaw(
      app: app,
    );

    return rawResponse.future;
  }

  /// Return a 512x512 icon for touch devices.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app. Defaults to `core`.
  ///
  /// Status codes:
  ///   * 200: Touch icon returned
  ///   * 404: Touch icon not found
  ///   * 500
  ///
  /// See:
  ///  * [getTouchIcon] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getTouchIconRaw({String? app}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'image/png',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    var $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    $app ??= 'core';
    _parameters['app'] = $app;

    final _path = UriTemplate('/index.php/apps/theming/icon/{app}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get a themed icon.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [image] image file name (svg required).
  ///
  /// Status codes:
  ///   * 200: Themed icon returned
  ///   * 404: Themed icon not found
  ///   * 500
  ///
  /// See:
  ///  * [getThemedIconRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getThemedIcon({
    required String app,
    required String image,
  }) async {
    final rawResponse = getThemedIconRaw(
      app: app,
      image: image,
    );

    return rawResponse.future;
  }

  /// Get a themed icon.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///   * [image] image file name (svg required).
  ///
  /// Status codes:
  ///   * 200: Themed icon returned
  ///   * 404: Themed icon not found
  ///   * 500
  ///
  /// See:
  ///  * [getThemedIcon] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getThemedIconRaw({
    required String app,
    required String image,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'image/svg+xml',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    _parameters['app'] = $app;

    final $image = jsonSerializers.serialize(image, specifiedType: const FullType(String));
    dynamite_utils.checkPattern($image as String?, RegExp(r'^.+$'), 'image');
    _parameters['image'] = $image;

    final _path = UriTemplate('/index.php/apps/theming/img/{app}/{image}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

/// Class ThemingController.
/// handle ajax requests to update the theme.
class ThemingClient {
  ThemingClient(this._rootClient);

  final Client _rootClient;

  /// Get the CSS stylesheet for a theme.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [plain] Let the browser decide the CSS priority. Defaults to `0`.
  ///   * [withCustomCss] Include custom CSS. Defaults to `0`.
  ///   * [themeId] ID of the theme.
  ///
  /// Status codes:
  ///   * 200: Stylesheet returned
  ///   * 404: Theme not found
  ///
  /// See:
  ///  * [getThemeStylesheetRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<String, void>> getThemeStylesheet({
    required String themeId,
    int? plain,
    int? withCustomCss,
  }) async {
    final rawResponse = getThemeStylesheetRaw(
      themeId: themeId,
      plain: plain,
      withCustomCss: withCustomCss,
    );

    return rawResponse.future;
  }

  /// Get the CSS stylesheet for a theme.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [plain] Let the browser decide the CSS priority. Defaults to `0`.
  ///   * [withCustomCss] Include custom CSS. Defaults to `0`.
  ///   * [themeId] ID of the theme.
  ///
  /// Status codes:
  ///   * 200: Stylesheet returned
  ///   * 404: Theme not found
  ///
  /// See:
  ///  * [getThemeStylesheet] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<String, void> getThemeStylesheetRaw({
    required String themeId,
    int? plain,
    int? withCustomCss,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'text/css',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $themeId = jsonSerializers.serialize(themeId, specifiedType: const FullType(String));
    _parameters['themeId'] = $themeId;

    var $plain = jsonSerializers.serialize(plain, specifiedType: const FullType(int));
    $plain ??= 0;
    _parameters['plain'] = $plain;

    var $withCustomCss = jsonSerializers.serialize(withCustomCss, specifiedType: const FullType(int));
    $withCustomCss ??= 0;
    _parameters['withCustomCss'] = $withCustomCss;

    final _path =
        UriTemplate('/index.php/apps/theming/theme/{themeId}.css{?plain*,withCustomCss*}').expand(_parameters);
    return DynamiteRawResponse<String, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get an image.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [useSvg] Return image as SVG. Defaults to `1`.
  ///   * [key] Key of the image.
  ///
  /// Status codes:
  ///   * 200: Image returned
  ///   * 404: Image not found
  ///   * 500
  ///
  /// See:
  ///  * [getImageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getImage({
    required String key,
    int? useSvg,
  }) async {
    final rawResponse = getImageRaw(
      key: key,
      useSvg: useSvg,
    );

    return rawResponse.future;
  }

  /// Get an image.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [useSvg] Return image as SVG. Defaults to `1`.
  ///   * [key] Key of the image.
  ///
  /// Status codes:
  ///   * 200: Image returned
  ///   * 404: Image not found
  ///   * 500
  ///
  /// See:
  ///  * [getImage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getImageRaw({
    required String key,
    int? useSvg,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $key = jsonSerializers.serialize(key, specifiedType: const FullType(String));
    _parameters['key'] = $key;

    var $useSvg = jsonSerializers.serialize(useSvg, specifiedType: const FullType(int));
    $useSvg ??= 1;
    _parameters['useSvg'] = $useSvg;

    final _path = UriTemplate('/index.php/apps/theming/image/{key}{?useSvg*}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Get the manifest for an app.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///
  /// Status codes:
  ///   * 200: Manifest returned
  ///
  /// See:
  ///  * [getManifestRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ThemingGetManifestResponseApplicationJson, void>> getManifest({required String app}) async {
    final rawResponse = getManifestRaw(
      app: app,
    );

    return rawResponse.future;
  }

  /// Get the manifest for an app.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app.
  ///
  /// Status codes:
  ///   * 200: Manifest returned
  ///
  /// See:
  ///  * [getManifest] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ThemingGetManifestResponseApplicationJson, void> getManifestRaw({required String app}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    }

// coverage:ignore-end
    final $app = jsonSerializers.serialize(app, specifiedType: const FullType(String));
    _parameters['app'] = $app;

    final _path = UriTemplate('/index.php/apps/theming/manifest/{app}').expand(_parameters);
    return DynamiteRawResponse<ThemingGetManifestResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ThemingGetManifestResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class UserThemeClient {
  UserThemeClient(this._rootClient);

  final Client _rootClient;

  /// Get the background image.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Background image returned
  ///   * 404: Background image not found
  ///
  /// See:
  ///  * [getBackgroundRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getBackground({bool? oCSAPIRequest}) async {
    final rawResponse = getBackgroundRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the background image.
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
  ///   * 200: Background image returned
  ///   * 404: Background image not found
  ///
  /// See:
  ///  * [getBackground] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getBackgroundRaw({bool? oCSAPIRequest}) {
    final _headers = <String, String>{
      'Accept': '*/*',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    const _path = '/index.php/apps/theming/background';
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set the background.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [value] Path of the background image. Defaults to `''`.
  ///   * [color] Color for the background.
  ///   * [type] Type of background.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Background set successfully
  ///   * 400: Setting background is not possible
  ///   * 500
  ///
  /// See:
  ///  * [setBackgroundRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Background, void>> setBackground({
    required String type,
    String? value,
    String? color,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = setBackgroundRaw(
      type: type,
      value: value,
      color: color,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set the background.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [value] Path of the background image. Defaults to `''`.
  ///   * [color] Color for the background.
  ///   * [type] Type of background.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Background set successfully
  ///   * 400: Setting background is not possible
  ///   * 500
  ///
  /// See:
  ///  * [setBackground] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Background, void> setBackgroundRaw({
    required String type,
    String? value,
    String? color,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $type = jsonSerializers.serialize(type, specifiedType: const FullType(String));
    _parameters['type'] = $type;

    var $value = jsonSerializers.serialize(value, specifiedType: const FullType(String));
    $value ??= '';
    _parameters['value'] = $value;

    final $color = jsonSerializers.serialize(color, specifiedType: const FullType(String));
    _parameters['color'] = $color;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/index.php/apps/theming/background/{type}{?value*,color*}').expand(_parameters);
    return DynamiteRawResponse<Background, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Background),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Delete the background.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Background deleted successfully
  ///
  /// See:
  ///  * [deleteBackgroundRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Background, void>> deleteBackground({bool? oCSAPIRequest}) async {
    final rawResponse = deleteBackgroundRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete the background.
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
  ///   * 200: Background deleted successfully
  ///
  /// See:
  ///  * [deleteBackground] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Background, void> deleteBackgroundRaw({bool? oCSAPIRequest}) {
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    const _path = '/index.php/apps/theming/background/custom';
    return DynamiteRawResponse<Background, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Background),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Enable theme.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [themeId] the theme ID.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Theme enabled successfully
  ///   * 400: Enabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [enableThemeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserThemeEnableThemeResponseApplicationJson, void>> enableTheme({
    required String themeId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = enableThemeRaw(
      themeId: themeId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Enable theme.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [themeId] the theme ID.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Theme enabled successfully
  ///   * 400: Enabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [enableTheme] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserThemeEnableThemeResponseApplicationJson, void> enableThemeRaw({
    required String themeId,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $themeId = jsonSerializers.serialize(themeId, specifiedType: const FullType(String));
    _parameters['themeId'] = $themeId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/theming/api/v1/theme/{themeId}/enable').expand(_parameters);
    return DynamiteRawResponse<UserThemeEnableThemeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserThemeEnableThemeResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Disable theme.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [themeId] the theme ID.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Theme disabled successfully
  ///   * 400: Disabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [disableThemeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserThemeDisableThemeResponseApplicationJson, void>> disableTheme({
    required String themeId,
    bool? oCSAPIRequest,
  }) async {
    final rawResponse = disableThemeRaw(
      themeId: themeId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Disable theme.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [themeId] the theme ID.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Theme disabled successfully
  ///   * 400: Disabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [disableTheme] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserThemeDisableThemeResponseApplicationJson, void> disableThemeRaw({
    required String themeId,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': 'application/json',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    final $themeId = jsonSerializers.serialize(themeId, specifiedType: const FullType(String));
    _parameters['themeId'] = $themeId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/theming/api/v1/theme/{themeId}').expand(_parameters);
    return DynamiteRawResponse<UserThemeDisableThemeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserThemeDisableThemeResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ThemingGetManifestResponseApplicationJson_IconsInterface {
  String get src;
  String get type;
  String get sizes;
}

abstract class ThemingGetManifestResponseApplicationJson_Icons
    implements
        $ThemingGetManifestResponseApplicationJson_IconsInterface,
        Built<ThemingGetManifestResponseApplicationJson_Icons, ThemingGetManifestResponseApplicationJson_IconsBuilder> {
  factory ThemingGetManifestResponseApplicationJson_Icons([
    void Function(ThemingGetManifestResponseApplicationJson_IconsBuilder)? b,
  ]) = _$ThemingGetManifestResponseApplicationJson_Icons;

  // coverage:ignore-start
  const ThemingGetManifestResponseApplicationJson_Icons._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingGetManifestResponseApplicationJson_Icons.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingGetManifestResponseApplicationJson_Icons> get serializer =>
      _$themingGetManifestResponseApplicationJsonIconsSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ThemingGetManifestResponseApplicationJson_IconsBuilder b) {
    dynamite_utils.checkMinLength(b.src, 1, 'src');
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ThemingGetManifestResponseApplicationJsonInterface {
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
  BuiltList<ThemingGetManifestResponseApplicationJson_Icons> get icons;
  String get display;
}

abstract class ThemingGetManifestResponseApplicationJson
    implements
        $ThemingGetManifestResponseApplicationJsonInterface,
        Built<ThemingGetManifestResponseApplicationJson, ThemingGetManifestResponseApplicationJsonBuilder> {
  factory ThemingGetManifestResponseApplicationJson([
    void Function(ThemingGetManifestResponseApplicationJsonBuilder)? b,
  ]) = _$ThemingGetManifestResponseApplicationJson;

  // coverage:ignore-start
  const ThemingGetManifestResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingGetManifestResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingGetManifestResponseApplicationJson> get serializer =>
      _$themingGetManifestResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BackgroundInterface {
  String? get backgroundImage;
  String get backgroundColor;
  int get version;
}

abstract class Background implements $BackgroundInterface, Built<Background, BackgroundBuilder> {
  factory Background([void Function(BackgroundBuilder)? b]) = _$Background;

  // coverage:ignore-start
  const Background._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Background.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Background> get serializer => _$backgroundSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserThemeEnableThemeResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UserThemeEnableThemeResponseApplicationJson_Ocs
    implements
        $UserThemeEnableThemeResponseApplicationJson_OcsInterface,
        Built<UserThemeEnableThemeResponseApplicationJson_Ocs, UserThemeEnableThemeResponseApplicationJson_OcsBuilder> {
  factory UserThemeEnableThemeResponseApplicationJson_Ocs([
    void Function(UserThemeEnableThemeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserThemeEnableThemeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserThemeEnableThemeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeEnableThemeResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserThemeEnableThemeResponseApplicationJson_Ocs> get serializer =>
      _$userThemeEnableThemeResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserThemeEnableThemeResponseApplicationJsonInterface {
  UserThemeEnableThemeResponseApplicationJson_Ocs get ocs;
}

abstract class UserThemeEnableThemeResponseApplicationJson
    implements
        $UserThemeEnableThemeResponseApplicationJsonInterface,
        Built<UserThemeEnableThemeResponseApplicationJson, UserThemeEnableThemeResponseApplicationJsonBuilder> {
  factory UserThemeEnableThemeResponseApplicationJson([
    void Function(UserThemeEnableThemeResponseApplicationJsonBuilder)? b,
  ]) = _$UserThemeEnableThemeResponseApplicationJson;

  // coverage:ignore-start
  const UserThemeEnableThemeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeEnableThemeResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserThemeEnableThemeResponseApplicationJson> get serializer =>
      _$userThemeEnableThemeResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserThemeDisableThemeResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UserThemeDisableThemeResponseApplicationJson_Ocs
    implements
        $UserThemeDisableThemeResponseApplicationJson_OcsInterface,
        Built<UserThemeDisableThemeResponseApplicationJson_Ocs,
            UserThemeDisableThemeResponseApplicationJson_OcsBuilder> {
  factory UserThemeDisableThemeResponseApplicationJson_Ocs([
    void Function(UserThemeDisableThemeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserThemeDisableThemeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserThemeDisableThemeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeDisableThemeResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserThemeDisableThemeResponseApplicationJson_Ocs> get serializer =>
      _$userThemeDisableThemeResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserThemeDisableThemeResponseApplicationJsonInterface {
  UserThemeDisableThemeResponseApplicationJson_Ocs get ocs;
}

abstract class UserThemeDisableThemeResponseApplicationJson
    implements
        $UserThemeDisableThemeResponseApplicationJsonInterface,
        Built<UserThemeDisableThemeResponseApplicationJson, UserThemeDisableThemeResponseApplicationJsonBuilder> {
  factory UserThemeDisableThemeResponseApplicationJson([
    void Function(UserThemeDisableThemeResponseApplicationJsonBuilder)? b,
  ]) = _$UserThemeDisableThemeResponseApplicationJson;

  // coverage:ignore-start
  const UserThemeDisableThemeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeDisableThemeResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserThemeDisableThemeResponseApplicationJson> get serializer =>
      _$userThemeDisableThemeResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilities_ThemingInterface {
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
}

abstract class PublicCapabilities_Theming
    implements
        $PublicCapabilities_ThemingInterface,
        Built<PublicCapabilities_Theming, PublicCapabilities_ThemingBuilder> {
  factory PublicCapabilities_Theming([void Function(PublicCapabilities_ThemingBuilder)? b]) =
      _$PublicCapabilities_Theming;

  // coverage:ignore-start
  const PublicCapabilities_Theming._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities_Theming.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities_Theming> get serializer => _$publicCapabilitiesThemingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilitiesInterface {
  PublicCapabilities_Theming get theming;
}

abstract class PublicCapabilities
    implements $PublicCapabilitiesInterface, Built<PublicCapabilities, PublicCapabilitiesBuilder> {
  factory PublicCapabilities([void Function(PublicCapabilitiesBuilder)? b]) = _$PublicCapabilities;

  // coverage:ignore-start
  const PublicCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities> get serializer => _$publicCapabilitiesSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(ThemingGetManifestResponseApplicationJson),
        ThemingGetManifestResponseApplicationJsonBuilder.new,
      )
      ..add(ThemingGetManifestResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ThemingGetManifestResponseApplicationJson_Icons),
        ThemingGetManifestResponseApplicationJson_IconsBuilder.new,
      )
      ..add(ThemingGetManifestResponseApplicationJson_Icons.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ThemingGetManifestResponseApplicationJson_Icons)]),
        ListBuilder<ThemingGetManifestResponseApplicationJson_Icons>.new,
      )
      ..addBuilderFactory(const FullType(Background), BackgroundBuilder.new)
      ..add(Background.serializer)
      ..addBuilderFactory(
        const FullType(UserThemeEnableThemeResponseApplicationJson),
        UserThemeEnableThemeResponseApplicationJsonBuilder.new,
      )
      ..add(UserThemeEnableThemeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserThemeEnableThemeResponseApplicationJson_Ocs),
        UserThemeEnableThemeResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserThemeEnableThemeResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(UserThemeDisableThemeResponseApplicationJson),
        UserThemeDisableThemeResponseApplicationJsonBuilder.new,
      )
      ..add(UserThemeDisableThemeResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserThemeDisableThemeResponseApplicationJson_Ocs),
        UserThemeDisableThemeResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserThemeDisableThemeResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(PublicCapabilities), PublicCapabilitiesBuilder.new)
      ..add(PublicCapabilities.serializer)
      ..addBuilderFactory(const FullType(PublicCapabilities_Theming), PublicCapabilities_ThemingBuilder.new)
      ..add(PublicCapabilities_Theming.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
