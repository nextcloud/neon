//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultApi extends ApiInstance<ApiClient> {
  DefaultApi(ApiClient apiClient) : super(apiClient);

  /// Performs an HTTP 'GET /avatar/{userId}/{size}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [int] size (required):
  Future<Response> getAvatarWithHttpInfo(
    String userId,
    int size,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/avatar/{userId}/{size}'.replaceAll('{userId}', userId).replaceAll('{size}', size.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [int] size (required):
  Future<String?> getAvatar(
    String userId,
    int size,
  ) async {
    final response = await getAvatarWithHttpInfo(
      userId,
      size,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'String',
      ) as String;
    }
    return null;
  }

  /// Performs an HTTP 'GET /ocs/v1.php/cloud/capabilities' operation and returns the [Response].
  Future<Response> getCapabilitiesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/ocs/v1.php/cloud/capabilities';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<CoreServerCapabilities?> getCapabilities() async {
    final response = await getCapabilitiesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'CoreServerCapabilities',
      ) as CoreServerCapabilities;
    }
    return null;
  }

  /// Performs an HTTP 'POST /login/v2/poll' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CoreLoginFlowQuery] coreLoginFlowQuery (required):
  Future<Response> getLoginFlowResultWithHttpInfo(
    CoreLoginFlowQuery coreLoginFlowQuery,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/login/v2/poll';

    // ignore: prefer_final_locals
    Object? postBody = coreLoginFlowQuery;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CoreLoginFlowQuery] coreLoginFlowQuery (required):
  Future<CoreLoginFlowResult?> getLoginFlowResult(
    CoreLoginFlowQuery coreLoginFlowQuery,
  ) async {
    final response = await getLoginFlowResultWithHttpInfo(
      coreLoginFlowQuery,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'CoreLoginFlowResult',
      ) as CoreLoginFlowResult;
    }
    return null;
  }

  /// Performs an HTTP 'GET /ocs/v1.php/core/navigation/apps' operation and returns the [Response].
  Future<Response> getNavigationAppsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/ocs/v1.php/core/navigation/apps';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<CoreNavigationApps?> getNavigationApps() async {
    final response = await getNavigationAppsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'CoreNavigationApps',
      ) as CoreNavigationApps;
    }
    return null;
  }

  /// Performs an HTTP 'GET /core/preview.png' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] file:
  ///
  /// * [int] x:
  ///
  /// * [int] y:
  ///
  /// * [String] mode:
  ///
  /// * [bool] forceIcon:
  ///
  /// * [bool] a:
  Future<Response> getPreviewWithHttpInfo({
    String? file,
    int? x,
    int? y,
    String? mode,
    bool? forceIcon,
    bool? a,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/core/preview.png';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (file != null) {
      queryParams.addAll(buildQueryParams('', 'file', file));
    }
    if (x != null) {
      queryParams.addAll(buildQueryParams('', 'x', x));
    }
    if (y != null) {
      queryParams.addAll(buildQueryParams('', 'y', y));
    }
    if (mode != null) {
      queryParams.addAll(buildQueryParams('', 'mode', mode));
    }
    if (forceIcon != null) {
      queryParams.addAll(buildQueryParams('', 'forceIcon', forceIcon));
    }
    if (a != null) {
      queryParams.addAll(buildQueryParams('', 'a', a));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] file:
  ///
  /// * [int] x:
  ///
  /// * [int] y:
  ///
  /// * [String] mode:
  ///
  /// * [bool] forceIcon:
  ///
  /// * [bool] a:
  Future<String?> getPreview({
    String? file,
    int? x,
    int? y,
    String? mode,
    bool? forceIcon,
    bool? a,
  }) async {
    final response = await getPreviewWithHttpInfo(
      file: file,
      x: x,
      y: y,
      mode: mode,
      forceIcon: forceIcon,
      a: a,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'String',
      ) as String;
    }
    return null;
  }

  /// Performs an HTTP 'GET /status.php' operation and returns the [Response].
  Future<Response> getStatusWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/status.php';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<CoreServerStatus?> getStatus() async {
    final response = await getStatusWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'CoreServerStatus',
      ) as CoreServerStatus;
    }
    return null;
  }

  /// Performs an HTTP 'POST /login/v2' operation and returns the [Response].
  Future<Response> initLoginFlowWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/login/v2';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<CoreLoginFlowInit?> initLoginFlow() async {
    final response = await initLoginFlowWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'CoreLoginFlowInit',
      ) as CoreLoginFlowInit;
    }
    return null;
  }
}
