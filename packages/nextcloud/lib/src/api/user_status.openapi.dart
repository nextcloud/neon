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
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'user_status.openapi.g.dart';

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

  HeartbeatClient get heartbeat => HeartbeatClient(this);

  PredefinedStatusClient get predefinedStatus => PredefinedStatusClient(this);

  StatusesClient get statuses => StatusesClient(this);

  UserStatusClient get userStatus => UserStatusClient(this);
}

class HeartbeatClient {
  HeartbeatClient(this._rootClient);

  final Client _rootClient;

  /// Keep the status alive.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [status] Only online, away.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Status successfully updated
  ///   * 400: Invalid status to update
  ///   * 500
  ///   * 204: User has no status to keep alive
  ///
  /// See:
  ///  * [heartbeatRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<HeartbeatHeartbeatResponseApplicationJson, void>> heartbeat({
    required final String status,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = heartbeatRaw(
      status: status,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Keep the status alive.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [status] Only online, away.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Status successfully updated
  ///   * 400: Invalid status to update
  ///   * 500
  ///   * 204: User has no status to keep alive
  ///
  /// See:
  ///  * [heartbeat] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<HeartbeatHeartbeatResponseApplicationJson, void> heartbeatRaw({
    required final String status,
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
    queryParameters['status'] = status;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/user_status/api/v1/heartbeat';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<HeartbeatHeartbeatResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(HeartbeatHeartbeatResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class PredefinedStatusClient {
  PredefinedStatusClient(this._rootClient);

  final Client _rootClient;

  /// Get all predefined messages.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Predefined statuses returned
  ///
  /// See:
  ///  * [findAllRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PredefinedStatusFindAllResponseApplicationJson, void>> findAll({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = findAllRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get all predefined messages.
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
  ///   * 200: Predefined statuses returned
  ///
  /// See:
  ///  * [findAll] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PredefinedStatusFindAllResponseApplicationJson, void> findAllRaw({
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
    const path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<PredefinedStatusFindAllResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(PredefinedStatusFindAllResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class StatusesClient {
  StatusesClient(this._rootClient);

  final Client _rootClient;

  /// Find statuses of users.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Maximum number of statuses to find.
  ///   * [offset] Offset for finding statuses.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Statuses returned
  ///
  /// See:
  ///  * [findAllRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<StatusesFindAllResponseApplicationJson, void>> findAll({
    final int? limit,
    final int? offset,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = findAllRaw(
      limit: limit,
      offset: offset,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Find statuses of users.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [limit] Maximum number of statuses to find.
  ///   * [offset] Offset for finding statuses.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Statuses returned
  ///
  /// See:
  ///  * [findAll] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<StatusesFindAllResponseApplicationJson, void> findAllRaw({
    final int? limit,
    final int? offset,
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
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != null) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/user_status/api/v1/statuses';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<StatusesFindAllResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(StatusesFindAllResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Find the status of a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Status returned
  ///   * 404: The user was not found
  ///
  /// See:
  ///  * [findRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<StatusesFindResponseApplicationJson, void>> find({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = findRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Find the status of a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Status returned
  ///   * 404: The user was not found
  ///
  /// See:
  ///  * [find] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<StatusesFindResponseApplicationJson, void> findRaw({
    required final String userId,
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
    final userId0 = Uri.encodeQueryComponent(userId);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/user_status/api/v1/statuses/$userId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<StatusesFindResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(StatusesFindResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class UserStatusClient {
  UserStatusClient(this._rootClient);

  final Client _rootClient;

  /// Get the status of the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: The status was found successfully
  ///   * 404: The user was not found
  ///
  /// See:
  ///  * [getStatusRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserStatusGetStatusResponseApplicationJson, void>> getStatus({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getStatusRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the status of the current user.
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
  ///   * 200: The status was found successfully
  ///   * 404: The user was not found
  ///
  /// See:
  ///  * [getStatus] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserStatusGetStatusResponseApplicationJson, void> getStatusRaw({
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
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UserStatusGetStatusResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserStatusGetStatusResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update the status type of the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [statusType] The new status type.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: The status was updated successfully
  ///   * 400: The status type is invalid
  ///
  /// See:
  ///  * [setStatusRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserStatusSetStatusResponseApplicationJson, void>> setStatus({
    required final String statusType,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setStatusRaw(
      statusType: statusType,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the status type of the current user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [statusType] The new status type.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: The status was updated successfully
  ///   * 400: The status type is invalid
  ///
  /// See:
  ///  * [setStatus] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserStatusSetStatusResponseApplicationJson, void> setStatusRaw({
    required final String statusType,
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
    queryParameters['statusType'] = statusType;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/status';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UserStatusSetStatusResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserStatusSetStatusResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Set the message to a predefined message for the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [messageId] ID of the predefined message.
  ///   * [clearAt] When the message should be cleared.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: The message was updated successfully
  ///   * 400: The clearAt or message-id is invalid
  ///
  /// See:
  ///  * [setPredefinedMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserStatusSetPredefinedMessageResponseApplicationJson, void>> setPredefinedMessage({
    required final String messageId,
    final int? clearAt,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setPredefinedMessageRaw(
      messageId: messageId,
      clearAt: clearAt,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set the message to a predefined message for the current user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [messageId] ID of the predefined message.
  ///   * [clearAt] When the message should be cleared.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: The message was updated successfully
  ///   * 400: The clearAt or message-id is invalid
  ///
  /// See:
  ///  * [setPredefinedMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserStatusSetPredefinedMessageResponseApplicationJson, void> setPredefinedMessageRaw({
    required final String messageId,
    final int? clearAt,
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
    queryParameters['messageId'] = messageId;
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UserStatusSetPredefinedMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserStatusSetPredefinedMessageResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Set the message to a custom message for the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [statusIcon] Icon of the status.
  ///   * [message] Message of the status.
  ///   * [clearAt] When the message should be cleared.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: The message was updated successfully
  ///   * 400: The clearAt or icon is invalid or the message is too long
  ///
  /// See:
  ///  * [setCustomMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserStatusSetCustomMessageResponseApplicationJson, void>> setCustomMessage({
    final String? statusIcon,
    final String? message,
    final int? clearAt,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setCustomMessageRaw(
      statusIcon: statusIcon,
      message: message,
      clearAt: clearAt,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set the message to a custom message for the current user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [statusIcon] Icon of the status.
  ///   * [message] Message of the status.
  ///   * [clearAt] When the message should be cleared.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: The message was updated successfully
  ///   * 400: The clearAt or icon is invalid or the message is too long
  ///
  /// See:
  ///  * [setCustomMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserStatusSetCustomMessageResponseApplicationJson, void> setCustomMessageRaw({
    final String? statusIcon,
    final String? message,
    final int? clearAt,
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
    if (statusIcon != null) {
      queryParameters['statusIcon'] = statusIcon;
    }
    if (message != null) {
      queryParameters['message'] = message;
    }
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UserStatusSetCustomMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserStatusSetCustomMessageResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Clear the message of the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Message cleared successfully
  ///
  /// See:
  ///  * [clearMessageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserStatusClearMessageResponseApplicationJson, void>> clearMessage({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = clearMessageRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Clear the message of the current user.
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
  ///   * 200: Message cleared successfully
  ///
  /// See:
  ///  * [clearMessage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserStatusClearMessageResponseApplicationJson, void> clearMessageRaw({
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
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UserStatusClearMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserStatusClearMessageResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Revert the status to the previous status.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [messageId] ID of the message to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Status reverted
  ///
  /// See:
  ///  * [revertStatusRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UserStatusRevertStatusResponseApplicationJson, void>> revertStatus({
    required final String messageId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = revertStatusRaw(
      messageId: messageId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Revert the status to the previous status.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [messageId] ID of the message to delete.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Status reverted
  ///
  /// See:
  ///  * [revertStatus] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UserStatusRevertStatusResponseApplicationJson, void> revertStatusRaw({
    required final String messageId,
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
    final messageId0 = Uri.encodeQueryComponent(messageId);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/user_status/api/v1/user_status/revert/$messageId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UserStatusRevertStatusResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UserStatusRevertStatusResponseApplicationJson),
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OCSMeta> get serializer => const _$OCSMetaSerializer();
}

class _$OCSMetaSerializer implements StructuredSerializer<OCSMeta> {
  const _$OCSMetaSerializer();

  @override
  Iterable<Type> get types => const [OCSMeta, _$OCSMeta];

  @override
  String get wireName => 'OCSMeta';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OCSMeta object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  OCSMeta deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PublicInterface {
  String get userId;
  String? get message;
  String? get icon;
  int? get clearAt;
  String get status;
}

abstract class Public implements PublicInterface, Built<Public, PublicBuilder> {
  factory Public([final void Function(PublicBuilder)? b]) = _$Public;

  // coverage:ignore-start
  const Public._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Public.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Public> get serializer => const _$PublicSerializer();
}

class _$PublicSerializer implements StructuredSerializer<Public> {
  const _$PublicSerializer();

  @override
  Iterable<Type> get types => const [Public, _$Public];

  @override
  String get wireName => 'Public';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Public object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    return result;
  }

  @override
  Public deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'clearAt':
          result.clearAt = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Private_1Interface {
  String? get messageId;
  bool get messageIsPredefined;
  bool get statusIsUserDefined;
}

@BuiltValue(instantiable: false)
abstract interface class PrivateInterface implements PublicInterface, Private_1Interface {}

abstract class Private implements PrivateInterface, Built<Private, PrivateBuilder> {
  factory Private([final void Function(PrivateBuilder)? b]) = _$Private;

  // coverage:ignore-start
  const Private._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Private.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Private> get serializer => _$privateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class HeartbeatHeartbeatResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class HeartbeatHeartbeatResponseApplicationJson_Ocs
    implements
        HeartbeatHeartbeatResponseApplicationJson_OcsInterface,
        Built<HeartbeatHeartbeatResponseApplicationJson_Ocs, HeartbeatHeartbeatResponseApplicationJson_OcsBuilder> {
  factory HeartbeatHeartbeatResponseApplicationJson_Ocs([
    final void Function(HeartbeatHeartbeatResponseApplicationJson_OcsBuilder)? b,
  ]) = _$HeartbeatHeartbeatResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const HeartbeatHeartbeatResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HeartbeatHeartbeatResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<HeartbeatHeartbeatResponseApplicationJson_Ocs> get serializer =>
      const _$HeartbeatHeartbeatResponseApplicationJson_OcsSerializer();
}

class _$HeartbeatHeartbeatResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<HeartbeatHeartbeatResponseApplicationJson_Ocs> {
  const _$HeartbeatHeartbeatResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [HeartbeatHeartbeatResponseApplicationJson_Ocs, _$HeartbeatHeartbeatResponseApplicationJson_Ocs];

  @override
  String get wireName => 'HeartbeatHeartbeatResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final HeartbeatHeartbeatResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Private)),
    ];
    return result;
  }

  @override
  HeartbeatHeartbeatResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = HeartbeatHeartbeatResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(Private))! as Private,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class HeartbeatHeartbeatResponseApplicationJsonInterface {
  HeartbeatHeartbeatResponseApplicationJson_Ocs get ocs;
}

abstract class HeartbeatHeartbeatResponseApplicationJson
    implements
        HeartbeatHeartbeatResponseApplicationJsonInterface,
        Built<HeartbeatHeartbeatResponseApplicationJson, HeartbeatHeartbeatResponseApplicationJsonBuilder> {
  factory HeartbeatHeartbeatResponseApplicationJson([
    final void Function(HeartbeatHeartbeatResponseApplicationJsonBuilder)? b,
  ]) = _$HeartbeatHeartbeatResponseApplicationJson;

  // coverage:ignore-start
  const HeartbeatHeartbeatResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HeartbeatHeartbeatResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<HeartbeatHeartbeatResponseApplicationJson> get serializer =>
      const _$HeartbeatHeartbeatResponseApplicationJsonSerializer();
}

class _$HeartbeatHeartbeatResponseApplicationJsonSerializer
    implements StructuredSerializer<HeartbeatHeartbeatResponseApplicationJson> {
  const _$HeartbeatHeartbeatResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [HeartbeatHeartbeatResponseApplicationJson, _$HeartbeatHeartbeatResponseApplicationJson];

  @override
  String get wireName => 'HeartbeatHeartbeatResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final HeartbeatHeartbeatResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(HeartbeatHeartbeatResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  HeartbeatHeartbeatResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = HeartbeatHeartbeatResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(HeartbeatHeartbeatResponseApplicationJson_Ocs),
            )! as HeartbeatHeartbeatResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class ClearAt_Type extends EnumClass {
  const ClearAt_Type._(super.name);

  static const ClearAt_Type period = _$clearAtTypePeriod;

  @BuiltValueEnumConst(wireName: 'end-of')
  static const ClearAt_Type endOf = _$clearAtTypeEndOf;

  // coverage:ignore-start
  static BuiltSet<ClearAt_Type> get values => _$clearAtTypeValues;
  // coverage:ignore-end

  static ClearAt_Type valueOf(final String name) => _$valueOfClearAt_Type(name);

  static Serializer<ClearAt_Type> get serializer => _$clearAtTypeSerializer;
}

class ClearAtTimeType extends EnumClass {
  const ClearAtTimeType._(super.name);

  static const ClearAtTimeType day = _$clearAtTimeTypeDay;

  static const ClearAtTimeType week = _$clearAtTimeTypeWeek;

  // coverage:ignore-start
  static BuiltSet<ClearAtTimeType> get values => _$clearAtTimeTypeValues;
  // coverage:ignore-end

  static ClearAtTimeType valueOf(final String name) => _$valueOfClearAtTimeType(name);

  static Serializer<ClearAtTimeType> get serializer => _$clearAtTimeTypeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ClearAt_TimeInterface {
  int? get $int;
  ClearAtTimeType? get clearAtTimeType;
}

abstract class ClearAt_Time implements ClearAt_TimeInterface, Built<ClearAt_Time, ClearAt_TimeBuilder> {
  factory ClearAt_Time([final void Function(ClearAt_TimeBuilder)? b]) = _$ClearAt_Time;

  // coverage:ignore-start
  const ClearAt_Time._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ClearAt_Time.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ClearAt_Time> get serializer => _$ClearAt_TimeSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final ClearAt_TimeBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._clearAtTimeType].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', 'clearAtTimeType' for ${b._data}");
    }
  }
}

class _$ClearAt_TimeSerializer implements PrimitiveSerializer<ClearAt_Time> {
  @override
  final Iterable<Type> types = const [ClearAt_Time, _$ClearAt_Time];

  @override
  final String wireName = 'ClearAt_Time';

  @override
  Object serialize(
    final Serializers serializers,
    final ClearAt_Time object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ClearAt_Time deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClearAt_TimeBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(ClearAtTimeType))! as ClearAtTimeType;
      result.clearAtTimeType = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ClearAtInterface {
  ClearAt_Type get type;
  ClearAt_Time get time;
}

abstract class ClearAt implements ClearAtInterface, Built<ClearAt, ClearAtBuilder> {
  factory ClearAt([final void Function(ClearAtBuilder)? b]) = _$ClearAt;

  // coverage:ignore-start
  const ClearAt._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ClearAt.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ClearAt> get serializer => const _$ClearAtSerializer();
}

class _$ClearAtSerializer implements StructuredSerializer<ClearAt> {
  const _$ClearAtSerializer();

  @override
  Iterable<Type> get types => const [ClearAt, _$ClearAt];

  @override
  String get wireName => 'ClearAt';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ClearAt object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(ClearAt_Type)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(ClearAt_Time)),
    ];
    return result;
  }

  @override
  ClearAt deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClearAtBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(ClearAt_Type))! as ClearAt_Type;
        case 'time':
          result.time.replace(
            serializers.deserialize(value, specifiedType: const FullType(ClearAt_Time))! as ClearAt_Time,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PredefinedInterface {
  String get id;
  String get icon;
  String get message;
  ClearAt? get clearAt;
  bool? get visible;
}

abstract class Predefined implements PredefinedInterface, Built<Predefined, PredefinedBuilder> {
  factory Predefined([final void Function(PredefinedBuilder)? b]) = _$Predefined;

  // coverage:ignore-start
  const Predefined._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Predefined.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Predefined> get serializer => const _$PredefinedSerializer();
}

class _$PredefinedSerializer implements StructuredSerializer<Predefined> {
  const _$PredefinedSerializer();

  @override
  Iterable<Type> get types => const [Predefined, _$Predefined];

  @override
  String get wireName => 'Predefined';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Predefined object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(ClearAt)),
        );
    }

    value = object.visible;
    if (value != null) {
      result
        ..add('visible')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  Predefined deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PredefinedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'clearAt':
          result.clearAt.replace(
            serializers.deserialize(value, specifiedType: const FullType(ClearAt))! as ClearAt,
          );
        case 'visible':
          result.visible = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PredefinedStatusFindAllResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Predefined> get data;
}

abstract class PredefinedStatusFindAllResponseApplicationJson_Ocs
    implements
        PredefinedStatusFindAllResponseApplicationJson_OcsInterface,
        Built<PredefinedStatusFindAllResponseApplicationJson_Ocs,
            PredefinedStatusFindAllResponseApplicationJson_OcsBuilder> {
  factory PredefinedStatusFindAllResponseApplicationJson_Ocs([
    final void Function(PredefinedStatusFindAllResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PredefinedStatusFindAllResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PredefinedStatusFindAllResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PredefinedStatusFindAllResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PredefinedStatusFindAllResponseApplicationJson_Ocs> get serializer =>
      const _$PredefinedStatusFindAllResponseApplicationJson_OcsSerializer();
}

class _$PredefinedStatusFindAllResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<PredefinedStatusFindAllResponseApplicationJson_Ocs> {
  const _$PredefinedStatusFindAllResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [PredefinedStatusFindAllResponseApplicationJson_Ocs, _$PredefinedStatusFindAllResponseApplicationJson_Ocs];

  @override
  String get wireName => 'PredefinedStatusFindAllResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PredefinedStatusFindAllResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Predefined)])),
    ];
    return result;
  }

  @override
  PredefinedStatusFindAllResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PredefinedStatusFindAllResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Predefined)]))!
                as BuiltList<Predefined>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PredefinedStatusFindAllResponseApplicationJsonInterface {
  PredefinedStatusFindAllResponseApplicationJson_Ocs get ocs;
}

abstract class PredefinedStatusFindAllResponseApplicationJson
    implements
        PredefinedStatusFindAllResponseApplicationJsonInterface,
        Built<PredefinedStatusFindAllResponseApplicationJson, PredefinedStatusFindAllResponseApplicationJsonBuilder> {
  factory PredefinedStatusFindAllResponseApplicationJson([
    final void Function(PredefinedStatusFindAllResponseApplicationJsonBuilder)? b,
  ]) = _$PredefinedStatusFindAllResponseApplicationJson;

  // coverage:ignore-start
  const PredefinedStatusFindAllResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PredefinedStatusFindAllResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PredefinedStatusFindAllResponseApplicationJson> get serializer =>
      const _$PredefinedStatusFindAllResponseApplicationJsonSerializer();
}

class _$PredefinedStatusFindAllResponseApplicationJsonSerializer
    implements StructuredSerializer<PredefinedStatusFindAllResponseApplicationJson> {
  const _$PredefinedStatusFindAllResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [PredefinedStatusFindAllResponseApplicationJson, _$PredefinedStatusFindAllResponseApplicationJson];

  @override
  String get wireName => 'PredefinedStatusFindAllResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PredefinedStatusFindAllResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(PredefinedStatusFindAllResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  PredefinedStatusFindAllResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PredefinedStatusFindAllResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(PredefinedStatusFindAllResponseApplicationJson_Ocs),
            )! as PredefinedStatusFindAllResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class StatusesFindAllResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Public> get data;
}

abstract class StatusesFindAllResponseApplicationJson_Ocs
    implements
        StatusesFindAllResponseApplicationJson_OcsInterface,
        Built<StatusesFindAllResponseApplicationJson_Ocs, StatusesFindAllResponseApplicationJson_OcsBuilder> {
  factory StatusesFindAllResponseApplicationJson_Ocs([
    final void Function(StatusesFindAllResponseApplicationJson_OcsBuilder)? b,
  ]) = _$StatusesFindAllResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const StatusesFindAllResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindAllResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusesFindAllResponseApplicationJson_Ocs> get serializer =>
      const _$StatusesFindAllResponseApplicationJson_OcsSerializer();
}

class _$StatusesFindAllResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<StatusesFindAllResponseApplicationJson_Ocs> {
  const _$StatusesFindAllResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [StatusesFindAllResponseApplicationJson_Ocs, _$StatusesFindAllResponseApplicationJson_Ocs];

  @override
  String get wireName => 'StatusesFindAllResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final StatusesFindAllResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Public)])),
    ];
    return result;
  }

  @override
  StatusesFindAllResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusesFindAllResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Public)]))!
                as BuiltList<Public>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class StatusesFindAllResponseApplicationJsonInterface {
  StatusesFindAllResponseApplicationJson_Ocs get ocs;
}

abstract class StatusesFindAllResponseApplicationJson
    implements
        StatusesFindAllResponseApplicationJsonInterface,
        Built<StatusesFindAllResponseApplicationJson, StatusesFindAllResponseApplicationJsonBuilder> {
  factory StatusesFindAllResponseApplicationJson([
    final void Function(StatusesFindAllResponseApplicationJsonBuilder)? b,
  ]) = _$StatusesFindAllResponseApplicationJson;

  // coverage:ignore-start
  const StatusesFindAllResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindAllResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusesFindAllResponseApplicationJson> get serializer =>
      const _$StatusesFindAllResponseApplicationJsonSerializer();
}

class _$StatusesFindAllResponseApplicationJsonSerializer
    implements StructuredSerializer<StatusesFindAllResponseApplicationJson> {
  const _$StatusesFindAllResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [StatusesFindAllResponseApplicationJson, _$StatusesFindAllResponseApplicationJson];

  @override
  String get wireName => 'StatusesFindAllResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final StatusesFindAllResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(StatusesFindAllResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  StatusesFindAllResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusesFindAllResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(StatusesFindAllResponseApplicationJson_Ocs))!
                as StatusesFindAllResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class StatusesFindResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Public get data;
}

abstract class StatusesFindResponseApplicationJson_Ocs
    implements
        StatusesFindResponseApplicationJson_OcsInterface,
        Built<StatusesFindResponseApplicationJson_Ocs, StatusesFindResponseApplicationJson_OcsBuilder> {
  factory StatusesFindResponseApplicationJson_Ocs([
    final void Function(StatusesFindResponseApplicationJson_OcsBuilder)? b,
  ]) = _$StatusesFindResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const StatusesFindResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusesFindResponseApplicationJson_Ocs> get serializer =>
      const _$StatusesFindResponseApplicationJson_OcsSerializer();
}

class _$StatusesFindResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<StatusesFindResponseApplicationJson_Ocs> {
  const _$StatusesFindResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [StatusesFindResponseApplicationJson_Ocs, _$StatusesFindResponseApplicationJson_Ocs];

  @override
  String get wireName => 'StatusesFindResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final StatusesFindResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Public)),
    ];
    return result;
  }

  @override
  StatusesFindResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusesFindResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(Public))! as Public,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class StatusesFindResponseApplicationJsonInterface {
  StatusesFindResponseApplicationJson_Ocs get ocs;
}

abstract class StatusesFindResponseApplicationJson
    implements
        StatusesFindResponseApplicationJsonInterface,
        Built<StatusesFindResponseApplicationJson, StatusesFindResponseApplicationJsonBuilder> {
  factory StatusesFindResponseApplicationJson([final void Function(StatusesFindResponseApplicationJsonBuilder)? b]) =
      _$StatusesFindResponseApplicationJson;

  // coverage:ignore-start
  const StatusesFindResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusesFindResponseApplicationJson> get serializer =>
      const _$StatusesFindResponseApplicationJsonSerializer();
}

class _$StatusesFindResponseApplicationJsonSerializer
    implements StructuredSerializer<StatusesFindResponseApplicationJson> {
  const _$StatusesFindResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [StatusesFindResponseApplicationJson, _$StatusesFindResponseApplicationJson];

  @override
  String get wireName => 'StatusesFindResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final StatusesFindResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(StatusesFindResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  StatusesFindResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusesFindResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(StatusesFindResponseApplicationJson_Ocs))!
                as StatusesFindResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusGetStatusResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusGetStatusResponseApplicationJson_Ocs
    implements
        UserStatusGetStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusGetStatusResponseApplicationJson_Ocs, UserStatusGetStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusGetStatusResponseApplicationJson_Ocs([
    final void Function(UserStatusGetStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusGetStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusGetStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusGetStatusResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusGetStatusResponseApplicationJson_Ocs> get serializer =>
      const _$UserStatusGetStatusResponseApplicationJson_OcsSerializer();
}

class _$UserStatusGetStatusResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusGetStatusResponseApplicationJson_Ocs> {
  const _$UserStatusGetStatusResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusGetStatusResponseApplicationJson_Ocs, _$UserStatusGetStatusResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UserStatusGetStatusResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusGetStatusResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Private)),
    ];
    return result;
  }

  @override
  UserStatusGetStatusResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusGetStatusResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(Private))! as Private,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusGetStatusResponseApplicationJsonInterface {
  UserStatusGetStatusResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusGetStatusResponseApplicationJson
    implements
        UserStatusGetStatusResponseApplicationJsonInterface,
        Built<UserStatusGetStatusResponseApplicationJson, UserStatusGetStatusResponseApplicationJsonBuilder> {
  factory UserStatusGetStatusResponseApplicationJson([
    final void Function(UserStatusGetStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusGetStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusGetStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusGetStatusResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusGetStatusResponseApplicationJson> get serializer =>
      const _$UserStatusGetStatusResponseApplicationJsonSerializer();
}

class _$UserStatusGetStatusResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusGetStatusResponseApplicationJson> {
  const _$UserStatusGetStatusResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusGetStatusResponseApplicationJson, _$UserStatusGetStatusResponseApplicationJson];

  @override
  String get wireName => 'UserStatusGetStatusResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusGetStatusResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusGetStatusResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UserStatusGetStatusResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusGetStatusResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UserStatusGetStatusResponseApplicationJson_Ocs),
            )! as UserStatusGetStatusResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusSetStatusResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusSetStatusResponseApplicationJson_Ocs
    implements
        UserStatusSetStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusSetStatusResponseApplicationJson_Ocs, UserStatusSetStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusSetStatusResponseApplicationJson_Ocs([
    final void Function(UserStatusSetStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusSetStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusSetStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetStatusResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusSetStatusResponseApplicationJson_Ocs> get serializer =>
      const _$UserStatusSetStatusResponseApplicationJson_OcsSerializer();
}

class _$UserStatusSetStatusResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusSetStatusResponseApplicationJson_Ocs> {
  const _$UserStatusSetStatusResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusSetStatusResponseApplicationJson_Ocs, _$UserStatusSetStatusResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UserStatusSetStatusResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusSetStatusResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Private)),
    ];
    return result;
  }

  @override
  UserStatusSetStatusResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusSetStatusResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(Private))! as Private,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusSetStatusResponseApplicationJsonInterface {
  UserStatusSetStatusResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusSetStatusResponseApplicationJson
    implements
        UserStatusSetStatusResponseApplicationJsonInterface,
        Built<UserStatusSetStatusResponseApplicationJson, UserStatusSetStatusResponseApplicationJsonBuilder> {
  factory UserStatusSetStatusResponseApplicationJson([
    final void Function(UserStatusSetStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusSetStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusSetStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetStatusResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusSetStatusResponseApplicationJson> get serializer =>
      const _$UserStatusSetStatusResponseApplicationJsonSerializer();
}

class _$UserStatusSetStatusResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusSetStatusResponseApplicationJson> {
  const _$UserStatusSetStatusResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusSetStatusResponseApplicationJson, _$UserStatusSetStatusResponseApplicationJson];

  @override
  String get wireName => 'UserStatusSetStatusResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusSetStatusResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UserStatusSetStatusResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UserStatusSetStatusResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusSetStatusResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UserStatusSetStatusResponseApplicationJson_Ocs),
            )! as UserStatusSetStatusResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusSetPredefinedMessageResponseApplicationJson_Ocs
    implements
        UserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
            UserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusSetPredefinedMessageResponseApplicationJson_Ocs([
    final void Function(UserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusSetPredefinedMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusSetPredefinedMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetPredefinedMessageResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusSetPredefinedMessageResponseApplicationJson_Ocs> get serializer =>
      const _$UserStatusSetPredefinedMessageResponseApplicationJson_OcsSerializer();
}

class _$UserStatusSetPredefinedMessageResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusSetPredefinedMessageResponseApplicationJson_Ocs> {
  const _$UserStatusSetPredefinedMessageResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
        _$UserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UserStatusSetPredefinedMessageResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusSetPredefinedMessageResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Private)),
    ];
    return result;
  }

  @override
  UserStatusSetPredefinedMessageResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(Private))! as Private,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusSetPredefinedMessageResponseApplicationJsonInterface {
  UserStatusSetPredefinedMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusSetPredefinedMessageResponseApplicationJson
    implements
        UserStatusSetPredefinedMessageResponseApplicationJsonInterface,
        Built<UserStatusSetPredefinedMessageResponseApplicationJson,
            UserStatusSetPredefinedMessageResponseApplicationJsonBuilder> {
  factory UserStatusSetPredefinedMessageResponseApplicationJson([
    final void Function(UserStatusSetPredefinedMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusSetPredefinedMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusSetPredefinedMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetPredefinedMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusSetPredefinedMessageResponseApplicationJson> get serializer =>
      const _$UserStatusSetPredefinedMessageResponseApplicationJsonSerializer();
}

class _$UserStatusSetPredefinedMessageResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusSetPredefinedMessageResponseApplicationJson> {
  const _$UserStatusSetPredefinedMessageResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        UserStatusSetPredefinedMessageResponseApplicationJson,
        _$UserStatusSetPredefinedMessageResponseApplicationJson,
      ];

  @override
  String get wireName => 'UserStatusSetPredefinedMessageResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusSetPredefinedMessageResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UserStatusSetPredefinedMessageResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UserStatusSetPredefinedMessageResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusSetPredefinedMessageResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UserStatusSetPredefinedMessageResponseApplicationJson_Ocs),
            )! as UserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusSetCustomMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusSetCustomMessageResponseApplicationJson_Ocs
    implements
        UserStatusSetCustomMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusSetCustomMessageResponseApplicationJson_Ocs,
            UserStatusSetCustomMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusSetCustomMessageResponseApplicationJson_Ocs([
    final void Function(UserStatusSetCustomMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusSetCustomMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusSetCustomMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetCustomMessageResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusSetCustomMessageResponseApplicationJson_Ocs> get serializer =>
      const _$UserStatusSetCustomMessageResponseApplicationJson_OcsSerializer();
}

class _$UserStatusSetCustomMessageResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusSetCustomMessageResponseApplicationJson_Ocs> {
  const _$UserStatusSetCustomMessageResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UserStatusSetCustomMessageResponseApplicationJson_Ocs,
        _$UserStatusSetCustomMessageResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UserStatusSetCustomMessageResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusSetCustomMessageResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Private)),
    ];
    return result;
  }

  @override
  UserStatusSetCustomMessageResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusSetCustomMessageResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(Private))! as Private,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusSetCustomMessageResponseApplicationJsonInterface {
  UserStatusSetCustomMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusSetCustomMessageResponseApplicationJson
    implements
        UserStatusSetCustomMessageResponseApplicationJsonInterface,
        Built<UserStatusSetCustomMessageResponseApplicationJson,
            UserStatusSetCustomMessageResponseApplicationJsonBuilder> {
  factory UserStatusSetCustomMessageResponseApplicationJson([
    final void Function(UserStatusSetCustomMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusSetCustomMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusSetCustomMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetCustomMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusSetCustomMessageResponseApplicationJson> get serializer =>
      const _$UserStatusSetCustomMessageResponseApplicationJsonSerializer();
}

class _$UserStatusSetCustomMessageResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusSetCustomMessageResponseApplicationJson> {
  const _$UserStatusSetCustomMessageResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusSetCustomMessageResponseApplicationJson, _$UserStatusSetCustomMessageResponseApplicationJson];

  @override
  String get wireName => 'UserStatusSetCustomMessageResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusSetCustomMessageResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UserStatusSetCustomMessageResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UserStatusSetCustomMessageResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusSetCustomMessageResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UserStatusSetCustomMessageResponseApplicationJson_Ocs),
            )! as UserStatusSetCustomMessageResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusClearMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UserStatusClearMessageResponseApplicationJson_Ocs
    implements
        UserStatusClearMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusClearMessageResponseApplicationJson_Ocs,
            UserStatusClearMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusClearMessageResponseApplicationJson_Ocs([
    final void Function(UserStatusClearMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusClearMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusClearMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusClearMessageResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusClearMessageResponseApplicationJson_Ocs> get serializer =>
      const _$UserStatusClearMessageResponseApplicationJson_OcsSerializer();
}

class _$UserStatusClearMessageResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusClearMessageResponseApplicationJson_Ocs> {
  const _$UserStatusClearMessageResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusClearMessageResponseApplicationJson_Ocs, _$UserStatusClearMessageResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UserStatusClearMessageResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusClearMessageResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(JsonObject)),
    ];
    return result;
  }

  @override
  UserStatusClearMessageResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusClearMessageResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusClearMessageResponseApplicationJsonInterface {
  UserStatusClearMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusClearMessageResponseApplicationJson
    implements
        UserStatusClearMessageResponseApplicationJsonInterface,
        Built<UserStatusClearMessageResponseApplicationJson, UserStatusClearMessageResponseApplicationJsonBuilder> {
  factory UserStatusClearMessageResponseApplicationJson([
    final void Function(UserStatusClearMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusClearMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusClearMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusClearMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusClearMessageResponseApplicationJson> get serializer =>
      const _$UserStatusClearMessageResponseApplicationJsonSerializer();
}

class _$UserStatusClearMessageResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusClearMessageResponseApplicationJson> {
  const _$UserStatusClearMessageResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusClearMessageResponseApplicationJson, _$UserStatusClearMessageResponseApplicationJson];

  @override
  String get wireName => 'UserStatusClearMessageResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusClearMessageResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UserStatusClearMessageResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UserStatusClearMessageResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusClearMessageResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UserStatusClearMessageResponseApplicationJson_Ocs),
            )! as UserStatusClearMessageResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusRevertStatusResponseApplicationJson_Ocs_DataInterface {
  Private? get private;
  BuiltList<JsonObject>? get builtListJsonObject;
}

abstract class UserStatusRevertStatusResponseApplicationJson_Ocs_Data
    implements
        UserStatusRevertStatusResponseApplicationJson_Ocs_DataInterface,
        Built<UserStatusRevertStatusResponseApplicationJson_Ocs_Data,
            UserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder> {
  factory UserStatusRevertStatusResponseApplicationJson_Ocs_Data([
    final void Function(UserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$UserStatusRevertStatusResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const UserStatusRevertStatusResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusRevertStatusResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusRevertStatusResponseApplicationJson_Ocs_Data> get serializer =>
      _$UserStatusRevertStatusResponseApplicationJson_Ocs_DataSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._private, b._builtListJsonObject].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'private', 'builtListJsonObject' for ${b._data}");
    }
  }
}

class _$UserStatusRevertStatusResponseApplicationJson_Ocs_DataSerializer
    implements PrimitiveSerializer<UserStatusRevertStatusResponseApplicationJson_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    UserStatusRevertStatusResponseApplicationJson_Ocs_Data,
    _$UserStatusRevertStatusResponseApplicationJson_Ocs_Data,
  ];

  @override
  final String wireName = 'UserStatusRevertStatusResponseApplicationJson_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final UserStatusRevertStatusResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UserStatusRevertStatusResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusRevertStatusResponseApplicationJson_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(Private))! as Private;
      result.private.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>;
      result.builtListJsonObject.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusRevertStatusResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UserStatusRevertStatusResponseApplicationJson_Ocs_Data get data;
}

abstract class UserStatusRevertStatusResponseApplicationJson_Ocs
    implements
        UserStatusRevertStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusRevertStatusResponseApplicationJson_Ocs,
            UserStatusRevertStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusRevertStatusResponseApplicationJson_Ocs([
    final void Function(UserStatusRevertStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusRevertStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusRevertStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusRevertStatusResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusRevertStatusResponseApplicationJson_Ocs> get serializer =>
      const _$UserStatusRevertStatusResponseApplicationJson_OcsSerializer();
}

class _$UserStatusRevertStatusResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UserStatusRevertStatusResponseApplicationJson_Ocs> {
  const _$UserStatusRevertStatusResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusRevertStatusResponseApplicationJson_Ocs, _$UserStatusRevertStatusResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UserStatusRevertStatusResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusRevertStatusResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(UserStatusRevertStatusResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  UserStatusRevertStatusResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusRevertStatusResponseApplicationJson_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UserStatusRevertStatusResponseApplicationJson_Ocs_Data),
            )! as UserStatusRevertStatusResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusRevertStatusResponseApplicationJsonInterface {
  UserStatusRevertStatusResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusRevertStatusResponseApplicationJson
    implements
        UserStatusRevertStatusResponseApplicationJsonInterface,
        Built<UserStatusRevertStatusResponseApplicationJson, UserStatusRevertStatusResponseApplicationJsonBuilder> {
  factory UserStatusRevertStatusResponseApplicationJson([
    final void Function(UserStatusRevertStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusRevertStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusRevertStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusRevertStatusResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusRevertStatusResponseApplicationJson> get serializer =>
      const _$UserStatusRevertStatusResponseApplicationJsonSerializer();
}

class _$UserStatusRevertStatusResponseApplicationJsonSerializer
    implements StructuredSerializer<UserStatusRevertStatusResponseApplicationJson> {
  const _$UserStatusRevertStatusResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UserStatusRevertStatusResponseApplicationJson, _$UserStatusRevertStatusResponseApplicationJson];

  @override
  String get wireName => 'UserStatusRevertStatusResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusRevertStatusResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UserStatusRevertStatusResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UserStatusRevertStatusResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusRevertStatusResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(UserStatusRevertStatusResponseApplicationJson_Ocs),
            )! as UserStatusRevertStatusResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_UserStatusInterface {
  bool get enabled;
  bool get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
}

abstract class Capabilities_UserStatus
    implements Capabilities_UserStatusInterface, Built<Capabilities_UserStatus, Capabilities_UserStatusBuilder> {
  factory Capabilities_UserStatus([final void Function(Capabilities_UserStatusBuilder)? b]) = _$Capabilities_UserStatus;

  // coverage:ignore-start
  const Capabilities_UserStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_UserStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_UserStatus> get serializer => const _$Capabilities_UserStatusSerializer();
}

class _$Capabilities_UserStatusSerializer implements StructuredSerializer<Capabilities_UserStatus> {
  const _$Capabilities_UserStatusSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_UserStatus, _$Capabilities_UserStatus];

  @override
  String get wireName => 'Capabilities_UserStatus';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_UserStatus object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'restore',
      serializers.serialize(object.restore, specifiedType: const FullType(bool)),
      'supports_emoji',
      serializers.serialize(object.supportsEmoji, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_UserStatus deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_UserStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'restore':
          result.restore = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'supports_emoji':
          result.supportsEmoji = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  @BuiltValueField(wireName: 'user_status')
  Capabilities_UserStatus get userStatus;
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities> get serializer => const _$CapabilitiesSerializer();
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  const _$CapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities, _$Capabilities];

  @override
  String get wireName => 'Capabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'user_status',
      serializers.serialize(object.userStatus, specifiedType: const FullType(Capabilities_UserStatus)),
    ];
    return result;
  }

  @override
  Capabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'user_status':
          result.userStatus.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_UserStatus))!
                as Capabilities_UserStatus,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(HeartbeatHeartbeatResponseApplicationJson),
        HeartbeatHeartbeatResponseApplicationJson.new,
      )
      ..add(HeartbeatHeartbeatResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(HeartbeatHeartbeatResponseApplicationJson_Ocs),
        HeartbeatHeartbeatResponseApplicationJson_Ocs.new,
      )
      ..add(HeartbeatHeartbeatResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(Private), Private.new)
      ..add(Private.serializer)
      ..addBuilderFactory(const FullType(Public), Public.new)
      ..add(Public.serializer)
      ..addBuilderFactory(
        const FullType(PredefinedStatusFindAllResponseApplicationJson),
        PredefinedStatusFindAllResponseApplicationJson.new,
      )
      ..add(PredefinedStatusFindAllResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PredefinedStatusFindAllResponseApplicationJson_Ocs),
        PredefinedStatusFindAllResponseApplicationJson_Ocs.new,
      )
      ..add(PredefinedStatusFindAllResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Predefined), Predefined.new)
      ..add(Predefined.serializer)
      ..addBuilderFactory(const FullType(ClearAt), ClearAt.new)
      ..add(ClearAt.serializer)
      ..add(ClearAt_Type.serializer)
      ..addBuilderFactory(const FullType(ClearAt_Time), ClearAt_Time.new)
      ..add(ClearAt_Time.serializer)
      ..add(ClearAtTimeType.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Predefined)]), ListBuilder<Predefined>.new)
      ..addBuilderFactory(
        const FullType(StatusesFindAllResponseApplicationJson),
        StatusesFindAllResponseApplicationJson.new,
      )
      ..add(StatusesFindAllResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(StatusesFindAllResponseApplicationJson_Ocs),
        StatusesFindAllResponseApplicationJson_Ocs.new,
      )
      ..add(StatusesFindAllResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Public)]), ListBuilder<Public>.new)
      ..addBuilderFactory(const FullType(StatusesFindResponseApplicationJson), StatusesFindResponseApplicationJson.new)
      ..add(StatusesFindResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(StatusesFindResponseApplicationJson_Ocs),
        StatusesFindResponseApplicationJson_Ocs.new,
      )
      ..add(StatusesFindResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusGetStatusResponseApplicationJson),
        UserStatusGetStatusResponseApplicationJson.new,
      )
      ..add(UserStatusGetStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusGetStatusResponseApplicationJson_Ocs),
        UserStatusGetStatusResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusGetStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetStatusResponseApplicationJson),
        UserStatusSetStatusResponseApplicationJson.new,
      )
      ..add(UserStatusSetStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetStatusResponseApplicationJson_Ocs),
        UserStatusSetStatusResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusSetStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetPredefinedMessageResponseApplicationJson),
        UserStatusSetPredefinedMessageResponseApplicationJson.new,
      )
      ..add(UserStatusSetPredefinedMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetPredefinedMessageResponseApplicationJson_Ocs),
        UserStatusSetPredefinedMessageResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusSetPredefinedMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetCustomMessageResponseApplicationJson),
        UserStatusSetCustomMessageResponseApplicationJson.new,
      )
      ..add(UserStatusSetCustomMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetCustomMessageResponseApplicationJson_Ocs),
        UserStatusSetCustomMessageResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusSetCustomMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusClearMessageResponseApplicationJson),
        UserStatusClearMessageResponseApplicationJson.new,
      )
      ..add(UserStatusClearMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusClearMessageResponseApplicationJson_Ocs),
        UserStatusClearMessageResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusClearMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusRevertStatusResponseApplicationJson),
        UserStatusRevertStatusResponseApplicationJson.new,
      )
      ..add(UserStatusRevertStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusRevertStatusResponseApplicationJson_Ocs),
        UserStatusRevertStatusResponseApplicationJson_Ocs.new,
      )
      ..add(UserStatusRevertStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusRevertStatusResponseApplicationJson_Ocs_Data),
        UserStatusRevertStatusResponseApplicationJson_Ocs_Data.new,
      )
      ..add(UserStatusRevertStatusResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_UserStatus), Capabilities_UserStatus.new)
      ..add(Capabilities_UserStatus.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
