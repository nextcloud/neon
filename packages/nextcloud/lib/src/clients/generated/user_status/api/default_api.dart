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

  /// Performs an HTTP 'DELETE /api/v1/user_status/message' operation and returns the [Response].
  Future<Response> clearMessageWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status/message';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<void> clearMessage() async {
    final response = await clearMessageWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/v1/predefined_statuses' operation and returns the [Response].
  Future<Response> findAllPredefinedStatusesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/predefined_statuses';

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

  Future<UserStatusPredefinedStatuses?> findAllPredefinedStatuses() async {
    final response = await findAllPredefinedStatusesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'UserStatusPredefinedStatuses',
      ) as UserStatusPredefinedStatuses;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1/statuses' operation and returns the [Response].
  Future<Response> findAllStatusesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/statuses';

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

  Future<UserStatusFindAllStatuses?> findAllStatuses() async {
    final response = await findAllStatusesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'UserStatusFindAllStatuses',
      ) as UserStatusFindAllStatuses;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1/statuses/{userId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId (required):
  Future<Response> findStatusWithHttpInfo(
    String userId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/statuses/{userId}'.replaceAll('{userId}', userId);

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
  Future<UserStatusFindStatus?> findStatus(
    String userId,
  ) async {
    final response = await findStatusWithHttpInfo(
      userId,
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
        'UserStatusFindStatus',
      ) as UserStatusFindStatus;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1/user_status' operation and returns the [Response].
  Future<Response> getStatusWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status';

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

  Future<UserStatusGetUserStatus?> getStatus() async {
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
        'UserStatusGetUserStatus',
      ) as UserStatusGetUserStatus;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/v1/heartbeat' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserStatusTypeEnum] status (required):
  Future<Response> heartbeatWithHttpInfo(
    UserStatusTypeEnum status,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/heartbeat';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    queryParams.addAll(buildQueryParams('', 'status', status));

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserStatusTypeEnum] status (required):
  Future<void> heartbeat(
    UserStatusTypeEnum status,
  ) async {
    final response = await heartbeatWithHttpInfo(
      status,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1/user_status/message/custom' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] statusIcon:
  ///
  /// * [String] message:
  ///
  /// * [int] clearAt:
  Future<Response> setCustomMessageWithHttpInfo({
    String? statusIcon,
    String? message,
    int? clearAt,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status/message/custom';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (statusIcon != null) {
      queryParams.addAll(buildQueryParams('', 'statusIcon', statusIcon));
    }
    if (message != null) {
      queryParams.addAll(buildQueryParams('', 'message', message));
    }
    if (clearAt != null) {
      queryParams.addAll(buildQueryParams('', 'clearAt', clearAt));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] statusIcon:
  ///
  /// * [String] message:
  ///
  /// * [int] clearAt:
  Future<UserStatusGetUserStatus?> setCustomMessage({
    String? statusIcon,
    String? message,
    int? clearAt,
  }) async {
    final response = await setCustomMessageWithHttpInfo(
      statusIcon: statusIcon,
      message: message,
      clearAt: clearAt,
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
        'UserStatusGetUserStatus',
      ) as UserStatusGetUserStatus;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/v1/user_status/message/predefined' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] messageId (required):
  ///
  /// * [int] clearAt:
  Future<Response> setPredefinedMessageWithHttpInfo(
    String messageId, {
    int? clearAt,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status/message/predefined';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    queryParams.addAll(buildQueryParams('', 'messageId', messageId));
    if (clearAt != null) {
      queryParams.addAll(buildQueryParams('', 'clearAt', clearAt));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] messageId (required):
  ///
  /// * [int] clearAt:
  Future<UserStatusGetUserStatus?> setPredefinedMessage(
    String messageId, {
    int? clearAt,
  }) async {
    final response = await setPredefinedMessageWithHttpInfo(
      messageId,
      clearAt: clearAt,
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
        'UserStatusGetUserStatus',
      ) as UserStatusGetUserStatus;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/v1/user_status/status' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserStatusTypeEnum] statusType (required):
  Future<Response> setStatusWithHttpInfo(
    UserStatusTypeEnum statusType,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status/status';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    queryParams.addAll(buildQueryParams('', 'statusType', statusType));

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserStatusTypeEnum] statusType (required):
  Future<UserStatusGetUserStatus?> setStatus(
    UserStatusTypeEnum statusType,
  ) async {
    final response = await setStatusWithHttpInfo(
      statusType,
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
        'UserStatusGetUserStatus',
      ) as UserStatusGetUserStatus;
    }
    return null;
  }
}
