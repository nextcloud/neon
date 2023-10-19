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
    final userId0 = Uri.encodeQueryComponent(userId);
    if (longMessage != '') {
      queryParameters['longMessage'] = longMessage;
    }
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/admin_notifications/$userId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/notifications';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/notifications';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final id0 = Uri.encodeQueryComponent(id.toString());
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/notifications/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final id0 = Uri.encodeQueryComponent(id.toString());
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/notifications/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/notifications/exists';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/push';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/push';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/settings';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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
    final apiVersion0 = Uri.encodeQueryComponent(apiVersion.name);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/notifications/api/$apiVersion0/settings/admin';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
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

  static Serializer<ApiGenerateNotificationResponseApplicationJson_Ocs> get serializer =>
      _$apiGenerateNotificationResponseApplicationJsonOcsSerializer;
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

  static Serializer<ApiGenerateNotificationResponseApplicationJson> get serializer =>
      _$apiGenerateNotificationResponseApplicationJsonSerializer;
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

  static Serializer<NotificationAction> get serializer => _$notificationActionSerializer;
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

  static Serializer<Notification> get serializer => _$notificationSerializer;
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

  static Serializer<EndpointListNotificationsResponseApplicationJson_Ocs> get serializer =>
      _$endpointListNotificationsResponseApplicationJsonOcsSerializer;
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

  static Serializer<EndpointListNotificationsResponseApplicationJson> get serializer =>
      _$endpointListNotificationsResponseApplicationJsonSerializer;
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

  static Serializer<EndpointDeleteAllNotificationsResponseApplicationJson_Ocs> get serializer =>
      _$endpointDeleteAllNotificationsResponseApplicationJsonOcsSerializer;
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

  static Serializer<EndpointDeleteAllNotificationsResponseApplicationJson> get serializer =>
      _$endpointDeleteAllNotificationsResponseApplicationJsonSerializer;
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

  static Serializer<EndpointGetNotificationResponseApplicationJson_Ocs> get serializer =>
      _$endpointGetNotificationResponseApplicationJsonOcsSerializer;
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

  static Serializer<EndpointGetNotificationResponseApplicationJson> get serializer =>
      _$endpointGetNotificationResponseApplicationJsonSerializer;
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

  static Serializer<EndpointDeleteNotificationResponseApplicationJson_Ocs> get serializer =>
      _$endpointDeleteNotificationResponseApplicationJsonOcsSerializer;
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

  static Serializer<EndpointDeleteNotificationResponseApplicationJson> get serializer =>
      _$endpointDeleteNotificationResponseApplicationJsonSerializer;
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

  static Serializer<EndpointConfirmIdsForUserResponseApplicationJson_Ocs> get serializer =>
      _$endpointConfirmIdsForUserResponseApplicationJsonOcsSerializer;
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

  static Serializer<EndpointConfirmIdsForUserResponseApplicationJson> get serializer =>
      _$endpointConfirmIdsForUserResponseApplicationJsonSerializer;
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

  static Serializer<PushDevice> get serializer => _$pushDeviceSerializer;
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

  static Serializer<PushRegisterDeviceResponseApplicationJson_Ocs> get serializer =>
      _$pushRegisterDeviceResponseApplicationJsonOcsSerializer;
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

  static Serializer<PushRegisterDeviceResponseApplicationJson> get serializer =>
      _$pushRegisterDeviceResponseApplicationJsonSerializer;
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

  static Serializer<PushRemoveDeviceResponseApplicationJson_Ocs> get serializer =>
      _$pushRemoveDeviceResponseApplicationJsonOcsSerializer;
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

  static Serializer<PushRemoveDeviceResponseApplicationJson> get serializer =>
      _$pushRemoveDeviceResponseApplicationJsonSerializer;
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

  static Serializer<SettingsPersonalResponseApplicationJson_Ocs> get serializer =>
      _$settingsPersonalResponseApplicationJsonOcsSerializer;
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

  static Serializer<SettingsPersonalResponseApplicationJson> get serializer =>
      _$settingsPersonalResponseApplicationJsonSerializer;
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

  static Serializer<SettingsAdminResponseApplicationJson_Ocs> get serializer =>
      _$settingsAdminResponseApplicationJsonOcsSerializer;
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

  static Serializer<SettingsAdminResponseApplicationJson> get serializer =>
      _$settingsAdminResponseApplicationJsonSerializer;
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

  static Serializer<Capabilities_Notifications> get serializer => _$capabilitiesNotificationsSerializer;
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

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
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
