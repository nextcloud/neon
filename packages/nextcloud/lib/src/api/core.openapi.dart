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
import 'package:uri/uri.dart';

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

  TextToImageApiClient get textToImageApi => TextToImageApiClient(this);

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
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    var uri = Uri.parse(UriTemplate('/status.php').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/getapppassword').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/apppassword/rotate').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/apppassword').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/autocomplete/get').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    final pathParameters = <String, dynamic>{};
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
    pathParameters['userId'] = userId;
    pathParameters['size'] = size.toString();
    var uri = Uri.parse(UriTemplate('/index.php/avatar/{userId}/{size}/dark').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    final pathParameters = <String, dynamic>{};
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
    pathParameters['userId'] = userId;
    pathParameters['size'] = size.toString();
    var uri = Uri.parse(UriTemplate('/index.php/avatar/{userId}/{size}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    queryParameters['token'] = token;
    var uri = Uri.parse(UriTemplate('/index.php/login/v2/poll').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    var uri = Uri.parse(UriTemplate('/index.php/login/v2').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    pathParameters['filter'] = filter;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/collaboration/resources/collections/search/{filter}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    pathParameters['collectionId'] = collectionId.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['collectionName'] = collectionName;
    pathParameters['collectionId'] = collectionId.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['resourceType'] = resourceType;
    queryParameters['resourceId'] = resourceId;
    pathParameters['collectionId'] = collectionId.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['resourceType'] = resourceType;
    queryParameters['resourceId'] = resourceId;
    pathParameters['collectionId'] = collectionId.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    pathParameters['resourceType'] = resourceType;
    pathParameters['resourceId'] = resourceId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/collaboration/resources/{resourceType}/{resourceId}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['name'] = name;
    pathParameters['baseResourceType'] = baseResourceType;
    pathParameters['baseResourceId'] = baseResourceId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/collaboration/resources/{baseResourceType}/{baseResourceId}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    final pathParameters = <String, dynamic>{};
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
    pathParameters['guestName'] = guestName;
    pathParameters['size'] = size;
    var uri = Uri.parse(UriTemplate('/index.php/avatar/guest/{guestName}/{size}/dark').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    final pathParameters = <String, dynamic>{};
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
    pathParameters['guestName'] = guestName;
    pathParameters['size'] = size;
    if (darkTheme != null && darkTheme != 0) {
      queryParameters['darkTheme'] = darkTheme.toString();
    }
    var uri = Uri.parse(UriTemplate('/index.php/avatar/guest/{guestName}/{size}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    pathParameters['userId'] = userId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/hovercard/v1/{userId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    if (absolute != 0) {
      queryParameters['absolute'] = absolute.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/navigation/apps').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    if (absolute != 0) {
      queryParameters['absolute'] = absolute.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/navigation/settings').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    var uri = Uri.parse(UriTemplate('/index.php/ocm-provider').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/cloud/capabilities').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/core/preview').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    final pathParameters = <String, dynamic>{};
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
    var uri = Uri.parse(UriTemplate('/index.php/core/preview.png').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['paramId'] = paramId;
    queryParameters['visibility'] = visibility;
    pathParameters['targetUserId'] = targetUserId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/profile/{targetUserId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    final pathParameters = <String, dynamic>{};
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
    pathParameters['referenceId'] = referenceId;
    var uri = Uri.parse(UriTemplate('/index.php/core/references/preview/{referenceId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['reference'] = reference;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/references/resolve').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['references[]'] = references.map((final e) => e);
    if (limit != 1) {
      queryParameters['limit'] = limit.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/references/resolve').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['text'] = text;
    if (resolve != 0) {
      queryParameters['resolve'] = resolve.toString();
    }
    if (limit != 1) {
      queryParameters['limit'] = limit.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/references/extract').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/references/providers').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    pathParameters['providerId'] = providerId;
    if (timestamp != null) {
      queryParameters['timestamp'] = timestamp.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/references/provider/{providerId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/textprocessing/tasktypes').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    queryParameters['input'] = input;
    queryParameters['type'] = type;
    queryParameters['appId'] = appId;
    if (identifier != '') {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/textprocessing/schedule').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    pathParameters['id'] = id.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/textprocessing/task/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/textprocessing/task/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    pathParameters['appId'] = appId;
    if (identifier != null) {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/textprocessing/tasks/app/{appId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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

class TextToImageApiClient {
  TextToImageApiClient(this._rootClient);

  final Client _rootClient;

  /// Check whether this feature is available.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Returns availability status
  ///
  /// See:
  ///  * [isAvailableRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextToImageApiIsAvailableResponseApplicationJson, void>> isAvailable({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = isAvailableRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Check whether this feature is available.
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
  ///   * 200: Returns availability status
  ///
  /// See:
  ///  * [isAvailable] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextToImageApiIsAvailableResponseApplicationJson, void> isAvailableRaw({
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
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/text2image/is_available').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<TextToImageApiIsAvailableResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiIsAvailableResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows scheduling a text to image task.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [input] Input text.
  ///   * [appId] ID of the app that will execute the task.
  ///   * [identifier] An arbitrary identifier for the task. Defaults to `''`.
  ///   * [numberOfImages] The number of images to generate. Defaults to `8`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task scheduled successfully
  ///   * 412: Scheduling task is not possible
  ///   * 500
  ///
  /// See:
  ///  * [scheduleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextToImageApiScheduleResponseApplicationJson, void>> schedule({
    required final String input,
    required final String appId,
    final String identifier = '',
    final int numberOfImages = 8,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = scheduleRaw(
      input: input,
      appId: appId,
      identifier: identifier,
      numberOfImages: numberOfImages,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint allows scheduling a text to image task.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [input] Input text.
  ///   * [appId] ID of the app that will execute the task.
  ///   * [identifier] An arbitrary identifier for the task. Defaults to `''`.
  ///   * [numberOfImages] The number of images to generate. Defaults to `8`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Task scheduled successfully
  ///   * 412: Scheduling task is not possible
  ///   * 500
  ///
  /// See:
  ///  * [schedule] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextToImageApiScheduleResponseApplicationJson, void> scheduleRaw({
    required final String input,
    required final String appId,
    final String identifier = '',
    final int numberOfImages = 8,
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
    }

// coverage:ignore-end
    queryParameters['input'] = input;
    queryParameters['appId'] = appId;
    if (identifier != '') {
      queryParameters['identifier'] = identifier;
    }
    if (numberOfImages != 8) {
      queryParameters['numberOfImages'] = numberOfImages.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/text2image/schedule').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<TextToImageApiScheduleResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiScheduleResponseApplicationJson),
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
  Future<DynamiteResponse<TextToImageApiGetTaskResponseApplicationJson, void>> getTask({
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
  DynamiteRawResponse<TextToImageApiGetTaskResponseApplicationJson, void> getTaskRaw({
    required final int id,
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
    }

// coverage:ignore-end
    pathParameters['id'] = id.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/text2image/task/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<TextToImageApiGetTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiGetTaskResponseApplicationJson),
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
  Future<DynamiteResponse<TextToImageApiDeleteTaskResponseApplicationJson, void>> deleteTask({
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
  DynamiteRawResponse<TextToImageApiDeleteTaskResponseApplicationJson, void> deleteTaskRaw({
    required final int id,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/text2image/task/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<TextToImageApiDeleteTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiDeleteTaskResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows downloading the resulting image of a task.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] The id of the task.
  ///   * [index] The index of the image to retrieve.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Image returned
  ///   * 404: Task or image not found
  ///   * 500
  ///
  /// See:
  ///  * [getImageRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getImage({
    required final int id,
    required final int index,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getImageRaw(
      id: id,
      index: index,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint allows downloading the resulting image of a task.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] The id of the task.
  ///   * [index] The index of the image to retrieve.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Image returned
  ///   * 404: Task or image not found
  ///   * 500
  ///
  /// See:
  ///  * [getImage] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getImageRaw({
    required final int id,
    required final int index,
    final bool oCSAPIRequest = true,
  }) {
    final pathParameters = <String, dynamic>{};
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
    pathParameters['id'] = id.toString();
    pathParameters['index'] = index.toString();
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/text2image/task/{id}/image/{index}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
  Future<DynamiteResponse<TextToImageApiListTasksByAppResponseApplicationJson, void>> listTasksByApp({
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
  DynamiteRawResponse<TextToImageApiListTasksByAppResponseApplicationJson, void> listTasksByAppRaw({
    required final String appId,
    final String? identifier,
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
    pathParameters['appId'] = appId;
    if (identifier != null) {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/text2image/tasks/app/{appId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<TextToImageApiListTasksByAppResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiListTasksByAppResponseApplicationJson),
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
    }

// coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/translation/languages').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    queryParameters['text'] = text;
    queryParameters['toLanguage'] = toLanguage;
    if (fromLanguage != null) {
      queryParameters['fromLanguage'] = fromLanguage;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/translation/translate').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    if (from != '') {
      queryParameters['from'] = from;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/search/providers').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    pathParameters['providerId'] = providerId;
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/search/providers/{providerId}/search').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/whatsnew').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    queryParameters['version'] = version;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/core/whatsnew').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    queryParameters['token'] = token;
    var uri = Uri.parse(UriTemplate('/index.php/core/wipe/check').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
    }

// coverage:ignore-end
    queryParameters['token'] = token;
    var uri = Uri.parse(UriTemplate('/index.php/core/wipe/success').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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

  @BuiltValueSerializer(custom: true)
  static Serializer<Status> get serializer => const _$StatusSerializer();
}

class _$StatusSerializer implements StructuredSerializer<Status> {
  const _$StatusSerializer();

  @override
  Iterable<Type> get types => const [Status, _$Status];

  @override
  String get wireName => 'Status';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Status object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'installed',
      serializers.serialize(object.installed, specifiedType: const FullType(bool)),
      'maintenance',
      serializers.serialize(object.maintenance, specifiedType: const FullType(bool)),
      'needsDbUpgrade',
      serializers.serialize(object.needsDbUpgrade, specifiedType: const FullType(bool)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
      'versionstring',
      serializers.serialize(object.versionstring, specifiedType: const FullType(String)),
      'edition',
      serializers.serialize(object.edition, specifiedType: const FullType(String)),
      'productname',
      serializers.serialize(object.productname, specifiedType: const FullType(String)),
      'extendedSupport',
      serializers.serialize(object.extendedSupport, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Status deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'installed':
          result.installed = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'maintenance':
          result.maintenance = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'needsDbUpgrade':
          result.needsDbUpgrade = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'versionstring':
          result.versionstring = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'edition':
          result.edition = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'productname':
          result.productname = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'extendedSupport':
          result.extendedSupport = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      const _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataSerializer();
}

class _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data> {
  const _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data,
        _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'apppassword',
      serializers.serialize(object.apppassword, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'apppassword':
          result.apppassword = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs> get serializer =>
      const _$AppPasswordGetAppPasswordResponseApplicationJson_OcsSerializer();
}

class _$AppPasswordGetAppPasswordResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs> {
  const _$AppPasswordGetAppPasswordResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        AppPasswordGetAppPasswordResponseApplicationJson_Ocs,
        _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'AppPasswordGetAppPasswordResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordGetAppPasswordResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data),
            )! as AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson> get serializer =>
      const _$AppPasswordGetAppPasswordResponseApplicationJsonSerializer();
}

class _$AppPasswordGetAppPasswordResponseApplicationJsonSerializer
    implements StructuredSerializer<AppPasswordGetAppPasswordResponseApplicationJson> {
  const _$AppPasswordGetAppPasswordResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [AppPasswordGetAppPasswordResponseApplicationJson, _$AppPasswordGetAppPasswordResponseApplicationJson];

  @override
  String get wireName => 'AppPasswordGetAppPasswordResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordGetAppPasswordResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  AppPasswordGetAppPasswordResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordGetAppPasswordResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs),
            )! as AppPasswordGetAppPasswordResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      const _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataSerializer();
}

class _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data> {
  const _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data,
        _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'apppassword',
      serializers.serialize(object.apppassword, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'apppassword':
          result.apppassword = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs> get serializer =>
      const _$AppPasswordRotateAppPasswordResponseApplicationJson_OcsSerializer();
}

class _$AppPasswordRotateAppPasswordResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs> {
  const _$AppPasswordRotateAppPasswordResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        AppPasswordRotateAppPasswordResponseApplicationJson_Ocs,
        _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'AppPasswordRotateAppPasswordResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordRotateAppPasswordResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data),
            )! as AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson> get serializer =>
      const _$AppPasswordRotateAppPasswordResponseApplicationJsonSerializer();
}

class _$AppPasswordRotateAppPasswordResponseApplicationJsonSerializer
    implements StructuredSerializer<AppPasswordRotateAppPasswordResponseApplicationJson> {
  const _$AppPasswordRotateAppPasswordResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        AppPasswordRotateAppPasswordResponseApplicationJson,
        _$AppPasswordRotateAppPasswordResponseApplicationJson,
      ];

  @override
  String get wireName => 'AppPasswordRotateAppPasswordResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordRotateAppPasswordResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  AppPasswordRotateAppPasswordResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordRotateAppPasswordResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs),
            )! as AppPasswordRotateAppPasswordResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs> get serializer =>
      const _$AppPasswordDeleteAppPasswordResponseApplicationJson_OcsSerializer();
}

class _$AppPasswordDeleteAppPasswordResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs> {
  const _$AppPasswordDeleteAppPasswordResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs,
        _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs object, {
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
  AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder();

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

  @BuiltValueSerializer(custom: true)
  static Serializer<AppPasswordDeleteAppPasswordResponseApplicationJson> get serializer =>
      const _$AppPasswordDeleteAppPasswordResponseApplicationJsonSerializer();
}

class _$AppPasswordDeleteAppPasswordResponseApplicationJsonSerializer
    implements StructuredSerializer<AppPasswordDeleteAppPasswordResponseApplicationJson> {
  const _$AppPasswordDeleteAppPasswordResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        AppPasswordDeleteAppPasswordResponseApplicationJson,
        _$AppPasswordDeleteAppPasswordResponseApplicationJson,
      ];

  @override
  String get wireName => 'AppPasswordDeleteAppPasswordResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AppPasswordDeleteAppPasswordResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  AppPasswordDeleteAppPasswordResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs),
            )! as AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AutocompleteResult_Status0> get serializer => const _$AutocompleteResult_Status0Serializer();
}

class _$AutocompleteResult_Status0Serializer implements StructuredSerializer<AutocompleteResult_Status0> {
  const _$AutocompleteResult_Status0Serializer();

  @override
  Iterable<Type> get types => const [AutocompleteResult_Status0, _$AutocompleteResult_Status0];

  @override
  String get wireName => 'AutocompleteResult_Status0';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AutocompleteResult_Status0 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
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
  AutocompleteResult_Status0 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AutocompleteResult_Status0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'clearAt':
          result.clearAt = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AutocompleteResult> get serializer => const _$AutocompleteResultSerializer();
}

class _$AutocompleteResultSerializer implements StructuredSerializer<AutocompleteResult> {
  const _$AutocompleteResultSerializer();

  @override
  Iterable<Type> get types => const [AutocompleteResult, _$AutocompleteResult];

  @override
  String get wireName => 'AutocompleteResult';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AutocompleteResult object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'source',
      serializers.serialize(object.source, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(AutocompleteResult_Status)),
      'subline',
      serializers.serialize(object.subline, specifiedType: const FullType(String)),
      'shareWithDisplayNameUnique',
      serializers.serialize(object.shareWithDisplayNameUnique, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  AutocompleteResult deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AutocompleteResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'source':
          result.source = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'status':
          result.status.replace(
            serializers.deserialize(value, specifiedType: const FullType(AutocompleteResult_Status))!
                as AutocompleteResult_Status,
          );
        case 'subline':
          result.subline = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'shareWithDisplayNameUnique':
          result.shareWithDisplayNameUnique =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AutoCompleteGetResponseApplicationJson_Ocs> get serializer =>
      const _$AutoCompleteGetResponseApplicationJson_OcsSerializer();
}

class _$AutoCompleteGetResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<AutoCompleteGetResponseApplicationJson_Ocs> {
  const _$AutoCompleteGetResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [AutoCompleteGetResponseApplicationJson_Ocs, _$AutoCompleteGetResponseApplicationJson_Ocs];

  @override
  String get wireName => 'AutoCompleteGetResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AutoCompleteGetResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(AutocompleteResult)])),
    ];
    return result;
  }

  @override
  AutoCompleteGetResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AutoCompleteGetResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(AutocompleteResult)]))!
                as BuiltList<AutocompleteResult>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<AutoCompleteGetResponseApplicationJson> get serializer =>
      const _$AutoCompleteGetResponseApplicationJsonSerializer();
}

class _$AutoCompleteGetResponseApplicationJsonSerializer
    implements StructuredSerializer<AutoCompleteGetResponseApplicationJson> {
  const _$AutoCompleteGetResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [AutoCompleteGetResponseApplicationJson, _$AutoCompleteGetResponseApplicationJson];

  @override
  String get wireName => 'AutoCompleteGetResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final AutoCompleteGetResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(AutoCompleteGetResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  AutoCompleteGetResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = AutoCompleteGetResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(AutoCompleteGetResponseApplicationJson_Ocs))!
                as AutoCompleteGetResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginFlowV2Credentials> get serializer => const _$LoginFlowV2CredentialsSerializer();
}

class _$LoginFlowV2CredentialsSerializer implements StructuredSerializer<LoginFlowV2Credentials> {
  const _$LoginFlowV2CredentialsSerializer();

  @override
  Iterable<Type> get types => const [LoginFlowV2Credentials, _$LoginFlowV2Credentials];

  @override
  String get wireName => 'LoginFlowV2Credentials';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final LoginFlowV2Credentials object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'server',
      serializers.serialize(object.server, specifiedType: const FullType(String)),
      'loginName',
      serializers.serialize(object.loginName, specifiedType: const FullType(String)),
      'appPassword',
      serializers.serialize(object.appPassword, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  LoginFlowV2Credentials deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginFlowV2CredentialsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'server':
          result.server = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'loginName':
          result.loginName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'appPassword':
          result.appPassword = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginFlowV2_Poll> get serializer => const _$LoginFlowV2_PollSerializer();
}

class _$LoginFlowV2_PollSerializer implements StructuredSerializer<LoginFlowV2_Poll> {
  const _$LoginFlowV2_PollSerializer();

  @override
  Iterable<Type> get types => const [LoginFlowV2_Poll, _$LoginFlowV2_Poll];

  @override
  String get wireName => 'LoginFlowV2_Poll';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final LoginFlowV2_Poll object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token, specifiedType: const FullType(String)),
      'endpoint',
      serializers.serialize(object.endpoint, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  LoginFlowV2_Poll deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginFlowV2_PollBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'endpoint':
          result.endpoint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginFlowV2> get serializer => const _$LoginFlowV2Serializer();
}

class _$LoginFlowV2Serializer implements StructuredSerializer<LoginFlowV2> {
  const _$LoginFlowV2Serializer();

  @override
  Iterable<Type> get types => const [LoginFlowV2, _$LoginFlowV2];

  @override
  String get wireName => 'LoginFlowV2';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final LoginFlowV2 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'poll',
      serializers.serialize(object.poll, specifiedType: const FullType(LoginFlowV2_Poll)),
      'login',
      serializers.serialize(object.login, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  LoginFlowV2 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginFlowV2Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'poll':
          result.poll.replace(
            serializers.deserialize(value, specifiedType: const FullType(LoginFlowV2_Poll))! as LoginFlowV2_Poll,
          );
        case 'login':
          result.login = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OpenGraphObject> get serializer => const _$OpenGraphObjectSerializer();
}

class _$OpenGraphObjectSerializer implements StructuredSerializer<OpenGraphObject> {
  const _$OpenGraphObjectSerializer();

  @override
  Iterable<Type> get types => const [OpenGraphObject, _$OpenGraphObject];

  @override
  String get wireName => 'OpenGraphObject';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OpenGraphObject object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.thumb;
    if (value != null) {
      result
        ..add('thumb')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  OpenGraphObject deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OpenGraphObjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'thumb':
          result.thumb = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Resource> get serializer => const _$ResourceSerializer();
}

class _$ResourceSerializer implements StructuredSerializer<Resource> {
  const _$ResourceSerializer();

  @override
  Iterable<Type> get types => const [Resource, _$Resource];

  @override
  String get wireName => 'Resource';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Resource object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'richObjectType',
      serializers.serialize(object.richObjectType, specifiedType: const FullType(String)),
      'richObject',
      serializers.serialize(
        object.richObject,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
      ),
      'openGraphObject',
      serializers.serialize(object.openGraphObject, specifiedType: const FullType(OpenGraphObject)),
      'accessible',
      serializers.serialize(object.accessible, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Resource deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'richObjectType':
          result.richObjectType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'richObject':
          result.richObject.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
            )! as BuiltMap<String, JsonObject>,
          );
        case 'openGraphObject':
          result.openGraphObject.replace(
            serializers.deserialize(value, specifiedType: const FullType(OpenGraphObject))! as OpenGraphObject,
          );
        case 'accessible':
          result.accessible = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Collection> get serializer => const _$CollectionSerializer();
}

class _$CollectionSerializer implements StructuredSerializer<Collection> {
  const _$CollectionSerializer();

  @override
  Iterable<Type> get types => const [Collection, _$Collection];

  @override
  String get wireName => 'Collection';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Collection object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'resources',
      serializers.serialize(object.resources, specifiedType: const FullType(BuiltList, [FullType(Resource)])),
    ];
    return result;
  }

  @override
  Collection deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollectionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'resources':
          result.resources.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Resource)]))!
                as BuiltList<Resource>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs> get serializer =>
      const _$CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsSerializer();
}

class _$CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs> {
  const _$CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs,
        _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Collection)])),
    ];
    return result;
  }

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Collection)]))!
                as BuiltList<Collection>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesSearchCollectionsResponseApplicationJson> get serializer =>
      const _$CollaborationResourcesSearchCollectionsResponseApplicationJsonSerializer();
}

class _$CollaborationResourcesSearchCollectionsResponseApplicationJsonSerializer
    implements StructuredSerializer<CollaborationResourcesSearchCollectionsResponseApplicationJson> {
  const _$CollaborationResourcesSearchCollectionsResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesSearchCollectionsResponseApplicationJson,
        _$CollaborationResourcesSearchCollectionsResponseApplicationJson,
      ];

  @override
  String get wireName => 'CollaborationResourcesSearchCollectionsResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesSearchCollectionsResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  CollaborationResourcesSearchCollectionsResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs),
            )! as CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesListCollectionResponseApplicationJson_Ocs> get serializer =>
      const _$CollaborationResourcesListCollectionResponseApplicationJson_OcsSerializer();
}

class _$CollaborationResourcesListCollectionResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<CollaborationResourcesListCollectionResponseApplicationJson_Ocs> {
  const _$CollaborationResourcesListCollectionResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesListCollectionResponseApplicationJson_Ocs,
        _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'CollaborationResourcesListCollectionResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesListCollectionResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Collection)),
    ];
    return result;
  }

  @override
  CollaborationResourcesListCollectionResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Collection))! as Collection,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesListCollectionResponseApplicationJson> get serializer =>
      const _$CollaborationResourcesListCollectionResponseApplicationJsonSerializer();
}

class _$CollaborationResourcesListCollectionResponseApplicationJsonSerializer
    implements StructuredSerializer<CollaborationResourcesListCollectionResponseApplicationJson> {
  const _$CollaborationResourcesListCollectionResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesListCollectionResponseApplicationJson,
        _$CollaborationResourcesListCollectionResponseApplicationJson,
      ];

  @override
  String get wireName => 'CollaborationResourcesListCollectionResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesListCollectionResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(CollaborationResourcesListCollectionResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  CollaborationResourcesListCollectionResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesListCollectionResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(CollaborationResourcesListCollectionResponseApplicationJson_Ocs),
            )! as CollaborationResourcesListCollectionResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs> get serializer =>
      const _$CollaborationResourcesRenameCollectionResponseApplicationJson_OcsSerializer();
}

class _$CollaborationResourcesRenameCollectionResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs> {
  const _$CollaborationResourcesRenameCollectionResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs,
        _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Collection)),
    ];
    return result;
  }

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Collection))! as Collection,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesRenameCollectionResponseApplicationJson> get serializer =>
      const _$CollaborationResourcesRenameCollectionResponseApplicationJsonSerializer();
}

class _$CollaborationResourcesRenameCollectionResponseApplicationJsonSerializer
    implements StructuredSerializer<CollaborationResourcesRenameCollectionResponseApplicationJson> {
  const _$CollaborationResourcesRenameCollectionResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesRenameCollectionResponseApplicationJson,
        _$CollaborationResourcesRenameCollectionResponseApplicationJson,
      ];

  @override
  String get wireName => 'CollaborationResourcesRenameCollectionResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesRenameCollectionResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  CollaborationResourcesRenameCollectionResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs),
            )! as CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesAddResourceResponseApplicationJson_Ocs> get serializer =>
      const _$CollaborationResourcesAddResourceResponseApplicationJson_OcsSerializer();
}

class _$CollaborationResourcesAddResourceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<CollaborationResourcesAddResourceResponseApplicationJson_Ocs> {
  const _$CollaborationResourcesAddResourceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesAddResourceResponseApplicationJson_Ocs,
        _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'CollaborationResourcesAddResourceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesAddResourceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Collection)),
    ];
    return result;
  }

  @override
  CollaborationResourcesAddResourceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Collection))! as Collection,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesAddResourceResponseApplicationJson> get serializer =>
      const _$CollaborationResourcesAddResourceResponseApplicationJsonSerializer();
}

class _$CollaborationResourcesAddResourceResponseApplicationJsonSerializer
    implements StructuredSerializer<CollaborationResourcesAddResourceResponseApplicationJson> {
  const _$CollaborationResourcesAddResourceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesAddResourceResponseApplicationJson,
        _$CollaborationResourcesAddResourceResponseApplicationJson,
      ];

  @override
  String get wireName => 'CollaborationResourcesAddResourceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesAddResourceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(CollaborationResourcesAddResourceResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  CollaborationResourcesAddResourceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesAddResourceResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(CollaborationResourcesAddResourceResponseApplicationJson_Ocs),
            )! as CollaborationResourcesAddResourceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs> get serializer =>
      const _$CollaborationResourcesRemoveResourceResponseApplicationJson_OcsSerializer();
}

class _$CollaborationResourcesRemoveResourceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs> {
  const _$CollaborationResourcesRemoveResourceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs,
        _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Collection)),
    ];
    return result;
  }

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Collection))! as Collection,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesRemoveResourceResponseApplicationJson> get serializer =>
      const _$CollaborationResourcesRemoveResourceResponseApplicationJsonSerializer();
}

class _$CollaborationResourcesRemoveResourceResponseApplicationJsonSerializer
    implements StructuredSerializer<CollaborationResourcesRemoveResourceResponseApplicationJson> {
  const _$CollaborationResourcesRemoveResourceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesRemoveResourceResponseApplicationJson,
        _$CollaborationResourcesRemoveResourceResponseApplicationJson,
      ];

  @override
  String get wireName => 'CollaborationResourcesRemoveResourceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesRemoveResourceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  CollaborationResourcesRemoveResourceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs),
            )! as CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs> get serializer =>
      const _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsSerializer();
}

class _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs> {
  const _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs,
        _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Collection)])),
    ];
    return result;
  }

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Collection)]))!
                as BuiltList<Collection>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson> get serializer =>
      const _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonSerializer();
}

class _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonSerializer
    implements StructuredSerializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson> {
  const _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJson,
        _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson,
      ];

  @override
  String get wireName => 'CollaborationResourcesGetCollectionsByResourceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesGetCollectionsByResourceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs),
            )! as CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs> get serializer =>
      const _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsSerializer();
}

class _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs> {
  const _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs,
        _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Collection)),
    ];
    return result;
  }

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Collection))! as Collection,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson> get serializer =>
      const _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonSerializer();
}

class _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonSerializer
    implements StructuredSerializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson> {
  const _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson,
        _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson,
      ];

  @override
  String get wireName => 'CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder();

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
              specifiedType:
                  const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs),
            )! as CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ContactsAction> get serializer => const _$ContactsActionSerializer();
}

class _$ContactsActionSerializer implements StructuredSerializer<ContactsAction> {
  const _$ContactsActionSerializer();

  @override
  Iterable<Type> get types => const [ContactsAction, _$ContactsAction];

  @override
  String get wireName => 'ContactsAction';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ContactsAction object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'hyperlink',
      serializers.serialize(object.hyperlink, specifiedType: const FullType(String)),
      'appId',
      serializers.serialize(object.appId, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  ContactsAction deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContactsActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'hyperlink':
          result.hyperlink = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'appId':
          result.appId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<HoverCardGetUserResponseApplicationJson_Ocs_Data> get serializer =>
      const _$HoverCardGetUserResponseApplicationJson_Ocs_DataSerializer();
}

class _$HoverCardGetUserResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<HoverCardGetUserResponseApplicationJson_Ocs_Data> {
  const _$HoverCardGetUserResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [HoverCardGetUserResponseApplicationJson_Ocs_Data, _$HoverCardGetUserResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'HoverCardGetUserResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final HoverCardGetUserResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName, specifiedType: const FullType(String)),
      'actions',
      serializers.serialize(object.actions, specifiedType: const FullType(BuiltList, [FullType(ContactsAction)])),
    ];
    return result;
  }

  @override
  HoverCardGetUserResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'displayName':
          result.displayName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'actions':
          result.actions.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ContactsAction)]))!
                as BuiltList<ContactsAction>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<HoverCardGetUserResponseApplicationJson_Ocs> get serializer =>
      const _$HoverCardGetUserResponseApplicationJson_OcsSerializer();
}

class _$HoverCardGetUserResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<HoverCardGetUserResponseApplicationJson_Ocs> {
  const _$HoverCardGetUserResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [HoverCardGetUserResponseApplicationJson_Ocs, _$HoverCardGetUserResponseApplicationJson_Ocs];

  @override
  String get wireName => 'HoverCardGetUserResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final HoverCardGetUserResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(HoverCardGetUserResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  HoverCardGetUserResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = HoverCardGetUserResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(HoverCardGetUserResponseApplicationJson_Ocs_Data),
            )! as HoverCardGetUserResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<HoverCardGetUserResponseApplicationJson> get serializer =>
      const _$HoverCardGetUserResponseApplicationJsonSerializer();
}

class _$HoverCardGetUserResponseApplicationJsonSerializer
    implements StructuredSerializer<HoverCardGetUserResponseApplicationJson> {
  const _$HoverCardGetUserResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [HoverCardGetUserResponseApplicationJson, _$HoverCardGetUserResponseApplicationJson];

  @override
  String get wireName => 'HoverCardGetUserResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final HoverCardGetUserResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(HoverCardGetUserResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  HoverCardGetUserResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = HoverCardGetUserResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(HoverCardGetUserResponseApplicationJson_Ocs))!
                as HoverCardGetUserResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NavigationEntry> get serializer => const _$NavigationEntrySerializer();
}

class _$NavigationEntrySerializer implements StructuredSerializer<NavigationEntry> {
  const _$NavigationEntrySerializer();

  @override
  Iterable<Type> get types => const [NavigationEntry, _$NavigationEntry];

  @override
  String get wireName => 'NavigationEntry';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NavigationEntry object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(NavigationEntry_Order)),
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'active',
      serializers.serialize(object.active, specifiedType: const FullType(bool)),
      'classes',
      serializers.serialize(object.classes, specifiedType: const FullType(String)),
      'unread',
      serializers.serialize(object.unread, specifiedType: const FullType(int)),
    ];
    return result;
  }

  @override
  NavigationEntry deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NavigationEntryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'order':
          result.order.replace(
            serializers.deserialize(value, specifiedType: const FullType(NavigationEntry_Order))!
                as NavigationEntry_Order,
          );
        case 'href':
          result.href = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'active':
          result.active = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'classes':
          result.classes = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'unread':
          result.unread = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NavigationGetAppsNavigationResponseApplicationJson_Ocs> get serializer =>
      const _$NavigationGetAppsNavigationResponseApplicationJson_OcsSerializer();
}

class _$NavigationGetAppsNavigationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<NavigationGetAppsNavigationResponseApplicationJson_Ocs> {
  const _$NavigationGetAppsNavigationResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        NavigationGetAppsNavigationResponseApplicationJson_Ocs,
        _$NavigationGetAppsNavigationResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'NavigationGetAppsNavigationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NavigationGetAppsNavigationResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(NavigationEntry)])),
    ];
    return result;
  }

  @override
  NavigationGetAppsNavigationResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(NavigationEntry)]))!
                as BuiltList<NavigationEntry>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NavigationGetAppsNavigationResponseApplicationJson> get serializer =>
      const _$NavigationGetAppsNavigationResponseApplicationJsonSerializer();
}

class _$NavigationGetAppsNavigationResponseApplicationJsonSerializer
    implements StructuredSerializer<NavigationGetAppsNavigationResponseApplicationJson> {
  const _$NavigationGetAppsNavigationResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [NavigationGetAppsNavigationResponseApplicationJson, _$NavigationGetAppsNavigationResponseApplicationJson];

  @override
  String get wireName => 'NavigationGetAppsNavigationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NavigationGetAppsNavigationResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(NavigationGetAppsNavigationResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  NavigationGetAppsNavigationResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NavigationGetAppsNavigationResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(NavigationGetAppsNavigationResponseApplicationJson_Ocs),
            )! as NavigationGetAppsNavigationResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NavigationGetSettingsNavigationResponseApplicationJson_Ocs> get serializer =>
      const _$NavigationGetSettingsNavigationResponseApplicationJson_OcsSerializer();
}

class _$NavigationGetSettingsNavigationResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<NavigationGetSettingsNavigationResponseApplicationJson_Ocs> {
  const _$NavigationGetSettingsNavigationResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        NavigationGetSettingsNavigationResponseApplicationJson_Ocs,
        _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'NavigationGetSettingsNavigationResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NavigationGetSettingsNavigationResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(NavigationEntry)])),
    ];
    return result;
  }

  @override
  NavigationGetSettingsNavigationResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(NavigationEntry)]))!
                as BuiltList<NavigationEntry>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NavigationGetSettingsNavigationResponseApplicationJson> get serializer =>
      const _$NavigationGetSettingsNavigationResponseApplicationJsonSerializer();
}

class _$NavigationGetSettingsNavigationResponseApplicationJsonSerializer
    implements StructuredSerializer<NavigationGetSettingsNavigationResponseApplicationJson> {
  const _$NavigationGetSettingsNavigationResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        NavigationGetSettingsNavigationResponseApplicationJson,
        _$NavigationGetSettingsNavigationResponseApplicationJson,
      ];

  @override
  String get wireName => 'NavigationGetSettingsNavigationResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NavigationGetSettingsNavigationResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(NavigationGetSettingsNavigationResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  NavigationGetSettingsNavigationResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NavigationGetSettingsNavigationResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(NavigationGetSettingsNavigationResponseApplicationJson_Ocs),
            )! as NavigationGetSettingsNavigationResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols> get serializer =>
      const _$OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsSerializer();
}

class _$OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsSerializer
    implements StructuredSerializer<OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols> {
  const _$OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsSerializer();

  @override
  Iterable<Type> get types => const [
        OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols,
        _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols,
      ];

  @override
  String get wireName => 'OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'webdav',
      serializers.serialize(object.webdav, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'webdav':
          result.webdav = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OcmDiscoveryResponseApplicationJson_ResourceTypes> get serializer =>
      const _$OcmDiscoveryResponseApplicationJson_ResourceTypesSerializer();
}

class _$OcmDiscoveryResponseApplicationJson_ResourceTypesSerializer
    implements StructuredSerializer<OcmDiscoveryResponseApplicationJson_ResourceTypes> {
  const _$OcmDiscoveryResponseApplicationJson_ResourceTypesSerializer();

  @override
  Iterable<Type> get types =>
      const [OcmDiscoveryResponseApplicationJson_ResourceTypes, _$OcmDiscoveryResponseApplicationJson_ResourceTypes];

  @override
  String get wireName => 'OcmDiscoveryResponseApplicationJson_ResourceTypes';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcmDiscoveryResponseApplicationJson_ResourceTypes object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'shareTypes',
      serializers.serialize(object.shareTypes, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'protocols',
      serializers.serialize(
        object.protocols,
        specifiedType: const FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols),
      ),
    ];
    return result;
  }

  @override
  OcmDiscoveryResponseApplicationJson_ResourceTypes deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'shareTypes':
          result.shareTypes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'protocols':
          result.protocols.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols),
            )! as OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OcmDiscoveryResponseApplicationJson> get serializer =>
      const _$OcmDiscoveryResponseApplicationJsonSerializer();
}

class _$OcmDiscoveryResponseApplicationJsonSerializer
    implements StructuredSerializer<OcmDiscoveryResponseApplicationJson> {
  const _$OcmDiscoveryResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [OcmDiscoveryResponseApplicationJson, _$OcmDiscoveryResponseApplicationJson];

  @override
  String get wireName => 'OcmDiscoveryResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcmDiscoveryResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'apiVersion',
      serializers.serialize(object.apiVersion, specifiedType: const FullType(String)),
      'endPoint',
      serializers.serialize(object.endPoint, specifiedType: const FullType(String)),
      'resourceTypes',
      serializers.serialize(
        object.resourceTypes,
        specifiedType: const FullType(BuiltList, [FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes)]),
      ),
    ];
    return result;
  }

  @override
  OcmDiscoveryResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcmDiscoveryResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'apiVersion':
          result.apiVersion = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'endPoint':
          result.endPoint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'resourceTypes':
          result.resourceTypes.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltList, [FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes)]),
            )! as BuiltList<OcmDiscoveryResponseApplicationJson_ResourceTypes>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version> get serializer =>
      const _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionSerializer();
}

class _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionSerializer
    implements StructuredSerializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version> {
  const _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionSerializer();

  @override
  Iterable<Type> get types => const [
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version,
        _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version,
      ];

  @override
  String get wireName => 'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'major',
      serializers.serialize(object.major, specifiedType: const FullType(int)),
      'minor',
      serializers.serialize(object.minor, specifiedType: const FullType(int)),
      'micro',
      serializers.serialize(object.micro, specifiedType: const FullType(int)),
      'string',
      serializers.serialize(object.string, specifiedType: const FullType(String)),
      'edition',
      serializers.serialize(object.edition, specifiedType: const FullType(String)),
      'extendedSupport',
      serializers.serialize(object.extendedSupport, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'major':
          result.major = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'minor':
          result.minor = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'micro':
          result.micro = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'string':
          result.string = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'edition':
          result.edition = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'extendedSupport':
          result.extendedSupport = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentsCapabilities_Files> get serializer => const _$CommentsCapabilities_FilesSerializer();
}

class _$CommentsCapabilities_FilesSerializer implements StructuredSerializer<CommentsCapabilities_Files> {
  const _$CommentsCapabilities_FilesSerializer();

  @override
  Iterable<Type> get types => const [CommentsCapabilities_Files, _$CommentsCapabilities_Files];

  @override
  String get wireName => 'CommentsCapabilities_Files';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CommentsCapabilities_Files object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'comments',
      serializers.serialize(object.comments, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  CommentsCapabilities_Files deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentsCapabilities_FilesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'comments':
          result.comments = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentsCapabilities> get serializer => const _$CommentsCapabilitiesSerializer();
}

class _$CommentsCapabilitiesSerializer implements StructuredSerializer<CommentsCapabilities> {
  const _$CommentsCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [CommentsCapabilities, _$CommentsCapabilities];

  @override
  String get wireName => 'CommentsCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CommentsCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(CommentsCapabilities_Files)),
    ];
    return result;
  }

  @override
  CommentsCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentsCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(
            serializers.deserialize(value, specifiedType: const FullType(CommentsCapabilities_Files))!
                as CommentsCapabilities_Files,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DavCapabilities_Dav> get serializer => const _$DavCapabilities_DavSerializer();
}

class _$DavCapabilities_DavSerializer implements StructuredSerializer<DavCapabilities_Dav> {
  const _$DavCapabilities_DavSerializer();

  @override
  Iterable<Type> get types => const [DavCapabilities_Dav, _$DavCapabilities_Dav];

  @override
  String get wireName => 'DavCapabilities_Dav';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DavCapabilities_Dav object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'chunking',
      serializers.serialize(object.chunking, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.bulkupload;
    if (value != null) {
      result
        ..add('bulkupload')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  DavCapabilities_Dav deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DavCapabilities_DavBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'chunking':
          result.chunking = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'bulkupload':
          result.bulkupload = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DavCapabilities> get serializer => const _$DavCapabilitiesSerializer();
}

class _$DavCapabilitiesSerializer implements StructuredSerializer<DavCapabilities> {
  const _$DavCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [DavCapabilities, _$DavCapabilities];

  @override
  String get wireName => 'DavCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DavCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'dav',
      serializers.serialize(object.dav, specifiedType: const FullType(DavCapabilities_Dav)),
    ];
    return result;
  }

  @override
  DavCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DavCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'dav':
          result.dav.replace(
            serializers.deserialize(value, specifiedType: const FullType(DavCapabilities_Dav))! as DavCapabilities_Dav,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesCapabilities_Files_DirectEditing> get serializer =>
      const _$FilesCapabilities_Files_DirectEditingSerializer();
}

class _$FilesCapabilities_Files_DirectEditingSerializer
    implements StructuredSerializer<FilesCapabilities_Files_DirectEditing> {
  const _$FilesCapabilities_Files_DirectEditingSerializer();

  @override
  Iterable<Type> get types => const [FilesCapabilities_Files_DirectEditing, _$FilesCapabilities_Files_DirectEditing];

  @override
  String get wireName => 'FilesCapabilities_Files_DirectEditing';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesCapabilities_Files_DirectEditing object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'etag',
      serializers.serialize(object.etag, specifiedType: const FullType(String)),
      'supportsFileId',
      serializers.serialize(object.supportsFileId, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesCapabilities_Files_DirectEditing deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesCapabilities_Files_DirectEditingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'supportsFileId':
          result.supportsFileId = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesCapabilities_Files> get serializer => const _$FilesCapabilities_FilesSerializer();
}

class _$FilesCapabilities_FilesSerializer implements StructuredSerializer<FilesCapabilities_Files> {
  const _$FilesCapabilities_FilesSerializer();

  @override
  Iterable<Type> get types => const [FilesCapabilities_Files, _$FilesCapabilities_Files];

  @override
  String get wireName => 'FilesCapabilities_Files';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesCapabilities_Files object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'bigfilechunking',
      serializers.serialize(object.bigfilechunking, specifiedType: const FullType(bool)),
      'blacklisted_files',
      serializers.serialize(object.blacklistedFiles, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
      'directEditing',
      serializers.serialize(object.directEditing, specifiedType: const FullType(FilesCapabilities_Files_DirectEditing)),
    ];
    return result;
  }

  @override
  FilesCapabilities_Files deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesCapabilities_FilesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'bigfilechunking':
          result.bigfilechunking = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'blacklisted_files':
          result.blacklistedFiles.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))!
                as BuiltList<JsonObject>,
          );
        case 'directEditing':
          result.directEditing.replace(
            serializers.deserialize(value, specifiedType: const FullType(FilesCapabilities_Files_DirectEditing))!
                as FilesCapabilities_Files_DirectEditing,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesCapabilities> get serializer => const _$FilesCapabilitiesSerializer();
}

class _$FilesCapabilitiesSerializer implements StructuredSerializer<FilesCapabilities> {
  const _$FilesCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [FilesCapabilities, _$FilesCapabilities];

  @override
  String get wireName => 'FilesCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(FilesCapabilities_Files)),
    ];
    return result;
  }

  @override
  FilesCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(
            serializers.deserialize(value, specifiedType: const FullType(FilesCapabilities_Files))!
                as FilesCapabilities_Files,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_Password> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_Public_PasswordSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_Public_PasswordSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Public_Password> {
  const _$FilesSharingCapabilities_FilesSharing_Public_PasswordSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_Public_Password,
        _$FilesSharingCapabilities_FilesSharing_Public_Password,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Public_Password';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Public_Password object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
      'askForOptionalPassword',
      serializers.serialize(object.askForOptionalPassword, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_Password deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'askForOptionalPassword':
          result.askForOptionalPassword = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDate> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDate> {
  const _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_Public_ExpireDate,
        _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Public_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Public_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'days':
          result.days = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal> {
  const _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal,
        _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'days':
          result.days = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote> {
  const _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote,
        _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'days':
          result.days = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Public> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_PublicSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_PublicSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Public> {
  const _$FilesSharingCapabilities_FilesSharing_PublicSerializer();

  @override
  Iterable<Type> get types =>
      const [FilesSharingCapabilities_FilesSharing_Public, _$FilesSharingCapabilities_FilesSharing_Public];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Public';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Public object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_Password),
          ),
        );
    }

    value = object.multipleLinks;
    if (value != null) {
      result
        ..add('multiple_links')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDate),
          ),
        );
    }

    value = object.expireDateInternal;
    if (value != null) {
      result
        ..add('expire_date_internal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal),
          ),
        );
    }

    value = object.expireDateRemote;
    if (value != null) {
      result
        ..add('expire_date_remote')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote),
          ),
        );
    }

    value = object.sendMail;
    if (value != null) {
      result
        ..add('send_mail')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.upload;
    if (value != null) {
      result
        ..add('upload')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.uploadFilesDrop;
    if (value != null) {
      result
        ..add('upload_files_drop')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Public deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_PublicBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'password':
          result.password.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_Password),
            )! as FilesSharingCapabilities_FilesSharing_Public_Password,
          );
        case 'multiple_links':
          result.multipleLinks = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDate),
            )! as FilesSharingCapabilities_FilesSharing_Public_ExpireDate,
          );
        case 'expire_date_internal':
          result.expireDateInternal.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal),
            )! as FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal,
          );
        case 'expire_date_remote':
          result.expireDateRemote.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote),
            )! as FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote,
          );
        case 'send_mail':
          result.sendMail = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'upload':
          result.upload = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'upload_files_drop':
          result.uploadFilesDrop = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_User_ExpireDate> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_User_ExpireDateSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_User_ExpireDateSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_User_ExpireDate> {
  const _$FilesSharingCapabilities_FilesSharing_User_ExpireDateSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_User_ExpireDate,
        _$FilesSharingCapabilities_FilesSharing_User_ExpireDate,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_User_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_User_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_User_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_User> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_UserSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_UserSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_User> {
  const _$FilesSharingCapabilities_FilesSharing_UserSerializer();

  @override
  Iterable<Type> get types =>
      const [FilesSharingCapabilities_FilesSharing_User, _$FilesSharingCapabilities_FilesSharing_User];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_User';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_User object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'send_mail',
      serializers.serialize(object.sendMail, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_User_ExpireDate),
          ),
        );
    }

    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_User deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'send_mail':
          result.sendMail = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_User_ExpireDate),
            )! as FilesSharingCapabilities_FilesSharing_User_ExpireDate,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Group_ExpireDate> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_Group_ExpireDateSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_Group_ExpireDateSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Group_ExpireDate> {
  const _$FilesSharingCapabilities_FilesSharing_Group_ExpireDateSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_Group_ExpireDate,
        _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Group_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Group_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Group_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Group> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_GroupSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_GroupSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Group> {
  const _$FilesSharingCapabilities_FilesSharing_GroupSerializer();

  @override
  Iterable<Type> get types =>
      const [FilesSharingCapabilities_FilesSharing_Group, _$FilesSharingCapabilities_FilesSharing_Group];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Group';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Group object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Group_ExpireDate),
          ),
        );
    }

    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Group deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_GroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Group_ExpireDate),
            )! as FilesSharingCapabilities_FilesSharing_Group_ExpireDate,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate> {
  const _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDate,
        _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Federation_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Federation_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported> {
  const _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedSerializer();

  @override
  Iterable<Type> get types => const [
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported,
        _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported,
      ];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Federation> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_FederationSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_FederationSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Federation> {
  const _$FilesSharingCapabilities_FilesSharing_FederationSerializer();

  @override
  Iterable<Type> get types =>
      const [FilesSharingCapabilities_FilesSharing_Federation, _$FilesSharingCapabilities_FilesSharing_Federation];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Federation';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Federation object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'outgoing',
      serializers.serialize(object.outgoing, specifiedType: const FullType(bool)),
      'incoming',
      serializers.serialize(object.incoming, specifiedType: const FullType(bool)),
      'expire_date',
      serializers.serialize(
        object.expireDate,
        specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDate),
      ),
      'expire_date_supported',
      serializers.serialize(
        object.expireDateSupported,
        specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported),
      ),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Federation deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_FederationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'outgoing':
          result.outgoing = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'incoming':
          result.incoming = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDate),
            )! as FilesSharingCapabilities_FilesSharing_Federation_ExpireDate,
          );
        case 'expire_date_supported':
          result.expireDateSupported.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported),
            )! as FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing_Sharee> get serializer =>
      const _$FilesSharingCapabilities_FilesSharing_ShareeSerializer();
}

class _$FilesSharingCapabilities_FilesSharing_ShareeSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing_Sharee> {
  const _$FilesSharingCapabilities_FilesSharing_ShareeSerializer();

  @override
  Iterable<Type> get types =>
      const [FilesSharingCapabilities_FilesSharing_Sharee, _$FilesSharingCapabilities_FilesSharing_Sharee];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing_Sharee';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing_Sharee object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'query_lookup_default',
      serializers.serialize(object.queryLookupDefault, specifiedType: const FullType(bool)),
      'always_show_unique',
      serializers.serialize(object.alwaysShowUnique, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing_Sharee deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharing_ShareeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'query_lookup_default':
          result.queryLookupDefault = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'always_show_unique':
          result.alwaysShowUnique = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities_FilesSharing> get serializer =>
      const _$FilesSharingCapabilities_FilesSharingSerializer();
}

class _$FilesSharingCapabilities_FilesSharingSerializer
    implements StructuredSerializer<FilesSharingCapabilities_FilesSharing> {
  const _$FilesSharingCapabilities_FilesSharingSerializer();

  @override
  Iterable<Type> get types => const [FilesSharingCapabilities_FilesSharing, _$FilesSharingCapabilities_FilesSharing];

  @override
  String get wireName => 'FilesSharingCapabilities_FilesSharing';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities_FilesSharing object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'api_enabled',
      serializers.serialize(object.apiEnabled, specifiedType: const FullType(bool)),
      'public',
      serializers.serialize(object.public, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_User)),
      'resharing',
      serializers.serialize(object.resharing, specifiedType: const FullType(bool)),
      'federation',
      serializers.serialize(
        object.federation,
        specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Federation),
      ),
      'sharee',
      serializers.serialize(object.sharee, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Sharee)),
    ];
    Object? value;
    value = object.groupSharing;
    if (value != null) {
      result
        ..add('group_sharing')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Group)),
        );
    }

    value = object.defaultPermissions;
    if (value != null) {
      result
        ..add('default_permissions')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    return result;
  }

  @override
  FilesSharingCapabilities_FilesSharing deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilities_FilesSharingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'api_enabled':
          result.apiEnabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'public':
          result.public.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Public),
            )! as FilesSharingCapabilities_FilesSharing_Public,
          );
        case 'user':
          result.user.replace(
            serializers.deserialize(value, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_User))!
                as FilesSharingCapabilities_FilesSharing_User,
          );
        case 'resharing':
          result.resharing = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'group_sharing':
          result.groupSharing = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'group':
          result.group.replace(
            serializers.deserialize(value, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Group))!
                as FilesSharingCapabilities_FilesSharing_Group,
          );
        case 'default_permissions':
          result.defaultPermissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'federation':
          result.federation.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Federation),
            )! as FilesSharingCapabilities_FilesSharing_Federation,
          );
        case 'sharee':
          result.sharee.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(FilesSharingCapabilities_FilesSharing_Sharee),
            )! as FilesSharingCapabilities_FilesSharing_Sharee,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingCapabilities> get serializer => const _$FilesSharingCapabilitiesSerializer();
}

class _$FilesSharingCapabilitiesSerializer implements StructuredSerializer<FilesSharingCapabilities> {
  const _$FilesSharingCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [FilesSharingCapabilities, _$FilesSharingCapabilities];

  @override
  String get wireName => 'FilesSharingCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files_sharing',
      serializers.serialize(object.filesSharing, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing)),
    ];
    return result;
  }

  @override
  FilesSharingCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files_sharing':
          result.filesSharing.replace(
            serializers.deserialize(value, specifiedType: const FullType(FilesSharingCapabilities_FilesSharing))!
                as FilesSharingCapabilities_FilesSharing,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesTrashbinCapabilities_Files> get serializer =>
      const _$FilesTrashbinCapabilities_FilesSerializer();
}

class _$FilesTrashbinCapabilities_FilesSerializer implements StructuredSerializer<FilesTrashbinCapabilities_Files> {
  const _$FilesTrashbinCapabilities_FilesSerializer();

  @override
  Iterable<Type> get types => const [FilesTrashbinCapabilities_Files, _$FilesTrashbinCapabilities_Files];

  @override
  String get wireName => 'FilesTrashbinCapabilities_Files';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesTrashbinCapabilities_Files object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'undelete',
      serializers.serialize(object.undelete, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesTrashbinCapabilities_Files deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesTrashbinCapabilities_FilesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'undelete':
          result.undelete = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesTrashbinCapabilities> get serializer => const _$FilesTrashbinCapabilitiesSerializer();
}

class _$FilesTrashbinCapabilitiesSerializer implements StructuredSerializer<FilesTrashbinCapabilities> {
  const _$FilesTrashbinCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [FilesTrashbinCapabilities, _$FilesTrashbinCapabilities];

  @override
  String get wireName => 'FilesTrashbinCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesTrashbinCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(FilesTrashbinCapabilities_Files)),
    ];
    return result;
  }

  @override
  FilesTrashbinCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesTrashbinCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(
            serializers.deserialize(value, specifiedType: const FullType(FilesTrashbinCapabilities_Files))!
                as FilesTrashbinCapabilities_Files,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesVersionsCapabilities_Files> get serializer =>
      const _$FilesVersionsCapabilities_FilesSerializer();
}

class _$FilesVersionsCapabilities_FilesSerializer implements StructuredSerializer<FilesVersionsCapabilities_Files> {
  const _$FilesVersionsCapabilities_FilesSerializer();

  @override
  Iterable<Type> get types => const [FilesVersionsCapabilities_Files, _$FilesVersionsCapabilities_Files];

  @override
  String get wireName => 'FilesVersionsCapabilities_Files';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesVersionsCapabilities_Files object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'versioning',
      serializers.serialize(object.versioning, specifiedType: const FullType(bool)),
      'version_labeling',
      serializers.serialize(object.versionLabeling, specifiedType: const FullType(bool)),
      'version_deletion',
      serializers.serialize(object.versionDeletion, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  FilesVersionsCapabilities_Files deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesVersionsCapabilities_FilesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'versioning':
          result.versioning = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'version_labeling':
          result.versionLabeling = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'version_deletion':
          result.versionDeletion = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<FilesVersionsCapabilities> get serializer => const _$FilesVersionsCapabilitiesSerializer();
}

class _$FilesVersionsCapabilitiesSerializer implements StructuredSerializer<FilesVersionsCapabilities> {
  const _$FilesVersionsCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [FilesVersionsCapabilities, _$FilesVersionsCapabilities];

  @override
  String get wireName => 'FilesVersionsCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesVersionsCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(FilesVersionsCapabilities_Files)),
    ];
    return result;
  }

  @override
  FilesVersionsCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesVersionsCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(
            serializers.deserialize(value, specifiedType: const FullType(FilesVersionsCapabilities_Files))!
                as FilesVersionsCapabilities_Files,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NotesCapabilities_Notes> get serializer => const _$NotesCapabilities_NotesSerializer();
}

class _$NotesCapabilities_NotesSerializer implements StructuredSerializer<NotesCapabilities_Notes> {
  const _$NotesCapabilities_NotesSerializer();

  @override
  Iterable<Type> get types => const [NotesCapabilities_Notes, _$NotesCapabilities_Notes];

  @override
  String get wireName => 'NotesCapabilities_Notes';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NotesCapabilities_Notes object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.apiVersion;
    if (value != null) {
      result
        ..add('api_version')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  NotesCapabilities_Notes deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotesCapabilities_NotesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'api_version':
          result.apiVersion.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NotesCapabilities> get serializer => const _$NotesCapabilitiesSerializer();
}

class _$NotesCapabilitiesSerializer implements StructuredSerializer<NotesCapabilities> {
  const _$NotesCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [NotesCapabilities, _$NotesCapabilities];

  @override
  String get wireName => 'NotesCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NotesCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'notes',
      serializers.serialize(object.notes, specifiedType: const FullType(NotesCapabilities_Notes)),
    ];
    return result;
  }

  @override
  NotesCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotesCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'notes':
          result.notes.replace(
            serializers.deserialize(value, specifiedType: const FullType(NotesCapabilities_Notes))!
                as NotesCapabilities_Notes,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationsCapabilities_Notifications> get serializer =>
      const _$NotificationsCapabilities_NotificationsSerializer();
}

class _$NotificationsCapabilities_NotificationsSerializer
    implements StructuredSerializer<NotificationsCapabilities_Notifications> {
  const _$NotificationsCapabilities_NotificationsSerializer();

  @override
  Iterable<Type> get types =>
      const [NotificationsCapabilities_Notifications, _$NotificationsCapabilities_Notifications];

  @override
  String get wireName => 'NotificationsCapabilities_Notifications';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NotificationsCapabilities_Notifications object, {
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
  NotificationsCapabilities_Notifications deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationsCapabilities_NotificationsBuilder();

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

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationsCapabilities> get serializer => const _$NotificationsCapabilitiesSerializer();
}

class _$NotificationsCapabilitiesSerializer implements StructuredSerializer<NotificationsCapabilities> {
  const _$NotificationsCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [NotificationsCapabilities, _$NotificationsCapabilities];

  @override
  String get wireName => 'NotificationsCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NotificationsCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'notifications',
      serializers.serialize(
        object.notifications,
        specifiedType: const FullType(NotificationsCapabilities_Notifications),
      ),
    ];
    return result;
  }

  @override
  NotificationsCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationsCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'notifications':
          result.notifications.replace(
            serializers.deserialize(value, specifiedType: const FullType(NotificationsCapabilities_Notifications))!
                as NotificationsCapabilities_Notifications,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiCapabilities_ProvisioningApi> get serializer =>
      const _$ProvisioningApiCapabilities_ProvisioningApiSerializer();
}

class _$ProvisioningApiCapabilities_ProvisioningApiSerializer
    implements StructuredSerializer<ProvisioningApiCapabilities_ProvisioningApi> {
  const _$ProvisioningApiCapabilities_ProvisioningApiSerializer();

  @override
  Iterable<Type> get types =>
      const [ProvisioningApiCapabilities_ProvisioningApi, _$ProvisioningApiCapabilities_ProvisioningApi];

  @override
  String get wireName => 'ProvisioningApiCapabilities_ProvisioningApi';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ProvisioningApiCapabilities_ProvisioningApi object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
      'AccountPropertyScopesVersion',
      serializers.serialize(object.accountPropertyScopesVersion, specifiedType: const FullType(int)),
      'AccountPropertyScopesFederatedEnabled',
      serializers.serialize(object.accountPropertyScopesFederatedEnabled, specifiedType: const FullType(bool)),
      'AccountPropertyScopesPublishedEnabled',
      serializers.serialize(object.accountPropertyScopesPublishedEnabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  ProvisioningApiCapabilities_ProvisioningApi deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiCapabilities_ProvisioningApiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'AccountPropertyScopesVersion':
          result.accountPropertyScopesVersion =
              serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'AccountPropertyScopesFederatedEnabled':
          result.accountPropertyScopesFederatedEnabled =
              serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'AccountPropertyScopesPublishedEnabled':
          result.accountPropertyScopesPublishedEnabled =
              serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiCapabilities> get serializer => const _$ProvisioningApiCapabilitiesSerializer();
}

class _$ProvisioningApiCapabilitiesSerializer implements StructuredSerializer<ProvisioningApiCapabilities> {
  const _$ProvisioningApiCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [ProvisioningApiCapabilities, _$ProvisioningApiCapabilities];

  @override
  String get wireName => 'ProvisioningApiCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ProvisioningApiCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'provisioning_api',
      serializers.serialize(
        object.provisioningApi,
        specifiedType: const FullType(ProvisioningApiCapabilities_ProvisioningApi),
      ),
    ];
    return result;
  }

  @override
  ProvisioningApiCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'provisioning_api':
          result.provisioningApi.replace(
            serializers.deserialize(value, specifiedType: const FullType(ProvisioningApiCapabilities_ProvisioningApi))!
                as ProvisioningApiCapabilities_ProvisioningApi,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface {
  bool get enabled;
}

abstract class SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
            SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      const _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropSerializer();
}

class _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropSerializer
    implements StructuredSerializer<SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop> {
  const _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropSerializer();

  @override
  Iterable<Type> get types => const [
        SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
        _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
      ];

  @override
  String get wireName => 'SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterface {
  bool get enabled;
  bool get enforced;
}

abstract class SharebymailCapabilities0_FilesSharing_Sharebymail_Password
    implements
        SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail_Password,
            SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_Password([
    final void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail_Password> get serializer =>
      const _$SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordSerializer();
}

class _$SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordSerializer
    implements StructuredSerializer<SharebymailCapabilities0_FilesSharing_Sharebymail_Password> {
  const _$SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordSerializer();

  @override
  Iterable<Type> get types => const [
        SharebymailCapabilities0_FilesSharing_Sharebymail_Password,
        _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password,
      ];

  @override
  String get wireName => 'SharebymailCapabilities0_FilesSharing_Sharebymail_Password';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SharebymailCapabilities0_FilesSharing_Sharebymail_Password object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_Password deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterface {
  bool get enabled;
  bool get enforced;
}

abstract class SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate
    implements
        SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate,
            SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate([
    final void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      const _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateSerializer();
}

class _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateSerializer
    implements StructuredSerializer<SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate> {
  const _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateSerializer();

  @override
  Iterable<Type> get types => const [
        SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate,
        _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate,
      ];

  @override
  String get wireName => 'SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities0_FilesSharing_SharebymailInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop get uploadFilesDrop;
  SharebymailCapabilities0_FilesSharing_Sharebymail_Password get password;
  @BuiltValueField(wireName: 'expire_date')
  SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate get expireDate;
}

abstract class SharebymailCapabilities0_FilesSharing_Sharebymail
    implements
        SharebymailCapabilities0_FilesSharing_SharebymailInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail,
            SharebymailCapabilities0_FilesSharing_SharebymailBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail([
    final void Function(SharebymailCapabilities0_FilesSharing_SharebymailBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail> get serializer =>
      const _$SharebymailCapabilities0_FilesSharing_SharebymailSerializer();
}

class _$SharebymailCapabilities0_FilesSharing_SharebymailSerializer
    implements StructuredSerializer<SharebymailCapabilities0_FilesSharing_Sharebymail> {
  const _$SharebymailCapabilities0_FilesSharing_SharebymailSerializer();

  @override
  Iterable<Type> get types =>
      const [SharebymailCapabilities0_FilesSharing_Sharebymail, _$SharebymailCapabilities0_FilesSharing_Sharebymail];

  @override
  String get wireName => 'SharebymailCapabilities0_FilesSharing_Sharebymail';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SharebymailCapabilities0_FilesSharing_Sharebymail object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'send_password_by_mail',
      serializers.serialize(object.sendPasswordByMail, specifiedType: const FullType(bool)),
      'upload_files_drop',
      serializers.serialize(
        object.uploadFilesDrop,
        specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
      ),
      'password',
      serializers.serialize(
        object.password,
        specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_Password),
      ),
      'expire_date',
      serializers.serialize(
        object.expireDate,
        specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate),
      ),
    ];
    return result;
  }

  @override
  SharebymailCapabilities0_FilesSharing_Sharebymail deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SharebymailCapabilities0_FilesSharing_SharebymailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'send_password_by_mail':
          result.sendPasswordByMail = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'upload_files_drop':
          result.uploadFilesDrop.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
            )! as SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
          );
        case 'password':
          result.password.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_Password),
            )! as SharebymailCapabilities0_FilesSharing_Sharebymail_Password,
          );
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate),
            )! as SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities0_FilesSharingInterface {
  SharebymailCapabilities0_FilesSharing_Sharebymail get sharebymail;
}

abstract class SharebymailCapabilities0_FilesSharing
    implements
        SharebymailCapabilities0_FilesSharingInterface,
        Built<SharebymailCapabilities0_FilesSharing, SharebymailCapabilities0_FilesSharingBuilder> {
  factory SharebymailCapabilities0_FilesSharing([
    final void Function(SharebymailCapabilities0_FilesSharingBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SharebymailCapabilities0_FilesSharing> get serializer =>
      const _$SharebymailCapabilities0_FilesSharingSerializer();
}

class _$SharebymailCapabilities0_FilesSharingSerializer
    implements StructuredSerializer<SharebymailCapabilities0_FilesSharing> {
  const _$SharebymailCapabilities0_FilesSharingSerializer();

  @override
  Iterable<Type> get types => const [SharebymailCapabilities0_FilesSharing, _$SharebymailCapabilities0_FilesSharing];

  @override
  String get wireName => 'SharebymailCapabilities0_FilesSharing';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SharebymailCapabilities0_FilesSharing object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'sharebymail',
      serializers.serialize(
        object.sharebymail,
        specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail),
      ),
    ];
    return result;
  }

  @override
  SharebymailCapabilities0_FilesSharing deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SharebymailCapabilities0_FilesSharingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'sharebymail':
          result.sharebymail.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail),
            )! as SharebymailCapabilities0_FilesSharing_Sharebymail,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilities0Interface {
  @BuiltValueField(wireName: 'files_sharing')
  SharebymailCapabilities0_FilesSharing get filesSharing;
}

abstract class SharebymailCapabilities0
    implements SharebymailCapabilities0Interface, Built<SharebymailCapabilities0, SharebymailCapabilities0Builder> {
  factory SharebymailCapabilities0([final void Function(SharebymailCapabilities0Builder)? b]) =
      _$SharebymailCapabilities0;

  // coverage:ignore-start
  const SharebymailCapabilities0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SharebymailCapabilities0> get serializer => const _$SharebymailCapabilities0Serializer();
}

class _$SharebymailCapabilities0Serializer implements StructuredSerializer<SharebymailCapabilities0> {
  const _$SharebymailCapabilities0Serializer();

  @override
  Iterable<Type> get types => const [SharebymailCapabilities0, _$SharebymailCapabilities0];

  @override
  String get wireName => 'SharebymailCapabilities0';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SharebymailCapabilities0 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files_sharing',
      serializers.serialize(object.filesSharing, specifiedType: const FullType(SharebymailCapabilities0_FilesSharing)),
    ];
    return result;
  }

  @override
  SharebymailCapabilities0 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SharebymailCapabilities0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files_sharing':
          result.filesSharing.replace(
            serializers.deserialize(value, specifiedType: const FullType(SharebymailCapabilities0_FilesSharing))!
                as SharebymailCapabilities0_FilesSharing,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class SharebymailCapabilitiesInterface {
  SharebymailCapabilities0? get sharebymailCapabilities0;
  BuiltList<JsonObject>? get builtListJsonObject;
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SharebymailCapabilities> get serializer => _$SharebymailCapabilitiesSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final SharebymailCapabilitiesBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._sharebymailCapabilities0, b._builtListJsonObject].firstWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need at least one of 'sharebymailCapabilities0', 'builtListJsonObject' for ${b._data}");
    }
  }
}

class _$SharebymailCapabilitiesSerializer implements PrimitiveSerializer<SharebymailCapabilities> {
  @override
  final Iterable<Type> types = const [SharebymailCapabilities, _$SharebymailCapabilities];

  @override
  final String wireName = 'SharebymailCapabilities';

  @override
  Object serialize(
    final Serializers serializers,
    final SharebymailCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  SharebymailCapabilities deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SharebymailCapabilitiesBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(SharebymailCapabilities0))!
          as SharebymailCapabilities0;
      result.sharebymailCapabilities0.replace(value);
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Attachments> get serializer =>
      const _$SpreedPublicCapabilities0_Spreed_Config_AttachmentsSerializer();
}

class _$SpreedPublicCapabilities0_Spreed_Config_AttachmentsSerializer
    implements StructuredSerializer<SpreedPublicCapabilities0_Spreed_Config_Attachments> {
  const _$SpreedPublicCapabilities0_Spreed_Config_AttachmentsSerializer();

  @override
  Iterable<Type> get types => const [
        SpreedPublicCapabilities0_Spreed_Config_Attachments,
        _$SpreedPublicCapabilities0_Spreed_Config_Attachments,
      ];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed_Config_Attachments';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed_Config_Attachments object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'allowed',
      serializers.serialize(object.allowed, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.folder;
    if (value != null) {
      result
        ..add('folder')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Attachments deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'allowed':
          result.allowed = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'folder':
          result.folder = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Call> get serializer =>
      const _$SpreedPublicCapabilities0_Spreed_Config_CallSerializer();
}

class _$SpreedPublicCapabilities0_Spreed_Config_CallSerializer
    implements StructuredSerializer<SpreedPublicCapabilities0_Spreed_Config_Call> {
  const _$SpreedPublicCapabilities0_Spreed_Config_CallSerializer();

  @override
  Iterable<Type> get types =>
      const [SpreedPublicCapabilities0_Spreed_Config_Call, _$SpreedPublicCapabilities0_Spreed_Config_Call];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed_Config_Call';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed_Config_Call object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
      'breakout-rooms',
      serializers.serialize(object.breakoutRooms, specifiedType: const FullType(bool)),
      'recording',
      serializers.serialize(object.recording, specifiedType: const FullType(bool)),
      'supported-reactions',
      serializers.serialize(object.supportedReactions, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'predefined-backgrounds',
      serializers.serialize(object.predefinedBackgrounds, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'can-upload-background',
      serializers.serialize(object.canUploadBackground, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.recordingConsent;
    if (value != null) {
      result
        ..add('recording-consent')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.sipEnabled;
    if (value != null) {
      result
        ..add('sip-enabled')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.sipDialoutEnabled;
    if (value != null) {
      result
        ..add('sip-dialout-enabled')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.canEnableSip;
    if (value != null) {
      result
        ..add('can-enable-sip')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Call deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_Spreed_Config_CallBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'breakout-rooms':
          result.breakoutRooms = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'recording':
          result.recording = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'recording-consent':
          result.recordingConsent = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'supported-reactions':
          result.supportedReactions.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'predefined-backgrounds':
          result.predefinedBackgrounds.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'can-upload-background':
          result.canUploadBackground = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'sip-enabled':
          result.sipEnabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'sip-dialout-enabled':
          result.sipDialoutEnabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'can-enable-sip':
          result.canEnableSip = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Chat> get serializer =>
      const _$SpreedPublicCapabilities0_Spreed_Config_ChatSerializer();
}

class _$SpreedPublicCapabilities0_Spreed_Config_ChatSerializer
    implements StructuredSerializer<SpreedPublicCapabilities0_Spreed_Config_Chat> {
  const _$SpreedPublicCapabilities0_Spreed_Config_ChatSerializer();

  @override
  Iterable<Type> get types =>
      const [SpreedPublicCapabilities0_Spreed_Config_Chat, _$SpreedPublicCapabilities0_Spreed_Config_Chat];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed_Config_Chat';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed_Config_Chat object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'max-length',
      serializers.serialize(object.maxLength, specifiedType: const FullType(int)),
      'read-privacy',
      serializers.serialize(object.readPrivacy, specifiedType: const FullType(int)),
      'typing-privacy',
      serializers.serialize(object.typingPrivacy, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.hasTranslationProviders;
    if (value != null) {
      result
        ..add('has-translation-providers')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.translations;
    if (value != null) {
      result
        ..add('translations')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Chat deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_Spreed_Config_ChatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'max-length':
          result.maxLength = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'read-privacy':
          result.readPrivacy = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'has-translation-providers':
          result.hasTranslationProviders = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'typing-privacy':
          result.typingPrivacy = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'translations':
          result.translations.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Conversations> get serializer =>
      const _$SpreedPublicCapabilities0_Spreed_Config_ConversationsSerializer();
}

class _$SpreedPublicCapabilities0_Spreed_Config_ConversationsSerializer
    implements StructuredSerializer<SpreedPublicCapabilities0_Spreed_Config_Conversations> {
  const _$SpreedPublicCapabilities0_Spreed_Config_ConversationsSerializer();

  @override
  Iterable<Type> get types => const [
        SpreedPublicCapabilities0_Spreed_Config_Conversations,
        _$SpreedPublicCapabilities0_Spreed_Config_Conversations,
      ];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed_Config_Conversations';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed_Config_Conversations object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'can-create',
      serializers.serialize(object.canCreate, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Conversations deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'can-create':
          result.canCreate = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Previews> get serializer =>
      const _$SpreedPublicCapabilities0_Spreed_Config_PreviewsSerializer();
}

class _$SpreedPublicCapabilities0_Spreed_Config_PreviewsSerializer
    implements StructuredSerializer<SpreedPublicCapabilities0_Spreed_Config_Previews> {
  const _$SpreedPublicCapabilities0_Spreed_Config_PreviewsSerializer();

  @override
  Iterable<Type> get types =>
      const [SpreedPublicCapabilities0_Spreed_Config_Previews, _$SpreedPublicCapabilities0_Spreed_Config_Previews];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed_Config_Previews';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed_Config_Previews object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'max-gif-size',
      serializers.serialize(object.maxGifSize, specifiedType: const FullType(int)),
    ];
    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Previews deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'max-gif-size':
          result.maxGifSize = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Signaling> get serializer =>
      const _$SpreedPublicCapabilities0_Spreed_Config_SignalingSerializer();
}

class _$SpreedPublicCapabilities0_Spreed_Config_SignalingSerializer
    implements StructuredSerializer<SpreedPublicCapabilities0_Spreed_Config_Signaling> {
  const _$SpreedPublicCapabilities0_Spreed_Config_SignalingSerializer();

  @override
  Iterable<Type> get types =>
      const [SpreedPublicCapabilities0_Spreed_Config_Signaling, _$SpreedPublicCapabilities0_Spreed_Config_Signaling];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed_Config_Signaling';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed_Config_Signaling object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'session-ping-limit',
      serializers.serialize(object.sessionPingLimit, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.helloV2TokenKey;
    if (value != null) {
      result
        ..add('hello-v2-token-key')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config_Signaling deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'session-ping-limit':
          result.sessionPingLimit = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'hello-v2-token-key':
          result.helloV2TokenKey = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed_Config> get serializer =>
      const _$SpreedPublicCapabilities0_Spreed_ConfigSerializer();
}

class _$SpreedPublicCapabilities0_Spreed_ConfigSerializer
    implements StructuredSerializer<SpreedPublicCapabilities0_Spreed_Config> {
  const _$SpreedPublicCapabilities0_Spreed_ConfigSerializer();

  @override
  Iterable<Type> get types =>
      const [SpreedPublicCapabilities0_Spreed_Config, _$SpreedPublicCapabilities0_Spreed_Config];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed_Config';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed_Config object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'attachments',
      serializers.serialize(
        object.attachments,
        specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Attachments),
      ),
      'call',
      serializers.serialize(object.call, specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Call)),
      'chat',
      serializers.serialize(object.chat, specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Chat)),
      'conversations',
      serializers.serialize(
        object.conversations,
        specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Conversations),
      ),
      'previews',
      serializers.serialize(
        object.previews,
        specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Previews),
      ),
      'signaling',
      serializers.serialize(
        object.signaling,
        specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Signaling),
      ),
    ];
    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed_Config deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_Spreed_ConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'attachments':
          result.attachments.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Attachments),
            )! as SpreedPublicCapabilities0_Spreed_Config_Attachments,
          );
        case 'call':
          result.call.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Call),
            )! as SpreedPublicCapabilities0_Spreed_Config_Call,
          );
        case 'chat':
          result.chat.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Chat),
            )! as SpreedPublicCapabilities0_Spreed_Config_Chat,
          );
        case 'conversations':
          result.conversations.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Conversations),
            )! as SpreedPublicCapabilities0_Spreed_Config_Conversations,
          );
        case 'previews':
          result.previews.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Previews),
            )! as SpreedPublicCapabilities0_Spreed_Config_Previews,
          );
        case 'signaling':
          result.signaling.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config_Signaling),
            )! as SpreedPublicCapabilities0_Spreed_Config_Signaling,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0_Spreed> get serializer =>
      const _$SpreedPublicCapabilities0_SpreedSerializer();
}

class _$SpreedPublicCapabilities0_SpreedSerializer implements StructuredSerializer<SpreedPublicCapabilities0_Spreed> {
  const _$SpreedPublicCapabilities0_SpreedSerializer();

  @override
  Iterable<Type> get types => const [SpreedPublicCapabilities0_Spreed, _$SpreedPublicCapabilities0_Spreed];

  @override
  String get wireName => 'SpreedPublicCapabilities0_Spreed';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0_Spreed object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'features',
      serializers.serialize(object.features, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'config',
      serializers.serialize(object.config, specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  SpreedPublicCapabilities0_Spreed deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0_SpreedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'features':
          result.features.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'config':
          result.config.replace(
            serializers.deserialize(value, specifiedType: const FullType(SpreedPublicCapabilities0_Spreed_Config))!
                as SpreedPublicCapabilities0_Spreed_Config,
          );
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SpreedPublicCapabilities0> get serializer => const _$SpreedPublicCapabilities0Serializer();
}

class _$SpreedPublicCapabilities0Serializer implements StructuredSerializer<SpreedPublicCapabilities0> {
  const _$SpreedPublicCapabilities0Serializer();

  @override
  Iterable<Type> get types => const [SpreedPublicCapabilities0, _$SpreedPublicCapabilities0];

  @override
  String get wireName => 'SpreedPublicCapabilities0';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SpreedPublicCapabilities0 object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'spreed',
      serializers.serialize(object.spreed, specifiedType: const FullType(SpreedPublicCapabilities0_Spreed)),
    ];
    return result;
  }

  @override
  SpreedPublicCapabilities0 deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpreedPublicCapabilities0Builder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'spreed':
          result.spreed.replace(
            serializers.deserialize(value, specifiedType: const FullType(SpreedPublicCapabilities0_Spreed))!
                as SpreedPublicCapabilities0_Spreed,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ThemingPublicCapabilities_Theming> get serializer =>
      const _$ThemingPublicCapabilities_ThemingSerializer();
}

class _$ThemingPublicCapabilities_ThemingSerializer implements StructuredSerializer<ThemingPublicCapabilities_Theming> {
  const _$ThemingPublicCapabilities_ThemingSerializer();

  @override
  Iterable<Type> get types => const [ThemingPublicCapabilities_Theming, _$ThemingPublicCapabilities_Theming];

  @override
  String get wireName => 'ThemingPublicCapabilities_Theming';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ThemingPublicCapabilities_Theming object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'slogan',
      serializers.serialize(object.slogan, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color, specifiedType: const FullType(String)),
      'color-text',
      serializers.serialize(object.colorText, specifiedType: const FullType(String)),
      'color-element',
      serializers.serialize(object.colorElement, specifiedType: const FullType(String)),
      'color-element-bright',
      serializers.serialize(object.colorElementBright, specifiedType: const FullType(String)),
      'color-element-dark',
      serializers.serialize(object.colorElementDark, specifiedType: const FullType(String)),
      'logo',
      serializers.serialize(object.logo, specifiedType: const FullType(String)),
      'background',
      serializers.serialize(object.background, specifiedType: const FullType(String)),
      'background-plain',
      serializers.serialize(object.backgroundPlain, specifiedType: const FullType(bool)),
      'background-default',
      serializers.serialize(object.backgroundDefault, specifiedType: const FullType(bool)),
      'logoheader',
      serializers.serialize(object.logoheader, specifiedType: const FullType(String)),
      'favicon',
      serializers.serialize(object.favicon, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  ThemingPublicCapabilities_Theming deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ThemingPublicCapabilities_ThemingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'slogan':
          result.slogan = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'color':
          result.color = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'color-text':
          result.colorText = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'color-element':
          result.colorElement = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'color-element-bright':
          result.colorElementBright = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'color-element-dark':
          result.colorElementDark = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'logo':
          result.logo = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'background':
          result.background = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'background-plain':
          result.backgroundPlain = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'background-default':
          result.backgroundDefault = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'logoheader':
          result.logoheader = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'favicon':
          result.favicon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ThemingPublicCapabilities> get serializer => const _$ThemingPublicCapabilitiesSerializer();
}

class _$ThemingPublicCapabilitiesSerializer implements StructuredSerializer<ThemingPublicCapabilities> {
  const _$ThemingPublicCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [ThemingPublicCapabilities, _$ThemingPublicCapabilities];

  @override
  String get wireName => 'ThemingPublicCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ThemingPublicCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'theming',
      serializers.serialize(object.theming, specifiedType: const FullType(ThemingPublicCapabilities_Theming)),
    ];
    return result;
  }

  @override
  ThemingPublicCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ThemingPublicCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'theming':
          result.theming.replace(
            serializers.deserialize(value, specifiedType: const FullType(ThemingPublicCapabilities_Theming))!
                as ThemingPublicCapabilities_Theming,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusCapabilities_UserStatus> get serializer =>
      const _$UserStatusCapabilities_UserStatusSerializer();
}

class _$UserStatusCapabilities_UserStatusSerializer implements StructuredSerializer<UserStatusCapabilities_UserStatus> {
  const _$UserStatusCapabilities_UserStatusSerializer();

  @override
  Iterable<Type> get types => const [UserStatusCapabilities_UserStatus, _$UserStatusCapabilities_UserStatus];

  @override
  String get wireName => 'UserStatusCapabilities_UserStatus';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusCapabilities_UserStatus object, {
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
  UserStatusCapabilities_UserStatus deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusCapabilities_UserStatusBuilder();

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

  @BuiltValueSerializer(custom: true)
  static Serializer<UserStatusCapabilities> get serializer => const _$UserStatusCapabilitiesSerializer();
}

class _$UserStatusCapabilitiesSerializer implements StructuredSerializer<UserStatusCapabilities> {
  const _$UserStatusCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [UserStatusCapabilities, _$UserStatusCapabilities];

  @override
  String get wireName => 'UserStatusCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UserStatusCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'user_status',
      serializers.serialize(object.userStatus, specifiedType: const FullType(UserStatusCapabilities_UserStatus)),
    ];
    return result;
  }

  @override
  UserStatusCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserStatusCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'user_status':
          result.userStatus.replace(
            serializers.deserialize(value, specifiedType: const FullType(UserStatusCapabilities_UserStatus))!
                as UserStatusCapabilities_UserStatus,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusCapabilities_WeatherStatus> get serializer =>
      const _$WeatherStatusCapabilities_WeatherStatusSerializer();
}

class _$WeatherStatusCapabilities_WeatherStatusSerializer
    implements StructuredSerializer<WeatherStatusCapabilities_WeatherStatus> {
  const _$WeatherStatusCapabilities_WeatherStatusSerializer();

  @override
  Iterable<Type> get types =>
      const [WeatherStatusCapabilities_WeatherStatus, _$WeatherStatusCapabilities_WeatherStatus];

  @override
  String get wireName => 'WeatherStatusCapabilities_WeatherStatus';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusCapabilities_WeatherStatus object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  WeatherStatusCapabilities_WeatherStatus deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusCapabilities_WeatherStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WeatherStatusCapabilities> get serializer => const _$WeatherStatusCapabilitiesSerializer();
}

class _$WeatherStatusCapabilitiesSerializer implements StructuredSerializer<WeatherStatusCapabilities> {
  const _$WeatherStatusCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [WeatherStatusCapabilities, _$WeatherStatusCapabilities];

  @override
  String get wireName => 'WeatherStatusCapabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WeatherStatusCapabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'weather_status',
      serializers.serialize(
        object.weatherStatus,
        specifiedType: const FullType(WeatherStatusCapabilities_WeatherStatus),
      ),
    ];
    return result;
  }

  @override
  WeatherStatusCapabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WeatherStatusCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'weather_status':
          result.weatherStatus.replace(
            serializers.deserialize(value, specifiedType: const FullType(WeatherStatusCapabilities_WeatherStatus))!
                as WeatherStatusCapabilities_WeatherStatus,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data> get serializer =>
      const _$OcsGetCapabilitiesResponseApplicationJson_Ocs_DataSerializer();
}

class _$OcsGetCapabilitiesResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data> {
  const _$OcsGetCapabilitiesResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [OcsGetCapabilitiesResponseApplicationJson_Ocs_Data, _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'OcsGetCapabilitiesResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'version',
      serializers.serialize(
        object.version,
        specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version),
      ),
      'capabilities',
      serializers.serialize(
        object.capabilities,
        specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities),
      ),
    ];
    return result;
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'version':
          result.version.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version),
            )! as OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version,
          );
        case 'capabilities':
          result.capabilities.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities),
            )! as OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs> get serializer =>
      const _$OcsGetCapabilitiesResponseApplicationJson_OcsSerializer();
}

class _$OcsGetCapabilitiesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<OcsGetCapabilitiesResponseApplicationJson_Ocs> {
  const _$OcsGetCapabilitiesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [OcsGetCapabilitiesResponseApplicationJson_Ocs, _$OcsGetCapabilitiesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'OcsGetCapabilitiesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcsGetCapabilitiesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcsGetCapabilitiesResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data),
            )! as OcsGetCapabilitiesResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<OcsGetCapabilitiesResponseApplicationJson> get serializer =>
      const _$OcsGetCapabilitiesResponseApplicationJsonSerializer();
}

class _$OcsGetCapabilitiesResponseApplicationJsonSerializer
    implements StructuredSerializer<OcsGetCapabilitiesResponseApplicationJson> {
  const _$OcsGetCapabilitiesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [OcsGetCapabilitiesResponseApplicationJson, _$OcsGetCapabilitiesResponseApplicationJson];

  @override
  String get wireName => 'OcsGetCapabilitiesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OcsGetCapabilitiesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  OcsGetCapabilitiesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OcsGetCapabilitiesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs),
            )! as OcsGetCapabilitiesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ProfileApiSetVisibilityResponseApplicationJson_Ocs> get serializer =>
      const _$ProfileApiSetVisibilityResponseApplicationJson_OcsSerializer();
}

class _$ProfileApiSetVisibilityResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ProfileApiSetVisibilityResponseApplicationJson_Ocs> {
  const _$ProfileApiSetVisibilityResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ProfileApiSetVisibilityResponseApplicationJson_Ocs, _$ProfileApiSetVisibilityResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ProfileApiSetVisibilityResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ProfileApiSetVisibilityResponseApplicationJson_Ocs object, {
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
  ProfileApiSetVisibilityResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder();

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

  @BuiltValueSerializer(custom: true)
  static Serializer<ProfileApiSetVisibilityResponseApplicationJson> get serializer =>
      const _$ProfileApiSetVisibilityResponseApplicationJsonSerializer();
}

class _$ProfileApiSetVisibilityResponseApplicationJsonSerializer
    implements StructuredSerializer<ProfileApiSetVisibilityResponseApplicationJson> {
  const _$ProfileApiSetVisibilityResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ProfileApiSetVisibilityResponseApplicationJson, _$ProfileApiSetVisibilityResponseApplicationJson];

  @override
  String get wireName => 'ProfileApiSetVisibilityResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ProfileApiSetVisibilityResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ProfileApiSetVisibilityResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ProfileApiSetVisibilityResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProfileApiSetVisibilityResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ProfileApiSetVisibilityResponseApplicationJson_Ocs),
            )! as ProfileApiSetVisibilityResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Reference> get serializer => const _$ReferenceSerializer();
}

class _$ReferenceSerializer implements StructuredSerializer<Reference> {
  const _$ReferenceSerializer();

  @override
  Iterable<Type> get types => const [Reference, _$Reference];

  @override
  String get wireName => 'Reference';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Reference object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'richObjectType',
      serializers.serialize(object.richObjectType, specifiedType: const FullType(String)),
      'richObject',
      serializers.serialize(
        object.richObject,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
      ),
      'openGraphObject',
      serializers.serialize(object.openGraphObject, specifiedType: const FullType(OpenGraphObject)),
      'accessible',
      serializers.serialize(object.accessible, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Reference deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'richObjectType':
          result.richObjectType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'richObject':
          result.richObject.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
            )! as BuiltMap<String, JsonObject>,
          );
        case 'openGraphObject':
          result.openGraphObject.replace(
            serializers.deserialize(value, specifiedType: const FullType(OpenGraphObject))! as OpenGraphObject,
          );
        case 'accessible':
          result.accessible = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiResolveOneResponseApplicationJson_Ocs_Data> get serializer =>
      const _$ReferenceApiResolveOneResponseApplicationJson_Ocs_DataSerializer();
}

class _$ReferenceApiResolveOneResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ReferenceApiResolveOneResponseApplicationJson_Ocs_Data> {
  const _$ReferenceApiResolveOneResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        ReferenceApiResolveOneResponseApplicationJson_Ocs_Data,
        _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'ReferenceApiResolveOneResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiResolveOneResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'references',
      serializers.serialize(
        object.references,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'references':
          result.references.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
            )! as BuiltMap<String, Reference>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiResolveOneResponseApplicationJson_Ocs> get serializer =>
      const _$ReferenceApiResolveOneResponseApplicationJson_OcsSerializer();
}

class _$ReferenceApiResolveOneResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ReferenceApiResolveOneResponseApplicationJson_Ocs> {
  const _$ReferenceApiResolveOneResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ReferenceApiResolveOneResponseApplicationJson_Ocs, _$ReferenceApiResolveOneResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ReferenceApiResolveOneResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiResolveOneResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiResolveOneResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs_Data),
            )! as ReferenceApiResolveOneResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiResolveOneResponseApplicationJson> get serializer =>
      const _$ReferenceApiResolveOneResponseApplicationJsonSerializer();
}

class _$ReferenceApiResolveOneResponseApplicationJsonSerializer
    implements StructuredSerializer<ReferenceApiResolveOneResponseApplicationJson> {
  const _$ReferenceApiResolveOneResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ReferenceApiResolveOneResponseApplicationJson, _$ReferenceApiResolveOneResponseApplicationJson];

  @override
  String get wireName => 'ReferenceApiResolveOneResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiResolveOneResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiResolveOneResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiResolveOneResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs),
            )! as ReferenceApiResolveOneResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiResolveResponseApplicationJson_Ocs_Data> get serializer =>
      const _$ReferenceApiResolveResponseApplicationJson_Ocs_DataSerializer();
}

class _$ReferenceApiResolveResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ReferenceApiResolveResponseApplicationJson_Ocs_Data> {
  const _$ReferenceApiResolveResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        ReferenceApiResolveResponseApplicationJson_Ocs_Data,
        _$ReferenceApiResolveResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'ReferenceApiResolveResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiResolveResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'references',
      serializers.serialize(
        object.references,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiResolveResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'references':
          result.references.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
            )! as BuiltMap<String, Reference>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiResolveResponseApplicationJson_Ocs> get serializer =>
      const _$ReferenceApiResolveResponseApplicationJson_OcsSerializer();
}

class _$ReferenceApiResolveResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ReferenceApiResolveResponseApplicationJson_Ocs> {
  const _$ReferenceApiResolveResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ReferenceApiResolveResponseApplicationJson_Ocs, _$ReferenceApiResolveResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ReferenceApiResolveResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiResolveResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(ReferenceApiResolveResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiResolveResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiResolveResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(ReferenceApiResolveResponseApplicationJson_Ocs_Data),
            )! as ReferenceApiResolveResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiResolveResponseApplicationJson> get serializer =>
      const _$ReferenceApiResolveResponseApplicationJsonSerializer();
}

class _$ReferenceApiResolveResponseApplicationJsonSerializer
    implements StructuredSerializer<ReferenceApiResolveResponseApplicationJson> {
  const _$ReferenceApiResolveResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ReferenceApiResolveResponseApplicationJson, _$ReferenceApiResolveResponseApplicationJson];

  @override
  String get wireName => 'ReferenceApiResolveResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiResolveResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ReferenceApiResolveResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ReferenceApiResolveResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiResolveResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ReferenceApiResolveResponseApplicationJson_Ocs),
            )! as ReferenceApiResolveResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiExtractResponseApplicationJson_Ocs_Data> get serializer =>
      const _$ReferenceApiExtractResponseApplicationJson_Ocs_DataSerializer();
}

class _$ReferenceApiExtractResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ReferenceApiExtractResponseApplicationJson_Ocs_Data> {
  const _$ReferenceApiExtractResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        ReferenceApiExtractResponseApplicationJson_Ocs_Data,
        _$ReferenceApiExtractResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'ReferenceApiExtractResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiExtractResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'references',
      serializers.serialize(
        object.references,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiExtractResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'references':
          result.references.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
            )! as BuiltMap<String, Reference>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiExtractResponseApplicationJson_Ocs> get serializer =>
      const _$ReferenceApiExtractResponseApplicationJson_OcsSerializer();
}

class _$ReferenceApiExtractResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ReferenceApiExtractResponseApplicationJson_Ocs> {
  const _$ReferenceApiExtractResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ReferenceApiExtractResponseApplicationJson_Ocs, _$ReferenceApiExtractResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ReferenceApiExtractResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiExtractResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(ReferenceApiExtractResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiExtractResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiExtractResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(ReferenceApiExtractResponseApplicationJson_Ocs_Data),
            )! as ReferenceApiExtractResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiExtractResponseApplicationJson> get serializer =>
      const _$ReferenceApiExtractResponseApplicationJsonSerializer();
}

class _$ReferenceApiExtractResponseApplicationJsonSerializer
    implements StructuredSerializer<ReferenceApiExtractResponseApplicationJson> {
  const _$ReferenceApiExtractResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ReferenceApiExtractResponseApplicationJson, _$ReferenceApiExtractResponseApplicationJson];

  @override
  String get wireName => 'ReferenceApiExtractResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiExtractResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ReferenceApiExtractResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ReferenceApiExtractResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiExtractResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ReferenceApiExtractResponseApplicationJson_Ocs),
            )! as ReferenceApiExtractResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceProvider> get serializer => const _$ReferenceProviderSerializer();
}

class _$ReferenceProviderSerializer implements StructuredSerializer<ReferenceProvider> {
  const _$ReferenceProviderSerializer();

  @override
  Iterable<Type> get types => const [ReferenceProvider, _$ReferenceProvider];

  @override
  String get wireName => 'ReferenceProvider';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceProvider object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'icon_url',
      serializers.serialize(object.iconUrl, specifiedType: const FullType(String)),
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.searchProvidersIds;
    if (value != null) {
      result
        ..add('search_providers_ids')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    return result;
  }

  @override
  ReferenceProvider deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon_url':
          result.iconUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'order':
          result.order = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'search_providers_ids':
          result.searchProvidersIds.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs> get serializer =>
      const _$ReferenceApiGetProvidersInfoResponseApplicationJson_OcsSerializer();
}

class _$ReferenceApiGetProvidersInfoResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs> {
  const _$ReferenceApiGetProvidersInfoResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs,
        _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(ReferenceProvider)])),
    ];
    return result;
  }

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ReferenceProvider)]))!
                as BuiltList<ReferenceProvider>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiGetProvidersInfoResponseApplicationJson> get serializer =>
      const _$ReferenceApiGetProvidersInfoResponseApplicationJsonSerializer();
}

class _$ReferenceApiGetProvidersInfoResponseApplicationJsonSerializer
    implements StructuredSerializer<ReferenceApiGetProvidersInfoResponseApplicationJson> {
  const _$ReferenceApiGetProvidersInfoResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        ReferenceApiGetProvidersInfoResponseApplicationJson,
        _$ReferenceApiGetProvidersInfoResponseApplicationJson,
      ];

  @override
  String get wireName => 'ReferenceApiGetProvidersInfoResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiGetProvidersInfoResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiGetProvidersInfoResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs),
            )! as ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data> get serializer =>
      const _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataSerializer();
}

class _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data> {
  const _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data,
        _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs> get serializer =>
      const _$ReferenceApiTouchProviderResponseApplicationJson_OcsSerializer();
}

class _$ReferenceApiTouchProviderResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs> {
  const _$ReferenceApiTouchProviderResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        ReferenceApiTouchProviderResponseApplicationJson_Ocs,
        _$ReferenceApiTouchProviderResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'ReferenceApiTouchProviderResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiTouchProviderResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data),
            )! as ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ReferenceApiTouchProviderResponseApplicationJson> get serializer =>
      const _$ReferenceApiTouchProviderResponseApplicationJsonSerializer();
}

class _$ReferenceApiTouchProviderResponseApplicationJsonSerializer
    implements StructuredSerializer<ReferenceApiTouchProviderResponseApplicationJson> {
  const _$ReferenceApiTouchProviderResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ReferenceApiTouchProviderResponseApplicationJson, _$ReferenceApiTouchProviderResponseApplicationJson];

  @override
  String get wireName => 'ReferenceApiTouchProviderResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ReferenceApiTouchProviderResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ReferenceApiTouchProviderResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReferenceApiTouchProviderResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs),
            )! as ReferenceApiTouchProviderResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get serializer =>
      const _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesSerializer();
}

class _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesSerializer
    implements StructuredSerializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> {
  const _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types,
        _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types,
      ];

  @override
  String get wireName => 'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data> {
  const _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data,
        _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'types',
      serializers.serialize(
        object.types,
        specifiedType:
            const FullType(BuiltList, [FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types)]),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'types':
          result.types.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(
                BuiltList,
                [FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types)],
              ),
            )! as BuiltList<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs> get serializer =>
      const _$TextProcessingApiTaskTypesResponseApplicationJson_OcsSerializer();
}

class _$TextProcessingApiTaskTypesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs> {
  const _$TextProcessingApiTaskTypesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs,
        _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextProcessingApiTaskTypesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiTaskTypesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data),
            )! as TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson> get serializer =>
      const _$TextProcessingApiTaskTypesResponseApplicationJsonSerializer();
}

class _$TextProcessingApiTaskTypesResponseApplicationJsonSerializer
    implements StructuredSerializer<TextProcessingApiTaskTypesResponseApplicationJson> {
  const _$TextProcessingApiTaskTypesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextProcessingApiTaskTypesResponseApplicationJson, _$TextProcessingApiTaskTypesResponseApplicationJson];

  @override
  String get wireName => 'TextProcessingApiTaskTypesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiTaskTypesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiTaskTypesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiTaskTypesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs),
            )! as TextProcessingApiTaskTypesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingTask> get serializer => const _$TextProcessingTaskSerializer();
}

class _$TextProcessingTaskSerializer implements StructuredSerializer<TextProcessingTask> {
  const _$TextProcessingTaskSerializer();

  @override
  Iterable<Type> get types => const [TextProcessingTask, _$TextProcessingTask];

  @override
  String get wireName => 'TextProcessingTask';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingTask object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'appId',
      serializers.serialize(object.appId, specifiedType: const FullType(String)),
      'input',
      serializers.serialize(object.input, specifiedType: const FullType(String)),
      'identifier',
      serializers.serialize(object.identifier, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.output;
    if (value != null) {
      result
        ..add('output')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  TextProcessingTask deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingTaskBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'appId':
          result.appId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'input':
          result.input = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'output':
          result.output = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'identifier':
          result.identifier = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiScheduleResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextProcessingApiScheduleResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextProcessingApiScheduleResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextProcessingApiScheduleResponseApplicationJson_Ocs_Data> {
  const _$TextProcessingApiScheduleResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiScheduleResponseApplicationJson_Ocs_Data,
        _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextProcessingApiScheduleResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiScheduleResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'task',
      serializers.serialize(object.task, specifiedType: const FullType(TextProcessingTask)),
    ];
    return result;
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'task':
          result.task.replace(
            serializers.deserialize(value, specifiedType: const FullType(TextProcessingTask))! as TextProcessingTask,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiScheduleResponseApplicationJson_Ocs> get serializer =>
      const _$TextProcessingApiScheduleResponseApplicationJson_OcsSerializer();
}

class _$TextProcessingApiScheduleResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextProcessingApiScheduleResponseApplicationJson_Ocs> {
  const _$TextProcessingApiScheduleResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiScheduleResponseApplicationJson_Ocs,
        _$TextProcessingApiScheduleResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextProcessingApiScheduleResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiScheduleResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiScheduleResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs_Data),
            )! as TextProcessingApiScheduleResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiScheduleResponseApplicationJson> get serializer =>
      const _$TextProcessingApiScheduleResponseApplicationJsonSerializer();
}

class _$TextProcessingApiScheduleResponseApplicationJsonSerializer
    implements StructuredSerializer<TextProcessingApiScheduleResponseApplicationJson> {
  const _$TextProcessingApiScheduleResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextProcessingApiScheduleResponseApplicationJson, _$TextProcessingApiScheduleResponseApplicationJson];

  @override
  String get wireName => 'TextProcessingApiScheduleResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiScheduleResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiScheduleResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiScheduleResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs),
            )! as TextProcessingApiScheduleResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data> {
  const _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data,
        _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'task',
      serializers.serialize(object.task, specifiedType: const FullType(TextProcessingTask)),
    ];
    return result;
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'task':
          result.task.replace(
            serializers.deserialize(value, specifiedType: const FullType(TextProcessingTask))! as TextProcessingTask,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs> get serializer =>
      const _$TextProcessingApiGetTaskResponseApplicationJson_OcsSerializer();
}

class _$TextProcessingApiGetTaskResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs> {
  const _$TextProcessingApiGetTaskResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiGetTaskResponseApplicationJson_Ocs,
        _$TextProcessingApiGetTaskResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextProcessingApiGetTaskResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiGetTaskResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data),
            )! as TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiGetTaskResponseApplicationJson> get serializer =>
      const _$TextProcessingApiGetTaskResponseApplicationJsonSerializer();
}

class _$TextProcessingApiGetTaskResponseApplicationJsonSerializer
    implements StructuredSerializer<TextProcessingApiGetTaskResponseApplicationJson> {
  const _$TextProcessingApiGetTaskResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextProcessingApiGetTaskResponseApplicationJson, _$TextProcessingApiGetTaskResponseApplicationJson];

  @override
  String get wireName => 'TextProcessingApiGetTaskResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiGetTaskResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiGetTaskResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiGetTaskResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs),
            )! as TextProcessingApiGetTaskResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data> {
  const _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data,
        _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'task',
      serializers.serialize(object.task, specifiedType: const FullType(TextProcessingTask)),
    ];
    return result;
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'task':
          result.task.replace(
            serializers.deserialize(value, specifiedType: const FullType(TextProcessingTask))! as TextProcessingTask,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs> get serializer =>
      const _$TextProcessingApiDeleteTaskResponseApplicationJson_OcsSerializer();
}

class _$TextProcessingApiDeleteTaskResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs> {
  const _$TextProcessingApiDeleteTaskResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiDeleteTaskResponseApplicationJson_Ocs,
        _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextProcessingApiDeleteTaskResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiDeleteTaskResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data),
            )! as TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson> get serializer =>
      const _$TextProcessingApiDeleteTaskResponseApplicationJsonSerializer();
}

class _$TextProcessingApiDeleteTaskResponseApplicationJsonSerializer
    implements StructuredSerializer<TextProcessingApiDeleteTaskResponseApplicationJson> {
  const _$TextProcessingApiDeleteTaskResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextProcessingApiDeleteTaskResponseApplicationJson, _$TextProcessingApiDeleteTaskResponseApplicationJson];

  @override
  String get wireName => 'TextProcessingApiDeleteTaskResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiDeleteTaskResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiDeleteTaskResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiDeleteTaskResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs),
            )! as TextProcessingApiDeleteTaskResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data> {
  const _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data,
        _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'tasks',
      serializers.serialize(object.tasks, specifiedType: const FullType(BuiltList, [FullType(TextProcessingTask)])),
    ];
    return result;
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'tasks':
          result.tasks.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(TextProcessingTask)]))!
                as BuiltList<TextProcessingTask>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs> get serializer =>
      const _$TextProcessingApiListTasksByAppResponseApplicationJson_OcsSerializer();
}

class _$TextProcessingApiListTasksByAppResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs> {
  const _$TextProcessingApiListTasksByAppResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiListTasksByAppResponseApplicationJson_Ocs,
        _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextProcessingApiListTasksByAppResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiListTasksByAppResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data),
            )! as TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson> get serializer =>
      const _$TextProcessingApiListTasksByAppResponseApplicationJsonSerializer();
}

class _$TextProcessingApiListTasksByAppResponseApplicationJsonSerializer
    implements StructuredSerializer<TextProcessingApiListTasksByAppResponseApplicationJson> {
  const _$TextProcessingApiListTasksByAppResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        TextProcessingApiListTasksByAppResponseApplicationJson,
        _$TextProcessingApiListTasksByAppResponseApplicationJson,
      ];

  @override
  String get wireName => 'TextProcessingApiListTasksByAppResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextProcessingApiListTasksByAppResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextProcessingApiListTasksByAppResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextProcessingApiListTasksByAppResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs),
            )! as TextProcessingApiListTasksByAppResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterface {
  bool get isAvailable;
}

abstract class TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data
    implements
        TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data,
            TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data([
    final void Function(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data> {
  const _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data,
        _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'isAvailable',
      serializers.serialize(object.isAvailable, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'isAvailable':
          result.isAvailable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiIsAvailableResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiIsAvailableResponseApplicationJson_Ocs
    implements
        TextToImageApiIsAvailableResponseApplicationJson_OcsInterface,
        Built<TextToImageApiIsAvailableResponseApplicationJson_Ocs,
            TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs([
    final void Function(TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiIsAvailableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiIsAvailableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiIsAvailableResponseApplicationJson_Ocs> get serializer =>
      const _$TextToImageApiIsAvailableResponseApplicationJson_OcsSerializer();
}

class _$TextToImageApiIsAvailableResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextToImageApiIsAvailableResponseApplicationJson_Ocs> {
  const _$TextToImageApiIsAvailableResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiIsAvailableResponseApplicationJson_Ocs,
        _$TextToImageApiIsAvailableResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextToImageApiIsAvailableResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiIsAvailableResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data),
            )! as TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiIsAvailableResponseApplicationJsonInterface {
  TextToImageApiIsAvailableResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiIsAvailableResponseApplicationJson
    implements
        TextToImageApiIsAvailableResponseApplicationJsonInterface,
        Built<TextToImageApiIsAvailableResponseApplicationJson,
            TextToImageApiIsAvailableResponseApplicationJsonBuilder> {
  factory TextToImageApiIsAvailableResponseApplicationJson([
    final void Function(TextToImageApiIsAvailableResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiIsAvailableResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiIsAvailableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiIsAvailableResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiIsAvailableResponseApplicationJson> get serializer =>
      const _$TextToImageApiIsAvailableResponseApplicationJsonSerializer();
}

class _$TextToImageApiIsAvailableResponseApplicationJsonSerializer
    implements StructuredSerializer<TextToImageApiIsAvailableResponseApplicationJson> {
  const _$TextToImageApiIsAvailableResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextToImageApiIsAvailableResponseApplicationJson, _$TextToImageApiIsAvailableResponseApplicationJson];

  @override
  String get wireName => 'TextToImageApiIsAvailableResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiIsAvailableResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiIsAvailableResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiIsAvailableResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs),
            )! as TextToImageApiIsAvailableResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageTaskInterface {
  int? get id;
  int get status;
  String? get userId;
  String get appId;
  String get input;
  String? get identifier;
  int get numberOfImages;
  int? get completionExpectedAt;
}

abstract class TextToImageTask implements TextToImageTaskInterface, Built<TextToImageTask, TextToImageTaskBuilder> {
  factory TextToImageTask([final void Function(TextToImageTaskBuilder)? b]) = _$TextToImageTask;

  // coverage:ignore-start
  const TextToImageTask._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageTask.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageTask> get serializer => const _$TextToImageTaskSerializer();
}

class _$TextToImageTaskSerializer implements StructuredSerializer<TextToImageTask> {
  const _$TextToImageTaskSerializer();

  @override
  Iterable<Type> get types => const [TextToImageTask, _$TextToImageTask];

  @override
  String get wireName => 'TextToImageTask';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageTask object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'appId',
      serializers.serialize(object.appId, specifiedType: const FullType(String)),
      'input',
      serializers.serialize(object.input, specifiedType: const FullType(String)),
      'numberOfImages',
      serializers.serialize(object.numberOfImages, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.identifier;
    if (value != null) {
      result
        ..add('identifier')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.completionExpectedAt;
    if (value != null) {
      result
        ..add('completionExpectedAt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    return result;
  }

  @override
  TextToImageTask deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageTaskBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'appId':
          result.appId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'input':
          result.input = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'identifier':
          result.identifier = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'numberOfImages':
          result.numberOfImages = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'completionExpectedAt':
          result.completionExpectedAt = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterface {
  TextToImageTask get task;
}

abstract class TextToImageApiScheduleResponseApplicationJson_Ocs_Data
    implements
        TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiScheduleResponseApplicationJson_Ocs_Data,
            TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiScheduleResponseApplicationJson_Ocs_Data([
    final void Function(TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiScheduleResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiScheduleResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiScheduleResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextToImageApiScheduleResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextToImageApiScheduleResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextToImageApiScheduleResponseApplicationJson_Ocs_Data> {
  const _$TextToImageApiScheduleResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiScheduleResponseApplicationJson_Ocs_Data,
        _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextToImageApiScheduleResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiScheduleResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'task',
      serializers.serialize(object.task, specifiedType: const FullType(TextToImageTask)),
    ];
    return result;
  }

  @override
  TextToImageApiScheduleResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'task':
          result.task.replace(
            serializers.deserialize(value, specifiedType: const FullType(TextToImageTask))! as TextToImageTask,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiScheduleResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiScheduleResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiScheduleResponseApplicationJson_Ocs
    implements
        TextToImageApiScheduleResponseApplicationJson_OcsInterface,
        Built<TextToImageApiScheduleResponseApplicationJson_Ocs,
            TextToImageApiScheduleResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiScheduleResponseApplicationJson_Ocs([
    final void Function(TextToImageApiScheduleResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiScheduleResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiScheduleResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiScheduleResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiScheduleResponseApplicationJson_Ocs> get serializer =>
      const _$TextToImageApiScheduleResponseApplicationJson_OcsSerializer();
}

class _$TextToImageApiScheduleResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextToImageApiScheduleResponseApplicationJson_Ocs> {
  const _$TextToImageApiScheduleResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TextToImageApiScheduleResponseApplicationJson_Ocs, _$TextToImageApiScheduleResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TextToImageApiScheduleResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiScheduleResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiScheduleResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiScheduleResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs_Data),
            )! as TextToImageApiScheduleResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiScheduleResponseApplicationJsonInterface {
  TextToImageApiScheduleResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiScheduleResponseApplicationJson
    implements
        TextToImageApiScheduleResponseApplicationJsonInterface,
        Built<TextToImageApiScheduleResponseApplicationJson, TextToImageApiScheduleResponseApplicationJsonBuilder> {
  factory TextToImageApiScheduleResponseApplicationJson([
    final void Function(TextToImageApiScheduleResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiScheduleResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiScheduleResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiScheduleResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiScheduleResponseApplicationJson> get serializer =>
      const _$TextToImageApiScheduleResponseApplicationJsonSerializer();
}

class _$TextToImageApiScheduleResponseApplicationJsonSerializer
    implements StructuredSerializer<TextToImageApiScheduleResponseApplicationJson> {
  const _$TextToImageApiScheduleResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextToImageApiScheduleResponseApplicationJson, _$TextToImageApiScheduleResponseApplicationJson];

  @override
  String get wireName => 'TextToImageApiScheduleResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiScheduleResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiScheduleResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiScheduleResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs),
            )! as TextToImageApiScheduleResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterface {
  TextToImageTask get task;
}

abstract class TextToImageApiGetTaskResponseApplicationJson_Ocs_Data
    implements
        TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiGetTaskResponseApplicationJson_Ocs_Data,
            TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs_Data([
    final void Function(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiGetTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiGetTaskResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextToImageApiGetTaskResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextToImageApiGetTaskResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextToImageApiGetTaskResponseApplicationJson_Ocs_Data> {
  const _$TextToImageApiGetTaskResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiGetTaskResponseApplicationJson_Ocs_Data,
        _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextToImageApiGetTaskResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiGetTaskResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'task',
      serializers.serialize(object.task, specifiedType: const FullType(TextToImageTask)),
    ];
    return result;
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'task':
          result.task.replace(
            serializers.deserialize(value, specifiedType: const FullType(TextToImageTask))! as TextToImageTask,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiGetTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiGetTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiGetTaskResponseApplicationJson_Ocs
    implements
        TextToImageApiGetTaskResponseApplicationJson_OcsInterface,
        Built<TextToImageApiGetTaskResponseApplicationJson_Ocs,
            TextToImageApiGetTaskResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs([
    final void Function(TextToImageApiGetTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiGetTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiGetTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiGetTaskResponseApplicationJson_Ocs> get serializer =>
      const _$TextToImageApiGetTaskResponseApplicationJson_OcsSerializer();
}

class _$TextToImageApiGetTaskResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextToImageApiGetTaskResponseApplicationJson_Ocs> {
  const _$TextToImageApiGetTaskResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TextToImageApiGetTaskResponseApplicationJson_Ocs, _$TextToImageApiGetTaskResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TextToImageApiGetTaskResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiGetTaskResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiGetTaskResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs_Data),
            )! as TextToImageApiGetTaskResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiGetTaskResponseApplicationJsonInterface {
  TextToImageApiGetTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiGetTaskResponseApplicationJson
    implements
        TextToImageApiGetTaskResponseApplicationJsonInterface,
        Built<TextToImageApiGetTaskResponseApplicationJson, TextToImageApiGetTaskResponseApplicationJsonBuilder> {
  factory TextToImageApiGetTaskResponseApplicationJson([
    final void Function(TextToImageApiGetTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiGetTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiGetTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiGetTaskResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiGetTaskResponseApplicationJson> get serializer =>
      const _$TextToImageApiGetTaskResponseApplicationJsonSerializer();
}

class _$TextToImageApiGetTaskResponseApplicationJsonSerializer
    implements StructuredSerializer<TextToImageApiGetTaskResponseApplicationJson> {
  const _$TextToImageApiGetTaskResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextToImageApiGetTaskResponseApplicationJson, _$TextToImageApiGetTaskResponseApplicationJson];

  @override
  String get wireName => 'TextToImageApiGetTaskResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiGetTaskResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiGetTaskResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiGetTaskResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs),
            )! as TextToImageApiGetTaskResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterface {
  TextToImageTask get task;
}

abstract class TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data
    implements
        TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data,
            TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data([
    final void Function(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data> {
  const _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data,
        _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'task',
      serializers.serialize(object.task, specifiedType: const FullType(TextToImageTask)),
    ];
    return result;
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'task':
          result.task.replace(
            serializers.deserialize(value, specifiedType: const FullType(TextToImageTask))! as TextToImageTask,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiDeleteTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiDeleteTaskResponseApplicationJson_Ocs
    implements
        TextToImageApiDeleteTaskResponseApplicationJson_OcsInterface,
        Built<TextToImageApiDeleteTaskResponseApplicationJson_Ocs,
            TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs([
    final void Function(TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiDeleteTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiDeleteTaskResponseApplicationJson_Ocs> get serializer =>
      const _$TextToImageApiDeleteTaskResponseApplicationJson_OcsSerializer();
}

class _$TextToImageApiDeleteTaskResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextToImageApiDeleteTaskResponseApplicationJson_Ocs> {
  const _$TextToImageApiDeleteTaskResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiDeleteTaskResponseApplicationJson_Ocs,
        _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextToImageApiDeleteTaskResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiDeleteTaskResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data),
            )! as TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiDeleteTaskResponseApplicationJsonInterface {
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiDeleteTaskResponseApplicationJson
    implements
        TextToImageApiDeleteTaskResponseApplicationJsonInterface,
        Built<TextToImageApiDeleteTaskResponseApplicationJson, TextToImageApiDeleteTaskResponseApplicationJsonBuilder> {
  factory TextToImageApiDeleteTaskResponseApplicationJson([
    final void Function(TextToImageApiDeleteTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiDeleteTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiDeleteTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiDeleteTaskResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiDeleteTaskResponseApplicationJson> get serializer =>
      const _$TextToImageApiDeleteTaskResponseApplicationJsonSerializer();
}

class _$TextToImageApiDeleteTaskResponseApplicationJsonSerializer
    implements StructuredSerializer<TextToImageApiDeleteTaskResponseApplicationJson> {
  const _$TextToImageApiDeleteTaskResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TextToImageApiDeleteTaskResponseApplicationJson, _$TextToImageApiDeleteTaskResponseApplicationJson];

  @override
  String get wireName => 'TextToImageApiDeleteTaskResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiDeleteTaskResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiDeleteTaskResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiDeleteTaskResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs),
            )! as TextToImageApiDeleteTaskResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TextToImageTask> get tasks;
}

abstract class TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data
    implements
        TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data,
            TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data([
    final void Function(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataSerializer();
}

class _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data> {
  const _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data,
        _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'tasks',
      serializers.serialize(object.tasks, specifiedType: const FullType(BuiltList, [FullType(TextToImageTask)])),
    ];
    return result;
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'tasks':
          result.tasks.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(TextToImageTask)]))!
                as BuiltList<TextToImageTask>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiListTasksByAppResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiListTasksByAppResponseApplicationJson_Ocs
    implements
        TextToImageApiListTasksByAppResponseApplicationJson_OcsInterface,
        Built<TextToImageApiListTasksByAppResponseApplicationJson_Ocs,
            TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs([
    final void Function(TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiListTasksByAppResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiListTasksByAppResponseApplicationJson_Ocs> get serializer =>
      const _$TextToImageApiListTasksByAppResponseApplicationJson_OcsSerializer();
}

class _$TextToImageApiListTasksByAppResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TextToImageApiListTasksByAppResponseApplicationJson_Ocs> {
  const _$TextToImageApiListTasksByAppResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiListTasksByAppResponseApplicationJson_Ocs,
        _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TextToImageApiListTasksByAppResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiListTasksByAppResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data),
            )! as TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TextToImageApiListTasksByAppResponseApplicationJsonInterface {
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiListTasksByAppResponseApplicationJson
    implements
        TextToImageApiListTasksByAppResponseApplicationJsonInterface,
        Built<TextToImageApiListTasksByAppResponseApplicationJson,
            TextToImageApiListTasksByAppResponseApplicationJsonBuilder> {
  factory TextToImageApiListTasksByAppResponseApplicationJson([
    final void Function(TextToImageApiListTasksByAppResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiListTasksByAppResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiListTasksByAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiListTasksByAppResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageApiListTasksByAppResponseApplicationJson> get serializer =>
      const _$TextToImageApiListTasksByAppResponseApplicationJsonSerializer();
}

class _$TextToImageApiListTasksByAppResponseApplicationJsonSerializer
    implements StructuredSerializer<TextToImageApiListTasksByAppResponseApplicationJson> {
  const _$TextToImageApiListTasksByAppResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [
        TextToImageApiListTasksByAppResponseApplicationJson,
        _$TextToImageApiListTasksByAppResponseApplicationJson,
      ];

  @override
  String get wireName => 'TextToImageApiListTasksByAppResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TextToImageApiListTasksByAppResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TextToImageApiListTasksByAppResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TextToImageApiListTasksByAppResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs),
            )! as TextToImageApiListTasksByAppResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get serializer =>
      const _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesSerializer();
}

class _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesSerializer
    implements StructuredSerializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> {
  const _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesSerializer();

  @override
  Iterable<Type> get types => const [
        TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages,
        _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages,
      ];

  @override
  String get wireName => 'TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'from',
      serializers.serialize(object.from, specifiedType: const FullType(String)),
      'fromLabel',
      serializers.serialize(object.fromLabel, specifiedType: const FullType(String)),
      'to',
      serializers.serialize(object.to, specifiedType: const FullType(String)),
      'toLabel',
      serializers.serialize(object.toLabel, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'from':
          result.from = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'fromLabel':
          result.fromLabel = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'to':
          result.to = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'toLabel':
          result.toLabel = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TranslationApiLanguagesResponseApplicationJson_Ocs_DataSerializer();
}

class _$TranslationApiLanguagesResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data> {
  const _$TranslationApiLanguagesResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TranslationApiLanguagesResponseApplicationJson_Ocs_Data,
        _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TranslationApiLanguagesResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TranslationApiLanguagesResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'languages',
      serializers.serialize(
        object.languages,
        specifiedType:
            const FullType(BuiltList, [FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages)]),
      ),
      'languageDetection',
      serializers.serialize(object.languageDetection, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'languages':
          result.languages.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(
                BuiltList,
                [FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages)],
              ),
            )! as BuiltList<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>,
          );
        case 'languageDetection':
          result.languageDetection = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs> get serializer =>
      const _$TranslationApiLanguagesResponseApplicationJson_OcsSerializer();
}

class _$TranslationApiLanguagesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TranslationApiLanguagesResponseApplicationJson_Ocs> {
  const _$TranslationApiLanguagesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TranslationApiLanguagesResponseApplicationJson_Ocs, _$TranslationApiLanguagesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TranslationApiLanguagesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TranslationApiLanguagesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TranslationApiLanguagesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslationApiLanguagesResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data),
            )! as TranslationApiLanguagesResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslationApiLanguagesResponseApplicationJson> get serializer =>
      const _$TranslationApiLanguagesResponseApplicationJsonSerializer();
}

class _$TranslationApiLanguagesResponseApplicationJsonSerializer
    implements StructuredSerializer<TranslationApiLanguagesResponseApplicationJson> {
  const _$TranslationApiLanguagesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TranslationApiLanguagesResponseApplicationJson, _$TranslationApiLanguagesResponseApplicationJson];

  @override
  String get wireName => 'TranslationApiLanguagesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TranslationApiLanguagesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TranslationApiLanguagesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslationApiLanguagesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs),
            )! as TranslationApiLanguagesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslationApiTranslateResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TranslationApiTranslateResponseApplicationJson_Ocs_DataSerializer();
}

class _$TranslationApiTranslateResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TranslationApiTranslateResponseApplicationJson_Ocs_Data> {
  const _$TranslationApiTranslateResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        TranslationApiTranslateResponseApplicationJson_Ocs_Data,
        _$TranslationApiTranslateResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'TranslationApiTranslateResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TranslationApiTranslateResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  TranslationApiTranslateResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'from':
          result.from = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslationApiTranslateResponseApplicationJson_Ocs> get serializer =>
      const _$TranslationApiTranslateResponseApplicationJson_OcsSerializer();
}

class _$TranslationApiTranslateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TranslationApiTranslateResponseApplicationJson_Ocs> {
  const _$TranslationApiTranslateResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TranslationApiTranslateResponseApplicationJson_Ocs, _$TranslationApiTranslateResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TranslationApiTranslateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TranslationApiTranslateResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(TranslationApiTranslateResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  TranslationApiTranslateResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslationApiTranslateResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TranslationApiTranslateResponseApplicationJson_Ocs_Data),
            )! as TranslationApiTranslateResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<TranslationApiTranslateResponseApplicationJson> get serializer =>
      const _$TranslationApiTranslateResponseApplicationJsonSerializer();
}

class _$TranslationApiTranslateResponseApplicationJsonSerializer
    implements StructuredSerializer<TranslationApiTranslateResponseApplicationJson> {
  const _$TranslationApiTranslateResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TranslationApiTranslateResponseApplicationJson, _$TranslationApiTranslateResponseApplicationJson];

  @override
  String get wireName => 'TranslationApiTranslateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TranslationApiTranslateResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TranslationApiTranslateResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TranslationApiTranslateResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TranslationApiTranslateResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TranslationApiTranslateResponseApplicationJson_Ocs),
            )! as TranslationApiTranslateResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchProvider> get serializer => const _$UnifiedSearchProviderSerializer();
}

class _$UnifiedSearchProviderSerializer implements StructuredSerializer<UnifiedSearchProvider> {
  const _$UnifiedSearchProviderSerializer();

  @override
  Iterable<Type> get types => const [UnifiedSearchProvider, _$UnifiedSearchProvider];

  @override
  String get wireName => 'UnifiedSearchProvider';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedSearchProvider object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(int)),
    ];
    return result;
  }

  @override
  UnifiedSearchProvider deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchProviderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'order':
          result.order = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchGetProvidersResponseApplicationJson_Ocs> get serializer =>
      const _$UnifiedSearchGetProvidersResponseApplicationJson_OcsSerializer();
}

class _$UnifiedSearchGetProvidersResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UnifiedSearchGetProvidersResponseApplicationJson_Ocs> {
  const _$UnifiedSearchGetProvidersResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        UnifiedSearchGetProvidersResponseApplicationJson_Ocs,
        _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'UnifiedSearchGetProvidersResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedSearchGetProvidersResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(UnifiedSearchProvider)])),
    ];
    return result;
  }

  @override
  UnifiedSearchGetProvidersResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(BuiltList, [FullType(UnifiedSearchProvider)]),
            )! as BuiltList<UnifiedSearchProvider>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchGetProvidersResponseApplicationJson> get serializer =>
      const _$UnifiedSearchGetProvidersResponseApplicationJsonSerializer();
}

class _$UnifiedSearchGetProvidersResponseApplicationJsonSerializer
    implements StructuredSerializer<UnifiedSearchGetProvidersResponseApplicationJson> {
  const _$UnifiedSearchGetProvidersResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UnifiedSearchGetProvidersResponseApplicationJson, _$UnifiedSearchGetProvidersResponseApplicationJson];

  @override
  String get wireName => 'UnifiedSearchGetProvidersResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedSearchGetProvidersResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(UnifiedSearchGetProvidersResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  UnifiedSearchGetProvidersResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchGetProvidersResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(UnifiedSearchGetProvidersResponseApplicationJson_Ocs),
            )! as UnifiedSearchGetProvidersResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchResultEntry> get serializer => const _$UnifiedSearchResultEntrySerializer();
}

class _$UnifiedSearchResultEntrySerializer implements StructuredSerializer<UnifiedSearchResultEntry> {
  const _$UnifiedSearchResultEntrySerializer();

  @override
  Iterable<Type> get types => const [UnifiedSearchResultEntry, _$UnifiedSearchResultEntry];

  @override
  String get wireName => 'UnifiedSearchResultEntry';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedSearchResultEntry object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'thumbnailUrl',
      serializers.serialize(object.thumbnailUrl, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'subline',
      serializers.serialize(object.subline, specifiedType: const FullType(String)),
      'resourceUrl',
      serializers.serialize(object.resourceUrl, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'rounded',
      serializers.serialize(object.rounded, specifiedType: const FullType(bool)),
      'attributes',
      serializers.serialize(object.attributes, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  UnifiedSearchResultEntry deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchResultEntryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'thumbnailUrl':
          result.thumbnailUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'subline':
          result.subline = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'resourceUrl':
          result.resourceUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'rounded':
          result.rounded = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'attributes':
          result.attributes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchResult> get serializer => const _$UnifiedSearchResultSerializer();
}

class _$UnifiedSearchResultSerializer implements StructuredSerializer<UnifiedSearchResult> {
  const _$UnifiedSearchResultSerializer();

  @override
  Iterable<Type> get types => const [UnifiedSearchResult, _$UnifiedSearchResult];

  @override
  String get wireName => 'UnifiedSearchResult';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedSearchResult object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'isPaginated',
      serializers.serialize(object.isPaginated, specifiedType: const FullType(bool)),
      'entries',
      serializers.serialize(
        object.entries,
        specifiedType: const FullType(BuiltList, [FullType(UnifiedSearchResultEntry)]),
      ),
    ];
    Object? value;
    value = object.cursor;
    if (value != null) {
      result
        ..add('cursor')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(UnifiedSearchResult_Cursor)),
        );
    }

    return result;
  }

  @override
  UnifiedSearchResult deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'isPaginated':
          result.isPaginated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'entries':
          result.entries.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltList, [FullType(UnifiedSearchResultEntry)]),
            )! as BuiltList<UnifiedSearchResultEntry>,
          );
        case 'cursor':
          result.cursor.replace(
            serializers.deserialize(value, specifiedType: const FullType(UnifiedSearchResult_Cursor))!
                as UnifiedSearchResult_Cursor,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchSearchResponseApplicationJson_Ocs> get serializer =>
      const _$UnifiedSearchSearchResponseApplicationJson_OcsSerializer();
}

class _$UnifiedSearchSearchResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<UnifiedSearchSearchResponseApplicationJson_Ocs> {
  const _$UnifiedSearchSearchResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [UnifiedSearchSearchResponseApplicationJson_Ocs, _$UnifiedSearchSearchResponseApplicationJson_Ocs];

  @override
  String get wireName => 'UnifiedSearchSearchResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedSearchSearchResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(UnifiedSearchResult)),
    ];
    return result;
  }

  @override
  UnifiedSearchSearchResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchSearchResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(UnifiedSearchResult))! as UnifiedSearchResult,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<UnifiedSearchSearchResponseApplicationJson> get serializer =>
      const _$UnifiedSearchSearchResponseApplicationJsonSerializer();
}

class _$UnifiedSearchSearchResponseApplicationJsonSerializer
    implements StructuredSerializer<UnifiedSearchSearchResponseApplicationJson> {
  const _$UnifiedSearchSearchResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [UnifiedSearchSearchResponseApplicationJson, _$UnifiedSearchSearchResponseApplicationJson];

  @override
  String get wireName => 'UnifiedSearchSearchResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final UnifiedSearchSearchResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(UnifiedSearchSearchResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  UnifiedSearchSearchResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = UnifiedSearchSearchResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(UnifiedSearchSearchResponseApplicationJson_Ocs),
            )! as UnifiedSearchSearchResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew> get serializer =>
      const _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewSerializer();
}

class _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewSerializer
    implements StructuredSerializer<WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew> {
  const _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewSerializer();

  @override
  Iterable<Type> get types => const [
        WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew,
        _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew,
      ];

  @override
  String get wireName => 'WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'regular',
      serializers.serialize(object.regular, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'admin',
      serializers.serialize(object.admin, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'regular':
          result.regular.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'admin':
          result.admin.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WhatsNewGetResponseApplicationJson_Ocs_Data> get serializer =>
      const _$WhatsNewGetResponseApplicationJson_Ocs_DataSerializer();
}

class _$WhatsNewGetResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<WhatsNewGetResponseApplicationJson_Ocs_Data> {
  const _$WhatsNewGetResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [WhatsNewGetResponseApplicationJson_Ocs_Data, _$WhatsNewGetResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'WhatsNewGetResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WhatsNewGetResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'changelogURL',
      serializers.serialize(object.changelogURL, specifiedType: const FullType(String)),
      'product',
      serializers.serialize(object.product, specifiedType: const FullType(String)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.whatsNew;
    if (value != null) {
      result
        ..add('whatsNew')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew),
          ),
        );
    }

    return result;
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WhatsNewGetResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'changelogURL':
          result.changelogURL = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'product':
          result.product = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'whatsNew':
          result.whatsNew.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew),
            )! as WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WhatsNewGetResponseApplicationJson_Ocs> get serializer =>
      const _$WhatsNewGetResponseApplicationJson_OcsSerializer();
}

class _$WhatsNewGetResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WhatsNewGetResponseApplicationJson_Ocs> {
  const _$WhatsNewGetResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [WhatsNewGetResponseApplicationJson_Ocs, _$WhatsNewGetResponseApplicationJson_Ocs];

  @override
  String get wireName => 'WhatsNewGetResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WhatsNewGetResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  WhatsNewGetResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WhatsNewGetResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data))!
                as WhatsNewGetResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WhatsNewGetResponseApplicationJson> get serializer =>
      const _$WhatsNewGetResponseApplicationJsonSerializer();
}

class _$WhatsNewGetResponseApplicationJsonSerializer
    implements StructuredSerializer<WhatsNewGetResponseApplicationJson> {
  const _$WhatsNewGetResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [WhatsNewGetResponseApplicationJson, _$WhatsNewGetResponseApplicationJson];

  @override
  String get wireName => 'WhatsNewGetResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WhatsNewGetResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WhatsNewGetResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  WhatsNewGetResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WhatsNewGetResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(WhatsNewGetResponseApplicationJson_Ocs))!
                as WhatsNewGetResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WhatsNewDismissResponseApplicationJson_Ocs> get serializer =>
      const _$WhatsNewDismissResponseApplicationJson_OcsSerializer();
}

class _$WhatsNewDismissResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<WhatsNewDismissResponseApplicationJson_Ocs> {
  const _$WhatsNewDismissResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [WhatsNewDismissResponseApplicationJson_Ocs, _$WhatsNewDismissResponseApplicationJson_Ocs];

  @override
  String get wireName => 'WhatsNewDismissResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WhatsNewDismissResponseApplicationJson_Ocs object, {
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
  WhatsNewDismissResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WhatsNewDismissResponseApplicationJson_OcsBuilder();

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

  @BuiltValueSerializer(custom: true)
  static Serializer<WhatsNewDismissResponseApplicationJson> get serializer =>
      const _$WhatsNewDismissResponseApplicationJsonSerializer();
}

class _$WhatsNewDismissResponseApplicationJsonSerializer
    implements StructuredSerializer<WhatsNewDismissResponseApplicationJson> {
  const _$WhatsNewDismissResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [WhatsNewDismissResponseApplicationJson, _$WhatsNewDismissResponseApplicationJson];

  @override
  String get wireName => 'WhatsNewDismissResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WhatsNewDismissResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(WhatsNewDismissResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  WhatsNewDismissResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WhatsNewDismissResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(WhatsNewDismissResponseApplicationJson_Ocs))!
                as WhatsNewDismissResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
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

  @BuiltValueSerializer(custom: true)
  static Serializer<WipeCheckWipeResponseApplicationJson> get serializer =>
      const _$WipeCheckWipeResponseApplicationJsonSerializer();
}

class _$WipeCheckWipeResponseApplicationJsonSerializer
    implements StructuredSerializer<WipeCheckWipeResponseApplicationJson> {
  const _$WipeCheckWipeResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [WipeCheckWipeResponseApplicationJson, _$WipeCheckWipeResponseApplicationJson];

  @override
  String get wireName => 'WipeCheckWipeResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final WipeCheckWipeResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'wipe',
      serializers.serialize(object.wipe, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  WipeCheckWipeResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = WipeCheckWipeResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'wipe':
          result.wipe = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
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
      ..addBuilderFactory(const FullType(SharebymailCapabilities0), SharebymailCapabilities0.new)
      ..add(SharebymailCapabilities0.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing),
        SharebymailCapabilities0_FilesSharing.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail),
        SharebymailCapabilities0_FilesSharing_Sharebymail.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
        SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_Password),
        SharebymailCapabilities0_FilesSharing_Sharebymail_Password.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate),
        SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate.serializer)
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
        const FullType(TextToImageApiIsAvailableResponseApplicationJson),
        TextToImageApiIsAvailableResponseApplicationJson.new,
      )
      ..add(TextToImageApiIsAvailableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs),
        TextToImageApiIsAvailableResponseApplicationJson_Ocs.new,
      )
      ..add(TextToImageApiIsAvailableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data),
        TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiScheduleResponseApplicationJson),
        TextToImageApiScheduleResponseApplicationJson.new,
      )
      ..add(TextToImageApiScheduleResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs),
        TextToImageApiScheduleResponseApplicationJson_Ocs.new,
      )
      ..add(TextToImageApiScheduleResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs_Data),
        TextToImageApiScheduleResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextToImageApiScheduleResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(TextToImageTask), TextToImageTask.new)
      ..add(TextToImageTask.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiGetTaskResponseApplicationJson),
        TextToImageApiGetTaskResponseApplicationJson.new,
      )
      ..add(TextToImageApiGetTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs),
        TextToImageApiGetTaskResponseApplicationJson_Ocs.new,
      )
      ..add(TextToImageApiGetTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs_Data),
        TextToImageApiGetTaskResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextToImageApiGetTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiDeleteTaskResponseApplicationJson),
        TextToImageApiDeleteTaskResponseApplicationJson.new,
      )
      ..add(TextToImageApiDeleteTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs),
        TextToImageApiDeleteTaskResponseApplicationJson_Ocs.new,
      )
      ..add(TextToImageApiDeleteTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data),
        TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiListTasksByAppResponseApplicationJson),
        TextToImageApiListTasksByAppResponseApplicationJson.new,
      )
      ..add(TextToImageApiListTasksByAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs),
        TextToImageApiListTasksByAppResponseApplicationJson_Ocs.new,
      )
      ..add(TextToImageApiListTasksByAppResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data),
        TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(TextToImageTask)]), ListBuilder<TextToImageTask>.new)
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
