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
  /// * [UserStatusHeartbeat] userStatusHeartbeat (required):
  Future<Response> heartbeatWithHttpInfo(
    UserStatusHeartbeat userStatusHeartbeat,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/heartbeat';

    // ignore: prefer_final_locals
    Object? postBody = userStatusHeartbeat;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

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
  /// * [UserStatusHeartbeat] userStatusHeartbeat (required):
  Future<void> heartbeat(
    UserStatusHeartbeat userStatusHeartbeat,
  ) async {
    final response = await heartbeatWithHttpInfo(
      userStatusHeartbeat,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1/user_status/message/custom' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserStatusSetCustomMessage] userStatusSetCustomMessage (required):
  Future<Response> setCustomMessageWithHttpInfo(
    UserStatusSetCustomMessage userStatusSetCustomMessage,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status/message/custom';

    // ignore: prefer_final_locals
    Object? postBody = userStatusSetCustomMessage;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

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
  /// * [UserStatusSetCustomMessage] userStatusSetCustomMessage (required):
  Future<UserStatusGetUserStatus?> setCustomMessage(
    UserStatusSetCustomMessage userStatusSetCustomMessage,
  ) async {
    final response = await setCustomMessageWithHttpInfo(
      userStatusSetCustomMessage,
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
  /// * [UserStatusSetPredefinedMessage] userStatusSetPredefinedMessage (required):
  Future<Response> setPredefinedMessageWithHttpInfo(
    UserStatusSetPredefinedMessage userStatusSetPredefinedMessage,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status/message/predefined';

    // ignore: prefer_final_locals
    Object? postBody = userStatusSetPredefinedMessage;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

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
  /// * [UserStatusSetPredefinedMessage] userStatusSetPredefinedMessage (required):
  Future<UserStatusGetUserStatus?> setPredefinedMessage(
    UserStatusSetPredefinedMessage userStatusSetPredefinedMessage,
  ) async {
    final response = await setPredefinedMessageWithHttpInfo(
      userStatusSetPredefinedMessage,
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
  /// * [UserStatusSetUserStatus] userStatusSetUserStatus (required):
  Future<Response> setStatusWithHttpInfo(
    UserStatusSetUserStatus userStatusSetUserStatus,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/user_status/status';

    // ignore: prefer_final_locals
    Object? postBody = userStatusSetUserStatus;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

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
  /// * [UserStatusSetUserStatus] userStatusSetUserStatus (required):
  Future<UserStatusGetUserStatus?> setStatus(
    UserStatusSetUserStatus userStatusSetUserStatus,
  ) async {
    final response = await setStatusWithHttpInfo(
      userStatusSetUserStatus,
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
