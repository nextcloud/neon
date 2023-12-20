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

  Client.fromClient(DynamiteClient client)
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
    required String shortMessage,
    required String userId,
    String? longMessage,
    ApiGenerateNotificationApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    required String shortMessage,
    required String userId,
    String? longMessage,
    ApiGenerateNotificationApiVersion? apiVersion,
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
    final $shortMessage = jsonSerializers.serialize(shortMessage, specifiedType: const FullType(String));
    _parameters['shortMessage'] = $shortMessage;

    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    _parameters['userId'] = $userId;

    var $longMessage = jsonSerializers.serialize(longMessage, specifiedType: const FullType(String));
    $longMessage ??= '';
    _parameters['longMessage'] = $longMessage;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(ApiGenerateNotificationApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate(
      '/ocs/v2.php/apps/notifications/api/{apiVersion}/admin_notifications/{userId}{?shortMessage*,longMessage*}',
    ).expand(_parameters);
    return DynamiteRawResponse<ApiGenerateNotificationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ApiGenerateNotificationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    EndpointListNotificationsApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    EndpointListNotificationsApiVersion? apiVersion,
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
    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(EndpointListNotificationsApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications').expand(_parameters);
    return DynamiteRawResponse<EndpointListNotificationsResponseApplicationJson,
        EndpointEndpointListNotificationsHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(EndpointListNotificationsResponseApplicationJson),
      headersType: const FullType(EndpointEndpointListNotificationsHeaders),
      serializers: jsonSerializers,
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
    EndpointDeleteAllNotificationsApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    EndpointDeleteAllNotificationsApiVersion? apiVersion,
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
    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(EndpointDeleteAllNotificationsApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications').expand(_parameters);
    return DynamiteRawResponse<EndpointDeleteAllNotificationsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(EndpointDeleteAllNotificationsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    EndpointGetNotificationApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    required int id,
    EndpointGetNotificationApiVersion? apiVersion,
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
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(EndpointGetNotificationApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/{id}').expand(_parameters);
    return DynamiteRawResponse<EndpointGetNotificationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(EndpointGetNotificationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    EndpointDeleteNotificationApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    required int id,
    EndpointDeleteNotificationApiVersion? apiVersion,
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
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(EndpointDeleteNotificationApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/{id}').expand(_parameters);
    return DynamiteRawResponse<EndpointDeleteNotificationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(EndpointDeleteNotificationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required BuiltList<int> ids,
    EndpointConfirmIdsForUserApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    required BuiltList<int> ids,
    EndpointConfirmIdsForUserApiVersion? apiVersion,
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
    final $ids = jsonSerializers.serialize(ids, specifiedType: const FullType(BuiltList, [FullType(int)]));
    _parameters['ids%5B%5D'] = $ids;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(EndpointConfirmIdsForUserApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/exists{?ids%5B%5D*}')
        .expand(_parameters);
    return DynamiteRawResponse<EndpointConfirmIdsForUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 400},
      ),
      bodyType: const FullType(EndpointConfirmIdsForUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String pushTokenHash,
    required String devicePublicKey,
    required String proxyServer,
    PushRegisterDeviceApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    required String pushTokenHash,
    required String devicePublicKey,
    required String proxyServer,
    PushRegisterDeviceApiVersion? apiVersion,
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
    final $pushTokenHash = jsonSerializers.serialize(pushTokenHash, specifiedType: const FullType(String));
    _parameters['pushTokenHash'] = $pushTokenHash;

    final $devicePublicKey = jsonSerializers.serialize(devicePublicKey, specifiedType: const FullType(String));
    _parameters['devicePublicKey'] = $devicePublicKey;

    final $proxyServer = jsonSerializers.serialize(proxyServer, specifiedType: const FullType(String));
    _parameters['proxyServer'] = $proxyServer;

    var $apiVersion =
        jsonSerializers.serialize(apiVersion, specifiedType: const FullType(PushRegisterDeviceApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate(
      '/ocs/v2.php/apps/notifications/api/{apiVersion}/push{?pushTokenHash*,devicePublicKey*,proxyServer*}',
    ).expand(_parameters);
    return DynamiteRawResponse<PushRegisterDeviceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 201},
      ),
      bodyType: const FullType(PushRegisterDeviceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    PushRemoveDeviceApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    PushRemoveDeviceApiVersion? apiVersion,
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
    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(PushRemoveDeviceApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/apps/notifications/api/{apiVersion}/push').expand(_parameters);
    return DynamiteRawResponse<PushRemoveDeviceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200, 202, 401},
      ),
      bodyType: const FullType(PushRemoveDeviceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int batchSetting,
    required String soundNotification,
    required String soundTalk,
    SettingsPersonalApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    required int batchSetting,
    required String soundNotification,
    required String soundTalk,
    SettingsPersonalApiVersion? apiVersion,
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
    final $batchSetting = jsonSerializers.serialize(batchSetting, specifiedType: const FullType(int));
    _parameters['batchSetting'] = $batchSetting;

    final $soundNotification = jsonSerializers.serialize(soundNotification, specifiedType: const FullType(String));
    _parameters['soundNotification'] = $soundNotification;

    final $soundTalk = jsonSerializers.serialize(soundTalk, specifiedType: const FullType(String));
    _parameters['soundTalk'] = $soundTalk;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SettingsPersonalApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate(
      '/ocs/v2.php/apps/notifications/api/{apiVersion}/settings{?batchSetting*,soundNotification*,soundTalk*}',
    ).expand(_parameters);
    return DynamiteRawResponse<SettingsPersonalResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SettingsPersonalResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int batchSetting,
    required String soundNotification,
    required String soundTalk,
    SettingsAdminApiVersion? apiVersion,
    bool? oCSAPIRequest,
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
    required int batchSetting,
    required String soundNotification,
    required String soundTalk,
    SettingsAdminApiVersion? apiVersion,
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
    final $batchSetting = jsonSerializers.serialize(batchSetting, specifiedType: const FullType(int));
    _parameters['batchSetting'] = $batchSetting;

    final $soundNotification = jsonSerializers.serialize(soundNotification, specifiedType: const FullType(String));
    _parameters['soundNotification'] = $soundNotification;

    final $soundTalk = jsonSerializers.serialize(soundTalk, specifiedType: const FullType(String));
    _parameters['soundTalk'] = $soundTalk;

    var $apiVersion = jsonSerializers.serialize(apiVersion, specifiedType: const FullType(SettingsAdminApiVersion));
    $apiVersion ??= 'v2';
    _parameters['apiVersion'] = $apiVersion;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate(
      '/ocs/v2.php/apps/notifications/api/{apiVersion}/settings/admin{?batchSetting*,soundNotification*,soundTalk*}',
    ).expand(_parameters);
    return DynamiteRawResponse<SettingsAdminResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(SettingsAdminResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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

  static ApiGenerateNotificationApiVersion valueOf(String name) => _$valueOfApiGenerateNotificationApiVersion(name);

  static Serializer<ApiGenerateNotificationApiVersion> get serializer => _$apiGenerateNotificationApiVersionSerializer;
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
abstract interface class $ApiGenerateNotificationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ApiGenerateNotificationResponseApplicationJson_Ocs
    implements
        $ApiGenerateNotificationResponseApplicationJson_OcsInterface,
        Built<ApiGenerateNotificationResponseApplicationJson_Ocs,
            ApiGenerateNotificationResponseApplicationJson_OcsBuilder> {
  factory ApiGenerateNotificationResponseApplicationJson_Ocs([
    void Function(ApiGenerateNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ApiGenerateNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGenerateNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGenerateNotificationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiGenerateNotificationResponseApplicationJson_Ocs> get serializer =>
      _$apiGenerateNotificationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGenerateNotificationResponseApplicationJsonInterface {
  ApiGenerateNotificationResponseApplicationJson_Ocs get ocs;
}

abstract class ApiGenerateNotificationResponseApplicationJson
    implements
        $ApiGenerateNotificationResponseApplicationJsonInterface,
        Built<ApiGenerateNotificationResponseApplicationJson, ApiGenerateNotificationResponseApplicationJsonBuilder> {
  factory ApiGenerateNotificationResponseApplicationJson([
    void Function(ApiGenerateNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$ApiGenerateNotificationResponseApplicationJson;

  // coverage:ignore-start
  const ApiGenerateNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGenerateNotificationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static EndpointListNotificationsApiVersion valueOf(String name) => _$valueOfEndpointListNotificationsApiVersion(name);

  static Serializer<EndpointListNotificationsApiVersion> get serializer =>
      _$endpointListNotificationsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointEndpointListNotificationsHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-user-status')
  String? get xNextcloudUserStatus;
}

abstract class EndpointEndpointListNotificationsHeaders
    implements
        $EndpointEndpointListNotificationsHeadersInterface,
        Built<EndpointEndpointListNotificationsHeaders, EndpointEndpointListNotificationsHeadersBuilder> {
  factory EndpointEndpointListNotificationsHeaders([
    void Function(EndpointEndpointListNotificationsHeadersBuilder)? b,
  ]) = _$EndpointEndpointListNotificationsHeaders;

  // coverage:ignore-start
  const EndpointEndpointListNotificationsHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointEndpointListNotificationsHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EndpointEndpointListNotificationsHeaders> get serializer =>
      _$endpointEndpointListNotificationsHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NotificationActionInterface {
  String get label;
  String get link;
  String get type;
  bool get primary;
}

abstract class NotificationAction
    implements $NotificationActionInterface, Built<NotificationAction, NotificationActionBuilder> {
  factory NotificationAction([void Function(NotificationActionBuilder)? b]) = _$NotificationAction;

  // coverage:ignore-start
  const NotificationAction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationAction.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotificationAction> get serializer => _$notificationActionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NotificationInterface {
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

abstract class Notification implements $NotificationInterface, Built<Notification, NotificationBuilder> {
  factory Notification([void Function(NotificationBuilder)? b]) = _$Notification;

  // coverage:ignore-start
  const Notification._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Notification.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Notification> get serializer => _$notificationSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointListNotificationsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Notification> get data;
}

abstract class EndpointListNotificationsResponseApplicationJson_Ocs
    implements
        $EndpointListNotificationsResponseApplicationJson_OcsInterface,
        Built<EndpointListNotificationsResponseApplicationJson_Ocs,
            EndpointListNotificationsResponseApplicationJson_OcsBuilder> {
  factory EndpointListNotificationsResponseApplicationJson_Ocs([
    void Function(EndpointListNotificationsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointListNotificationsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointListNotificationsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointListNotificationsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EndpointListNotificationsResponseApplicationJson_Ocs> get serializer =>
      _$endpointListNotificationsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointListNotificationsResponseApplicationJsonInterface {
  EndpointListNotificationsResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointListNotificationsResponseApplicationJson
    implements
        $EndpointListNotificationsResponseApplicationJsonInterface,
        Built<EndpointListNotificationsResponseApplicationJson,
            EndpointListNotificationsResponseApplicationJsonBuilder> {
  factory EndpointListNotificationsResponseApplicationJson([
    void Function(EndpointListNotificationsResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointListNotificationsResponseApplicationJson;

  // coverage:ignore-start
  const EndpointListNotificationsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointListNotificationsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static EndpointDeleteAllNotificationsApiVersion valueOf(String name) =>
      _$valueOfEndpointDeleteAllNotificationsApiVersion(name);

  static Serializer<EndpointDeleteAllNotificationsApiVersion> get serializer =>
      _$endpointDeleteAllNotificationsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointDeleteAllNotificationsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class EndpointDeleteAllNotificationsResponseApplicationJson_Ocs
    implements
        $EndpointDeleteAllNotificationsResponseApplicationJson_OcsInterface,
        Built<EndpointDeleteAllNotificationsResponseApplicationJson_Ocs,
            EndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder> {
  factory EndpointDeleteAllNotificationsResponseApplicationJson_Ocs([
    void Function(EndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointDeleteAllNotificationsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointDeleteAllNotificationsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteAllNotificationsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EndpointDeleteAllNotificationsResponseApplicationJson_Ocs> get serializer =>
      _$endpointDeleteAllNotificationsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointDeleteAllNotificationsResponseApplicationJsonInterface {
  EndpointDeleteAllNotificationsResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointDeleteAllNotificationsResponseApplicationJson
    implements
        $EndpointDeleteAllNotificationsResponseApplicationJsonInterface,
        Built<EndpointDeleteAllNotificationsResponseApplicationJson,
            EndpointDeleteAllNotificationsResponseApplicationJsonBuilder> {
  factory EndpointDeleteAllNotificationsResponseApplicationJson([
    void Function(EndpointDeleteAllNotificationsResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointDeleteAllNotificationsResponseApplicationJson;

  // coverage:ignore-start
  const EndpointDeleteAllNotificationsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteAllNotificationsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static EndpointGetNotificationApiVersion valueOf(String name) => _$valueOfEndpointGetNotificationApiVersion(name);

  static Serializer<EndpointGetNotificationApiVersion> get serializer => _$endpointGetNotificationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointGetNotificationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Notification get data;
}

abstract class EndpointGetNotificationResponseApplicationJson_Ocs
    implements
        $EndpointGetNotificationResponseApplicationJson_OcsInterface,
        Built<EndpointGetNotificationResponseApplicationJson_Ocs,
            EndpointGetNotificationResponseApplicationJson_OcsBuilder> {
  factory EndpointGetNotificationResponseApplicationJson_Ocs([
    void Function(EndpointGetNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointGetNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointGetNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointGetNotificationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EndpointGetNotificationResponseApplicationJson_Ocs> get serializer =>
      _$endpointGetNotificationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointGetNotificationResponseApplicationJsonInterface {
  EndpointGetNotificationResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointGetNotificationResponseApplicationJson
    implements
        $EndpointGetNotificationResponseApplicationJsonInterface,
        Built<EndpointGetNotificationResponseApplicationJson, EndpointGetNotificationResponseApplicationJsonBuilder> {
  factory EndpointGetNotificationResponseApplicationJson([
    void Function(EndpointGetNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointGetNotificationResponseApplicationJson;

  // coverage:ignore-start
  const EndpointGetNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointGetNotificationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static EndpointDeleteNotificationApiVersion valueOf(String name) =>
      _$valueOfEndpointDeleteNotificationApiVersion(name);

  static Serializer<EndpointDeleteNotificationApiVersion> get serializer =>
      _$endpointDeleteNotificationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointDeleteNotificationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class EndpointDeleteNotificationResponseApplicationJson_Ocs
    implements
        $EndpointDeleteNotificationResponseApplicationJson_OcsInterface,
        Built<EndpointDeleteNotificationResponseApplicationJson_Ocs,
            EndpointDeleteNotificationResponseApplicationJson_OcsBuilder> {
  factory EndpointDeleteNotificationResponseApplicationJson_Ocs([
    void Function(EndpointDeleteNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointDeleteNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointDeleteNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteNotificationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EndpointDeleteNotificationResponseApplicationJson_Ocs> get serializer =>
      _$endpointDeleteNotificationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointDeleteNotificationResponseApplicationJsonInterface {
  EndpointDeleteNotificationResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointDeleteNotificationResponseApplicationJson
    implements
        $EndpointDeleteNotificationResponseApplicationJsonInterface,
        Built<EndpointDeleteNotificationResponseApplicationJson,
            EndpointDeleteNotificationResponseApplicationJsonBuilder> {
  factory EndpointDeleteNotificationResponseApplicationJson([
    void Function(EndpointDeleteNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointDeleteNotificationResponseApplicationJson;

  // coverage:ignore-start
  const EndpointDeleteNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointDeleteNotificationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static EndpointConfirmIdsForUserApiVersion valueOf(String name) => _$valueOfEndpointConfirmIdsForUserApiVersion(name);

  static Serializer<EndpointConfirmIdsForUserApiVersion> get serializer =>
      _$endpointConfirmIdsForUserApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointConfirmIdsForUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<int> get data;
}

abstract class EndpointConfirmIdsForUserResponseApplicationJson_Ocs
    implements
        $EndpointConfirmIdsForUserResponseApplicationJson_OcsInterface,
        Built<EndpointConfirmIdsForUserResponseApplicationJson_Ocs,
            EndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder> {
  factory EndpointConfirmIdsForUserResponseApplicationJson_Ocs([
    void Function(EndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$EndpointConfirmIdsForUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const EndpointConfirmIdsForUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointConfirmIdsForUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EndpointConfirmIdsForUserResponseApplicationJson_Ocs> get serializer =>
      _$endpointConfirmIdsForUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EndpointConfirmIdsForUserResponseApplicationJsonInterface {
  EndpointConfirmIdsForUserResponseApplicationJson_Ocs get ocs;
}

abstract class EndpointConfirmIdsForUserResponseApplicationJson
    implements
        $EndpointConfirmIdsForUserResponseApplicationJsonInterface,
        Built<EndpointConfirmIdsForUserResponseApplicationJson,
            EndpointConfirmIdsForUserResponseApplicationJsonBuilder> {
  factory EndpointConfirmIdsForUserResponseApplicationJson([
    void Function(EndpointConfirmIdsForUserResponseApplicationJsonBuilder)? b,
  ]) = _$EndpointConfirmIdsForUserResponseApplicationJson;

  // coverage:ignore-start
  const EndpointConfirmIdsForUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EndpointConfirmIdsForUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static PushRegisterDeviceApiVersion valueOf(String name) => _$valueOfPushRegisterDeviceApiVersion(name);

  static Serializer<PushRegisterDeviceApiVersion> get serializer => _$pushRegisterDeviceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PushDeviceInterface {
  String get publicKey;
  String get deviceIdentifier;
  String get signature;
}

abstract class PushDevice implements $PushDeviceInterface, Built<PushDevice, PushDeviceBuilder> {
  factory PushDevice([void Function(PushDeviceBuilder)? b]) = _$PushDevice;

  // coverage:ignore-start
  const PushDevice._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushDevice.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PushDevice> get serializer => _$pushDeviceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PushRegisterDeviceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  PushDevice get data;
}

abstract class PushRegisterDeviceResponseApplicationJson_Ocs
    implements
        $PushRegisterDeviceResponseApplicationJson_OcsInterface,
        Built<PushRegisterDeviceResponseApplicationJson_Ocs, PushRegisterDeviceResponseApplicationJson_OcsBuilder> {
  factory PushRegisterDeviceResponseApplicationJson_Ocs([
    void Function(PushRegisterDeviceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PushRegisterDeviceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PushRegisterDeviceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRegisterDeviceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PushRegisterDeviceResponseApplicationJson_Ocs> get serializer =>
      _$pushRegisterDeviceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PushRegisterDeviceResponseApplicationJsonInterface {
  PushRegisterDeviceResponseApplicationJson_Ocs get ocs;
}

abstract class PushRegisterDeviceResponseApplicationJson
    implements
        $PushRegisterDeviceResponseApplicationJsonInterface,
        Built<PushRegisterDeviceResponseApplicationJson, PushRegisterDeviceResponseApplicationJsonBuilder> {
  factory PushRegisterDeviceResponseApplicationJson([
    void Function(PushRegisterDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$PushRegisterDeviceResponseApplicationJson;

  // coverage:ignore-start
  const PushRegisterDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRegisterDeviceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static PushRemoveDeviceApiVersion valueOf(String name) => _$valueOfPushRemoveDeviceApiVersion(name);

  static Serializer<PushRemoveDeviceApiVersion> get serializer => _$pushRemoveDeviceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PushRemoveDeviceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class PushRemoveDeviceResponseApplicationJson_Ocs
    implements
        $PushRemoveDeviceResponseApplicationJson_OcsInterface,
        Built<PushRemoveDeviceResponseApplicationJson_Ocs, PushRemoveDeviceResponseApplicationJson_OcsBuilder> {
  factory PushRemoveDeviceResponseApplicationJson_Ocs([
    void Function(PushRemoveDeviceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$PushRemoveDeviceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const PushRemoveDeviceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRemoveDeviceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<PushRemoveDeviceResponseApplicationJson_Ocs> get serializer =>
      _$pushRemoveDeviceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $PushRemoveDeviceResponseApplicationJsonInterface {
  PushRemoveDeviceResponseApplicationJson_Ocs get ocs;
}

abstract class PushRemoveDeviceResponseApplicationJson
    implements
        $PushRemoveDeviceResponseApplicationJsonInterface,
        Built<PushRemoveDeviceResponseApplicationJson, PushRemoveDeviceResponseApplicationJsonBuilder> {
  factory PushRemoveDeviceResponseApplicationJson([void Function(PushRemoveDeviceResponseApplicationJsonBuilder)? b]) =
      _$PushRemoveDeviceResponseApplicationJson;

  // coverage:ignore-start
  const PushRemoveDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory PushRemoveDeviceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static SettingsPersonalApiVersion valueOf(String name) => _$valueOfSettingsPersonalApiVersion(name);

  static Serializer<SettingsPersonalApiVersion> get serializer => _$settingsPersonalApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsPersonalResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class SettingsPersonalResponseApplicationJson_Ocs
    implements
        $SettingsPersonalResponseApplicationJson_OcsInterface,
        Built<SettingsPersonalResponseApplicationJson_Ocs, SettingsPersonalResponseApplicationJson_OcsBuilder> {
  factory SettingsPersonalResponseApplicationJson_Ocs([
    void Function(SettingsPersonalResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SettingsPersonalResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SettingsPersonalResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsPersonalResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SettingsPersonalResponseApplicationJson_Ocs> get serializer =>
      _$settingsPersonalResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsPersonalResponseApplicationJsonInterface {
  SettingsPersonalResponseApplicationJson_Ocs get ocs;
}

abstract class SettingsPersonalResponseApplicationJson
    implements
        $SettingsPersonalResponseApplicationJsonInterface,
        Built<SettingsPersonalResponseApplicationJson, SettingsPersonalResponseApplicationJsonBuilder> {
  factory SettingsPersonalResponseApplicationJson([void Function(SettingsPersonalResponseApplicationJsonBuilder)? b]) =
      _$SettingsPersonalResponseApplicationJson;

  // coverage:ignore-start
  const SettingsPersonalResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsPersonalResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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

  static SettingsAdminApiVersion valueOf(String name) => _$valueOfSettingsAdminApiVersion(name);

  static Serializer<SettingsAdminApiVersion> get serializer => _$settingsAdminApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsAdminResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class SettingsAdminResponseApplicationJson_Ocs
    implements
        $SettingsAdminResponseApplicationJson_OcsInterface,
        Built<SettingsAdminResponseApplicationJson_Ocs, SettingsAdminResponseApplicationJson_OcsBuilder> {
  factory SettingsAdminResponseApplicationJson_Ocs([
    void Function(SettingsAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$SettingsAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const SettingsAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsAdminResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SettingsAdminResponseApplicationJson_Ocs> get serializer =>
      _$settingsAdminResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsAdminResponseApplicationJsonInterface {
  SettingsAdminResponseApplicationJson_Ocs get ocs;
}

abstract class SettingsAdminResponseApplicationJson
    implements
        $SettingsAdminResponseApplicationJsonInterface,
        Built<SettingsAdminResponseApplicationJson, SettingsAdminResponseApplicationJsonBuilder> {
  factory SettingsAdminResponseApplicationJson([void Function(SettingsAdminResponseApplicationJsonBuilder)? b]) =
      _$SettingsAdminResponseApplicationJson;

  // coverage:ignore-start
  const SettingsAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsAdminResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SettingsAdminResponseApplicationJson> get serializer =>
      _$settingsAdminResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_NotificationsInterface {
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String> get ocsEndpoints;
  BuiltList<String> get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String> get adminNotifications;
}

abstract class Capabilities_Notifications
    implements
        $Capabilities_NotificationsInterface,
        Built<Capabilities_Notifications, Capabilities_NotificationsBuilder> {
  factory Capabilities_Notifications([void Function(Capabilities_NotificationsBuilder)? b]) =
      _$Capabilities_Notifications;

  // coverage:ignore-start
  const Capabilities_Notifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Notifications.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_Notifications> get serializer => _$capabilitiesNotificationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CapabilitiesInterface {
  Capabilities_Notifications get notifications;
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

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..add(ApiGenerateNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(ApiGenerateNotificationResponseApplicationJson),
        ApiGenerateNotificationResponseApplicationJsonBuilder.new,
      )
      ..add(ApiGenerateNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiGenerateNotificationResponseApplicationJson_Ocs),
        ApiGenerateNotificationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiGenerateNotificationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..add(EndpointListNotificationsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointEndpointListNotificationsHeaders),
        EndpointEndpointListNotificationsHeadersBuilder.new,
      )
      ..add(EndpointEndpointListNotificationsHeaders.serializer)
      ..addBuilderFactory(
        const FullType(EndpointListNotificationsResponseApplicationJson),
        EndpointListNotificationsResponseApplicationJsonBuilder.new,
      )
      ..add(EndpointListNotificationsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointListNotificationsResponseApplicationJson_Ocs),
        EndpointListNotificationsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(EndpointListNotificationsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Notification), NotificationBuilder.new)
      ..add(Notification.serializer)
      ..addBuilderFactory(const FullType(NotificationAction), NotificationActionBuilder.new)
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
        EndpointDeleteAllNotificationsResponseApplicationJsonBuilder.new,
      )
      ..add(EndpointDeleteAllNotificationsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointDeleteAllNotificationsResponseApplicationJson_Ocs),
        EndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(EndpointDeleteAllNotificationsResponseApplicationJson_Ocs.serializer)
      ..add(EndpointGetNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointGetNotificationResponseApplicationJson),
        EndpointGetNotificationResponseApplicationJsonBuilder.new,
      )
      ..add(EndpointGetNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointGetNotificationResponseApplicationJson_Ocs),
        EndpointGetNotificationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(EndpointGetNotificationResponseApplicationJson_Ocs.serializer)
      ..add(EndpointDeleteNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointDeleteNotificationResponseApplicationJson),
        EndpointDeleteNotificationResponseApplicationJsonBuilder.new,
      )
      ..add(EndpointDeleteNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointDeleteNotificationResponseApplicationJson_Ocs),
        EndpointDeleteNotificationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(EndpointDeleteNotificationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..add(EndpointConfirmIdsForUserApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(EndpointConfirmIdsForUserResponseApplicationJson),
        EndpointConfirmIdsForUserResponseApplicationJsonBuilder.new,
      )
      ..add(EndpointConfirmIdsForUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(EndpointConfirmIdsForUserResponseApplicationJson_Ocs),
        EndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(EndpointConfirmIdsForUserResponseApplicationJson_Ocs.serializer)
      ..add(PushRegisterDeviceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PushRegisterDeviceResponseApplicationJson),
        PushRegisterDeviceResponseApplicationJsonBuilder.new,
      )
      ..add(PushRegisterDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PushRegisterDeviceResponseApplicationJson_Ocs),
        PushRegisterDeviceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PushRegisterDeviceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(PushDevice), PushDeviceBuilder.new)
      ..add(PushDevice.serializer)
      ..add(PushRemoveDeviceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(PushRemoveDeviceResponseApplicationJson),
        PushRemoveDeviceResponseApplicationJsonBuilder.new,
      )
      ..add(PushRemoveDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(PushRemoveDeviceResponseApplicationJson_Ocs),
        PushRemoveDeviceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(PushRemoveDeviceResponseApplicationJson_Ocs.serializer)
      ..add(SettingsPersonalApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SettingsPersonalResponseApplicationJson),
        SettingsPersonalResponseApplicationJsonBuilder.new,
      )
      ..add(SettingsPersonalResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SettingsPersonalResponseApplicationJson_Ocs),
        SettingsPersonalResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SettingsPersonalResponseApplicationJson_Ocs.serializer)
      ..add(SettingsAdminApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(SettingsAdminResponseApplicationJson),
        SettingsAdminResponseApplicationJsonBuilder.new,
      )
      ..add(SettingsAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(SettingsAdminResponseApplicationJson_Ocs),
        SettingsAdminResponseApplicationJson_OcsBuilder.new,
      )
      ..add(SettingsAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_Notifications), Capabilities_NotificationsBuilder.new)
      ..add(Capabilities_Notifications.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
