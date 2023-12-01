// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
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

  Client.fromClient(final DynamiteClient client)
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
  Future<DynamiteResponse<Uint8List, void>> getFavicon({final String app = 'core'}) async {
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
  DynamiteRawResponse<Uint8List, void> getFaviconRaw({final String app = 'core'}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/x-icon',
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
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/favicon/{app}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
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
  Future<DynamiteResponse<Uint8List, void>> getTouchIcon({final String app = 'core'}) async {
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
  DynamiteRawResponse<Uint8List, void> getTouchIconRaw({final String app = 'core'}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/png',
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
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/icon/{app}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
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
    required final String app,
    required final String image,
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
    required final String app,
    required final String image,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/svg+xml',
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
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    dynamite_utils.checkPattern(image, RegExp(r'^.+$'), 'image');
    pathParameters['image'] = image;
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/img/{app}/{image}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
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
    required final String themeId,
    final int plain = 0,
    final int withCustomCss = 0,
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
    required final String themeId,
    final int plain = 0,
    final int withCustomCss = 0,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'text/css',
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
    }

// coverage:ignore-end
    pathParameters['themeId'] = themeId;
    if (plain != 0) {
      queryParameters['plain'] = plain.toString();
    }
    if (withCustomCss != 0) {
      queryParameters['withCustomCss'] = withCustomCss.toString();
    }
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/theme/{themeId}.css').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<String, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: _jsonSerializers,
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
    required final String key,
    final int useSvg = 1,
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
    required final String key,
    final int useSvg = 1,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
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
    }

// coverage:ignore-end
    pathParameters['key'] = key;
    if (useSvg != 1) {
      queryParameters['useSvg'] = useSvg.toString();
    }
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/image/{key}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
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
  Future<DynamiteResponse<ThemingGetManifestResponseApplicationJson, void>> getManifest({
    required final String app,
  }) async {
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
  DynamiteRawResponse<ThemingGetManifestResponseApplicationJson, void> getManifestRaw({required final String app}) {
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
    }

// coverage:ignore-end
    pathParameters['app'] = app;
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/manifest/{app}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ThemingGetManifestResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ThemingGetManifestResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
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
  Future<DynamiteResponse<Uint8List, void>> getBackground({final bool oCSAPIRequest = true}) async {
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
  DynamiteRawResponse<Uint8List, void> getBackgroundRaw({final bool oCSAPIRequest = true}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/background').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
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
    required final String type,
    final String value = '',
    final String? color,
    final bool oCSAPIRequest = true,
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
    required final String type,
    final String value = '',
    final String? color,
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
    pathParameters['type'] = type;
    if (value != '') {
      queryParameters['value'] = value;
    }
    if (color != null) {
      queryParameters['color'] = color;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/background/{type}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Background, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Background),
      headersType: null,
      serializers: _jsonSerializers,
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
  Future<DynamiteResponse<Background, void>> deleteBackground({final bool oCSAPIRequest = true}) async {
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
  DynamiteRawResponse<Background, void> deleteBackgroundRaw({final bool oCSAPIRequest = true}) {
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/theming/background/custom').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<Background, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Background),
      headersType: null,
      serializers: _jsonSerializers,
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
    required final String themeId,
    final bool oCSAPIRequest = true,
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
    required final String themeId,
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
    pathParameters['themeId'] = themeId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/theming/api/v1/theme/{themeId}/enable').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UserThemeEnableThemeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserThemeEnableThemeResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
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
    required final String themeId,
    final bool oCSAPIRequest = true,
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
    required final String themeId,
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
    pathParameters['themeId'] = themeId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/theming/api/v1/theme/{themeId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<UserThemeDisableThemeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserThemeDisableThemeResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
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
    final void Function(ThemingGetManifestResponseApplicationJson_IconsBuilder)? b,
  ]) = _$ThemingGetManifestResponseApplicationJson_Icons;

  // coverage:ignore-start
  const ThemingGetManifestResponseApplicationJson_Icons._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingGetManifestResponseApplicationJson_Icons.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingGetManifestResponseApplicationJson_Icons> get serializer =>
      _$themingGetManifestResponseApplicationJsonIconsSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final ThemingGetManifestResponseApplicationJson_IconsBuilder b) {
    dynamite_utils.checkMinLength(b.src, 1, 'b.src');
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
    final void Function(ThemingGetManifestResponseApplicationJsonBuilder)? b,
  ]) = _$ThemingGetManifestResponseApplicationJson;

  // coverage:ignore-start
  const ThemingGetManifestResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingGetManifestResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory Background([final void Function(BackgroundBuilder)? b]) = _$Background;

  // coverage:ignore-start
  const Background._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Background.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
abstract interface class $UserThemeEnableThemeResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UserThemeEnableThemeResponseApplicationJson_Ocs
    implements
        $UserThemeEnableThemeResponseApplicationJson_OcsInterface,
        Built<UserThemeEnableThemeResponseApplicationJson_Ocs, UserThemeEnableThemeResponseApplicationJson_OcsBuilder> {
  factory UserThemeEnableThemeResponseApplicationJson_Ocs([
    final void Function(UserThemeEnableThemeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserThemeEnableThemeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserThemeEnableThemeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeEnableThemeResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
    final void Function(UserThemeEnableThemeResponseApplicationJsonBuilder)? b,
  ]) = _$UserThemeEnableThemeResponseApplicationJson;

  // coverage:ignore-start
  const UserThemeEnableThemeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeEnableThemeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
    final void Function(UserThemeDisableThemeResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserThemeDisableThemeResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserThemeDisableThemeResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeDisableThemeResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
    final void Function(UserThemeDisableThemeResponseApplicationJsonBuilder)? b,
  ]) = _$UserThemeDisableThemeResponseApplicationJson;

  // coverage:ignore-start
  const UserThemeDisableThemeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserThemeDisableThemeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory PublicCapabilities_Theming([final void Function(PublicCapabilities_ThemingBuilder)? b]) =
      _$PublicCapabilities_Theming;

  // coverage:ignore-start
  const PublicCapabilities_Theming._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities_Theming.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities_Theming> get serializer => _$publicCapabilitiesThemingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PublicCapabilitiesInterface {
  PublicCapabilities_Theming get theming;
}

abstract class PublicCapabilities
    implements $PublicCapabilitiesInterface, Built<PublicCapabilities, PublicCapabilitiesBuilder> {
  factory PublicCapabilities([final void Function(PublicCapabilitiesBuilder)? b]) = _$PublicCapabilities;

  // coverage:ignore-start
  const PublicCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PublicCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PublicCapabilities> get serializer => _$publicCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
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

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
