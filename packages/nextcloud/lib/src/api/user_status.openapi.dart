// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers

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

  Client.fromClient(DynamiteClient client)
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
    required String status,
    bool? oCSAPIRequest,
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
    required String status,
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
    final $status = jsonSerializers.serialize(status, specifiedType: const FullType(String));
    _parameters['status'] = $status;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/user_status/api/v1/heartbeat{?status*}').expand(_parameters);
    return DynamiteRawResponse<HeartbeatHeartbeatResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(HeartbeatHeartbeatResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<PredefinedStatusFindAllResponseApplicationJson, void>> findAll({bool? oCSAPIRequest}) async {
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
  DynamiteRawResponse<PredefinedStatusFindAllResponseApplicationJson, void> findAllRaw({bool? oCSAPIRequest}) {
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

    const _path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
    return DynamiteRawResponse<PredefinedStatusFindAllResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(PredefinedStatusFindAllResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    int? limit,
    int? offset,
    bool? oCSAPIRequest,
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
    int? limit,
    int? offset,
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
    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    _parameters['limit'] = $limit;

    final $offset = jsonSerializers.serialize(offset, specifiedType: const FullType(int));
    _parameters['offset'] = $offset;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/user_status/api/v1/statuses{?limit*,offset*}').expand(_parameters);
    return DynamiteRawResponse<StatusesFindAllResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(StatusesFindAllResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String userId,
    bool? oCSAPIRequest,
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
    required String userId,
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
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    _parameters['userId'] = $userId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/user_status/api/v1/statuses/{userId}').expand(_parameters);
    return DynamiteRawResponse<StatusesFindResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(StatusesFindResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<UserStatusGetStatusResponseApplicationJson, void>> getStatus({bool? oCSAPIRequest}) async {
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
  DynamiteRawResponse<UserStatusGetStatusResponseApplicationJson, void> getStatusRaw({bool? oCSAPIRequest}) {
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

    const _path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
    return DynamiteRawResponse<UserStatusGetStatusResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserStatusGetStatusResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String statusType,
    bool? oCSAPIRequest,
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
    required String statusType,
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
    final $statusType = jsonSerializers.serialize(statusType, specifiedType: const FullType(String));
    _parameters['statusType'] = $statusType;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/user_status/api/v1/user_status/status{?statusType*}').expand(_parameters);
    return DynamiteRawResponse<UserStatusSetStatusResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserStatusSetStatusResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String messageId,
    int? clearAt,
    bool? oCSAPIRequest,
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
    required String messageId,
    int? clearAt,
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
    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(String));
    _parameters['messageId'] = $messageId;

    final $clearAt = jsonSerializers.serialize(clearAt, specifiedType: const FullType(int));
    _parameters['clearAt'] = $clearAt;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined{?messageId*,clearAt*}')
            .expand(_parameters);
    return DynamiteRawResponse<UserStatusSetPredefinedMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserStatusSetPredefinedMessageResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    String? statusIcon,
    String? message,
    int? clearAt,
    bool? oCSAPIRequest,
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
    String? statusIcon,
    String? message,
    int? clearAt,
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
    final $statusIcon = jsonSerializers.serialize(statusIcon, specifiedType: const FullType(String));
    _parameters['statusIcon'] = $statusIcon;

    final $message = jsonSerializers.serialize(message, specifiedType: const FullType(String));
    _parameters['message'] = $message;

    final $clearAt = jsonSerializers.serialize(clearAt, specifiedType: const FullType(int));
    _parameters['clearAt'] = $clearAt;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path =
        UriTemplate('/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom{?statusIcon*,message*,clearAt*}')
            .expand(_parameters);
    return DynamiteRawResponse<UserStatusSetCustomMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserStatusSetCustomMessageResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    bool? oCSAPIRequest,
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
  DynamiteRawResponse<UserStatusClearMessageResponseApplicationJson, void> clearMessageRaw({bool? oCSAPIRequest}) {
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

    const _path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
    return DynamiteRawResponse<UserStatusClearMessageResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserStatusClearMessageResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String messageId,
    bool? oCSAPIRequest,
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
    required String messageId,
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
    final $messageId = jsonSerializers.serialize(messageId, specifiedType: const FullType(String));
    _parameters['messageId'] = $messageId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final _path = UriTemplate('/ocs/v2.php/apps/user_status/api/v1/user_status/revert/{messageId}').expand(_parameters);
    return DynamiteRawResponse<UserStatusRevertStatusResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UserStatusRevertStatusResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
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
abstract interface class $PublicInterface {
  String get userId;
  String? get message;
  String? get icon;
  int? get clearAt;
  String get status;
}

abstract class Public implements $PublicInterface, Built<Public, PublicBuilder> {
  factory Public([void Function(PublicBuilder)? b]) = _$Public;

  // coverage:ignore-start
  const Public._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Public.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Public> get serializer => _$publicSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Private_1Interface {
  String? get messageId;
  bool get messageIsPredefined;
  bool get statusIsUserDefined;
}

@BuiltValue(instantiable: false)
abstract interface class $PrivateInterface implements $PublicInterface, $Private_1Interface {}

abstract class Private implements $PrivateInterface, Built<Private, PrivateBuilder> {
  factory Private([void Function(PrivateBuilder)? b]) = _$Private;

  // coverage:ignore-start
  const Private._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Private.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Private> get serializer => _$privateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HeartbeatHeartbeatResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class HeartbeatHeartbeatResponseApplicationJson_Ocs
    implements
        $HeartbeatHeartbeatResponseApplicationJson_OcsInterface,
        Built<HeartbeatHeartbeatResponseApplicationJson_Ocs, HeartbeatHeartbeatResponseApplicationJson_OcsBuilder> {
  factory HeartbeatHeartbeatResponseApplicationJson_Ocs([
    void Function(HeartbeatHeartbeatResponseApplicationJson_OcsBuilder)? b,
  ]) = _$HeartbeatHeartbeatResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const HeartbeatHeartbeatResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HeartbeatHeartbeatResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HeartbeatHeartbeatResponseApplicationJson_Ocs> get serializer =>
      _$heartbeatHeartbeatResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HeartbeatHeartbeatResponseApplicationJsonInterface {
  HeartbeatHeartbeatResponseApplicationJson_Ocs get ocs;
}

abstract class HeartbeatHeartbeatResponseApplicationJson
    implements
        $HeartbeatHeartbeatResponseApplicationJsonInterface,
        Built<HeartbeatHeartbeatResponseApplicationJson, HeartbeatHeartbeatResponseApplicationJsonBuilder> {
  factory HeartbeatHeartbeatResponseApplicationJson([
    void Function(HeartbeatHeartbeatResponseApplicationJsonBuilder)? b,
  ]) = _$HeartbeatHeartbeatResponseApplicationJson;

  // coverage:ignore-start
  const HeartbeatHeartbeatResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HeartbeatHeartbeatResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HeartbeatHeartbeatResponseApplicationJson> get serializer =>
      _$heartbeatHeartbeatResponseApplicationJsonSerializer;
}

class ClearAt_Type extends EnumClass {
  const ClearAt_Type._(super.name);

  static const ClearAt_Type period = _$clearAtTypePeriod;

  @BuiltValueEnumConst(wireName: 'end-of')
  static const ClearAt_Type endOf = _$clearAtTypeEndOf;

  // coverage:ignore-start
  static BuiltSet<ClearAt_Type> get values => _$clearAtTypeValues;
  // coverage:ignore-end

  static ClearAt_Type valueOf(String name) => _$valueOfClearAt_Type(name);

  static Serializer<ClearAt_Type> get serializer => _$clearAtTypeSerializer;
}

class ClearAtTimeType extends EnumClass {
  const ClearAtTimeType._(super.name);

  static const ClearAtTimeType day = _$clearAtTimeTypeDay;

  static const ClearAtTimeType week = _$clearAtTimeTypeWeek;

  // coverage:ignore-start
  static BuiltSet<ClearAtTimeType> get values => _$clearAtTimeTypeValues;
  // coverage:ignore-end

  static ClearAtTimeType valueOf(String name) => _$valueOfClearAtTimeType(name);

  static Serializer<ClearAtTimeType> get serializer => _$clearAtTimeTypeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ClearAtInterface {
  ClearAt_Type get type;
  ClearAt_Time get time;
}

abstract class ClearAt implements $ClearAtInterface, Built<ClearAt, ClearAtBuilder> {
  factory ClearAt([void Function(ClearAtBuilder)? b]) = _$ClearAt;

  // coverage:ignore-start
  const ClearAt._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ClearAt.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ClearAt> get serializer => _$clearAtSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ClearAtBuilder b) {
    b.time?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $PredefinedInterface {
  String get id;
  String get icon;
  String get message;
  ClearAt? get clearAt;
  bool? get visible;
}

abstract class Predefined implements $PredefinedInterface, Built<Predefined, PredefinedBuilder> {
  factory Predefined([void Function(PredefinedBuilder)? b]) = _$Predefined;

  // coverage:ignore-start
  const Predefined._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Predefined.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Predefined> get serializer => _$predefinedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PredefinedStatusFindAllResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Predefined> get data;
}

abstract class PredefinedStatusFindAllResponseApplicationJson_Ocs
    implements
        $PredefinedStatusFindAllResponseApplicationJson_OcsInterface,
        Built<PredefinedStatusFindAllResponseApplicationJson_Ocs,
            PredefinedStatusFindAllResponseApplicationJson_OcsBuilder> {
  factory PredefinedStatusFindAllResponseApplicationJson_Ocs([
    void Function(PredefinedStatusFindAllResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PredefinedStatusFindAllResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PredefinedStatusFindAllResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PredefinedStatusFindAllResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PredefinedStatusFindAllResponseApplicationJson_Ocs> get serializer =>
      _$predefinedStatusFindAllResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PredefinedStatusFindAllResponseApplicationJsonInterface {
  PredefinedStatusFindAllResponseApplicationJson_Ocs get ocs;
}

abstract class PredefinedStatusFindAllResponseApplicationJson
    implements
        $PredefinedStatusFindAllResponseApplicationJsonInterface,
        Built<PredefinedStatusFindAllResponseApplicationJson, PredefinedStatusFindAllResponseApplicationJsonBuilder> {
  factory PredefinedStatusFindAllResponseApplicationJson([
    void Function(PredefinedStatusFindAllResponseApplicationJsonBuilder)? b,
  ]) = _$PredefinedStatusFindAllResponseApplicationJson;

  // coverage:ignore-start
  const PredefinedStatusFindAllResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PredefinedStatusFindAllResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PredefinedStatusFindAllResponseApplicationJson> get serializer =>
      _$predefinedStatusFindAllResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $StatusesFindAllResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Public> get data;
}

abstract class StatusesFindAllResponseApplicationJson_Ocs
    implements
        $StatusesFindAllResponseApplicationJson_OcsInterface,
        Built<StatusesFindAllResponseApplicationJson_Ocs, StatusesFindAllResponseApplicationJson_OcsBuilder> {
  factory StatusesFindAllResponseApplicationJson_Ocs([
    void Function(StatusesFindAllResponseApplicationJson_OcsBuilder)? b,
  ]) = _$StatusesFindAllResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const StatusesFindAllResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindAllResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<StatusesFindAllResponseApplicationJson_Ocs> get serializer =>
      _$statusesFindAllResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $StatusesFindAllResponseApplicationJsonInterface {
  StatusesFindAllResponseApplicationJson_Ocs get ocs;
}

abstract class StatusesFindAllResponseApplicationJson
    implements
        $StatusesFindAllResponseApplicationJsonInterface,
        Built<StatusesFindAllResponseApplicationJson, StatusesFindAllResponseApplicationJsonBuilder> {
  factory StatusesFindAllResponseApplicationJson([void Function(StatusesFindAllResponseApplicationJsonBuilder)? b]) =
      _$StatusesFindAllResponseApplicationJson;

  // coverage:ignore-start
  const StatusesFindAllResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindAllResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<StatusesFindAllResponseApplicationJson> get serializer =>
      _$statusesFindAllResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $StatusesFindResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Public get data;
}

abstract class StatusesFindResponseApplicationJson_Ocs
    implements
        $StatusesFindResponseApplicationJson_OcsInterface,
        Built<StatusesFindResponseApplicationJson_Ocs, StatusesFindResponseApplicationJson_OcsBuilder> {
  factory StatusesFindResponseApplicationJson_Ocs([void Function(StatusesFindResponseApplicationJson_OcsBuilder)? b]) =
      _$StatusesFindResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const StatusesFindResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<StatusesFindResponseApplicationJson_Ocs> get serializer =>
      _$statusesFindResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $StatusesFindResponseApplicationJsonInterface {
  StatusesFindResponseApplicationJson_Ocs get ocs;
}

abstract class StatusesFindResponseApplicationJson
    implements
        $StatusesFindResponseApplicationJsonInterface,
        Built<StatusesFindResponseApplicationJson, StatusesFindResponseApplicationJsonBuilder> {
  factory StatusesFindResponseApplicationJson([void Function(StatusesFindResponseApplicationJsonBuilder)? b]) =
      _$StatusesFindResponseApplicationJson;

  // coverage:ignore-start
  const StatusesFindResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory StatusesFindResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<StatusesFindResponseApplicationJson> get serializer =>
      _$statusesFindResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusGetStatusResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusGetStatusResponseApplicationJson_Ocs
    implements
        $UserStatusGetStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusGetStatusResponseApplicationJson_Ocs, UserStatusGetStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusGetStatusResponseApplicationJson_Ocs([
    void Function(UserStatusGetStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusGetStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusGetStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusGetStatusResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusGetStatusResponseApplicationJson_Ocs> get serializer =>
      _$userStatusGetStatusResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusGetStatusResponseApplicationJsonInterface {
  UserStatusGetStatusResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusGetStatusResponseApplicationJson
    implements
        $UserStatusGetStatusResponseApplicationJsonInterface,
        Built<UserStatusGetStatusResponseApplicationJson, UserStatusGetStatusResponseApplicationJsonBuilder> {
  factory UserStatusGetStatusResponseApplicationJson([
    void Function(UserStatusGetStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusGetStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusGetStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusGetStatusResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusGetStatusResponseApplicationJson> get serializer =>
      _$userStatusGetStatusResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusSetStatusResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusSetStatusResponseApplicationJson_Ocs
    implements
        $UserStatusSetStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusSetStatusResponseApplicationJson_Ocs, UserStatusSetStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusSetStatusResponseApplicationJson_Ocs([
    void Function(UserStatusSetStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusSetStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusSetStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetStatusResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusSetStatusResponseApplicationJson_Ocs> get serializer =>
      _$userStatusSetStatusResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusSetStatusResponseApplicationJsonInterface {
  UserStatusSetStatusResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusSetStatusResponseApplicationJson
    implements
        $UserStatusSetStatusResponseApplicationJsonInterface,
        Built<UserStatusSetStatusResponseApplicationJson, UserStatusSetStatusResponseApplicationJsonBuilder> {
  factory UserStatusSetStatusResponseApplicationJson([
    void Function(UserStatusSetStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusSetStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusSetStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetStatusResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusSetStatusResponseApplicationJson> get serializer =>
      _$userStatusSetStatusResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusSetPredefinedMessageResponseApplicationJson_Ocs
    implements
        $UserStatusSetPredefinedMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusSetPredefinedMessageResponseApplicationJson_Ocs,
            UserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusSetPredefinedMessageResponseApplicationJson_Ocs([
    void Function(UserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusSetPredefinedMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusSetPredefinedMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetPredefinedMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusSetPredefinedMessageResponseApplicationJson_Ocs> get serializer =>
      _$userStatusSetPredefinedMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusSetPredefinedMessageResponseApplicationJsonInterface {
  UserStatusSetPredefinedMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusSetPredefinedMessageResponseApplicationJson
    implements
        $UserStatusSetPredefinedMessageResponseApplicationJsonInterface,
        Built<UserStatusSetPredefinedMessageResponseApplicationJson,
            UserStatusSetPredefinedMessageResponseApplicationJsonBuilder> {
  factory UserStatusSetPredefinedMessageResponseApplicationJson([
    void Function(UserStatusSetPredefinedMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusSetPredefinedMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusSetPredefinedMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetPredefinedMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusSetPredefinedMessageResponseApplicationJson> get serializer =>
      _$userStatusSetPredefinedMessageResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusSetCustomMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Private get data;
}

abstract class UserStatusSetCustomMessageResponseApplicationJson_Ocs
    implements
        $UserStatusSetCustomMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusSetCustomMessageResponseApplicationJson_Ocs,
            UserStatusSetCustomMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusSetCustomMessageResponseApplicationJson_Ocs([
    void Function(UserStatusSetCustomMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusSetCustomMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusSetCustomMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetCustomMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusSetCustomMessageResponseApplicationJson_Ocs> get serializer =>
      _$userStatusSetCustomMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusSetCustomMessageResponseApplicationJsonInterface {
  UserStatusSetCustomMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusSetCustomMessageResponseApplicationJson
    implements
        $UserStatusSetCustomMessageResponseApplicationJsonInterface,
        Built<UserStatusSetCustomMessageResponseApplicationJson,
            UserStatusSetCustomMessageResponseApplicationJsonBuilder> {
  factory UserStatusSetCustomMessageResponseApplicationJson([
    void Function(UserStatusSetCustomMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusSetCustomMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusSetCustomMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusSetCustomMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusSetCustomMessageResponseApplicationJson> get serializer =>
      _$userStatusSetCustomMessageResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusClearMessageResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class UserStatusClearMessageResponseApplicationJson_Ocs
    implements
        $UserStatusClearMessageResponseApplicationJson_OcsInterface,
        Built<UserStatusClearMessageResponseApplicationJson_Ocs,
            UserStatusClearMessageResponseApplicationJson_OcsBuilder> {
  factory UserStatusClearMessageResponseApplicationJson_Ocs([
    void Function(UserStatusClearMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusClearMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusClearMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusClearMessageResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusClearMessageResponseApplicationJson_Ocs> get serializer =>
      _$userStatusClearMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusClearMessageResponseApplicationJsonInterface {
  UserStatusClearMessageResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusClearMessageResponseApplicationJson
    implements
        $UserStatusClearMessageResponseApplicationJsonInterface,
        Built<UserStatusClearMessageResponseApplicationJson, UserStatusClearMessageResponseApplicationJsonBuilder> {
  factory UserStatusClearMessageResponseApplicationJson([
    void Function(UserStatusClearMessageResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusClearMessageResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusClearMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusClearMessageResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusClearMessageResponseApplicationJson> get serializer =>
      _$userStatusClearMessageResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusRevertStatusResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UserStatusRevertStatusResponseApplicationJson_Ocs_Data get data;
}

abstract class UserStatusRevertStatusResponseApplicationJson_Ocs
    implements
        $UserStatusRevertStatusResponseApplicationJson_OcsInterface,
        Built<UserStatusRevertStatusResponseApplicationJson_Ocs,
            UserStatusRevertStatusResponseApplicationJson_OcsBuilder> {
  factory UserStatusRevertStatusResponseApplicationJson_Ocs([
    void Function(UserStatusRevertStatusResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UserStatusRevertStatusResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UserStatusRevertStatusResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusRevertStatusResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusRevertStatusResponseApplicationJson_Ocs> get serializer =>
      _$userStatusRevertStatusResponseApplicationJsonOcsSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(UserStatusRevertStatusResponseApplicationJson_OcsBuilder b) {
    b.data?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusRevertStatusResponseApplicationJsonInterface {
  UserStatusRevertStatusResponseApplicationJson_Ocs get ocs;
}

abstract class UserStatusRevertStatusResponseApplicationJson
    implements
        $UserStatusRevertStatusResponseApplicationJsonInterface,
        Built<UserStatusRevertStatusResponseApplicationJson, UserStatusRevertStatusResponseApplicationJsonBuilder> {
  factory UserStatusRevertStatusResponseApplicationJson([
    void Function(UserStatusRevertStatusResponseApplicationJsonBuilder)? b,
  ]) = _$UserStatusRevertStatusResponseApplicationJson;

  // coverage:ignore-start
  const UserStatusRevertStatusResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusRevertStatusResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusRevertStatusResponseApplicationJson> get serializer =>
      _$userStatusRevertStatusResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_UserStatusInterface {
  bool get enabled;
  bool? get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
}

abstract class Capabilities_UserStatus
    implements $Capabilities_UserStatusInterface, Built<Capabilities_UserStatus, Capabilities_UserStatusBuilder> {
  factory Capabilities_UserStatus([void Function(Capabilities_UserStatusBuilder)? b]) = _$Capabilities_UserStatus;

  // coverage:ignore-start
  const Capabilities_UserStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_UserStatus.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_UserStatus> get serializer => _$capabilitiesUserStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CapabilitiesInterface {
  @BuiltValueField(wireName: 'user_status')
  Capabilities_UserStatus get userStatus;
}

abstract class Capabilities implements $CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
}

typedef ClearAt_Time = ({ClearAtTimeType? clearAtTimeType, int? $int});

typedef UserStatusRevertStatusResponseApplicationJson_Ocs_Data = ({BuiltList<Never>? builtListNever, Private? private});

typedef $ClearAtTimeTypeInt = ({ClearAtTimeType? clearAtTimeType, int? $int});

extension $ClearAtTimeTypeIntExtension on $ClearAtTimeTypeInt {
  List<dynamic> get _values => [clearAtTimeType, $int];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$ClearAtTimeTypeInt> get serializer => const _$ClearAtTimeTypeIntSerializer();
  static $ClearAtTimeTypeInt fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$ClearAtTimeTypeIntSerializer implements PrimitiveSerializer<$ClearAtTimeTypeInt> {
  const _$ClearAtTimeTypeIntSerializer();

  @override
  Iterable<Type> get types => const [$ClearAtTimeTypeInt];

  @override
  String get wireName => r'$ClearAtTimeTypeInt';

  @override
  Object serialize(
    Serializers serializers,
    $ClearAtTimeTypeInt object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.clearAtTimeType;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ClearAtTimeType))!;
    }
    value = object.$int;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(int))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $ClearAtTimeTypeInt deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    ClearAtTimeType? clearAtTimeType;
    try {
      clearAtTimeType =
          serializers.deserialize(data, specifiedType: const FullType(ClearAtTimeType))! as ClearAtTimeType;
    } catch (_) {}
    int? $int;
    try {
      $int = serializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    return (clearAtTimeType: clearAtTimeType, $int: $int);
  }
}

typedef $BuiltListPrivate = ({BuiltList<Never>? builtListNever, Private? private});

extension $BuiltListPrivateExtension on $BuiltListPrivate {
  List<dynamic> get _values => [builtListNever, private];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListPrivate> get serializer => const _$BuiltListPrivateSerializer();
  static $BuiltListPrivate fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListPrivateSerializer implements PrimitiveSerializer<$BuiltListPrivate> {
  const _$BuiltListPrivateSerializer();

  @override
  Iterable<Type> get types => const [$BuiltListPrivate];

  @override
  String get wireName => r'$BuiltListPrivate';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListNever;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)]))!;
    }
    value = object.private;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(Private))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListPrivate deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<Never>? builtListNever;
    try {
      builtListNever = serializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(Never)]))!
          as BuiltList<Never>;
    } catch (_) {}
    Private? private;
    try {
      private = serializers.deserialize(data, specifiedType: const FullType(Private))! as Private;
    } catch (_) {}
    return (builtListNever: builtListNever, private: private);
  }
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(HeartbeatHeartbeatResponseApplicationJson),
        HeartbeatHeartbeatResponseApplicationJsonBuilder.new,
      )
      ..add(HeartbeatHeartbeatResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(HeartbeatHeartbeatResponseApplicationJson_Ocs),
        HeartbeatHeartbeatResponseApplicationJson_OcsBuilder.new,
      )
      ..add(HeartbeatHeartbeatResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(Private), PrivateBuilder.new)
      ..add(Private.serializer)
      ..addBuilderFactory(const FullType(Public), PublicBuilder.new)
      ..add(Public.serializer)
      ..addBuilderFactory(
        const FullType(PredefinedStatusFindAllResponseApplicationJson),
        PredefinedStatusFindAllResponseApplicationJsonBuilder.new,
      )
      ..add(PredefinedStatusFindAllResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PredefinedStatusFindAllResponseApplicationJson_Ocs),
        PredefinedStatusFindAllResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PredefinedStatusFindAllResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Predefined), PredefinedBuilder.new)
      ..add(Predefined.serializer)
      ..addBuilderFactory(const FullType(ClearAt), ClearAtBuilder.new)
      ..add(ClearAt.serializer)
      ..add(ClearAt_Type.serializer)
      ..add(ClearAtTimeType.serializer)
      ..add($ClearAtTimeTypeIntExtension.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Predefined)]), ListBuilder<Predefined>.new)
      ..addBuilderFactory(
        const FullType(StatusesFindAllResponseApplicationJson),
        StatusesFindAllResponseApplicationJsonBuilder.new,
      )
      ..add(StatusesFindAllResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(StatusesFindAllResponseApplicationJson_Ocs),
        StatusesFindAllResponseApplicationJson_OcsBuilder.new,
      )
      ..add(StatusesFindAllResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Public)]), ListBuilder<Public>.new)
      ..addBuilderFactory(
        const FullType(StatusesFindResponseApplicationJson),
        StatusesFindResponseApplicationJsonBuilder.new,
      )
      ..add(StatusesFindResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(StatusesFindResponseApplicationJson_Ocs),
        StatusesFindResponseApplicationJson_OcsBuilder.new,
      )
      ..add(StatusesFindResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusGetStatusResponseApplicationJson),
        UserStatusGetStatusResponseApplicationJsonBuilder.new,
      )
      ..add(UserStatusGetStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusGetStatusResponseApplicationJson_Ocs),
        UserStatusGetStatusResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserStatusGetStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetStatusResponseApplicationJson),
        UserStatusSetStatusResponseApplicationJsonBuilder.new,
      )
      ..add(UserStatusSetStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetStatusResponseApplicationJson_Ocs),
        UserStatusSetStatusResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserStatusSetStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetPredefinedMessageResponseApplicationJson),
        UserStatusSetPredefinedMessageResponseApplicationJsonBuilder.new,
      )
      ..add(UserStatusSetPredefinedMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetPredefinedMessageResponseApplicationJson_Ocs),
        UserStatusSetPredefinedMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserStatusSetPredefinedMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetCustomMessageResponseApplicationJson),
        UserStatusSetCustomMessageResponseApplicationJsonBuilder.new,
      )
      ..add(UserStatusSetCustomMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusSetCustomMessageResponseApplicationJson_Ocs),
        UserStatusSetCustomMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserStatusSetCustomMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusClearMessageResponseApplicationJson),
        UserStatusClearMessageResponseApplicationJsonBuilder.new,
      )
      ..add(UserStatusClearMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusClearMessageResponseApplicationJson_Ocs),
        UserStatusClearMessageResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserStatusClearMessageResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusRevertStatusResponseApplicationJson),
        UserStatusRevertStatusResponseApplicationJsonBuilder.new,
      )
      ..add(UserStatusRevertStatusResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusRevertStatusResponseApplicationJson_Ocs),
        UserStatusRevertStatusResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UserStatusRevertStatusResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Never)]), ListBuilder<Never>.new)
      ..add($BuiltListPrivateExtension.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_UserStatus), Capabilities_UserStatusBuilder.new)
      ..add(Capabilities_UserStatus.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
