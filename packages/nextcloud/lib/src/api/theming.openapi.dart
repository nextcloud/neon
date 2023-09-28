// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'theming.openapi.g.dart';

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

  /// Return a 32x32 favicon as png.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [app] ID of the app
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
  ///   * [app] ID of the app
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
    var path = '/index.php/apps/theming/favicon/{app}';
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
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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
  ///   * [app] ID of the app
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
  ///   * [app] ID of the app
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
    var path = '/index.php/apps/theming/icon/{app}';
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
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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
  ///   * [app] ID of the app
  ///   * [image] image file name (svg required)
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
  ///   * [app] ID of the app
  ///   * [image] image file name (svg required)
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
    var path = '/index.php/apps/theming/img/{app}/{image}';
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
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    checkPattern(image, RegExp(r'^.+$'), 'image'); // coverage:ignore-line
    path = path.replaceAll('{image}', Uri.encodeQueryComponent(image));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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
class ThemingThemingClient {
  ThemingThemingClient(this._rootClient);

  final ThemingClient _rootClient;

  /// Get the CSS stylesheet for a theme.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [plain] Let the browser decide the CSS priority
  ///   * [withCustomCss] Include custom CSS
  ///   * [themeId] ID of the theme
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
  ///   * [plain] Let the browser decide the CSS priority
  ///   * [withCustomCss] Include custom CSS
  ///   * [themeId] ID of the theme
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
    var path = '/index.php/apps/theming/theme/{themeId}.css';
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
    path = path.replaceAll('{themeId}', Uri.encodeQueryComponent(themeId));
    if (plain != 0) {
      queryParameters['plain'] = plain.toString();
    }
    if (withCustomCss != 0) {
      queryParameters['withCustomCss'] = withCustomCss.toString();
    }
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<String, void>(
      response: _rootClient.doRequest(
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
  ///   * [useSvg] Return image as SVG
  ///   * [key] Key of the image
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
  ///   * [useSvg] Return image as SVG
  ///   * [key] Key of the image
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
    var path = '/index.php/apps/theming/image/{key}';
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
    path = path.replaceAll('{key}', Uri.encodeQueryComponent(key));
    if (useSvg != 1) {
      queryParameters['useSvg'] = useSvg.toString();
    }
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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
  ///   * [app] ID of the app
  ///
  /// Status codes:
  ///   * 200: Manifest returned
  ///
  /// See:
  ///  * [getManifestRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ThemingThemingGetManifestResponseApplicationJson, void>> getManifest({
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
  ///   * [app] ID of the app
  ///
  /// Status codes:
  ///   * 200: Manifest returned
  ///
  /// See:
  ///  * [getManifest] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ThemingThemingGetManifestResponseApplicationJson, void> getManifestRaw({
    required final String app,
  }) {
    var path = '/index.php/apps/theming/manifest/{app}';
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
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<ThemingThemingGetManifestResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ThemingThemingGetManifestResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class ThemingUserThemeClient {
  ThemingUserThemeClient(this._rootClient);

  final ThemingClient _rootClient;

  /// Get the background image.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
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
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Background image returned
  ///   * 404: Background image not found
  ///
  /// See:
  ///  * [getBackground] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getBackgroundRaw({final bool oCSAPIRequest = true}) {
    const path = '/index.php/apps/theming/background';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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
  ///   * [value] Path of the background image
  ///   * [color] Color for the background
  ///   * [type] Type of background
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Background set successfully
  ///   * 400: Setting background is not possible
  ///   * 500
  ///
  /// See:
  ///  * [setBackgroundRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ThemingBackground, void>> setBackground({
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
  ///   * [value] Path of the background image
  ///   * [color] Color for the background
  ///   * [type] Type of background
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Background set successfully
  ///   * 400: Setting background is not possible
  ///   * 500
  ///
  /// See:
  ///  * [setBackground] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ThemingBackground, void> setBackgroundRaw({
    required final String type,
    final String value = '',
    final String? color,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/index.php/apps/theming/background/{type}';
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
    path = path.replaceAll('{type}', Uri.encodeQueryComponent(type));
    if (value != '') {
      queryParameters['value'] = value;
    }
    if (color != null) {
      queryParameters['color'] = color;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<ThemingBackground, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ThemingBackground),
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
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Background deleted successfully
  ///
  /// See:
  ///  * [deleteBackgroundRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ThemingBackground, void>> deleteBackground({final bool oCSAPIRequest = true}) async {
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
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Background deleted successfully
  ///
  /// See:
  ///  * [deleteBackground] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ThemingBackground, void> deleteBackgroundRaw({final bool oCSAPIRequest = true}) {
    const path = '/index.php/apps/theming/background/custom';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<ThemingBackground, void>(
      response: _rootClient.doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ThemingBackground),
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
  ///   * [themeId] the theme ID
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Theme enabled successfully
  ///   * 400: Enabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [enableThemeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ThemingUserThemeEnableThemeResponseApplicationJson, void>> enableTheme({
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
  ///   * [themeId] the theme ID
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Theme enabled successfully
  ///   * 400: Enabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [enableTheme] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ThemingUserThemeEnableThemeResponseApplicationJson, void> enableThemeRaw({
    required final String themeId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/theming/api/v1/theme/{themeId}/enable';
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
    path = path.replaceAll('{themeId}', Uri.encodeQueryComponent(themeId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<ThemingUserThemeEnableThemeResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ThemingUserThemeEnableThemeResponseApplicationJson),
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
  ///   * [themeId] the theme ID
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Theme disabled successfully
  ///   * 400: Disabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [disableThemeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ThemingUserThemeDisableThemeResponseApplicationJson, void>> disableTheme({
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
  ///   * [themeId] the theme ID
  ///   * [oCSAPIRequest] Required to be true for the API request to pass
  ///
  /// Status codes:
  ///   * 200: Theme disabled successfully
  ///   * 400: Disabling theme is not possible
  ///   * 500
  ///
  /// See:
  ///  * [disableTheme] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ThemingUserThemeDisableThemeResponseApplicationJson, void> disableThemeRaw({
    required final String themeId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/theming/api/v1/theme/{themeId}';
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
    path = path.replaceAll('{themeId}', Uri.encodeQueryComponent(themeId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<ThemingUserThemeDisableThemeResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ThemingUserThemeDisableThemeResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
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

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
