// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'core.openapi.g.dart';

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

  AppPasswordClient get appPassword => AppPasswordClient(this);

  AutoCompleteClient get autoComplete => AutoCompleteClient(this);

  AvatarClient get avatar => AvatarClient(this);

  ClientFlowLoginV2Client get clientFlowLoginV2 => ClientFlowLoginV2Client(this);

  CollaborationResourcesClient get collaborationResources => CollaborationResourcesClient(this);

  GuestAvatarClient get guestAvatar => GuestAvatarClient(this);

  HoverCardClient get hoverCard => HoverCardClient(this);

  NavigationClient get navigation => NavigationClient(this);

  OcmClient get ocm => OcmClient(this);

  OcsClient get ocs => OcsClient(this);

  PreviewClient get preview => PreviewClient(this);

  ProfileApiClient get profileApi => ProfileApiClient(this);

  ReferenceClient get reference => ReferenceClient(this);

  ReferenceApiClient get referenceApi => ReferenceApiClient(this);

  TextProcessingApiClient get textProcessingApi => TextProcessingApiClient(this);

  TranslationApiClient get translationApi => TranslationApiClient(this);

  UnifiedSearchClient get unifiedSearch => UnifiedSearchClient(this);

  WhatsNewClient get whatsNew => WhatsNewClient(this);

  WipeClient get wipe => WipeClient(this);

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Status returned
  ///
  /// See:
  ///  * [getStatusRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Status, void>> getStatus() async {
    final rawResponse = getStatusRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Status returned
  ///
  /// See:
  ///  * [getStatus] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Status, void> getStatusRaw() {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    const path = '/status.php';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Status, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Status),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class AppPasswordClient {
  AppPasswordClient(this._rootClient);

  final Client _rootClient;

  /// Create app password.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App password returned
  ///   * 403: Creating app password is not allowed
  ///
  /// See:
  ///  * [getAppPasswordRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppPasswordGetAppPasswordResponseApplicationJson, void>> getAppPassword({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppPasswordRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create app password.
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
  ///   * 200: App password returned
  ///   * 403: Creating app password is not allowed
  ///
  /// See:
  ///  * [getAppPassword] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppPasswordGetAppPasswordResponseApplicationJson, void> getAppPasswordRaw({
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
    const path = '/ocs/v2.php/core/getapppassword';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<AppPasswordGetAppPasswordResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppPasswordGetAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Rotate app password.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App password returned
  ///   * 403: Rotating app password is not allowed
  ///
  /// See:
  ///  * [rotateAppPasswordRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppPasswordRotateAppPasswordResponseApplicationJson, void>> rotateAppPassword({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = rotateAppPasswordRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Rotate app password.
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
  ///   * 200: App password returned
  ///   * 403: Rotating app password is not allowed
  ///
  /// See:
  ///  * [rotateAppPassword] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppPasswordRotateAppPasswordResponseApplicationJson, void> rotateAppPasswordRaw({
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
    const path = '/ocs/v2.php/core/apppassword/rotate';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<AppPasswordRotateAppPasswordResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppPasswordRotateAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete app password.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: App password deleted successfully
  ///   * 403: Deleting app password is not allowed
  ///
  /// See:
  ///  * [deleteAppPasswordRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AppPasswordDeleteAppPasswordResponseApplicationJson, void>> deleteAppPassword({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteAppPasswordRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete app password.
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
  ///   * 200: App password deleted successfully
  ///   * 403: Deleting app password is not allowed
  ///
  /// See:
  ///  * [deleteAppPassword] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AppPasswordDeleteAppPasswordResponseApplicationJson, void> deleteAppPasswordRaw({
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
    const path = '/ocs/v2.php/core/apppassword';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<AppPasswordDeleteAppPasswordResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class AutoCompleteClient {
  AutoCompleteClient(this._rootClient);

  final Client _rootClient;

  /// Autocomplete a query.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for.
  ///   * [itemType] Type of the items to search for.
  ///   * [itemId] ID of the items to search for.
  ///   * [sorter] can be piped, top prio first, e.g.: "commenters|share-recipients".
  ///   * [shareTypes] Types of shares to search for.
  ///   * [limit] Maximum number of results to return. Defaults to `10`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Autocomplete results returned
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<AutoCompleteGetResponseApplicationJson, void>> $get({
    required final String search,
    final String? itemType,
    final String? itemId,
    final String? sorter,
    final List<int>? shareTypes,
    final int limit = 10,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = $getRaw(
      search: search,
      itemType: itemType,
      itemId: itemId,
      sorter: sorter,
      shareTypes: shareTypes,
      limit: limit,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Autocomplete a query.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for.
  ///   * [itemType] Type of the items to search for.
  ///   * [itemId] ID of the items to search for.
  ///   * [sorter] can be piped, top prio first, e.g.: "commenters|share-recipients".
  ///   * [shareTypes] Types of shares to search for.
  ///   * [limit] Maximum number of results to return. Defaults to `10`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Autocomplete results returned
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<AutoCompleteGetResponseApplicationJson, void> $getRaw({
    required final String search,
    final String? itemType,
    final String? itemId,
    final String? sorter,
    final List<int>? shareTypes,
    final int limit = 10,
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
    queryParameters['search'] = search;
    if (itemType != null) {
      queryParameters['itemType'] = itemType;
    }
    if (itemId != null) {
      queryParameters['itemId'] = itemId;
    }
    if (sorter != null) {
      queryParameters['sorter'] = sorter;
    }
    if (shareTypes != null) {
      queryParameters['shareTypes[]'] = shareTypes.map((final e) => e.toString());
    }
    if (limit != 10) {
      queryParameters['limit'] = limit.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/core/autocomplete/get';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<AutoCompleteGetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(AutoCompleteGetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

/// Class AvatarController.
class AvatarClient {
  AvatarClient(this._rootClient);

  final Client _rootClient;

  /// Get the dark avatar.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [size] Size of the avatar.
  ///
  /// Status codes:
  ///   * 200: Avatar returned
  ///   * 404: Avatar not found
  ///
  /// See:
  ///  * [getAvatarDarkRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, AvatarAvatarGetAvatarDarkHeaders>> getAvatarDark({
    required final String userId,
    required final int size,
  }) async {
    final rawResponse = getAvatarDarkRaw(
      userId: userId,
      size: size,
    );

    return rawResponse.future;
  }

  /// Get the dark avatar.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [size] Size of the avatar.
  ///
  /// Status codes:
  ///   * 200: Avatar returned
  ///   * 404: Avatar not found
  ///
  /// See:
  ///  * [getAvatarDark] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, AvatarAvatarGetAvatarDarkHeaders> getAvatarDarkRaw({
    required final String userId,
    required final int size,
  }) {
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
    final userId0 = Uri.encodeQueryComponent(userId);
    final size0 = Uri.encodeQueryComponent(size.toString());
    final path = '/index.php/avatar/$userId0/$size0/dark';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Uint8List, AvatarAvatarGetAvatarDarkHeaders>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(AvatarAvatarGetAvatarDarkHeaders),
      serializers: _jsonSerializers,
    );
  }

  /// Get the avatar.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [size] Size of the avatar.
  ///
  /// Status codes:
  ///   * 200: Avatar returned
  ///   * 404: Avatar not found
  ///
  /// See:
  ///  * [getAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, AvatarAvatarGetAvatarHeaders>> getAvatar({
    required final String userId,
    required final int size,
  }) async {
    final rawResponse = getAvatarRaw(
      userId: userId,
      size: size,
    );

    return rawResponse.future;
  }

  /// Get the avatar.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [size] Size of the avatar.
  ///
  /// Status codes:
  ///   * 200: Avatar returned
  ///   * 404: Avatar not found
  ///
  /// See:
  ///  * [getAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, AvatarAvatarGetAvatarHeaders> getAvatarRaw({
    required final String userId,
    required final int size,
  }) {
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
    final userId0 = Uri.encodeQueryComponent(userId);
    final size0 = Uri.encodeQueryComponent(size.toString());
    final path = '/index.php/avatar/$userId0/$size0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Uint8List, AvatarAvatarGetAvatarHeaders>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(AvatarAvatarGetAvatarHeaders),
      serializers: _jsonSerializers,
    );
  }
}

class ClientFlowLoginV2Client {
  ClientFlowLoginV2Client(this._rootClient);

  final Client _rootClient;

  /// Poll the login flow credentials.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] Token of the flow.
  ///
  /// Status codes:
  ///   * 200: Login flow credentials returned
  ///   * 404: Login flow not found or completed
  ///
  /// See:
  ///  * [pollRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<LoginFlowV2Credentials, void>> poll({required final String token}) async {
    final rawResponse = pollRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Poll the login flow credentials.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] Token of the flow.
  ///
  /// Status codes:
  ///   * 200: Login flow credentials returned
  ///   * 404: Login flow not found or completed
  ///
  /// See:
  ///  * [poll] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<LoginFlowV2Credentials, void> pollRaw({required final String token}) {
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
    queryParameters['token'] = token;
    const path = '/index.php/login/v2/poll';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<LoginFlowV2Credentials, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(LoginFlowV2Credentials),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Init a login flow.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Login flow init returned
  ///
  /// See:
  ///  * [initRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<LoginFlowV2, void>> init() async {
    final rawResponse = initRaw();

    return rawResponse.future;
  }

  /// Init a login flow.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Login flow init returned
  ///
  /// See:
  ///  * [init] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<LoginFlowV2, void> initRaw() {
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
    const path = '/index.php/login/v2';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<LoginFlowV2, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(LoginFlowV2),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CollaborationResourcesClient {
  CollaborationResourcesClient(this._rootClient);

  final Client _rootClient;

  /// Search for collections.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filter] Filter collections.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collections returned
  ///   * 404: Collection not found
  ///
  /// See:
  ///  * [searchCollectionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CollaborationResourcesSearchCollectionsResponseApplicationJson, void>> searchCollections({
    required final String filter,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = searchCollectionsRaw(
      filter: filter,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Search for collections.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filter] Filter collections.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collections returned
  ///   * 404: Collection not found
  ///
  /// See:
  ///  * [searchCollections] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CollaborationResourcesSearchCollectionsResponseApplicationJson, void> searchCollectionsRaw({
    required final String filter,
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
    final filter0 = Uri.encodeQueryComponent(filter);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/collaboration/resources/collections/search/$filter0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<CollaborationResourcesSearchCollectionsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a collection.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection not found
  ///   * 500
  ///
  /// See:
  ///  * [listCollectionRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CollaborationResourcesListCollectionResponseApplicationJson, void>> listCollection({
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = listCollectionRaw(
      collectionId: collectionId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a collection.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection not found
  ///   * 500
  ///
  /// See:
  ///  * [listCollection] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CollaborationResourcesListCollectionResponseApplicationJson, void> listCollectionRaw({
    required final int collectionId,
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
    final collectionId0 = Uri.encodeQueryComponent(collectionId.toString());
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/collaboration/resources/collections/$collectionId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<CollaborationResourcesListCollectionResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesListCollectionResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Rename a collection.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [collectionName] New name.
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection not found
  ///   * 500
  ///
  /// See:
  ///  * [renameCollectionRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CollaborationResourcesRenameCollectionResponseApplicationJson, void>> renameCollection({
    required final String collectionName,
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = renameCollectionRaw(
      collectionName: collectionName,
      collectionId: collectionId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Rename a collection.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [collectionName] New name.
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection not found
  ///   * 500
  ///
  /// See:
  ///  * [renameCollection] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CollaborationResourcesRenameCollectionResponseApplicationJson, void> renameCollectionRaw({
    required final String collectionName,
    required final int collectionId,
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
    queryParameters['collectionName'] = collectionName;
    final collectionId0 = Uri.encodeQueryComponent(collectionId.toString());
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/collaboration/resources/collections/$collectionId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<CollaborationResourcesRenameCollectionResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Add a resource to a collection.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [resourceType] Name of the resource.
  ///   * [resourceId] ID of the resource.
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection not found or resource inaccessible
  ///   * 500
  ///
  /// See:
  ///  * [addResourceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CollaborationResourcesAddResourceResponseApplicationJson, void>> addResource({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = addResourceRaw(
      resourceType: resourceType,
      resourceId: resourceId,
      collectionId: collectionId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Add a resource to a collection.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [resourceType] Name of the resource.
  ///   * [resourceId] ID of the resource.
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection not found or resource inaccessible
  ///   * 500
  ///
  /// See:
  ///  * [addResource] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CollaborationResourcesAddResourceResponseApplicationJson, void> addResourceRaw({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
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
    queryParameters['resourceType'] = resourceType;
    queryParameters['resourceId'] = resourceId;
    final collectionId0 = Uri.encodeQueryComponent(collectionId.toString());
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/collaboration/resources/collections/$collectionId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<CollaborationResourcesAddResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesAddResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Remove a resource from a collection.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [resourceType] Name of the resource.
  ///   * [resourceId] ID of the resource.
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection or resource not found
  ///   * 500
  ///
  /// See:
  ///  * [removeResourceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CollaborationResourcesRemoveResourceResponseApplicationJson, void>> removeResource({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = removeResourceRaw(
      resourceType: resourceType,
      resourceId: resourceId,
      collectionId: collectionId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a resource from a collection.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [resourceType] Name of the resource.
  ///   * [resourceId] ID of the resource.
  ///   * [collectionId] ID of the collection.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 404: Collection or resource not found
  ///   * 500
  ///
  /// See:
  ///  * [removeResource] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CollaborationResourcesRemoveResourceResponseApplicationJson, void> removeResourceRaw({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
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
    queryParameters['resourceType'] = resourceType;
    queryParameters['resourceId'] = resourceId;
    final collectionId0 = Uri.encodeQueryComponent(collectionId.toString());
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/collaboration/resources/collections/$collectionId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<CollaborationResourcesRemoveResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get collections by resource.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [resourceType] Type of the resource.
  ///   * [resourceId] ID of the resource.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collections returned
  ///   * 404: Resource not accessible
  ///
  /// See:
  ///  * [getCollectionsByResourceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson, void>>
      getCollectionsByResource({
    required final String resourceType,
    required final String resourceId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getCollectionsByResourceRaw(
      resourceType: resourceType,
      resourceId: resourceId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get collections by resource.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [resourceType] Type of the resource.
  ///   * [resourceId] ID of the resource.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collections returned
  ///   * 404: Resource not accessible
  ///
  /// See:
  ///  * [getCollectionsByResource] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson, void>
      getCollectionsByResourceRaw({
    required final String resourceType,
    required final String resourceId,
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
    final resourceType0 = Uri.encodeQueryComponent(resourceType);
    final resourceId0 = Uri.encodeQueryComponent(resourceId);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/collaboration/resources/$resourceType0/$resourceId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a collection for a resource.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name] Name of the collection.
  ///   * [baseResourceType] Type of the base resource.
  ///   * [baseResourceId] ID of the base resource.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 400: Creating collection is not possible
  ///   * 404: Resource inaccessible
  ///   * 500
  ///
  /// See:
  ///  * [createCollectionOnResourceRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson, void>>
      createCollectionOnResource({
    required final String name,
    required final String baseResourceType,
    required final String baseResourceId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = createCollectionOnResourceRaw(
      name: name,
      baseResourceType: baseResourceType,
      baseResourceId: baseResourceId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a collection for a resource.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name] Name of the collection.
  ///   * [baseResourceType] Type of the base resource.
  ///   * [baseResourceId] ID of the base resource.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Collection returned
  ///   * 400: Creating collection is not possible
  ///   * 404: Resource inaccessible
  ///   * 500
  ///
  /// See:
  ///  * [createCollectionOnResource] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson, void>
      createCollectionOnResourceRaw({
    required final String name,
    required final String baseResourceType,
    required final String baseResourceId,
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
    queryParameters['name'] = name;
    final baseResourceType0 = Uri.encodeQueryComponent(baseResourceType);
    final baseResourceId0 = Uri.encodeQueryComponent(baseResourceId);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/collaboration/resources/$baseResourceType0/$baseResourceId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

/// This controller handles guest avatar requests.
class GuestAvatarClient {
  GuestAvatarClient(this._rootClient);

  final Client _rootClient;

  /// Returns a dark guest avatar image response.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [guestName] The guest name, e.g. "Albert".
  ///   * [size] The desired avatar size, e.g. 64 for 64x64px.
  ///
  /// Status codes:
  ///   * 200: Custom avatar returned
  ///   * 201: Avatar returned
  ///   * 500
  ///
  /// See:
  ///  * [getAvatarDarkRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getAvatarDark({
    required final String guestName,
    required final String size,
  }) async {
    final rawResponse = getAvatarDarkRaw(
      guestName: guestName,
      size: size,
    );

    return rawResponse.future;
  }

  /// Returns a dark guest avatar image response.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [guestName] The guest name, e.g. "Albert".
  ///   * [size] The desired avatar size, e.g. 64 for 64x64px.
  ///
  /// Status codes:
  ///   * 200: Custom avatar returned
  ///   * 201: Avatar returned
  ///   * 500
  ///
  /// See:
  ///  * [getAvatarDark] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getAvatarDarkRaw({
    required final String guestName,
    required final String size,
  }) {
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
    final guestName0 = Uri.encodeQueryComponent(guestName);
    final size0 = Uri.encodeQueryComponent(size);
    final path = '/index.php/avatar/guest/$guestName0/$size0/dark';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200, 201},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a guest avatar image response.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [darkTheme] Return dark avatar. Defaults to `0`.
  ///   * [guestName] The guest name, e.g. "Albert".
  ///   * [size] The desired avatar size, e.g. 64 for 64x64px.
  ///
  /// Status codes:
  ///   * 200: Custom avatar returned
  ///   * 201: Avatar returned
  ///   * 500
  ///
  /// See:
  ///  * [getAvatarRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getAvatar({
    required final String guestName,
    required final String size,
    final int? darkTheme = 0,
  }) async {
    final rawResponse = getAvatarRaw(
      guestName: guestName,
      size: size,
      darkTheme: darkTheme,
    );

    return rawResponse.future;
  }

  /// Returns a guest avatar image response.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [darkTheme] Return dark avatar. Defaults to `0`.
  ///   * [guestName] The guest name, e.g. "Albert".
  ///   * [size] The desired avatar size, e.g. 64 for 64x64px.
  ///
  /// Status codes:
  ///   * 200: Custom avatar returned
  ///   * 201: Avatar returned
  ///   * 500
  ///
  /// See:
  ///  * [getAvatar] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getAvatarRaw({
    required final String guestName,
    required final String size,
    final int? darkTheme = 0,
  }) {
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
    final guestName0 = Uri.encodeQueryComponent(guestName);
    final size0 = Uri.encodeQueryComponent(size);
    if (darkTheme != null && darkTheme != 0) {
      queryParameters['darkTheme'] = darkTheme.toString();
    }
    final path = '/index.php/avatar/guest/$guestName0/$size0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200, 201},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class HoverCardClient {
  HoverCardClient(this._rootClient);

  final Client _rootClient;

  /// Get the user details for a hovercard.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [userId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: User details returned
  ///   * 404: User not found
  ///
  /// See:
  ///  * [getUserRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<HoverCardGetUserResponseApplicationJson, void>> getUser({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the user details for a hovercard.
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
  ///   * 200: User details returned
  ///   * 404: User not found
  ///
  /// See:
  ///  * [getUser] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<HoverCardGetUserResponseApplicationJson, void> getUserRaw({
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
    final path = '/ocs/v2.php/hovercard/v1/$userId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<HoverCardGetUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(HoverCardGetUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class NavigationClient {
  NavigationClient(this._rootClient);

  final Client _rootClient;

  /// Get the apps navigation.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [absolute] Rewrite URLs to absolute ones. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps navigation returned
  ///   * 304: No apps navigation changed
  ///
  /// See:
  ///  * [getAppsNavigationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<NavigationGetAppsNavigationResponseApplicationJson, void>> getAppsNavigation({
    final int absolute = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppsNavigationRaw(
      absolute: absolute,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the apps navigation.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [absolute] Rewrite URLs to absolute ones. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps navigation returned
  ///   * 304: No apps navigation changed
  ///
  /// See:
  ///  * [getAppsNavigation] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<NavigationGetAppsNavigationResponseApplicationJson, void> getAppsNavigationRaw({
    final int absolute = 0,
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
    if (absolute != 0) {
      queryParameters['absolute'] = absolute.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/core/navigation/apps';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<NavigationGetAppsNavigationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NavigationGetAppsNavigationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the settings navigation.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [absolute] Rewrite URLs to absolute ones. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps navigation returned
  ///   * 304: No apps navigation changed
  ///
  /// See:
  ///  * [getSettingsNavigationRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<NavigationGetSettingsNavigationResponseApplicationJson, void>> getSettingsNavigation({
    final int absolute = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getSettingsNavigationRaw(
      absolute: absolute,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the settings navigation.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [absolute] Rewrite URLs to absolute ones. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Apps navigation returned
  ///   * 304: No apps navigation changed
  ///
  /// See:
  ///  * [getSettingsNavigation] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<NavigationGetSettingsNavigationResponseApplicationJson, void> getSettingsNavigationRaw({
    final int absolute = 0,
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
    if (absolute != 0) {
      queryParameters['absolute'] = absolute.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/core/navigation/settings';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<NavigationGetSettingsNavigationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NavigationGetSettingsNavigationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

/// Controller about the endpoint /ocm-provider/.
class OcmClient {
  OcmClient(this._rootClient);

  final Client _rootClient;

  /// generate a OCMProvider with local data and send it as DataResponse. This replaces the old PHP file ocm-provider/index.php.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: OCM Provider details returned
  ///   * 500: OCM not supported
  ///
  /// See:
  ///  * [discoveryRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<OcmDiscoveryResponseApplicationJson, OcmOcmDiscoveryHeaders>> discovery() async {
    final rawResponse = discoveryRaw();

    return rawResponse.future;
  }

  /// generate a OCMProvider with local data and send it as DataResponse. This replaces the old PHP file ocm-provider/index.php.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: OCM Provider details returned
  ///   * 500: OCM not supported
  ///
  /// See:
  ///  * [discovery] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<OcmDiscoveryResponseApplicationJson, OcmOcmDiscoveryHeaders> discoveryRaw() {
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
    const path = '/index.php/ocm-provider';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<OcmDiscoveryResponseApplicationJson, OcmOcmDiscoveryHeaders>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(OcmDiscoveryResponseApplicationJson),
      headersType: const FullType(OcmOcmDiscoveryHeaders),
      serializers: _jsonSerializers,
    );
  }
}

class OcsClient {
  OcsClient(this._rootClient);

  final Client _rootClient;

  /// Get the capabilities.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Capabilities returned
  ///
  /// See:
  ///  * [getCapabilitiesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<OcsGetCapabilitiesResponseApplicationJson, void>> getCapabilities({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getCapabilitiesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the capabilities.
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
  ///   * 200: Capabilities returned
  ///
  /// See:
  ///  * [getCapabilities] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<OcsGetCapabilitiesResponseApplicationJson, void> getCapabilitiesRaw({
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
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/cloud/capabilities';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<OcsGetCapabilitiesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(OcsGetCapabilitiesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class PreviewClient {
  PreviewClient(this._rootClient);

  final Client _rootClient;

  /// Get a preview by file ID.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [fileId] ID of the file. Defaults to `-1`.
  ///   * [x] Width of the preview. Defaults to `32`.
  ///   * [y] Height of the preview. Defaults to `32`.
  ///   * [a] Whether to not crop the preview. Defaults to `0`.
  ///   * [forceIcon] Force returning an icon. Defaults to `1`.
  ///   * [mode] How to crop the image. Defaults to `fill`.
  ///   * [mimeFallback] Whether to fallback to the mime icon if no preview is available. Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Preview not found
  ///   * 303: Redirect to the mime icon url if mimeFallback is true
  ///
  /// See:
  ///  * [getPreviewByFileIdRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getPreviewByFileId({
    final int fileId = -1,
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) async {
    final rawResponse = getPreviewByFileIdRaw(
      fileId: fileId,
      x: x,
      y: y,
      a: a,
      forceIcon: forceIcon,
      mode: mode,
      mimeFallback: mimeFallback,
    );

    return rawResponse.future;
  }

  /// Get a preview by file ID.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [fileId] ID of the file. Defaults to `-1`.
  ///   * [x] Width of the preview. Defaults to `32`.
  ///   * [y] Height of the preview. Defaults to `32`.
  ///   * [a] Whether to not crop the preview. Defaults to `0`.
  ///   * [forceIcon] Force returning an icon. Defaults to `1`.
  ///   * [mode] How to crop the image. Defaults to `fill`.
  ///   * [mimeFallback] Whether to fallback to the mime icon if no preview is available. Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Preview not found
  ///   * 303: Redirect to the mime icon url if mimeFallback is true
  ///
  /// See:
  ///  * [getPreviewByFileId] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getPreviewByFileIdRaw({
    final int fileId = -1,
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) {
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
    if (fileId != -1) {
      queryParameters['fileId'] = fileId.toString();
    }
    if (x != 32) {
      queryParameters['x'] = x.toString();
    }
    if (y != 32) {
      queryParameters['y'] = y.toString();
    }
    if (a != 0) {
      queryParameters['a'] = a.toString();
    }
    if (forceIcon != 1) {
      queryParameters['forceIcon'] = forceIcon.toString();
    }
    if (mode != 'fill') {
      queryParameters['mode'] = mode;
    }
    if (mimeFallback != 0) {
      queryParameters['mimeFallback'] = mimeFallback.toString();
    }
    const path = '/index.php/core/preview';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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

  /// Get a preview by file path.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [file] Path of the file. Defaults to `''`.
  ///   * [x] Width of the preview. Defaults to `32`.
  ///   * [y] Height of the preview. Defaults to `32`.
  ///   * [a] Whether to not crop the preview. Defaults to `0`.
  ///   * [forceIcon] Force returning an icon. Defaults to `1`.
  ///   * [mode] How to crop the image. Defaults to `fill`.
  ///   * [mimeFallback] Whether to fallback to the mime icon if no preview is available. Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Preview not found
  ///   * 303: Redirect to the mime icon url if mimeFallback is true
  ///
  /// See:
  ///  * [getPreviewRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getPreview({
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) async {
    final rawResponse = getPreviewRaw(
      file: file,
      x: x,
      y: y,
      a: a,
      forceIcon: forceIcon,
      mode: mode,
      mimeFallback: mimeFallback,
    );

    return rawResponse.future;
  }

  /// Get a preview by file path.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [file] Path of the file. Defaults to `''`.
  ///   * [x] Width of the preview. Defaults to `32`.
  ///   * [y] Height of the preview. Defaults to `32`.
  ///   * [a] Whether to not crop the preview. Defaults to `0`.
  ///   * [forceIcon] Force returning an icon. Defaults to `1`.
  ///   * [mode] How to crop the image. Defaults to `fill`.
  ///   * [mimeFallback] Whether to fallback to the mime icon if no preview is available. Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Preview not found
  ///   * 303: Redirect to the mime icon url if mimeFallback is true
  ///
  /// See:
  ///  * [getPreview] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getPreviewRaw({
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) {
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
    if (file != '') {
      queryParameters['file'] = file;
    }
    if (x != 32) {
      queryParameters['x'] = x.toString();
    }
    if (y != 32) {
      queryParameters['y'] = y.toString();
    }
    if (a != 0) {
      queryParameters['a'] = a.toString();
    }
    if (forceIcon != 1) {
      queryParameters['forceIcon'] = forceIcon.toString();
    }
    if (mode != 'fill') {
      queryParameters['mode'] = mode;
    }
    if (mimeFallback != 0) {
      queryParameters['mimeFallback'] = mimeFallback.toString();
    }
    const path = '/index.php/core/preview.png';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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

class ProfileApiClient {
  ProfileApiClient(this._rootClient);

  final Client _rootClient;

  /// Update the visibility of a parameter.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [paramId] ID of the parameter.
  ///   * [visibility] New visibility.
  ///   * [targetUserId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Visibility updated successfully
  ///   * 400: Updating visibility is not possible
  ///   * 403: Not allowed to edit other users visibility
  ///   * 404: User not found
  ///
  /// See:
  ///  * [setVisibilityRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ProfileApiSetVisibilityResponseApplicationJson, void>> setVisibility({
    required final String paramId,
    required final String visibility,
    required final String targetUserId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = setVisibilityRaw(
      paramId: paramId,
      visibility: visibility,
      targetUserId: targetUserId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update the visibility of a parameter.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [paramId] ID of the parameter.
  ///   * [visibility] New visibility.
  ///   * [targetUserId] ID of the user.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Visibility updated successfully
  ///   * 400: Updating visibility is not possible
  ///   * 403: Not allowed to edit other users visibility
  ///   * 404: User not found
  ///
  /// See:
  ///  * [setVisibility] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ProfileApiSetVisibilityResponseApplicationJson, void> setVisibilityRaw({
    required final String paramId,
    required final String visibility,
    required final String targetUserId,
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
    queryParameters['paramId'] = paramId;
    queryParameters['visibility'] = visibility;
    final targetUserId0 = Uri.encodeQueryComponent(targetUserId);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/profile/$targetUserId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ProfileApiSetVisibilityResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ProfileApiSetVisibilityResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class ReferenceClient {
  ReferenceClient(this._rootClient);

  final Client _rootClient;

  /// Get a preview for a reference.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [referenceId] the reference cache key.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 404: Reference not found
  ///
  /// See:
  ///  * [previewRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> preview({required final String referenceId}) async {
    final rawResponse = previewRaw(
      referenceId: referenceId,
    );

    return rawResponse.future;
  }

  /// Get a preview for a reference.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [referenceId] the reference cache key.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 404: Reference not found
  ///
  /// See:
  ///  * [preview] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> previewRaw({required final String referenceId}) {
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
    final referenceId0 = Uri.encodeQueryComponent(referenceId);
    final path = '/index.php/core/references/preview/$referenceId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

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

class ReferenceApiClient {
  ReferenceApiClient(this._rootClient);

  final Client _rootClient;

  /// Resolve a reference.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reference] Reference to resolve.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reference returned
  ///
  /// See:
  ///  * [resolveOneRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReferenceApiResolveOneResponseApplicationJson, void>> resolveOne({
    required final String reference,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = resolveOneRaw(
      reference: reference,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Resolve a reference.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [reference] Reference to resolve.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reference returned
  ///
  /// See:
  ///  * [resolveOne] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReferenceApiResolveOneResponseApplicationJson, void> resolveOneRaw({
    required final String reference,
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
    queryParameters['reference'] = reference;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/references/resolve';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ReferenceApiResolveOneResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiResolveOneResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Resolve multiple references.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [references] References to resolve.
  ///   * [limit] Maximum amount of references to resolve. Defaults to `1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: References returned
  ///
  /// See:
  ///  * [resolveRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReferenceApiResolveResponseApplicationJson, void>> resolve({
    required final List<String> references,
    final int limit = 1,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = resolveRaw(
      references: references,
      limit: limit,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Resolve multiple references.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [references] References to resolve.
  ///   * [limit] Maximum amount of references to resolve. Defaults to `1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: References returned
  ///
  /// See:
  ///  * [resolve] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReferenceApiResolveResponseApplicationJson, void> resolveRaw({
    required final List<String> references,
    final int limit = 1,
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
    queryParameters['references[]'] = references.map((final e) => e);
    if (limit != 1) {
      queryParameters['limit'] = limit.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/references/resolve';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ReferenceApiResolveResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiResolveResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Extract references from a text.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [text] Text to extract from.
  ///   * [resolve] Resolve the references. Defaults to `0`.
  ///   * [limit] Maximum amount of references to extract. Defaults to `1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: References returned
  ///
  /// See:
  ///  * [extractRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReferenceApiExtractResponseApplicationJson, void>> extract({
    required final String text,
    final int resolve = 0,
    final int limit = 1,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = extractRaw(
      text: text,
      resolve: resolve,
      limit: limit,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Extract references from a text.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [text] Text to extract from.
  ///   * [resolve] Resolve the references. Defaults to `0`.
  ///   * [limit] Maximum amount of references to extract. Defaults to `1`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: References returned
  ///
  /// See:
  ///  * [extract] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReferenceApiExtractResponseApplicationJson, void> extractRaw({
    required final String text,
    final int resolve = 0,
    final int limit = 1,
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
    queryParameters['text'] = text;
    if (resolve != 0) {
      queryParameters['resolve'] = resolve.toString();
    }
    if (limit != 1) {
      queryParameters['limit'] = limit.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/references/extract';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ReferenceApiExtractResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiExtractResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the providers.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Providers returned
  ///
  /// See:
  ///  * [getProvidersInfoRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReferenceApiGetProvidersInfoResponseApplicationJson, void>> getProvidersInfo({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getProvidersInfoRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the providers.
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
  ///   * 200: Providers returned
  ///
  /// See:
  ///  * [getProvidersInfo] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReferenceApiGetProvidersInfoResponseApplicationJson, void> getProvidersInfoRaw({
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
    const path = '/ocs/v2.php/references/providers';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ReferenceApiGetProvidersInfoResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Touch a provider.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [timestamp] Timestamp of the last usage.
  ///   * [providerId] ID of the provider.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Provider touched
  ///
  /// See:
  ///  * [touchProviderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ReferenceApiTouchProviderResponseApplicationJson, void>> touchProvider({
    required final String providerId,
    final int? timestamp,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = touchProviderRaw(
      providerId: providerId,
      timestamp: timestamp,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Touch a provider.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [timestamp] Timestamp of the last usage.
  ///   * [providerId] ID of the provider.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Provider touched
  ///
  /// See:
  ///  * [touchProvider] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ReferenceApiTouchProviderResponseApplicationJson, void> touchProviderRaw({
    required final String providerId,
    final int? timestamp,
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
    final providerId0 = Uri.encodeQueryComponent(providerId);
    if (timestamp != null) {
      queryParameters['timestamp'] = timestamp.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/references/provider/$providerId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ReferenceApiTouchProviderResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiTouchProviderResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class TextProcessingApiClient {
  TextProcessingApiClient(this._rootClient);

  final Client _rootClient;

  /// This endpoint returns all available LanguageModel task types.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task types returned
  ///
  /// See:
  ///  * [taskTypesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextProcessingApiTaskTypesResponseApplicationJson, void>> taskTypes({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = taskTypesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint returns all available LanguageModel task types.
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
  ///   * 200: Task types returned
  ///
  /// See:
  ///  * [taskTypes] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextProcessingApiTaskTypesResponseApplicationJson, void> taskTypesRaw({
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
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/textprocessing/tasktypes';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TextProcessingApiTaskTypesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiTaskTypesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows scheduling a language model task.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [input] Input text.
  ///   * [type] Type of the task.
  ///   * [appId] ID of the app that will execute the task.
  ///   * [identifier] An arbitrary identifier for the task. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task scheduled successfully
  ///   * 400: Scheduling task is not possible
  ///   * 412: Scheduling task is not possible
  ///
  /// See:
  ///  * [scheduleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextProcessingApiScheduleResponseApplicationJson, void>> schedule({
    required final String input,
    required final String type,
    required final String appId,
    final String identifier = '',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = scheduleRaw(
      input: input,
      type: type,
      appId: appId,
      identifier: identifier,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint allows scheduling a language model task.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [input] Input text.
  ///   * [type] Type of the task.
  ///   * [appId] ID of the app that will execute the task.
  ///   * [identifier] An arbitrary identifier for the task. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task scheduled successfully
  ///   * 400: Scheduling task is not possible
  ///   * 412: Scheduling task is not possible
  ///
  /// See:
  ///  * [schedule] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextProcessingApiScheduleResponseApplicationJson, void> scheduleRaw({
    required final String input,
    required final String type,
    required final String appId,
    final String identifier = '',
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
    }

// coverage:ignore-end
    queryParameters['input'] = input;
    queryParameters['type'] = type;
    queryParameters['appId'] = appId;
    if (identifier != '') {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/textprocessing/schedule';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TextProcessingApiScheduleResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiScheduleResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows checking the status and results of a task. Tasks are removed 1 week after receiving their last update.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] The id of the task.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task returned
  ///   * 404: Task not found
  ///   * 500
  ///
  /// See:
  ///  * [getTaskRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextProcessingApiGetTaskResponseApplicationJson, void>> getTask({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getTaskRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint allows checking the status and results of a task. Tasks are removed 1 week after receiving their last update.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] The id of the task.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task returned
  ///   * 404: Task not found
  ///   * 500
  ///
  /// See:
  ///  * [getTask] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextProcessingApiGetTaskResponseApplicationJson, void> getTaskRaw({
    required final int id,
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
    }

// coverage:ignore-end
    final id0 = Uri.encodeQueryComponent(id.toString());
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/textprocessing/task/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TextProcessingApiGetTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiGetTaskResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows to delete a scheduled task for a user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] The id of the task.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task returned
  ///   * 404: Task not found
  ///   * 500
  ///
  /// See:
  ///  * [deleteTaskRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextProcessingApiDeleteTaskResponseApplicationJson, void>> deleteTask({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteTaskRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint allows to delete a scheduled task for a user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] The id of the task.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task returned
  ///   * 404: Task not found
  ///   * 500
  ///
  /// See:
  ///  * [deleteTask] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextProcessingApiDeleteTaskResponseApplicationJson, void> deleteTaskRaw({
    required final int id,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/textprocessing/task/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TextProcessingApiDeleteTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiDeleteTaskResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint returns a list of tasks of a user that are related with a specific appId and optionally with an identifier.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [identifier] An arbitrary identifier for the task.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task list returned
  ///   * 500
  ///
  /// See:
  ///  * [listTasksByAppRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextProcessingApiListTasksByAppResponseApplicationJson, void>> listTasksByApp({
    required final String appId,
    final String? identifier,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = listTasksByAppRaw(
      appId: appId,
      identifier: identifier,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint returns a list of tasks of a user that are related with a specific appId and optionally with an identifier.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [identifier] An arbitrary identifier for the task.
  ///   * [appId] ID of the app.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task list returned
  ///   * 500
  ///
  /// See:
  ///  * [listTasksByApp] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextProcessingApiListTasksByAppResponseApplicationJson, void> listTasksByAppRaw({
    required final String appId,
    final String? identifier,
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
    final appId0 = Uri.encodeQueryComponent(appId);
    if (identifier != null) {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/textprocessing/tasks/app/$appId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TextProcessingApiListTasksByAppResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiListTasksByAppResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class TranslationApiClient {
  TranslationApiClient(this._rootClient);

  final Client _rootClient;

  /// Get the list of supported languages.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Supported languages returned
  ///
  /// See:
  ///  * [languagesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TranslationApiLanguagesResponseApplicationJson, void>> languages({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = languagesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the list of supported languages.
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
  ///   * 200: Supported languages returned
  ///
  /// See:
  ///  * [languages] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TranslationApiLanguagesResponseApplicationJson, void> languagesRaw({
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
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/translation/languages';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TranslationApiLanguagesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TranslationApiLanguagesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Translate a text.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [text] Text to be translated.
  ///   * [fromLanguage] Language to translate from.
  ///   * [toLanguage] Language to translate to.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Translated text returned
  ///   * 400: Language not detected or unable to translate
  ///   * 412: Translating is not possible
  ///   * 500
  ///
  /// See:
  ///  * [translateRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TranslationApiTranslateResponseApplicationJson, void>> translate({
    required final String text,
    required final String toLanguage,
    final String? fromLanguage,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = translateRaw(
      text: text,
      toLanguage: toLanguage,
      fromLanguage: fromLanguage,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Translate a text.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [text] Text to be translated.
  ///   * [fromLanguage] Language to translate from.
  ///   * [toLanguage] Language to translate to.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Translated text returned
  ///   * 400: Language not detected or unable to translate
  ///   * 412: Translating is not possible
  ///   * 500
  ///
  /// See:
  ///  * [translate] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TranslationApiTranslateResponseApplicationJson, void> translateRaw({
    required final String text,
    required final String toLanguage,
    final String? fromLanguage,
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
    }

// coverage:ignore-end
    queryParameters['text'] = text;
    queryParameters['toLanguage'] = toLanguage;
    if (fromLanguage != null) {
      queryParameters['fromLanguage'] = fromLanguage;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/translation/translate';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TranslationApiTranslateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TranslationApiTranslateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class UnifiedSearchClient {
  UnifiedSearchClient(this._rootClient);

  final Client _rootClient;

  /// Get the providers for unified search.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [from] the url the user is currently at. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Providers returned
  ///
  /// See:
  ///  * [getProvidersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UnifiedSearchGetProvidersResponseApplicationJson, void>> getProviders({
    final String from = '',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getProvidersRaw(
      from: from,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the providers for unified search.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [from] the url the user is currently at. Defaults to `''`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Providers returned
  ///
  /// See:
  ///  * [getProviders] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UnifiedSearchGetProvidersResponseApplicationJson, void> getProvidersRaw({
    final String from = '',
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
    if (from != '') {
      queryParameters['from'] = from;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/search/providers';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UnifiedSearchGetProvidersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UnifiedSearchGetProvidersResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Search.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [term] Term to search. Defaults to `''`.
  ///   * [sortOrder] Order of entries.
  ///   * [limit] Maximum amount of entries.
  ///   * [cursor] Offset for searching.
  ///   * [from] The current user URL. Defaults to `''`.
  ///   * [providerId] ID of the provider.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Search entries returned
  ///   * 400: Searching is not possible
  ///
  /// See:
  ///  * [searchRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<UnifiedSearchSearchResponseApplicationJson, void>> search({
    required final String providerId,
    final String term = '',
    final int? sortOrder,
    final int? limit,
    final ContentString<UnifiedSearchSearchCursor>? cursor,
    final String from = '',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = searchRaw(
      providerId: providerId,
      term: term,
      sortOrder: sortOrder,
      limit: limit,
      cursor: cursor,
      from: from,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Search.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [term] Term to search. Defaults to `''`.
  ///   * [sortOrder] Order of entries.
  ///   * [limit] Maximum amount of entries.
  ///   * [cursor] Offset for searching.
  ///   * [from] The current user URL. Defaults to `''`.
  ///   * [providerId] ID of the provider.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Search entries returned
  ///   * 400: Searching is not possible
  ///
  /// See:
  ///  * [search] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<UnifiedSearchSearchResponseApplicationJson, void> searchRaw({
    required final String providerId,
    final String term = '',
    final int? sortOrder,
    final int? limit,
    final ContentString<UnifiedSearchSearchCursor>? cursor,
    final String from = '',
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
    final providerId0 = Uri.encodeQueryComponent(providerId);
    if (term != '') {
      queryParameters['term'] = term;
    }
    if (sortOrder != null) {
      queryParameters['sortOrder'] = sortOrder.toString();
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (cursor != null) {
      queryParameters['cursor'] = _jsonSerializers.serialize(
        cursor,
        specifiedType: const FullType(ContentString, [FullType(UnifiedSearchSearchCursor)]),
      );
    }
    if (from != '') {
      queryParameters['from'] = from;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/search/providers/$providerId0/search';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<UnifiedSearchSearchResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(UnifiedSearchSearchResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class WhatsNewClient {
  WhatsNewClient(this._rootClient);

  final Client _rootClient;

  /// Get the changes.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Changes returned
  ///   * 204: No changes
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WhatsNewGetResponseApplicationJson, void>> $get({final bool oCSAPIRequest = true}) async {
    final rawResponse = $getRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the changes.
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
  ///   * 200: Changes returned
  ///   * 204: No changes
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WhatsNewGetResponseApplicationJson, void> $getRaw({final bool oCSAPIRequest = true}) {
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
    const path = '/ocs/v2.php/core/whatsnew';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<WhatsNewGetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WhatsNewGetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Dismiss the changes.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version] Version to dismiss the changes for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Changes dismissed
  ///   * 500
  ///
  /// See:
  ///  * [dismissRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WhatsNewDismissResponseApplicationJson, void>> dismiss({
    required final String version,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = dismissRaw(
      version: version,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Dismiss the changes.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version] Version to dismiss the changes for.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Changes dismissed
  ///   * 500
  ///
  /// See:
  ///  * [dismiss] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WhatsNewDismissResponseApplicationJson, void> dismissRaw({
    required final String version,
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
    queryParameters['version'] = version;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/core/whatsnew';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<WhatsNewDismissResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WhatsNewDismissResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class WipeClient {
  WipeClient(this._rootClient);

  final Client _rootClient;

  /// Check if the device should be wiped.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] App password.
  ///
  /// Status codes:
  ///   * 200: Device should be wiped
  ///   * 404: Device should not be wiped
  ///
  /// See:
  ///  * [checkWipeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<WipeCheckWipeResponseApplicationJson, void>> checkWipe({required final String token}) async {
    final rawResponse = checkWipeRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Check if the device should be wiped.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] App password.
  ///
  /// Status codes:
  ///   * 200: Device should be wiped
  ///   * 404: Device should not be wiped
  ///
  /// See:
  ///  * [checkWipe] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<WipeCheckWipeResponseApplicationJson, void> checkWipeRaw({required final String token}) {
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
    queryParameters['token'] = token;
    const path = '/index.php/core/wipe/check';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<WipeCheckWipeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(WipeCheckWipeResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Finish the wipe.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] App password.
  ///
  /// Status codes:
  ///   * 200: Wipe finished successfully
  ///   * 404: Device should not be wiped
  ///
  /// See:
  ///  * [wipeDoneRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<JsonObject, void>> wipeDone({required final String token}) async {
    final rawResponse = wipeDoneRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Finish the wipe.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] App password.
  ///
  /// Status codes:
  ///   * 200: Wipe finished successfully
  ///   * 404: Device should not be wiped
  ///
  /// See:
  ///  * [wipeDone] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<JsonObject, void> wipeDoneRaw({required final String token}) {
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
    queryParameters['token'] = token;
    const path = '/index.php/core/wipe/success';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<JsonObject, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 404},
      ),
      bodyType: const FullType(JsonObject),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class StatusInterface {
  bool get installed;
  bool get maintenance;
  bool get needsDbUpgrade;
  String get version;
  String get versionstring;
  String get edition;
  String get productname;
  bool get extendedSupport;
}

abstract class Status implements StatusInterface, Built<Status, StatusBuilder> {
  factory Status([final void Function(StatusBuilder)? b]) = _$Status;

  // coverage:ignore-start
  const Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Status.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Status> get serializer => _$statusSerializer;
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
abstract interface class AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface {
  String get apppassword;
}

abstract class AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data
    implements
        AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface,
        Built<AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data,
            AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder> {
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data([
    final void Function(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      _$appPasswordGetAppPasswordResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AppPasswordGetAppPasswordResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data get data;
}

abstract class AppPasswordGetAppPasswordResponseApplicationJson_Ocs
    implements
        AppPasswordGetAppPasswordResponseApplicationJson_OcsInterface,
        Built<AppPasswordGetAppPasswordResponseApplicationJson_Ocs,
            AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder> {
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs([
    final void Function(AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppPasswordGetAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$appPasswordGetAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AppPasswordGetAppPasswordResponseApplicationJsonInterface {
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs get ocs;
}

abstract class AppPasswordGetAppPasswordResponseApplicationJson
    implements
        AppPasswordGetAppPasswordResponseApplicationJsonInterface,
        Built<AppPasswordGetAppPasswordResponseApplicationJson,
            AppPasswordGetAppPasswordResponseApplicationJsonBuilder> {
  factory AppPasswordGetAppPasswordResponseApplicationJson([
    final void Function(AppPasswordGetAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$AppPasswordGetAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const AppPasswordGetAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordGetAppPasswordResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson> get serializer =>
      _$appPasswordGetAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface {
  String get apppassword;
}

abstract class AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data
    implements
        AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface,
        Built<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data,
            AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder> {
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data([
    final void Function(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      _$appPasswordRotateAppPasswordResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data get data;
}

abstract class AppPasswordRotateAppPasswordResponseApplicationJson_Ocs
    implements
        AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface,
        Built<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs,
            AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder> {
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs([
    final void Function(AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppPasswordRotateAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$appPasswordRotateAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AppPasswordRotateAppPasswordResponseApplicationJsonInterface {
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs get ocs;
}

abstract class AppPasswordRotateAppPasswordResponseApplicationJson
    implements
        AppPasswordRotateAppPasswordResponseApplicationJsonInterface,
        Built<AppPasswordRotateAppPasswordResponseApplicationJson,
            AppPasswordRotateAppPasswordResponseApplicationJsonBuilder> {
  factory AppPasswordRotateAppPasswordResponseApplicationJson([
    final void Function(AppPasswordRotateAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$AppPasswordRotateAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const AppPasswordRotateAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordRotateAppPasswordResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson> get serializer =>
      _$appPasswordRotateAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs
    implements
        AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface,
        Built<AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs,
            AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder> {
  factory AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs([
    final void Function(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$appPasswordDeleteAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AppPasswordDeleteAppPasswordResponseApplicationJsonInterface {
  AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs get ocs;
}

abstract class AppPasswordDeleteAppPasswordResponseApplicationJson
    implements
        AppPasswordDeleteAppPasswordResponseApplicationJsonInterface,
        Built<AppPasswordDeleteAppPasswordResponseApplicationJson,
            AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder> {
  factory AppPasswordDeleteAppPasswordResponseApplicationJson([
    final void Function(AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$AppPasswordDeleteAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const AppPasswordDeleteAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordDeleteAppPasswordResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordDeleteAppPasswordResponseApplicationJson> get serializer =>
      _$appPasswordDeleteAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AutocompleteResult_Status0Interface {
  String get status;
  String? get message;
  String? get icon;
  int? get clearAt;
}

abstract class AutocompleteResult_Status0
    implements
        AutocompleteResult_Status0Interface,
        Built<AutocompleteResult_Status0, AutocompleteResult_Status0Builder> {
  factory AutocompleteResult_Status0([final void Function(AutocompleteResult_Status0Builder)? b]) =
      _$AutocompleteResult_Status0;

  // coverage:ignore-start
  const AutocompleteResult_Status0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutocompleteResult_Status0.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutocompleteResult_Status0> get serializer => _$autocompleteResultStatus0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class AutocompleteResult_StatusInterface {
  AutocompleteResult_Status0? get autocompleteResultStatus0;
  String? get string;
}

abstract class AutocompleteResult_Status
    implements AutocompleteResult_StatusInterface, Built<AutocompleteResult_Status, AutocompleteResult_StatusBuilder> {
  factory AutocompleteResult_Status([final void Function(AutocompleteResult_StatusBuilder)? b]) =
      _$AutocompleteResult_Status;

  // coverage:ignore-start
  const AutocompleteResult_Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutocompleteResult_Status.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AutocompleteResult_Status> get serializer => _$AutocompleteResult_StatusSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final AutocompleteResult_StatusBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._autocompleteResultStatus0, b._string].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of 'autocompleteResultStatus0', 'string' for ${b._data}");
    }
  }
}

class _$AutocompleteResult_StatusSerializer implements PrimitiveSerializer<AutocompleteResult_Status> {
  @override
  final Iterable<Type> types = const [AutocompleteResult_Status, _$AutocompleteResult_Status];

  @override
  final String wireName = 'AutocompleteResult_Status';

  @override
  Object serialize(
    final Serializers serializers,
    final AutocompleteResult_Status object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  AutocompleteResult_Status deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AutocompleteResult_StatusBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(AutocompleteResult_Status0))!
          as AutocompleteResult_Status0;
      result.autocompleteResultStatus0.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AutocompleteResultInterface {
  String get id;
  String get label;
  String get icon;
  String get source;
  AutocompleteResult_Status get status;
  String get subline;
  String get shareWithDisplayNameUnique;
}

abstract class AutocompleteResult
    implements AutocompleteResultInterface, Built<AutocompleteResult, AutocompleteResultBuilder> {
  factory AutocompleteResult([final void Function(AutocompleteResultBuilder)? b]) = _$AutocompleteResult;

  // coverage:ignore-start
  const AutocompleteResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutocompleteResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutocompleteResult> get serializer => _$autocompleteResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AutoCompleteGetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<AutocompleteResult> get data;
}

abstract class AutoCompleteGetResponseApplicationJson_Ocs
    implements
        AutoCompleteGetResponseApplicationJson_OcsInterface,
        Built<AutoCompleteGetResponseApplicationJson_Ocs, AutoCompleteGetResponseApplicationJson_OcsBuilder> {
  factory AutoCompleteGetResponseApplicationJson_Ocs([
    final void Function(AutoCompleteGetResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AutoCompleteGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AutoCompleteGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutoCompleteGetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutoCompleteGetResponseApplicationJson_Ocs> get serializer =>
      _$autoCompleteGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AutoCompleteGetResponseApplicationJsonInterface {
  AutoCompleteGetResponseApplicationJson_Ocs get ocs;
}

abstract class AutoCompleteGetResponseApplicationJson
    implements
        AutoCompleteGetResponseApplicationJsonInterface,
        Built<AutoCompleteGetResponseApplicationJson, AutoCompleteGetResponseApplicationJsonBuilder> {
  factory AutoCompleteGetResponseApplicationJson([
    final void Function(AutoCompleteGetResponseApplicationJsonBuilder)? b,
  ]) = _$AutoCompleteGetResponseApplicationJson;

  // coverage:ignore-start
  const AutoCompleteGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutoCompleteGetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutoCompleteGetResponseApplicationJson> get serializer =>
      _$autoCompleteGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class AvatarAvatarGetAvatarDarkHeadersInterface {
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  int? get xNcIscustomavatar;
}

abstract class AvatarAvatarGetAvatarDarkHeaders
    implements
        AvatarAvatarGetAvatarDarkHeadersInterface,
        Built<AvatarAvatarGetAvatarDarkHeaders, AvatarAvatarGetAvatarDarkHeadersBuilder> {
  factory AvatarAvatarGetAvatarDarkHeaders([final void Function(AvatarAvatarGetAvatarDarkHeadersBuilder)? b]) =
      _$AvatarAvatarGetAvatarDarkHeaders;

  // coverage:ignore-start
  const AvatarAvatarGetAvatarDarkHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarAvatarGetAvatarDarkHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AvatarAvatarGetAvatarDarkHeaders> get serializer => _$AvatarAvatarGetAvatarDarkHeadersSerializer();
}

class _$AvatarAvatarGetAvatarDarkHeadersSerializer implements StructuredSerializer<AvatarAvatarGetAvatarDarkHeaders> {
  @override
  final Iterable<Type> types = const [AvatarAvatarGetAvatarDarkHeaders, _$AvatarAvatarGetAvatarDarkHeaders];

  @override
  final String wireName = 'AvatarAvatarGetAvatarDarkHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AvatarAvatarGetAvatarDarkHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  AvatarAvatarGetAvatarDarkHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AvatarAvatarGetAvatarDarkHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'x-nc-iscustomavatar':
          result.xNcIscustomavatar =
              _jsonSerializers.deserialize(json.decode(value), specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class AvatarAvatarGetAvatarHeadersInterface {
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  int? get xNcIscustomavatar;
}

abstract class AvatarAvatarGetAvatarHeaders
    implements
        AvatarAvatarGetAvatarHeadersInterface,
        Built<AvatarAvatarGetAvatarHeaders, AvatarAvatarGetAvatarHeadersBuilder> {
  factory AvatarAvatarGetAvatarHeaders([final void Function(AvatarAvatarGetAvatarHeadersBuilder)? b]) =
      _$AvatarAvatarGetAvatarHeaders;

  // coverage:ignore-start
  const AvatarAvatarGetAvatarHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarAvatarGetAvatarHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<AvatarAvatarGetAvatarHeaders> get serializer => _$AvatarAvatarGetAvatarHeadersSerializer();
}

class _$AvatarAvatarGetAvatarHeadersSerializer implements StructuredSerializer<AvatarAvatarGetAvatarHeaders> {
  @override
  final Iterable<Type> types = const [AvatarAvatarGetAvatarHeaders, _$AvatarAvatarGetAvatarHeaders];

  @override
  final String wireName = 'AvatarAvatarGetAvatarHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AvatarAvatarGetAvatarHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  AvatarAvatarGetAvatarHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AvatarAvatarGetAvatarHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'x-nc-iscustomavatar':
          result.xNcIscustomavatar =
              _jsonSerializers.deserialize(json.decode(value), specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class LoginFlowV2CredentialsInterface {
  String get server;
  String get loginName;
  String get appPassword;
}

abstract class LoginFlowV2Credentials
    implements LoginFlowV2CredentialsInterface, Built<LoginFlowV2Credentials, LoginFlowV2CredentialsBuilder> {
  factory LoginFlowV2Credentials([final void Function(LoginFlowV2CredentialsBuilder)? b]) = _$LoginFlowV2Credentials;

  // coverage:ignore-start
  const LoginFlowV2Credentials._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory LoginFlowV2Credentials.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<LoginFlowV2Credentials> get serializer => _$loginFlowV2CredentialsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class LoginFlowV2_PollInterface {
  String get token;
  String get endpoint;
}

abstract class LoginFlowV2_Poll implements LoginFlowV2_PollInterface, Built<LoginFlowV2_Poll, LoginFlowV2_PollBuilder> {
  factory LoginFlowV2_Poll([final void Function(LoginFlowV2_PollBuilder)? b]) = _$LoginFlowV2_Poll;

  // coverage:ignore-start
  const LoginFlowV2_Poll._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory LoginFlowV2_Poll.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<LoginFlowV2_Poll> get serializer => _$loginFlowV2PollSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class LoginFlowV2Interface {
  LoginFlowV2_Poll get poll;
  String get login;
}

abstract class LoginFlowV2 implements LoginFlowV2Interface, Built<LoginFlowV2, LoginFlowV2Builder> {
  factory LoginFlowV2([final void Function(LoginFlowV2Builder)? b]) = _$LoginFlowV2;

  // coverage:ignore-start
  const LoginFlowV2._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory LoginFlowV2.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<LoginFlowV2> get serializer => _$loginFlowV2Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class OpenGraphObjectInterface {
  String get id;
  String get name;
  String? get description;
  String? get thumb;
  String get link;
}

abstract class OpenGraphObject implements OpenGraphObjectInterface, Built<OpenGraphObject, OpenGraphObjectBuilder> {
  factory OpenGraphObject([final void Function(OpenGraphObjectBuilder)? b]) = _$OpenGraphObject;

  // coverage:ignore-start
  const OpenGraphObject._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenGraphObject.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenGraphObject> get serializer => _$openGraphObjectSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ResourceInterface {
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  OpenGraphObject get openGraphObject;
  bool get accessible;
}

abstract class Resource implements ResourceInterface, Built<Resource, ResourceBuilder> {
  factory Resource([final void Function(ResourceBuilder)? b]) = _$Resource;

  // coverage:ignore-start
  const Resource._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Resource.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Resource> get serializer => _$resourceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollectionInterface {
  int get id;
  String get name;
  BuiltList<Resource> get resources;
}

abstract class Collection implements CollectionInterface, Built<Collection, CollectionBuilder> {
  factory Collection([final void Function(CollectionBuilder)? b]) = _$Collection;

  // coverage:ignore-start
  const Collection._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Collection.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Collection> get serializer => _$collectionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Collection> get data;
}

abstract class CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs
    implements
        CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs,
            CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs([
    final void Function(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesSearchCollectionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesSearchCollectionsResponseApplicationJsonInterface {
  CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesSearchCollectionsResponseApplicationJson
    implements
        CollaborationResourcesSearchCollectionsResponseApplicationJsonInterface,
        Built<CollaborationResourcesSearchCollectionsResponseApplicationJson,
            CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder> {
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson([
    final void Function(CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesSearchCollectionsResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesSearchCollectionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesSearchCollectionsResponseApplicationJson> get serializer =>
      _$collaborationResourcesSearchCollectionsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesListCollectionResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesListCollectionResponseApplicationJson_Ocs
    implements
        CollaborationResourcesListCollectionResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesListCollectionResponseApplicationJson_Ocs,
            CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesListCollectionResponseApplicationJson_Ocs([
    final void Function(CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesListCollectionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesListCollectionResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesListCollectionResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesListCollectionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesListCollectionResponseApplicationJsonInterface {
  CollaborationResourcesListCollectionResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesListCollectionResponseApplicationJson
    implements
        CollaborationResourcesListCollectionResponseApplicationJsonInterface,
        Built<CollaborationResourcesListCollectionResponseApplicationJson,
            CollaborationResourcesListCollectionResponseApplicationJsonBuilder> {
  factory CollaborationResourcesListCollectionResponseApplicationJson([
    final void Function(CollaborationResourcesListCollectionResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesListCollectionResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesListCollectionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesListCollectionResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesListCollectionResponseApplicationJson> get serializer =>
      _$collaborationResourcesListCollectionResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs
    implements
        CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs,
            CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs([
    final void Function(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesRenameCollectionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesRenameCollectionResponseApplicationJsonInterface {
  CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesRenameCollectionResponseApplicationJson
    implements
        CollaborationResourcesRenameCollectionResponseApplicationJsonInterface,
        Built<CollaborationResourcesRenameCollectionResponseApplicationJson,
            CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder> {
  factory CollaborationResourcesRenameCollectionResponseApplicationJson([
    final void Function(CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesRenameCollectionResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesRenameCollectionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRenameCollectionResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRenameCollectionResponseApplicationJson> get serializer =>
      _$collaborationResourcesRenameCollectionResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesAddResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesAddResourceResponseApplicationJson_Ocs
    implements
        CollaborationResourcesAddResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesAddResourceResponseApplicationJson_Ocs,
            CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesAddResourceResponseApplicationJson_Ocs([
    final void Function(CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesAddResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesAddResourceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesAddResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesAddResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesAddResourceResponseApplicationJsonInterface {
  CollaborationResourcesAddResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesAddResourceResponseApplicationJson
    implements
        CollaborationResourcesAddResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesAddResourceResponseApplicationJson,
            CollaborationResourcesAddResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesAddResourceResponseApplicationJson([
    final void Function(CollaborationResourcesAddResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesAddResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesAddResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesAddResourceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesAddResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesAddResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs
    implements
        CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs,
            CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs([
    final void Function(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesRemoveResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesRemoveResourceResponseApplicationJsonInterface {
  CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesRemoveResourceResponseApplicationJson
    implements
        CollaborationResourcesRemoveResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesRemoveResourceResponseApplicationJson,
            CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesRemoveResourceResponseApplicationJson([
    final void Function(CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesRemoveResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesRemoveResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRemoveResourceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRemoveResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesRemoveResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Collection> get data;
}

abstract class CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs
    implements
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs,
            CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs([
    final void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesGetCollectionsByResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface {
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesGetCollectionsByResourceResponseApplicationJson
    implements
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson,
            CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson([
    final void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesGetCollectionsByResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesGetCollectionsByResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs
    implements
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs,
            CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs([
    final void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesCreateCollectionOnResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface {
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson
    implements
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson,
            CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson([
    final void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesCreateCollectionOnResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ContactsActionInterface {
  String get title;
  String get icon;
  String get hyperlink;
  String get appId;
}

abstract class ContactsAction implements ContactsActionInterface, Built<ContactsAction, ContactsActionBuilder> {
  factory ContactsAction([final void Function(ContactsActionBuilder)? b]) = _$ContactsAction;

  // coverage:ignore-start
  const ContactsAction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ContactsAction.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ContactsAction> get serializer => _$contactsActionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class HoverCardGetUserResponseApplicationJson_Ocs_DataInterface {
  String get userId;
  String get displayName;
  BuiltList<ContactsAction> get actions;
}

abstract class HoverCardGetUserResponseApplicationJson_Ocs_Data
    implements
        HoverCardGetUserResponseApplicationJson_Ocs_DataInterface,
        Built<HoverCardGetUserResponseApplicationJson_Ocs_Data,
            HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder> {
  factory HoverCardGetUserResponseApplicationJson_Ocs_Data([
    final void Function(HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$HoverCardGetUserResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const HoverCardGetUserResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HoverCardGetUserResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HoverCardGetUserResponseApplicationJson_Ocs_Data> get serializer =>
      _$hoverCardGetUserResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class HoverCardGetUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  HoverCardGetUserResponseApplicationJson_Ocs_Data get data;
}

abstract class HoverCardGetUserResponseApplicationJson_Ocs
    implements
        HoverCardGetUserResponseApplicationJson_OcsInterface,
        Built<HoverCardGetUserResponseApplicationJson_Ocs, HoverCardGetUserResponseApplicationJson_OcsBuilder> {
  factory HoverCardGetUserResponseApplicationJson_Ocs([
    final void Function(HoverCardGetUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$HoverCardGetUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const HoverCardGetUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HoverCardGetUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HoverCardGetUserResponseApplicationJson_Ocs> get serializer =>
      _$hoverCardGetUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class HoverCardGetUserResponseApplicationJsonInterface {
  HoverCardGetUserResponseApplicationJson_Ocs get ocs;
}

abstract class HoverCardGetUserResponseApplicationJson
    implements
        HoverCardGetUserResponseApplicationJsonInterface,
        Built<HoverCardGetUserResponseApplicationJson, HoverCardGetUserResponseApplicationJsonBuilder> {
  factory HoverCardGetUserResponseApplicationJson([
    final void Function(HoverCardGetUserResponseApplicationJsonBuilder)? b,
  ]) = _$HoverCardGetUserResponseApplicationJson;

  // coverage:ignore-start
  const HoverCardGetUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HoverCardGetUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HoverCardGetUserResponseApplicationJson> get serializer =>
      _$hoverCardGetUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NavigationEntry_OrderInterface {
  int? get $int;
  String? get string;
}

abstract class NavigationEntry_Order
    implements NavigationEntry_OrderInterface, Built<NavigationEntry_Order, NavigationEntry_OrderBuilder> {
  factory NavigationEntry_Order([final void Function(NavigationEntry_OrderBuilder)? b]) = _$NavigationEntry_Order;

  // coverage:ignore-start
  const NavigationEntry_Order._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationEntry_Order.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<NavigationEntry_Order> get serializer => _$NavigationEntry_OrderSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final NavigationEntry_OrderBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._string].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', 'string' for ${b._data}");
    }
  }
}

class _$NavigationEntry_OrderSerializer implements PrimitiveSerializer<NavigationEntry_Order> {
  @override
  final Iterable<Type> types = const [NavigationEntry_Order, _$NavigationEntry_Order];

  @override
  final String wireName = 'NavigationEntry_Order';

  @override
  Object serialize(
    final Serializers serializers,
    final NavigationEntry_Order object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NavigationEntry_Order deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NavigationEntry_OrderBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class NavigationEntryInterface {
  String get id;
  NavigationEntry_Order get order;
  String get href;
  String get icon;
  String get type;
  String get name;
  bool get active;
  String get classes;
  int get unread;
}

abstract class NavigationEntry implements NavigationEntryInterface, Built<NavigationEntry, NavigationEntryBuilder> {
  factory NavigationEntry([final void Function(NavigationEntryBuilder)? b]) = _$NavigationEntry;

  // coverage:ignore-start
  const NavigationEntry._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationEntry.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationEntry> get serializer => _$navigationEntrySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NavigationGetAppsNavigationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<NavigationEntry> get data;
}

abstract class NavigationGetAppsNavigationResponseApplicationJson_Ocs
    implements
        NavigationGetAppsNavigationResponseApplicationJson_OcsInterface,
        Built<NavigationGetAppsNavigationResponseApplicationJson_Ocs,
            NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder> {
  factory NavigationGetAppsNavigationResponseApplicationJson_Ocs([
    final void Function(NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NavigationGetAppsNavigationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NavigationGetAppsNavigationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetAppsNavigationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetAppsNavigationResponseApplicationJson_Ocs> get serializer =>
      _$navigationGetAppsNavigationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NavigationGetAppsNavigationResponseApplicationJsonInterface {
  NavigationGetAppsNavigationResponseApplicationJson_Ocs get ocs;
}

abstract class NavigationGetAppsNavigationResponseApplicationJson
    implements
        NavigationGetAppsNavigationResponseApplicationJsonInterface,
        Built<NavigationGetAppsNavigationResponseApplicationJson,
            NavigationGetAppsNavigationResponseApplicationJsonBuilder> {
  factory NavigationGetAppsNavigationResponseApplicationJson([
    final void Function(NavigationGetAppsNavigationResponseApplicationJsonBuilder)? b,
  ]) = _$NavigationGetAppsNavigationResponseApplicationJson;

  // coverage:ignore-start
  const NavigationGetAppsNavigationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetAppsNavigationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetAppsNavigationResponseApplicationJson> get serializer =>
      _$navigationGetAppsNavigationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NavigationGetSettingsNavigationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<NavigationEntry> get data;
}

abstract class NavigationGetSettingsNavigationResponseApplicationJson_Ocs
    implements
        NavigationGetSettingsNavigationResponseApplicationJson_OcsInterface,
        Built<NavigationGetSettingsNavigationResponseApplicationJson_Ocs,
            NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder> {
  factory NavigationGetSettingsNavigationResponseApplicationJson_Ocs([
    final void Function(NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NavigationGetSettingsNavigationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetSettingsNavigationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetSettingsNavigationResponseApplicationJson_Ocs> get serializer =>
      _$navigationGetSettingsNavigationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NavigationGetSettingsNavigationResponseApplicationJsonInterface {
  NavigationGetSettingsNavigationResponseApplicationJson_Ocs get ocs;
}

abstract class NavigationGetSettingsNavigationResponseApplicationJson
    implements
        NavigationGetSettingsNavigationResponseApplicationJsonInterface,
        Built<NavigationGetSettingsNavigationResponseApplicationJson,
            NavigationGetSettingsNavigationResponseApplicationJsonBuilder> {
  factory NavigationGetSettingsNavigationResponseApplicationJson([
    final void Function(NavigationGetSettingsNavigationResponseApplicationJsonBuilder)? b,
  ]) = _$NavigationGetSettingsNavigationResponseApplicationJson;

  // coverage:ignore-start
  const NavigationGetSettingsNavigationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetSettingsNavigationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetSettingsNavigationResponseApplicationJson> get serializer =>
      _$navigationGetSettingsNavigationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OcmOcmDiscoveryHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-ocm-providers')
  bool? get xNextcloudOcmProviders;
}

abstract class OcmOcmDiscoveryHeaders
    implements OcmOcmDiscoveryHeadersInterface, Built<OcmOcmDiscoveryHeaders, OcmOcmDiscoveryHeadersBuilder> {
  factory OcmOcmDiscoveryHeaders([final void Function(OcmOcmDiscoveryHeadersBuilder)? b]) = _$OcmOcmDiscoveryHeaders;

  // coverage:ignore-start
  const OcmOcmDiscoveryHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmOcmDiscoveryHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OcmOcmDiscoveryHeaders> get serializer => _$OcmOcmDiscoveryHeadersSerializer();
}

class _$OcmOcmDiscoveryHeadersSerializer implements StructuredSerializer<OcmOcmDiscoveryHeaders> {
  @override
  final Iterable<Type> types = const [OcmOcmDiscoveryHeaders, _$OcmOcmDiscoveryHeaders];

  @override
  final String wireName = 'OcmOcmDiscoveryHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcmOcmDiscoveryHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  OcmOcmDiscoveryHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcmOcmDiscoveryHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'x-nextcloud-ocm-providers':
          result.xNextcloudOcmProviders = _jsonSerializers.deserialize(
            json.decode(value),
            specifiedType: const FullType(bool),
          )! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface {
  String get webdav;
}

abstract class OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols
    implements
        OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface,
        Built<OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols,
            OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder> {
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols([
    final void Function(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder)? b,
  ]) = _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols;

  // coverage:ignore-start
  const OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols> get serializer =>
      _$ocmDiscoveryResponseApplicationJsonResourceTypesProtocolsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OcmDiscoveryResponseApplicationJson_ResourceTypesInterface {
  String get name;
  BuiltList<String> get shareTypes;
  OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols get protocols;
}

abstract class OcmDiscoveryResponseApplicationJson_ResourceTypes
    implements
        OcmDiscoveryResponseApplicationJson_ResourceTypesInterface,
        Built<OcmDiscoveryResponseApplicationJson_ResourceTypes,
            OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder> {
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes([
    final void Function(OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder)? b,
  ]) = _$OcmDiscoveryResponseApplicationJson_ResourceTypes;

  // coverage:ignore-start
  const OcmDiscoveryResponseApplicationJson_ResourceTypes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcmDiscoveryResponseApplicationJson_ResourceTypes> get serializer =>
      _$ocmDiscoveryResponseApplicationJsonResourceTypesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OcmDiscoveryResponseApplicationJsonInterface {
  bool get enabled;
  String get apiVersion;
  String get endPoint;
  BuiltList<OcmDiscoveryResponseApplicationJson_ResourceTypes> get resourceTypes;
}

abstract class OcmDiscoveryResponseApplicationJson
    implements
        OcmDiscoveryResponseApplicationJsonInterface,
        Built<OcmDiscoveryResponseApplicationJson, OcmDiscoveryResponseApplicationJsonBuilder> {
  factory OcmDiscoveryResponseApplicationJson([final void Function(OcmDiscoveryResponseApplicationJsonBuilder)? b]) =
      _$OcmDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const OcmDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmDiscoveryResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcmDiscoveryResponseApplicationJson> get serializer =>
      _$ocmDiscoveryResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface {
  int get major;
  int get minor;
  int get micro;
  String get string;
  String get edition;
  bool get extendedSupport;
}

abstract class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version
    implements
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version([
    final void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonOcsDataVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CommentsCapabilities_FilesInterface {
  bool get comments;
}

abstract class CommentsCapabilities_Files
    implements
        CommentsCapabilities_FilesInterface,
        Built<CommentsCapabilities_Files, CommentsCapabilities_FilesBuilder> {
  factory CommentsCapabilities_Files([final void Function(CommentsCapabilities_FilesBuilder)? b]) =
      _$CommentsCapabilities_Files;

  // coverage:ignore-start
  const CommentsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CommentsCapabilities_Files> get serializer => _$commentsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CommentsCapabilitiesInterface {
  CommentsCapabilities_Files get files;
}

abstract class CommentsCapabilities
    implements CommentsCapabilitiesInterface, Built<CommentsCapabilities, CommentsCapabilitiesBuilder> {
  factory CommentsCapabilities([final void Function(CommentsCapabilitiesBuilder)? b]) = _$CommentsCapabilities;

  // coverage:ignore-start
  const CommentsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CommentsCapabilities> get serializer => _$commentsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DavCapabilities_DavInterface {
  String get chunking;
  String? get bulkupload;
}

abstract class DavCapabilities_Dav
    implements DavCapabilities_DavInterface, Built<DavCapabilities_Dav, DavCapabilities_DavBuilder> {
  factory DavCapabilities_Dav([final void Function(DavCapabilities_DavBuilder)? b]) = _$DavCapabilities_Dav;

  // coverage:ignore-start
  const DavCapabilities_Dav._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavCapabilities_Dav.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavCapabilities_Dav> get serializer => _$davCapabilitiesDavSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class DavCapabilitiesInterface {
  DavCapabilities_Dav get dav;
}

abstract class DavCapabilities implements DavCapabilitiesInterface, Built<DavCapabilities, DavCapabilitiesBuilder> {
  factory DavCapabilities([final void Function(DavCapabilitiesBuilder)? b]) = _$DavCapabilities;

  // coverage:ignore-start
  const DavCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavCapabilities> get serializer => _$davCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesCapabilities_Files_DirectEditingInterface {
  String get url;
  String get etag;
  bool get supportsFileId;
}

abstract class FilesCapabilities_Files_DirectEditing
    implements
        FilesCapabilities_Files_DirectEditingInterface,
        Built<FilesCapabilities_Files_DirectEditing, FilesCapabilities_Files_DirectEditingBuilder> {
  factory FilesCapabilities_Files_DirectEditing([
    final void Function(FilesCapabilities_Files_DirectEditingBuilder)? b,
  ]) = _$FilesCapabilities_Files_DirectEditing;

  // coverage:ignore-start
  const FilesCapabilities_Files_DirectEditing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesCapabilities_Files_DirectEditing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesCapabilities_Files_DirectEditing> get serializer =>
      _$filesCapabilitiesFilesDirectEditingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesCapabilities_FilesInterface {
  bool get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<JsonObject> get blacklistedFiles;
  FilesCapabilities_Files_DirectEditing get directEditing;
}

abstract class FilesCapabilities_Files
    implements FilesCapabilities_FilesInterface, Built<FilesCapabilities_Files, FilesCapabilities_FilesBuilder> {
  factory FilesCapabilities_Files([final void Function(FilesCapabilities_FilesBuilder)? b]) = _$FilesCapabilities_Files;

  // coverage:ignore-start
  const FilesCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesCapabilities_Files> get serializer => _$filesCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesCapabilitiesInterface {
  FilesCapabilities_Files get files;
}

abstract class FilesCapabilities
    implements FilesCapabilitiesInterface, Built<FilesCapabilities, FilesCapabilitiesBuilder> {
  factory FilesCapabilities([final void Function(FilesCapabilitiesBuilder)? b]) = _$FilesCapabilities;

  // coverage:ignore-start
  const FilesCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesCapabilities> get serializer => _$filesCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Public_PasswordInterface {
  bool get enforced;
  bool get askForOptionalPassword;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_Password
    implements
        FilesSharingCapabilities_FilesSharing_Public_PasswordInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_Password,
            FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_Password([
    final void Function(FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_Password;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_Password> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDate
    implements
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDate([
    final void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal
    implements
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal([
    final void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote
    implements
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote([
    final void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_PublicInterface {
  bool get enabled;
  FilesSharingCapabilities_FilesSharing_Public_Password? get password;
  @BuiltValueField(wireName: 'multiple_links')
  bool? get multipleLinks;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_Public_ExpireDate? get expireDate;
  @BuiltValueField(wireName: 'expire_date_internal')
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal? get expireDateInternal;
  @BuiltValueField(wireName: 'expire_date_remote')
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote? get expireDateRemote;
  @BuiltValueField(wireName: 'send_mail')
  bool? get sendMail;
  bool? get upload;
  @BuiltValueField(wireName: 'upload_files_drop')
  bool? get uploadFilesDrop;
}

abstract class FilesSharingCapabilities_FilesSharing_Public
    implements
        FilesSharingCapabilities_FilesSharing_PublicInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public, FilesSharingCapabilities_FilesSharing_PublicBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public([
    final void Function(FilesSharingCapabilities_FilesSharing_PublicBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_User_ExpireDateInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_User_ExpireDate
    implements
        FilesSharingCapabilities_FilesSharing_User_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_User_ExpireDate,
            FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_User_ExpireDate([
    final void Function(FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_User_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_User_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_User_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_User_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingUserExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_UserInterface {
  @BuiltValueField(wireName: 'send_mail')
  bool get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_User_ExpireDate? get expireDate;
}

abstract class FilesSharingCapabilities_FilesSharing_User
    implements
        FilesSharingCapabilities_FilesSharing_UserInterface,
        Built<FilesSharingCapabilities_FilesSharing_User, FilesSharingCapabilities_FilesSharing_UserBuilder> {
  factory FilesSharingCapabilities_FilesSharing_User([
    final void Function(FilesSharingCapabilities_FilesSharing_UserBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_User;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_User._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_User.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_User> get serializer =>
      _$filesSharingCapabilitiesFilesSharingUserSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_Group_ExpireDate
    implements
        FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_Group_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Group_ExpireDate([
    final void Function(FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Group_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Group_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Group_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingGroupExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_GroupInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_Group_ExpireDate? get expireDate;
}

abstract class FilesSharingCapabilities_FilesSharing_Group
    implements
        FilesSharingCapabilities_FilesSharing_GroupInterface,
        Built<FilesSharingCapabilities_FilesSharing_Group, FilesSharingCapabilities_FilesSharing_GroupBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Group([
    final void Function(FilesSharingCapabilities_FilesSharing_GroupBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Group;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Group._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Group.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Group> get serializer =>
      _$filesSharingCapabilitiesFilesSharingGroupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation_ExpireDate
    implements
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDate([
    final void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Federation_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface,
        Built<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported,
            FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported([
    final void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_FederationInterface {
  bool get outgoing;
  bool get incoming;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDate get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported get expireDateSupported;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation
    implements
        FilesSharingCapabilities_FilesSharing_FederationInterface,
        Built<FilesSharingCapabilities_FilesSharing_Federation,
            FilesSharingCapabilities_FilesSharing_FederationBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Federation([
    final void Function(FilesSharingCapabilities_FilesSharing_FederationBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Federation;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Federation._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Federation.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Federation> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_ShareeInterface {
  @BuiltValueField(wireName: 'query_lookup_default')
  bool get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool get alwaysShowUnique;
}

abstract class FilesSharingCapabilities_FilesSharing_Sharee
    implements
        FilesSharingCapabilities_FilesSharing_ShareeInterface,
        Built<FilesSharingCapabilities_FilesSharing_Sharee, FilesSharingCapabilities_FilesSharing_ShareeBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Sharee([
    final void Function(FilesSharingCapabilities_FilesSharing_ShareeBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Sharee;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Sharee._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Sharee.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Sharee> get serializer =>
      _$filesSharingCapabilitiesFilesSharingShareeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharingInterface {
  @BuiltValueField(wireName: 'api_enabled')
  bool get apiEnabled;
  FilesSharingCapabilities_FilesSharing_Public get public;
  FilesSharingCapabilities_FilesSharing_User get user;
  bool get resharing;
  @BuiltValueField(wireName: 'group_sharing')
  bool? get groupSharing;
  FilesSharingCapabilities_FilesSharing_Group? get group;
  @BuiltValueField(wireName: 'default_permissions')
  int? get defaultPermissions;
  FilesSharingCapabilities_FilesSharing_Federation get federation;
  FilesSharingCapabilities_FilesSharing_Sharee get sharee;
}

abstract class FilesSharingCapabilities_FilesSharing
    implements
        FilesSharingCapabilities_FilesSharingInterface,
        Built<FilesSharingCapabilities_FilesSharing, FilesSharingCapabilities_FilesSharingBuilder> {
  factory FilesSharingCapabilities_FilesSharing([
    final void Function(FilesSharingCapabilities_FilesSharingBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing> get serializer =>
      _$filesSharingCapabilitiesFilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  FilesSharingCapabilities_FilesSharing get filesSharing;
}

abstract class FilesSharingCapabilities
    implements FilesSharingCapabilitiesInterface, Built<FilesSharingCapabilities, FilesSharingCapabilitiesBuilder> {
  factory FilesSharingCapabilities([final void Function(FilesSharingCapabilitiesBuilder)? b]) =
      _$FilesSharingCapabilities;

  // coverage:ignore-start
  const FilesSharingCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities> get serializer => _$filesSharingCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTrashbinCapabilities_FilesInterface {
  bool get undelete;
}

abstract class FilesTrashbinCapabilities_Files
    implements
        FilesTrashbinCapabilities_FilesInterface,
        Built<FilesTrashbinCapabilities_Files, FilesTrashbinCapabilities_FilesBuilder> {
  factory FilesTrashbinCapabilities_Files([final void Function(FilesTrashbinCapabilities_FilesBuilder)? b]) =
      _$FilesTrashbinCapabilities_Files;

  // coverage:ignore-start
  const FilesTrashbinCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTrashbinCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTrashbinCapabilities_Files> get serializer => _$filesTrashbinCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTrashbinCapabilitiesInterface {
  FilesTrashbinCapabilities_Files get files;
}

abstract class FilesTrashbinCapabilities
    implements FilesTrashbinCapabilitiesInterface, Built<FilesTrashbinCapabilities, FilesTrashbinCapabilitiesBuilder> {
  factory FilesTrashbinCapabilities([final void Function(FilesTrashbinCapabilitiesBuilder)? b]) =
      _$FilesTrashbinCapabilities;

  // coverage:ignore-start
  const FilesTrashbinCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTrashbinCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTrashbinCapabilities> get serializer => _$filesTrashbinCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesVersionsCapabilities_FilesInterface {
  bool get versioning;
  @BuiltValueField(wireName: 'version_labeling')
  bool get versionLabeling;
  @BuiltValueField(wireName: 'version_deletion')
  bool get versionDeletion;
}

abstract class FilesVersionsCapabilities_Files
    implements
        FilesVersionsCapabilities_FilesInterface,
        Built<FilesVersionsCapabilities_Files, FilesVersionsCapabilities_FilesBuilder> {
  factory FilesVersionsCapabilities_Files([final void Function(FilesVersionsCapabilities_FilesBuilder)? b]) =
      _$FilesVersionsCapabilities_Files;

  // coverage:ignore-start
  const FilesVersionsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesVersionsCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesVersionsCapabilities_Files> get serializer => _$filesVersionsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesVersionsCapabilitiesInterface {
  FilesVersionsCapabilities_Files get files;
}

abstract class FilesVersionsCapabilities
    implements FilesVersionsCapabilitiesInterface, Built<FilesVersionsCapabilities, FilesVersionsCapabilitiesBuilder> {
  factory FilesVersionsCapabilities([final void Function(FilesVersionsCapabilitiesBuilder)? b]) =
      _$FilesVersionsCapabilities;

  // coverage:ignore-start
  const FilesVersionsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesVersionsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesVersionsCapabilities> get serializer => _$filesVersionsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotesCapabilities_NotesInterface {
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
}

abstract class NotesCapabilities_Notes
    implements NotesCapabilities_NotesInterface, Built<NotesCapabilities_Notes, NotesCapabilities_NotesBuilder> {
  factory NotesCapabilities_Notes([final void Function(NotesCapabilities_NotesBuilder)? b]) = _$NotesCapabilities_Notes;

  // coverage:ignore-start
  const NotesCapabilities_Notes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesCapabilities_Notes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotesCapabilities_Notes> get serializer => _$notesCapabilitiesNotesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotesCapabilitiesInterface {
  NotesCapabilities_Notes get notes;
}

abstract class NotesCapabilities
    implements NotesCapabilitiesInterface, Built<NotesCapabilities, NotesCapabilitiesBuilder> {
  factory NotesCapabilities([final void Function(NotesCapabilitiesBuilder)? b]) = _$NotesCapabilities;

  // coverage:ignore-start
  const NotesCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotesCapabilities> get serializer => _$notesCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsCapabilities_NotificationsInterface {
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String> get ocsEndpoints;
  BuiltList<String> get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String> get adminNotifications;
}

abstract class NotificationsCapabilities_Notifications
    implements
        NotificationsCapabilities_NotificationsInterface,
        Built<NotificationsCapabilities_Notifications, NotificationsCapabilities_NotificationsBuilder> {
  factory NotificationsCapabilities_Notifications([
    final void Function(NotificationsCapabilities_NotificationsBuilder)? b,
  ]) = _$NotificationsCapabilities_Notifications;

  // coverage:ignore-start
  const NotificationsCapabilities_Notifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities_Notifications.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotificationsCapabilities_Notifications> get serializer =>
      _$notificationsCapabilitiesNotificationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsCapabilitiesInterface {
  NotificationsCapabilities_Notifications get notifications;
}

abstract class NotificationsCapabilities
    implements NotificationsCapabilitiesInterface, Built<NotificationsCapabilities, NotificationsCapabilitiesBuilder> {
  factory NotificationsCapabilities([final void Function(NotificationsCapabilitiesBuilder)? b]) =
      _$NotificationsCapabilities;

  // coverage:ignore-start
  const NotificationsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotificationsCapabilities> get serializer => _$notificationsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiCapabilities_ProvisioningApiInterface {
  String get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool get accountPropertyScopesPublishedEnabled;
}

abstract class ProvisioningApiCapabilities_ProvisioningApi
    implements
        ProvisioningApiCapabilities_ProvisioningApiInterface,
        Built<ProvisioningApiCapabilities_ProvisioningApi, ProvisioningApiCapabilities_ProvisioningApiBuilder> {
  factory ProvisioningApiCapabilities_ProvisioningApi([
    final void Function(ProvisioningApiCapabilities_ProvisioningApiBuilder)? b,
  ]) = _$ProvisioningApiCapabilities_ProvisioningApi;

  // coverage:ignore-start
  const ProvisioningApiCapabilities_ProvisioningApi._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiCapabilities_ProvisioningApi.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProvisioningApiCapabilities_ProvisioningApi> get serializer =>
      _$provisioningApiCapabilitiesProvisioningApiSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiCapabilitiesInterface {
  @BuiltValueField(wireName: 'provisioning_api')
  ProvisioningApiCapabilities_ProvisioningApi get provisioningApi;
}

abstract class ProvisioningApiCapabilities
    implements
        ProvisioningApiCapabilitiesInterface,
        Built<ProvisioningApiCapabilities, ProvisioningApiCapabilitiesBuilder> {
  factory ProvisioningApiCapabilities([final void Function(ProvisioningApiCapabilitiesBuilder)? b]) =
      _$ProvisioningApiCapabilities;

  // coverage:ignore-start
  const ProvisioningApiCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProvisioningApiCapabilities> get serializer => _$provisioningApiCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterface {
  bool get enabled;
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterface,
        Built<SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterface {
  bool get enabled;
  bool get enforced;
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail_Password
    implements
        SharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterface,
        Built<SharebymailCapabilities_FilesSharing_Sharebymail_Password,
            SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail_Password([
    final void Function(SharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_Password> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterface {
  bool get enabled;
  bool get enforced;
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate
    implements
        SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterface,
        Built<SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate,
            SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate([
    final void Function(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities_FilesSharing_SharebymailInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop get uploadFilesDrop;
  SharebymailCapabilities_FilesSharing_Sharebymail_Password get password;
  @BuiltValueField(wireName: 'expire_date')
  SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate get expireDate;
}

abstract class SharebymailCapabilities_FilesSharing_Sharebymail
    implements
        SharebymailCapabilities_FilesSharing_SharebymailInterface,
        Built<SharebymailCapabilities_FilesSharing_Sharebymail,
            SharebymailCapabilities_FilesSharing_SharebymailBuilder> {
  factory SharebymailCapabilities_FilesSharing_Sharebymail([
    final void Function(SharebymailCapabilities_FilesSharing_SharebymailBuilder)? b,
  ]) = _$SharebymailCapabilities_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing_Sharebymail.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities_FilesSharing_Sharebymail> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSharebymailSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities_FilesSharingInterface {
  SharebymailCapabilities_FilesSharing_Sharebymail get sharebymail;
}

abstract class SharebymailCapabilities_FilesSharing
    implements
        SharebymailCapabilities_FilesSharingInterface,
        Built<SharebymailCapabilities_FilesSharing, SharebymailCapabilities_FilesSharingBuilder> {
  factory SharebymailCapabilities_FilesSharing([final void Function(SharebymailCapabilities_FilesSharingBuilder)? b]) =
      _$SharebymailCapabilities_FilesSharing;

  // coverage:ignore-start
  const SharebymailCapabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities_FilesSharing> get serializer =>
      _$sharebymailCapabilitiesFilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  SharebymailCapabilities_FilesSharing get filesSharing;
}

abstract class SharebymailCapabilities
    implements SharebymailCapabilitiesInterface, Built<SharebymailCapabilities, SharebymailCapabilitiesBuilder> {
  factory SharebymailCapabilities([final void Function(SharebymailCapabilitiesBuilder)? b]) = _$SharebymailCapabilities;

  // coverage:ignore-start
  const SharebymailCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities> get serializer => _$sharebymailCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterface {
  bool get allowed;
  String? get folder;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Attachments
    implements
        SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Attachments,
            SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Attachments([
    final void Function(SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Attachments;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Attachments._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Attachments.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Attachments> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigAttachmentsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_Spreed_Config_CallInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'breakout-rooms')
  bool get breakoutRooms;
  bool get recording;
  @BuiltValueField(wireName: 'recording-consent')
  int? get recordingConsent;
  @BuiltValueField(wireName: 'supported-reactions')
  BuiltList<String> get supportedReactions;
  @BuiltValueField(wireName: 'predefined-backgrounds')
  BuiltList<String> get predefinedBackgrounds;
  @BuiltValueField(wireName: 'can-upload-background')
  bool get canUploadBackground;
  @BuiltValueField(wireName: 'sip-enabled')
  bool? get sipEnabled;
  @BuiltValueField(wireName: 'sip-dialout-enabled')
  bool? get sipDialoutEnabled;
  @BuiltValueField(wireName: 'can-enable-sip')
  bool? get canEnableSip;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Call
    implements
        SpreedPublicCapabilities0_Spreed_Config_CallInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Call, SpreedPublicCapabilities0_Spreed_Config_CallBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Call([
    final void Function(SpreedPublicCapabilities0_Spreed_Config_CallBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Call;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Call._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Call.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Call> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigCallSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_Spreed_Config_ChatInterface {
  @BuiltValueField(wireName: 'max-length')
  int get maxLength;
  @BuiltValueField(wireName: 'read-privacy')
  int get readPrivacy;
  @BuiltValueField(wireName: 'has-translation-providers')
  bool? get hasTranslationProviders;
  @BuiltValueField(wireName: 'typing-privacy')
  int get typingPrivacy;
  BuiltList<String>? get translations;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Chat
    implements
        SpreedPublicCapabilities0_Spreed_Config_ChatInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Chat, SpreedPublicCapabilities0_Spreed_Config_ChatBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Chat([
    final void Function(SpreedPublicCapabilities0_Spreed_Config_ChatBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Chat;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Chat._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Chat.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Chat> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigChatSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_Spreed_Config_ConversationsInterface {
  @BuiltValueField(wireName: 'can-create')
  bool get canCreate;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Conversations
    implements
        SpreedPublicCapabilities0_Spreed_Config_ConversationsInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Conversations,
            SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Conversations([
    final void Function(SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Conversations;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Conversations._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Conversations.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Conversations> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigConversationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_Spreed_Config_PreviewsInterface {
  @BuiltValueField(wireName: 'max-gif-size')
  int get maxGifSize;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Previews
    implements
        SpreedPublicCapabilities0_Spreed_Config_PreviewsInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Previews,
            SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Previews([
    final void Function(SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Previews;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Previews._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Previews.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Previews> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigPreviewsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_Spreed_Config_SignalingInterface {
  @BuiltValueField(wireName: 'session-ping-limit')
  int get sessionPingLimit;
  @BuiltValueField(wireName: 'hello-v2-token-key')
  String? get helloV2TokenKey;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Signaling
    implements
        SpreedPublicCapabilities0_Spreed_Config_SignalingInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Signaling,
            SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Signaling([
    final void Function(SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Signaling;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Signaling._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Signaling.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Signaling> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigSignalingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_Spreed_ConfigInterface {
  SpreedPublicCapabilities0_Spreed_Config_Attachments get attachments;
  SpreedPublicCapabilities0_Spreed_Config_Call get call;
  SpreedPublicCapabilities0_Spreed_Config_Chat get chat;
  SpreedPublicCapabilities0_Spreed_Config_Conversations get conversations;
  SpreedPublicCapabilities0_Spreed_Config_Previews get previews;
  SpreedPublicCapabilities0_Spreed_Config_Signaling get signaling;
}

abstract class SpreedPublicCapabilities0_Spreed_Config
    implements
        SpreedPublicCapabilities0_Spreed_ConfigInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config, SpreedPublicCapabilities0_Spreed_ConfigBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config([
    final void Function(SpreedPublicCapabilities0_Spreed_ConfigBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0_SpreedInterface {
  BuiltList<String> get features;
  SpreedPublicCapabilities0_Spreed_Config get config;
  String get version;
}

abstract class SpreedPublicCapabilities0_Spreed
    implements
        SpreedPublicCapabilities0_SpreedInterface,
        Built<SpreedPublicCapabilities0_Spreed, SpreedPublicCapabilities0_SpreedBuilder> {
  factory SpreedPublicCapabilities0_Spreed([final void Function(SpreedPublicCapabilities0_SpreedBuilder)? b]) =
      _$SpreedPublicCapabilities0_Spreed;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed> get serializer => _$spreedPublicCapabilities0SpreedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilities0Interface {
  SpreedPublicCapabilities0_Spreed get spreed;
}

abstract class SpreedPublicCapabilities0
    implements SpreedPublicCapabilities0Interface, Built<SpreedPublicCapabilities0, SpreedPublicCapabilities0Builder> {
  factory SpreedPublicCapabilities0([final void Function(SpreedPublicCapabilities0Builder)? b]) =
      _$SpreedPublicCapabilities0;

  // coverage:ignore-start
  const SpreedPublicCapabilities0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0> get serializer => _$spreedPublicCapabilities0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class SpreedPublicCapabilitiesInterface {
  SpreedPublicCapabilities0? get spreedPublicCapabilities0;
  BuiltList<JsonObject>? get builtListJsonObject;
}

abstract class SpreedPublicCapabilities
    implements SpreedPublicCapabilitiesInterface, Built<SpreedPublicCapabilities, SpreedPublicCapabilitiesBuilder> {
  factory SpreedPublicCapabilities([final void Function(SpreedPublicCapabilitiesBuilder)? b]) =
      _$SpreedPublicCapabilities;

  // coverage:ignore-start
  const SpreedPublicCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities> get serializer => _$SpreedPublicCapabilitiesSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final SpreedPublicCapabilitiesBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._spreedPublicCapabilities0, b._builtListJsonObject].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'spreedPublicCapabilities0', 'builtListJsonObject' for ${b._data}");
    }
  }
}

class _$SpreedPublicCapabilitiesSerializer implements PrimitiveSerializer<SpreedPublicCapabilities> {
  @override
  final Iterable<Type> types = const [SpreedPublicCapabilities, _$SpreedPublicCapabilities];

  @override
  final String wireName = 'SpreedPublicCapabilities';

  @override
  Object serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  SpreedPublicCapabilities deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilitiesBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(SpreedPublicCapabilities0))!
          as SpreedPublicCapabilities0;
      result.spreedPublicCapabilities0.replace(value);
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

@BuiltValue(instantiable: false)
abstract interface class UserStatusCapabilities_UserStatusInterface {
  bool get enabled;
  bool get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
}

abstract class UserStatusCapabilities_UserStatus
    implements
        UserStatusCapabilities_UserStatusInterface,
        Built<UserStatusCapabilities_UserStatus, UserStatusCapabilities_UserStatusBuilder> {
  factory UserStatusCapabilities_UserStatus([final void Function(UserStatusCapabilities_UserStatusBuilder)? b]) =
      _$UserStatusCapabilities_UserStatus;

  // coverage:ignore-start
  const UserStatusCapabilities_UserStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusCapabilities_UserStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusCapabilities_UserStatus> get serializer => _$userStatusCapabilitiesUserStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UserStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'user_status')
  UserStatusCapabilities_UserStatus get userStatus;
}

abstract class UserStatusCapabilities
    implements UserStatusCapabilitiesInterface, Built<UserStatusCapabilities, UserStatusCapabilitiesBuilder> {
  factory UserStatusCapabilities([final void Function(UserStatusCapabilitiesBuilder)? b]) = _$UserStatusCapabilities;

  // coverage:ignore-start
  const UserStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusCapabilities> get serializer => _$userStatusCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusCapabilities_WeatherStatusInterface {
  bool get enabled;
}

abstract class WeatherStatusCapabilities_WeatherStatus
    implements
        WeatherStatusCapabilities_WeatherStatusInterface,
        Built<WeatherStatusCapabilities_WeatherStatus, WeatherStatusCapabilities_WeatherStatusBuilder> {
  factory WeatherStatusCapabilities_WeatherStatus([
    final void Function(WeatherStatusCapabilities_WeatherStatusBuilder)? b,
  ]) = _$WeatherStatusCapabilities_WeatherStatus;

  // coverage:ignore-start
  const WeatherStatusCapabilities_WeatherStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusCapabilities_WeatherStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusCapabilities_WeatherStatus> get serializer =>
      _$weatherStatusCapabilitiesWeatherStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WeatherStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'weather_status')
  WeatherStatusCapabilities_WeatherStatus get weatherStatus;
}

abstract class WeatherStatusCapabilities
    implements WeatherStatusCapabilitiesInterface, Built<WeatherStatusCapabilities, WeatherStatusCapabilitiesBuilder> {
  factory WeatherStatusCapabilities([final void Function(WeatherStatusCapabilitiesBuilder)? b]) =
      _$WeatherStatusCapabilities;

  // coverage:ignore-start
  const WeatherStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusCapabilities> get serializer => _$weatherStatusCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesInterface {
  CommentsCapabilities? get commentsCapabilities;
  DavCapabilities? get davCapabilities;
  FilesCapabilities? get filesCapabilities;
  FilesSharingCapabilities? get filesSharingCapabilities;
  FilesTrashbinCapabilities? get filesTrashbinCapabilities;
  FilesVersionsCapabilities? get filesVersionsCapabilities;
  NotesCapabilities? get notesCapabilities;
  NotificationsCapabilities? get notificationsCapabilities;
  ProvisioningApiCapabilities? get provisioningApiCapabilities;
  SharebymailCapabilities? get sharebymailCapabilities;
  SpreedPublicCapabilities? get spreedPublicCapabilities;
  ThemingPublicCapabilities? get themingPublicCapabilities;
  UserStatusCapabilities? get userStatusCapabilities;
  WeatherStatusCapabilities? get weatherStatusCapabilities;
}

abstract class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities
    implements
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities([
    final void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities> get serializer =>
      _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [
      b._commentsCapabilities,
      b._davCapabilities,
      b._filesCapabilities,
      b._filesSharingCapabilities,
      b._filesTrashbinCapabilities,
      b._filesVersionsCapabilities,
      b._notesCapabilities,
      b._notificationsCapabilities,
      b._provisioningApiCapabilities,
      b._sharebymailCapabilities,
      b._spreedPublicCapabilities,
      b._themingPublicCapabilities,
      b._userStatusCapabilities,
      b._weatherStatusCapabilities,
    ].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError(
        "Need at least one of 'commentsCapabilities', 'davCapabilities', 'filesCapabilities', 'filesSharingCapabilities', 'filesTrashbinCapabilities', 'filesVersionsCapabilities', 'notesCapabilities', 'notificationsCapabilities', 'provisioningApiCapabilities', 'sharebymailCapabilities', 'spreedPublicCapabilities', 'themingPublicCapabilities', 'userStatusCapabilities', 'weatherStatusCapabilities' for ${b._data}",
      );
    }
  }
}

class _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesSerializer
    implements PrimitiveSerializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities> {
  @override
  final Iterable<Type> types = const [
    OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
    _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
  ];

  @override
  final String wireName = 'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities';

  @override
  Object serialize(
    final Serializers serializers,
    final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(CommentsCapabilities))!
          as CommentsCapabilities;
      result.commentsCapabilities.replace(value);
    } catch (_) {}
    try {
      final value =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(DavCapabilities))! as DavCapabilities;
      result.davCapabilities.replace(value);
    } catch (_) {}
    try {
      final value =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesCapabilities))! as FilesCapabilities;
      result.filesCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingCapabilities))!
          as FilesSharingCapabilities;
      result.filesSharingCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesTrashbinCapabilities))!
          as FilesTrashbinCapabilities;
      result.filesTrashbinCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesVersionsCapabilities))!
          as FilesVersionsCapabilities;
      result.filesVersionsCapabilities.replace(value);
    } catch (_) {}
    try {
      final value =
          _jsonSerializers.deserialize(data, specifiedType: const FullType(NotesCapabilities))! as NotesCapabilities;
      result.notesCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(NotificationsCapabilities))!
          as NotificationsCapabilities;
      result.notificationsCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(ProvisioningApiCapabilities))!
          as ProvisioningApiCapabilities;
      result.provisioningApiCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(SharebymailCapabilities))!
          as SharebymailCapabilities;
      result.sharebymailCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(SpreedPublicCapabilities))!
          as SpreedPublicCapabilities;
      result.spreedPublicCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(ThemingPublicCapabilities))!
          as ThemingPublicCapabilities;
      result.themingPublicCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(UserStatusCapabilities))!
          as UserStatusCapabilities;
      result.userStatusCapabilities.replace(value);
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(WeatherStatusCapabilities))!
          as WeatherStatusCapabilities;
      result.weatherStatusCapabilities.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface {
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version get version;
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities get capabilities;
}

abstract class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data
    implements
        OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data([
    final void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OcsGetCapabilitiesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data get data;
}

abstract class OcsGetCapabilitiesResponseApplicationJson_Ocs
    implements
        OcsGetCapabilitiesResponseApplicationJson_OcsInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson_Ocs, OcsGetCapabilitiesResponseApplicationJson_OcsBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs([
    final void Function(OcsGetCapabilitiesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class OcsGetCapabilitiesResponseApplicationJsonInterface {
  OcsGetCapabilitiesResponseApplicationJson_Ocs get ocs;
}

abstract class OcsGetCapabilitiesResponseApplicationJson
    implements
        OcsGetCapabilitiesResponseApplicationJsonInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson, OcsGetCapabilitiesResponseApplicationJsonBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson([
    final void Function(OcsGetCapabilitiesResponseApplicationJsonBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProfileApiSetVisibilityResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ProfileApiSetVisibilityResponseApplicationJson_Ocs
    implements
        ProfileApiSetVisibilityResponseApplicationJson_OcsInterface,
        Built<ProfileApiSetVisibilityResponseApplicationJson_Ocs,
            ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder> {
  factory ProfileApiSetVisibilityResponseApplicationJson_Ocs([
    final void Function(ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProfileApiSetVisibilityResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProfileApiSetVisibilityResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProfileApiSetVisibilityResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProfileApiSetVisibilityResponseApplicationJson_Ocs> get serializer =>
      _$profileApiSetVisibilityResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProfileApiSetVisibilityResponseApplicationJsonInterface {
  ProfileApiSetVisibilityResponseApplicationJson_Ocs get ocs;
}

abstract class ProfileApiSetVisibilityResponseApplicationJson
    implements
        ProfileApiSetVisibilityResponseApplicationJsonInterface,
        Built<ProfileApiSetVisibilityResponseApplicationJson, ProfileApiSetVisibilityResponseApplicationJsonBuilder> {
  factory ProfileApiSetVisibilityResponseApplicationJson([
    final void Function(ProfileApiSetVisibilityResponseApplicationJsonBuilder)? b,
  ]) = _$ProfileApiSetVisibilityResponseApplicationJson;

  // coverage:ignore-start
  const ProfileApiSetVisibilityResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProfileApiSetVisibilityResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProfileApiSetVisibilityResponseApplicationJson> get serializer =>
      _$profileApiSetVisibilityResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceInterface {
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  OpenGraphObject get openGraphObject;
  bool get accessible;
}

abstract class Reference implements ReferenceInterface, Built<Reference, ReferenceBuilder> {
  factory Reference([final void Function(ReferenceBuilder)? b]) = _$Reference;

  // coverage:ignore-start
  const Reference._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Reference.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Reference> get serializer => _$referenceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, Reference> get references;
}

abstract class ReferenceApiResolveOneResponseApplicationJson_Ocs_Data
    implements
        ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiResolveOneResponseApplicationJson_Ocs_Data,
            ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs_Data([
    final void Function(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiResolveOneResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveOneResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiResolveOneResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiResolveOneResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiResolveOneResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiResolveOneResponseApplicationJson_Ocs
    implements
        ReferenceApiResolveOneResponseApplicationJson_OcsInterface,
        Built<ReferenceApiResolveOneResponseApplicationJson_Ocs,
            ReferenceApiResolveOneResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs([
    final void Function(ReferenceApiResolveOneResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiResolveOneResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiResolveOneResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveOneResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiResolveOneResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiResolveOneResponseApplicationJsonInterface {
  ReferenceApiResolveOneResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiResolveOneResponseApplicationJson
    implements
        ReferenceApiResolveOneResponseApplicationJsonInterface,
        Built<ReferenceApiResolveOneResponseApplicationJson, ReferenceApiResolveOneResponseApplicationJsonBuilder> {
  factory ReferenceApiResolveOneResponseApplicationJson([
    final void Function(ReferenceApiResolveOneResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiResolveOneResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiResolveOneResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveOneResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveOneResponseApplicationJson> get serializer =>
      _$referenceApiResolveOneResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiResolveResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, Reference> get references;
}

abstract class ReferenceApiResolveResponseApplicationJson_Ocs_Data
    implements
        ReferenceApiResolveResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiResolveResponseApplicationJson_Ocs_Data,
            ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiResolveResponseApplicationJson_Ocs_Data([
    final void Function(ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiResolveResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiResolveResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiResolveResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiResolveResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiResolveResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiResolveResponseApplicationJson_Ocs
    implements
        ReferenceApiResolveResponseApplicationJson_OcsInterface,
        Built<ReferenceApiResolveResponseApplicationJson_Ocs, ReferenceApiResolveResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiResolveResponseApplicationJson_Ocs([
    final void Function(ReferenceApiResolveResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiResolveResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiResolveResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiResolveResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiResolveResponseApplicationJsonInterface {
  ReferenceApiResolveResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiResolveResponseApplicationJson
    implements
        ReferenceApiResolveResponseApplicationJsonInterface,
        Built<ReferenceApiResolveResponseApplicationJson, ReferenceApiResolveResponseApplicationJsonBuilder> {
  factory ReferenceApiResolveResponseApplicationJson([
    final void Function(ReferenceApiResolveResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiResolveResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiResolveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveResponseApplicationJson> get serializer =>
      _$referenceApiResolveResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiExtractResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, Reference> get references;
}

abstract class ReferenceApiExtractResponseApplicationJson_Ocs_Data
    implements
        ReferenceApiExtractResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiExtractResponseApplicationJson_Ocs_Data,
            ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiExtractResponseApplicationJson_Ocs_Data([
    final void Function(ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiExtractResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiExtractResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiExtractResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiExtractResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiExtractResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiExtractResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiExtractResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiExtractResponseApplicationJson_Ocs
    implements
        ReferenceApiExtractResponseApplicationJson_OcsInterface,
        Built<ReferenceApiExtractResponseApplicationJson_Ocs, ReferenceApiExtractResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiExtractResponseApplicationJson_Ocs([
    final void Function(ReferenceApiExtractResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiExtractResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiExtractResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiExtractResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiExtractResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiExtractResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiExtractResponseApplicationJsonInterface {
  ReferenceApiExtractResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiExtractResponseApplicationJson
    implements
        ReferenceApiExtractResponseApplicationJsonInterface,
        Built<ReferenceApiExtractResponseApplicationJson, ReferenceApiExtractResponseApplicationJsonBuilder> {
  factory ReferenceApiExtractResponseApplicationJson([
    final void Function(ReferenceApiExtractResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiExtractResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiExtractResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiExtractResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiExtractResponseApplicationJson> get serializer =>
      _$referenceApiExtractResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceProviderInterface {
  String get id;
  String get title;
  @BuiltValueField(wireName: 'icon_url')
  String get iconUrl;
  int get order;
  @BuiltValueField(wireName: 'search_providers_ids')
  BuiltList<String>? get searchProvidersIds;
}

abstract class ReferenceProvider
    implements ReferenceProviderInterface, Built<ReferenceProvider, ReferenceProviderBuilder> {
  factory ReferenceProvider([final void Function(ReferenceProviderBuilder)? b]) = _$ReferenceProvider;

  // coverage:ignore-start
  const ReferenceProvider._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceProvider.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceProvider> get serializer => _$referenceProviderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<ReferenceProvider> get data;
}

abstract class ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs
    implements
        ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface,
        Built<ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs,
            ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs([
    final void Function(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiGetProvidersInfoResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiGetProvidersInfoResponseApplicationJsonInterface {
  ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiGetProvidersInfoResponseApplicationJson
    implements
        ReferenceApiGetProvidersInfoResponseApplicationJsonInterface,
        Built<ReferenceApiGetProvidersInfoResponseApplicationJson,
            ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder> {
  factory ReferenceApiGetProvidersInfoResponseApplicationJson([
    final void Function(ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiGetProvidersInfoResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiGetProvidersInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiGetProvidersInfoResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiGetProvidersInfoResponseApplicationJson> get serializer =>
      _$referenceApiGetProvidersInfoResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface {
  bool get success;
}

abstract class ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data
    implements
        ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data,
            ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data([
    final void Function(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiTouchProviderResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiTouchProviderResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiTouchProviderResponseApplicationJson_Ocs
    implements
        ReferenceApiTouchProviderResponseApplicationJson_OcsInterface,
        Built<ReferenceApiTouchProviderResponseApplicationJson_Ocs,
            ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs([
    final void Function(ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiTouchProviderResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiTouchProviderResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiTouchProviderResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ReferenceApiTouchProviderResponseApplicationJsonInterface {
  ReferenceApiTouchProviderResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiTouchProviderResponseApplicationJson
    implements
        ReferenceApiTouchProviderResponseApplicationJsonInterface,
        Built<ReferenceApiTouchProviderResponseApplicationJson,
            ReferenceApiTouchProviderResponseApplicationJsonBuilder> {
  factory ReferenceApiTouchProviderResponseApplicationJson([
    final void Function(ReferenceApiTouchProviderResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiTouchProviderResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiTouchProviderResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiTouchProviderResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiTouchProviderResponseApplicationJson> get serializer =>
      _$referenceApiTouchProviderResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface {
  String get id;
  String get name;
  String get description;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types
    implements
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types,
            TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types([
    final void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonOcsDataTypesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get types;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data
    implements
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data,
            TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data([
    final void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiTaskTypesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson_Ocs
    implements
        TextProcessingApiTaskTypesResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson_Ocs,
            TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs([
    final void Function(TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiTaskTypesResponseApplicationJsonInterface {
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson
    implements
        TextProcessingApiTaskTypesResponseApplicationJsonInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson,
            TextProcessingApiTaskTypesResponseApplicationJsonBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson([
    final void Function(TextProcessingApiTaskTypesResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingTaskInterface {
  int? get id;
  String get type;
  int get status;
  String? get userId;
  String get appId;
  String get input;
  String? get output;
  String get identifier;
}

abstract class TextProcessingTask
    implements TextProcessingTaskInterface, Built<TextProcessingTask, TextProcessingTaskBuilder> {
  factory TextProcessingTask([final void Function(TextProcessingTaskBuilder)? b]) = _$TextProcessingTask;

  // coverage:ignore-start
  const TextProcessingTask._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingTask.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingTask> get serializer => _$textProcessingTaskSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface {
  TextProcessingTask get task;
}

abstract class TextProcessingApiScheduleResponseApplicationJson_Ocs_Data
    implements
        TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiScheduleResponseApplicationJson_Ocs_Data,
            TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs_Data([
    final void Function(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiScheduleResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiScheduleResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiScheduleResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiScheduleResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiScheduleResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiScheduleResponseApplicationJson_Ocs
    implements
        TextProcessingApiScheduleResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiScheduleResponseApplicationJson_Ocs,
            TextProcessingApiScheduleResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs([
    final void Function(TextProcessingApiScheduleResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiScheduleResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiScheduleResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiScheduleResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiScheduleResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiScheduleResponseApplicationJsonInterface {
  TextProcessingApiScheduleResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiScheduleResponseApplicationJson
    implements
        TextProcessingApiScheduleResponseApplicationJsonInterface,
        Built<TextProcessingApiScheduleResponseApplicationJson,
            TextProcessingApiScheduleResponseApplicationJsonBuilder> {
  factory TextProcessingApiScheduleResponseApplicationJson([
    final void Function(TextProcessingApiScheduleResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiScheduleResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiScheduleResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiScheduleResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiScheduleResponseApplicationJson> get serializer =>
      _$textProcessingApiScheduleResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface {
  TextProcessingTask get task;
}

abstract class TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data
    implements
        TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data,
            TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data([
    final void Function(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiGetTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiGetTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiGetTaskResponseApplicationJson_Ocs
    implements
        TextProcessingApiGetTaskResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiGetTaskResponseApplicationJson_Ocs,
            TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs([
    final void Function(TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiGetTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiGetTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiGetTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiGetTaskResponseApplicationJsonInterface {
  TextProcessingApiGetTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiGetTaskResponseApplicationJson
    implements
        TextProcessingApiGetTaskResponseApplicationJsonInterface,
        Built<TextProcessingApiGetTaskResponseApplicationJson, TextProcessingApiGetTaskResponseApplicationJsonBuilder> {
  factory TextProcessingApiGetTaskResponseApplicationJson([
    final void Function(TextProcessingApiGetTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiGetTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiGetTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiGetTaskResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiGetTaskResponseApplicationJson> get serializer =>
      _$textProcessingApiGetTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface {
  TextProcessingTask get task;
}

abstract class TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data
    implements
        TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data,
            TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data([
    final void Function(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiDeleteTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiDeleteTaskResponseApplicationJson_Ocs
    implements
        TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs,
            TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs([
    final void Function(TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiDeleteTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiDeleteTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiDeleteTaskResponseApplicationJsonInterface {
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiDeleteTaskResponseApplicationJson
    implements
        TextProcessingApiDeleteTaskResponseApplicationJsonInterface,
        Built<TextProcessingApiDeleteTaskResponseApplicationJson,
            TextProcessingApiDeleteTaskResponseApplicationJsonBuilder> {
  factory TextProcessingApiDeleteTaskResponseApplicationJson([
    final void Function(TextProcessingApiDeleteTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiDeleteTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiDeleteTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiDeleteTaskResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson> get serializer =>
      _$textProcessingApiDeleteTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TextProcessingTask> get tasks;
}

abstract class TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data
    implements
        TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data,
            TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data([
    final void Function(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiListTasksByAppResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiListTasksByAppResponseApplicationJson_Ocs
    implements
        TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs,
            TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs([
    final void Function(TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiListTasksByAppResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiListTasksByAppResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TextProcessingApiListTasksByAppResponseApplicationJsonInterface {
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiListTasksByAppResponseApplicationJson
    implements
        TextProcessingApiListTasksByAppResponseApplicationJsonInterface,
        Built<TextProcessingApiListTasksByAppResponseApplicationJson,
            TextProcessingApiListTasksByAppResponseApplicationJsonBuilder> {
  factory TextProcessingApiListTasksByAppResponseApplicationJson([
    final void Function(TextProcessingApiListTasksByAppResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiListTasksByAppResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiListTasksByAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiListTasksByAppResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson> get serializer =>
      _$textProcessingApiListTasksByAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface {
  String get from;
  String get fromLabel;
  String get to;
  String get toLabel;
}

abstract class TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages
    implements
        TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface,
        Built<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages,
            TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages([
    final void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonOcsDataLanguagesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get languages;
  bool get languageDetection;
}

abstract class TranslationApiLanguagesResponseApplicationJson_Ocs_Data
    implements
        TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface,
        Built<TranslationApiLanguagesResponseApplicationJson_Ocs_Data,
            TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data([
    final void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TranslationApiLanguagesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data get data;
}

abstract class TranslationApiLanguagesResponseApplicationJson_Ocs
    implements
        TranslationApiLanguagesResponseApplicationJson_OcsInterface,
        Built<TranslationApiLanguagesResponseApplicationJson_Ocs,
            TranslationApiLanguagesResponseApplicationJson_OcsBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson_Ocs([
    final void Function(TranslationApiLanguagesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TranslationApiLanguagesResponseApplicationJsonInterface {
  TranslationApiLanguagesResponseApplicationJson_Ocs get ocs;
}

abstract class TranslationApiLanguagesResponseApplicationJson
    implements
        TranslationApiLanguagesResponseApplicationJsonInterface,
        Built<TranslationApiLanguagesResponseApplicationJson, TranslationApiLanguagesResponseApplicationJsonBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson([
    final void Function(TranslationApiLanguagesResponseApplicationJsonBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TranslationApiTranslateResponseApplicationJson_Ocs_DataInterface {
  String get text;
  String? get from;
}

abstract class TranslationApiTranslateResponseApplicationJson_Ocs_Data
    implements
        TranslationApiTranslateResponseApplicationJson_Ocs_DataInterface,
        Built<TranslationApiTranslateResponseApplicationJson_Ocs_Data,
            TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder> {
  factory TranslationApiTranslateResponseApplicationJson_Ocs_Data([
    final void Function(TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TranslationApiTranslateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TranslationApiTranslateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiTranslateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiTranslateResponseApplicationJson_Ocs_Data> get serializer =>
      _$translationApiTranslateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TranslationApiTranslateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TranslationApiTranslateResponseApplicationJson_Ocs_Data get data;
}

abstract class TranslationApiTranslateResponseApplicationJson_Ocs
    implements
        TranslationApiTranslateResponseApplicationJson_OcsInterface,
        Built<TranslationApiTranslateResponseApplicationJson_Ocs,
            TranslationApiTranslateResponseApplicationJson_OcsBuilder> {
  factory TranslationApiTranslateResponseApplicationJson_Ocs([
    final void Function(TranslationApiTranslateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TranslationApiTranslateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TranslationApiTranslateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiTranslateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiTranslateResponseApplicationJson_Ocs> get serializer =>
      _$translationApiTranslateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class TranslationApiTranslateResponseApplicationJsonInterface {
  TranslationApiTranslateResponseApplicationJson_Ocs get ocs;
}

abstract class TranslationApiTranslateResponseApplicationJson
    implements
        TranslationApiTranslateResponseApplicationJsonInterface,
        Built<TranslationApiTranslateResponseApplicationJson, TranslationApiTranslateResponseApplicationJsonBuilder> {
  factory TranslationApiTranslateResponseApplicationJson([
    final void Function(TranslationApiTranslateResponseApplicationJsonBuilder)? b,
  ]) = _$TranslationApiTranslateResponseApplicationJson;

  // coverage:ignore-start
  const TranslationApiTranslateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiTranslateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiTranslateResponseApplicationJson> get serializer =>
      _$translationApiTranslateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchProviderInterface {
  String get id;
  String get name;
  int get order;
}

abstract class UnifiedSearchProvider
    implements UnifiedSearchProviderInterface, Built<UnifiedSearchProvider, UnifiedSearchProviderBuilder> {
  factory UnifiedSearchProvider([final void Function(UnifiedSearchProviderBuilder)? b]) = _$UnifiedSearchProvider;

  // coverage:ignore-start
  const UnifiedSearchProvider._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchProvider.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchProvider> get serializer => _$unifiedSearchProviderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchGetProvidersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<UnifiedSearchProvider> get data;
}

abstract class UnifiedSearchGetProvidersResponseApplicationJson_Ocs
    implements
        UnifiedSearchGetProvidersResponseApplicationJson_OcsInterface,
        Built<UnifiedSearchGetProvidersResponseApplicationJson_Ocs,
            UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder> {
  factory UnifiedSearchGetProvidersResponseApplicationJson_Ocs([
    final void Function(UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UnifiedSearchGetProvidersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchGetProvidersResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchGetProvidersResponseApplicationJson_Ocs> get serializer =>
      _$unifiedSearchGetProvidersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchGetProvidersResponseApplicationJsonInterface {
  UnifiedSearchGetProvidersResponseApplicationJson_Ocs get ocs;
}

abstract class UnifiedSearchGetProvidersResponseApplicationJson
    implements
        UnifiedSearchGetProvidersResponseApplicationJsonInterface,
        Built<UnifiedSearchGetProvidersResponseApplicationJson,
            UnifiedSearchGetProvidersResponseApplicationJsonBuilder> {
  factory UnifiedSearchGetProvidersResponseApplicationJson([
    final void Function(UnifiedSearchGetProvidersResponseApplicationJsonBuilder)? b,
  ]) = _$UnifiedSearchGetProvidersResponseApplicationJson;

  // coverage:ignore-start
  const UnifiedSearchGetProvidersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchGetProvidersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchGetProvidersResponseApplicationJson> get serializer =>
      _$unifiedSearchGetProvidersResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchSearchCursorInterface {
  int? get $int;
  String? get string;
}

abstract class UnifiedSearchSearchCursor
    implements UnifiedSearchSearchCursorInterface, Built<UnifiedSearchSearchCursor, UnifiedSearchSearchCursorBuilder> {
  factory UnifiedSearchSearchCursor([final void Function(UnifiedSearchSearchCursorBuilder)? b]) =
      _$UnifiedSearchSearchCursor;

  // coverage:ignore-start
  const UnifiedSearchSearchCursor._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchSearchCursor.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchSearchCursor> get serializer => _$UnifiedSearchSearchCursorSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UnifiedSearchSearchCursorBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._string].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', 'string' for ${b._data}");
    }
  }
}

class _$UnifiedSearchSearchCursorSerializer implements PrimitiveSerializer<UnifiedSearchSearchCursor> {
  @override
  final Iterable<Type> types = const [UnifiedSearchSearchCursor, _$UnifiedSearchSearchCursor];

  @override
  final String wireName = 'UnifiedSearchSearchCursor';

  @override
  Object serialize(
    final Serializers serializers,
    final UnifiedSearchSearchCursor object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UnifiedSearchSearchCursor deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchSearchCursorBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchResultEntryInterface {
  String get thumbnailUrl;
  String get title;
  String get subline;
  String get resourceUrl;
  String get icon;
  bool get rounded;
  BuiltList<String> get attributes;
}

abstract class UnifiedSearchResultEntry
    implements UnifiedSearchResultEntryInterface, Built<UnifiedSearchResultEntry, UnifiedSearchResultEntryBuilder> {
  factory UnifiedSearchResultEntry([final void Function(UnifiedSearchResultEntryBuilder)? b]) =
      _$UnifiedSearchResultEntry;

  // coverage:ignore-start
  const UnifiedSearchResultEntry._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchResultEntry.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchResultEntry> get serializer => _$unifiedSearchResultEntrySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchResult_CursorInterface {
  int? get $int;
  String? get string;
}

abstract class UnifiedSearchResult_Cursor
    implements
        UnifiedSearchResult_CursorInterface,
        Built<UnifiedSearchResult_Cursor, UnifiedSearchResult_CursorBuilder> {
  factory UnifiedSearchResult_Cursor([final void Function(UnifiedSearchResult_CursorBuilder)? b]) =
      _$UnifiedSearchResult_Cursor;

  // coverage:ignore-start
  const UnifiedSearchResult_Cursor._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchResult_Cursor.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchResult_Cursor> get serializer => _$UnifiedSearchResult_CursorSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final UnifiedSearchResult_CursorBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._string].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', 'string' for ${b._data}");
    }
  }
}

class _$UnifiedSearchResult_CursorSerializer implements PrimitiveSerializer<UnifiedSearchResult_Cursor> {
  @override
  final Iterable<Type> types = const [UnifiedSearchResult_Cursor, _$UnifiedSearchResult_Cursor];

  @override
  final String wireName = 'UnifiedSearchResult_Cursor';

  @override
  Object serialize(
    final Serializers serializers,
    final UnifiedSearchResult_Cursor object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  UnifiedSearchResult_Cursor deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchResult_CursorBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
      result.string = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchResultInterface {
  String get name;
  bool get isPaginated;
  BuiltList<UnifiedSearchResultEntry> get entries;
  UnifiedSearchResult_Cursor? get cursor;
}

abstract class UnifiedSearchResult
    implements UnifiedSearchResultInterface, Built<UnifiedSearchResult, UnifiedSearchResultBuilder> {
  factory UnifiedSearchResult([final void Function(UnifiedSearchResultBuilder)? b]) = _$UnifiedSearchResult;

  // coverage:ignore-start
  const UnifiedSearchResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchResult> get serializer => _$unifiedSearchResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchSearchResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UnifiedSearchResult get data;
}

abstract class UnifiedSearchSearchResponseApplicationJson_Ocs
    implements
        UnifiedSearchSearchResponseApplicationJson_OcsInterface,
        Built<UnifiedSearchSearchResponseApplicationJson_Ocs, UnifiedSearchSearchResponseApplicationJson_OcsBuilder> {
  factory UnifiedSearchSearchResponseApplicationJson_Ocs([
    final void Function(UnifiedSearchSearchResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UnifiedSearchSearchResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UnifiedSearchSearchResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchSearchResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchSearchResponseApplicationJson_Ocs> get serializer =>
      _$unifiedSearchSearchResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class UnifiedSearchSearchResponseApplicationJsonInterface {
  UnifiedSearchSearchResponseApplicationJson_Ocs get ocs;
}

abstract class UnifiedSearchSearchResponseApplicationJson
    implements
        UnifiedSearchSearchResponseApplicationJsonInterface,
        Built<UnifiedSearchSearchResponseApplicationJson, UnifiedSearchSearchResponseApplicationJsonBuilder> {
  factory UnifiedSearchSearchResponseApplicationJson([
    final void Function(UnifiedSearchSearchResponseApplicationJsonBuilder)? b,
  ]) = _$UnifiedSearchSearchResponseApplicationJson;

  // coverage:ignore-start
  const UnifiedSearchSearchResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchSearchResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchSearchResponseApplicationJson> get serializer =>
      _$unifiedSearchSearchResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface {
  BuiltList<String> get regular;
  BuiltList<String> get admin;
}

abstract class WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew
    implements
        WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface,
        Built<WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew,
            WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder> {
  factory WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew([
    final void Function(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder)? b,
  ]) = _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew> get serializer =>
      _$whatsNewGetResponseApplicationJsonOcsDataWhatsNewSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WhatsNewGetResponseApplicationJson_Ocs_DataInterface {
  String get changelogURL;
  String get product;
  String get version;
  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew? get whatsNew;
}

abstract class WhatsNewGetResponseApplicationJson_Ocs_Data
    implements
        WhatsNewGetResponseApplicationJson_Ocs_DataInterface,
        Built<WhatsNewGetResponseApplicationJson_Ocs_Data, WhatsNewGetResponseApplicationJson_Ocs_DataBuilder> {
  factory WhatsNewGetResponseApplicationJson_Ocs_Data([
    final void Function(WhatsNewGetResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WhatsNewGetResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson_Ocs_Data> get serializer =>
      _$whatsNewGetResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WhatsNewGetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WhatsNewGetResponseApplicationJson_Ocs_Data get data;
}

abstract class WhatsNewGetResponseApplicationJson_Ocs
    implements
        WhatsNewGetResponseApplicationJson_OcsInterface,
        Built<WhatsNewGetResponseApplicationJson_Ocs, WhatsNewGetResponseApplicationJson_OcsBuilder> {
  factory WhatsNewGetResponseApplicationJson_Ocs([
    final void Function(WhatsNewGetResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WhatsNewGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson_Ocs> get serializer =>
      _$whatsNewGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WhatsNewGetResponseApplicationJsonInterface {
  WhatsNewGetResponseApplicationJson_Ocs get ocs;
}

abstract class WhatsNewGetResponseApplicationJson
    implements
        WhatsNewGetResponseApplicationJsonInterface,
        Built<WhatsNewGetResponseApplicationJson, WhatsNewGetResponseApplicationJsonBuilder> {
  factory WhatsNewGetResponseApplicationJson([final void Function(WhatsNewGetResponseApplicationJsonBuilder)? b]) =
      _$WhatsNewGetResponseApplicationJson;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson> get serializer =>
      _$whatsNewGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WhatsNewDismissResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class WhatsNewDismissResponseApplicationJson_Ocs
    implements
        WhatsNewDismissResponseApplicationJson_OcsInterface,
        Built<WhatsNewDismissResponseApplicationJson_Ocs, WhatsNewDismissResponseApplicationJson_OcsBuilder> {
  factory WhatsNewDismissResponseApplicationJson_Ocs([
    final void Function(WhatsNewDismissResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WhatsNewDismissResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WhatsNewDismissResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewDismissResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewDismissResponseApplicationJson_Ocs> get serializer =>
      _$whatsNewDismissResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WhatsNewDismissResponseApplicationJsonInterface {
  WhatsNewDismissResponseApplicationJson_Ocs get ocs;
}

abstract class WhatsNewDismissResponseApplicationJson
    implements
        WhatsNewDismissResponseApplicationJsonInterface,
        Built<WhatsNewDismissResponseApplicationJson, WhatsNewDismissResponseApplicationJsonBuilder> {
  factory WhatsNewDismissResponseApplicationJson([
    final void Function(WhatsNewDismissResponseApplicationJsonBuilder)? b,
  ]) = _$WhatsNewDismissResponseApplicationJson;

  // coverage:ignore-start
  const WhatsNewDismissResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewDismissResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewDismissResponseApplicationJson> get serializer =>
      _$whatsNewDismissResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class WipeCheckWipeResponseApplicationJsonInterface {
  bool get wipe;
}

abstract class WipeCheckWipeResponseApplicationJson
    implements
        WipeCheckWipeResponseApplicationJsonInterface,
        Built<WipeCheckWipeResponseApplicationJson, WipeCheckWipeResponseApplicationJsonBuilder> {
  factory WipeCheckWipeResponseApplicationJson([final void Function(WipeCheckWipeResponseApplicationJsonBuilder)? b]) =
      _$WipeCheckWipeResponseApplicationJson;

  // coverage:ignore-start
  const WipeCheckWipeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WipeCheckWipeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WipeCheckWipeResponseApplicationJson> get serializer =>
      _$wipeCheckWipeResponseApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Status), Status.new)
      ..add(Status.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordGetAppPasswordResponseApplicationJson),
        AppPasswordGetAppPasswordResponseApplicationJson.new,
      )
      ..add(AppPasswordGetAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs),
        AppPasswordGetAppPasswordResponseApplicationJson_Ocs.new,
      )
      ..add(AppPasswordGetAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data),
        AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.new,
      )
      ..add(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordRotateAppPasswordResponseApplicationJson),
        AppPasswordRotateAppPasswordResponseApplicationJson.new,
      )
      ..add(AppPasswordRotateAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs),
        AppPasswordRotateAppPasswordResponseApplicationJson_Ocs.new,
      )
      ..add(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data),
        AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.new,
      )
      ..add(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson),
        AppPasswordDeleteAppPasswordResponseApplicationJson.new,
      )
      ..add(AppPasswordDeleteAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs),
        AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.new,
      )
      ..add(AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(
        const FullType(AutoCompleteGetResponseApplicationJson),
        AutoCompleteGetResponseApplicationJson.new,
      )
      ..add(AutoCompleteGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AutoCompleteGetResponseApplicationJson_Ocs),
        AutoCompleteGetResponseApplicationJson_Ocs.new,
      )
      ..add(AutoCompleteGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(AutocompleteResult), AutocompleteResult.new)
      ..add(AutocompleteResult.serializer)
      ..addBuilderFactory(const FullType(AutocompleteResult_Status), AutocompleteResult_Status.new)
      ..add(AutocompleteResult_Status.serializer)
      ..addBuilderFactory(const FullType(AutocompleteResult_Status0), AutocompleteResult_Status0.new)
      ..add(AutocompleteResult_Status0.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AutocompleteResult)]),
        ListBuilder<AutocompleteResult>.new,
      )
      ..addBuilderFactory(const FullType(AvatarAvatarGetAvatarDarkHeaders), AvatarAvatarGetAvatarDarkHeaders.new)
      ..add(AvatarAvatarGetAvatarDarkHeaders.serializer)
      ..addBuilderFactory(const FullType(AvatarAvatarGetAvatarHeaders), AvatarAvatarGetAvatarHeaders.new)
      ..add(AvatarAvatarGetAvatarHeaders.serializer)
      ..addBuilderFactory(const FullType(LoginFlowV2Credentials), LoginFlowV2Credentials.new)
      ..add(LoginFlowV2Credentials.serializer)
      ..addBuilderFactory(const FullType(LoginFlowV2), LoginFlowV2.new)
      ..add(LoginFlowV2.serializer)
      ..addBuilderFactory(const FullType(LoginFlowV2_Poll), LoginFlowV2_Poll.new)
      ..add(LoginFlowV2_Poll.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson),
        CollaborationResourcesSearchCollectionsResponseApplicationJson.new,
      )
      ..add(CollaborationResourcesSearchCollectionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs),
        CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.new,
      )
      ..add(CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Collection), Collection.new)
      ..add(Collection.serializer)
      ..addBuilderFactory(const FullType(Resource), Resource.new)
      ..add(Resource.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(const FullType(OpenGraphObject), OpenGraphObject.new)
      ..add(OpenGraphObject.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Resource)]), ListBuilder<Resource>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Collection)]), ListBuilder<Collection>.new)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesListCollectionResponseApplicationJson),
        CollaborationResourcesListCollectionResponseApplicationJson.new,
      )
      ..add(CollaborationResourcesListCollectionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesListCollectionResponseApplicationJson_Ocs),
        CollaborationResourcesListCollectionResponseApplicationJson_Ocs.new,
      )
      ..add(CollaborationResourcesListCollectionResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson),
        CollaborationResourcesRenameCollectionResponseApplicationJson.new,
      )
      ..add(CollaborationResourcesRenameCollectionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs),
        CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.new,
      )
      ..add(CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesAddResourceResponseApplicationJson),
        CollaborationResourcesAddResourceResponseApplicationJson.new,
      )
      ..add(CollaborationResourcesAddResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesAddResourceResponseApplicationJson_Ocs),
        CollaborationResourcesAddResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CollaborationResourcesAddResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson),
        CollaborationResourcesRemoveResourceResponseApplicationJson.new,
      )
      ..add(CollaborationResourcesRemoveResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs),
        CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson),
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJson.new,
      )
      ..add(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs),
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson),
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.new,
      )
      ..add(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs),
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(HoverCardGetUserResponseApplicationJson),
        HoverCardGetUserResponseApplicationJson.new,
      )
      ..add(HoverCardGetUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(HoverCardGetUserResponseApplicationJson_Ocs),
        HoverCardGetUserResponseApplicationJson_Ocs.new,
      )
      ..add(HoverCardGetUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(HoverCardGetUserResponseApplicationJson_Ocs_Data),
        HoverCardGetUserResponseApplicationJson_Ocs_Data.new,
      )
      ..add(HoverCardGetUserResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(ContactsAction), ContactsAction.new)
      ..add(ContactsAction.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ContactsAction)]), ListBuilder<ContactsAction>.new)
      ..addBuilderFactory(
        const FullType(NavigationGetAppsNavigationResponseApplicationJson),
        NavigationGetAppsNavigationResponseApplicationJson.new,
      )
      ..add(NavigationGetAppsNavigationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NavigationGetAppsNavigationResponseApplicationJson_Ocs),
        NavigationGetAppsNavigationResponseApplicationJson_Ocs.new,
      )
      ..add(NavigationGetAppsNavigationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(NavigationEntry), NavigationEntry.new)
      ..add(NavigationEntry.serializer)
      ..addBuilderFactory(const FullType(NavigationEntry_Order), NavigationEntry_Order.new)
      ..add(NavigationEntry_Order.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NavigationEntry)]), ListBuilder<NavigationEntry>.new)
      ..addBuilderFactory(
        const FullType(NavigationGetSettingsNavigationResponseApplicationJson),
        NavigationGetSettingsNavigationResponseApplicationJson.new,
      )
      ..add(NavigationGetSettingsNavigationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NavigationGetSettingsNavigationResponseApplicationJson_Ocs),
        NavigationGetSettingsNavigationResponseApplicationJson_Ocs.new,
      )
      ..add(NavigationGetSettingsNavigationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OcmOcmDiscoveryHeaders), OcmOcmDiscoveryHeaders.new)
      ..add(OcmOcmDiscoveryHeaders.serializer)
      ..addBuilderFactory(const FullType(OcmDiscoveryResponseApplicationJson), OcmDiscoveryResponseApplicationJson.new)
      ..add(OcmDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes),
        OcmDiscoveryResponseApplicationJson_ResourceTypes.new,
      )
      ..add(OcmDiscoveryResponseApplicationJson_ResourceTypes.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols),
        OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.new,
      )
      ..add(OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes)]),
        ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes>.new,
      )
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson),
        OcsGetCapabilitiesResponseApplicationJson.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs),
        OcsGetCapabilitiesResponseApplicationJson_Ocs.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data),
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version),
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.serializer)
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities),
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities.serializer)
      ..addBuilderFactory(const FullType(CommentsCapabilities), CommentsCapabilities.new)
      ..add(CommentsCapabilities.serializer)
      ..addBuilderFactory(const FullType(CommentsCapabilities_Files), CommentsCapabilities_Files.new)
      ..add(CommentsCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(DavCapabilities), DavCapabilities.new)
      ..add(DavCapabilities.serializer)
      ..addBuilderFactory(const FullType(DavCapabilities_Dav), DavCapabilities_Dav.new)
      ..add(DavCapabilities_Dav.serializer)
      ..addBuilderFactory(const FullType(FilesCapabilities), FilesCapabilities.new)
      ..add(FilesCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesCapabilities_Files), FilesCapabilities_Files.new)
      ..add(FilesCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(
        const FullType(FilesCapabilities_Files_DirectEditing),
        FilesCapabilities_Files_DirectEditing.new,
      )
      ..add(FilesCapabilities_Files_DirectEditing.serializer)
      ..addBuilderFactory(const FullType(FilesSharingCapabilities), FilesSharingCapabilities.new)
      ..add(FilesSharingCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing),
        FilesSharingCapabilities_FilesSharing.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public),
        FilesSharingCapabilities_FilesSharing_Public.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_Password),
        FilesSharingCapabilities_FilesSharing_Public_Password.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_Password.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDate),
        FilesSharingCapabilities_FilesSharing_Public_ExpireDate.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal),
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote),
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_User),
        FilesSharingCapabilities_FilesSharing_User.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_User.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_User_ExpireDate),
        FilesSharingCapabilities_FilesSharing_User_ExpireDate.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_User_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Group),
        FilesSharingCapabilities_FilesSharing_Group.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Group.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Group_ExpireDate),
        FilesSharingCapabilities_FilesSharing_Group_ExpireDate.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Group_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Federation),
        FilesSharingCapabilities_FilesSharing_Federation.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Federation.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDate),
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDate.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Federation_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported),
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Sharee),
        FilesSharingCapabilities_FilesSharing_Sharee.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Sharee.serializer)
      ..addBuilderFactory(const FullType(FilesTrashbinCapabilities), FilesTrashbinCapabilities.new)
      ..add(FilesTrashbinCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesTrashbinCapabilities_Files), FilesTrashbinCapabilities_Files.new)
      ..add(FilesTrashbinCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(FilesVersionsCapabilities), FilesVersionsCapabilities.new)
      ..add(FilesVersionsCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesVersionsCapabilities_Files), FilesVersionsCapabilities_Files.new)
      ..add(FilesVersionsCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(NotesCapabilities), NotesCapabilities.new)
      ..add(NotesCapabilities.serializer)
      ..addBuilderFactory(const FullType(NotesCapabilities_Notes), NotesCapabilities_Notes.new)
      ..add(NotesCapabilities_Notes.serializer)
      ..addBuilderFactory(const FullType(NotificationsCapabilities), NotificationsCapabilities.new)
      ..add(NotificationsCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsCapabilities_Notifications),
        NotificationsCapabilities_Notifications.new,
      )
      ..add(NotificationsCapabilities_Notifications.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiCapabilities), ProvisioningApiCapabilities.new)
      ..add(ProvisioningApiCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiCapabilities_ProvisioningApi),
        ProvisioningApiCapabilities_ProvisioningApi.new,
      )
      ..add(ProvisioningApiCapabilities_ProvisioningApi.serializer)
      ..addBuilderFactory(const FullType(SharebymailCapabilities), SharebymailCapabilities.new)
      ..add(SharebymailCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing),
        SharebymailCapabilities_FilesSharing.new,
      )
      ..add(SharebymailCapabilities_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail),
        SharebymailCapabilities_FilesSharing_Sharebymail.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop),
        SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_Password),
        SharebymailCapabilities_FilesSharing_Sharebymail_Password.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate),
        SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.new,
      )
      ..add(SharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.serializer)
      ..addBuilderFactory(const FullType(SpreedPublicCapabilities), SpreedPublicCapabilities.new)
      ..add(SpreedPublicCapabilities.serializer)
      ..addBuilderFactory(const FullType(SpreedPublicCapabilities0), SpreedPublicCapabilities0.new)
      ..add(SpreedPublicCapabilities0.serializer)
      ..addBuilderFactory(const FullType(SpreedPublicCapabilities0_Spreed), SpreedPublicCapabilities0_Spreed.new)
      ..add(SpreedPublicCapabilities0_Spreed.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config),
        SpreedPublicCapabilities0_Spreed_Config.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Attachments),
        SpreedPublicCapabilities0_Spreed_Config_Attachments.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Attachments.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Call),
        SpreedPublicCapabilities0_Spreed_Config_Call.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Call.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Chat),
        SpreedPublicCapabilities0_Spreed_Config_Chat.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Chat.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Conversations),
        SpreedPublicCapabilities0_Spreed_Config_Conversations.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Conversations.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Previews),
        SpreedPublicCapabilities0_Spreed_Config_Previews.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Previews.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Signaling),
        SpreedPublicCapabilities0_Spreed_Config_Signaling.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Signaling.serializer)
      ..addBuilderFactory(const FullType(ThemingPublicCapabilities), ThemingPublicCapabilities.new)
      ..add(ThemingPublicCapabilities.serializer)
      ..addBuilderFactory(const FullType(ThemingPublicCapabilities_Theming), ThemingPublicCapabilities_Theming.new)
      ..add(ThemingPublicCapabilities_Theming.serializer)
      ..addBuilderFactory(const FullType(UserStatusCapabilities), UserStatusCapabilities.new)
      ..add(UserStatusCapabilities.serializer)
      ..addBuilderFactory(const FullType(UserStatusCapabilities_UserStatus), UserStatusCapabilities_UserStatus.new)
      ..add(UserStatusCapabilities_UserStatus.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusCapabilities), WeatherStatusCapabilities.new)
      ..add(WeatherStatusCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusCapabilities_WeatherStatus),
        WeatherStatusCapabilities_WeatherStatus.new,
      )
      ..add(WeatherStatusCapabilities_WeatherStatus.serializer)
      ..addBuilderFactory(
        const FullType(ProfileApiSetVisibilityResponseApplicationJson),
        ProfileApiSetVisibilityResponseApplicationJson.new,
      )
      ..add(ProfileApiSetVisibilityResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProfileApiSetVisibilityResponseApplicationJson_Ocs),
        ProfileApiSetVisibilityResponseApplicationJson_Ocs.new,
      )
      ..add(ProfileApiSetVisibilityResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveOneResponseApplicationJson),
        ReferenceApiResolveOneResponseApplicationJson.new,
      )
      ..add(ReferenceApiResolveOneResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs),
        ReferenceApiResolveOneResponseApplicationJson_Ocs.new,
      )
      ..add(ReferenceApiResolveOneResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs_Data),
        ReferenceApiResolveOneResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ReferenceApiResolveOneResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(Reference), Reference.new)
      ..add(Reference.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
        MapBuilder<String, Reference>.new,
      )
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveResponseApplicationJson),
        ReferenceApiResolveResponseApplicationJson.new,
      )
      ..add(ReferenceApiResolveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveResponseApplicationJson_Ocs),
        ReferenceApiResolveResponseApplicationJson_Ocs.new,
      )
      ..add(ReferenceApiResolveResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveResponseApplicationJson_Ocs_Data),
        ReferenceApiResolveResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ReferenceApiResolveResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiExtractResponseApplicationJson),
        ReferenceApiExtractResponseApplicationJson.new,
      )
      ..add(ReferenceApiExtractResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiExtractResponseApplicationJson_Ocs),
        ReferenceApiExtractResponseApplicationJson_Ocs.new,
      )
      ..add(ReferenceApiExtractResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiExtractResponseApplicationJson_Ocs_Data),
        ReferenceApiExtractResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ReferenceApiExtractResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson),
        ReferenceApiGetProvidersInfoResponseApplicationJson.new,
      )
      ..add(ReferenceApiGetProvidersInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs),
        ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.new,
      )
      ..add(ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ReferenceProvider), ReferenceProvider.new)
      ..add(ReferenceProvider.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ReferenceProvider)]), ListBuilder<ReferenceProvider>.new)
      ..addBuilderFactory(
        const FullType(ReferenceApiTouchProviderResponseApplicationJson),
        ReferenceApiTouchProviderResponseApplicationJson.new,
      )
      ..add(ReferenceApiTouchProviderResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs),
        ReferenceApiTouchProviderResponseApplicationJson_Ocs.new,
      )
      ..add(ReferenceApiTouchProviderResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data),
        ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson),
        TextProcessingApiTaskTypesResponseApplicationJson.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs),
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data),
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types),
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types)]),
        ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>.new,
      )
      ..addBuilderFactory(
        const FullType(TextProcessingApiScheduleResponseApplicationJson),
        TextProcessingApiScheduleResponseApplicationJson.new,
      )
      ..add(TextProcessingApiScheduleResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs),
        TextProcessingApiScheduleResponseApplicationJson_Ocs.new,
      )
      ..add(TextProcessingApiScheduleResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs_Data),
        TextProcessingApiScheduleResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextProcessingApiScheduleResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(TextProcessingTask), TextProcessingTask.new)
      ..add(TextProcessingTask.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiGetTaskResponseApplicationJson),
        TextProcessingApiGetTaskResponseApplicationJson.new,
      )
      ..add(TextProcessingApiGetTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs),
        TextProcessingApiGetTaskResponseApplicationJson_Ocs.new,
      )
      ..add(TextProcessingApiGetTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data),
        TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiDeleteTaskResponseApplicationJson),
        TextProcessingApiDeleteTaskResponseApplicationJson.new,
      )
      ..add(TextProcessingApiDeleteTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs),
        TextProcessingApiDeleteTaskResponseApplicationJson_Ocs.new,
      )
      ..add(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data),
        TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiListTasksByAppResponseApplicationJson),
        TextProcessingApiListTasksByAppResponseApplicationJson.new,
      )
      ..add(TextProcessingApiListTasksByAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs),
        TextProcessingApiListTasksByAppResponseApplicationJson_Ocs.new,
      )
      ..add(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data),
        TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TextProcessingTask)]),
        ListBuilder<TextProcessingTask>.new,
      )
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson),
        TranslationApiLanguagesResponseApplicationJson.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs),
        TranslationApiLanguagesResponseApplicationJson_Ocs.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data),
        TranslationApiLanguagesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages),
        TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages)]),
        ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>.new,
      )
      ..addBuilderFactory(
        const FullType(TranslationApiTranslateResponseApplicationJson),
        TranslationApiTranslateResponseApplicationJson.new,
      )
      ..add(TranslationApiTranslateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiTranslateResponseApplicationJson_Ocs),
        TranslationApiTranslateResponseApplicationJson_Ocs.new,
      )
      ..add(TranslationApiTranslateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiTranslateResponseApplicationJson_Ocs_Data),
        TranslationApiTranslateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TranslationApiTranslateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedSearchGetProvidersResponseApplicationJson),
        UnifiedSearchGetProvidersResponseApplicationJson.new,
      )
      ..add(UnifiedSearchGetProvidersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedSearchGetProvidersResponseApplicationJson_Ocs),
        UnifiedSearchGetProvidersResponseApplicationJson_Ocs.new,
      )
      ..add(UnifiedSearchGetProvidersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UnifiedSearchProvider), UnifiedSearchProvider.new)
      ..add(UnifiedSearchProvider.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UnifiedSearchProvider)]),
        ListBuilder<UnifiedSearchProvider>.new,
      )
      ..addBuilderFactory(const FullType(UnifiedSearchSearchCursor), UnifiedSearchSearchCursor.new)
      ..add(UnifiedSearchSearchCursor.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(UnifiedSearchSearchCursor)]),
        ContentString<UnifiedSearchSearchCursor>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedSearchSearchResponseApplicationJson),
        UnifiedSearchSearchResponseApplicationJson.new,
      )
      ..add(UnifiedSearchSearchResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedSearchSearchResponseApplicationJson_Ocs),
        UnifiedSearchSearchResponseApplicationJson_Ocs.new,
      )
      ..add(UnifiedSearchSearchResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UnifiedSearchResult), UnifiedSearchResult.new)
      ..add(UnifiedSearchResult.serializer)
      ..addBuilderFactory(const FullType(UnifiedSearchResultEntry), UnifiedSearchResultEntry.new)
      ..add(UnifiedSearchResultEntry.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UnifiedSearchResultEntry)]),
        ListBuilder<UnifiedSearchResultEntry>.new,
      )
      ..addBuilderFactory(const FullType(UnifiedSearchResult_Cursor), UnifiedSearchResult_Cursor.new)
      ..add(UnifiedSearchResult_Cursor.serializer)
      ..addBuilderFactory(const FullType(WhatsNewGetResponseApplicationJson), WhatsNewGetResponseApplicationJson.new)
      ..add(WhatsNewGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewGetResponseApplicationJson_Ocs),
        WhatsNewGetResponseApplicationJson_Ocs.new,
      )
      ..add(WhatsNewGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data),
        WhatsNewGetResponseApplicationJson_Ocs_Data.new,
      )
      ..add(WhatsNewGetResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew),
        WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.new,
      )
      ..add(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewDismissResponseApplicationJson),
        WhatsNewDismissResponseApplicationJson.new,
      )
      ..add(WhatsNewDismissResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewDismissResponseApplicationJson_Ocs),
        WhatsNewDismissResponseApplicationJson_Ocs.new,
      )
      ..add(WhatsNewDismissResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WipeCheckWipeResponseApplicationJson),
        WipeCheckWipeResponseApplicationJson.new,
      )
      ..add(WipeCheckWipeResponseApplicationJson.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
