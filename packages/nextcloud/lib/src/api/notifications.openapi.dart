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
import 'package:uri/uri.dart';

part 'notifications.openapi.g.dart';

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

  ApiClient get api => ApiClient(this);

  EndpointClient get endpoint => EndpointClient(this);

  PushClient get push => PushClient(this);

  SettingsClient get settings => SettingsClient(this);
}

class ApiClient {
  ApiClient(this._rootClient);

  final Client _rootClient;

  /// Generate a notification for a user.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [shortMessage] Subject of the notification.
  ///   * [longMessage] Message of the notification. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification generated successfully
  ///   * 400: Generating notification is not possible
  ///   * 404: User not found
  ///   * 500
  ///
  /// See:
  ///  * [generateNotificationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiGenerateNotificationResponseApplicationJson, void>> generateNotification({
    required final String shortMessage,
    required final String userId,
    final String longMessage = '',
    final ApiGenerateNotificationApiVersion apiVersion = ApiGenerateNotificationApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = generateNotificationRaw(
      shortMessage: shortMessage,
      userId: userId,
      longMessage: longMessage,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Generate a notification for a user.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [shortMessage] Subject of the notification.
  ///   * [longMessage] Message of the notification. Defaults to `''`.
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification generated successfully
  ///   * 400: Generating notification is not possible
  ///   * 404: User not found
  ///   * 500
  ///
  /// See:
  ///  * [generateNotification] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiGenerateNotificationResponseApplicationJson, void> generateNotificationRaw({
    required final String shortMessage,
    required final String userId,
    final String longMessage = '',
    final ApiGenerateNotificationApiVersion apiVersion = ApiGenerateNotificationApiVersion.v2,
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
    queryParameters['shortMessage'] = shortMessage;
    pathParameters['userId'] = userId;
    if (longMessage != '') {
      queryParameters['longMessage'] = longMessage;
    }
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/admin_notifications/{userId}')
          .expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ApiGenerateNotificationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ApiGenerateNotificationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class EndpointClient {
  EndpointClient(this._rootClient);

  final Client _rootClient;

  /// Get all notifications.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Version of the API to use. Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notifications returned
  ///   * 204: No app uses notifications
  ///
  /// See:
  ///  * [listNotificationsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<EndpointListNotificationsResponseApplicationJson, EndpointEndpointListNotificationsHeaders>>
      listNotifications({
    final EndpointListNotificationsApiVersion apiVersion = EndpointListNotificationsApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = listNotificationsRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get all notifications.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Version of the API to use. Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notifications returned
  ///   * 204: No app uses notifications
  ///
  /// See:
  ///  * [listNotifications] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<EndpointListNotificationsResponseApplicationJson, EndpointEndpointListNotificationsHeaders>
      listNotificationsRaw({
    final EndpointListNotificationsApiVersion apiVersion = EndpointListNotificationsApiVersion.v2,
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
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<EndpointListNotificationsResponseApplicationJson,
        EndpointEndpointListNotificationsHeaders>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(EndpointListNotificationsResponseApplicationJson),
      headersType: const FullType(EndpointEndpointListNotificationsHeaders),
      serializers: _jsonSerializers,
    );
  }

  /// Delete all notifications.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: All notifications deleted successfully
  ///   * 403: Deleting notification for impersonated user is not allowed
  ///
  /// See:
  ///  * [deleteAllNotificationsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<EndpointDeleteAllNotificationsResponseApplicationJson, void>> deleteAllNotifications({
    final EndpointDeleteAllNotificationsApiVersion apiVersion = EndpointDeleteAllNotificationsApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteAllNotificationsRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete all notifications.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: All notifications deleted successfully
  ///   * 403: Deleting notification for impersonated user is not allowed
  ///
  /// See:
  ///  * [deleteAllNotifications] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<EndpointDeleteAllNotificationsResponseApplicationJson, void> deleteAllNotificationsRaw({
    final EndpointDeleteAllNotificationsApiVersion apiVersion = EndpointDeleteAllNotificationsApiVersion.v2,
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
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<EndpointDeleteAllNotificationsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(EndpointDeleteAllNotificationsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a notification.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Version of the API to use. Defaults to `v2`.
  ///   * [id] ID of the notification.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification returned
  ///   * 404: Notification not found
  ///
  /// See:
  ///  * [getNotificationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<EndpointGetNotificationResponseApplicationJson, void>> getNotification({
    required final int id,
    final EndpointGetNotificationApiVersion apiVersion = EndpointGetNotificationApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getNotificationRaw(
      id: id,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a notification.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Version of the API to use. Defaults to `v2`.
  ///   * [id] ID of the notification.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification returned
  ///   * 404: Notification not found
  ///
  /// See:
  ///  * [getNotification] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<EndpointGetNotificationResponseApplicationJson, void> getNotificationRaw({
    required final int id,
    final EndpointGetNotificationApiVersion apiVersion = EndpointGetNotificationApiVersion.v2,
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
    pathParameters['id'] = id.toString();
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/{id}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<EndpointGetNotificationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(EndpointGetNotificationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete a notification.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [id] ID of the notification.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification deleted successfully
  ///   * 403: Deleting notification for impersonated user is not allowed
  ///   * 404: Notification not found
  ///
  /// See:
  ///  * [deleteNotificationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<EndpointDeleteNotificationResponseApplicationJson, void>> deleteNotification({
    required final int id,
    final EndpointDeleteNotificationApiVersion apiVersion = EndpointDeleteNotificationApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteNotificationRaw(
      id: id,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a notification.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [id] ID of the notification.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Notification deleted successfully
  ///   * 403: Deleting notification for impersonated user is not allowed
  ///   * 404: Notification not found
  ///
  /// See:
  ///  * [deleteNotification] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<EndpointDeleteNotificationResponseApplicationJson, void> deleteNotificationRaw({
    required final int id,
    final EndpointDeleteNotificationApiVersion apiVersion = EndpointDeleteNotificationApiVersion.v2,
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
    pathParameters['id'] = id.toString();
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/{id}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<EndpointDeleteNotificationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(EndpointDeleteNotificationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Check if notification IDs exist.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [ids] IDs of the notifications to check.
  ///   * [apiVersion] Version of the API to use. Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Existing notification IDs returned
  ///   * 400: Too many notification IDs requested
  ///
  /// See:
  ///  * [confirmIdsForUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<EndpointConfirmIdsForUserResponseApplicationJson, void>> confirmIdsForUser({
    required final List<int> ids,
    final EndpointConfirmIdsForUserApiVersion apiVersion = EndpointConfirmIdsForUserApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = confirmIdsForUserRaw(
      ids: ids,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Check if notification IDs exist.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [ids] IDs of the notifications to check.
  ///   * [apiVersion] Version of the API to use. Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Existing notification IDs returned
  ///   * 400: Too many notification IDs requested
  ///
  /// See:
  ///  * [confirmIdsForUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<EndpointConfirmIdsForUserResponseApplicationJson, void> confirmIdsForUserRaw({
    required final List<int> ids,
    final EndpointConfirmIdsForUserApiVersion apiVersion = EndpointConfirmIdsForUserApiVersion.v2,
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
    queryParameters['ids[]'] = ids.map((final e) => e.toString());
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/exists').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<EndpointConfirmIdsForUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 400},
      ),
      bodyType: const FullType(EndpointConfirmIdsForUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class PushClient {
  PushClient(this._rootClient);

  final Client _rootClient;

  /// Register device for push notifications.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [pushTokenHash] Hash of the push token.
  ///   * [devicePublicKey] Public key of the device.
  ///   * [proxyServer] Proxy server to be used.
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Device was already registered
  ///   * 201: Device registered successfully
  ///   * 400: Registering device is not possible
  ///   * 401: Missing permissions to register device
  ///
  /// See:
  ///  * [registerDeviceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PushRegisterDeviceResponseApplicationJson, void>> registerDevice({
    required final String pushTokenHash,
    required final String devicePublicKey,
    required final String proxyServer,
    final PushRegisterDeviceApiVersion apiVersion = PushRegisterDeviceApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = registerDeviceRaw(
      pushTokenHash: pushTokenHash,
      devicePublicKey: devicePublicKey,
      proxyServer: proxyServer,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Register device for push notifications.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [pushTokenHash] Hash of the push token.
  ///   * [devicePublicKey] Public key of the device.
  ///   * [proxyServer] Proxy server to be used.
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Device was already registered
  ///   * 201: Device registered successfully
  ///   * 400: Registering device is not possible
  ///   * 401: Missing permissions to register device
  ///
  /// See:
  ///  * [registerDevice] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PushRegisterDeviceResponseApplicationJson, void> registerDeviceRaw({
    required final String pushTokenHash,
    required final String devicePublicKey,
    required final String proxyServer,
    final PushRegisterDeviceApiVersion apiVersion = PushRegisterDeviceApiVersion.v2,
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
    queryParameters['pushTokenHash'] = pushTokenHash;
    queryParameters['devicePublicKey'] = devicePublicKey;
    queryParameters['proxyServer'] = proxyServer;
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/push').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<PushRegisterDeviceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 201},
      ),
      bodyType: const FullType(PushRegisterDeviceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Remove a device from push notifications.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: No device registered
  ///   * 202: Device removed successfully
  ///   * 401: Missing permissions to remove device
  ///   * 400: Removing device is not possible
  ///
  /// See:
  ///  * [removeDeviceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<PushRemoveDeviceResponseApplicationJson, void>> removeDevice({
    final PushRemoveDeviceApiVersion apiVersion = PushRemoveDeviceApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = removeDeviceRaw(
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a device from push notifications.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: No device registered
  ///   * 202: Device removed successfully
  ///   * 401: Missing permissions to remove device
  ///   * 400: Removing device is not possible
  ///
  /// See:
  ///  * [removeDevice] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<PushRemoveDeviceResponseApplicationJson, void> removeDeviceRaw({
    final PushRemoveDeviceApiVersion apiVersion = PushRemoveDeviceApiVersion.v2,
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
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/push').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<PushRemoveDeviceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 202, 401},
      ),
      bodyType: const FullType(PushRemoveDeviceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class SettingsClient {
  SettingsClient(this._rootClient);

  final Client _rootClient;

  /// Update personal notification settings.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [batchSetting] How often E-mails about missed notifications should be sent (hourly: 1; every three hours: 2; daily: 3; weekly: 4).
  ///   * [soundNotification] Enable sound for notifications ('yes' or 'no').
  ///   * [soundTalk] Enable sound for Talk notifications ('yes' or 'no').
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Personal settings updated
  ///
  /// See:
  ///  * [personalRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SettingsPersonalResponseApplicationJson, void>> personal({
    required final int batchSetting,
    required final String soundNotification,
    required final String soundTalk,
    final SettingsPersonalApiVersion apiVersion = SettingsPersonalApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = personalRaw(
      batchSetting: batchSetting,
      soundNotification: soundNotification,
      soundTalk: soundTalk,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update personal notification settings.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [batchSetting] How often E-mails about missed notifications should be sent (hourly: 1; every three hours: 2; daily: 3; weekly: 4).
  ///   * [soundNotification] Enable sound for notifications ('yes' or 'no').
  ///   * [soundTalk] Enable sound for Talk notifications ('yes' or 'no').
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Personal settings updated
  ///
  /// See:
  ///  * [personal] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SettingsPersonalResponseApplicationJson, void> personalRaw({
    required final int batchSetting,
    required final String soundNotification,
    required final String soundTalk,
    final SettingsPersonalApiVersion apiVersion = SettingsPersonalApiVersion.v2,
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
    queryParameters['batchSetting'] = batchSetting.toString();
    queryParameters['soundNotification'] = soundNotification;
    queryParameters['soundTalk'] = soundTalk;
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/settings').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<SettingsPersonalResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(SettingsPersonalResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update default notification settings for new users.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [batchSetting] How often E-mails about missed notifications should be sent (hourly: 1; every three hours: 2; daily: 3; weekly: 4).
  ///   * [soundNotification] Enable sound for notifications ('yes' or 'no').
  ///   * [soundTalk] Enable sound for Talk notifications ('yes' or 'no').
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Admin settings updated
  ///
  /// See:
  ///  * [adminRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SettingsAdminResponseApplicationJson, void>> admin({
    required final int batchSetting,
    required final String soundNotification,
    required final String soundTalk,
    final SettingsAdminApiVersion apiVersion = SettingsAdminApiVersion.v2,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = adminRaw(
      batchSetting: batchSetting,
      soundNotification: soundNotification,
      soundTalk: soundTalk,
      apiVersion: apiVersion,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update default notification settings for new users.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [batchSetting] How often E-mails about missed notifications should be sent (hourly: 1; every three hours: 2; daily: 3; weekly: 4).
  ///   * [soundNotification] Enable sound for notifications ('yes' or 'no').
  ///   * [soundTalk] Enable sound for Talk notifications ('yes' or 'no').
  ///   * [apiVersion] Defaults to `v2`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Admin settings updated
  ///
  /// See:
  ///  * [admin] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SettingsAdminResponseApplicationJson, void> adminRaw({
    required final int batchSetting,
    required final String soundNotification,
    required final String soundTalk,
    final SettingsAdminApiVersion apiVersion = SettingsAdminApiVersion.v2,
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
    queryParameters['batchSetting'] = batchSetting.toString();
    queryParameters['soundNotification'] = soundNotification;
    queryParameters['soundTalk'] = soundTalk;
    pathParameters['apiVersion'] = apiVersion.name;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/settings/admin').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<SettingsAdminResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(SettingsAdminResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class ApiGenerateNotificationApiVersion extends EnumClass {
  const ApiGenerateNotificationApiVersion._(super.name);

  static const ApiGenerateNotificationApiVersion v1 = _$apiGenerateNotificationApiVersionV1;

  static const ApiGenerateNotificationApiVersion v2 = _$apiGenerateNotificationApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<ApiGenerateNotificationApiVersion> get values => _$apiGenerateNotificationApiVersionValues;
  // coverage:ignore-end

  static ApiGenerateNotificationApiVersion valueOf(final String name) =>
      _$valueOfApiGenerateNotificationApiVersion(name);

  static Serializer<ApiGenerateNotificationApiVersion> get serializer => _$apiGenerateNotificationApiVersionSerializer;
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
abstract interface class ApiGenerateNotificationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ApiGenerateNotificationResponseApplicationJson_Ocs
    implements
        ApiGenerateNotificationResponseApplicationJson_OcsInterface,
        Built<ApiGenerateNotificationResponseApplicationJson_Ocs,
            ApiGenerateNotificationResponseApplicationJson_OcsBuilder> {
  factory ApiGenerateNotificationResponseApplicationJson_Ocs([
    final void Function(ApiGenerateNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ApiGenerateNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGenerateNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGenerateNotificationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGenerateNotificationResponseApplicationJson_Ocs> get serializer =>
      const _$ApiGenerateNotificationResponseApplicationJson_OcsSerializer();
}

class _$ApiGenerateNotificationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ApiGenerateNotificationResponseApplicationJson_Ocs> {
  const _$ApiGenerateNotificationResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ApiGenerateNotificationResponseApplicationJson_Ocs, _$ApiGenerateNotificationResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ApiGenerateNotificationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGenerateNotificationResponseApplicationJson_Ocs object, {
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
  ApiGenerateNotificationResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGenerateNotificationResponseApplicationJson_OcsBuilder();

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
abstract interface class ApiGenerateNotificationResponseApplicationJsonInterface {
  ApiGenerateNotificationResponseApplicationJson_Ocs get ocs;
}

abstract class ApiGenerateNotificationResponseApplicationJson
    implements
        ApiGenerateNotificationResponseApplicationJsonInterface,
        Built<ApiGenerateNotificationResponseApplicationJson, ApiGenerateNotificationResponseApplicationJsonBuilder> {
  factory ApiGenerateNotificationResponseApplicationJson([
    final void Function(ApiGenerateNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$ApiGenerateNotificationResponseApplicationJson;

  // coverage:ignore-start
  const ApiGenerateNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGenerateNotificationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiGenerateNotificationResponseApplicationJson> get serializer =>
      const _$ApiGenerateNotificationResponseApplicationJsonSerializer();
}

class _$ApiGenerateNotificationResponseApplicationJsonSerializer
    implements StructuredSerializer<ApiGenerateNotificationResponseApplicationJson> {
  const _$ApiGenerateNotificationResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ApiGenerateNotificationResponseApplicationJson, _$ApiGenerateNotificationResponseApplicationJson];

  @override
  String get wireName => 'ApiGenerateNotificationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ApiGenerateNotificationResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ApiGenerateNotificationResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ApiGenerateNotificationResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiGenerateNotificationResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ApiGenerateNotificationResponseApplicationJson_Ocs),
            )! as ApiGenerateNotificationResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class EndpointListNotificationsApiVersion extends EnumClass {
  const EndpointListNotificationsApiVersion._(super.name);

  static const EndpointListNotificationsApiVersion v1 = _$endpointListNotificationsApiVersionV1;

  static const EndpointListNotificationsApiVersion v2 = _$endpointListNotificationsApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<EndpointListNotificationsApiVersion> get values => _$endpointListNotificationsApiVersionValues;
  // coverage:ignore-end

  static EndpointListNotificationsApiVersion valueOf(final String name) =>
      _$valueOfEndpointListNotificationsApiVersion(name);

  static Serializer<EndpointListNotificationsApiVersion> get serializer =>
      _$endpointListNotificationsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class EndpointEndpointListNotificationsHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-user-status')
  String? get xNextcloudUserStatus;
}

abstract class EndpointEndpointListNotificationsHeaders
    implements
        EndpointEndpointListNotificationsHeadersInterface,
        Built<EndpointEndpointListNotificationsHeaders, EndpointEndpointListNotificationsHeadersBuilder> {
  factory EndpointEndpointListNotificationsHeaders([
    final void Function(EndpointEndpointListNotificationsHeadersBuilder)? b,
  ]) = _$EndpointEndpointListNotificationsHeaders;

  // coverage:ignore-start
  const EndpointEndpointListNotificationsHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointEndpointListNotificationsHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointEndpointListNotificationsHeaders> get serializer =>
      _$EndpointEndpointListNotificationsHeadersSerializer();
}

class _$EndpointEndpointListNotificationsHeadersSerializer
    implements StructuredSerializer<EndpointEndpointListNotificationsHeaders> {
  @override
  final Iterable<Type> types = const [
    EndpointEndpointListNotificationsHeaders,
    _$EndpointEndpointListNotificationsHeaders,
  ];

  @override
  final String wireName = 'EndpointEndpointListNotificationsHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointEndpointListNotificationsHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  EndpointEndpointListNotificationsHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointEndpointListNotificationsHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'x-nextcloud-user-status':
          result.xNextcloudUserStatus = value;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class NotificationActionInterface {
  String get label;
  String get link;
  String get type;
  bool get primary;
}

abstract class NotificationAction
    implements NotificationActionInterface, Built<NotificationAction, NotificationActionBuilder> {
  factory NotificationAction([final void Function(NotificationActionBuilder)? b]) = _$NotificationAction;

  // coverage:ignore-start
  const NotificationAction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationAction.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationAction> get serializer => const _$NotificationActionSerializer();
}

class _$NotificationActionSerializer implements StructuredSerializer<NotificationAction> {
  const _$NotificationActionSerializer();

  @override
  Iterable<Type> get types => const [NotificationAction, _$NotificationAction];

  @override
  String get wireName => 'NotificationAction';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NotificationAction object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'primary',
      serializers.serialize(object.primary, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  NotificationAction deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'primary':
          result.primary = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class NotificationInterface {
  @BuiltValueField(wireName: 'notification_id')
  int get notificationId;
  String get app;
  String get user;
  String get datetime;
  @BuiltValueField(wireName: 'object_type')
  String get objectType;
  @BuiltValueField(wireName: 'object_id')
  String get objectId;
  String get subject;
  String get message;
  String get link;
  BuiltList<NotificationAction> get actions;
  String? get subjectRich;
  BuiltMap<String, JsonObject>? get subjectRichParameters;
  String? get messageRich;
  BuiltMap<String, JsonObject>? get messageRichParameters;
  String? get icon;
  bool? get shouldNotify;
}

abstract class Notification implements NotificationInterface, Built<Notification, NotificationBuilder> {
  factory Notification([final void Function(NotificationBuilder)? b]) = _$Notification;

  // coverage:ignore-start
  const Notification._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Notification.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Notification> get serializer => const _$NotificationSerializer();
}

class _$NotificationSerializer implements StructuredSerializer<Notification> {
  const _$NotificationSerializer();

  @override
  Iterable<Type> get types => const [Notification, _$Notification];

  @override
  String get wireName => 'Notification';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Notification object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'notification_id',
      serializers.serialize(object.notificationId, specifiedType: const FullType(int)),
      'app',
      serializers.serialize(object.app, specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'datetime',
      serializers.serialize(object.datetime, specifiedType: const FullType(String)),
      'object_type',
      serializers.serialize(object.objectType, specifiedType: const FullType(String)),
      'object_id',
      serializers.serialize(object.objectId, specifiedType: const FullType(String)),
      'subject',
      serializers.serialize(object.subject, specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'actions',
      serializers.serialize(object.actions, specifiedType: const FullType(BuiltList, [FullType(NotificationAction)])),
    ];
    Object? value;
    value = object.subjectRich;
    if (value != null) {
      result
        ..add('subjectRich')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.subjectRichParameters;
    if (value != null) {
      result
        ..add('subjectRichParameters')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
          ),
        );
    }

    value = object.messageRich;
    if (value != null) {
      result
        ..add('messageRich')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.messageRichParameters;
    if (value != null) {
      result
        ..add('messageRichParameters')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
          ),
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

    value = object.shouldNotify;
    if (value != null) {
      result
        ..add('shouldNotify')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  Notification deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'notification_id':
          result.notificationId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'user':
          result.user = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'datetime':
          result.datetime = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'object_type':
          result.objectType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'object_id':
          result.objectId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'subject':
          result.subject = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'actions':
          result.actions.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(NotificationAction)]))!
                as BuiltList<NotificationAction>,
          );
        case 'subjectRich':
          result.subjectRich = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'subjectRichParameters':
          result.subjectRichParameters.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
            )! as BuiltMap<String, JsonObject>,
          );
        case 'messageRich':
          result.messageRich = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'messageRichParameters':
          result.messageRichParameters.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
            )! as BuiltMap<String, JsonObject>,
          );
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'shouldNotify':
          result.shouldNotify = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EndpointListNotificationsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Notification> get data;
}

abstract class EndpointListNotificationsResponseApplicationJson_Ocs
    implements
        EndpointListNotificationsResponseApplicationJson_OcsInterface,
        Built<EndpointListNotificationsResponseApplicationJson_Ocs,
            EndpointListNotificationsResponseApplicationJson_OcsBuilder> {
  factory EndpointListNotificationsResponseApplicationJson_Ocs([
    final void Function(EndpointListNotificationsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointListNotificationsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointListNotificationsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointListNotificationsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointListNotificationsResponseApplicationJson_Ocs> get serializer =>
      const _$EndpointListNotificationsResponseApplicationJson_OcsSerializer();
}

class _$EndpointListNotificationsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<EndpointListNotificationsResponseApplicationJson_Ocs> {
  const _$EndpointListNotificationsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        EndpointListNotificationsResponseApplicationJson_Ocs,
        _$EndpointListNotificationsResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'EndpointListNotificationsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointListNotificationsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Notification)])),
    ];
    return result;
  }

  @override
  EndpointListNotificationsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointListNotificationsResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Notification)]))!
                as BuiltList<Notification>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EndpointListNotificationsResponseApplicationJsonInterface {
  EndpointListNotificationsResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointListNotificationsResponseApplicationJson
    implements
        EndpointListNotificationsResponseApplicationJsonInterface,
        Built<EndpointListNotificationsResponseApplicationJson,
            EndpointListNotificationsResponseApplicationJsonBuilder> {
  factory EndpointListNotificationsResponseApplicationJson([
    final void Function(EndpointListNotificationsResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointListNotificationsResponseApplicationJson;

  // coverage:ignore-start
  const EndpointListNotificationsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointListNotificationsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointListNotificationsResponseApplicationJson> get serializer =>
      const _$EndpointListNotificationsResponseApplicationJsonSerializer();
}

class _$EndpointListNotificationsResponseApplicationJsonSerializer
    implements StructuredSerializer<EndpointListNotificationsResponseApplicationJson> {
  const _$EndpointListNotificationsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [EndpointListNotificationsResponseApplicationJson, _$EndpointListNotificationsResponseApplicationJson];

  @override
  String get wireName => 'EndpointListNotificationsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointListNotificationsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(EndpointListNotificationsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  EndpointListNotificationsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointListNotificationsResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(EndpointListNotificationsResponseApplicationJson_Ocs),
            )! as EndpointListNotificationsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class EndpointDeleteAllNotificationsApiVersion extends EnumClass {
  const EndpointDeleteAllNotificationsApiVersion._(super.name);

  static const EndpointDeleteAllNotificationsApiVersion v1 = _$endpointDeleteAllNotificationsApiVersionV1;

  static const EndpointDeleteAllNotificationsApiVersion v2 = _$endpointDeleteAllNotificationsApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<EndpointDeleteAllNotificationsApiVersion> get values =>
      _$endpointDeleteAllNotificationsApiVersionValues;
  // coverage:ignore-end

  static EndpointDeleteAllNotificationsApiVersion valueOf(final String name) =>
      _$valueOfEndpointDeleteAllNotificationsApiVersion(name);

  static Serializer<EndpointDeleteAllNotificationsApiVersion> get serializer =>
      _$endpointDeleteAllNotificationsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class EndpointDeleteAllNotificationsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class EndpointDeleteAllNotificationsResponseApplicationJson_Ocs
    implements
        EndpointDeleteAllNotificationsResponseApplicationJson_OcsInterface,
        Built<EndpointDeleteAllNotificationsResponseApplicationJson_Ocs,
            EndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder> {
  factory EndpointDeleteAllNotificationsResponseApplicationJson_Ocs([
    final void Function(EndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointDeleteAllNotificationsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointDeleteAllNotificationsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteAllNotificationsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointDeleteAllNotificationsResponseApplicationJson_Ocs> get serializer =>
      const _$EndpointDeleteAllNotificationsResponseApplicationJson_OcsSerializer();
}

class _$EndpointDeleteAllNotificationsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<EndpointDeleteAllNotificationsResponseApplicationJson_Ocs> {
  const _$EndpointDeleteAllNotificationsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        EndpointDeleteAllNotificationsResponseApplicationJson_Ocs,
        _$EndpointDeleteAllNotificationsResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'EndpointDeleteAllNotificationsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointDeleteAllNotificationsResponseApplicationJson_Ocs object, {
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
  EndpointDeleteAllNotificationsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder();

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
abstract interface class EndpointDeleteAllNotificationsResponseApplicationJsonInterface {
  EndpointDeleteAllNotificationsResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointDeleteAllNotificationsResponseApplicationJson
    implements
        EndpointDeleteAllNotificationsResponseApplicationJsonInterface,
        Built<EndpointDeleteAllNotificationsResponseApplicationJson,
            EndpointDeleteAllNotificationsResponseApplicationJsonBuilder> {
  factory EndpointDeleteAllNotificationsResponseApplicationJson([
    final void Function(EndpointDeleteAllNotificationsResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointDeleteAllNotificationsResponseApplicationJson;

  // coverage:ignore-start
  const EndpointDeleteAllNotificationsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteAllNotificationsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointDeleteAllNotificationsResponseApplicationJson> get serializer =>
      const _$EndpointDeleteAllNotificationsResponseApplicationJsonSerializer();
}

class _$EndpointDeleteAllNotificationsResponseApplicationJsonSerializer
    implements StructuredSerializer<EndpointDeleteAllNotificationsResponseApplicationJson> {
  const _$EndpointDeleteAllNotificationsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        EndpointDeleteAllNotificationsResponseApplicationJson,
        _$EndpointDeleteAllNotificationsResponseApplicationJson,
      ];

  @override
  String get wireName => 'EndpointDeleteAllNotificationsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointDeleteAllNotificationsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(EndpointDeleteAllNotificationsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  EndpointDeleteAllNotificationsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointDeleteAllNotificationsResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(EndpointDeleteAllNotificationsResponseApplicationJson_Ocs),
            )! as EndpointDeleteAllNotificationsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class EndpointGetNotificationApiVersion extends EnumClass {
  const EndpointGetNotificationApiVersion._(super.name);

  static const EndpointGetNotificationApiVersion v1 = _$endpointGetNotificationApiVersionV1;

  static const EndpointGetNotificationApiVersion v2 = _$endpointGetNotificationApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<EndpointGetNotificationApiVersion> get values => _$endpointGetNotificationApiVersionValues;
  // coverage:ignore-end

  static EndpointGetNotificationApiVersion valueOf(final String name) =>
      _$valueOfEndpointGetNotificationApiVersion(name);

  static Serializer<EndpointGetNotificationApiVersion> get serializer => _$endpointGetNotificationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class EndpointGetNotificationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Notification get data;
}

abstract class EndpointGetNotificationResponseApplicationJson_Ocs
    implements
        EndpointGetNotificationResponseApplicationJson_OcsInterface,
        Built<EndpointGetNotificationResponseApplicationJson_Ocs,
            EndpointGetNotificationResponseApplicationJson_OcsBuilder> {
  factory EndpointGetNotificationResponseApplicationJson_Ocs([
    final void Function(EndpointGetNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointGetNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointGetNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointGetNotificationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointGetNotificationResponseApplicationJson_Ocs> get serializer =>
      const _$EndpointGetNotificationResponseApplicationJson_OcsSerializer();
}

class _$EndpointGetNotificationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<EndpointGetNotificationResponseApplicationJson_Ocs> {
  const _$EndpointGetNotificationResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [EndpointGetNotificationResponseApplicationJson_Ocs, _$EndpointGetNotificationResponseApplicationJson_Ocs];

  @override
  String get wireName => 'EndpointGetNotificationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointGetNotificationResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Notification)),
    ];
    return result;
  }

  @override
  EndpointGetNotificationResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointGetNotificationResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Notification))! as Notification,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EndpointGetNotificationResponseApplicationJsonInterface {
  EndpointGetNotificationResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointGetNotificationResponseApplicationJson
    implements
        EndpointGetNotificationResponseApplicationJsonInterface,
        Built<EndpointGetNotificationResponseApplicationJson, EndpointGetNotificationResponseApplicationJsonBuilder> {
  factory EndpointGetNotificationResponseApplicationJson([
    final void Function(EndpointGetNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointGetNotificationResponseApplicationJson;

  // coverage:ignore-start
  const EndpointGetNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointGetNotificationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointGetNotificationResponseApplicationJson> get serializer =>
      const _$EndpointGetNotificationResponseApplicationJsonSerializer();
}

class _$EndpointGetNotificationResponseApplicationJsonSerializer
    implements StructuredSerializer<EndpointGetNotificationResponseApplicationJson> {
  const _$EndpointGetNotificationResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [EndpointGetNotificationResponseApplicationJson, _$EndpointGetNotificationResponseApplicationJson];

  @override
  String get wireName => 'EndpointGetNotificationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointGetNotificationResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(EndpointGetNotificationResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  EndpointGetNotificationResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointGetNotificationResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(EndpointGetNotificationResponseApplicationJson_Ocs),
            )! as EndpointGetNotificationResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class EndpointDeleteNotificationApiVersion extends EnumClass {
  const EndpointDeleteNotificationApiVersion._(super.name);

  static const EndpointDeleteNotificationApiVersion v1 = _$endpointDeleteNotificationApiVersionV1;

  static const EndpointDeleteNotificationApiVersion v2 = _$endpointDeleteNotificationApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<EndpointDeleteNotificationApiVersion> get values => _$endpointDeleteNotificationApiVersionValues;
  // coverage:ignore-end

  static EndpointDeleteNotificationApiVersion valueOf(final String name) =>
      _$valueOfEndpointDeleteNotificationApiVersion(name);

  static Serializer<EndpointDeleteNotificationApiVersion> get serializer =>
      _$endpointDeleteNotificationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class EndpointDeleteNotificationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class EndpointDeleteNotificationResponseApplicationJson_Ocs
    implements
        EndpointDeleteNotificationResponseApplicationJson_OcsInterface,
        Built<EndpointDeleteNotificationResponseApplicationJson_Ocs,
            EndpointDeleteNotificationResponseApplicationJson_OcsBuilder> {
  factory EndpointDeleteNotificationResponseApplicationJson_Ocs([
    final void Function(EndpointDeleteNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointDeleteNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointDeleteNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteNotificationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointDeleteNotificationResponseApplicationJson_Ocs> get serializer =>
      const _$EndpointDeleteNotificationResponseApplicationJson_OcsSerializer();
}

class _$EndpointDeleteNotificationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<EndpointDeleteNotificationResponseApplicationJson_Ocs> {
  const _$EndpointDeleteNotificationResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        EndpointDeleteNotificationResponseApplicationJson_Ocs,
        _$EndpointDeleteNotificationResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'EndpointDeleteNotificationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointDeleteNotificationResponseApplicationJson_Ocs object, {
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
  EndpointDeleteNotificationResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointDeleteNotificationResponseApplicationJson_OcsBuilder();

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
abstract interface class EndpointDeleteNotificationResponseApplicationJsonInterface {
  EndpointDeleteNotificationResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointDeleteNotificationResponseApplicationJson
    implements
        EndpointDeleteNotificationResponseApplicationJsonInterface,
        Built<EndpointDeleteNotificationResponseApplicationJson,
            EndpointDeleteNotificationResponseApplicationJsonBuilder> {
  factory EndpointDeleteNotificationResponseApplicationJson([
    final void Function(EndpointDeleteNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointDeleteNotificationResponseApplicationJson;

  // coverage:ignore-start
  const EndpointDeleteNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteNotificationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointDeleteNotificationResponseApplicationJson> get serializer =>
      const _$EndpointDeleteNotificationResponseApplicationJsonSerializer();
}

class _$EndpointDeleteNotificationResponseApplicationJsonSerializer
    implements StructuredSerializer<EndpointDeleteNotificationResponseApplicationJson> {
  const _$EndpointDeleteNotificationResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [EndpointDeleteNotificationResponseApplicationJson, _$EndpointDeleteNotificationResponseApplicationJson];

  @override
  String get wireName => 'EndpointDeleteNotificationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointDeleteNotificationResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(EndpointDeleteNotificationResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  EndpointDeleteNotificationResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointDeleteNotificationResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(EndpointDeleteNotificationResponseApplicationJson_Ocs),
            )! as EndpointDeleteNotificationResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class EndpointConfirmIdsForUserApiVersion extends EnumClass {
  const EndpointConfirmIdsForUserApiVersion._(super.name);

  static const EndpointConfirmIdsForUserApiVersion v1 = _$endpointConfirmIdsForUserApiVersionV1;

  static const EndpointConfirmIdsForUserApiVersion v2 = _$endpointConfirmIdsForUserApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<EndpointConfirmIdsForUserApiVersion> get values => _$endpointConfirmIdsForUserApiVersionValues;
  // coverage:ignore-end

  static EndpointConfirmIdsForUserApiVersion valueOf(final String name) =>
      _$valueOfEndpointConfirmIdsForUserApiVersion(name);

  static Serializer<EndpointConfirmIdsForUserApiVersion> get serializer =>
      _$endpointConfirmIdsForUserApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class EndpointConfirmIdsForUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<int> get data;
}

abstract class EndpointConfirmIdsForUserResponseApplicationJson_Ocs
    implements
        EndpointConfirmIdsForUserResponseApplicationJson_OcsInterface,
        Built<EndpointConfirmIdsForUserResponseApplicationJson_Ocs,
            EndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder> {
  factory EndpointConfirmIdsForUserResponseApplicationJson_Ocs([
    final void Function(EndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointConfirmIdsForUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointConfirmIdsForUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointConfirmIdsForUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointConfirmIdsForUserResponseApplicationJson_Ocs> get serializer =>
      const _$EndpointConfirmIdsForUserResponseApplicationJson_OcsSerializer();
}

class _$EndpointConfirmIdsForUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<EndpointConfirmIdsForUserResponseApplicationJson_Ocs> {
  const _$EndpointConfirmIdsForUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        EndpointConfirmIdsForUserResponseApplicationJson_Ocs,
        _$EndpointConfirmIdsForUserResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'EndpointConfirmIdsForUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointConfirmIdsForUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(int)])),
    ];
    return result;
  }

  @override
  EndpointConfirmIdsForUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(int)]))!
                as BuiltList<int>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EndpointConfirmIdsForUserResponseApplicationJsonInterface {
  EndpointConfirmIdsForUserResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointConfirmIdsForUserResponseApplicationJson
    implements
        EndpointConfirmIdsForUserResponseApplicationJsonInterface,
        Built<EndpointConfirmIdsForUserResponseApplicationJson,
            EndpointConfirmIdsForUserResponseApplicationJsonBuilder> {
  factory EndpointConfirmIdsForUserResponseApplicationJson([
    final void Function(EndpointConfirmIdsForUserResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointConfirmIdsForUserResponseApplicationJson;

  // coverage:ignore-start
  const EndpointConfirmIdsForUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointConfirmIdsForUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EndpointConfirmIdsForUserResponseApplicationJson> get serializer =>
      const _$EndpointConfirmIdsForUserResponseApplicationJsonSerializer();
}

class _$EndpointConfirmIdsForUserResponseApplicationJsonSerializer
    implements StructuredSerializer<EndpointConfirmIdsForUserResponseApplicationJson> {
  const _$EndpointConfirmIdsForUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [EndpointConfirmIdsForUserResponseApplicationJson, _$EndpointConfirmIdsForUserResponseApplicationJson];

  @override
  String get wireName => 'EndpointConfirmIdsForUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EndpointConfirmIdsForUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(EndpointConfirmIdsForUserResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  EndpointConfirmIdsForUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EndpointConfirmIdsForUserResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(EndpointConfirmIdsForUserResponseApplicationJson_Ocs),
            )! as EndpointConfirmIdsForUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class PushRegisterDeviceApiVersion extends EnumClass {
  const PushRegisterDeviceApiVersion._(super.name);

  static const PushRegisterDeviceApiVersion v2 = _$pushRegisterDeviceApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<PushRegisterDeviceApiVersion> get values => _$pushRegisterDeviceApiVersionValues;
  // coverage:ignore-end

  static PushRegisterDeviceApiVersion valueOf(final String name) => _$valueOfPushRegisterDeviceApiVersion(name);

  static Serializer<PushRegisterDeviceApiVersion> get serializer => _$pushRegisterDeviceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class PushDeviceInterface {
  String get publicKey;
  String get deviceIdentifier;
  String get signature;
}

abstract class PushDevice implements PushDeviceInterface, Built<PushDevice, PushDeviceBuilder> {
  factory PushDevice([final void Function(PushDeviceBuilder)? b]) = _$PushDevice;

  // coverage:ignore-start
  const PushDevice._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushDevice.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PushDevice> get serializer => const _$PushDeviceSerializer();
}

class _$PushDeviceSerializer implements StructuredSerializer<PushDevice> {
  const _$PushDeviceSerializer();

  @override
  Iterable<Type> get types => const [PushDevice, _$PushDevice];

  @override
  String get wireName => 'PushDevice';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PushDevice object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'publicKey',
      serializers.serialize(object.publicKey, specifiedType: const FullType(String)),
      'deviceIdentifier',
      serializers.serialize(object.deviceIdentifier, specifiedType: const FullType(String)),
      'signature',
      serializers.serialize(object.signature, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  PushDevice deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PushDeviceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'publicKey':
          result.publicKey = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'deviceIdentifier':
          result.deviceIdentifier = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'signature':
          result.signature = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PushRegisterDeviceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  PushDevice get data;
}

abstract class PushRegisterDeviceResponseApplicationJson_Ocs
    implements
        PushRegisterDeviceResponseApplicationJson_OcsInterface,
        Built<PushRegisterDeviceResponseApplicationJson_Ocs, PushRegisterDeviceResponseApplicationJson_OcsBuilder> {
  factory PushRegisterDeviceResponseApplicationJson_Ocs([
    final void Function(PushRegisterDeviceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PushRegisterDeviceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PushRegisterDeviceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRegisterDeviceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PushRegisterDeviceResponseApplicationJson_Ocs> get serializer =>
      const _$PushRegisterDeviceResponseApplicationJson_OcsSerializer();
}

class _$PushRegisterDeviceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<PushRegisterDeviceResponseApplicationJson_Ocs> {
  const _$PushRegisterDeviceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [PushRegisterDeviceResponseApplicationJson_Ocs, _$PushRegisterDeviceResponseApplicationJson_Ocs];

  @override
  String get wireName => 'PushRegisterDeviceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PushRegisterDeviceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(PushDevice)),
    ];
    return result;
  }

  @override
  PushRegisterDeviceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PushRegisterDeviceResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(PushDevice))! as PushDevice,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class PushRegisterDeviceResponseApplicationJsonInterface {
  PushRegisterDeviceResponseApplicationJson_Ocs get ocs;
}

abstract class PushRegisterDeviceResponseApplicationJson
    implements
        PushRegisterDeviceResponseApplicationJsonInterface,
        Built<PushRegisterDeviceResponseApplicationJson, PushRegisterDeviceResponseApplicationJsonBuilder> {
  factory PushRegisterDeviceResponseApplicationJson([
    final void Function(PushRegisterDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$PushRegisterDeviceResponseApplicationJson;

  // coverage:ignore-start
  const PushRegisterDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRegisterDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PushRegisterDeviceResponseApplicationJson> get serializer =>
      const _$PushRegisterDeviceResponseApplicationJsonSerializer();
}

class _$PushRegisterDeviceResponseApplicationJsonSerializer
    implements StructuredSerializer<PushRegisterDeviceResponseApplicationJson> {
  const _$PushRegisterDeviceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [PushRegisterDeviceResponseApplicationJson, _$PushRegisterDeviceResponseApplicationJson];

  @override
  String get wireName => 'PushRegisterDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PushRegisterDeviceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(PushRegisterDeviceResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  PushRegisterDeviceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PushRegisterDeviceResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(PushRegisterDeviceResponseApplicationJson_Ocs),
            )! as PushRegisterDeviceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class PushRemoveDeviceApiVersion extends EnumClass {
  const PushRemoveDeviceApiVersion._(super.name);

  static const PushRemoveDeviceApiVersion v2 = _$pushRemoveDeviceApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<PushRemoveDeviceApiVersion> get values => _$pushRemoveDeviceApiVersionValues;
  // coverage:ignore-end

  static PushRemoveDeviceApiVersion valueOf(final String name) => _$valueOfPushRemoveDeviceApiVersion(name);

  static Serializer<PushRemoveDeviceApiVersion> get serializer => _$pushRemoveDeviceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class PushRemoveDeviceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PushRemoveDeviceResponseApplicationJson_Ocs
    implements
        PushRemoveDeviceResponseApplicationJson_OcsInterface,
        Built<PushRemoveDeviceResponseApplicationJson_Ocs, PushRemoveDeviceResponseApplicationJson_OcsBuilder> {
  factory PushRemoveDeviceResponseApplicationJson_Ocs([
    final void Function(PushRemoveDeviceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PushRemoveDeviceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PushRemoveDeviceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRemoveDeviceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PushRemoveDeviceResponseApplicationJson_Ocs> get serializer =>
      const _$PushRemoveDeviceResponseApplicationJson_OcsSerializer();
}

class _$PushRemoveDeviceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<PushRemoveDeviceResponseApplicationJson_Ocs> {
  const _$PushRemoveDeviceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [PushRemoveDeviceResponseApplicationJson_Ocs, _$PushRemoveDeviceResponseApplicationJson_Ocs];

  @override
  String get wireName => 'PushRemoveDeviceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PushRemoveDeviceResponseApplicationJson_Ocs object, {
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
  PushRemoveDeviceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PushRemoveDeviceResponseApplicationJson_OcsBuilder();

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
abstract interface class PushRemoveDeviceResponseApplicationJsonInterface {
  PushRemoveDeviceResponseApplicationJson_Ocs get ocs;
}

abstract class PushRemoveDeviceResponseApplicationJson
    implements
        PushRemoveDeviceResponseApplicationJsonInterface,
        Built<PushRemoveDeviceResponseApplicationJson, PushRemoveDeviceResponseApplicationJsonBuilder> {
  factory PushRemoveDeviceResponseApplicationJson([
    final void Function(PushRemoveDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$PushRemoveDeviceResponseApplicationJson;

  // coverage:ignore-start
  const PushRemoveDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRemoveDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<PushRemoveDeviceResponseApplicationJson> get serializer =>
      const _$PushRemoveDeviceResponseApplicationJsonSerializer();
}

class _$PushRemoveDeviceResponseApplicationJsonSerializer
    implements StructuredSerializer<PushRemoveDeviceResponseApplicationJson> {
  const _$PushRemoveDeviceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [PushRemoveDeviceResponseApplicationJson, _$PushRemoveDeviceResponseApplicationJson];

  @override
  String get wireName => 'PushRemoveDeviceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final PushRemoveDeviceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(PushRemoveDeviceResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  PushRemoveDeviceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = PushRemoveDeviceResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(PushRemoveDeviceResponseApplicationJson_Ocs))!
                as PushRemoveDeviceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class SettingsPersonalApiVersion extends EnumClass {
  const SettingsPersonalApiVersion._(super.name);

  static const SettingsPersonalApiVersion v2 = _$settingsPersonalApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<SettingsPersonalApiVersion> get values => _$settingsPersonalApiVersionValues;
  // coverage:ignore-end

  static SettingsPersonalApiVersion valueOf(final String name) => _$valueOfSettingsPersonalApiVersion(name);

  static Serializer<SettingsPersonalApiVersion> get serializer => _$settingsPersonalApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SettingsPersonalResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class SettingsPersonalResponseApplicationJson_Ocs
    implements
        SettingsPersonalResponseApplicationJson_OcsInterface,
        Built<SettingsPersonalResponseApplicationJson_Ocs, SettingsPersonalResponseApplicationJson_OcsBuilder> {
  factory SettingsPersonalResponseApplicationJson_Ocs([
    final void Function(SettingsPersonalResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SettingsPersonalResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SettingsPersonalResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsPersonalResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingsPersonalResponseApplicationJson_Ocs> get serializer =>
      const _$SettingsPersonalResponseApplicationJson_OcsSerializer();
}

class _$SettingsPersonalResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<SettingsPersonalResponseApplicationJson_Ocs> {
  const _$SettingsPersonalResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [SettingsPersonalResponseApplicationJson_Ocs, _$SettingsPersonalResponseApplicationJson_Ocs];

  @override
  String get wireName => 'SettingsPersonalResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SettingsPersonalResponseApplicationJson_Ocs object, {
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
  SettingsPersonalResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingsPersonalResponseApplicationJson_OcsBuilder();

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
abstract interface class SettingsPersonalResponseApplicationJsonInterface {
  SettingsPersonalResponseApplicationJson_Ocs get ocs;
}

abstract class SettingsPersonalResponseApplicationJson
    implements
        SettingsPersonalResponseApplicationJsonInterface,
        Built<SettingsPersonalResponseApplicationJson, SettingsPersonalResponseApplicationJsonBuilder> {
  factory SettingsPersonalResponseApplicationJson([
    final void Function(SettingsPersonalResponseApplicationJsonBuilder)? b,
  ]) = _$SettingsPersonalResponseApplicationJson;

  // coverage:ignore-start
  const SettingsPersonalResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsPersonalResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingsPersonalResponseApplicationJson> get serializer =>
      const _$SettingsPersonalResponseApplicationJsonSerializer();
}

class _$SettingsPersonalResponseApplicationJsonSerializer
    implements StructuredSerializer<SettingsPersonalResponseApplicationJson> {
  const _$SettingsPersonalResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [SettingsPersonalResponseApplicationJson, _$SettingsPersonalResponseApplicationJson];

  @override
  String get wireName => 'SettingsPersonalResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SettingsPersonalResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(SettingsPersonalResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  SettingsPersonalResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingsPersonalResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(SettingsPersonalResponseApplicationJson_Ocs))!
                as SettingsPersonalResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

class SettingsAdminApiVersion extends EnumClass {
  const SettingsAdminApiVersion._(super.name);

  static const SettingsAdminApiVersion v2 = _$settingsAdminApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<SettingsAdminApiVersion> get values => _$settingsAdminApiVersionValues;
  // coverage:ignore-end

  static SettingsAdminApiVersion valueOf(final String name) => _$valueOfSettingsAdminApiVersion(name);

  static Serializer<SettingsAdminApiVersion> get serializer => _$settingsAdminApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SettingsAdminResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class SettingsAdminResponseApplicationJson_Ocs
    implements
        SettingsAdminResponseApplicationJson_OcsInterface,
        Built<SettingsAdminResponseApplicationJson_Ocs, SettingsAdminResponseApplicationJson_OcsBuilder> {
  factory SettingsAdminResponseApplicationJson_Ocs([
    final void Function(SettingsAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SettingsAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SettingsAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsAdminResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingsAdminResponseApplicationJson_Ocs> get serializer =>
      const _$SettingsAdminResponseApplicationJson_OcsSerializer();
}

class _$SettingsAdminResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<SettingsAdminResponseApplicationJson_Ocs> {
  const _$SettingsAdminResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [SettingsAdminResponseApplicationJson_Ocs, _$SettingsAdminResponseApplicationJson_Ocs];

  @override
  String get wireName => 'SettingsAdminResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SettingsAdminResponseApplicationJson_Ocs object, {
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
  SettingsAdminResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingsAdminResponseApplicationJson_OcsBuilder();

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
abstract interface class SettingsAdminResponseApplicationJsonInterface {
  SettingsAdminResponseApplicationJson_Ocs get ocs;
}

abstract class SettingsAdminResponseApplicationJson
    implements
        SettingsAdminResponseApplicationJsonInterface,
        Built<SettingsAdminResponseApplicationJson, SettingsAdminResponseApplicationJsonBuilder> {
  factory SettingsAdminResponseApplicationJson([final void Function(SettingsAdminResponseApplicationJsonBuilder)? b]) =
      _$SettingsAdminResponseApplicationJson;

  // coverage:ignore-start
  const SettingsAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsAdminResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingsAdminResponseApplicationJson> get serializer =>
      const _$SettingsAdminResponseApplicationJsonSerializer();
}

class _$SettingsAdminResponseApplicationJsonSerializer
    implements StructuredSerializer<SettingsAdminResponseApplicationJson> {
  const _$SettingsAdminResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [SettingsAdminResponseApplicationJson, _$SettingsAdminResponseApplicationJson];

  @override
  String get wireName => 'SettingsAdminResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SettingsAdminResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(SettingsAdminResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  SettingsAdminResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingsAdminResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(SettingsAdminResponseApplicationJson_Ocs))!
                as SettingsAdminResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_NotificationsInterface {
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String> get ocsEndpoints;
  BuiltList<String> get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String> get adminNotifications;
}

abstract class Capabilities_Notifications
    implements
        Capabilities_NotificationsInterface,
        Built<Capabilities_Notifications, Capabilities_NotificationsBuilder> {
  factory Capabilities_Notifications([final void Function(Capabilities_NotificationsBuilder)? b]) =
      _$Capabilities_Notifications;

  // coverage:ignore-start
  const Capabilities_Notifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Notifications.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_Notifications> get serializer => const _$Capabilities_NotificationsSerializer();
}

class _$Capabilities_NotificationsSerializer implements StructuredSerializer<Capabilities_Notifications> {
  const _$Capabilities_NotificationsSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_Notifications, _$Capabilities_Notifications];

  @override
  String get wireName => 'Capabilities_Notifications';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_Notifications object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs-endpoints',
      serializers.serialize(object.ocsEndpoints, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'push',
      serializers.serialize(object.push, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'admin-notifications',
      serializers.serialize(object.adminNotifications, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  Capabilities_Notifications deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_NotificationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs-endpoints':
          result.ocsEndpoints.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'push':
          result.push.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'admin-notifications':
          result.adminNotifications.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  Capabilities_Notifications get notifications;
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
      'notifications',
      serializers.serialize(object.notifications, specifiedType: const FullType(Capabilities_Notifications)),
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
        case 'notifications':
          result.notifications.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_Notifications))!
                as Capabilities_Notifications,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..add(ApiGenerateNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ApiGenerateNotificationResponseApplicationJson),
        ApiGenerateNotificationResponseApplicationJson.new,
      )
      ..add(ApiGenerateNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiGenerateNotificationResponseApplicationJson_Ocs),
        ApiGenerateNotificationResponseApplicationJson_Ocs.new,
      )
      ..add(ApiGenerateNotificationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..add(EndpointListNotificationsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointEndpointListNotificationsHeaders),
        EndpointEndpointListNotificationsHeaders.new,
      )
      ..add(EndpointEndpointListNotificationsHeaders.serializer)
      ..addBuilderFactory(
        const FullType(EndpointListNotificationsResponseApplicationJson),
        EndpointListNotificationsResponseApplicationJson.new,
      )
      ..add(EndpointListNotificationsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointListNotificationsResponseApplicationJson_Ocs),
        EndpointListNotificationsResponseApplicationJson_Ocs.new,
      )
      ..add(EndpointListNotificationsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Notification), Notification.new)
      ..add(Notification.serializer)
      ..addBuilderFactory(const FullType(NotificationAction), NotificationAction.new)
      ..add(NotificationAction.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(NotificationAction)]),
        ListBuilder<NotificationAction>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Notification)]), ListBuilder<Notification>.new)
      ..add(EndpointDeleteAllNotificationsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointDeleteAllNotificationsResponseApplicationJson),
        EndpointDeleteAllNotificationsResponseApplicationJson.new,
      )
      ..add(EndpointDeleteAllNotificationsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointDeleteAllNotificationsResponseApplicationJson_Ocs),
        EndpointDeleteAllNotificationsResponseApplicationJson_Ocs.new,
      )
      ..add(EndpointDeleteAllNotificationsResponseApplicationJson_Ocs.serializer)
      ..add(EndpointGetNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointGetNotificationResponseApplicationJson),
        EndpointGetNotificationResponseApplicationJson.new,
      )
      ..add(EndpointGetNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointGetNotificationResponseApplicationJson_Ocs),
        EndpointGetNotificationResponseApplicationJson_Ocs.new,
      )
      ..add(EndpointGetNotificationResponseApplicationJson_Ocs.serializer)
      ..add(EndpointDeleteNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointDeleteNotificationResponseApplicationJson),
        EndpointDeleteNotificationResponseApplicationJson.new,
      )
      ..add(EndpointDeleteNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointDeleteNotificationResponseApplicationJson_Ocs),
        EndpointDeleteNotificationResponseApplicationJson_Ocs.new,
      )
      ..add(EndpointDeleteNotificationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..add(EndpointConfirmIdsForUserApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointConfirmIdsForUserResponseApplicationJson),
        EndpointConfirmIdsForUserResponseApplicationJson.new,
      )
      ..add(EndpointConfirmIdsForUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointConfirmIdsForUserResponseApplicationJson_Ocs),
        EndpointConfirmIdsForUserResponseApplicationJson_Ocs.new,
      )
      ..add(EndpointConfirmIdsForUserResponseApplicationJson_Ocs.serializer)
      ..add(PushRegisterDeviceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PushRegisterDeviceResponseApplicationJson),
        PushRegisterDeviceResponseApplicationJson.new,
      )
      ..add(PushRegisterDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PushRegisterDeviceResponseApplicationJson_Ocs),
        PushRegisterDeviceResponseApplicationJson_Ocs.new,
      )
      ..add(PushRegisterDeviceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(PushDevice), PushDevice.new)
      ..add(PushDevice.serializer)
      ..add(PushRemoveDeviceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PushRemoveDeviceResponseApplicationJson),
        PushRemoveDeviceResponseApplicationJson.new,
      )
      ..add(PushRemoveDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PushRemoveDeviceResponseApplicationJson_Ocs),
        PushRemoveDeviceResponseApplicationJson_Ocs.new,
      )
      ..add(PushRemoveDeviceResponseApplicationJson_Ocs.serializer)
      ..add(SettingsPersonalApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SettingsPersonalResponseApplicationJson),
        SettingsPersonalResponseApplicationJson.new,
      )
      ..add(SettingsPersonalResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SettingsPersonalResponseApplicationJson_Ocs),
        SettingsPersonalResponseApplicationJson_Ocs.new,
      )
      ..add(SettingsPersonalResponseApplicationJson_Ocs.serializer)
      ..add(SettingsAdminApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SettingsAdminResponseApplicationJson),
        SettingsAdminResponseApplicationJson.new,
      )
      ..add(SettingsAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SettingsAdminResponseApplicationJson_Ocs),
        SettingsAdminResponseApplicationJson_Ocs.new,
      )
      ..add(SettingsAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_Notifications), Capabilities_Notifications.new)
      ..add(Capabilities_Notifications.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
